import sys
import os
import subprocess

# blacklist file
blacklist='/media/alessio/Data/genome110/hg38-blacklist.v2.bed'

# files used to train, willm compute bigwigsummary to have the same binning and a coherent table
# RNAseq
path_RNAseq_bw='/media/alessio/Data/hypoxia/RNAseq/bw'
file_RNAseq=['R1CN.bw', 'R2CN.bw', 'R3CN.bw', 'R4CN.bw', 'RK125AN.bw', 'RK125BN.bw', 'RK26N2.bw', 'RK26N3.bw']
file_RNAseq=[os.path.join(path_RNAseq_bw, x) for x in file_RNAseq]

# ChIPseq
path_ChIPseq_bw='/media/alessio/Data/hypoxia/ChIPseq_new/samples'

file_ChIPseq_H3K27ac=['C1A', 'C2A', 'K125A1', 'K26A1']
file_ChIPseq_H2BK120ac=['C1B', 'C2B', 'K125B1', 'K26B1']
file_ChIPseq_H3K4me1=['C1C', 'C2C', 'K125C1', 'K26C1']

file_ChIPseq_H3K27ac=[os.path.join(path_ChIPseq_bw, x) + f'/{x}.bcov.RPGC.bw' for x in file_ChIPseq_H3K27ac]
file_ChIPseq_H2BK120ac=[os.path.join(path_ChIPseq_bw, x) + f'/{x}.bcov.RPGC.bw' for x in file_ChIPseq_H2BK120ac]
file_ChIPseq_H3K4me1=[os.path.join(path_ChIPseq_bw, x) + f'/{x}.bcov.RPGC.bw' for x in file_ChIPseq_H3K4me1]

# ATAC file
ATAC_file=['/media/alessio/Data/leio_atac_data/bw/ATAC_SKUT1_averaged.bw']

# merge the list
filelist = file_RNAseq + file_ChIPseq_H3K27ac + file_ChIPseq_H2BK120ac + file_ChIPseq_H3K4me1 + ATAC_file

# set the names
names = [os.path.basename(x).replace('.bw', '') for x in filelist]

filelist_str = " ".join(filelist)
names_str = " ".join(names)

# run command
cmd = [
    "multiBigwigSummary", "bins",
    "--binSize", "100",
    "--outFileName", "bigwig_summary_100_binned.npz",
    "--outRawCounts", "bigwig_summary_100_binned.tab",
    "--blackListFileName", blacklist,
    "-p", "6"
]

# extend with multiple files and labels (not joined into one string)
cmd += ["--bwfiles"] + filelist
cmd += ["--labels"] + names

print(cmd)

result = subprocess.run(cmd, capture_output=True, text = True)

if result.returncode == 0:
    print("\nCommand executed successfully.")
else:
    print(f"\nError executing command (Return Code {result.returncode}):")
    print("\n--- STDOUT ---")
    print(result.stdout)
    print("\n--- STDERR ---")
    print(result.stderr)
