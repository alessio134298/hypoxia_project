suppressMessages({
  library(tidyverse)
  library(DESeq2)
  library(AnnotationHub)
  library(tximeta)
})

pathx = '/media/alessio/Data/hypoxia/RNAseq2025/'

smallestGroupSize <- 2
min_count <- 10

### general objects and function
#Genes object
{
  ah <- AnnotationHub(localHub = FALSE)
  query(ah , c("Homo sapiens", "Ensembl","EnsDb", "110"))
  edb <- ah[["AH113665"]]
  gns <- as.data.frame(genes(edb, return.type = "DataFrame")) 
  rm(edb, ah)
  gns_geneidversion_symbol_entrezid <- gns %>% 
    dplyr::select(gene_id_version, symbol, entrezid)
  rm(gns)
  
  
  PCA_func <- function(pcaData, PC1, PC2, percentVar) {
    ggplot(pcaData, aes(PC1, PC2, fill = clone, shape = time)) +
      geom_point(size = 5) +
      scale_shape_manual(values = c(21L, 22L, 23L, 24L)) +
      scale_fill_manual(values = c("#854ddc", "#FF007F", "#FF007F")) +
      # geom_text(aes(label = group), size = 3) +
      xlab(paste0("PC1: ",percentVar[1],"% variance")) +
      ylab(paste0("PC2: ",percentVar[2],"% variance")) + 
      guides(fill = guide_legend(override.aes = list(shape=21))) +
      coord_fixed() +
      theme_bw()
  }
  
}



# All samples together
# First, to have a general view of the samples with PCA we will create a object with all the samples

# read samplesheet
coldata <- read_csv(file.path(pathx,'sheets/samplesheet_salmon.csv'))
coldata$time <- factor(coldata$time)
coldata$time <- relevel(coldata$time, ref = '0')
coldata$clone_group <- factor(coldata$clone_group)
coldata$clone_group <- relevel(coldata$clone_group, ref = 'CAS9_cl.125_ctrl')

coldata$type <- factor(ifelse(str_detect(coldata$clone, 'CAS9'), 'CAS9', 'HDAC4_KO'))

#TXIMETA
#tximeta import
Hypoxia_se <- tximeta(coldata = coldata)

#summarize to gene
Hypoxia_se_summarized_to_genes <- summarizeToGene(Hypoxia_se)


#DESEQ2
dds <- DESeqDataSet(Hypoxia_se_summarized_to_genes,
                    design = ~ clone_group + time + clone_group:time)

### DESeq
# PCA also with the bactheffect correction
keep <- rowSums(counts(dds) >= min_count) >= smallestGroupSize
dds <- dds[keep,]

dds <- DESeq(dds)

# TRASFORM & PCA
vsd <- vst(dds,  blind=FALSE)

pcaData <- plotPCA(vsd, intgroup =c("clone", "time"), returnData = T)
percentVar <- round(100 * attr(pcaData, "percentVar"))
# plot
PCA_allsamples <- PCA_func(pcaData, PC1, PC2, percentVar)
PCA_allsamples

# to remove the difference of the cell line
# correct with limma
vsd_corrected <- limma::removeBatchEffect(assay(vsd),
                                          batch=colData(dds)$cell)
pcaData_corrected <- prcomp(t(vsd_corrected))
percentVar_corrected <- round(pcaData_corrected$sdev^2 / sum(pcaData_corrected$sdev^2) * 100)
pcaData_corrected <- tibble(PC1 = pcaData_corrected$x[,1],
                            PC2 = pcaData_corrected$x[,2],
                            time = colData(dds)$time,
                            clone = colData(dds)$clone)
# plot
PCA_allsamples_corrected <- PCA_func(pcaData_corrected, PC1, PC2, percentVar_corrected)
PCA_allsamples_corrected

# save PCA
ggsave(PCA_allsamples, filename = file.path(pathx,'plot/PCA_all_samples.pdf'), height = 6, width = 7)
ggsave(PCA_allsamples_corrected, filename = file.path(pathx,'plot/PCA_all_samples_corrected.pdf'), height = 6, width = 7)


# save the TPM, normalized and vsd counts
TPM <- assay(dds, 'abundance') %>% as.data.frame()
VSD <- assay(vsd) %>% as.data.frame() %>% as.data.frame()
Norm_counts <- DESeq2::counts(dds, normalized = T) %>%  as.data.frame()

