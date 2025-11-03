{
  library(tidyverse)
  library(GenomicFeatures)
  library(rtracklayer)
}

gtf_file <- '/media/alessio/Data/genome110/gencode/gencode.v45.annotation.gtf'
interactions_hypoxia_genes_folder <-  'interaction_hypoxia_repclones/'
savef <- '/media/alessio/Data/hypoxia/RNAseq2025/work_files/'

upstream = 2000
downstream = 200

# Genes due to interaction
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


# import gtf
gtf <- import(gtf_file)

# select only genes (no transcripts or whatever)
genes <- gtf[gtf$type == 'gene' & !is.na(gtf$gene_name), ]

# all promoters
promoters_all_gtf_v45 <- promoters(genes, upstream = upstream, downstream = downstream)

# only promoters of gene of interest
promoters_only_goi_up <- promoters_all_gtf_v45[promoters_all_gtf_v45$gene_name %in% genes_interaction_up, ]
promoters_only_goi_down <- promoters_all_gtf_v45[promoters_all_gtf_v45$gene_name %in% genes_interaction_down, ]

files = list('promoters_all_gtf_v45' = promoters_all_gtf_v45,
             'promoters_only_interaction_genes_up' = promoters_only_goi_up,
             'promoters_only_interaction_genes_down' = promoters_only_goi_down)


# save as bed file
for (name in names(files)) {
  files[[name]] %>% 
    as.data.frame() %>%
    dplyr::select(seqnames, start, end, gene_name, score, strand) %>% 
    write_tsv(file = paste0(savef,'/',name,'.bed'), col_names = F)
}

