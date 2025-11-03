.libPaths("~/R/x86_64-pc-linux-gnu-library/4.4")

suppressMessages({
library(tidyverse)
library(GenomicRanges)
library(ChIPseeker)
library(ChIPpeakAnno)}
)

pathx <- '/media/alessio/Data/hypoxia/ChIPseq_new/poised_active_class'

### for Cas9 and H4KO we define poised and active enhancers based on the presence of H3K4me1 and H3K27ac
idr_files <- list.files('IDR_peaks', pattern = '.bed$', full.names = T)
idr_files_norm <- idr_files[str_detect(idr_files, "NORMOXIA")]

idr_peaks_norm <- list()
for (i in idr_files_norm) {
  name = str_remove(basename(i), '.0.1.IDR_peaks.bed')
  peak <- readPeakFile(i)
  seqlevels(peak) <- c(paste0("chr", 1:22), "chrX", "chrY")
  idr_peaks_norm[[name]] <- peak
}

enhancers_classification_normoxia <- list(Cas9_poised_enh_norm = subsetByOverlaps(idr_peaks_norm$SKUT1_CAS9_NORMOXIA_H3K4ME1,
                                              idr_peaks_norm$SKUT1_CAS9_NORMOXIA_H3K27AC,
                                              invert = T),
               Cas9_active_enh_norm = GenomicRanges::reduce(c(
                 subsetByOverlaps(idr_peaks_norm$SKUT1_CAS9_NORMOXIA_H3K4ME1,
                                  idr_peaks_norm$SKUT1_CAS9_NORMOXIA_H3K27AC),
                 subsetByOverlaps(idr_peaks_norm$SKUT1_CAS9_NORMOXIA_H3K27AC,
                                  idr_peaks_norm$SKUT1_CAS9_NORMOXIA_H3K4ME1)
                 )
                 ),
               Cas9_H3K27ac_only_norm = subsetByOverlaps(idr_peaks_norm$SKUT1_CAS9_NORMOXIA_H3K27AC,
                                                idr_peaks_norm$SKUT1_CAS9_NORMOXIA_H3K4ME1,
                                                invert = T),
               H4KO_poised_enh_norm = subsetByOverlaps(idr_peaks_norm$SKUT1_HDAC4_KO_NORMOXIA_H3K4ME1,
                                                  idr_peaks_norm$SKUT1_HDAC4_KO_NORMOXIA_H3K27AC,
                                                  invert = T),
               H4KO_active_enh_norm = GenomicRanges::reduce(c(
                 subsetByOverlaps(idr_peaks_norm$SKUT1_HDAC4_KO_NORMOXIA_H3K4ME1,
                                  idr_peaks_norm$SKUT1_HDAC4_KO_NORMOXIA_H3K27AC),
                 subsetByOverlaps(idr_peaks_norm$SKUT1_HDAC4_KO_NORMOXIA_H3K27AC,
                                  idr_peaks_norm$SKUT1_HDAC4_KO_NORMOXIA_H3K4ME1)
               )
               ),
               H4KO_H3K27ac_only_norm = subsetByOverlaps(idr_peaks_norm$SKUT1_HDAC4_KO_NORMOXIA_H3K27AC,
                                                idr_peaks_norm$SKUT1_HDAC4_KO_NORMOXIA_H3K4ME1,
                                                invert = T)
               )

# POISED to ACTIVE in HDAC4 KO
enhancers_classification_normoxia[["H4KO_poised_to_active"]] <- subsetByOverlaps(enhancers_classification_normoxia$H4KO_active_enh_norm,
                                              enhancers_classification_normoxia$Cas9_poised_enh_norm)
# POISED to ACTIVE in HDAC4 KO with HDAC4 peaks
HDAC4_peaks <- readPeakFile('/media/alessio/Data/NAR2020_Cb/GSM3882325_HDAC4_DMSO_SKUT_peaks.narrowPeak')
enhancers_classification_normoxia[["H4KO_poised_to_active_with_HDAC4"]] <- subsetByOverlaps(enhancers_classification_normoxia$H4KO_poised_to_active,
                                                                                 HDAC4_peaks)

# ACTIVE in HDAC4 KO with HDAC4 peaks
enhancers_classification_normoxia[["H4KO_active_with_HDAC4"]] <- subsetByOverlaps(enhancers_classification_normoxia$H4KO_active_enh_norm,
                                                                                            HDAC4_peaks)

# ACTIVE to POISED in HDAC4 KO
enhancers_classification_normoxia[["H4KO_active_to_poised"]] <- subsetByOverlaps(enhancers_classification_normoxia$H4KO_poised_enh_norm,
                                                                                 enhancers_classification_normoxia$Cas9_active_enh_norm)


for (i in names(enhancers_classification_normoxia)) {
  
  peak <- sort(enhancers_classification_normoxia[[i]]) %>% 
    as.data.frame() %>% 
    dplyr::select(seqnames, start, end)
  
  write_delim(peak, delim = '\t', file = paste0(pathx,'/',i,'.bed'), col_names = F)
}


# Venn diagram
png('Venn_Cas9_H3K27ac_H2BK120ac_H3K4me1.png', units = 'cm', height = 16, width = 16, res = 300)
makeVennDiagram(Peaks = list(idr_peaks_norm$SKUT1_CAS9_NORMOXIA_H2BK120AC,
                             idr_peaks_norm$SKUT1_CAS9_NORMOXIA_H3K27AC,
                             idr_peaks_norm$SKUT1_CAS9_NORMOXIA_H3K4ME1),
                NameOfPeaks = c("SKUT1_CAS9_NORMOXIA_H2BK120AC",
                                "SKUT1_CAS9_NORMOXIA_H3K27AC",
                                "SKUT1_CAS9_NORMOXIA_H3K4ME1"),
                margin = 0.2,
                cex = 0.8,
                cat.cex = 0.8
)
dev.off()

png('Venn_H4KO_H3K27ac_H2BK120ac_H3K4me1.png', units = 'cm', height = 16, width = 16, res = 300)
makeVennDiagram(Peaks = list(idr_peaks_norm$SKUT1_HDAC4_KO_NORMOXIA_H2BK120AC,
                             idr_peaks_norm$SKUT1_HDAC4_KO_NORMOXIA_H3K27AC,
                             idr_peaks_norm$SKUT1_HDAC4_KO_NORMOXIA_H3K4ME1),
                NameOfPeaks = c("SKUT1_HDAC4_KO_NORMOXIA_H2BK120AC",
                                "SKUT1_HDAC4_KO_NORMOXIA_H3K27AC",
                                "SKUT1_HDAC4_KO_NORMOXIA_H3K4ME1"),
                margin = 0.2,
                cex = 0.8,
                cat.cex = 0.8
)
dev.off()

