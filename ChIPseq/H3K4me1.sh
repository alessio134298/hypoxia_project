# #peak calling solo su H3K27
# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1C/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1C/C1C

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1F/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1F/C1F

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1I/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1I/C1I

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125C1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125C1/K125C1

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125F1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125F1/K125F1

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125I1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125I1/K125I1

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2C/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2C/C2C

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2F/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2F/C2F

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2I/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2I/C2I

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K26C1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K26C1/K26C1

# #bamCompare
# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1C/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1C/C1C.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1F/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1F/C1F.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1I/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1I/C1I.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2C/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2C/C2C.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2F/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2F/C2F.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2I/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2I/C2I.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125C1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125C1/K125C1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125F1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125F1/K125F1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125I1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125I1/K125I1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K26C1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K26C1/K26C1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None


# #computeMatrix
# computeMatrix reference-point --referencePoint TSS --upstream 5000 --downstream 5000 --missingDataAsZero -R /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1C/C1C.bw  /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2F/C2F.bw        /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125I1/K125I1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1F/C1F.bw  /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2I/C2I.bw        /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K26C1/K26C1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1I/C1I.bw  /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125C1/K125C1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2C/C2C.bw  /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125F1/K125F1.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K4me1_matrix_compared.gz --numberOfProcessors 10

# #plotHeatmap
# plotProfile -m Deeptools_matrix/H3K4me1_matrix_compared.gz  -out H3K4me1_Profile.png --numPlotsPerRow 2 --plotTitle "H3K4me1" --perGroup --plotHeight 10 --plotWidth 15 

# #Chiamo superenhancer con Homer
# #Creo tag directories
# for dir in /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/*; do samplename=$(basename $dir); makeTagDirectory /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/"$samplename"_TagDir  "$dir"/human_only_sorted.bam -sspe; done

# #chiamo i SEs
# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1C_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1N_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1F_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1H6_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1I_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1H24_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125C1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125N_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125F1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125H6_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125I1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125H24_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2C_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2N_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2F_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2H6_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2I_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2H24_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26C1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26N_TagDir/ -style super -o auto


# #Faccio plotFingerprint per vedere la complessità delle library, raggruppo i diversi tempi di ipossia

# plotFingerprint -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1C/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2C/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125C1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K26C1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam --labels C1C C2C K125C1 K26C1 IC1N IC2N IK125N IK26N -T "H3K4ME1 Normoxia library complexity" --plotFile H3K4ME1_Normoxia_fingerprint.png --outRawCounts H3K4ME1_Normoxia_fingerprint_Rawcounts.tab -p 10

# plotFingerprint -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1F/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2F/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125F1/human_only_sorted.bam  /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/human_only_sorted.bam --labels C1F C2F K125F1 IC1H6 IC2H6 IK125H6 IK26H6 -T "H3K4ME1 6H hypoxia library complexity" --plotFile H3K4ME1_6H_hypoxia_fingerprint.png --outRawCounts H3K4ME1_6H_hypoxia_fingerprint_Rawcounts.tab -p 10 

# plotFingerprint -b /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1I/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2I/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125I1/human_only_sorted.bam  /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/human_only_sorted.bam --labels C1I C2I K125I1 IC1H24 IC2H24 IK125H24 IK26H24 -T "H3K4ME1 24H hypoxia library complexity" --plotFile H3K4ME1_24H_hypoxia_fingerprint.png --outRawCounts H3K4ME1_24H_hypoxia_fingerprint_Rawcounts.tab -p 10


# #rifaccio con RPKM
# #bamCompare
# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1C/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1C/C1C_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1F/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1F/C1F_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1I/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1I/C1I_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2C/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2C/C2C_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2F/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2F/C2F_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2I/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2I/C2I_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125C1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125C1/K125C1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125F1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125F1/K125F1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125I1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125I1/K125I1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K26C1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K26C1/K26C1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None


# #computeMatrix
# computeMatrix reference-point --referencePoint TSS --upstream 5000 --downstream 5000 --missingDataAsZero -R /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1C/C1C_RPKM.bw  /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2F/C2F_RPKM.bw        /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125I1/K125I1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1F/C1F_RPKM.bw  /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2I/C2I_RPKM.bw        /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K26C1/K26C1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C1I/C1I_RPKM.bw  /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125C1/K125C1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/C2C/C2C_RPKM.bw  /media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1/K125F1/K125F1_RPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K4me1_matrix_compared_RPKM.gz --numberOfProcessors 10

#plotProfile
plotProfile -m Deeptools_matrix/H3K4me1_matrix_compared_RPKM.gz  -out H3K4me1_Profile_RPKM.png --plotTitle "H3K4me1" --perGroup --plotHeight 10 --plotWidth 15 


#plotHeatmap
plotHeatmap -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H3K4me1_matrix_compared_RPKM.gz -o heatmap_H3K4me1_compare_RPKM.png