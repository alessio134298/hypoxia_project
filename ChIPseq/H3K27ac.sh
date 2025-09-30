# #peak calling solo su H3K27

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/C1A/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/C1A/C1A

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/C1D/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/C1D/C1D

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/C1G/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/C1G/C1G

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/K125A1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/K125A1/K125A1

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/K125D1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/K125D1/K125D1

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/K125G1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/K125G1/K125G1

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/C2A/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/C2A/C2A

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/C2D/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/C2D/C2D

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/C2G/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/C2G/C2G

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/K26A1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/K26A1/K26A1

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/K26D1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/K26D1/K26D1

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/K26G1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/K26G1/K26G1

# #plotfingerprint per acetilazione

# plotFingerprint -b samples/C1A/human_only_sorted.bam samples/C1D/human_only_sorted.bam samples/C1G/human_only_sorted.bam samples/K125A1/human_only_sorted.bam samples/K125D1/human_only_sorted.bam samples/K125G1/human_only_sorted.bam samples/C2A/human_only_sorted.bam samples/C2D/human_only_sorted.bam samples/C2G/human_only_sorted.bam samples/K26A1/human_only_sorted.bam samples/K26D1/human_only_sorted.bam samples/K26G1/human_only_sorted.bam  -plot plot/Acetylation_fingerprint.png -p 10

# #ho creato un samplesheet su R
# H3K27samples <- coldata |> 
#   dplyr::select(SampleID, bamReads) |> 
#   dplyr::mutate(bw = sub("/[^/]*$", "", bamReads)) |> 
#   dplyr::mutate(bw = str_c(bw,"/",SampleID,".bw")) |> 
#   dplyr::select(bw)
# #
# write.table(H3K27samples, row.names = F, col.names = F, file = "/media/alessio/Data/hypoxia/ChIPseq/H3K27ac_samplesheet.txt")

# #Computematrix
# computeMatrix reference-point --referencePoint TSS --upstream 3000 --downstream 3000 --skipZeros -R /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/C1A/C1A.bw /media/alessio/Data/hypoxia/ChIPseq/samples/C1D/C1D.bw /media/alessio/Data/hypoxia/ChIPseq/samples/C1G/C1G.bw /media/alessio/Data/hypoxia/ChIPseq/samples/K125A1/K125A1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/K125D1/K125D1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/K125G1/K125G1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/C2A/C2A.bw /media/alessio/Data/hypoxia/ChIPseq/samples/C2D/C2D.bw /media/alessio/Data/hypoxia/ChIPseq/samples/C2G/C2G.bw /media/alessio/Data/hypoxia/ChIPseq/samples/K26A1/K26A1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/K26D1/K26D1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/K26G1/K26G1.bw -o /media/alessio/Data/hypoxia/ChIPseq/H3K27ac_matrix.gz --numberOfProcessors 8

# #Heatmap
# plotHeatmap -m H3K27ac_matrix.gz -o heatmap_H3K27ac.pdf

# #rifaccio i Bw con Bamcompare
# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/C1A/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/C1A/C1A.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/C1D/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/C1D/C1D.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/C1G/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/C1G/C1G.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/C2A/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/C2A/C2A.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/C2D/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/C2D/C2D.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/C2G/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/C2G/C2G.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/K125A1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/K125A1/K125A1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/K125D1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/K125D1/K125D1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/K125G1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/K125G1/K125G1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/K26A1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/K26A1/K26A1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/K26D1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/K26D1/K26D1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/K26G1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/K26G1/K26G1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# #computeMatrix
# computeMatrix reference-point --referencePoint TSS --upstream 5000 --downstream 5000 --missingDataAsZero -R /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared.gz --numberOfProcessors 10

# plotHeatmap -m H3K27ac_matrix_compared.gz -o heatmap_H3K27ac_compare_BPM.pdf

# #faccio heatmap prendendo geni upregolati in HDAC4Ko in normossia come gtf (mi aspetto di vedere un arricchimento nei KO rispetto al controllo)

