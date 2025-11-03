idr --samples C1A_superEnhancer_ROSE.bed C2A_superEnhancer_ROSE.bed --input-file-type bed --output-file Cas9_H0_SEs_IDR_consensus.bed --only-merge-peaks

# idr --samples samples/C1D_peaks_sorted.narrowPeak samples/C2D_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/Cas9_H6 --plot --log-output-file idr_results/Cas9_H6.idr.log

# idr --samples samples/C1G_peaks_sorted.narrowPeak samples/C2G_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/Cas9_H24 --plot --log-output-file idr_results/Cas9_H24.idr.log

# idr --samples samples/K125A1_peaks_sorted.narrowPeak samples/K26A1_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/H4KO_normoxia --plot --log-output-file idr_results/H4KO_normoxia.idr.log

# idr --samples samples/K125D1_peaks_sorted.narrowPeak samples/K26D1_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/H4KO_H6 --plot --log-output-file idr_results/H4KO_H6.idr.log

# idr --samples samples/K125G1_peaks_sorted.narrowPeak samples/K26G1_peaks_sorted.narrowPeak --input-file-type narrowPeak --rank p.value --output-file idr_results/H4KO_H24 --plot --log-output-file idr_results/H4KO_H24.idr.log