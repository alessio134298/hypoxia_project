{
  library(tidyverse)
  library(ComplexHeatmap)
  library(colorRamp2)
  library(ggpubr)
  library(patchwork)
  library(GenomicRanges)
  library(ChIPseeker)
  library(gridExtra)
}

# functions
make_longer <- function(df_file, converter, sheet, name_value) {
  
  df_long <- read_delim(df_file) %>% 
    left_join(converter, by = 'gene_id_version') %>% 
    dplyr::select(symbol, starts_with('R')) %>% 
    dplyr::filter(!is.na(symbol) & symbol != '' & !duplicated(symbol)) %>% 
    relocate(symbol) %>% 
    pivot_longer(starts_with('R'), names_to = 'sample', values_to = name_value) %>% 
    left_join(sheet, join_by('sample' == 'names')) %>% 
    mutate(type_time = str_c(type, time, sep = '_'))
  
  return(df_long)
}


make_consensus_peakset <- function(list.files) {
  data2 <- GRanges()
  for (i in list.files) {
    print(i)
    name <- str_remove(basename(i), '.bed')
    
    data <- readPeakFile(i)
    data2 <- c(data2, data)
  }
  data2 <- GenomicRanges::reduce(data2)
}

# files
interactions_hypoxia_genes_folder <-  '/media/alessio/Data/hypoxia/RNAseq2025/interaction_hypoxia_repclones/'
L2FC_matrix_file <- '/media/alessio/Data/hypoxia/RNAseq2025/tables/L2FC_vs_normoxia.csv'
TPM_file <- '/media/alessio/Data/hypoxia/RNAseq2025/tables/TPM.csv'
VSD_file <- '/media/alessio/Data/hypoxia/RNAseq2025/tables/VSD.csv'

converter <- read_delim('/media/alessio/Data/genome110/ID_SYMBOL_converter.tsv')
plotpath <- '/media/alessio/Data/hypoxia/RNAseq2025/plot'

HIF1a_files <- c(
  list.files('/media/alessio/Data/hypoxia/HIF1A_datasets/PRJNA823676/Consensus_bed', pattern = 'HIF1A', full.names = T),
  list.files('/media/alessio/Data/hypoxia/HIF1A_datasets/PRJNA494833/Consensus_bed', pattern = 'HIF1', full.names = T),
  '/media/alessio/Data/hypoxia/HIF1A_datasets/PRJNA809308/macs3_peaks/SRR18097068_macs3_peaks.narrowPeak'
)

# HDAC4_MEF2D_files <- c("/media/alessio/Data/NAR2020_Cb/GSM3882325_HDAC4_DMSO_SKUT_peaks.narrowPeak",
#                  "/media/alessio/Data/NAR2020_Cb/GSM3882327_MEF2D_DMSO_SKUT_peaks.narrowPeak"
# )

# genes interaction
{
  genes_interaction_files <- list.files(interactions_hypoxia_genes_folder, full.names = T)
  genes_interaction_up <- vector()
  genes_interaction_down <- vector()
  
  for (i in genes_interaction_files) {
    g <- read_lines(i)
    if (str_detect(i, 'up')) {
      genes_interaction_up <- c(genes_interaction_up, g)
    } else {
      genes_interaction_down <- c(genes_interaction_down, g)    
    }
    
  }
}

# L2FC matrix Vs normoxia
mat_L2FC <- read_delim(L2FC_matrix_file) %>% 
  column_to_rownames('symbol') %>% 
  as.matrix()

cols <- colnames(mat_L2FC)[str_detect(colnames(mat_L2FC), '24|48')]

mat_L2FC_degs <- mat_L2FC[c(genes_interaction_up, genes_interaction_down), cols]

# we aim to clusterize genes
# Heatmap
# we do the Heatmap performing Kmeans clustering
mat_scaled <- t(scale(t(mat_L2FC_degs)))  # scale each row (gene) across samples
set.seed(123)  # reproducibility
genes_kmeans_clusters <- kmeans(mat_scaled, centers = 4, nstart = 10)$cluster


col_fun <- colorRamp2(
  # breaks = c(min(mat_L2FC_select, na.rm = T), 0, max(abs(mat_L2FC_select), na.rm = T)),
  breaks = c(-3, 0, 3),
  colors = c("blue", "white", "red") 
)

