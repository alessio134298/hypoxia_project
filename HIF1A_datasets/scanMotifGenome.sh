#è una funzione di Homer che permette di trovare tutti i possibili binding site di un motivo su tutto il genoma

#HIF1a
scanMotifGenomeWide.pl /home/alessio/tools/Homer/motifs/hif1a.motif /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa -bed > HIF1a_all_putative_binding_sites.bed

#HIF2a
scanMotifGenomeWide.pl /home/alessio/tools/Homer/motifs/hif2a.motif /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa -bed > HIF2a_all_putative_binding_sites.bed

#HIF1b
scanMotifGenomeWide.pl /home/alessio/tools/Homer/motifs/hif1b.motif /media/alessio/Data/genome110/gencode/GRCh38.primary_assembly.genome.fa -bed > HIF1b_all_putative_binding_sites.bed