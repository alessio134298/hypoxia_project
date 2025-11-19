import os
import subprocess
import pandas as pd

samplesheet = '/media/alessio/Data/hypoxia/RNAseq2025/sheets/samplesheet_salmon.csv'

class Sample:
    def __init__(self, name,
                base_path='/media/alessio/Data/hypoxia/RNAseq2025',
                fq_folder='trimmed_fq',
                bam_folder='star_align',
                bw_folder='bw') -> None:
        self.base_path = base_path
        self.sample_name = os.path.basename(name.rstrip('/'))
        self.fq_folder = os.path.join(base_path, fq_folder)
        self.bam_folder = os.path.join(base_path,bam_folder)
        self.bw_folder = os.path.join(base_path,bw_folder)
        


    def star_align(self, threads=2):
        fq_path = f"{self.fq_folder}"
        read1 = f"{fq_path}/{self.sample_name}_1_val_1.fq.gz"
        read2 = f"{fq_path}/{self.sample_name}_2_val_2.fq.gz"
        outprefix = f"{self.sample_name}_STAR_quant"
        out=f"{self.bam_folder}/{outprefix}"
        command = f"""
            mkdir -p {self.bam_folder}

            /home/alessio/tools/STAR-2.7.11b/bin/Linux_x86_64/STAR \
            --runMode alignReads \
            --quantMode GeneCounts \
            --outSAMtype BAM SortedByCoordinate \
            --outSAMattributes All \
            --runThreadN {threads} \
            --genomeDir /media/alessio/Data/hg38_indexes/STAR_index/ \
            --twopassMode Basic \
            --sjdbGTFfile /media/alessio/Data/genome110/gencode/gencode.v45.annotation.gtf \
            --readFilesCommand zcat \
            --readFilesIn {read1} {read2} \
            --outFileNamePrefix {out} &&

            samtools index {self.bam_folder}/{self.sample_name}_STAR_quantAligned.sortedByCoord.out.bam
        """
        return(command)
    
    def make_bigwig(self, threads=2, norm='RPKM'):
        align_out=f"{self.bam_folder}/{self.sample_name}_STAR_quantAligned.sortedByCoord.out.bam"
        bw=f"{self.bw_folder}/{self.sample_name}_{norm}.bw"
        command = f"""
            mkdir -p {self.bw_folder}

            conda run -n Deeptools bamCoverage \
            -b {align_out} \
            -bs 20 \
            --normalizeUsing  {norm} \
            -o {bw} \
            -p {threads}
        """
        return(command)


# samples
names = pd.read_csv(samplesheet)['names']

for name in names:

    sample = Sample(name)

    align = subprocess.run(sample.star_align(), shell=True)
    print(align.stdout)    
    
    bw = subprocess.run(sample.make_bigwig(), shell=True)
    print(bw.stdout)

        

