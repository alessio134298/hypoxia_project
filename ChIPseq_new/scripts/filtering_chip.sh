#!/bin/bash
SAMPLESHEET="/media/alessio/Data/hypoxia/ChIPseq_new/sheets/samplesheet_all.csv"

max_jobs=4
current_jobs=0

source ~/.bashrc
source ~/miniconda3/etc/profile.d/conda.sh 
conda activate chip_atac

outdir="/media/alessio/Data/hypoxia/ChIPseq_new"

chr=$(echo chr{1..22} chrM chrX chrY)


while IFS=',' read -r sample antibody bam
    do
    (
    mkdir -p "${outdir}/samples/${sample}"

    echo "Filtering of ${sample}"

    # Need to do this to make picard work
    # This is why appaerently bwa does not put this info
    samtools addreplacerg \
    -r "@RG\tID:${sample}_RG\tSM:${sample}\tPL:Illumina\tLB:hg38.fa" \
    -o "${outdir}/samples/${sample}/${sample}.sorted.Ag.bam" \
    "${bam}"

    samtools index -@ 6 "${outdir}/samples/${sample}/${sample}.sorted.Ag.bam"

    # Remove blacklisted regions
    bedtools intersect -v -abam "${outdir}/samples/${sample}/${sample}.sorted.Ag.bam" \
    -b /media/alessio/Data/genome110/hg38-blacklist.v2.bed \
    > "${outdir}/samples/${sample}/${sample}.nobkls.bam"

    # PCR Duplicate removal
    picard MarkDuplicates -I "${outdir}/samples/${sample}/${sample}.nobkls.bam" \
    -O "${outdir}/samples/${sample}/${sample}.RMdup.bam" \
    -M "${outdir}/samples/${sample}/${sample}.marked_dup_metrics.txt" \
    -REMOVE_DUPLICATES true

    # Other filtering
    # Minimum MAPQ score of 30
    # Keep only properly paired reads (2)
    # Exclude secondary (0x100), unmapped (0x4), supplementary (0x800)
    # Keep only some the useful chromosomes
    samtools index -@ 6 "${outdir}/samples/${sample}/${sample}.RMdup.bam"

    samtools view -b "${outdir}/samples/${sample}/${sample}.RMdup.bam" \
    -q 30 -f 2 -F 0x904 ${chr} -@ 6 > \
    "${outdir}/samples/${sample}/${sample}.filtered.bam"

    # Other filtering passages, better remove if insert size is more than 2000
    bamtools filter -in "${outdir}/samples/${sample}/${sample}.filtered.bam" \
    -insertSize "< 2000" \
    -isMapped true \
    -out "${outdir}/samples/${sample}/${sample}.filtered2.bam"

    # Delete read with mate aligned on another chromosome and not in FR orientation
    # NEED tp be sorted by name
    samtools sort -n -@ 6 "${outdir}/samples/${sample}/${sample}.filtered2.bam" \
    -o "${outdir}/samples/${sample}/${sample}.filtered2.sortedbyname.bam" -@ 6

    python /media/alessio/Seagate/mef2d/scripts/pysam_filtering.py "${outdir}/samples/${sample}/${sample}.filtered2.sortedbyname.bam" \
    "${outdir}/samples/${sample}/${sample}.filtered3.sortedbyname.bam" --only_fr_pairs

    samtools sort -@ 6 "${outdir}/samples/${sample}/${sample}.filtered3.sortedbyname.bam" \
    -o "${outdir}/samples/${sample}/${sample}.filtered3.sorted.bam"

    samtools index -@ 6 "${outdir}/samples/${sample}/${sample}.filtered3.sorted.bam"

    # Estimate library complexity
    picard EstimateLibraryComplexity I="${outdir}/samples/${sample}/${sample}.filtered3.sorted.bam" \
    O="${outdir}/samples/${sample}/${sample}.est_lib_complex_metrics.txt"


    # samtools statistics for both initial bam and filtered 
    mkdir -p "${outdir}/samples/${sample}/stats"

    samtools idxstats "${outdir}/samples/${sample}/${sample}.sorted.Ag.bam" \
    > "${outdir}/samples/${sample}/stats/${sample}.sorted.Ag.idxstats"

    samtools flagstat "${outdir}/samples/${sample}/${sample}.sorted.Ag.bam" \
    > "${outdir}/samples/${sample}/stats/${sample}.sorted.Ag.flagstat"

    samtools stats "${outdir}/samples/${sample}/${sample}.sorted.Ag.bam" \
    > "${outdir}/samples/${sample}/stats/${sample}.sorted.Ag.stats"

    samtools idxstats "${outdir}/samples/${sample}/${sample}.filtered3.sorted.bam" \
    > "${outdir}/samples/${sample}/stats/${sample}.filtered3.idxstats"

    samtools flagstat "${outdir}/samples/${sample}/${sample}.filtered3.sorted.bam" \
    > "${outdir}/samples/${sample}/stats/${sample}.filtered3.flagstat"

    samtools stats "${outdir}/samples/${sample}/${sample}.filtered3.sorted.bam" \
    > "${outdir}/samples/${sample}/stats/${sample}.filtered3.stats"

    touch "${outdir}/samples/${sample}/stats/reads.txt"

    count=$(samtools view -c "${outdir}/samples/${sample}/${sample}.sorted.Ag.bam" -@ 6)
    echo "Reads_raw_alignment\t${count}" >> "${outdir}/samples/${sample}/stats/reads.txt"
    count=$(samtools view -c "${outdir}/samples/${sample}/${sample}.filtered3.sorted.bam" -@ 6)
    echo "Reads_filtered_alignment\t${count}" >> "${outdir}/samples/${sample}/stats/reads.txt"

    # Remove all the intermediate files, we keep only the original sorted
    # with the read descriptor added and the final filtred

    rm \
    "${outdir}/samples/${sample}/${sample}.nobkls.bam" \
    "${outdir}/samples/${sample}/${sample}.RMdup.bam" \
    "${outdir}/samples/${sample}/${sample}.RMdup.bam.bai" \
    "${outdir}/samples/${sample}/${sample}.filtered.bam" \
    "${outdir}/samples/${sample}/${sample}.filtered2.bam" \
    "${outdir}/samples/${sample}/${sample}.filtered2.sortedbyname.bam" \
    "${outdir}/samples/${sample}/${sample}.filtered3.sortedbyname.bam"

    echo "Filtering completed ${sample}"

    ) &
    
    ((current_jobs++))

    if (( current_jobs >= max_jobs )); then
        wait
        current_jobs=0
    fi

    
done < "$SAMPLESHEET"

