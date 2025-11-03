#!/bin/bash
#SBATCH --job-name=ROSE
#SBATCH --partition=LocalQ
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=3000:00:00


#Need to be runned in the ROSE software folder


#WT samples
python3 /home/nicolo/Software/ROSE/bin/ROSE_main.py -i /media/nicolo/Data/Documents/Eros/90-924610255/MACS2_pvaldefault/CRC001B/CRC001B_peaks.narrowPeak.gff -r /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC001B.rmdup.bam -o /media/nicolo/Data/Documents/Eros/90-924610255/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC001B -g HG38 -c /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC017B.rmdup.bam -t 2500

python3 /home/nicolo/Software/ROSE/bin/ROSE_main.py -i /media/nicolo/Data/Documents/Eros/90-924610255/MACS2_pvaldefault/CRC002B/CRC002B_peaks.narrowPeak.gff -r /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC002B.rmdup.bam -o /media/nicolo/Data/Documents/Eros/90-924610255/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC002B -g HG38 -c /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC017B.rmdup.bam -t 2500

python3 /home/nicolo/Software/ROSE/bin/ROSE_main.py -i /media/nicolo/Data/Documents/Eros/90-924610255/MACS2_pvaldefault/CRC003B/CRC003B_peaks.narrowPeak.gff -r /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC003B.rmdup.bam -o /media/nicolo/Data/Documents/Eros/90-924610255/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC003B -g HG38 -c /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC017B.rmdup.bam -t 2500

python3 /home/nicolo/Software/ROSE/bin/ROSE_main.py -i /media/nicolo/Data/Documents/Eros/90-924610255/MACS2_pvaldefault/CRC004B/CRC004B_peaks.narrowPeak.gff -r /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC004B.rmdup.bam -o /media/nicolo/Data/Documents/Eros/90-924610255/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC004B -g HG38 -c /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC017B.rmdup.bam -t 2500


#KO samples
python3 /home/nicolo/Software/ROSE/bin/ROSE_main.py -i /media/nicolo/Data/Documents/Eros/90-924610255/MACS2_pvaldefault/CRC005B/CRC005B_peaks.narrowPeak.gff -r /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC005B.rmdup.bam -o /media/nicolo/Data/Documents/Eros/90-924610255/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC005B -g HG38 -c /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC018B.rmdup.bam -t 2500

python3 /home/nicolo/Software/ROSE/bin/ROSE_main.py -i /media/nicolo/Data/Documents/Eros/90-924610255/MACS2_pvaldefault/CRC006B/CRC006B_peaks.narrowPeak.gff -r /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC006B.rmdup.bam -o /media/nicolo/Data/Documents/Eros/90-924610255/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC006B -g HG38 -c /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC018B.rmdup.bam -t 2500

python3 /home/nicolo/Software/ROSE/bin/ROSE_main.py -i /media/nicolo/Data/Documents/Eros/90-924610255/MACS2_pvaldefault/CRC007B/CRC007B_peaks.narrowPeak.gff -r /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC007B.rmdup.bam -o /media/nicolo/Data/Documents/Eros/90-924610255/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC007B -g HG38 -c /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC018B.rmdup.bam -t 2500

python3 /home/nicolo/Software/ROSE/bin/ROSE_main.py -i /media/nicolo/Data/Documents/Eros/90-924610255/MACS2_pvaldefault/CRC008B/CRC008B_peaks.narrowPeak.gff -r /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC008B.rmdup.bam -o /media/nicolo/Data/Documents/Eros/90-924610255/ROSE_macspvaluedefault_TSSfilter_cutoffset/CRC008B -g HG38 -c /media/nicolo/Data1/Eros/90-924610255/bowtie/CRC018B.rmdup.bam -t 2500
