# #https://hbctraining.github.io/Intro-to-ChIPseq-flipped/lessons/07_handling_peaks_bedtools.html
# #faccio betools intersect utilizzando i parametri di questa pagina

#intersect fra i replicati
bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_peaks.narrowPeak -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A_peaks.narrowPeak  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/Cas9_normoxia_peak_intersect_replicates.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D_peaks.narrowPeak -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D_peaks.narrowPeak  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/Cas9_H6_peak_intersect_replicates.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_peaks.narrowPeak -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G_peaks.narrowPeak  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/Cas9_H24_peak_intersect_replicates.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1_peaks.narrowPeak -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1_peaks.narrowPeak  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_normoxia_peak_intersect_replicates.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1_peaks.narrowPeak -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1_peaks.narrowPeak  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_H6_peak_intersect_replicates.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1_peaks.narrowPeak -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1_peaks.narrowPeak  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_H24_peak_intersect_replicates.bed

# #intersect H4KO vs Cas9
# bedtools intersect -v -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_normoxia_peak_intersect_replicates.bed -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/Cas9_normoxia_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_normoxia_diffpeaks.bed

# bedtools intersect -v -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_H6_peak_intersect_replicates.bed -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/Cas9_H6_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_H6_diffpeaks.bed

# bedtools intersect -v -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_H24_peak_intersect_replicates.bed -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/Cas9_H24_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_H24_diffpeaks.bed

# #intersect CAS9 vs H4KO
# bedtools intersect -v -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_normoxia_peak_intersect_replicates.bed -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/Cas9_normoxia_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/CAS9_normoxia_diffpeaks.bed

# bedtools intersect -v -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_H6_peak_intersect_replicates.bed -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/Cas9_H6_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/CAS9_H6_diffpeaks.bed

# bedtools intersect -v -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/H4KO_H24_peak_intersect_replicates.bed -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/Cas9_H24_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H3K27AC/CAS9_H24_diffpeaks.bed

# #creo una lista per fare un plot in R dei risultati
# for sample in *diffpeaks*; do echo -e "$sample\t$(less -S $sample | wc -l)" >> peakcounts.txt; done

# for sample in *replicates*; do  echo -e "$sample\t$(less -S $sample | wc -l)" >> peakcounts.txt; done

# for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/*/*.narrowPeak; do samplename=$(basename $sample); echo -e "$samplename\t$(less -S $sample | wc -l)" >> peakcounts.txt; done