H <- Heatmap(mat_L2FC_degs,
          name = "L2FC hypoxia vs\nnormoxia ctrl",
          col = col_fun,
          row_names_gp = gpar(fontsize = 20/ (nrow(mat_L2FC_degs) / 20)),
          column_names_gp = gpar(fontsize = 10),
          cluster_rows = T,
          cluster_columns = F,
          row_split = factor(genes_kmeans_clusters),
          column_title = "",
          column_split = factor(c(rep("Cas9_125", 2),
                                  rep("Cas9_26", 2),
                                  rep("H4KO_125", 2),
                                  rep("H4KO_26", 2)
          )),
          row_gap = unit(3, "mm"),
          border = T
  )

pdf(paste0(plotpath,'/4_kmclusters_degs_genes_24_48_hpx.pdf'))
draw(H)
dev.off()


# Plot expression levels TPM and VSD of the cluster of genes
exp <- read_delim('sheets/samplesheet_salmon.csv') %>% 
  mutate(type = ifelse(str_detect(clone, 'CAS9'), 'CAS9', 'H4KO')) %>% 
  dplyr::select(-files)

# make data long for plot
TPM <- make_longer(TPM_file, converter, exp, 'TPM')
VSD <- make_longer(VSD_file, converter, exp, 'VSD')

# add info if genes are very low, low, medium or high expressed
TPM_genes_class <- TPM %>% 
  group_by(symbol) %>% 
  summarize(avgTPM = mean(TPM)) %>% 
  mutate(class = case_when(
    avgTPM <= 1 ~ 'very_low (<= 1)',
    avgTPM > 1 & avgTPM <= 10 ~ 'low (1 - 10)',
    avgTPM > 10 & avgTPM <= 100 ~ 'medium (10 - 100)',
    avgTPM > 100 ~ 'high (> 100)',
  )) %>% 
  mutate(class = fct_relevel(class, c('very_low (<= 1)',
                                      'low (1 - 10)',
                                      'medium (10 - 100)',
                                      'high (> 100)')
                             )
         )


# plot to see the percentage of all genes in the expression groups
TPM_genes_class %>% 
  ggplot(aes(x = class, group = 1, y = after_stat(prop))) +
  geom_bar() +
  scale_y_continuous(labels = scales::percent, limits = c(0, 0.6)) +
  labs(title = 'TPM all genes') +

# plot to see the percentage of de regulated genes in the expression groups
TPM_genes_class %>% 
  dplyr::filter(symbol %in% c(genes_interaction_up, genes_interaction_down)) %>% 
  ggplot(aes(x = class, group = 1, y = after_stat(prop))) +
  geom_bar() +
  scale_y_continuous(labels = scales::percent, limits = c(0, 0.6)) +
  labs(title = 'TPM de-regulated genes')

# add kmeans clustering to the dataframe
genes_kmeans_clusters_df <- enframe(genes_kmeans_clusters, name = 'symbol', value = 'cluster')

TPM_clust <- TPM %>% 
  left_join(genes_kmeans_clusters_df, by = 'symbol',relationship = 'many-to-many') %>% 
  left_join(TPM_genes_class, by = 'symbol')

VSD_clust <- VSD %>% 
  left_join(genes_kmeans_clusters_df, by = 'symbol',relationship = 'many-to-many')  %>% 
  left_join(TPM_genes_class, by = 'symbol') %>%
  mutate(type_time = fct_relevel(type_time, c('CAS9_0', 'CAS9_6', 'CAS9_24', 'CAS9_48',
                                              'H4KO_0', 'H4KO_6', 'H4KO_24', 'H4KO_48')
  ))

# plot with expression of degs genes divided into expression group
Plot_expression_group <- VSD_clust %>% 
  dplyr::filter(symbol %in% c(genes_interaction_up, genes_interaction_down)) %>% 
  ggplot(aes(x = type_time, y = VSD, fill = type)) +
  geom_violin(position = position_dodge(width = 0.8)) +
  geom_boxplot( width = 0.3,
                position = position_dodge(width = 0.8),
                outlier.shape = NA,
                color = "black") +
  stat_summary(fun = mean,
               geom = "line", 
               aes(group = type),
               # linetype = "dashed",
               color = "#C77CFF", size = 1) + 
  facet_wrap(~ class, scales = 'free', ncol = 4) +
  stat_compare_means(method = 'anova', size = 3) +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
  labs(
       x = NULL)
  
Plot_expression_group
ggsave(Plot_expression_group,
       filename = paste0(plotpath,'/dereg_genes_expr_group_divided.png'),
       height = 6, width = 14)

