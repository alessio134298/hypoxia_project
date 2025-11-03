library(Gviz)
library(rtracklayer)
library(GenomicFeatures)
library(org.Hs.eg.db)
library(GO.db)
library(TxDb.Hsapiens.UCSC.hg38.knownGene)
library(tidyverse)


gtrack <- GenomeAxisTrack()

#####va fatto così!!!
txdb38 <- TxDb.Hsapiens.UCSC.hg38.knownGene

genes38 <- GeneRegionTrack(txdb38, geneSymbol = TRUE,  transcriptAnnotation = "gene", name = "Genes", fill = "#8282d2", stacking='dense')
z <- ranges(genes38)
print(head(z))
z$gene <- mapIds(org.Hs.eg.db, z$gene, "SYMBOL", "ENTREZID")

ranges(genes38) <- z
#####
plotTracks(list(genes38, gtrack), chromosome = "chr20", from = 37301941, to = 37756308)



#H3K27ac
#importo i file
pathx = "/media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC"
dirs = c("C1A",
         "C1D",
         "C1G",
         "C2A",
         "C2D",
         "C2G",
         "K125A1",
         "K125D1",
         "K125G1",
         "K26A1",
         "K26D1",
         "K26G1")
file.end <- ".bamCoverageRPKM.bw"
H3K27ac.Normoxia.Datatracks <- list()


options(ucscChromosomeNames=FALSE) 
for (i in dirs) {
  tmp.path = file.path(pathx,i,paste0(i,file.end))
  print(tmp.path)
  BW <- import.bw(tmp.path, as = "GRanges")
  DATATRACK = DataTrack(BW, name = i)
  H3K27ac.Normoxia.Datatracks[[i]] <- DATATRACK
  rm(BW, DATATRACK)
}


plot.and.save.track <- function(gene, from, to, chr, ylims) {
  
  png(paste0("/media/alessio/Data/hypoxia/ChIPseq/plot/tracks_H3K27ac/",gene,"_Normoxia.png"), height = 12, width = 30, units = "cm", res = 400)
  
  track <- plotTracks(c(H3K27ac.Normoxia.Datatracks[1],
                        H3K27ac.Normoxia.Datatracks[2],
                        H3K27ac.Normoxia.Datatracks[3],
                        H3K27ac.Normoxia.Datatracks[4],
                        genes38
  ),
  from = from, to = to,
  ylim = ylims,
  chromosome = chr,
  type = c("histogram"),
  transcriptAnnotation = "gene",
  col.histogram = "darkblue",
  fill.histogram = "darkblue",
  showSampleNames = T,
  col.sampleNames = "black",
  col.main = "black",
  background.title = "white",
  col.title = "black",
  col.axis = "black",
  title.width = 2,
  rotation.title = 0,
  position.title = "right",
  labelPos="revAlternating",
  margin = 200,
  cex.axis = 0.5,
  separator = 30,
  cex.sampleNames = 0.6
  ) 
  
  dev.off()
}

plot.and.save.track("LMOD2", 123564600, 123755500, "chr7", c(0,40))
plot.and.save.track("PDLIM3", 185489596, 185546549, "chr4", c(0,30))
plot.and.save.track("DENND10", 119095900, 119161099, "chr10", c(0,50))
plot.and.save.track("FGD1", 54409690, 54515922, "chrX", c(0,25))
plot.and.save.track("FRS2", 69449825, 69582485, "chr12", c(0,35))
plot.and.save.track("EMX2", 117459485, 117574686, "chr10", c(0,45))
plot.and.save.track("ZIC1", 147350528, 147531726, "chr3", c(0,30))



#H2BK120ac
#importo i file
pathx = "/media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC"
dirs = c("C1B",
         "C1E",
         "C1H",
         "C2B",
         "C2E",
         "C2H",
         "K125B1",
         "K125E1",
         "K125H1",
         "K26B1",
         "K26E1",
         "K26H1")
file.end <- ".bamCoverageRPKM.bw"
H2BK120ac.Normoxia.Datatracks <- list()


options(ucscChromosomeNames=FALSE) 
for (i in dirs) {
  tmp.path = file.path(pathx,i,paste0(i,file.end))
  print(tmp.path)
  BW <- import.bw(tmp.path, as = "GRanges")
  DATATRACK = DataTrack(BW, name = i)
  H2BK120ac.Normoxia.Datatracks[[i]] <- DATATRACK
  rm(BW, DATATRACK)
}

