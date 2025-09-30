#!/bin/bash

source ~/.bashrc
source ~/miniconda3/etc/profile.d/conda.sh 
conda activate Deeptools

# H3K27ac normoxia matrix with IDR peak files and the diffbind consensus matrix
pathbed='/media/alessio/Data/hypoxia/ChIPseq/IDR/IDR_H3K27AC/idr_results'
bed=(Cas9_normoxia_IDR_consensus.bed H4KO_normoxia_IDR_consensus.bed)
pathsamples='/media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC'
samples=(C1A C2A K125A1 K26A1)
bws=( "${samples[@]/%/_RPKM.bw}" )
mark='H3K27ac'

# Full paths for BED files
bed_full=("${bed[@]/#/$pathbed}")

# Full paths for bigwig files
bw_full=()
for s in "${samples[@]}"; do
  bw_full+=("${pathsamples}/${s}/${s}_RPKM.bw")
done

(
    computeMatrix reference-point \
        --referencePoint center \
        --upstream 5000 --downstream 5000 \
        --missingDataAsZero \
        -R "${bed_full[@]}" "/media/alessio/Data/hypoxia/ChIPseq/DiffBind_matrix_scaffolds_${mark}/DiffBind_matrix_anno.bed" \
        -S "${bw_full[@]}" \
        -o "/media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/${mark}_normoxia_IDR_and_Diffbind_peaks_matrix.gz" \
        -p 6 && \

    # Plot heatmap
    plotHeatmap \
        -m "/media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/${mark}_normoxia_IDR_and_Diffbind_peaks_matrix.gz"\
        -o ${mark}_normoxia_IDR_and_Diffbind_peaks_matrix.png 
) &

# H2BK120ac normoxia matrix with IDR peak files and the diffbind consensus matrix
pathbed='/media/alessio/Data/hypoxia/ChIPseq/IDR/IDR_H2BK120AC/idr_results'
bed=(Cas9_normoxia_IDR_consensus.bed H4KO_normoxia_IDR_consensus.bed)
pathsamples='/media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC'
samples=(C1B C2B K125B1 K26B1)
bws=( "${samples[@]/%/_RPKM.bw}" )
mark='H2BK120ac'

# Full paths for BED files
bed_full=("${bed[@]/#/$pathbed/}")

# Full paths for bigwig files
bw_full=()
for s in "${samples[@]}"; do
  bw_full+=("${pathsamples}/${s}/${s}_RPKM.bw")
done

(
    computeMatrix reference-point \
        --referencePoint center \
        --upstream 5000 --downstream 5000 \
        --missingDataAsZero \
        -R "${bed_full[@]}" "/media/alessio/Data/hypoxia/ChIPseq/DiffBind_matrix_scaffolds_${mark}/DiffBind_matrix_anno.bed" \
        -S "${bw_full[@]}" \
        -o "/media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/${mark}_normoxia_IDR_and_Diffbind_peaks_matrix.gz" \
        -p 6 && \

    plotHeatmap \
        -m "/media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/${mark}_normoxia_IDR_and_Diffbind_peaks_matrix.gz" \
        -o "${mark}_normoxia_IDR_and_Diffbind_peaks_matrix.png" 
) &