# #creo un gtf filtrandolo per i geni upregolati
# #uso lo script "filter_gtf_with_csv.py"

# #computeMatrix con il gtf con solo i geni upregolati in normossia

# computeMatrix reference-point --referencePoint TSS --upstream 3000 --downstream 3000 --missingDataAsZero -R /media/alessio/Data/hypoxia/ChIPseq/UP_normoxia_filtered.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/C1A/C1A.bw /media/alessio/Data/hypoxia/ChIPseq/samples/C1D/C1D.bw /media/alessio/Data/hypoxia/ChIPseq/samples/C1G/C1G.bw /media/alessio/Data/hypoxia/ChIPseq/samples/K125A1/K125A1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/K125D1/K125D1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/K125G1/K125G1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/C2A/C2A.bw /media/alessio/Data/hypoxia/ChIPseq/samples/C2D/C2D.bw /media/alessio/Data/hypoxia/ChIPseq/samples/C2G/C2G.bw /media/alessio/Data/hypoxia/ChIPseq/samples/K26A1/K26A1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/K26D1/K26D1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/K26G1/K26G1.bw -o /media/alessio/Data/hypoxia/ChIPseq/H3K27ac_matrix_compared_UPnormoxia.gz --numberOfProcessors 10

# #computeMatrix con il gtf con solo i geni downregolati in normossia

# computeMatrix reference-point --referencePoint TSS --upstream 5000 --downstream 5000 --missingDataAsZero -R /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared.gz --numberOfProcessors 10


# #faccio una prova chiamando i picchi con l'opzione broad
# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_broad --broad --broad-cutoff 0.1


# #plotEnrichment
# plotEnrichment -b samples/H3K27AC/C1A/human_only_sorted.bam samples/H3K27AC/K125A1/human_only_sorted.bam samples/H3K27AC/C2A/human_only_sorted.bam samples/H3K27AC/K26A1/human_only_sorted.bam  --BED GTF_filtered_RNAseq/Upreg_normoxia_H4KO_vs_ctrl.bed GTF_filtered_RNAseq/Downreg_normoxia_H4KO_vs_ctrl.bed -o plot/plotEnrichment_normoxia.png -p 18 --plotFileFormat png --centerReads --labels C1A K125A1 C2A K26A1 --regionLabels "up regulated" "down regulated" --variableScales --plotTitle "H3K27ac Normoxia" --colors lightblue blue lightblue blue --plotHeight 15

# plotEnrichment -b samples/H3K27AC/C1D/human_only_sorted.bam samples/H3K27AC/K125D1/human_only_sorted.bam samples/H3K27AC/C2D/human_only_sorted.bam samples/H3K27AC/K26D1/human_only_sorted.bam  --BED GTF_filtered_RNAseq/Upreg_6H_H4KO_vs_ctrl.bed GTF_filtered_RNAseq/Downreg_6H_H4KO_vs_ctrl.bed -o plot/plotEnrichment_6H.png -p 18 --plotFileFormat png --centerReads --labels C1D K125D1 C2D K26D1 --regionLabels "up regulated" "down regulated" --variableScales  --plotTitle "H3K27ac 6H" --colors lightblue blue lightblue blue --plotHeight 15

# plotEnrichment -b samples/H3K27AC/C1G/human_only_sorted.bam samples/H3K27AC/K125G1/human_only_sorted.bam samples/H3K27AC/C2G/human_only_sorted.bam samples/H3K27AC/K26G1/human_only_sorted.bam  --BED GTF_filtered_RNAseq/Upreg_24H_H4KO_vs_ctrl.bed GTF_filtered_RNAseq/Downreg_24H_H4KO_vs_ctrl.bed -o plot/plotEnrichment_24H.png -p 18 --plotFileFormat png --centerReads --labels C1G K125G1 C2G K26G1 --regionLabels "up regulated" "down regulated" --variableScales  --plotTitle "H3K27ac 24H" --colors lightblue blue lightblue blue --plotHeight 15

