#H3K27ac
#
bedtools intersect -a ../intersection/H3K27AC/Cas9_H24_peak_intersect_replicates.bed -b ../intersection/H3K27AC/Cas9_normoxia_peak_intersect_replicates.bed -v > Cas9_24_vs_Cas9_normoxia.bed
bedtools intersect -a ../intersection/H3K27AC/H4KO_H24_peak_intersect_replicates.bed -b ../intersection/H3K27AC/H4KO_normoxia_peak_intersect_replicates.bed -v > H4KO_24_vs_H4KO_normoxia.bed

#picchi di intersect
findMotifsGenome.pl Cas9_24_vs_Cas9_normoxia.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa Cas9_24_vs_Cas9_normoxia_findMotifsGenome_output -size 1000 -nomotif
findMotifsGenome.pl H4KO_24_vs_H4KO_normoxia.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H4KO_24_vs_H4KO_normoxia_findMotifsGenome_output -size 1000 -nomotif

#picchi di Diffbind
findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H3K27ac_Vs_normoxia_CAS9_24h_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H3K27ac/DiffBind_Cas9_24_vs_Cas9_normoxia_findMotifsGenome_output -size 1000 -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H3K27ac_Vs_normoxia_H4KO_24h_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H3K27ac/DiffBind_H4KO_24_vs_H4KO_normoxia_findMotifsGenome_output -size 1000 -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H3K27ac_H4KO_vs_Cas9_H24_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H3K27ac/DiffBind_H4KO_vs_Cas9_H24_findMotifsGenome_output -size 1000 -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H3K27ac_H4KO_vs_Cas9_Normoxia_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H3K27ac/DiffBind_H4KO_vs_Cas9_normoxia_findMotifsGenome_output -size 1000 -nomotif -p 10

#Vediamo a che picchi sono associati i motivi arricchiti di HIF
#per farlo usiamo l'opzione -m di annotatePeaks.pl
annotatePeaks.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H3K27ac_H4KO_vs_Cas9_H24_DiffBind_enriched_peaks_onlyPromoter.bed  /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa -m /media/alessio/Data/hypoxia/ChIPseq/Motifs_analysis/Homer_motifs/DiffBind_H4KO_vs_Cas9_H24_findMotifsGenome_output/knownResults/known41.motif > HIF-1a.txt

findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H3K27ac_H4KO_vs_Cas9_H24_DiffBind_enriched_peaks_onlyPromoter.bed   /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa MotifOutputDirectory/ -find /media/alessio/Data/hypoxia/ChIPseq/Motifs_analysis/Homer_motifs/DiffBind_H4KO_vs_Cas9_H24_findMotifsGenome_output/knownResults/known41.motif > HIF-1a_motif.txt


#H2BK120ac
#picchi di Diffbind
findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H2BK120ac_Vs_normoxia_CAS9_24h_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H2BK120ac/DiffBind_Cas9_24_vs_Cas9_normoxia_findMotifsGenome_output -size 1000 -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H2BK120ac_Vs_normoxia_H4KO_24h_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H2BK120ac/DiffBind_H4KO_24_vs_H4KO_normoxia_findMotifsGenome_output -size 1000 -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H2BK120ac_H4KO_vs_Cas9_H24_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H2BK120ac/DiffBind_H4KO_vs_Cas9_H24_findMotifsGenome_output -size 1000 -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H2BK120ac_H4KO_vs_Cas9_Normoxia_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H2BK120ac/DiffBind_H4KO_vs_Cas9_normoxia_findMotifsGenome_output -size 1000 -nomotif -p 10


#riprovo settando come zona di ricerca dei motivi solo l'ampiezza dei picchi (401 bp)
#H3K27ac
#picchi di Diffbind
findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H3K27ac_Vs_normoxia_CAS9_24h_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H3K27ac/DiffBind_Cas9_24_vs_Cas9_normoxia_findMotifsGenome_output_given -size given -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H3K27ac_Vs_normoxia_H4KO_24h_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H3K27ac/DiffBind_H4KO_24_vs_H4KO_normoxia_findMotifsGenome_output_given -size given -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H3K27ac_H4KO_vs_Cas9_H24_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H3K27ac/DiffBind_H4KO_vs_Cas9_H24_findMotifsGenome_output_given -size given -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H3K27ac_H4KO_vs_Cas9_Normoxia_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H3K27ac/DiffBind_H4KO_vs_Cas9_normoxia_findMotifsGenome_output_given -size given -nomotif -p 10

