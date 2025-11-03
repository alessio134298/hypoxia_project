#intersect fra i replicati
bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1B/C1B_peaks.narrowPeak -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2B/C2B_peaks.narrowPeak  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/Cas9_normoxia_peak_intersect_replicates.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1E/C1E_peaks.narrowPeak -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2E/C2E_peaks.narrowPeak  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/Cas9_H6_peak_intersect_replicates.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1H/C1H_peaks.narrowPeak -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2H/C2H_peaks.narrowPeak  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/Cas9_H24_peak_intersect_replicates.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125B1/K125B1_peaks.narrowPeak -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26B1/K26B1_peaks.narrowPeak  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/H4KO_normoxia_peak_intersect_replicates.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125E1/K125E1_peaks.narrowPeak -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26E1/K26E1_peaks.narrowPeak  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/H4KO_H6_peak_intersect_replicates.bed

bedtools intersect -f 0.3 -r -a /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125H1/K125H1_peaks.narrowPeak -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26H1/K26H1_peaks.narrowPeak  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/H4KO_H24_peak_intersect_replicates.bed

#intersect H4KO vs Cas9
bedtools intersect -v -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/H4KO_normoxia_peak_intersect_replicates.bed -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/Cas9_normoxia_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/H4KO_normoxia_diffpeaks.bed

bedtools intersect -v -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/H4KO_H6_peak_intersect_replicates.bed -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/Cas9_H6_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/H4KO_H6_diffpeaks.bed

bedtools intersect -v -a /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/H4KO_H24_peak_intersect_replicates.bed -b /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/Cas9_H24_peak_intersect_replicates.bed  > /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/H4KO_H24_diffpeaks.bed

#creo una lista per fare un plot in R dei risultati
for sample in *diffpeaks*; do echo -e "$sample\t$(less -S $sample | wc -l)" >> peakcounts.txt; done

for sample in *replicates*; do  echo -e "$sample\t$(less -S $sample | wc -l)" >> peakcounts.txt; done

for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/*/*.narrowPeak; do samplename=$(basename $sample); echo -e "$samplename\t$(less -S $sample | wc -l)" >> peakcounts.txt; done




#Annotazione cion Homer dei picchi differenziali

for sample in /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/*diffpeaks.bed; do samplename=$(basename "$sample" | awk -F "." '{print $1}'); annotatePeaks.pl "$sample" hg38 -gtf /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf > /media/alessio/Data/hypoxia/ChIPseq/intersection/H2BK120AC/"$samplename"_HomerAnnotation.txt; done