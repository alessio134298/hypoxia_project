#Prima parte di analisi e filtering dei dati di ChIP atlas su EPAS1

import pandas as pd
import os

#Lettura della tabella metadati
EPAS1_Available = pd.read_csv("EPAS1_data/EPAS1_ChIP_atlas_available.tsv", sep='\t')
#print(EPAS1_Available)

#filtro solo sulle human
EPAS1_human = EPAS1_Available[EPAS1_Available["Genome"].str.contains("hg38")]
#print(EPAS1_human)

#summary dei file disponibili
Types = EPAS1_human[["SRX ID","Cell type class", "Cell type"]]
Types.to_csv("EPAS1_data/Available_cells.tsv", sep = '\t', index=False) 

#Leggo il bed
EPAS1_bed_all = pd.read_csv("EPAS1_data/Oth.ALL.20.EPAS1.AllCell.bed", sep = '\t', skiprows=1, header=None)

#elimino le ultime colonne
EPAS1_bed_all = EPAS1_bed_all[[0,1,2,3,4,5]]

#rinomina colonne
EPAS1_bed_all.columns = ["CHR", "START", "END", "DESCRIPTION", "SCORE", "STRAND"]

#sostituisce caratteri nella dscrizione
EPAS1_bed_all["DESCRIPTION"] = EPAS1_bed_all["DESCRIPTION"].str.replace("%20", "_")

#Filtro sugli SRX per tenere solo quelli umani
EPAS1_bed_all["SRX ID"] = EPAS1_bed_all["DESCRIPTION"].str.split(";", expand=True)[0].str.replace("ID=", "")
EPAS1_bed_all = EPAS1_bed_all[EPAS1_bed_all["SRX ID"].isin(Types["SRX ID"])]
#In realtà non serviva perchè il bed aveva già solo quelli umani

#sorting
EPAS1_bed_all = EPAS1_bed_all.sort_values(by="SRX ID")

EPAS1_bed_all["SRX ID"].unique()

#aggiungo tipo cellulare
EPAS1_bed_all = EPAS1_bed_all.merge(Types, how='left', on='SRX ID')


for cell in EPAS1_bed_all["Cell type"].unique():
    print(cell)
    df = EPAS1_bed_all[EPAS1_bed_all["Cell type"] == cell]
    df.to_csv(f"EPAS1_data/cell_lines_splitted_data/{cell}.tsv", sep = '\t', index = False)

#Considerazione su che linee cellulari utilizzare
# Uso tutte le tumorali più le HUVEC
# Quindi: 
 
Cells = ['786-O', 'A549', 'HCT 116', 'PC-3', 'T-47D', 'Renal cell carcinoma', 'HUVEC', 'RCC4', 'Hep G2', 'MDA-MB-231', '786-M1A', 'SaOS-LM1']

with open ("EPAS1_data/Descriptions_useful_cell_lines.txt", "w") as output_file:
    for i in Cells:
        name = "df" + i
        name = pd.read_csv(f"EPAS1_data/cell_lines_splitted_data/{i}.tsv", sep = '\t')
        output_file.write(f"{i}:\n")
        unique_description = name["DESCRIPTION"].unique()
        output_file.write(", ".join(map(str, unique_description)) + "\n\n") #questo per convertire il numpy array in una cosa leggibile


# Qua faccio il filtro finale dal dataframe iniziale, quindi tengo solo le cell line che mi interessano e per le due seguenti filtro con quanto segue
# Per Renal cell carcinoma devo mettere treatment=DMSO
# Per 786-O devo iltrare su 786-O_WT_HIF2a_IP

EPAS1_final = EPAS1_bed_all[EPAS1_bed_all["Cell type"].isin(Cells)]

Not_wanted_rows_1 = EPAS1_final[(EPAS1_final["Cell type"] == "Renal cell carcinoma") & (~EPAS1_final["DESCRIPTION"].str.contains("treatment=DMSO"))]
Not_wanted_rows_2 = EPAS1_final[(EPAS1_final["Cell type"] == "786-O") & (~EPAS1_final["DESCRIPTION"].str.contains("786-O_WT_HIF2a_IP"))]

Not_wanted_rows = Not_wanted_rows_1.index.union(Not_wanted_rows_2.index)

EPAS1_final = EPAS1_final.drop(Not_wanted_rows)

EPAS1_final.to_csv("EPAS1_data/EPAS1_selected_final.bed",header=False, sep = '\t',index=False)

#Da qui continuo su R, ho bisogno delle annotazioni di ChIPseeker e fare la PCA




#########################
#riallineamento e analisi
#########################

#Dopo aver presentato i dati si è visto che è meglio scaricare tutti i bam e rielaborarli
import subprocess
import sys


# os.makedirs("EPAS1_data/EPAS1_all_SRR")
# os.chdir("EPAS1_data/EPAS1_all_SRR")

# for SRX in EPAS1_human["SRX ID"]:
#     command = ["/home/alessio/tools/sratoolkit.3.0.7-ubuntu64/bin/prefetch-orig.3.0.7", SRX]
#     subprocess.run(command)

#vedo i dati degli SRR associati a SRX e salvo in un file
import pandas as pd

#Creo una tabella di corrispondenze da salvare e un vettore per poi scaricare i file
Tabella = []
Vettore = []

for SRX in EPAS1_human["SRX ID"]:
    #print(f"command on {SRX}")
    command = f"/home/alessio/miniconda3/bin/esearch -db SRA -query {SRX} | /home/alessio/miniconda3/bin/efetch -format runinfo | cut -d ',' -f 1 | tail -n +2"
    result = subprocess.run(command, capture_output=True, text = True, shell = True, executable="/bin/bash")
    #print(result.stdout)
    Tabella.append([SRX, result.stdout.replace('\n',',')])
    Vettore.append(result.stdout.replace('\n',""))

#converto in dataframe e salvo
SRX_to_SRR = pd.DataFrame(Tabella)
SRX_to_SRR.columns = ["SRX", "SRR"]
SRX_to_SRR.to_csv("EPAS1_data/SRX_to_SRR.tsv", sep = "\t", index=False)

#sistemo lista
Lista_SRR = [s.replace("S", ",S") for s in Vettore]
Lista_SRR = [srr.strip() for entry in Lista_SRR for srr in entry.split(",") if srr]

#scarico tutti i fastq dagli SRX ID (per ora, poi vedrò se ha senso usare gli SRR)
for SRR in Lista_SRR:
    command = f"/home/alessio/tools/sratoolkit.3.0.7-ubuntu64/bin/fasterq-dump-orig.3.0.7 --split-files -e 10 {SRR} --outdir EPAS1_data/Fastq/ | pigz EPAS1_data/Fastq/{SRR}_1.fastq -p 10; pigz EPAS1_data/Fastq/{SRR}_2.fastq -p 10"
    subprocess.run(command, capture_output=True, text = True, shell = True, executable="/bin/bash")
#rivedere qua perchè non tutti sono paired end