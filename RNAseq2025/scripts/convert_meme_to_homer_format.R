library(universalmotif)

meme <- universalmotif::read_meme('/media/alessio/Data/hypoxia/ChIPseq/Motifs_analysis/Databases/motif_databases/HUMAN/HOCOMOCOv11_full_HUMAN_mono_meme_format.meme')

universalmotif::write_homer(meme, '/home/alessio/tools/Homer/data/knownTFs/HOCOMOCOv11_full_HUMAN_mono_homer_format.motifs')

