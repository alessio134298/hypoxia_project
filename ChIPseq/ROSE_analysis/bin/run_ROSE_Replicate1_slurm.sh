#!/bin/bash
#SBATCH --job-name=ROSE
#SBATCH --partition=LocalQ
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=300:00:00



#WT samples
python3 ROSE_main.py -i /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/MACS2_pvaldefault/CRC001/CRC001_peaks.narrowPeak.gff -r /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC001.rmdup.bam -o /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC001 -g HG38 -c /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC017.rmdup.bam -t 2500

python3 ROSE_main.py -i /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/MACS2_pvaldefault/CRC002/CRC002_peaks.narrowPeak.gff -r /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC002.rmdup.bam -o /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC002 -g HG38 -c /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC017.rmdup.bam -t 2500

python3 ROSE_main.py -i /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/MACS2_pvaldefault/CRC003/CRC003_peaks.narrowPeak.gff -r /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC003.rmdup.bam -o /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC003 -g HG38 -c /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC017.rmdup.bam -t 2500

python3 ROSE_main.py -i /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/MACS2_pvaldefault/CRC004/CRC004_peaks.narrowPeak.gff -r /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC004.rmdup.bam -o /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC004 -g HG38 -c /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC017.rmdup.bam -t 2500


#KO samples
python3 ROSE_main.py -i /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/MACS2_pvaldefault/CRC005/CRC005_peaks.narrowPeak.gff -r /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC005.rmdup.bam -o /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC005 -g HG38 -c /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC018.rmdup.bam -t 2500

python3 ROSE_main.py -i /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/MACS2_pvaldefault/CRC006/CRC006_peaks.narrowPeak.gff -r /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC006.rmdup.bam -o /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC006 -g HG38 -c /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC018.rmdup.bam -t 2500

python3 ROSE_main.py -i /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/MACS2_pvaldefault/CRC007/CRC007_peaks.narrowPeak.gff -r /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC007.rmdup.bam -o /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC007 -g HG38 -c /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC018.rmdup.bam -t 2500

python3 ROSE_main.py -i /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/MACS2_pvaldefault/CRC008/CRC008_peaks.narrowPeak.gff -r /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC008.rmdup.bam -o /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC008 -g HG38 -c /media/nicolo/Data/Documents/Eros/Azenta_Project_90_879526868/bowtie2/CRC018.rmdup.bam -t 2500
