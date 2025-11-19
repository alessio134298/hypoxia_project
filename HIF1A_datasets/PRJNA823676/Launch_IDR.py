#!/home/alessio/miniconda3/envs/IDR/bin/python3

import os
import sys
from collections import defaultdict
import subprocess

dir_path = sys.argv[1]

res = []

for file in os.listdir(dir_path):
    if os.path.isfile(os.path.join(dir_path, file)):
        filez = dir_path + file
        res.append(filez)

#print(res)

Lines = ["A549", "PC3", "HCT116", "T47D"]
TFs = ["HIF1A", "HIF2A"]

patterns = []

for cell_line in Lines:
    for TF in TFs:
        pattern = (cell_line + "_" + TF)
        patterns.append(pattern)

#print(patterns)

# grouped_files = defaultdict(list)
grouped_files = {}

for pt in patterns:
    grouped_files[pt] = []
    for sample in res:
        if pt in sample:
             grouped_files[pt].append(sample)

print(grouped_files)

for pt, group in grouped_files.items():
    command = [
                "idr",
                "--samples", group[0], group[1],
                "--input-file-type", "narrowPeak",
                "--rank", "p.value",
                "--output-file", "out",
                "--plot",
                "--log-output-file", "out.log"
            ]
        
    result = subprocess.run(command, capture_output=True, text = True )
    
    print(f"Output of the command on {group}:")
    print(result.stdout)
