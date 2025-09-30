#!/bin/bash
SAMPLESHEET='/media/alessio/Data/hypoxia/ChIPseq/H3K4me1_samplesheet.csv'

source ~/.bashrc

FOLDER='/media/alessio/Data/hypoxia/ChIPseq/samples/H3K4ME1'

while IFS=',' read -r sample chip input
    do

    mkdir -p ${FOLDER}/${sample}/logs

    echo ${sample} ${chip} ${input}
    
    macs3 callpeak -t ${chip} -c ${input} \
    --outdir ${FOLDER}/${sample} \
    --name ${sample}_q \
    -f BAMPE -g hs --broad --broad-cutoff 0.1 -q 0.05 2>> ${FOLDER}/${sample}/logs/macs3_boradpeak.log

done < ${SAMPLESHEET}


