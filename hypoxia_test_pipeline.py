import pyBigWig
import pandas as pd
import matplotlib
from matplotlib import pyplot as plt
import os
import numpy as np
import pyBigWig
import pybedtools
import seaborn as sns
from scipy.stats import pearsonr
matplotlib.use("Agg")


# object that contains RNAseq and ChIPseq data
class SAMPLE:
    def __init__(self, name, metadata, expression_filepath, DEGs_filepath, peaks_N, peaks_H, bigwig_N, bigwig_H, DBRs_filepath):
        self.name = name
        self.metadata = metadata
        self.expression = pd.read_csv(expression_filepath)
        self.DEGs = pd.read_csv(DEGs_filepath, sep='\t')
        self.peaks_N = peaks_N
        self.peaks_H = peaks_H
        self.bigwig_N = bigwig_N
        self.bigwig_H = bigwig_H
        self.DBRs = DBRs_filepath

    def rnaseq(self, L2FC=0.75, padj=0.05):
        # expression matrix block
        cols_select=self.metadata['names']
        existing_cols=[col for col in cols_select if col in self.expression.columns]
        cols_to_keep=['gene_id'] + existing_cols
        mat_raw = self.expression.loc[:, cols_to_keep]
        # print(mat_raw)

        times=self.metadata[['names','clone','time']]
        times['clone_time'] = times['clone'].astype(str) + '_' + times['time'].astype(str)
        # print(times)        

        mat=pd.melt(mat_raw, id_vars=['gene_id'], var_name='names', value_name='VSD')
        mat=pd.merge(mat, times, on='names')

        mat=mat.loc[:, ['gene_id', 'VSD', 'clone_time']]
        mat=mat.groupby(['gene_id', 'clone_time'], as_index=False).mean()
    
        # DEGs block
        DEXPR=self.DEGs
        DEXPR['gene_id'] = DEXPR['gene_id_version'].str.split('.').str[0]
        DEXPR['DEGs'] = 'ns'
        DEXPR.loc[ (DEXPR['log2FoldChange'] > 0.75) & (DEXPR['padj'] < 0.05), 'DEGs'] = 'UP'
        DEXPR.loc[ (DEXPR['log2FoldChange'] < -0.75) & (DEXPR['padj'] < 0.05), 'DEGs'] = 'DOWN'

        DEXPR.drop(['gene_id_version', 'lfcSE', 'stat', 'pvalue', 'entrezid'], axis=1, inplace=True)
        DEXPR.columns = ['baseMean_rna', 'log2FoldChange_rna', 'padj_rna', 'symbol', 'gene_id', 'DEGs']
        return(mat, DEXPR)
    
    def chipseq(self):
        bigwigs = {self.bigwig_N.split("/")[-1].replace(".bw", ""): self.bigwig_N,
                   self.bigwig_H.split("/")[-1].replace(".bw", ""): self.bigwig_H}

        peaks_N = pybedtools.BedTool(self.peaks_N)
        peaks_H = pybedtools.BedTool(self.peaks_H)

        DBR = pd.read_csv(self.DBRs)
        DBR = DBR.loc[:, ['seqnames', 'start', 'end', 'width', 'baseMean', 'log2FoldChange', 'stat', 'padj', 'annotation', 'ENSEMBL', 'SYMBOL', 'DBRs']]
        DBR.columns = ['seqnames', 'start', 'end', 'width', 'baseMean_chip', 'log2FoldChange_chip', 'stat_chip', 'padj_chip', 'annotation', 'ENSEMBL', 'SYMBOL', 'DBRs']
        return(bigwigs, peaks_N, peaks_H, DBR)
    

    
# function to create consensus peakset
def make_peakset_consensus(*peaks):

    if len(peaks) == 1 and isinstance(peaks[0], (list, tuple)):
        peaks = peaks[0]

    peaks = list(peaks)

    peakcat = peaks[0]
    for peak in peaks[1:]:
        peakcat = peakcat.cat(peak, postmerge=False)
    
    peaksort = peakcat.sort()
    peakmerge = peaksort.merge(c=[4,5,6,7,8,9,10], o=['first','mean','first', 'first', 'first', 'mean', 'first'], d=0)
    
    peakset_df = pd.read_table(
    peakmerge.fn,
    header=None,
    names=['chr', 'start', 'end', 'symbol', 'score', 'strand', 'anno', 'transcriptId', 'distTSS', 'ENSEMBL'], sep='\t')

    peakset_df.drop(['anno', 'transcriptId', 'symbol'] ,axis =1, inplace=True)
    return(peakset_df)


def calc_signal_over_peakset(bigwigs, peakset_df):
    
    for name, file in bigwigs.items():        
        data_sample = []
        bw = pyBigWig.open(file)

        for i, row in peakset_df.iterrows():
            signal_sum = []
            chrom, start, end = row['chr'], row['start'], row['end']
            signal = bw.values(chrom, start, end, numpy = True)
            if len(signal) == 0 or all(value is None or np.isnan(value) for value in signal):
                signal_sum = 0
            else:
                signal_sum = np.nanmedian(signal[~np.isnan(signal)])
            data_sample.append(signal_sum)
        peakset_df[name] = data_sample

    return(peakset_df)

def merge_DEGs(peaks_with_signal, DEXPR):
    peaks_with_dexpr = pd.merge(peaks_with_signal, DEXPR, left_on='ENSEMBL', right_on='gene_id')
    return(peaks_with_dexpr)

def make_longer(peaks_with_dexpr, bigwigs):
    names=list(bigwigs.keys())
    long = peaks_with_dexpr.melt(id_vars=['chr', 'start', 'end', 'symbol', 'DEGs'], value_vars = names, var_name='bigwigs', value_name='signal') 
    return(long)