for (l in c('','_expr_group')) {
  
  plotlist <- list()
  
  for (i in sort(unique(genes_kmeans_clusters_df$cluster))) {
    
    TPM_vector <- TPM_clust %>% 
      dplyr::filter(cluster == i) %>% 
      pull(TPM)
    
    meanTPM <- mean(TPM_vector)
    medianTPM <- median(TPM_vector)
    
    
    plot <- VSD_clust %>% 
      dplyr::filter(cluster == i) %>%
      ggplot(aes(x = type_time, y = VSD, fill = type)) +
      geom_violin(position = position_dodge(width = 0.8)) +
      geom_boxplot( width = 0.3,
                    position = position_dodge(width = 0.8),
                    outlier.shape = NA,
                    color = "black") +
      stat_summary(fun = mean,
                   geom = "line", 
                   aes(group = type),
                   # linetype = "dashed",
                   color = "#C77CFF", size = 1) + 
      {if(l == '_expr_group')facet_wrap(~ class, scales = 'free', ncol = 4)} +
      stat_compare_means(method = 'anova', size = 2.5) +
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
      labs(title = paste0('Cluster: ',i),
           subtitle = paste0('mean TPM: ',round(meanTPM, 2),
                             '\nmedian TPM:',round(medianTPM, 2)),
           x = NULL)
    
    plotlist[[i]] <- plot
  }
  
  PLOT <- (plotlist[[1]] | plotlist[[2]]) / (plotlist[[3]] | plotlist[[4]])
  print(PLOT)
  
  height_val <- if (l == '_expr_group') 12 else 10
  width_val  <- if (l == '_expr_group') 24 else 10
  
  ggsave(PLOT,
         filename = paste0(plotpath, '/4_kmclusters_VSD_TPM', l, '.png'),
         height = height_val,
         width = width_val)
}

# promoters of degs and HIF1A binding sites
# we want to test if some of these cluster of genes are regulated by HIF1A


# promoters file GTF 45
promoters <- read_delim('work_files/promoters_all_gtf_v45.bed', 
                        col_names = c('chr', 'start', 'end', 'symbol', 'score', 'strand'))

# HIF1A all putative binding sites
HIF1a_bindings <- make_consensus_peakset(HIF1a_files)

promoters_cluster_genes_with_HIF1A_binding <- tibble()
num_promoters_cluster_genes_with_HIF1A_binding <- tibble()

for (i in sort(unique(genes_kmeans_clusters_df$cluster))) {
  
  print(paste0('cluster: ', i))
  # pull genes of the cluster of degs
  genes <- genes_kmeans_clusters_df %>% 
    dplyr::filter(cluster == i) %>% 
    pull(symbol)
  
  # convert to granges and  overlaps
  prom <- promoters %>% 
    dplyr::filter(symbol %in% genes) %>% 
    makeGRangesFromDataFrame(keep.extra.columns = T)
  
  # extract genes with binding on promoter
  genes_with_binding <- subsetByOverlaps(prom, HIF1a_bindings) %>% 
    as.data.frame() %>% 
    pull(symbol)
  
  print(paste0('genes with binding: ',length(genes_with_binding)))
  print(paste0('genes total: ',length(genes)))
  
  # make a tibble with genes and one with the amount of genes
  df <- tibble(cluster = i,
               genes_with_binding_on_promoter = list(genes_with_binding),
               genes_total = list(genes))
  
  df_num <- tibble(cluster = i,
                   genes_with_binding_on_promoter = length(genes_with_binding),
                   genes_total = length(genes))
  
  promoters_cluster_genes_with_HIF1A_binding <- bind_rows(promoters_cluster_genes_with_HIF1A_binding,
                                                          df)
  num_promoters_cluster_genes_with_HIF1A_binding <- bind_rows(num_promoters_cluster_genes_with_HIF1A_binding,
                                                          df_num)
  
}

grid.table(num_promoters_cluster_genes_with_HIF1A_binding, rows = NULL)
  
x <- promoters_cluster_genes_with_HIF1A_binding %>% 
  dplyr::select(cluster, genes_with_binding_on_promoter) %>% 
  unnest(genes_with_binding_on_promoter)

for (i in promoters_cluster_genes_with_HIF1A_binding$cluster) {
  dt <- promoters_cluster_genes_with_HIF1A_binding[promoters_cluster_genes_with_HIF1A_binding$cluster == i, ]
  genes <- pull(dt, genes_with_binding_on_promoter)
  print(genes)
}
