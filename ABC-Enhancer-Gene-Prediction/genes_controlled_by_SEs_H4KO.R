library(tidyverse)
library(GenomicRanges)
library(ChIPseeker)

res_file_1 <- '/media/alessio/Data/hypoxia/ABC-Enhancer-Gene-Prediction/res_H4KO_H3K27ac_1/H3K27ac_H4KO_cl125/Predictions/EnhancerPredictionsAllPutative.tsv.gz'
res_file_2 <- '/media/alessio/Data/hypoxia/ABC-Enhancer-Gene-Prediction/res_H4KO_H3K27ac_2/H3K27ac_H4KO_cl26/Predictions/EnhancerPredictionsAllPutative.tsv.gz'
SEs_file_1 <- '/media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/K125A1/K125A1_SEs.bed'
SEs_file_2 <- '/media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/K26A1/K26A1_SEs.bed'
SEs_upreg_file <- '/media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/Superenhancers/SEs_H3K27ac_H4KO_vs_Cas9_Normoxia_DiffBind_enriched_peaks.bed'
HDAC4_file <- '/media/alessio/Data/NAR2020_Cb/GSM3882325_HDAC4_DMSO_SKUT_peaks.narrowPeak'

ABC.score.threshold = 0.1


# read file
res_1 <- read_delim(res_file_1) %>% 
  filter(ABC.Score > ABC.score.threshold) %>% 
  select(chr, start, end, name, class, TargetGene, ABC.Score)

res_2 <- read_delim(res_file_2) %>% 
  filter(ABC.Score > ABC.score.threshold) %>% 
  select(chr, start, end, name, class, TargetGene, ABC.Score)

res_comb <- bind_rows(res_1, res_2)

# convert to granges
res_granges <- makeGRangesFromDataFrame(res_comb, keep.extra.columns = T)

# integrate data about SEs and HDAC4
SEs_1 <- readPeakFile(SEs_file_1)
SEs_2 <- readPeakFile(SEs_file_2)
SEs_upreg <- readPeakFile(SEs_upreg_file)
HDAC4 <- readPeakFile(HDAC4_file)

# We merge the SEs file and then we take only if there is at least an overlap with HDAC4
### merge the two ses files 
SEs_all <- reduce(c(SEs_1, SEs_2))
# take only the one with HDAC4
SEs_with_HDAC4 <- subsetByOverlaps(SEs_all, HDAC4)
# take only the one that overlap with upregs
SEs_with_HDAC4_Upreg <- subsetByOverlaps(SEs_with_HDAC4, SEs_upreg)

# Take only the regions identified by ABC that are inside Upreg SEs that have HDAC4
res_granges_sub <- subsetByOverlaps(res_granges, SEs_with_HDAC4_Upreg)

# reconvert to data frame and extract genes
res_df_sub <- as.data.frame(res_granges_sub)

genes <- unique(res_df_sub$TargetGene)



# integrate RNAseq data
Count_table_VSD <- read_delim('/media/alessio/Data/hypoxia/DBR_analysis_RNAseq_new/VSD_normoxia_newsamples.csv')  %>% 
  select(-gene_id)

Count_table_only_genes_ABC_SEs_H4KO <- Count_table_VSD %>% 
  filter(symbol %in% genes)

# Heatmap
library(ComplexHeatmap)
library(colorRamp2)

# convert to matrix
mat_only_genes_ABC_SEs_H4KO <- Count_table_only_genes_ABC_SEs_H4KO %>% 
  column_to_rownames("symbol") %>% 
  as.matrix() %>% 
  scale()

# plot
png('Heatmap_subset_genes_SEs_HDAC4_KO_Upreg.png', res = 300, height = 25, width = 12, units = 'cm')
Heatmap(mat_only_genes_ABC_SEs_H4KO,
        cluster_columns = F,
        col = colorRamp2(colors = c("yellow", "black"), breaks = c(
          min(mat_only_genes_ABC_SEs_H4KO),
          max(mat_only_genes_ABC_SEs_H4KO))
        ),
        name = "Zscore")
dev.off()


# make the table long for boxplot
Count_table_only_genes_ABC_SEs_H4KO_long <- Count_table_only_genes_ABC_SEs_H4KO %>% 
  pivot_longer(cols = starts_with('R')) %>% 
  mutate(group = ifelse(str_detect(name, 'CN'), 'Cas9', 'H4KO'))

library(ggpubr)
P <- ggplot(Count_table_only_genes_ABC_SEs_H4KO_long, aes(x = group, y = value)) +
  geom_boxplot() +
  stat_compare_means()

ggsave(P, filename = 'Boxplot_genes_controlled_by_SEs_H4KO.png')
