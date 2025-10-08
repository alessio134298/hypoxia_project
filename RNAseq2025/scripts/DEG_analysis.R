suppressMessages({
  library(tidyverse)
  library(DESeq2)
  library(AnnotationHub)
  library(tximeta)
})

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
}


# samplesheet
coldata <- read_csv('sheets/samplesheet_salmon.csv')
coldata$time <- factor(coldata$time)
coldata$time <- relevel(coldata$time, ref = 0)
coldata$clone <- factor(coldata$clone)
coldata$clone <- relevel(coldata$clone, ref = 'CAS9')

#TXIMETA
#tximeta import
Hypoxia_se <- tximeta(coldata = coldata)

#summarize to gene
Hypoxia_se_summarized_to_genes <- summarizeToGene(Hypoxia_se)


#DESEQ2
dds <- DESeqDataSet(Hypoxia_se_summarized_to_genes,
                    design = ~ clone + time + group + clone:time)

# smallestGroupSize <- 2
# keep <- rowSums(counts(dds) >= 10) >= smallestGroupSize
# dds <- dds[keep,]

dds <- DESeq(dds)

#TRASFORM & PCA
vsd <- vst(dds,  blind=FALSE)

pcaData <- plotPCA(vsd, intgroup =c("clone", "time"), returnData = T)
percentVar <- round(100 * attr(pcaData, "percentVar"))

PCA_allsamples <- ggplot(pcaData, aes(PC1, PC2, fill = clone, shape = time)) +
  geom_point(size = 5) +
  scale_shape_manual(values = c(21L, 22L, 23L, 24L)) +
  scale_fill_manual(values = c("#854ddc", "#FF007F", "#FF007F")) +
  # geom_text(aes(label = group), size = 3) +
  xlab(paste0("PC1: ",percentVar[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar[2],"% variance")) + 
  guides(fill = guide_legend(override.aes = list(shape=21))) +
  coord_fixed() +
  theme_bw()

PCA_allsamples

vsd_corrected <- limma::removeBatchEffect(assay(vsd),
                                          batch=colData(dds)$cell)
pcaData_corrected <- prcomp(t(vsd_corrected))

percentVar_corrected <- round(pcaData_corrected$sdev^2 / sum(pcaData_corrected$sdev^2) * 100)
pcaData_corrected <- tibble(PC1 = pcaData_corrected$x[,1],
                  PC2 = pcaData_corrected$x[,2],
                  time = colData(dds)$time,
                  clone = colData(dds)$clone)

PCA_allsamples_corrected <- ggplot(pcaData_corrected, aes(PC1, PC2, fill = clone, shape = time)) +
  geom_point(size = 5) +
  scale_shape_manual(values = c(21L, 22L, 23L, 24L)) +
  scale_fill_manual(values = c("#854ddc", "#FF007F", "#FF007F")) +
  # geom_text(aes(label = group), size = 3) +
  xlab(paste0("PC1: ",percentVar_corrected[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar_corrected[2],"% variance")) + 
  guides(fill = guide_legend(override.aes = list(shape=21))) +
  coord_fixed() +
  theme_bw()

PCA_allsamples_corrected