# #aggiuntivo 6 vs 24
# plotEnrichment -b samples/H3K27AC/C1D/human_only_sorted.bam samples/H3K27AC/K125D1/human_only_sorted.bam samples/H3K27AC/C2D/human_only_sorted.bam samples/H3K27AC/K26D1/human_only_sorted.bam  --BED GTF_filtered_RNAseq/Upreg_24H_H4KO_vs_ctrl.bed GTF_filtered_RNAseq/Downreg_24H_H4KO_vs_ctrl.bed -o plot/plotEnrichment_6H_RNA24h.png -p 18 --plotFileFormat png --centerReads --labels C1D K125D1 C2D K26D1 --regionLabels "up regulated" "down regulated" --variableScales  --plotTitle "H3K27ac 6H (RNA 24H)" --colors lightblue blue lightblue blue --plotHeight 15


# #Plotprofile
# plotProfile -m Deeptools_matrix/H3K27ac_matrix_compared.gz  -out H3K27ac_Profile.png --numPlotsPerRow 2 --plotTitle "H3K27ac" --perGroup --plotHeight 10 --plotWidth 15 

# #computeMatrix con file Upreg
# computeMatrix reference-point --referencePoint TSS --upstream 3000 --downstream 3000 --missingDataAsZero\
#     -R  /media/alessio/Data/hypoxia/ChIPseq/GTF_filtered_RNAseq/Upreg_24H_H4KO_vs_ctrl.bed \
#         /media/alessio/Data/hypoxia/ChIPseq/GTF_filtered_RNAseq/Upreg_6H_H4KO_vs_ctrl.bed \
#         /media/alessio/Data/hypoxia/ChIPseq/GTF_filtered_RNAseq/Upreg_normoxia_H4KO_vs_ctrl.bed \
#     -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A.bw \
#         /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D.bw \
#         /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G.bw \
#         /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1.bw \
#         /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1.bw \
#         /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1.bw \
#         /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A.bw \
#         /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D.bw \
#         /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G.bw \
#         /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1.bw \
#         /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1.bw \
#         /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1.bw \
#         -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_Upreg.gz \
#         --numberOfProcessors 10 #non va in nessun modo, si killa


# #Chiamo superenhancer con Homer
# #Creo tag directories
# for dir in /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/*; do samplename=$(basename $dir); makeTagDirectory /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/"$samplename"_TagDir  "$dir"/human_only_sorted.bam -sspe; done

# #chiamo i SEs
# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1A_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1N_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1D_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1H6_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1G_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1H24_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125A1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125N_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125D1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125H6_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125G1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125H24_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2A_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2N_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2D_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2H6_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2G_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2H24_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26A1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26N_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26D1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26H6_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26G1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26H24_TagDir/ -style super -o auto

# #comando per fare un elenco dei campioni da dare in R
# for sample in $(find "$directory" -maxdepth 1 -type d -name "[CK]*"); do  samplename=$(basename $sample); echo $samplename >> textzz.txt;
# tr '\n' ',' < textzz.txt | sed 's/,/","/g' | sed 's/^/"/; s/$/"/'

# #Chiamo anche i Picchi normalmente (in modalità histone), per poter fare un confronto (i file output si chiamano regions.txt)
# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1A_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1N_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1D_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1H6_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1G_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1H24_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125A1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125N_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125D1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125H6_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125G1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125H24_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2A_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2N_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2D_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2H6_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2G_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2H24_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26A1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26N_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26D1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26H6_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26G1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26H24_TagDir/ -style histone -o auto

# #rinomino tutti i regions.txt in peaks (per evitare di confondermi più avanti)



