# !bin/bash/

md5sum --check md5sum.txt
#ok

#fastqc
fastqc /media/alessio/Data/hypoxia/ChIPseq/RawFASTQ/* -o /media/alessio/Data/hypoxia/ChIPseq/fastqc/ -t 2

#multiqc
multiqc /media/alessio/Data/hypoxia/ChIPseq/fastqc/ -o multiqc_report

#riscarico genom umano da ucsc 
wget https://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz
gzip -d hg38.fa.gz 

#scarico genoma di drosophila
wget https://hgdownload.soe.ucsc.edu/goldenPath/dm6/bigZips/dm6.fa.gz
gzip -d dm6.fa.gz 

#creo un genoma ibrido (https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8313745/)
sed 's/chr/dm6_chr/g' dm6.fa > dm6_renameID.fa
cat hg38.fa dm6_renameID.fa > hg38_dm6.fa

#indice di bowtie2 su hg38+dm6
/home/alessio/tools/bowtie2-2.5.3/bowtie2-build /media/alessio/Data/genome_dm6/hg38_dm6.fa /media/alessio/Data/hg38+dm6_index/hg38_dm6 --threads 10

#allineamento
for sample in /media/alessio/Data/hypoxia/ChIPseq/RawFASTQ/*_1.fastq.gz; do samplename=$(basename "$sample" | awk -F "_1" '{print $1}'); mkdir /media/alessio/Data/hypoxia/ChIPseq/"$samplename"; /home/alessio/tools/bowtie2-2.5.3/bowtie2 -x /media/alessio/Data/hg38+dm6_index/hg38_dm6 -1 /media/alessio/Data/hypoxia/ChIPseq/RawFASTQ/"$samplename"_1.fastq.gz -2 /media/alessio/Data/hypoxia/ChIPseq/RawFASTQ/"$samplename"_2.fastq.gz --threads 14 | samtools view -Sbh - > /media/alessio/Data/hypoxia/ChIPseq/"$samplename"/bowtie2_align.bam; done


bowtie2 --threads 4 -x ./database/GRCh38_dm6 -U Jurkat_K79_00p_Rep1_SRR1536557.fastq.gz | samtools view -Sbh - > Jurkat_K79_00p_Rep1_SRR1536557.bam

#sorting
for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/*; do samtools sort -@ 14 "$sample"/bowtie2_align.bam > "$sample"/bowtie2_sorted.bam; done

#index
for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/*; do samtools index -@ 4 "$sample"/bowtie2_sorted.bam; done



#separo le reads di drosophila
grep ">" dm6_renameID.fa | sed 's/>//g' > droso_chrnamez.txt

for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/*; do samtools view -@ 8 "$sample"/bowtie2_sorted.bam $(cat /media/alessio/Data/genome_dm6/droso_chrnamez.txt) -f 2 -bh -o "$sample"/droso_only.bam; done


#separo le reads human
grep ">" hg38.fa | sed 's/>//g' > human_chrnamez.txt

for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/*; do samtools view -@ 8 $sample/bowtie2_sorted.bam $(cat /media/alessio/Data/genome_dm6/human_chrnamez.txt) -f 2 -bh -o "$sample"/human_only.bam; done

#separo le reads human anche per gli input
for sample in /media/alessio/Data/hypoxia/ChIPseq/controls/*; do samtools view -@ 8 $sample/bowtie2_sorted.bam $(cat /media/alessio/Data/genome_dm6/human_chrnamez.txt) -f 2 -bh -o "$sample"/human_only.bam; done

#rimetto i camioni insieme
mv controls/* samples/


#sorting e indexing
for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/*; do samtools sort -@ 10 "$sample"/human_only.bam -o "$sample"/human_only_sorted.bam; done
for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/*; do samtools sort -@ 10 "$sample"/droso_only.bam -o "$sample"/droso_only_sorted.bam; done
for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/*; do samtools index -@ 10 "$sample"/human_only_sorted.bam; done
for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/*; do samtools index -@ 10 "$sample"/droso_only_sorted.bam; done

#qc
for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/*; do fastqc -t 10 "$sample"/human_only_sorted.bam -o "$sample"; done

#faccio un po di spazio eliminando gli human_only e droso_only
rm samples/*/human_only.bam samples/*/droso_only.bam


#creo i bedgraph
for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/*; do echo "I'm processing $sample"; bedtools genomecov -ibam "$sample"/human_only_sorted.bam -bg -scale 1000000 > "$sample"/bedgraph_scaledto1M.bg; done

#faccio il sorting 
for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/*; do echo "I'm processing $sample"; sort -k1,1 -k2,2n -k3,3n "$sample"/bedgraph_scaledto1M.bg > "$sample"/bedgraph_scaledto1M.sorted.bg; done

#ho creato i bedgraph ma bedgraphtobigwig dopo non va


#per stampare il nome dei file o path separati
ls /media/alessio/Data/hypoxia/ChIPseq/samples/ | tr "\n" " "

#multiBamSummary
multiBamSummary bins --bamfiles /media/alessio/Data/hypoxia/ChIPseq/samples/C1A/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C1B/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C1C/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C1D/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C1E/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C1F/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C1G/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C1H/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C1I/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C2A/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C2B/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C2C/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C2D/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C2E/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C2F/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C2G/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C2H/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/C2I/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K125A1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K125B1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K125C1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K125D1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K125E1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K125F1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K125G1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K125H1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K125I1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K26A1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K26B1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K26C1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K26D1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K26E1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K26G1/human_only_sorted.bam /media/alessio/Data/hypoxia/ChIPseq/samples/K26H1/human_only_sorted.bam --labels C1A C1B C1C C1D C1E C1F C1G C1H C1I C2A C2B C2C C2D C2E C2F C2G C2H C2I IC1H24 IC1H6 IC1N IC2H24 IC2H6 IC2N IK125H24 IK125H6 IK125N IK26H24 IK26H6 IK26N K125A1 K125B1 K125C1 K125D1 K125E1 K125F1 K125G1 K125H1 K125I1 K26A1 K26B1 K26C1 K26D1 K26E1 K26G1 K26H1 -o /media/alessio/Data/hypoxia/ChIPseq/multibamsummary.npz -p 10 --outRawCounts /media/alessio/Data/hypoxia/ChIPseq/Rawcountsfrommultibigwig.tab --scalingFactors /media/alessio/Data/hypoxia/ChIPseq/Scalingfactorsfrommultibigwig.tab

#PCA
plotPCA -in /media/alessio/Data/hypoxia/ChIPseq/multibamsummary.npz -o /media/alessio/Data/hypoxia/ChIPseq/plot/pca_deeptools.png --rowCenter

#Deeptools
#creo i bigwig direttamente con bamcoverage di deeptools
for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/*; do bamCoverage -b "$sample"/human_only_sorted.bam -o "$sample"/BigWig.bw --binSize 20 --normalizeUsing BPM --smoothLength 60 --centerReads -p 10; done

#rinomino i bigwig con il nome del campione
for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/*; do samplename=$(basename $sample); mv $sample/BigWig.bw $sample/$samplename.bw; done

#installo MACS3
pip install MACS3

#Creo una serie di GTF filtrati sui geni up e down regolati dell'RNAseq
for sample in /media/alessio/Data/hypoxia/RNAseq/tables/*vs_ctrl.csv; do samplename=$(basename $sample | awk -F "." '{print $1}'); python3 filter_gtf_with_csv.py "$sample" GTF_filtered_RNAseq/"$samplename".gtf; done

#converto in bed (gtf2bed) devo aggiungere con awk un transcript id (Biostars) (This adds transcript_id ""; to lines in the GTF that do not contain that field, and leaves other lines unchanged)
for sample in GTF_filtered_RNAseq/*; do samplename=$(basename $sample | awk -F "." '{print $1}'); awk '{ if ($0 ~ "transcript_id") print $0; else print $0" transcript_id \"\";"; }' "$sample" | gtf2bed -  > GTF_filtered_RNAseq/"$samplename".bed; done

#Mark duplicates (non deduplico i file bam che ho già usato, è solo un controllo su un campione)
java -jar /home/alessio/tools/picard/build/libs/picard.jar MarkDuplicates INPUT= samples/H3K27AC/C1A/human_only_sorted.bam  OUTPUT= samples/H3K27AC/C1A/human_only_sorted_MD.bam  METRICS_FILE=metrics.txt REMOVE_DUPLICATES=false

#Annotazione dei picchi con Homer 
for dir in /media/alessio/Data/hypoxia/ChIPseq/samples/H*/*; do samplename=$(basename $dir ); annotatePeaks.pl $dir/"$samplename"_peaks.narrowPeak hg38 -gtf /media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf > $dir/"$samplename"_HomerAnnotation.txt; done

#faccio l'annotazione senza dare un gtf mio (voglio vedere se a valle cambia il risultato), userà di default refseq
for dir in /media/alessio/Data/hypoxia/ChIPseq/samples/H*/*; do samplename=$(basename $dir ); annotatePeaks.pl $dir/"$samplename"_peaks.narrowPeak hg38 > $dir/"$samplename"_HomerAnnotation_noGTF.txt; done

#annoto i superenhancer con Homer
for dir in /media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories/*; do annotatePeaks.pl "$dir"/superEnhancers.txt hg38 > "$dir"/superEnhacers_Anno.txt; done


#interferon genes overlap with HDAC4
bedtools jaccard -a Interferon_alpha.bed -b ChIP_atlas_files/HDAC4.ChIP.SKUT1.WT.bed >> Jaccard.HDAC4.Interferon.tab
bedtools jaccard -a Interferon_gamma.bed -b ChIP_atlas_files/HDAC4.ChIP.SKUT1.WT.bed >> Jaccard.HDAC4.Interferon.tab
bedtools jaccard -a GencodeV44.onlygenes.bed -b ChIP_atlas_files/HDAC4.ChIP.SKUT1.WT.bed >> Jaccard.HDAC4.Interferon.tab 