# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/C1B/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/C1B/C1B

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/C1E/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/C1E/C1E

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/C1H/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/C1H/C1H

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/K125B1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/K125B1/K125B1

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/K125E1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/K125E1/K125E1

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/K125H1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/K125H1/K125H1

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/C2B/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/C2B/C2B

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/C2E/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/C2E/C2E

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/C2H/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/C2H/C2H

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/K26B1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/K26B1/K26B1

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/K26E1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/K26E1/K26E1

# macs3 callpeak -t /media/alessio/Data/hypoxia/ChIPseq/samples/K26H1/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/human_only_sorted.bam -n /media/alessio/Data/hypoxia/ChIPseq/samples/K26H1/K26H1

# #bamCompare
# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/C1B/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/C1B/C1B.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/C1E/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/C1E/C1E.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/C1H/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/C1H/C1H.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/C2B/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/C2B/C2B.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/C2E/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/C2E/C2E.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/C2H/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/C2H/C2H.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/K125B1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/K125B1/K125B1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/K125E1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/K125E1/K125E1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/K125H1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/K125H1/K125H1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/K26B1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/K26B1/K26B1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/K26E1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/K26E1/K26E1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/K26H1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/K26H1/K26H1.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# #computeMatrix
# computeMatrix reference-point --referencePoint TSS --upstream 5000 --downstream 5000 --missingDataAsZero -R /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120ac/C1B/C1B.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120ac/C1E/C1E.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120ac/C1H/C1H.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120ac/C2B/C2B.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120ac/C2E/C2E.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120ac/C2H/C2H.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120ac/K125B1/K125B1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120ac/K125E1/K125E1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120ac/K125H1/K125H1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120ac/K26B1/K26B1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120ac/K26E1/K26E1.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120ac/K26H1/K26H1.bw -o /media/alessio/Data/hypoxia/ChIPseq/H2BK120ac_matrix_compared.gz --numberOfProcessors 10

# #plot Heatmap
# plotHeatmap -m H2BK120ac_matrix_compared.gz -o heatmap_H2BK120ac.pdf

# #Ploteprofile
# plotProfile -m Deeptools_matrix/H2BK120ac_matrix_compared.gz  -out H2BK120ac_Profile.png --numPlotsPerRow 2 --plotTitle "H2BK120ac" --perGroup --plotHeight 10 --plotWidth 15 

# #Chiamo superenhancer con Homer
# #Creo tag directories
# for dir in /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/*; do samplename=$(basename $dir); makeTagDirectory /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/"$samplename"_TagDir  "$dir"/human_only_sorted.bam -sspe; done

# #anche per gli input
# for dir in /media/alessio/Data/hypoxia/ChIPseq/samples/I*; do samplename=$(basename $dir); makeTagDirectory /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/"$samplename"_TagDir  "$dir"/human_only_sorted.bam -sspe; done

# #chiamo i SEs
# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1B_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1N_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1E_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1H6_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1H_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1H24_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125B1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125N_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125E1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125H6_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125H1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125H24_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2B_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2N_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2E_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2H6_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2H_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2H24_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26B1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26N_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26E1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26H6_TagDir/ -style super -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26H1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26H24_TagDir/ -style super -o auto

# #Chiamo anche i Picchi normalmente (in modalità histone), per poter fare un confronto (i file output si chiamano regions.txt)
# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1B_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1N_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1E_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1H6_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1H_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1H24_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125B1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125N_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125E1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125H6_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125H1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125H24_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2B_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2N_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2E_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2H6_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2H_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2H24_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26B1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26N_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26E1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26H6_TagDir/ -style histone -o auto

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26H1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26H24_TagDir/ -style histone -o auto

# #rinomino tutti i regions.txt in peaks.txt (per evitare di confondermi più avanti)



# #Faccio plotFingerprint per vedere la complessità delle library, raggruppo i diversi tempi di ipossia