plot.and.save.track <- function(gene, from, to, chr, ylims) {
  
  png(paste0("/media/alessio/Data/hypoxia/ChIPseq/plot/tracks_H2BK120ac/",gene,"_Normoxia.png"), height = 12, width = 30, units = "cm", res = 400)
  
  track <- plotTracks(c(H2BK120ac.Normoxia.Datatracks[1],
                        H2BK120ac.Normoxia.Datatracks[2],
                        H2BK120ac.Normoxia.Datatracks[3],
                        H2BK120ac.Normoxia.Datatracks[4],
                        genes38
  ),
  from = from, to = to,
  ylim = ylims,
  chromosome = chr,
  type = c("histogram"),
  transcriptAnnotation = "gene",
  col.histogram = "darkblue",
  fill.histogram = "darkblue",
  showSampleNames = T,
  col.sampleNames = "black",
  col.main = "black",
  background.title = "white",
  col.title = "black",
  col.axis = "black",
  title.width = 2,
  rotation.title = 0,
  position.title = "right",
  labelPos="revAlternating",
  margin = 200,
  cex.axis = 0.5,
  separator = 30,
  cex.sampleNames = 0.6
  ) 
  
  dev.off()
}


plot.and.save.track("IFI44L", 78484008, 78782178, "chr1", c(0,40))
plot.and.save.track("SP110", 230144344, 230339639, "chr2", c(0,50))
plot.and.save.track("NWD1", 16696529, 16859591, "chr19", c(0,40))
plot.and.save.track("PDE4B", 65752379, 66501887, "chr1", c(0,40) )
plot.and.save.track("ZBTB20", 114226612, 115316573, "chr3", c(0,30) )



#Superenhancers esclusivi di HDAC4 KO in normoxia sia h3k27ac che H2BK120ac (solo intergenici)

#funzione che itrererò su ogni riga del dataframe
plot.and.save.track <- function(H4KOorCas9, Marker, gene, from, to, chr) {
  
  png(paste0("/media/alessio/Data/hypoxia/ChIPseq/plot/tracks_",Marker,"/SEs/",gene,"_",H4KOorCas9,"_excl_Normoxia.png"), height = 12, width = 30, units = "cm", res = 400)
  
  track <- plotTracks(c(get(paste0(Marker,".Normoxia.Datatracks"))[1:4],
                        genes38
  ),
  from = from, to = to,
  ylim = c(0,70),
  chromosome = chr,
  type = c("histogram"),
  transcriptAnnotation = "gene",
  col.histogram = "darkblue",
  fill.histogram = "darkblue",
  showSampleNames = T,
  col.sampleNames = "black",
  col.main = "black",
  background.title = "white",
  col.title = "black",
  col.axis = "black",
  title.width = 2,
  rotation.title = 0,
  position.title = "right",
  labelPos="revAlternating",
  margin = 200,
  cex.axis = 0.5,
  separator = 30,
  cex.sampleNames = 0.6
  ) 
  
  dev.off()
}


#H3K27ac
H3K27ac.H4KO.normoxia.SEs.exclusive <- read.delim(
  "/media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/H4KO_normoxia_exclusive.bed", header = F)
colnames(H3K27ac.H4KO.normoxia.SEs.exclusive) <- c("Chr", "Start", "End", "Length", "Strand", "Annotation", "Gene.Name", "Sample")

H3K27ac.H4KO.normoxia.SEs.exclusive.Intergenic <- H3K27ac.H4KO.normoxia.SEs.exclusive |> 
  dplyr::filter(Annotation == "Intergenic")

H3K27ac.Cas9.normoxia.SEs.exclusive <- read.delim(
  "/media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/Cas9_normoxia_exclusive.bed", header = F)
colnames(H3K27ac.Cas9.normoxia.SEs.exclusive) <- c("Chr", "Start", "End", "Length", "Strand", "Annotation", "Gene.Name", "Sample")

H3K27ac.Cas9.normoxia.SEs.exclusive.Intergenic <- H3K27ac.Cas9.normoxia.SEs.exclusive |> 
  dplyr::filter(Annotation == "Intergenic")

apply(H3K27ac.H4KO.normoxia.SEs.exclusive.Intergenic, 1, 
      function(row) {plot.and.save.track("H4KO", "H3K27ac" ,row["Gene.Name"], as.numeric(row["Start"])-50000, as.numeric(row["End"])+50000, row["Chr"])})

apply(H3K27ac.Cas9.normoxia.SEs.exclusive.Intergenic, 1, 
      function(row) {plot.and.save.track("Cas9", "H3K27ac" ,row["Gene.Name"], as.numeric(row["Start"])-50000, as.numeric(row["End"])+50000, row["Chr"])})

