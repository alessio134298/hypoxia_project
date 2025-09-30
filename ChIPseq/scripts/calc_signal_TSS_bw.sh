#!/bin/bash

path="/media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC"

cp /media/alessio/Data/genome110/gencode/Gencode_V44_TSS_withheader.bed /media/alessio/Data/hypoxia/ChIPseq/TSS_bw_signal.bed

for sample in C1A C2A K125A1 K26A1
    do
    python /media/alessio/Data/hypoxia/ChIPseq/scripts/Calculate_Bw_signal_on_bed.py \
    ${path}/${sample}/${sample}_RPKM.bw \
    /media/alessio/Data/hypoxia/ChIPseq/TSS_bw_signal.bed \
    ${sample}_RPKM.bw

done

path="/media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC"

for sample in  C1B C2B K125B1 K26B1
    do
    python /media/alessio/Data/hypoxia/ChIPseq/scripts/Calculate_Bw_signal_on_bed.py \
    ${path}/${sample}/${sample}_RPKM.bw \
    /media/alessio/Data/hypoxia/ChIPseq/TSS_bw_signal.bed \
    ${sample}_RPKM.bw

done
