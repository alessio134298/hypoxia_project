#!/bin/bash

genome='/media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa'
path='/media/alessio/Data/hypoxia/ChIPseq_new'
samples=(H4KO_poised_to_active.bed H4KO_poised_to_active_with_HDAC4.bed)

n=6
max_jobs=2
current_jobs=0

for sample in ${samples[@]}; do
    
    samplename=$(echo "$sample" | sed 's\.bed\\g')
    (
    findMotifsGenome.pl \
        "${path}/poised_active_class/${sample}" \
        "${genome}" \
        "${path}/motifs_analysis/${samplename}" \
        -size given \
        -p "$n"

    bedtools getfasta \
        -fi "${genome}" \
        -bed "${path}/poised_active_class/${sample}" \
        > "${path}/motifs_analysis/${samplename}/${samplename}.fa" 
    ) &
    
    ((current_jobs++))

    if (( current_jobs >= max_jobs )); then
        wait
        current_jobs=0
    fi

done