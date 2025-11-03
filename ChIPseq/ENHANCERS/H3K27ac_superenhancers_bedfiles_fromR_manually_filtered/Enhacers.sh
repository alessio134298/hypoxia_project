# cat *.bed > catted.bed #single sample files, not the bed with merged replicates

# bedtools sort -i catted.bed > catted_sorted.bed

# bedtools merge -i catted_sorted.bed > superEnhancers_bdtls_merged.bed

multiBigwigSummary BED-file --BED /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/H3K27ac_superenhancers_bedfiles_fromR_manually_filtered/superEnhancers_bdtls_merged.bed -b  /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1_RPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/H3K27ac_superenhancers_bedfiles_fromR_manually_filtered/MultiBigWigSum_for_SEs.npz --smartLabels --outRawCounts RawCounts.tab

#Annoto i Super e i Typical
for sample in /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/H3K27ac_superenhancers_bedfiles_fromR_manually_filtered/*consensusRep.bed; do samplename=$(basename "$sample" | awk -F ".bed" '{print $1}'); annotatePeaks.pl "$sample" hg38 > /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/H3K27ac_superenhancers_bedfiles_fromR_manually_filtered/"$samplename"_HomerAnno.bed

#motivi su H4KO exclusive super enhancers
findMotifsGenome.pl H4KO_only_normoxia_SEs.bed hg38 Motifs_H4KO_only_normoxia_SEs
#dovrei studiare meglio l'analisi dei motivi

