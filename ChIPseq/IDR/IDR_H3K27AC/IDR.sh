# #sorting di tutti i file narrowPeak
# for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/H*/*/*.narrowPeak; do samplename=$(basename $sample | awk -F "." '{print $1}'); sort -k8,8nr $sample > /media/alessio/Data/hypoxia/ChIPseq/IDR/samples/"$samplename"_sorted.narrowPeak; done

#dopo aver corretto il codice (ho sostituito degli "==" con "in" e "numpy.int" con "int")
#lancio il comando di IDR
idr --samples samples/C1A_peaks_sorted.narrowPeak samples/C2A_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/Cas9_normoxia --plot --log-output-file idr_results/Cas9_normoxia.idr.log

idr --samples samples/C1D_peaks_sorted.narrowPeak samples/C2D_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/Cas9_H6 --plot --log-output-file idr_results/Cas9_H6.idr.log

idr --samples samples/C1G_peaks_sorted.narrowPeak samples/C2G_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/Cas9_H24 --plot --log-output-file idr_results/Cas9_H24.idr.log

idr --samples samples/K125A1_peaks_sorted.narrowPeak samples/K26A1_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/H4KO_normoxia --plot --log-output-file idr_results/H4KO_normoxia.idr.log

idr --samples samples/K125D1_peaks_sorted.narrowPeak samples/K26D1_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/H4KO_H6 --plot --log-output-file idr_results/H4KO_H6.idr.log

idr --samples samples/K125G1_peaks_sorted.narrowPeak samples/K26G1_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/H4KO_H24 --plot --log-output-file idr_results/H4KO_H24.idr.log
