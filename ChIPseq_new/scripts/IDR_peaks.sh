#!/bin/bash
sheet='/media/alessio/Data/hypoxia/ChIPseq_new/sheets/samplesheet_clones.csv'

source ~/.bashrc
source ~/miniconda3/etc/profile.d/conda.sh
conda activate IDR

sampledir='/media/alessio/Data/hypoxia/ChIPseq_new/samples'
outdir='/media/alessio/Data/hypoxia/ChIPseq_new/IDR_peaks'

mkdir -p "$outdir"

thr='0.1'

max_jobs=4
current_jobs=0

while IFS=',' read -r sample A B
    do

    echo "${sampledir}/${A}/${A}.${thr}_peaks.narrowPeak"
    (
    # first we must sort the narrowpeak file accordingly
    sort -k8,8nr "${sampledir}/${A}/${A}.${thr}_peaks.narrowPeak" > "${sampledir}/${A}/${A}.${thr}_peaks.sorted.narrowPeak" 
    sort -k8,8nr "${sampledir}/${B}/${B}.${thr}_peaks.narrowPeak" > "${sampledir}/${B}/${B}.${thr}_peaks.sorted.narrowPeak" 

    # IDR
    idr --samples \
        "${sampledir}/${A}/${A}.${thr}_peaks.sorted.narrowPeak" \
        "${sampledir}/${B}/${B}.${thr}_peaks.sorted.narrowPeak" \
        --input-file-type narrowPeak \
        --rank signal.value \
        --output-file "${outdir}/${sample}.${thr}.IDR_peaks.bed" \
        --plot \
        --log-output-file "${outdir}/${sample}.${thr}.IDR_peaks.log"

    ) & 
    
    ((current_jobs++))

    if (( current_jobs >= max_jobs )); then
        wait
        current_jobs=0
    fi

done < "$sheet"

