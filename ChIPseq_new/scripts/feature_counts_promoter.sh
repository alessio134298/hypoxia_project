#!/bin/bash
source ~/.bashrc
source ~/miniconda3/etc/profile.d/conda.sh
conda activate chip_atac

n=6

# counts on promoters
promoters='/media/alessio/Data/hypoxia/RNAseq2025/work_files/promoters_all_gtf_v45_3000.bed'
sheet='/media/alessio/Data/hypoxia/ChIPseq_new/sheets/samplesheet_all_IP.csv'
dir='/media/alessio/Data/hypoxia/ChIPseq_new/samples'
outdir='/media/alessio/Data/hypoxia/ChIPseq_new/analysis'

readarray -t samples < <(cat "${sheet}" | awk -F ',' -v dir="$dir" '{print dir "/" $1 "/" $1 ".filtered3.sorted.bam"}')

cat "$promoters" | sort -k1,1 -k2,2n | awk 'BEGIN{OFS="\t"} {print $4, $1, $2, $3, "."}' > "$outdir/promoters_all_gtf_v45_3000.saf"

featureCounts -a "$outdir/promoters_all_gtf_v45_3000.saf" \
            -F SAF \
            -o "$outdir/All_samples_counts_on_promoters.txt" \
            -T $n \
            -p \
            -B \
            -C \
            "${samples[@]}"

