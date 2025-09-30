#!/bin/bash

source ~/.bashrc
source ~/miniconda3/etc/profile.d/conda.sh 
conda activate Deeptools


n=4

# H3K27ac
pathbed='/media/alessio/Data/hypoxia/ChIPseq/IDR/intersections_H4KO_Cas9/'
bed=(Common.peaks.H4KO.Cas9.H3K27ac.bed Cas9.exclusive.H3K27ac.bed H4KO.exclusive.H3K27ac.bed)
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
        -R "${bed_full[@]}" \
        -S "${bw_full[@]}" \
        -o "/media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/${mark}_normoxia_IDR_H4KO_Cas9_exclusive_peaks.gz" \
        -p $n && \

    # Plot heatmap
    plotHeatmap \
        -m "/media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/${mark}_normoxia_IDR_H4KO_Cas9_exclusive_peaks.gz" \
        -o "Figure_paper/H4KO_vs_Cas9/${mark}_normoxia_IDR_H4KO_Cas9_exclusive_peaks.png"
      
    plotProfile \
      -m "/media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/${mark}_normoxia_IDR_H4KO_Cas9_exclusive_peaks.gz" \
      -out "Figure_paper/H4KO_vs_Cas9/profile_${mark}_normoxia_IDR_H4KO_Cas9_exclusive_peaks.pdf" \
      --plotTitle "${mark} Normoxia" \
      --plotHeight 10 \
      --plotWidth 15 \
      --perGroup \
      --colors "#32004F" "#7323A8" "#F31365" "#C3122F"

) &



# H2BK120ac
pathbed='/media/alessio/Data/hypoxia/ChIPseq/IDR/intersections_H4KO_Cas9/'
bed=(Common.peaks.H4KO.Cas9.H2BK120ac.bed Cas9.exclusive.H2BK120ac.bed H4KO.exclusive.H2BK120ac.bed)
pathsamples='/media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC'
samples=(C1B C2B K125B1 K26B1)
bws=( "${samples[@]/%/_RPKM.bw}" )
mark='H2BK120ac'

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
        -R "${bed_full[@]}" \
        -S "${bw_full[@]}" \
        -o "/media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/${mark}_normoxia_IDR_H4KO_Cas9_exclusive_peaks.gz" \
        -p $n && \

    # Plot heatmap
    plotHeatmap \
        -m "/media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/${mark}_normoxia_IDR_H4KO_Cas9_exclusive_peaks.gz"\
        -o "Figure_paper/H4KO_vs_Cas9/${mark}_normoxia_IDR_H4KO_Cas9_exclusive_peaks.png"
    
    plotProfile \
      -m "/media/alessio/Data/hypoxia/ChIPseq/Deeptools_matrix/${mark}_normoxia_IDR_H4KO_Cas9_exclusive_peaks.gz" \
      -out "Figure_paper/H4KO_vs_Cas9/profile_${mark}_normoxia_IDR_H4KO_Cas9_exclusive_peaks.pdf" \
      --plotTitle "${mark} Normoxia" \
      --plotHeight 10 \
      --plotWidth 15 \
      --perGroup \
      --colors "#69B437" "#91DA73" "#165A54"  "#0E3338"
) &