# plotFingerprint -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1B/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2B/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125B1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26B1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam --labels C1B C2B K125B1 K26B1 IC1N IC2N IK125N IK26N -T "H2KB120ac Normoxia library complexity" --plotFile H2KB120ac_Normoxia_fingerprint.png --outRawCounts H2KB120ac_Normoxia_fingerprint_Rawcounts.tab -p 10

# plotFingerprint -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1E/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2E/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125E1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26E1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/human_only_sorted.bam --labels C1E C2E K125E1 K26E1 IC1H6 IC2H6 IK125H6 IK26H6 -T "H2KB120ac 6H hypoxia library complexity" --plotFile H2KB120ac_6H_hypoxia_fingerprint.png --outRawCounts H2KB120ac_6H_hypoxia_fingerprint_Rawcounts.tab -p 10 

# plotFingerprint -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1H/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2H/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125H1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26H1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/human_only_sorted.bam --labels C1H C2H K125H1 K26H1 IC1H24 IC2H24 IK125H24 IK26H24 -T "H2KB120ac 24H hypoxia library complexity" --plotFile H2KB120ac_24H_hypoxia_fingerprint.png --outRawCounts H2KB120ac_24H_hypoxia_fingerprint_Rawcounts.tab -p 10

# #rifaccio i Bigwig con RPKM normalization
# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1B/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1B/C1B_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1E/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1E/C1E_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1H/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1H/C1H_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2B/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2B/C2B_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2E/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2E/C2E_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2H/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2H/C2H_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125B1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125B1/K125B1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125E1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125E1/K125E1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125H1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125H1/K125H1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26B1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26B1/K26B1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26E1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26E1/K26E1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# bamCompare -b1 /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26H1/human_only_sorted.bam -b2 /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26H1/K26H1_RPKM.bw --binSize 20 --normalizeUsing RPKM --smoothLength 60 --centerReads -p 10 --scaleFactorsMethod None

# computeMatrix reference-point --referencePoint TSS --upstream 5000 --downstream 5000 --missingDataAsZero -R /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1B/C1B_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1E/C1E_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1H/C1H_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2B/C2B_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2E/C2E_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2H/C2H_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125B1/K125B1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125E1/K125E1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125H1/K125H1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26B1/K26B1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26E1/K26E1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26H1/K26H1_RPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H2BK120ac_matrix_compared_RPKM.gz --numberOfProcessors 10

# plotHeatmap -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H2BK120ac_matrix_compared_RPKM.gz -o heatmap_H2BK120ac_compared_RPKM.png

# plotProfile -m Deeptools_matrix/H2BK120ac_matrix_compared_RPKM.gz  -out H2BK120ac_Profile.png --plotTitle "H2BK120ac" --perGroup --plotHeight 10 --plotWidth 15 




# #BigWigAverage (per ora solo su normoxia)
# bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1B/C1B_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2B/C2B_RPKM.bw -o BigWigAverage/H2BK120ac/CAS9_normoxia_H2BK120ac_averaged.bw -p 10

# bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125B1/K125B1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26B1/K26B1_RPKM.bw -o BigWigAverage/H2BK120ac/H4KO_normoxia_H2BK120ac_averaged.bw -p 10


# #profili di arricchiento su regioni di HDAC4 (dati di ChIP atlas), sia sulle regioni totali che su quelle solo di SKUT1
# computeMatrix reference-point --referencePoint center --missingDataAsZero --upstream 5000 --downstream 5000 -R /media/alessio/Data/hypoxia/ChIPseq/ChIP_atlas_files/HDAC4.ChIP.SKUT1.WT.bed /media/alessio/Data/hypoxia/ChIPseq/ChIP_atlas_files/Oth.Utr.05.HDAC4.AllCell.bed -S /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H2BK120ac/CAS9_normoxia_H2BK120ac_averaged.bw /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H2BK120ac/H4KO_normoxia_H2BK120ac_averaged.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/Normoxia_H2BK120ac_on_HDAC4_ChIP_atlas_regions.gz --numberOfProcessors 10 --smartLabels

