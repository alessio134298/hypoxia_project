#!/bin/bash
SAMPLESHEET="/media/alessio/Data/hypoxia/ChIPseq_new/sheets/samplesheet_all_IP.csv"

n=10

source ~/.bashrc
source ~/miniconda3/etc/profile.d/conda.sh 
conda activate Deeptools

outdir="/media/alessio/Data/hypoxia/ChIPseq_new/samples"

########################
# bamCoverage bamCompare
########################

while IFS=',' read -r IP ab INPUT
    do

    echo $ip
    echo $input

    norm="RPGC"

    bamCoverage -b "${outdir}/${IP}/${IP}.filtered3.sorted.bam" \
    -o "${outdir}/${IP}/${IP}.bcov.${norm}.bw" -p $n \
    --binSize 20 \
    --normalizeUsing "$norm" \
    --effectiveGenomeSize 2913022398


    norm="RPKM"
    
    bamCompare -b1 "${outdir}/${IP}/${IP}.filtered3.sorted.bam" \
    -b2 "${outdir}/${INPUT}/${INPUT}.filtered3.sorted.bam" \
    -o "${outdir}/${IP}/${IP}.bcomp.${norm}.bw" -p $n \
    --binSize 20 \
    --normalizeUsing "${norm}" \
    --effectiveGenomeSize 2913022398 \
    --scaleFactorsMethod None
   
done < "$SAMPLESHEET"