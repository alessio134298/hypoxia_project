#bedtools intersect H3K27ac x H2BK120ac, 
bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/Cas9_normoxia_peak_intersect_replicates.bed -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/Cas9_normoxia_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/Cas9_normoxia_H3K27ACxH2BK120AC_common_peaks.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/Cas9_H6_peak_intersect_replicates.bed -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/Cas9_H6_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/Cas9_H6_H3K27ACxH2BK120AC_common_peaks.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/Cas9_H24_peak_intersect_replicates.bed -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/Cas9_H24_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/Cas9_H24_H3K27ACxH2BK120AC_common_peaks.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/H4KO_normoxia_peak_intersect_replicates.bed -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_normoxia_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H4KO_normoxia_H3K27ACxH2BK120AC_common_peaks.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/H4KO_H6_peak_intersect_replicates.bed -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_H6_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H4KO_H6_H3K27ACxH2BK120AC_common_peaks.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/H4KO_H24_peak_intersect_replicates.bed -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_H24_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H4KO_H24_H3K27ACxH2BK120AC_common_peaks.bed