library(tidyverse)
library(GenomicRanges)
library(ChIPseeker)
library(ggpubr)
library(ChIPpeakAnno)
library(org.Hs.eg.db)
library(scales)

# path to save all the bed files
path = "/media/alessio/Data/hypoxia/ChIPseq/IDR/intersections_H4KO_Cas9/"


# Load IDR peaks
path.H3K27ac = "IDR/IDR_H3K27AC/idr_results"
files.H3K27ac = list.files(path.H3K27ac, pattern = "\\.bed$", full.names = F, recursive = F)

path.H2BK120ac = "IDR/IDR_H2BK120AC/idr_results"
files.H2BK120ac = list.files(path.H2BK120ac, pattern = "\\.bed$", full.names = F, recursive = F)

Peaks.IDR.H3K27ac <- list()
Peaks.IDR.H2BK120ac <- list()  

for (i in seq_along(files.H3K27ac)) #tanto hanno la stessa lunghezza
{
  tmp.path.H3 <- file.path(path.H3K27ac,files.H3K27ac[[i]]) #H3K27ac
  tmp.path.H2 <- file.path(path.H2BK120ac,files.H2BK120ac[[i]]) #H2BK120ac
  
  tmp.df.H3 <- readPeakFile(tmp.path.H3, as = "GRanges")
  colnames(mcols(tmp.df.H3)) = c("name", "Score_IDR", "punto",   ".","Signal")
  tmp.df.H2 <- readPeakFile(tmp.path.H2, as = "GRanges") 
  colnames(mcols(tmp.df.H2)) = c("name", "Score_IDR", "punto",   ".", "Signal")
  
  name.H3 <- as.character(files.H3K27ac[[i]]) %>% 
    str_remove("_IDR_consensus.bed")
  name.H2 <- as.character(files.H2BK120ac[[i]]) %>% 
    str_remove("_IDR_consensus.bed")
  
  Peaks.IDR.H3K27ac[[name.H3]] <- tmp.df.H3
  Peaks.IDR.H2BK120ac[[name.H2]] <- tmp.df.H2
}



##############################################
# Venn diagram solo normoxia HDAC4 KO vs Cas9
#############################################

# H3K27ac
pdf("Figure_paper/H4KO_vs_Cas9/venn_H3K27ac_H4KO_vs_cas9.pdf")
makeVennDiagram(Peaks = list(Peaks.IDR.H3K27ac$Cas9_normoxia, Peaks.IDR.H3K27ac$H4KO_normoxia),
                NameOfPeaks = c("Cas9_normoxia_H3K27ac", "H4KO_normoxia_H3K27ac"),
                margin = 0.1
)
dev.off()

# H2BK120ac
pdf("Figure_paper/H4KO_vs_Cas9/venn_H2BK120ac_H4KO_vs_cas9.pdf")
makeVennDiagram(Peaks = list(Peaks.IDR.H2BK120ac$Cas9_normoxia, Peaks.IDR.H2BK120ac$H4KO_normoxia),
                NameOfPeaks = c("Cas9_normoxia_H2BK120ac", "H4KO_normoxia_H2BK120ac"),
                margin = 0.1
)
dev.off()


#############################################
# Intersect
#############################################

# Salvo gli intersect dei picchi H4KO vs Cas9
intersected_H3K27ac <- list(
  Cas9.AllPeaks.H3K27ac = Peaks.IDR.H3K27ac$Cas9_normoxia,
  H4KO.AllPeaks.H3K27ac = Peaks.IDR.H3K27ac$H4KO_normoxia,
  Common.peaks.H4KO.Cas9.H3K27ac = GenomicRanges::reduce(
    c(
      subsetByOverlaps(Peaks.IDR.H3K27ac$Cas9_normoxia,
                       Peaks.IDR.H3K27ac$H4KO_normoxia),
      subsetByOverlaps(Peaks.IDR.H3K27ac$H4KO_normoxia,
                       Peaks.IDR.H3K27ac$Cas9_normoxia)
                                     )
    ),
  H4KO.exclusive.H3K27ac = subsetByOverlaps(Peaks.IDR.H3K27ac$H4KO_normoxia, 
                                            Peaks.IDR.H3K27ac$Cas9_normoxia,
                                            invert = T),
  Cas9.exclusive.H3K27ac = subsetByOverlaps(Peaks.IDR.H3K27ac$Cas9_normoxia, 
                                            Peaks.IDR.H3K27ac$H4KO_normoxia,
                                            invert = T)
)

intersected_H2BK120ac <- list(
  Cas9.AllPeaks.H2BK120ac = Peaks.IDR.H2BK120ac$Cas9_normoxia,
  H4KO.AllPeaks.H2BK120ac = Peaks.IDR.H2BK120ac$H4KO_normoxia,
  Common.peaks.H4KO.Cas9.H2BK120ac = GenomicRanges::reduce(
    c(
      subsetByOverlaps(Peaks.IDR.H2BK120ac$Cas9_normoxia,
                       Peaks.IDR.H2BK120ac$H4KO_normoxia),
      subsetByOverlaps(Peaks.IDR.H2BK120ac$H4KO_normoxia,
                       Peaks.IDR.H2BK120ac$Cas9_normoxia)
    )
  ),
  H4KO.exclusive.H2BK120ac = subsetByOverlaps(Peaks.IDR.H2BK120ac$H4KO_normoxia, 
                                            Peaks.IDR.H2BK120ac$Cas9_normoxia,
                                            invert = T),
  Cas9.exclusive.H2BK120ac = subsetByOverlaps(Peaks.IDR.H2BK120ac$Cas9_normoxia, 
                                            Peaks.IDR.H2BK120ac$H4KO_normoxia,
                                            invert = T)
)
  


# save all the files as bed
for (i in names(intersected_H3K27ac)) {
  write_delim(as.data.frame(intersected_H3K27ac[[i]]), delim = "\t", col_names = F, quote = "none", file = file.path(path,str_c(i,".bed"))) 
}
for (i in names(intersected_H2BK120ac)) {
  write_delim(as.data.frame(intersected_H2BK120ac[[i]]), delim = "\t", col_names = F, quote = "none", file = file.path(path,str_c(i,".bed"))) 
}


