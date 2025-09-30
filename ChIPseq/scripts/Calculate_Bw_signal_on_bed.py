import sys
import pyBigWig
import numpy as np
import pandas as pd


#carica il BigWig
def load_bw_file(bw_file_path):
    return pyBigWig.open(bw_file_path)

#legge le regioni del file txt (come se fosse un bed), su cui poi verrà calcolato il segnale
def read_regions_from_bed(bed_file_path):
    
    regions = []
    valid_indices = []

    with open(bed_file_path, 'r') as bed:
        next(bed) 
        for i, line in enumerate(bed):
            cols = line.strip().split('\t') #scelgo queste colonne perchè il file è fatto così
            chrom = cols[0]
            start = int(cols[1])
            end = int(cols[2])

            if chrom == "chrM":
                continue
                
            regions.append((chrom, start, end))
            
            valid_indices.append(i)

    return(regions, valid_indices)


#calcola il segnale del bigwig sulle regioni definite prima
def calculate_signal_intensity(bw, regions):
    
    signal_intensities = []
    
    for region in regions:
        chrom, start, end = region

        signal_values = bw.values(chrom, start, end, numpy = True)

        if len(signal_values) == 0 or all(value is None or value == 'nan' for value in signal_values):
            signal_intensity = 0
        else:
            signal_intensity = sum(signal_values[~np.isnan(signal_values)])
	    
        signal_intensities.append(float(signal_intensity))

    return signal_intensities


if __name__ == "__main__":

    #argomenti dei file
    bw_file_path = sys.argv[1]
    bed_file_path = sys.argv[2]
    name = sys.argv[3]
    
    #lettura file
    bw = load_bw_file(bw_file_path)
    regions, valid_indices = read_regions_from_bed(bed_file_path)

    #esecuzione
    signal_intensities = calculate_signal_intensity(bw, regions)

    #carico txt e aggiungo la colonna con il segnale
    bed_file = pd.read_csv(bed_file_path, sep='\t')

    # Questo passaggio serve perchè ho saltato le righe contenenti chrM
    bed_file[name] = np.nan

    for idx, signal in zip(valid_indices, signal_intensities):
        bed_file.at[idx, name] = signal


    #salvataggio
    bed_file.to_csv(path_or_buf=bed_file_path, sep='\t', index=False)