# plotProfile -m Deeptools_matrix/Normoxia_H2BK120ac_on_HDAC4_ChIP_atlas_regions.gz   -out H2BK120ac_Normoxia_HDAC4_Bindingsites_Profile.png --numPlotsPerRow 2 --plotTitle "H2BK120ac peaks on HDAC4 binding sites" --perGroup --plotHeight 10 --plotWidth 15 

# #BigWigAverage (24 ore di ipossia)
# bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1H/C1H_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2H/C2H_RPKM.bw -o BigWigAverage/H2BK120ac/CAS9_24h_hypoxia_H2BK120ac_averaged.bw -p 10

# bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125H1/K125H1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26H1/K26H1_RPKM.bw -o BigWigAverage/H2BK120ac/H4KO_24h_hypoxia_H2BK120ac_averaged.bw -p 10


# #profili di arricchiento su regioni di HDAC4 (dati di ChIP atlas), sia sulle regioni totali che su quelle solo di SKUT1
# computeMatrix reference-point --referencePoint center --missingDataAsZero --upstream 5000 --downstream 5000 -R /media/alessio/Data/hypoxia/ChIPseq/ChIP_atlas_files/HDAC4.ChIP.SKUT1.WT.bed /media/alessio/Data/hypoxia/ChIPseq/ChIP_atlas_files/Oth.Utr.05.HDAC4.AllCell.bed -S /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H2BK120ac/CAS9_24h_hypoxia_H2BK120ac_averaged.bw /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H2BK120ac/H4KO_24h_hypoxia_H2BK120ac_averaged.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/24h_hypoxia_H2BK120ac_on_HDAC4_ChIP_atlas_regions.gz --numberOfProcessors 10 --smartLabels

# plotProfile -m Deeptools_matrix/24h_hypoxia_H2BK120ac_on_HDAC4_ChIP_atlas_regions.gz   -out H2BK120ac_24h_hypoxia_HDAC4_Bindingsites_Profile.png --numPlotsPerRow 2 --plotTitle "H2BK120ac peaks on HDAC4 binding sites" --perGroup --plotHeight 10 --plotWidth 15 


# #Chiamo gli enhancers con HOMER, stavolta chiamo sia i Super che i Typical, in più uso l'opzione superslpe -1000 per includere tutti i potenziali SEs e -L 0

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1B_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1N_TagDir/ -style super -superSlope -1000  -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1B_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1E_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1H6_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1E_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1H_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC1H24_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C1H_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125B1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125N_TagDir/ -style super -superSlope -1000 -L 0  -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125B1_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125E1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125H6_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125E1_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125H1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK125H24_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K125H1_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2B_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2N_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2B_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2E_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2H6_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2E_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2H_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IC2H24_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/C2H_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26B1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26N_TagDir/ -style super -superSlope -1000 -L 0 -o  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26B1_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26E1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26H6_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26E1_TagDir/SEs.txt 

# findPeaks  /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26H1_TagDir/ -i /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/IK26H24_TagDir/ -style super -superSlope -1000 -L 0 -o /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/K26H1_TagDir/SEs.txt


# #scaleregions
# computeMatrix scale-regions -b 3000 -a 3000  --regionBodyLength 5000 --missingDataAsZero -R /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf -S /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1B/C1B_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1E/C1E_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1H/C1H_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2B/C2B_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2E/C2E_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2H/C2H_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125B1/K125B1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125E1/K125E1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125H1/K125H1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26B1/K26B1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26E1/K26E1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26H1/K26H1_RPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H2BK120ac_matrix_compared_RPKM_scaleregions.gz --numberOfProcessors 8

# plotProfile -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H2BK120ac_matrix_compared_RPKM_scaleregions.gz  -out H2BK120ac_scaleregions.png --plotTitle "H2BK120ac" --perGroup --plotHeight 10 --plotWidth 15 