# #rifaccio i bigwig con normalizzazione usando gli scale factors di Diffbind
# #NORM_FACTORS <- (1/norm$norm.factors), quindi uso il reciproco del norm factor di DiffBind ( mi sembra più sensato guardando i dati ma non sono sicuro sia giusto)

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_Diffnorm.bw -p 10 --scaleFactors 0.9145706:1 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D_Diffnorm.bw -p 10 --scaleFactors 1.0594675:1 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_Diffnorm.bw -p 10 --scaleFactors 0.9035176:1 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A_Diffnorm.bw -p 10 --scaleFactors 1.0754251:1 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D_Diffnorm.bw -p 10 --scaleFactors 0.9627665:1 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G_Diffnorm.bw -p 10 --scaleFactors 0.9815421:1 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1_Diffnorm.bw -p 10 --scaleFactors 1.1608663:1 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1_Diffnorm.bw -p 10 --scaleFactors 0.9731028:1 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1_Diffnorm.bw -p 10 --scaleFactors 1.0029148:1 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1_Diffnorm.bw -p 10 --scaleFactors 0.9011113:1 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1_Diffnorm.bw -p 10 --scaleFactors 0.9847387:1 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1_Diffnorm.bw -p 10 --scaleFactors 0.6741098:1 --scaleFactorsMethod SES

# #computeMatrix
# computeMatrix reference-point --referencePoint TSS --upstream 5000 --downstream 5000 --missingDataAsZero -R /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_Diffnorm.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D_Diffnorm.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_Diffnorm.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1_Diffnorm.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1_Diffnorm.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1_Diffnorm.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A_Diffnorm.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D_Diffnorm.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G_Diffnorm.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1_Diffnorm.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1_Diffnorm.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1_Diffnorm.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_Diffnorm.gz --numberOfProcessors 10

# plotHeatmap -m Deeptools_matrix/H3K27ac_matrix_compared_Diffnorm.gz -o H3K27_Heatmap_Diffnorm1.png

# Non viene bene, le baseline dei segnali sonon diverse

# Faccio plotFingerprint per vedere la complessità delle library, raggruppo i diversi tempi di ipossia

# plotFingerprint -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam --labels C1A C2A K125A1 K26A1 IC1N IC2N IK125N IK26N -T "H3K27ac Normoxia library complexity" --plotFile H3K27ac_Normoxia_fingerprint.png --outRawCounts H3K27ac_Normoxia_fingerprint_Rawcounts.tab -p 10

# plotFingerprint -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/human_only_sorted.bam --labels C1D C2D K125D1 K26D1 IC1H6 IC2H6 IK125H6 IK26H6 -T "H3K27ac 6H hypoxia library complexity" --plotFile H3K27ac_6H_hypoxia_fingerprint.png --outRawCounts H3K27ac_6H_hypoxia_fingerprint_Rawcounts.tab -p 10 

# plotFingerprint -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/human_only_sorted.bam --labels C1G C2G K125G1 K26G1 IC1H24 IC2H24 IK125H24 IK26H24 -T "H3K27ac 24H hypoxia library complexity" --plotFile H3K27ac_24H_hypoxia_fingerprint.png --outRawCounts H3K27ac_24H_hypoxia_fingerprint_Rawcounts.tab -p 10


# #rifaccio i Bw con Bamcompare con normalizzazione RPKM
# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# #computeMatrix
# computeMatrix reference-point --referencePoint TSS --upstream 5000 --downstream 5000 --missingDataAsZero -R /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1_RPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_RPKM.gz --numberOfProcessors 10

# plotHeatmap -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_RPKM.gz -o heatmap_H3K27ac_compare_RPKM.png


# #Richiamo gli enhancers con HOMER, stavolta chiamo sia i Super che i Typical, in più uso l'opzione superslpe -1000 per includere tutti i potenziali SEs e -L 0

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1A_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1N_TagDir/ -style super -superSlope -1000  -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1A_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1D_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1H6_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1D_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1G_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1H24_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1G_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125A1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125N_TagDir/ -style super -superSlope -1000 -L 0  -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125A1_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125D1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125H6_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125D1_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125G1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125H24_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125G1_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2A_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2N_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2A_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2D_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2H6_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2D_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2G_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2H24_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2G_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26A1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26N_TagDir/ -style super -superSlope -1000 -L 0 -o  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26A1_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26D1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26H6_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26D1_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26G1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26H24_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26G1_TagDir/SEs.txt



