{
  library(tidyverse)
  library(patchwork)
  library(clusterProfiler)
  library(ComplexHeatmap)
  library(colorRamp2)
  library(ggpubr)
  library(msigdbr)
}

interactions_hypoxia_genes_folder <-  'interaction_hypoxia_repclones/'
lrt_test_genes <- 'interaction_hypoxia_LRT_test/genes_LRT_test.txt'

# Load the genesets
##########################################
{
  # Load of all msigdb pathways :)
  sig_names <- c("GO:BP", "GO:CC", "GO:MF", "HPO", "REACTOME", "CP:KEGG_LEGACY", "CP:KEGG_MEDICUS", "WIKIPATHWAYS", "TFT_LEGACY")
  Msigdbr_signture_lists <- list()
  for (i in 1:length(sig_names)) {
    name = sig_names[[i]]
    msigdb_df <- msigdbr(species = "Homo sapiens", subcollection  = name) 
    Msigdbr_signture_lists[[name]] <- msigdb_df
    rm(msigdb_df)
  }
  Msigdbr_signture_lists[["HALLMARKS"]] <- msigdbr(species = "Homo sapiens", category = "H")
  # convert to dataframe and filter on hypoxia - oxygen terms
  Msigdbr_signture_df <- Msigdbr_signture_lists %>% 
    enframe() %>% 
    unnest()
  hypoxia_related_signatures <- Msigdbr_signture_df %>% 
    dplyr::filter(str_detect(gs_name, 'HYPOXIA|OXYGEN_LEVELS'))
  print(paste0('Selected gene sets: ', hypoxia_related_signatures$gs_name %>%  unique()))
  # take only the genes
  genes_hypoxia_related <- unique(hypoxia_related_signatures$gene_symbol)
}


# Genes due to interaction Wald and Lrt
{
  genes_interaction_files <- list.files(interactions_hypoxia_genes_folder, full.names = T)
  genes_interaction <- vector()
  # load genes identified with deseq interaction analysis, all together Up and down
  for (i in genes_interaction_files) {
    g <- read_lines(i)
    genes_interaction <- c(genes_interaction, g)
  }
  genes_interaction <-unique(genes_interaction)

  
  genes_lrt <- read_lines(lrt_test_genes)
}

# add gmts file downloaded to create a list
genesets <- list(
  H_hpx_gmt = read.gmt('/home/alessio/Downloads/HALLMARK_HYPOXIA.v2025.1.Hs.gmt')$gene,
  Buffa_hpx_gmt = read.gmt('/home/alessio/Downloads/BUFFA_HYPOXIA_METAGENE.v2025.1.Hs.gmt')$gene,
  genes_hypoxia_related = genes_hypoxia_related,
  genes_interaction = genes_interaction,
  genes_lrt = genes_lrt
)
#####################################################################
path_hmap <- 'plot/heatmaps'

L2FC <- 0.75
order <- c(
  "Cas9_125_6h",  "Cas9_125_24h", "Cas9_125_48h", 
  "Cas9_26_6h",  "Cas9_26_24h", "Cas9_26_48h", 
  "H4KO_125_6h",  "H4KO_125_24h", "H4KO_125_48h", 
  "H4KO_26_6h",  "H4KO_26_24h", "H4KO_26_48h"
)

# Analysis and Heatmap

# load Results of every sample vs his normoxia
files <- list.files('DEGs_tabs', full.names = T)
files <- files[str_detect(files, 'interaction|ctrl', negate = T)]

Vs_normoxia <- tibble(files = files)
Vs_normoxia <- Vs_normoxia %>% 
  dplyr::mutate(deseq_res = map(files, \(x) read_delim(x))) %>% 
  dplyr::mutate(files = str_remove(basename(files), '.tsv')) %>% 
  dplyr::mutate(deseq_res = map(
    deseq_res, \(x) x %>% 
      dplyr::mutate(DEG = case_when(
        (padj < 0.05 & log2FoldChange > L2FC) ~ 'UP',
        (padj < 0.05 & log2FoldChange < -L2FC) ~ 'DOWN',
        TRUE ~ 'ns'
      )
      )
  )
  ) %>% 
  dplyr::mutate(deseq_res = map(deseq_res, \(x) x %>% 
                                  dplyr::filter(!is.na(symbol) & !duplicated(symbol))
  )
  ) %>% 
  unnest(deseq_res) 


# create a matrix of L2FC and a matrix for padj
# L2FC
mat_L2FC <- Vs_normoxia %>% 
  dplyr::select(files, symbol, log2FoldChange) %>% 
  pivot_wider(names_from = files, values_from = log2FoldChange) %>% 
  column_to_rownames('symbol') %>% 
  as.matrix()

mat_L2FC <- mat_L2FC[, order]

write_csv(mat_L2FC %>% as.data.frame() %>% rownames_to_column('symbol'), file = 'tables/L2FC_vs_normoxia.csv')

for (name in names(genesets)) {
  # read genelist
  genelist <- genesets[[name]]
  genelist <- genelist[genelist %in% rownames(mat_L2FC)]
  
  print(name)
  print(genelist)
  
  # subset matrix
  mat_L2FC_select <- mat_L2FC[genelist, ]
  
  # Plot Heatmap of zscore
  col_fun <- colorRamp2(
    # breaks = c(min(mat_L2FC_select, na.rm = T), 0, max(abs(mat_L2FC_select), na.rm = T)),
    breaks = c(-4, 0, 4),
    colors = c("blue", "white", "red") 
  )
  
  # png(filename = paste0(path_hmap,'/',basename(name),'_vs_normoxia_L2FC.png'), res = 300, height = 15, width = 15, units = 'cm')
  pdf(paste0(path_hmap,'/',basename(name),'_vs_normoxia_L2FC.pdf'), height = 8, width = 8)
  draw(
    Heatmap(mat_L2FC_select,
            name = "L2FC hypoxia vs\nnormoxia ctrl",
            col = col_fun,
            row_names_gp = gpar(fontsize = 20/ (nrow(mat_L2FC_select) / 20)),
            column_names_gp = gpar(fontsize = 10),
            cluster_rows = T,
            cluster_columns = F,
            column_title = "",
            column_split = factor(c(rep("Cas9_125", 3),
                                    rep("Cas9_26", 3),
                                    rep("H4KO_125", 3),
                                    rep("H4KO_26", 3)
            )),
            row_title = name
    )
  )
  dev.off()
}



