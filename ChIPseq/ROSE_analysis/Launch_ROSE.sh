# #converto i narrowpeak a gff (uso comando che mi ha dato Nicolo)
# for sample in /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/ROSE/narrowPeaks_GFF_H3K27ac/*.narrowPeak; do samplename=$(basename $sample | awk -F "." '{print $1}'); awk '{print$1"\t"$4"\t"".""\t"$2"\t"$3"\t"".""\t"$6"\t"".""\t"$4}' $sample > /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/ROSE/narrowPeaks_GFF_H3K27ac/"$samplename".gff; done


# for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/*; do samplename=$(basename "$sample"); mkdir RESULTS_ROSE_H3K27ac/"$samplename"; done

# #provo a chiamare i SEs con ROSE
# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/ROSE/bin/ROSE_main.py  -g HG38 -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/ROSE/narrowPeaks_GFF/C1A_peaks.GFF -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/human_only_sorted.bam -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/human_only_sorted.bam -o -t 2500
# #per lanciarlo su tutti devo settare l'opzione -t 2500 (o altri valori per escludere il TSS), QUESTO PARAMETRO ERA STATO USATO DA nICOLO

# #Lancio su tutti i campioni H3K27ac
# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/C1A_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/human_only_sorted.bam -o RESULTS_ROSE_H3K27ac/C1A -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/C2A_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/human_only_sorted.bam -o RESULTS_ROSE_H3K27ac/C2A -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/input_human_only_sorted.bam  -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py  -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/C1D_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/human_only_sorted.bam  -o RESULTS_ROSE_H3K27ac/C1D -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/input_human_only_sorted.bam  -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py  -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/C2D_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/human_only_sorted.bam  -o RESULTS_ROSE_H3K27ac/C2D -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py  -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/C1G_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/human_only_sorted.bam  -o RESULTS_ROSE_H3K27ac/C1G -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/input_human_only_sorted.bam  -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/C2G_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/human_only_sorted.bam  -o RESULTS_ROSE_H3K27ac/C2G -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/K125A1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/human_only_sorted.bam  -o RESULTS_ROSE_H3K27ac/K125A1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/K26A1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/human_only_sorted.bam  -o RESULTS_ROSE_H3K27ac/K26A1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/K125D1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/human_only_sorted.bam -o RESULTS_ROSE_H3K27ac/K125D1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/K26D1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/human_only_sorted.bam  -o RESULTS_ROSE_H3K27ac/K26D1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/K125G1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/human_only_sorted.bam  -o RESULTS_ROSE_H3K27ac/K125G1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/K26G1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/human_only_sorted.bam   -o RESULTS_ROSE_H3K27ac/K26G1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/input_human_only_sorted.bam -t 2500


#chiamo anche per H2BK120ac
# #converto in gff
# for sample in /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/*.narrowPeak; do samplename=$(basename $sample | awk -F "." '{print $1}'); awk '{print$1"\t"$4"\t"".""\t"$2"\t"$3"\t"".""\t"$6"\t"".""\t"$4}' $sample > /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/"$samplename".gff; done


# #ROSE
# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/C1B_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1B/human_only_sorted.bam -o RESULTS_ROSE_H2BK120ac/C1B -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/C2B_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2B/human_only_sorted.bam -o RESULTS_ROSE_H2BK120ac/C2B -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/input_human_only_sorted.bam  -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py  -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/C1E_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1E/human_only_sorted.bam  -o RESULTS_ROSE_H2BK120ac/C1E -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/input_human_only_sorted.bam  -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py  -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/C2E_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2E/human_only_sorted.bam  -o RESULTS_ROSE_H2BK120ac/C2E -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py  -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/C1H_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1H/human_only_sorted.bam  -o RESULTS_ROSE_H2BK120ac/C1H -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/input_human_only_sorted.bam  -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/C2H_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2H/human_only_sorted.bam  -o RESULTS_ROSE_H2BK120ac/C2H -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/K125B1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125B1/human_only_sorted.bam  -o RESULTS_ROSE_H2BK120ac/K125B1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/K26B1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26B1/human_only_sorted.bam  -o RESULTS_ROSE_H2BK120ac/K26B1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/K125E1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125E1/human_only_sorted.bam -o RESULTS_ROSE_H2BK120ac/K125E1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/K26E1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26E1/human_only_sorted.bam  -o RESULTS_ROSE_H2BK120ac/K26E1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/K125H1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125H1/human_only_sorted.bam  -o RESULTS_ROSE_H2BK120ac/K125H1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/input_human_only_sorted.bam -t 2500