# #BigWigAverage (per ora solo su normoxia)
# bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_RPKM.bw -o BigWigAverage/H3K27ac/CAS9_normoxia_H3K27ac_averaged.bw -p 10

# bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1_RPKM.bw -o BigWigAverage/H3K27ac/H4KO_normoxia_H3K27ac_averaged.bw -p 10



# #profili di arricchiento su regioni di HDAC4 (dati di ChIP atlas), sia sulle regioni totali che su quelle solo di SKUT1
# computeMatrix reference-point --referencePoint center --missingDataAsZero --upstream 5000 --downstream 5000 -R /media/alessio/Data/hypoxia/ChIPseq/ChIP_atlas_files/HDAC4.ChIP.SKUT1.WT.bed /media/alessio/Data/hypoxia/ChIPseq/ChIP_atlas_files/Oth.Utr.05.HDAC4.AllCell.bed -S /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H3K27ac/CAS9_normoxia_H3K27ac_averaged.bw /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H3K27ac/H4KO_normoxia_H3K27ac_averaged.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/Normoxia_H3K27ac_on_HDAC4_ChIP_atlas_regions.gz --numberOfProcessors 10 --smartLabels

# plotProfile -m Deeptools_matrix/Normoxia_H3K27ac_on_HDAC4_ChIP_atlas_regions.gz  -out H3K27ac_Normoxia_HDAC4_Bindingsites_Profile.png --numPlotsPerRow 2 --plotTitle "H3K27ac peaks on HDAC4 binding sites" --perGroup --plotHeight 10 --plotWidth 15 

# #anche su TSS
# computeMatrix reference-point --referencePoint TSS --missingDataAsZero --upstream 5000 --downstream 5000 -R /media/alessio/Data/hypoxia/ChIPseq/ChIP_atlas_files/HDAC4.ChIP.SKUT1.WT.bed /media/alessio/Data/hypoxia/ChIPseq/ChIP_atlas_files/Oth.Utr.05.HDAC4.AllCell.bed -S /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H3K27ac/CAS9_normoxia_H3K27ac_averaged.bw /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H3K27ac/H4KO_normoxia_H3K27ac_averaged.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/Normoxia_H3K27ac_on_HDAC4_ChIP_atlas_regions_TSS.gz --numberOfProcessors 10 --smartLabels

# plotProfile -m Deeptools_matrix/Normoxia_H3K27ac_on_HDAC4_ChIP_atlas_regions_TSS.gz  -out H3K27ac_Normoxia_HDAC4_Bindingsites_Profile_TSS.png --numPlotsPerRow 2 --plotTitle "H3K27ac peaks on HDAC4 binding sites" --perGroup --plotHeight 10 --plotWidth 15

# #24 ore di ipossia
# bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_RPKM.bw -o BigWigAverage/H3K27ac/CAS9_24h_hypoxia_H3K27ac_averaged.bw -p 10

# bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1_RPKM.bw -o BigWigAverage/H3K27ac/H4KO_24h_hypoxia_H3K27ac_averaged.bw -p 10

# computeMatrix reference-point --referencePoint center --missingDataAsZero --upstream 5000 --downstream 5000 -R /media/alessio/Data/hypoxia/ChIPseq/ChIP_atlas_files/HDAC4.ChIP.SKUT1.WT.bed /media/alessio/Data/hypoxia/ChIPseq/ChIP_atlas_files/Oth.Utr.05.HDAC4.AllCell.bed -S /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H3K27ac/CAS9_24h_hypoxia_H3K27ac_averaged.bw /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H3K27ac/H4KO_24h_hypoxia_H3K27ac_averaged.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/24h_hypoxia_H3K27ac_on_HDAC4_ChIP_atlas_regions.gz --numberOfProcessors 10 --smartLabels