# # Matrice solo normossia (Per paper)
# # computeMatrixOperations subset -m Deeptools_matrix/H2BK120ac_matrix_compared_RPKM.gz -o Deeptools_matrix/H2BK120ac_matrix_compared_RPKM_onlyNormoxia.gz --samples C1B_RPKM  C2B_RPKM  K125B1_RPKM  K26B1_RPKM 

# plotProfile -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H2BK120ac_matrix_compared_RPKM_onlyNormoxia.gz  -out H2BK120ac_normoxia.png --plotTitle "H2BK120ac Normoxia" --plotHeight 10 --plotWidth 15 --perGroup --colors "#69B437" "#91DA73" "#165A54"  "#0E3338"

# plotProfile -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H2BK120ac_matrix_compared_RPKM_onlyNormoxia.gz  -out H2BK120ac_normoxia_nolabels.png --plotTitle "H2BK120ac Normoxia" --plotHeight 10 --plotWidth 15 --perGroup --colors "#69B437" "#91DA73" "#165A54"  "#0E3338" --samplesLabel " " " " " " " " 

# plotHeatmap -m /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H2BK120ac_matrix_compared_RPKM_onlyNormoxia.gz -o Heatmap_H2BK120ac_normoxia.png

# #rifaccio profili di arricchimento su segnali di ChIP di HDAC4 (uso i bigwig RPKM e non quelli fatti con BigWigAverage)
# #Normoxia
# computeMatrix reference-point --referencePoint center --missingDataAsZero --upstream 10000 --downstream 10000 -R /media/alessio/Data/NAR2020_Cb/GSM3882325_HDAC4_DMSO_SKUT_peaks.narrowPeak -S /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1B/C1B_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2B/C2B_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125B1/K125B1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26B1/K26B1_RPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/Normoxia_H2BK120AC_on_HDAC4_Nar2020cb.gz --numberOfProcessors 10 --smartLabels

# plotProfile -m Deeptools_matrix/Normoxia_H2BK120AC_on_HDAC4_Nar2020cb.gz  -out H2BK120AC_Normoxia_HDAC4_Bindingsites_Profile.png --numPlotsPerRow 2 --plotTitle "Normoxia H2BK120AC peaks on HDAC4 binding sites" --perGroup --plotHeight 10 --plotWidth 15 --colors "#69B437" "#91DA73" "#165A54"  "#0E3338"

# #24H
# computeMatrix reference-point --referencePoint cneter --missingDataAsZero --upstream 10000 --downstream 10000 -R /media/alessio/Data/NAR2020_Cb/GSM3882325_HDAC4_DMSO_SKUT_peaks.narrowPeak -S /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1H/C1H_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2H/C2H_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125H1/K125H1_RPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26H1/K26H1_RPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/H24_H2BK120AC_on_HDAC4_Nar2020cb.gz --numberOfProcessors 10 --smartLabels

# plotProfile -m Deeptools_matrix/H24_H2BK120AC_on_HDAC4_Nar2020cb.gz  -out H2BK120AC_H24_HDAC4_Bindingsites_Profile.png --numPlotsPerRow 2 --plotTitle "H24 H2BK120AC peaks on HDAC4 binding sites" --perGroup --plotHeight 10 --plotWidth 15 --colors "#69B437" "#91DA73" "#165A54"  "#0E3338"


#BigwigAverage sui bigwig fatti con bamcoverage (solo normoxia)
bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1B/C1B.bamCoverageRPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2B/C2B.bamCoverageRPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H2BK120ac/bamCoverage/CAS9_normoxia_H2BK120ac.bw -p 10

bigwigAverage -b /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125B1/K125B1.bamCoverageRPKM.bw /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26B1/K26B1.bamCoverageRPKM.bw -o /media/alessio/Data/hypoxia/ChIPseq/BigWigAverage/H2BK120ac/bamCoverage/H4KO_normoxia_H2BK120ac.bw -p 10