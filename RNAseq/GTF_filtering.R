# #Tutta questa prima parte serve a creare dei bed partendo dal GTF

# Gtf.V44 <- read.delim("/media/alessio/Data/genome110/gencode/gencode.v44.annotation_noheader.gtf", header = F)
# 

# #Con i geni
# Gtf.V44.genes <- Gtf.V44 %>%
#   dplyr::filter(V3 == "gene") %>%
#   dplyr::select(!c("V2", "V3", "V8")) %>%
#   dplyr::relocate(V9, .before = V6) %>%
#   write_delim(file = "/media/alessio/Data/genome110/gencode/Gencode_V44_genes.bed", col_names = F, delim = "\t")
# 
# 
# # creo anche il Gtf_V44 con solo i geni ma solo i TSS
# 
# ChIPseeker::readPeakFile("/media/alessio/Data/genome110/gencode/Gencode_V44_genes.bed", as = "data.frame") %>%
#   makeGRangesFromDataFrame(keep.extra.columns = T, seqnames.field = "V1", start.field = "V2", end.field = "V3", strand.field = "V6") %>%
#   promoters(upstream = 3000, downstream = 3000) %>%
#   as.data.frame() %>%
#   dplyr::mutate(start = ifelse(start < 0, 0, start)) %>%
#   dplyr::select(-"width") %>%
#   dplyr::relocate(strand, .after = V5) %>%
#   write_delim(file = "/media/alessio/Data/genome110/gencode/Gencode_V44_TSS.bed", col_names = F, delim = "\t")


suppressMessages ({

library(tidyverse)
library(argparse)

parser <- ArgumentParser()

parser$add_argument("--genomic_anno", help = "Genomic annotation in BED format (gencode)")
parser$add_argument("--genelist", help = "Vector of genes used to filter the Genomic Annotation")
parser$add_argument("--param", help = "geneid, geneidversion or genename")
parser$add_argument("--output", help = "name of the output file")

args <- parser$parse_args()

#legge Annotazioni e aggiunge campi gene id, gene id version e gene name
Annotation <- read_delim(args$genomic_anno, col_names = F, delim = '\t') %>%
    dplyr::mutate("gene_id" = str_remove((str_extract(X4, "gene_id.*?;")), "gene_id ")) %>% 
    dplyr::mutate("gene_id" = str_remove(gene_id, ";")) %>% 
    dplyr::mutate("gene_id" = str_remove(gene_id, "\\..*")) %>%
    dplyr::mutate("gene_id_version" = str_remove((str_extract(X4, "gene_id.*?;")), "gene_id ")) %>% 
    dplyr::mutate("gene_id_version" = str_remove(gene_id_version, ";")) %>% 
    dplyr::mutate("gene_name" = str_remove((str_extract(X4, "gene_name.*?;")), "gene_name ")) %>% 
    dplyr::mutate("gene_name" = str_remove(gene_name, ";")) %>%
    dplyr::mutate("gene_name" = ifelse(str_detect(gene_name, "ENSG00"), "", gene_name))

colnames(Annotation) <- c("CHROM", "START", "END", "ID", "SCORE", "STRAND", "GENE_ID", "GENE_ID_VERSION", "GENE_NAME")

#legge genelist
genelist <- unique(read_lines(args$genelist))
genelist <- genelist[!is.na(genelist)]
genelist <- genelist[genelist != ""]


#definizione parametro
if (args$param == "geneid") {
  param = "GENE_ID"
} else if (args$param == "geneidversion") {
  param = "GENE_ID_VERSION"
} else if (args$param == "genename") {
  param = "GENE_NAME"
}

#filtri sul parametro
Filtered_anno <- Annotation %>%
  dplyr::filter(.data[[param]] %in% genelist) %>%
  dplyr::relocate(.data[[param]], .after = "END") %>%
  dplyr::select(CHROM, START, END, .data[[param]], SCORE, STRAND)

write_delim(Filtered_anno, file = args$output, delim = '\t', col_names = F)

})


