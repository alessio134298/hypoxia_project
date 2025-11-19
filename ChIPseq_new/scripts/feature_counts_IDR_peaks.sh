#!/bin/bash
source ~/.bashrc
source ~/miniconda3/etc/profile.d/conda.sh
conda activate chip_atac

n=6

# Counts over consensus peakset H3K27ac
samplesheet="/media/alessio/Data/hypoxia/ChIPseq_new/sheets/samplesheet_all_IP.csv"
dir='/media/alessio/Data/hypoxia/ChIPseq_new/samples'

clones_sheet='/media/alessio/Data/hypoxia/ChIPseq_new/sheets/samplesheet_clones.csv'
IDR_dir='/media/alessio/Data/hypoxia/ChIPseq_new/IDR_peaks'
ext='.0.1.IDR_peaks.bed'

outdir='/media/alessio/Data/hypoxia/ChIPseq_new/analysis'


# BAMs
readarray -t samples_H3K27ac < <(cat "${samplesheet}" | grep 'H3K27AC' | awk -F ',' -v dir="$dir" '{print dir "/" $1 "/" $1 ".filtered3.sorted.bam"}')
readarray -t samples_H2BK120ac < <(cat "${samplesheet}" | grep 'H2BK120AC' | awk -F ',' -v dir="$dir" '{print dir "/" $1 "/" $1 ".filtered3.sorted.bam"}')

# IDR peaks
readarray -t peaks_H3K27ac < <(cat "${clones_sheet}" | grep 'H3K27AC' | awk -F ',' -v dir="$IDR_dir" -v ext="${ext}" '{print dir "/" $1 ext}')
readarray -t peaks_H2BK120ac < <(cat "${clones_sheet}" | grep 'H2BK120AC' | awk -F ',' -v dir="$IDR_dir" -v ext="${ext}" '{print dir "/" $1 ext}')

# create the consensus peakset
cat "${peaks_H3K27ac[@]}" | sort -k1,1 -k2,2n | bedtools merge -i - > "${outdir}/H3K27ac_consensus_peakset.bed"
cat "${peaks_H2BK120ac[@]}" | sort -k1,1 -k2,2n | bedtools merge -i - > "${outdir}/H2BK120ac_consensus_peakset.bed"

# convert to saf
awk 'BEGIN{OFS="\t"} {print "peak"NR, $1, $2, $3, "."}' "${outdir}/H3K27ac_consensus_peakset.bed" > "${outdir}/H3K27ac_consensus_peakset.saf"
awk 'BEGIN{OFS="\t"} {print "peak"NR, $1, $2, $3, "."}' "${outdir}/H2BK120ac_consensus_peakset.bed" > "${outdir}/H2BK120ac_consensus_peakset.saf"


for mark in H3K27ac H2BK120ac; do
    if [[ $mark == 'H3K27ac' ]]; then
        samples=("${samples_H3K27ac[@]}")
    else
        samples=("${samples_H2BK120ac[@]}")
    fi
        
        featureCounts -a "${outdir}/${mark}_consensus_peakset.saf" \
            -F SAF \
            -o "$outdir/counts_on_${mark}_IDR_peaks.txt" \
            -T $n \
            -p \
            -B \
            -C \
            "${samples[@]}"
    done