# plotProfile -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/24h_hypoxia_H3K27ac_on_HDAC4_ChIP_atlas_regions.gz  -out H3K27ac_24h_hypoxia_HDAC4_Bindingsites_Profile.png --numPlotsPerRow 2 --plotTitle "H3K27ac peaks on HDAC4 binding sites" --perGroup --plotHeight 10 --plotWidth 15 


# #Bamcoverage senza normalizzazione per dopo normalizzare con CHIPIN
# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_NoNorm.bw --binSize 20 -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D_NoNorm.bw --binSize 20  -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_NoNorm.bw --binSize 20  -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A_NoNorm.bw --binSize 20    -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D_NoNorm.bw --binSize 20    -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G_NoNorm.bw --binSize 20    -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1_NoNorm.bw --binSize 20    -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1_NoNorm.bw --binSize 20    -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1_NoNorm.bw --binSize 20    -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1_NoNorm.bw --binSize 20    -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1_NoNorm.bw --binSize 20    -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1_NoNorm.bw --binSize 20    -p 10 --scaleFactorsMethod None


# #Faccio computeMatrix sui file normalizzati da CHIPIN (il file C2A non è stato rinormalizzato da CHIPIN perchè lo ha usato come reference)
# computeMatrix reference-point --referencePoint TSS --upstream 5000 --downstream 5000 --missingDataAsZero -R /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf -S /media/alessio/Data/hypoxia/ChIPseq/CHIPIN/C1A_NoNorm.renormReg.bw /media/alessio/Data/hypoxia/ChIPseq/CHIPIN/C1D_NoNorm.renormReg.bw /media/alessio/Data/hypoxia/ChIPseq/CHIPIN/C1G_NoNorm.renormReg.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A_NoNorm.bw /media/alessio/Data/hypoxia/ChIPseq/CHIPIN/C2D_NoNorm.renormReg.bw /media/alessio/Data/hypoxia/ChIPseq/CHIPIN/C2G_NoNorm.renormReg.bw /media/alessio/Data/hypoxia/ChIPseq/CHIPIN/K125A1_NoNorm.renormReg.bw /media/alessio/Data/hypoxia/ChIPseq/CHIPIN/K125D1_NoNorm.renormReg.bw /media/alessio/Data/hypoxia/ChIPseq/CHIPIN/K125G1_NoNorm.renormReg.bw /media/alessio/Data/hypoxia/ChIPseq/CHIPIN/K26A1_NoNorm.renormReg.bw /media/alessio/Data/hypoxia/ChIPseq/CHIPIN/K26D1_NoNorm.renormReg.bw /media/alessio/Data/hypoxia/ChIPseq/CHIPIN/K26G1_NoNorm.renormReg.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_CHIPIN_normalized.gz --numberOfProcessors 10

# plotProfile -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_CHIPIN_normalized.gz  -out H3K27ac_CHIPIN_normalized_profile.png  --plotTitle "H3K27ac CHIPIN normalized" --perGroup --plotHeight 10 --plotWidth 15 

# plotHeatmap -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_CHIPIN_normalized.gz -o heatmap_H3K27ac_CHIPIN.png


# #Vogio vedere il profilo di arricchimento al centro delle regioni, TSS potrebbe essere non indicativo
# #computeMatrix
# computeMatrix reference-point --referencePoint center --upstream 5000 --downstream 5000 --missingDataAsZero -R /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1_RPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_RPKM_center.gz --numberOfProcessors 10

# plotHeatmap -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_RPKM_center.gz -o heatmap_H3K27ac_RPKM_center.png
# #non so, non capisco bene cosa sto vedendo

# #facciamo scale-regions
# #computeMatrix
# computeMatrix scale-regions -b 3000 -a 3000  --regionBodyLength 5000 --missingDataAsZero -R /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1_RPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_RPKM_scaleregions.gz --numberOfProcessors 6

# #plotHeatmap -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_RPKM_scaleregions.gz -o heatmap_H3K27ac_RPKM_scaleregions.png #si killa

