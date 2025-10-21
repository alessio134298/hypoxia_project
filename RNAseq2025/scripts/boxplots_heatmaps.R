# Count tables / boxplots  
{library(tidyverse)
library(patchwork)
library(clusterProfiler)
library(ComplexHeatmap)
library(colorRamp2)
library(ggpubr)
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

make_boxplot <- function(df, gene, name_value) {
  p <- df %>% 
    mutate(type_time = fct_relevel(type_time, c('CAS9_0', 'CAS9_6', 'CAS9_24', 'CAS9_48',
                                                'H4KO_0', 'H4KO_6', 'H4KO_24', 'H4KO_48')
                                   )
           ) %>% 
    dplyr::filter(symbol == gene) %>% 
    ggplot(aes(x = type_time, fill = type, y = {{name_value}} )) +
    geom_boxplot() +
    geom_point(aes(shape = clone_group)) +
    stat_compare_means(method = 'anova') +
    labs(title = gene) +
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))
  return(p)
}
###################################################


###################################################
exp_file <- 'sheets/samplesheet_salmon.csv'
tpm_file <- 'tables/TPM.csv'
vsd_file <- 'tables/VSD.csv'
id_converter <- read_delim('/media/alessio/Data/genome110/ID_SYMBOL_converter.tsv')
interactions_hypoxia_genes_folder <-  'interaction_hypoxia_repclones/'

# Genes due to interaction
{
  genes_interaction_files <- list.files(interactions_hypoxia_genes_folder, full.names = T)
  genes_interaction <- vector()
  # load genes identified with deseq interaction analysis, all together Up and down
  for (i in genes_interaction_files) {
    g <- read_lines(i)
    genes_interaction <- c(genes_interaction, g)
  }
  genes_interaction <-unique(genes_interaction)
}

genesets <- list( 
  H_hpx_gmt = read.gmt('/home/alessio/Downloads/HALLMARK_HYPOXIA.v2025.1.Hs.gmt')$gene,
  Buffa_hpx_gmt = read.gmt('/home/alessio/Downloads/BUFFA_HYPOXIA_METAGENE.v2025.1.Hs.gmt')$gene,
  custom_hypoxia_genes = c("ALDOA", "ANGPTL4", "ANLN", "BNC1", "MRGBP", "CA9","CDKN3",
                           "COL4A6", "DCBLD1", "ENO1", "FAM83B", "FOSL1", "GNAI1", "HILPDA",
                           "KCTD11", "KRT17", "LDHA", "MRPS17", "P4HA1", "PGAM1", "PGK1",
                           "SDC1", "SLC16A1", "SLC2A1", "TPI1", "VEGFA"),
  genes_interaction = genes_interaction
)

order <- c(
  "CAS9_cl.125_ctrl_0",   "CAS9_cl.26_ctrl_0", "HDAC4_KO_cl.125_0",   "HDAC4_KO_cl.26_0",
  "CAS9_cl.125_ctrl_6",   "CAS9_cl.26_ctrl_6", "HDAC4_KO_cl.125_6",   "HDAC4_KO_cl.26_6",
  "CAS9_cl.125_ctrl_24",   "CAS9_cl.26_ctrl_24", "HDAC4_KO_cl.125_24",   "HDAC4_KO_cl.26_24",
  "CAS9_cl.125_ctrl_48",   "CAS9_cl.26_ctrl_48", "HDAC4_KO_cl.125_48",   "HDAC4_KO_cl.26_48"
)

path_boxplot <- 'plot/boxplots_genes'
path_hmap <- 'plot/heatmaps'


################################
exp <- read_delim(exp_file) %>% 
  mutate(type = ifelse(str_detect(clone, 'CAS9'), 'CAS9', 'H4KO')) %>% 
  dplyr::select(-files)


TPM_long <- make_longer(tpm_file, id_converter, exp, 'TPM')
VSD_long <- make_longer(vsd_file, id_converter, exp, 'VSD') 


# Boxplot of some genes
genes <- c('HIF1A', 'EPAS1', 'VEGFA', 'NEGR1')
genes <- c('CKB')
genes <- c("MGARP",  "TIGAR" , "VEGFA",  "ATF4",   "HILPDA", "ATP7A" , "FOS"  ,  "KCNK3"  ,"BNIP3"  ,"ERO1A" , "SLC7A5" ,"CXCR4" ,"LIF")
for (gene in genes) {
  tpm_plot <- make_boxplot(TPM_long, gene, TPM) + theme(legend.position = 'none')
  vsd_plot <- make_boxplot(VSD_long, gene, VSD) 
  plott <- tpm_plot + vsd_plot
  
  print(plott) 
  ggsave(plott, filename = file.path(path_boxplot,paste0(gene,'.png')), height = 6, width = 10)
}

### Heatmap of hypoxia signature genes
# to simplify the visualization we take the mean between the tecnical repliates
mat <- VSD_long %>%
  group_by(clone_group, time, symbol) %>% 
  summarise(VSD_mean = mean(VSD), .groups = 'drop') %>% 
  mutate(clone_group_time = str_c(clone_group, time, sep = '_')) %>% 
  dplyr::select(clone_group_time, symbol, VSD_mean) %>% 
  pivot_wider(names_from = clone_group_time, values_from = VSD_mean) %>% 
  column_to_rownames('symbol') %>% 
  as.matrix()

# gene wise Zscore
zscore_mat <- t(scale(t(mat)))
zscore_mat <- na.omit(zscore_mat)
zscore_mat <- zscore_mat[, order]

write_csv(zscore_mat %>% 
            as.data.frame() %>% 
            rownames_to_column('symbol'),
          file = 'tables/Gene_wise_Zscore_matrix_mean_tcnrep.csv')

for (name in names(genesets)) {
  # read genelist
  genelist <- genesets[[name]]
  genelist <- genelist[genelist %in% rownames(zscore_mat)]
  
  print(name)
  print(genelist)
  
  # subset matrix
  zscore_mat_select <- zscore_mat[genelist, ]
  
  # Plot Heatmap of zscore
  col_fun <- colorRamp2(
    breaks = c(-max(abs(zscore_mat_select)), 0, max(abs(zscore_mat_select))),
    colors = c("blue", "white", "red") 
  )
  
  # png(filename = paste0(path_hmap,'/',basename(name),'zscore.png'), res = 300, height = 15, width = 15, units = 'cm')
  draw(
  Heatmap(zscore_mat_select,
          name = "Gene-wise\nZscore",
          col = col_fun,
          row_names_gp = gpar(fontsize = 10/ (nrow(zscore_mat_select) / 20)),
          column_names_gp = gpar(fontsize = 10),
          cluster_rows = T,
          cluster_columns = T,
          column_title = "", 
          column_split = factor(c(rep("0h", 4), rep("6h", 4), rep("24h", 4), rep("48h", 4)), 
                                 levels = c('0h', '6h', '24h', '48h')),
          row_title = name
  )
  )
  #dev.off()
  
}

