import pyBigWig
import pandas as pd
import matplotlib.pyplot as plt
import os
import numpy as np

# We calculate the signal of bigwigs file over active and poised enhancers

# files
pathbed = '/media/alessio/Data/hypoxia/ChIPseq_new/poised_active_class'
path_bw = '/media/alessio/Data/hypoxia/ChIPseq_new/samples'

norm='RPKM'
type='bcomp'


Cas9_norm_bw = [path_bw + '/' + f + '/' + f + f'.{type}.{norm}.bw' for f in ['C1A', 'C2A', 'C1B', 'C2B', 'C1C', 'C2C']]
H4KO_norm_bw = [path_bw + '/' + f + '/' + f + f'.{type}.{norm}.bw' for f in ['K125A1', 'K26A1', 'K125B1', 'K26B1', 'K125C1', 'K26C1']]

files = [pathbed +  '/' + f for f in os.listdir(pathbed) if f.endswith('.bed')]

enhancers_classification_normoxia = {
    os.path.splitext(os.path.basename(f))[0]: pd.read_csv(f, sep = '\t', names = ['chrom', 'start', 'end']) for f in files
}

print(enhancers_classification_normoxia.keys())

# Calc signal
enhancers_classification_normoxia_with_signal = {}

for name, bed in enhancers_classification_normoxia.items():

    if 'Cas9' in name:
        samples = Cas9_norm_bw
        print(name)
        
        final_df = bed.copy()

        for sample in samples:
            
            data_sample = []
            bw = pyBigWig.open(sample)

            for i, row in bed.iterrows():
                signal_sum = []

                chrom, start, end = row[0], row[1], row[2]

                signal = bw.values(chrom, start, end, numpy = True)

                if len(signal) == 0 or all(value is None or value == 'nan' for value in signal):
                    signal_sum = 0
                else:
                    signal_sum = np.nanmean(signal[~np.isnan(signal)])
                
                data_sample.append(signal_sum)


            final_df[sample] = data_sample
    
        enhancers_classification_normoxia_with_signal[name] = final_df

    elif 'H4KO' in name:
        samples = H4KO_norm_bw
        print(name)
        
        final_df = bed.copy()

        for sample in samples:
            
            data_sample = []
            bw = pyBigWig.open(sample)

            for i, row in bed.iterrows():
                signal_sum = []

                chrom, start, end = row[0], row[1], row[2]
            
                signal = bw.values(chrom, start, end, numpy = True)

                if len(signal) == 0 or all(value is None or value == 'nan' for value in signal):
                    signal_sum = 0
                else:
                    signal_sum = np.nanmean(signal[~np.isnan(signal)])
                
                data_sample.append(signal_sum)

            final_df[sample] = data_sample
    
        enhancers_classification_normoxia_with_signal[name] = final_df

# save
for name, data in enhancers_classification_normoxia_with_signal.items():
    data.to_csv(f'/media/alessio/Data/hypoxia/ChIPseq_new/tables/{name}_with_{type}_{norm}_signal.csv', sep = '\t', header = True, index = None)