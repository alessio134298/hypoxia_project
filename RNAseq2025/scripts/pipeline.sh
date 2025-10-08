#!/bin/bash
samplesheet='/media/alessio/Data/hypoxia/RNAseq2025/sheets/samplesheet.csv'

path='/media/alessio/Data/hypoxia/RNAseq2025/'
path_fq='/media/alessio/Expansion/HN00254440/RawData/'
trimmed_fq='/media/alessio/Data/hypoxia/RNAseq2025/trimmed_fq'

n=10

# create directories
mkdir -p "${path}/fastqc" "${path}/multiqc" \
        "${path}/trimmed_fastqc" "${path}/trimmed_multiqc" 

#quality control
fastqc ${path_fq}/* -o "${path}/fastqc/" -t "$n" 
multiqc "${path}/fastqc/" -o "${path}/multiqc/"

# trimming
while IFS=',' read -r sample time clone group
    do
    
    trim_galore \
        --paired \
        "${path_fq}/${sample}_1.fastq.gz" \
        "${path_fq}/${sample}_2.fastq.gz" \
        -o "${trimmed_fq}" -j "$n"

done < "$samplesheet"


#quality control dopo trimming
#quality control
fastqc ${trimmed_fq}/* -o "${path}/trimmed_fastqc/" -t "$n"
multiqc "${path}/trimmed_fastqc/" -o "${path}/trimmed_multiqc/"

#SALMON
source ~/.bashrc
source ~/miniconda3/etc/profile.d/conda.sh 
conda activate salmon


#salmon quant
while IFS=',' read -r sample time clone
    do
    
    mkdir -p "${path}/salmon/${sample}"
    
    echo "Quasi-aligning with Salmon ${sample}"

    salmon quant \
        -i /media/alessio/Data/hg38_indexes/salmon_index/ \
        -l A \
        -1 "${trimmed_fq}/${sample}_1_val_1.fq.gz" \
        -2 "${trimmed_fq}/${sample}_2_val_2.fq.gz" \
        -p "$n" \
        --validateMappings \
        -o "${path}/salmon/${sample}"

done < "$samplesheet"