write_csv(TPM %>% rownames_to_column('gene_id_version'), file = file.path(pathx,'tables/TPM_all.csv'))
write_csv(VSD %>% rownames_to_column('gene_id_version'), file = file.path(pathx,'/tables/VSD_all.csv'))
write_csv(Norm_counts %>% rownames_to_column('gene_id_version'), file =  file.path(pathx,'/tables/Norm_counts_all.csv'))




# Clones separated interactions results
# Here the question is are the two HDAC4 KO clones behaving different due to hypoxia at each time point?
# We aim to do the analysis on the clones separated and then put them together in the end.
# We want to see if the KO has an interaction effect due to hypoxia so we need the interaction term,

# after trying different ways I made up my mid that the best is to split the dds object in two, it was too messy with one reference level
dds_125 <- dds[, dds$clone_group %in% c("CAS9_cl.125_ctrl", "HDAC4_KO_cl.125")]
dds_26  <- dds[, dds$clone_group %in% c("CAS9_cl.26_ctrl",  "HDAC4_KO_cl.26")]

dds_125$clone_group <- droplevels(dds_125$clone_group)
dds_26$clone_group  <- droplevels(dds_26$clone_group)

design(dds_125) <- ~ clone_group + time + clone_group:time
design(dds_26)  <- ~ clone_group + time + clone_group:time

dds_125 <- DESeq(dds_125)
dds_26 <- DESeq(dds_26)

resultsNames(dds_125)
resultsNames(dds_26)

results_interaction_hypoxia <- list(
  H4KO_125_vs_ctrl_0h  = results(dds_125, name = "clone_group_HDAC4_KO_cl.125_vs_CAS9_cl.125_ctrl"),
  H4KO_125_vs_ctrl_6h_interaction  = results(dds_125, name = "clone_groupHDAC4_KO_cl.125.time6"),
  H4KO_125_vs_ctrl_24h_interaction = results(dds_125, name = "clone_groupHDAC4_KO_cl.125.time24"),
  H4KO_125_vs_ctrl_48h_interaction = results(dds_125, name = "clone_groupHDAC4_KO_cl.125.time48"),
  
  H4KO_26_vs_ctrl_0h = results(dds_26, name = "clone_group_HDAC4_KO_cl.26_vs_CAS9_cl.26_ctrl"),
  H4KO_26_vs_ctrl_6h_interaction = results(dds_26, name = "clone_groupHDAC4_KO_cl.26.time6"),
  H4KO_26_vs_ctrl_24h_interaction = results(dds_26, name = "clone_groupHDAC4_KO_cl.26.time24"),
  H4KO_26_vs_ctrl_48h_interaction = results(dds_26, name = "clone_groupHDAC4_KO_cl.26.time48")
  )

# save ma plot
for (i in names(results_interaction_hypoxia)) {
  png( filename = file.path(pathx,paste0('plot/ma/',i,'.png')))
  plotMA(results_interaction_hypoxia[[i]])
  dev.off()
}

# save list with DEGS
for (i in names(results_interaction_hypoxia)) {
  df <- results_interaction_hypoxia[[i]]
  df <- df %>% 
    as.data.frame() %>% 
    rownames_to_column('gene_id_version') %>% 
    left_join(gns_geneidversion_symbol_entrezid,
              by = 'gene_id_version')
  
  write_tsv(df, file = file.path(pathx,paste0('DEGs_tabs/',i,'.tsv')))
}

# From the MA plot already seems that only the clone 126 is behaving really differently from the control

