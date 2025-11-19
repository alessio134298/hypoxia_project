{
  library(DESeq2)
  library(tidyverse)
  library(ggpubr)
  library(ChIPseeker)
  library(TxDb.Hsapiens.UCSC.hg38.knownGene)
  library(org.Hs.eg.db)
}

raw_counts_file_H3K27ac <- '/media/alessio/Data/hypoxia/ChIPseq_new/analysis/counts_on_H3K27ac_IDR_peaks.txt'
raw_counts_file_H2BK120ac <- '/media/alessio/Data/hypoxia/ChIPseq_new/analysis/counts_on_H2BK120ac_IDR_peaks.txt'
tpm_rna <- '/media/alessio/Data/hypoxia/RNAseq2025/tables/TPM.csv'
exp_chip <- '/media/alessio/Data/hypoxia/ChIPseq_new/sheets/experiment.csv'
DBR_dir <- '/media/alessio/Data/hypoxia/ChIPseq_new/DBR_results'


smallestGroupSize <- 2
min_count <- 50

# samplesheet
exp <- read_delim(exp_chip)
exp_H3K27ac <- exp %>% 
  dplyr::filter(Condition == 'H3K27AC' & PeakCaller == 'macs3')
exp_H2BK120ac <- exp %>% 
  dplyr::filter(Condition == 'H2BK120AC' & PeakCaller == 'macs3')

# chip seq counts
# H3K27ac
chip_data_H3K27ac <- read_delim(raw_counts_file_H3K27ac, comment = '#') %>% 
  dplyr::mutate(Locus = paste0(Chr,':',Start,'-',End)) %>% 
  dplyr::select(-c(Geneid, Chr, Start, End, Strand, Length)) %>% 
  column_to_rownames('Locus')

colnames(chip_data_H3K27ac) <- str_remove(basename(colnames(chip_data_H3K27ac)), '.filtered3.sorted.bam')

# H2BK120ac
chip_data_H2BK120ac <- read_delim(raw_counts_file_H2BK120ac, comment = '#') %>% 
  dplyr::mutate(Locus = paste0(Chr,':',Start,'-',End)) %>% 
  dplyr::select(-c(Geneid, Chr, Start, End, Strand, Length)) %>% 
  column_to_rownames('Locus')

colnames(chip_data_H2BK120ac) <- str_remove(basename(colnames(chip_data_H2BK120ac)), '.filtered3.sorted.bam')


# normalize with DESEq2
# H3K27ac
chip_data_H3K27ac_dds <- DESeqDataSetFromMatrix(
  chip_data_H3K27ac, 
  colData = exp_H3K27ac,
  design = ~ Tissue + Treatment + Tissue:Treatment
)

keep <- rowSums(counts(chip_data_H3K27ac_dds) >= min_count) >= smallestGroupSize
chip_data_H3K27ac_dds <- chip_data_H3K27ac_dds[keep,]


chip_data_H3K27ac_dds <- DESeq(chip_data_H3K27ac_dds)
chip_data_H3K27ac_vst <- vst(chip_data_H3K27ac_dds)
plotPCA(chip_data_H3K27ac_vst, intgroup = 'Factor')

chip_data_H3K27ac_norm <- DESeq2::counts(chip_data_H3K27ac_dds, normalized = T) %>%
  as.data.frame() %>% 
  rownames_to_column('locus')


# H2BK120ac
chip_data_H2BK120ac_dds <- DESeqDataSetFromMatrix(
  chip_data_H2BK120ac, 
  colData = exp_H2BK120ac,
  design = ~ Tissue + Treatment + Tissue:Treatment
)

keep <- rowSums(counts(chip_data_H2BK120ac_dds) >= min_count) >= smallestGroupSize
chip_data_H2BK120ac_dds <- chip_data_H2BK120ac_dds[keep,]

