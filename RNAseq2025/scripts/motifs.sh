#!/bin/bash

genome='/media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa'
path='/media/alessio/Data/hypoxia/RNAseq2025'
path_wf='/media/alessio/Data/hypoxia/RNAseq2025/work_files'
samples=(promoters_only_interaction_genes_up.bed promoters_only_interaction_genes_down.bed promoters_only_interaction_genes_both.bed)
background=$(echo "${path_wf}/promoters_all_gtf_v45.bed")
motifs='/home/alessio/tools/Homer/data/knownTFs/HOCOMOCOv11_full_HUMAN_mono_homer_format.motifs'

n=3
max_jobs=3
current_jobs=0

# # homer
# for sample in ${samples[@]}; do

#     samplename=$(echo "$sample" | sed 's\.bed\\g')
#     (
#     findMotifsGenome.pl \
#         "${path_wf}/${sample}" \
#         "${genome}" \
#         "${path}/motifs_analysis/${samplename}" \
#         -size given \
#         -p "$n" \
#         -mknown "${motifs}"
#         # -bg "${background}"
#     ) & 
    
#     ((current_jobs++))

#     if (( current_jobs >= max_jobs )); then
#         wait
#         current_jobs=0
#     fi
# done



# ame + fimo
motifs='/media/alessio/Data/hypoxia/ChIPseq/Motifs_analysis/Databases/motif_databases/HUMAN/HOCOMOCOv11_full_HUMAN_mono_meme_format.meme'
background_fasta=$(echo "${path_wf}/promoters_all_gtf_v45.fa")

for sample in ${samples[@]}; do

    samplename=$(echo "$sample" | sed 's\.bed\\g')

    echo "${sample}"
    echo "${samplename}"
    mkdir -p "${path}/motifs_analysis/${samplename}"
    (
    
    bedtools getfasta \
        -fi "${genome}" \
        -bed "${path_wf}/${sample}" \
        > "${path_wf}/${samplename}.fa"     
    
    # ame with shuffled input
    ame \
        --oc "${path}/motifs_analysis/${samplename}/ame_shuffle" \
        --control --shuffle-- \
        "${path_wf}/${samplename}.fa" \
        "${motifs}"
    
    # ame with background as all promoters
    ame \
        --oc "${path}/motifs_analysis/${samplename}/ame_promotersBg" \
        --control "${background_fasta}" \
        "${path_wf}/${samplename}.fa" \
        "${motifs}"
    
    # fimo
    fimo \
        --oc "${path}/motifs_analysis/${samplename}/fimo" \
        "${motifs}" \
        "${path_wf}/${samplename}.fa"
        
    ) & 
    
    ((current_jobs++))

    if (( current_jobs >= max_jobs )); then
        wait
        current_jobs=0
    fi
done