# python3 /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/bin/ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/K26H1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26H1/human_only_sorted.bam   -o RESULTS_ROSE_H2BK120ac/K26H1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/input_human_only_sorted.bam -t 2500


# #rifaccio tutto con ROSE scaricato da bitbucket (quello corretto)
# conda activate rose #qua c'è python2
# #bisogna essere nella cartella di rose dove c'è ROSE_main.py

# #Lancio su tutti i campioni H3K27ac
# python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/C1A_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1A/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/C1A -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/input_human_only_sorted.bam -t 2500

# python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/C2A_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2A/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/C2A -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/input_human_only_sorted.bam  -t 2500

# python2 ROSE_main.py  -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/C1D_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1D/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/C1D -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/input_human_only_sorted.bam  -t 2500

# python2 ROSE_main.py  -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/C2D_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2D/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/C2D -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/input_human_only_sorted.bam -t 2500

# python2 ROSE_main.py  -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/C1G_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C1G/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/C1G -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/input_human_only_sorted.bam  -t 2500

# python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/C2G_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/C2G/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/C2G -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/input_human_only_sorted.bam -t 2500

# python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/K125A1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125A1/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/K125A1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/input_human_only_sorted.bam -t 2500

# python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/K26A1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26A1/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/K26A1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/input_human_only_sorted.bam -t 2500

# python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/K125D1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125D1/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/K125D1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/input_human_only_sorted.bam -t 2500

# python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/K26D1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26D1/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/K26D1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/input_human_only_sorted.bam -t 2500

# python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/K125G1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K125G1/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/K125G1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/input_human_only_sorted.bam -t 2500

# python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H3K27ac/K26G1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H3K27AC/K26G1/human_only_sorted.bam   -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H3K27ac/K26G1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/input_human_only_sorted.bam -t 2500



# #H2BK120ac
# python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/C1B_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1B/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H2BK120ac/C1B -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1N/input_human_only_sorted.bam -t 2500

# python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/C2B_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2B/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H2BK120ac/C2B -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2N/input_human_only_sorted.bam  -t 2500

# python2 ROSE_main.py  -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/C1E_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1E/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H2BK120ac/C1E -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H6/input_human_only_sorted.bam  -t 2500

# python2 ROSE_main.py  -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/C2E_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2E/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H2BK120ac/C2E -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H6/input_human_only_sorted.bam -t 2500

# python2 ROSE_main.py  -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/C1H_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C1H/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H2BK120ac/C1H -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC1H24/input_human_only_sorted.bam  -t 2500

# python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/C2H_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/C2H/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H2BK120ac/C2H -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IC2H24/input_human_only_sorted.bam -t 2500

# python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/K125B1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125B1/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H2BK120ac/K125B1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125N/input_human_only_sorted.bam -t 2500

python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/K26B1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26B1/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H2BK120ac/K26B1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26N/input_human_only_sorted.bam -t 2500

python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/K125E1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125E1/human_only_sorted.bam -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H2BK120ac/K125E1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H6/input_human_only_sorted.bam -t 2500

python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/K26E1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26E1/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H2BK120ac/K26E1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H6/input_human_only_sorted.bam -t 2500

python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/K125H1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K125H1/human_only_sorted.bam  -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H2BK120ac/K125H1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK125H24/input_human_only_sorted.bam -t 2500

python2 ROSE_main.py -i /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/narrowPeaks_GFF_H2BK120ac/K26H1_peaks.gff -r /media/alessio/Data/hypoxia/ChIPseq/samples/H2BK120AC/K26H1/human_only_sorted.bam   -o /media/alessio/Data/hypoxia/ChIPseq/ROSE_analysis/rose_bitbucket_python2_results/RESULTS_ROSE_H2BK120ac/K26H1 -g HG38 -c /media/alessio/Data/hypoxia/ChIPseq/samples/IK26H24/input_human_only_sorted.bam -t 2500