#H2BK120ac
#picchi di Diffbind
findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H2BK120ac_Vs_normoxia_CAS9_24h_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H2BK120ac/DiffBind_Cas9_24_vs_Cas9_normoxia_findMotifsGenome_output_given -size given -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H2BK120ac_Vs_normoxia_H4KO_24h_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H2BK120ac/DiffBind_H4KO_24_vs_H4KO_normoxia_findMotifsGenome_output_given -size given -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H2BK120ac_H4KO_vs_Cas9_H24_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H2BK120ac/DiffBind_H4KO_vs_Cas9_H24_findMotifsGenome_output_given -size given -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/hypoxia/ChIPseq/DiffBind_bed_files/only_promoter/H2BK120ac_H4KO_vs_Cas9_Normoxia_DiffBind_enriched_peaks_onlyPromoter.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H2BK120ac/DiffBind_H4KO_vs_Cas9_normoxia_findMotifsGenome_output_given -size given -nomotif -p 10


#ricerca dei motivi per picchi di ATAC dentro ai SEs differenziali
findMotifsGenome.pl /media/alessio/Data/leio_atac_data/intersect_peaks/SKUT_atac_consensus_peaks_on_H3K27ac_normoxia_H4KO_vs_Cas9_Upreg_SEs.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H3K27ac/SKUT_atac_consensus_peaks_on_H3K27ac_normoxia_H4KO_vs_Cas9_Upreg_SEs_findMotifsGenome -size 200 -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/leio_atac_data/intersect_peaks/SKUT_atac_consensus_peaks_on_H3K27ac_normoxia_H4KO_vs_Cas9_Downreg_SEs.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H3K27ac/SKUT_atac_consensus_peaks_on_H3K27ac_normoxia_H4KO_vs_Cas9_Downreg_SEs_findMotifsGenome -size 200 -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/leio_atac_data/intersect_peaks/SKUT_atac_consensus_peaks_on_H2BK120ac_normoxia_H4KO_vs_Cas9_Upreg_SEs.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H2BK120ac/SKUT_atac_consensus_peaks_on_H2BK120ac_normoxia_H4KO_vs_Cas9_Upreg_SEs_findMotifsGenome -size 200 -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/leio_atac_data/intersect_peaks/SKUT_atac_consensus_peaks_on_H2BK120ac_normoxia_H4KO_vs_Cas9_Downreg_SEs.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H2BK120ac/SKUT_atac_consensus_peaks_on_H2BK120ac_normoxia_H4KO_vs_Cas9_Downreg_SEs_findMotifsGenome -size 200 -nomotif -p 10



#ricerca dei motivi per picchi di HDAC4 dentro ai SEs differenziali
findMotifsGenome.pl /media/alessio/Data/NAR2020_Cb/HDAC4_peaks_on_H3K27ac_normoxia_H4KO_vs_Cas9_Upreg_SEs.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H3K27ac/HDAC4_peaks_on_H3K27ac_normoxia_H4KO_vs_Cas9_Upreg_SEs_findMotifsGenome -size 200 -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/NAR2020_Cb/HDAC4_peaks_on_H3K27ac_normoxia_H4KO_vs_Cas9_Downreg_SEs.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H3K27ac/HDAC4_peaks_on_H3K27ac_normoxia_H4KO_vs_Cas9_Downreg_SEs_findMotifsGenome -size 200 -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/NAR2020_Cb/HDAC4_peaks_on_H2BK120ac_normoxia_H4KO_vs_Cas9_Upreg_SEs.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H2BK120ac/HDAC4_peaks_on_H2BK120ac_normoxia_H4KO_vs_Cas9_Upreg_SEs_findMotifsGenome -size 200 -nomotif -p 10

findMotifsGenome.pl /media/alessio/Data/NAR2020_Cb/HDAC4_peaks_on_H2BK120ac_normoxia_H4KO_vs_Cas9_Downreg_SEs.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa H2BK120ac/HDAC4_peaks_on_H2BK120ac_normoxia_H4KO_vs_Cas9_Downreg_SEs_findMotifsGenome -size 200 -nomotif -p 10


#Anche sugli overlap dei SEs tra Up dei due marker istonici
findMotifsGenome.pl /media/alessio/Data/NAR2020_Cb/HDAC4_peaks_on_Overlaps_H3_H2_normoxia_H4KO_vs_Cas9_Upreg_SEs.bed /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa HDAC4_peaks_on_Overlaps_H3_H2_normoxia_H4KO_vs_Cas9_Upreg_SEs_findMotifsGenome -size 200 -nomotif -p 10