# Effect of the hypoxia on the clones separated, so everyone against his normoxia 
results_hypoxia_independent <- list(Cas9_125_6h = results(dds, name = 'time_6_vs_0'),
                                    Cas9_125_24h = results(dds, name = 'time_24_vs_0'),
                                    Cas9_125_48h = results(dds, name = 'time_48_vs_0'),
                                    Cas9_26_6h = results(dds, contrast = list(c('time_6_vs_0', 'clone_groupCAS9_cl.26_ctrl.time6')
                                    )
                                    ),
                                    Cas9_26_24h = results(dds, contrast = list(c('time_24_vs_0', 'clone_groupCAS9_cl.26_ctrl.time24')
                                    )
                                    ),
                                    Cas9_26_48h = results(dds, contrast = list(c('time_48_vs_0', 'clone_groupCAS9_cl.26_ctrl.time48')
                                    )
                                    ),
                                    H4KO_125_6h = results(dds, contrast = list(c('time_6_vs_0', 'clone_groupHDAC4_KO_cl.125.time6')
                                    )
                                    ),
                                    H4KO_125_24h = results(dds, contrast = list(c('time_24_vs_0', 'clone_groupHDAC4_KO_cl.125.time24')
                                    )
                                    ),
                                    H4KO_125_48h = results(dds, contrast = list(c('time_48_vs_0', 'clone_groupHDAC4_KO_cl.125.time48')
                                    )
                                    ),
                                    H4KO_26_6h = results(dds, contrast = list(c('time_6_vs_0', 'clone_groupHDAC4_KO_cl.26.time6')
                                    )
                                    ),
                                    H4KO_26_24h = results(dds, contrast = list(c('time_24_vs_0', 'clone_groupHDAC4_KO_cl.26.time24')
                                    )
                                    ),
                                    H4KO_26_48h = results(dds, contrast = list(c('time_48_vs_0', 'clone_groupHDAC4_KO_cl.26.time48')
                                    )
                                    )
)

for (i in names(results_hypoxia_independent)) {
  png( filename = file.path(pathx,paste0('plot/ma/',i,'.png')))
  plotMA(results_hypoxia_independent[[i]])
  dev.off()
}

for (i in names(results_hypoxia_independent)) {
  df <- results_hypoxia_independent[[i]]
  df <- df %>% 
    as.data.frame() %>% 
    rownames_to_column('gene_id_version') %>% 
    left_join(gns_geneidversion_symbol_entrezid,
              by = 'gene_id_version')
  
  write_tsv(df, file = file.path(pathx,paste0('DEGs_tabs/',i,'.tsv')))
}


# Interaction effect clones taken together
# this is the result we used eventually

# re do the design
dds_int <- dds
design(dds_int) <- ~ type + time + type:time
dds_int <- DESeq(dds_int)
resultsNames(dds_int)

results_interaction_hypoxia_clones_together <- list(
  H4KO_vs_ctrl_0h  = results(dds_int, name = "type_HDAC4_KO_vs_CAS9"),
  H4KO_vs_ctrl_6h_interaction  = results(dds_int, name = "typeHDAC4_KO.time6"),
  H4KO_vs_ctrl_24h_interaction = results(dds_int, name = "typeHDAC4_KO.time24"),
  H4KO_vs_ctrl_48h_interaction = results(dds_int, name = "typeHDAC4_KO.time48")
)

# save ma plot
for (i in names(results_interaction_hypoxia_clones_together)) {
  png( filename = file.path(pathx,paste0('plot/ma/',i,'.png')))
  plotMA(results_interaction_hypoxia_clones_together[[i]])
  dev.off()
}

# save list with DEGS
for (i in names(results_interaction_hypoxia_clones_together)) {
  df <- results_interaction_hypoxia_clones_together[[i]]
  df <- df %>% 
    as.data.frame() %>% 
    rownames_to_column('gene_id_version') %>% 
    left_join(gns_geneidversion_symbol_entrezid,
              by = 'gene_id_version')
  
  write_tsv(df, file = file.path(pathx,paste0('DEGs_tabs/',i,'.tsv')))
}


# LRT test with reduced model
# same design as the one for the interaction effect
dds_lrt <- dds
design(dds_lrt) <- ~ type + time + type:time
dds_lrt <- DESeq(dds_lrt, test = 'LRT', reduced = ~ type + time)
resultsNames(dds_lrt)

# the manual says that:
# we have to ignore the L2FC, it does not mean anything relevant, in the output it will print: 
# log2 fold change (MLE): typeHDAC4 KO.time48 
# LRT p-value: '~ type + time + type:time' vs '~ type + time' 
# But it does not mean that it is testng only that time point, it like a place holder
# we only take the FDR or pvalue of this test, not the L2FC
lrt_test_results <- results(dds_lrt) %>% 
  as.data.frame() %>% 
  rownames_to_column('gene_id_version') %>% 
  left_join(gns_geneidversion_symbol_entrezid,
            by = 'gene_id_version')

name <- 'LRT_test_HDAC4_vs_Cas9_anytimepoint'
write_tsv(lrt_test_results, file = file.path(pathx,paste0('DEGs_tabs/',name,'.tsv')))