def makeboxplot_Bwsignal(data_long, filename, folder):
    fig, ax = plt.subplots(figsize=(7,7))  # square figure

    sns.boxplot(data=data_long,
                x='DEGs',
                y='signal',
                hue='bigwigs',
                ax=ax,
                showfliers=False)

    ax.set_title('')
    ax.set_xlabel('')
    ax.set_ylabel('')

    ax.set_box_aspect(1)  # square plot box

    return(
        fig.savefig(f"{folder}/{filename}_boxplot.png",
                    dpi=300,
                    bbox_inches="tight")
    )


def merge_DBR_DEGs(DEXPR, DBRX):
    merged = pd.merge(DEXPR, DBRX, left_on='gene_id', right_on='ENSEMBL')
    merged.dropna(subset=['ENSEMBL', 'log2FoldChange_chip', 'log2FoldChange_rna'], inplace=True)
    return(merged)

def makeboxplot_DBR_DEGs(data, filename, folder):
    
    data = data.loc[data['padj_rna'] < 0.05, :]

    fig, ax = plt.subplots(figsize=(3,6))  # square figure
    # breakpoint()
    sns.boxplot(data=data,
                x='DBRs',
                y='log2FoldChange_rna',
                ax=ax,
                order=['UP', 'ns', 'DOWN'],
                palette = ['red', 'white', 'blue'],
                showfliers=False)

    ax.set_title(filename)

    return(
        fig.savefig(f"{folder}/{filename}_boxplot.png",
                    dpi=300,
                    bbox_inches="tight")
    )

def plotCorr(data, filename, folder):

    # data = data.loc[data['annotation'].str.contains('Promoter'), :]

    R, pval = pearsonr(data['log2FoldChange_chip'], data['log2FoldChange_rna'])

    fig, ax = plt.subplots(figsize = (4,4))

    sns.scatterplot(data=data,
                x='log2FoldChange_chip',
                y='log2FoldChange_rna',
                hue = 'DEGs',
                palette={'UP':'red', 'DOWN':'blue', 'ns':'gray'},
                ax=ax,)
    
    handles, labels = ax.get_legend_handles_labels()

    # Put legend outside
    ax.legend(loc='upper center', bbox_to_anchor=(0.5, -0.05),
            fancybox=True, shadow=True, ncol=3)



    ax.set_xlim(-5, 5)
    ax.set_ylim(-10, 10)
    ax.set_title(f"{filename}\nPearson r = {R:.2f}", fontsize=10)
    ax.set_box_aspect(1)  # square plot box

    return(
        fig.savefig(f"{folder}/{filename}_corr.png",
                    dpi=300,
                    bbox_inches="tight")
    )



#####################################################################
norm_counts='/media/alessio/Data/hypoxia/RNAseq2025/tables/VSD.csv'
degs_path = '/media/alessio/Data/hypoxia/RNAseq2025/DEGs_tabs'

peaks_path = '/media/alessio/Data/hypoxia/ChIPseq_new/IDR_peaks'
bigwig_path = '/media/alessio/Data/hypoxia/ChIPseq_new/samples'
dbr_path = '/media/alessio/Data/hypoxia/ChIPseq_new/DBR_results'

metadata=pd.read_csv('/media/alessio/Data/hypoxia/RNAseq2025/sheets/samplesheet_salmon.csv')
metadata=metadata.loc[(metadata['clone'] == 'CAS9') & (metadata['group'] == 'B'), :]

samplesheet_H4KO_vs_Cas9 = pd.read_csv('sheet_chip_rna_H4KO_vs_Cas9.csv')
samplesheet_Vs_norm = pd.read_csv('sheet_chip_rna_hpx.csv')

for samplesheet in [samplesheet_H4KO_vs_Cas9, samplesheet_Vs_norm]: 
    for index, row in samplesheet.iterrows():
        obj = SAMPLE(name=row['name'], 
                metadata=metadata,
                expression_filepath=norm_counts,
                DEGs_filepath=os.path.join(degs_path, row['DEGs_file']),
                peaks_N = os.path.join(peaks_path, row['peaks_norm']),
                peaks_H = os.path.join(peaks_path, row['peaks_hpx']),
                bigwig_N = os.path.join(bigwig_path, row['sample_norm'], f"{row['sample_norm']}.bcomp.RPKM.bw"),
                bigwig_H = os.path.join(bigwig_path, row['sample_hpx'], f"{row['sample_hpx']}.bcomp.RPKM.bw"),
                DBRs_filepath= os.path.join(dbr_path, row['DBRs_file']))

        # load stuff
        expr_mat, DEXPR = obj.rnaseq()
        bigwigs, peaks_N, peaks_H, DBRX = obj.chipseq()

        # Peakset = make_peakset_consensus(*[peaks_N, peaks_H])

        # Peakset_with_signal = calc_signal_over_peakset(bigwigs, Peakset)

        # peaks_with_dexpr = merge_DEGs(Peakset_with_signal, DEXPR)
        # print(peaks_with_dexpr)

        # data_long = make_longer(peaks_with_dexpr, bigwigs)

        # print('Making boxplot', flush= True)
        # makeboxplot_Bwsignal(data_long, folder='boxplot_hpx_chip_rna_degs', filename=row['name'])

        DBR_x_DEGs = merge_DBR_DEGs(DEXPR, DBRX)

        print(DBR_x_DEGs, flush=True)
        makeboxplot_DBR_DEGs(DBR_x_DEGs, folder='boxplot_hpx_chip_rna_degs', filename=row['name'])
        plotCorr(DBR_x_DEGs, folder='Corr_hpx_chip_rna_degs', filename=row['name'])