# plotProfile -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_RPKM_scaleregions.gz  -out H3K27ac_scaleregions.png --plotTitle "H3K27ac" --perGroup --plotHeight 10 --plotWidth 15 


# #Faccio computeMatrix su geni interferon sia alfa che gamma (msigdb signatures Hallmark), solo campioni normoxia
# computeMatrix reference-point --referencePoint TSS --upstream 5000 --downstream 5000  --missingDataAsZero -R /media/alessio/Data/hypoxia/ChIPseq/GTF_filtered_RNAseq/GTF_V44_Interferon_alpha_genes.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A.bamCoverageRPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A.bamCoverageRPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1.bamCoverageRPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1.bamCoverageRPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_normoxia_interferonalphagenesregions.gz -p 8

# plotProfile -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_normoxia_interferonalphagenesregions.gz -out H3K27ac_interferonalphagenesTSS.png --plotTitle "H3K27ac signals on interferon alpha genes" --plotHeight 10 --plotWidth 15 --perGroup

# computeMatrix reference-point --referencePoint TSS --upstream 5000 --downstream 5000  --missingDataAsZero -R /media/alessio/Data/hypoxia/ChIPseq/GTF_filtered_RNAseq/GTF_V44_Interferon_gamma_genes.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A.bamCoverageRPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A.bamCoverageRPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1.bamCoverageRPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1.bamCoverageRPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_normoxia_interferongammagenesregions.gz -p 8

# plotProfile -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_normoxia_interferongammagenesregions.gz -out H3K27ac_interferongammagenesTSS.png --plotTitle "H3K27ac signals on interferon gamma genes" --plotHeight 10 --plotWidth 15 --perGroup



#Matrice solo normossia (Per paper)
# computeMatrixOperations subset -m Deeptools_matrix/H3K27ac_matrix_compared_RPKM.gz -o Deeptools_matrix/H3K27ac_matrix_compared_RPKM_onlyNormoxia.gz --samples C1A_RPKM C2A_RPKM  K125A1_RPKM K26A1_RPKM

# plotProfile -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_RPKM_onlyNormoxia.gz  -out H3K27ac_normoxia.png --plotTitle "H3K27ac Normoxia" --plotHeight 10 --plotWidth 15 --perGroup --colors "#32004F" "#7323A8" "#F31365" "#C3122F" --samplesLabel

# plotProfile -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_RPKM_onlyNormoxia.gz  -out H3K27ac_normoxia_nolabels.png --plotTitle "H3K27ac Normoxia" --plotHeight 10 --plotWidth 15 --perGroup --colors "#32004F" "#7323A8" "#F31365" "#C3122F" --samplesLabel " " " " " " " " 

# plotHeatmap -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_RPKM_onlyNormoxia.gz -o Heatmap_H3K27ac_normoxia.png

#provato a chiamare i picchi per C1A con l'opzione BAMPE
#macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_pe -f BAMPE
#aumenta un po il numero di picchi

# #BigWigAverage sui BiwWig non normalizzati con l'input ( per visualizzazione)
# bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A.bamCoverageRPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A.bamCoverageRPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H3K27ac/bamCoverage/CAS9_normoxia_H3K27ac.bw -p 6

# bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D.bamCoverageRPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D.bamCoverageRPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H3K27ac/bamCoverage/CAS9_H6_H3K27ac.bw -p 6

# bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G.bamCoverageRPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G.bamCoverageRPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H3K27ac/bamCoverage/CAS9_H24_H3K27ac.bw -p 6

# bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1.bamCoverageRPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1.bamCoverageRPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H3K27ac/bamCoverage/H4KO_normoxia_H3K27ac.bw -p 6

# bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1.bamCoverageRPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1.bamCoverageRPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H3K27ac/bamCoverage/H4KO_H6_H3K27ac.bw -p 6

# bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1.bamCoverageRPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1.bamCoverageRPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H3K27ac/bamCoverage/H4KO_H24_H3K27ac.bw -p 6


# #Normalizzazione solo con scale factors SES
# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_SES.bw --binSize 20 -p 10 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D_SES.bw --binSize 20  -p 10 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_SES.bw --binSize 20  -p 10 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A_SES.bw --binSize 20    -p 10 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D_SES.bw --binSize 20    -p 10 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G_SES.bw --binSize 20    -p 10 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1_SES.bw --binSize 20    -p 10 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1_SES.bw --binSize 20    -p 10 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1_SES.bw --binSize 20    -p 10 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1_SES.bw --binSize 20    -p 10 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1_SES.bw --binSize 20    -p 10 --scaleFactorsMethod SES

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1_SES.bw --binSize 20    -p 10 --scaleFactorsMethod SES


# computeMatrix reference-point --referencePoint TSS --upstream 5000 --downstream 5000 --missingDataAsZero -R /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_SES.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D_SES.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_SES.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1_SES.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1_SES.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1_SES.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A_SES.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D_SES.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G_SES.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1_SES.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1_SES.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1_SES.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_SES_center.gz --numberOfProcessors 10

# plotProfile -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_SES_center.gz -out H3K27ac_SES_profile.png  --plotTitle "H3K27ac SES scaled" --perGroup --plotHeight 10 --plotWidth 15 

# plotHeatmap -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K27ac_matrix_compared_SES_center.gz -o heatmap_H3K27ac_SES_scaled.png



# #rifaccio profili di arricchimento su segnali di ChIP di HDAC4 (uso i bigwig RPKM e non quelli fatti con BigWigAverage)
# #Normoxia
# computeMatrix reference-point --referencePoint center --missingDataAsZero --upstream 10000 --downstream 10000 -R /media/alessio/Data/NAR2020_Cb/GSM3882325_HDAC4_DMSO_SKUT_peaks.narrowPeak -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1_RPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/Normoxia_H3K27ac_on_HDAC4_Nar2020cb.gz --numberOfProcessors 10 --smartLabels

# plotProfile -m Deeptools_matrix/Normoxia_H3K27ac_on_HDAC4_Nar2020cb.gz  -out H3K27ac_Normoxia_HDAC4_Bindingsites_Profile.png --numPlotsPerRow 2 --plotTitle "Normoxia H3K27ac peaks on HDAC4 binding sites" --perGroup --plotHeight 10 --plotWidth 15 --colors "#32004F" "#7323A8" "#F31365" "#C3122F"

# #24H
# computeMatrix reference-point --referencePoint center --missingDataAsZero --upstream 10000 --downstream 10000 -R /media/alessio/Data/NAR2020_Cb/GSM3882325_HDAC4_DMSO_SKUT_peaks.narrowPeak -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1_RPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H24_H3K27ac_on_HDAC4_Nar2020cb.gz --numberOfProcessors 10 --smartLabels

# plotProfile -m Deeptools_matrix/H24_H3K27ac_on_HDAC4_Nar2020cb.gz  -out H3K27ac_H24_HDAC4_Bindingsites_Profile.png --numPlotsPerRow 2 --plotTitle "H24 H3K27ac peaks on HDAC4 binding sites" --perGroup --plotHeight 10 --plotWidth 15 --colors "#32004F" "#7323A8" "#F31365" "#C3122F"


#Arricchimento su totale dei siti di legame di HIF1a nel genoma
computeMatrix reference-point --referencePoint center --missingDataAsZero --upstream 1000 --downstream 1000 -R /media/alessio/Data/hypoxia/HIF1A_datasets/HIF1a_all_putative_binding_sites.bed -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/C1A_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/C1D_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/C1G_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/K125A1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/K125D1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/K125G1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/C2A_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/C2D_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/C2G_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/K26A1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/K26D1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/K26G1_RPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/HIF1a_all_genomic_regions_H3K27ac_samples_signal_matrix.gz --numberOfProcessors 10 --smartLabels