chip_data_H2BK120ac_dds <- DESeq(chip_data_H2BK120ac_dds)
chip_data_H2BK120ac_vst <- vst(chip_data_H2BK120ac_dds)

plotPCA(chip_data_H2BK120ac_vst, intgroup = 'Factor')

chip_data_H2BK120ac_norm <- DESeq2::counts(chip_data_H2BK120ac_dds, normalized = TRUE) %>%
  as.data.frame() %>% 
  rownames_to_column('locus')


# extract DEGs

# Vs normoxia
Vs_normoxia_H3K27ac <- list(
  Cas9_6h = (results(chip_data_H3K27ac_dds, name = 'Treatment_6h_vs_0h')),
  Cas9_24h = (results(chip_data_H3K27ac_dds, name = 'Treatment_24h_vs_0h')),
  H4KO_6h = (results(chip_data_H3K27ac_dds, contrast = list(c('Treatment_6h_vs_0h', 'TissueH4KO.Treatment6h')))),
  H4KO_24h = (results(chip_data_H3K27ac_dds, contrast = list(c('Treatment_24h_vs_0h', 'TissueH4KO.Treatment24h'))))
)

for (i in names(Vs_normoxia_H3K27ac)) {
  plotMA(Vs_normoxia_H3K27ac[[i]], main = i)
}

Vs_normoxia_H2BK120ac <- list(
  Cas9_6h = (results(chip_data_H2BK120ac_dds, name = 'Treatment_6h_vs_0h')),
  Cas9_24h = (results(chip_data_H2BK120ac_dds, name = 'Treatment_24h_vs_0h')),
  H4KO_6h = (results(chip_data_H2BK120ac_dds, contrast = list(c('Treatment_6h_vs_0h', 'TissueH4KO.Treatment6h')))),
  H4KO_24h = (results(chip_data_H2BK120ac_dds, contrast = list(c('Treatment_24h_vs_0h', 'TissueH4KO.Treatment24h'))))
)

for (i in names(Vs_normoxia_H2BK120ac)) {
  plotMA(Vs_normoxia_H2BK120ac[[i]], main = i)
}


# Annotate peaks
Vs_normoxia_H3K27ac_anno <- lapply(Vs_normoxia_H3K27ac, function(x) {
  anno <- x %>% 
    as.data.frame() %>% 
    rownames_to_column('locus') %>% 
    separate_wider_delim(cols = 'locus', delim = ':', names = c('seqnames', 'coord')) %>% 
    separate_wider_delim(cols = 'coord', delim = '-', names = c('start', 'end')) %>%
    makeGRangesFromDataFrame(keep.extra.columns = T) %>% 
    annotatePeak(TxDb = TxDb.Hsapiens.UCSC.hg38.knownGene, annoDb = 'org.Hs.eg.db') %>% 
    as.data.frame()
})

Vs_normoxia_H2BK120ac_anno <- lapply(Vs_normoxia_H2BK120ac, function(x) {
  anno <- x %>% 
    as.data.frame() %>% 
    rownames_to_column('locus') %>% 
    separate_wider_delim(cols = 'locus', delim = ':', names = c('seqnames', 'coord')) %>% 
    separate_wider_delim(cols = 'coord', delim = '-', names = c('start', 'end')) %>%
    makeGRangesFromDataFrame(keep.extra.columns = T) %>% 
    annotatePeak(TxDb = TxDb.Hsapiens.UCSC.hg38.knownGene, annoDb = 'org.Hs.eg.db') %>% 
    as.data.frame()
})

# save 
for (name in names(Vs_normoxia_H3K27ac_anno)) {
  write_csv(Vs_normoxia_H3K27ac_anno[[name]], paste0(DBR_dir,'/',name,'_H3K27ac.csv'))
}

for (name in names(Vs_normoxia_H2BK120ac_anno)) {
  write_csv(Vs_normoxia_H2BK120ac_anno[[name]], paste0(DBR_dir,'/',name,'_H2BK120ac.csv'))
}