#H2Bk120ac
H2BK120ac.H4KO.normoxia.SEs.exclusive <- read.delim(
  "/media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H2BK120ac/H4KO_normoxia_exclusive.bed", header = F)
colnames(H2BK120ac.H4KO.normoxia.SEs.exclusive) <- c("Chr", "Start", "End", "Length", "Strand", "Annotation", "Gene.Name", "Sample")

H2BK120ac.H4KO.normoxia.SEs.exclusive.Intergenic <- H2BK120ac.H4KO.normoxia.SEs.exclusive |> 
  dplyr::filter(Annotation == "Intergenic")

H2BK120ac.Cas9.normoxia.SEs.exclusive <- read.delim(
  "/media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H2BK120ac/Cas9_normoxia_exclusive.bed", header = F)
colnames(H2BK120ac.Cas9.normoxia.SEs.exclusive) <- c("Chr", "Start", "End", "Length", "Strand", "Annotation", "Gene.Name", "Sample")

H2BK120ac.Cas9.normoxia.SEs.exclusive.Intergenic <- H2BK120ac.Cas9.normoxia.SEs.exclusive |> 
  dplyr::filter(Annotation == "Intergenic")

apply(H2BK120ac.H4KO.normoxia.SEs.exclusive.Intergenic, 1,
      function(row) {plot.and.save.track("H4KO", "H2BK120ac" ,row["Gene.Name"], as.numeric(row["Start"])-50000, as.numeric(row["End"])+50000, row["Chr"])})

apply(H2BK120ac.Cas9.normoxia.SEs.exclusive.Intergenic, 1,
      function(row) {plot.and.save.track("Cas9", "H2BK120ac" ,row["Gene.Name"], as.numeric(row["Start"])-50000, as.numeric(row["End"])+50000, row["Chr"])})




#file Ses differenziali calcolati con diffbind e summits 35000

#H3K27ac
#H4KO vs Cas9 normoxia
H3K27ac.normoxia.SEs.DiffBind <- openxlsx::read.xlsx(
  "/media/alessio/Data/hypoxia/ChIPseq/tables/H3K27ac_tables/Superenhancers_DiffBind_results_ROSE/SEs.H3K27ac.H4KOvsCAS9.ROSE_summits35000.xlsx",
  sheet = 1) |> dplyr::filter(Fold > 1 & p.value < 0.05)

apply(H3K27ac.normoxia.SEs.DiffBind, 1, function(row)
  plot.and.save.track("H4KO_DiffBind", "H3K27ac", row["transcriptId"], as.numeric(row["start"])-50000, as.numeric(row["end"])+50000, row["seqnames"]))


#Cas9 24 H hypoxia vs Cas9 normoxia
H3K27ac.Vsnormoxia.Cas9.24H.hypoxia.SEs.DiffBind <- openxlsx::read.xlsx(
"/media/alessio/Data/hypoxia/ChIPseq/tables/H3K27ac_tables/Superenhancers_DiffBind_results_ROSE/SEs.H3K27ac.Vsnormoxia.ROSE_summits35000.xlsx",
sheet = "CAS9_24h") |> dplyr::filter(Fold > 0.6 & p.value < 0.05)

apply(H3K27ac.Vsnormoxia.Cas9.24H.hypoxia.SEs.DiffBind, 1, function(row)
  plot.and.save.track("VsNormoxia_Cas9_24H_DiffBind", "H3K27ac", row["transcriptId"], as.numeric(row["start"])-50000, as.numeric(row["end"])+50000, row["seqnames"]))


#H4KO 24 H hypoxia vs Cas9 normoxia
H3K27ac.Vsnormoxia.H4KO.24H.hypoxia.SEs.DiffBind <- openxlsx::read.xlsx(
  "/media/alessio/Data/hypoxia/ChIPseq/tables/H3K27ac_tables/Superenhancers_DiffBind_results_ROSE/SEs.H3K27ac.Vsnormoxia.ROSE_summits35000.xlsx",
  sheet = "H4KO_24h") |> dplyr::filter(Fold > 0.6 & p.value < 0.05)

apply(H3K27ac.Vsnormoxia.H4KO.24H.hypoxia.SEs.DiffBind, 1, function(row)
  plot.and.save.track("VsNormoxia_H4KO_24H_DiffBind", "H3K27ac", row["transcriptId"], as.numeric(row["start"])-50000, as.numeric(row["end"])+50000, row["seqnames"]))









