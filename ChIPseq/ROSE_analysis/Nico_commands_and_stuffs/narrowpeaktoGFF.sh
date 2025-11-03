#Convert narrowpeak to GFF file
#Tested in the context of ROSE pipeline for superenhancer calling



awk '{print$1"\t"$4"\t"".""\t"$2"\t"$3"\t"".""\t"$6"\t"".""\t"$4}'
