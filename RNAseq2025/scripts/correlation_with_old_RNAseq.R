{
  library(tidyverse)
  library(ggpubr)
}

RNAseq_files_vs_normoxia_new <- list.files('/media/alessio/Data/hypoxia/RNAseq2025/DEGs_tabs/', full.names = T)
RNAseq_files_vs_normoxia_new <- RNAseq_files_vs_normoxia_new[str_detect(RNAseq_files_vs_normoxia_new, 'interaction|ctrl', negate = T)]

RNAseq_files_vs_normoxia_old <- "/media/alessio/Data/hypoxia/RNAseq/Tab_files/DESeq2_Results_Sep_clones_Vs_normoxia.xlsx"

read_excel_allsheets <- function(filename, tibble = FALSE) {
  # I prefer straight data.frames
  # but if you like tidyverse tibbles (the default with read_excel)
  # then just pass tibble = TRUE
  sheets <- readxl::excel_sheets(filename)
  x <- lapply(sheets, function(X) readxl::read_excel(filename, sheet = X))
  if(!tibble) x <- lapply(x, as.data.frame)
  names(x) <- sheets
  x
}

RNAseq_vs_normoxia_old <- read_excel_allsheets(RNAseq_files_vs_normoxia_old) %>% 
  enframe() %>% 
  mutate(data = map(value, \(x) x %>%  dplyr::select(log2FoldChange, symbol) %>% 
                      dplyr::filter(!duplicated(symbol)))) %>% 
  dplyr::select(name, data) %>% 
  mutate(name = paste0(name, '_old')) %>% 
  unnest(data) %>% 
  pivot_wider(names_from = name, values_from = log2FoldChange) %>% 
  dplyr::filter(!is.na(symbol) & !duplicated(symbol))

# Load data Vs normoxia
# RNAseq new
RNAseq_vs_normoxia_new <- tibble(
  files = RNAseq_files_vs_normoxia_new
) %>% 
  mutate(
    names = paste0(str_remove(basename(files), '.tsv'),'_new'),
    data = map(files, \(x) read_delim(x))
  ) %>% 
  dplyr::select(-files) %>% 
  mutate(data = map(data, \(x) x %>%  dplyr::select(log2FoldChange, symbol) %>% 
                      dplyr::filter(!duplicated(symbol)))) %>% 
  unnest(data) %>% 
  pivot_wider(names_from = names, values_from = log2FoldChange)


RNAseq_all <- inner_join(RNAseq_vs_normoxia_new, RNAseq_vs_normoxia_old, by = 'symbol') %>% 
  column_to_rownames('symbol') %>% 
  as.matrix()

order <- c(
  # Cas9 old
  "Cas9_cl125_6h_old",
  "Cas9_cl26_6h_old",
  "Cas9_cl125_24h_old",
  "Cas9_cl26_24h_old",
  "Cas9_cl125_48h_old",
  "Cas9_cl26_48h_old",
  
  # Cas9 new
  "Cas9_125_6h_new",
  "Cas9_26_6h_new",
  "Cas9_125_24h_new",
  "Cas9_26_24h_new",
  "Cas9_125_48h_new",
  "Cas9_26_48h_new",
  
  # H4KO old
  "H4KO_cl125_6h_old",
  "H4KO_cl26_6h_old",
  "H4KO_cl125_24h_old",
  "H4KO_cl26_24h_old",
  "H4KO_cl125_48h_old",
  "H4KO_cl26_48h_old",
  
  # H4KO new
  "H4KO_125_6h_new",
  "H4KO_26_6h_new",
  "H4KO_125_24h_new",
  "H4KO_26_24h_new",
  "H4KO_125_48h_new",
  "H4KO_26_48h_new"
)

RNAseq_all <- RNAseq_all[, order]


Corr_mat <- cor(RNAseq_all)



Corr_mat[Corr_mat == 1] <- NA

library(ComplexHeatmap)

Heatmap(Corr_mat, 
        cluster_rows = T,
        cluster_columns = T,
        col = c('white', 'blue'),
        rect_gp = gpar(col = "white", lwd = 1))
