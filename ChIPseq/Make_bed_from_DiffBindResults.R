library(tidyverse)


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

H3K27ac.DiffBind.peaks.H4KOvsCAS9 <- read_excel_allsheets("/media/alessio/Data/hypoxia/ChIPseq/tables/H3K27ac_tables/H3K27ac_Diff_bind_peak_annotation_significative_Differential.xlsx")

H3K27ac.DiffBind.peaks.Vs.Normoxia <- read_excel_allsheets("/media/alessio/Data/hypoxia/ChIPseq/tables/H3K27ac_tables/Vs_normoxia/H3K27ac_Vs_normoxia_annotation_significative_Differential.xlsx")

H2BK120ac.DiffBind.peaks.H4KOvsCAS9 <- read_excel_allsheets("/media/alessio/Data/hypoxia/ChIPseq/tables/H2BK120ac_tables/H2BK120ac_Diff_bind_peak_annotation_significative_Differential.xlsx")

H2BK120ac.DiffBind.peaks.Vs.Normoxia <- read_excel_allsheets("/media/alessio/Data/hypoxia/ChIPseq/tables/H2BK120ac_tables/Vs_normoxia/H2BK120ac_vs_normoxia_significative.xlsx")


Extract.Up.enriched.and.filter.write.bed <- function(df, segno, Condition, Marker, other) {
  comp_func <- match.fun(segno)
  
  Edf <- df |> 
    dplyr::filter(comp_func(Fold, 0)) |> 
    dplyr::select(seqnames, start, end, geneId, p.value, strand, annotation) |> 
    dplyr::arrange(seqnames, start)
    
  write_delim(Edf, file = paste0("/media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/entires/",Marker,"_",Condition,"_",other,"_DiffBind_enriched_peaks.bed"), delim = "\t", quote = "none", col_names = F)
}


for (i in names(H3K27ac.DiffBind.peaks.H4KOvsCAS9)) {
  name = str_split_i(string = i, pattern = "_", 1)
  print(name)
  
  Extract.Up.enriched.and.filter.write.bed(H3K27ac.DiffBind.peaks.H4KOvsCAS9[[i]], ">", "Up_H4KO_vs_Cas9", "H3K27ac", name)
}

for (i in names(H2BK120ac.DiffBind.peaks.H4KOvsCAS9)) {
  name = str_split_i(string = i, pattern = "_", 1)
  print(name)
  
  Extract.Up.enriched.and.filter.write.bed(H2BK120ac.DiffBind.peaks.H4KOvsCAS9[[i]], ">", "Up_H4KO_vs_Cas9", "H2BK120ac", name)
}


for (i in names(H3K27ac.DiffBind.peaks.Vs.Normoxia)) {
  name = i
  print(name)
  
  Extract.Up.enriched.and.filter.write.bed(H3K27ac.DiffBind.peaks.Vs.Normoxia[[i]], ">", "Up_Vs_normoxia", "H3K27ac", name)
}

for (i in names(H2BK120ac.DiffBind.peaks.Vs.Normoxia)) {
  name = i
  print(name)
  
  Extract.Up.enriched.and.filter.write.bed(H2BK120ac.DiffBind.peaks.Vs.Normoxia[[i]], ">", "Up_Vs_normoxia", "H2BK120ac", name)
}

for (i in names(H3K27ac.DiffBind.peaks.H4KOvsCAS9)) {
  name = str_split_i(string = i, pattern = "_", 1)
  print(name)
  
  Extract.Up.enriched.and.filter.write.bed(H3K27ac.DiffBind.peaks.H4KOvsCAS9[[i]], "<", "Down_H4KO_vs_Cas9", "H3K27ac", name)
}

for (i in names(H2BK120ac.DiffBind.peaks.H4KOvsCAS9)) {
  name = str_split_i(string = i, pattern = "_", 1)
  print(name)
  
  Extract.Up.enriched.and.filter.write.bed(H2BK120ac.DiffBind.peaks.H4KOvsCAS9[[i]], "<", "Down_H4KO_vs_Cas9", "H2BK120ac", name)
}

for (i in names(H3K27ac.DiffBind.peaks.Vs.Normoxia)) {
  name = i
  print(name)
  
  Extract.Up.enriched.and.filter.write.bed(H3K27ac.DiffBind.peaks.Vs.Normoxia[[i]], "<", "Down_Vs_normoxia", "H3K27ac", name)
}

for (i in names(H2BK120ac.DiffBind.peaks.Vs.Normoxia)) {
  name = i
  print(name)
  
  Extract.Up.enriched.and.filter.write.bed(H2BK120ac.DiffBind.peaks.Vs.Normoxia[[i]], "<", "Down_Vs_normoxia", "H2BK120ac", name)
}


