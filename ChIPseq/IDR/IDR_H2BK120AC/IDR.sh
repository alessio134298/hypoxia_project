# #sorting di tutti i file narrowPeak
# for sample in /media/alessio/Data/hypoxia/ChIPseq/samples/H*/*/*.narrowPeak; do samplename=$(basename $sample | awk -F "." '{print $1}'); sort -k8,8nr $sample > /media/alessio/Data/hypoxia/ChIPseq/IDR/samples/"$samplename"_sorted.narrowPeak; done

#dopo aver corretto il codice (ho sostituito degli "==" con "in" e "numpy.int" con "int")
#lancio il comando di IDR (i file narrowpeak sortati di H2BK120ac sono nella cartella di H3K27ac)
idr --samples /media/alessio/Data/hypoxia/ChIPseq/IDR/IDR_H3K27AC/samples/C1B_peaks_sorted.narrowPeak /media/alessio/Data/hypoxia/ChIPseq/IDR/IDR_H3K27AC/samples/C2B_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/Cas9_normoxia --plot --log-output-file idr_results/Cas9_normoxia.idr.log

idr --samples /media/alessio/Data/hypoxia/ChIPseq/IDR/IDR_H3K27AC/samples/C1E_peaks_sorted.narrowPeak /media/alessio/Data/hypoxia/ChIPseq/IDR/IDR_H3K27AC/samples/C2E_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/Cas9_H6 --plot --log-output-file idr_results/Cas9_H6.idr.log

idr --samples /media/alessio/Data/hypoxia/ChIPseq/IDR/IDR_H3K27AC/samples/C1H_peaks_sorted.narrowPeak /media/alessio/Data/hypoxia/ChIPseq/IDR/IDR_H3K27AC/samples/C2H_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/Cas9_H24 --plot --log-output-file idr_results/Cas9_H24.idr.log

idr --samples /media/alessio/Data/hypoxia/ChIPseq/IDR/IDR_H3K27AC/samples/K125B1_peaks_sorted.narrowPeak /media/alessio/Data/hypoxia/ChIPseq/IDR/IDR_H3K27AC/samples/K26B1_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/H4KO_normoxia --plot --log-output-file idr_results/H4KO_normoxia.idr.log

idr --samples /media/alessio/Data/hypoxia/ChIPseq/IDR/IDR_H3K27AC/samples/K125E1_peaks_sorted.narrowPeak /media/alessio/Data/hypoxia/ChIPseq/IDR/IDR_H3K27AC/samples/K26E1_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/H4KO_H6 --plot --log-output-file idr_results/H4KO_H6.idr.log

idr --samples /media/alessio/Data/hypoxia/ChIPseq/IDR/IDR_H3K27AC/samples/K125H1_peaks_sorted.narrowPeak /media/alessio/Data/hypoxia/ChIPseq/IDR/IDR_H3K27AC/samples/K26H1_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/H4KO_H24 --plot --log-output-file idr_results/H4KO_H24.idr.log
