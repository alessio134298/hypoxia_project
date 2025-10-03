#!/bin/bash
SAMPLESHEET="/media/alessio/Data/hypoxia/ChIPseq_new/sheets/samplesheet_all_IP.csv"

source ~/.bashrc
source ~/miniconda3/etc/profile.d/conda.sh 
conda activate chip_atac

outdir="/media/alessio/Data/hypoxia/ChIPseq_new/samples"

################
# Macs3 callpeak
################

max_jobs=4
current_jobs=0

Relaxedq=0.1
Normalq=0.05

while IFS=',' read -r IP ab INPUT
    do
    (
    for q in ${Relaxedq} ${Normalq}
        do

        echo "macs3 calling peak with q: ${q} for sample ${IP}"
        
        macs3 callpeak \
            -t "${outdir}/${IP}/${IP}.filtered3.sorted.bam" \
            -c "${outdir}/${INPUT}/${INPUT}.filtered3.sorted.bam" \
            -n "${outdir}/${IP}/${IP}.${q}" \
            -f BAMPE \
            -g hs \
            -q ${q}
    done
    ) &
    
    ((current_jobs++))

    if (( current_jobs >= max_jobs )); then
        wait
        current_jobs=0
    fi

done < "$SAMPLESHEET"