#per i superenhancer
SEs.H3K27ac.DiffBind.peaks.H4KOvsCAS9 <- read_excel_allsheets("/media/alessio/Data/hypoxia/ChIPseq/tables/H3K27ac_tables/Superenhancers_DiffBind_results_ROSE/SEs.H3K27ac.H4KOvsCAS9.ROSE_summits35000.xlsx")

SEs.H3K27ac.DiffBind.peaks.Vs.Normoxia <- read_excel_allsheets("/media/alessio/Data/hypoxia/ChIPseq/tables/H3K27ac_tables/Superenhancers_DiffBind_results_ROSE/SEs.H3K27ac.Vsnormoxia.ROSE_summits35000.xlsx")

SEs.H2BK120ac.DiffBind.peaks.H4KOvsCAS9 <- read_excel_allsheets("/media/alessio/Data/hypoxia/ChIPseq/tables/H2BK120ac_tables/Superenhancers_DiffBind_results_ROSE/SEs.H2BK120ac.H4KOvsCAS9.ROSE_summits42500.xlsx")

SEs.H2BK120ac.DiffBind.peaks.Vs.Normoxia <- read_excel_allsheets("/media/alessio/Data/hypoxia/ChIPseq/tables/H2BK120ac_tables/Superenhancers_DiffBind_results_ROSE/SEs.H2BK120ac.Vsnormoxia.ROSE_summits42500.xlsx")


Extract.Up.enriched.and.filter.write.bed <- function(df, segno, Condition, Marker, other) {
  comp_func <- match.fun(segno)
  
  Edf <- df |> 
    dplyr::filter(comp_func(Fold, 0)) |>
    dplyr::filter(p.value < 0.05) |> 
    dplyr::select(seqnames, start, end, strand, Fold, p.value, FDR, annotation, SYMBOL) |> 
    dplyr::arrange(seqnames, start)
  
  write_delim(Edf, file = paste0("/media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/Superenhancers/SEs_",Marker,"_",Condition,"_",other,"_DiffBind_enriched_peaks.bed"), delim = "\t", quote = "none", col_names = F)
}


for (i in names(SEs.H3K27ac.DiffBind.peaks.H4KOvsCAS9)) {
  name = str_split_i(string = i, pattern = "_", 1)
  print(name)
  
  Extract.Up.enriched.and.filter.write.bed(SEs.H3K27ac.DiffBind.peaks.H4KOvsCAS9[[i]], ">", "H4KO_vs_Cas9", "H3K27ac", name)
}

for (i in names(SEs.H2BK120ac.DiffBind.peaks.H4KOvsCAS9)) {
  name = str_split_i(string = i, pattern = "_", 1)
  print(name)
  
  Extract.Up.enriched.and.filter.write.bed(SEs.H2BK120ac.DiffBind.peaks.H4KOvsCAS9[[i]], ">", "H4KO_vs_Cas9", "H2BK120ac", name)
}

for (i in names(SEs.H3K27ac.DiffBind.peaks.Vs.Normoxia)) {
  name = i
  print(name)
  
  Extract.Up.enriched.and.filter.write.bed(SEs.H3K27ac.DiffBind.peaks.Vs.Normoxia[[i]], ">", "Vs_normoxia", "H3K27ac", name)
}

for (i in names(SEs.H2BK120ac.DiffBind.peaks.Vs.Normoxia)) {
  name = i
  print(name)
  
  Extract.Up.enriched.and.filter.write.bed(SEs.H2BK120ac.DiffBind.peaks.Vs.Normoxia[[i]], ">", "Vs_normoxia", "H2BK120ac", name)
}

for (i in names(SEs.H3K27ac.DiffBind.peaks.H4KOvsCAS9)) {
  name = str_split_i(string = i, pattern = "_", 1)
  print(name)
  
  Extract.Up.enriched.and.filter.write.bed(SEs.H3K27ac.DiffBind.peaks.H4KOvsCAS9[[i]], "<", "Cas9_vs_H4KO", "H3K27ac", name)
}

for (i in names(SEs.H2BK120ac.DiffBind.peaks.H4KOvsCAS9)) {
  name = str_split_i(string = i, pattern = "_", 1)
  print(name)
  
  Extract.Up.enriched.and.filter.write.bed(SEs.H2BK120ac.DiffBind.peaks.H4KOvsCAS9[[i]], "<", "Cas9_vs_H4KO", "H2BK120ac", name)
}
