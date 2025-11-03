#!/bin/bash

genome='/media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa'
path='/media/alessio/Data/hypoxia/RNAseq2025'
path_wf='/media/alessio/Data/hypoxia/RNAseq2025/work_files'
samples=(promoters_only_interaction_genes_up.bed promoters_only_interaction_genes_down.bed)
background=$(echo "${path_wf}/promoters_all_gtf_v45.bed")
motifs='/home/alessio/tools/Homer/data/knownTFs/HOCOMOCOv11_full_HUMAN_mono_homer_format.motifs'

echo $background

n=6
max_jobs=2
current_jobs=0

 
for sample in ${samples[@]}; do

    samplename=$(echo "$sample" | sed 's\.bed\\g')
    (
    findMotifsGenome.pl \
        "${path_wf}/${sample}" \
        "${genome}" \
        "${path}/motifs_analysis/${samplename}" \
        -size given \
        -p "$n" \
        -nomotif \
        -mknown "${motifs}" \
        -bg "${background}"
    ) & 
    
    ((current_jobs++))

    if (( current_jobs >= max_jobs )); then
        wait
        current_jobs=0
    fi
done