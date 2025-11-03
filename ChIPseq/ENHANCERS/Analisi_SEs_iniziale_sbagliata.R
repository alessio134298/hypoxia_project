#carico tabelle in una lista, separo H3K27ac e H2BK120ac
```{r}
path = "/media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories"

dirs = c("C2A_TagDir","K26H1_TagDir","C2H_TagDir","K125A1_TagDir","C2E_TagDir","C1B_TagDir","K125H1_TagDir","K26D1_TagDir","C1G_TagDir","K125D1_TagDir","C1A_TagDir","C2B_TagDir","K26A1_TagDir","C1H_TagDir","C1E_TagDir","C2G_TagDir","K26G1_TagDir","K26B1_TagDir","C1D_TagDir","K125E1_TagDir","C2D_TagDir","K26E1_TagDir","K125B1_TagDir","K125G1_TagDir", "C1C_TagDir", "C1F_TagDir", "C1I_TagDir", "C2C_TagDir", "C2F_TagDir", "C2I_TagDir", "K125C1_TagDir", "K125F1_TagDir", "K125I1_TagDir", "K26C1_TagDir")

file = "superEnhancers.txt"

SEs_list <- list()

for (i in dirs) {
  j = str_remove(i, "_TagDir")
  tmp_path <- file.path(path,i,file)
  tmp_table <- read.delim(tmp_path, header = F, skip = 45)
  colnames(tmp_table) <- c("PeakID",	"Chr",	"Start", "End",	"Strand",	"Normalized_Tag_Count",	"SuperEnhancer_slope", "FindPeaks_Score",	"Fold_over_input", "P.value?", "?")
  tmp_table <- tmp_table |> 
    dplyr::mutate("Sample" = j)
  SEs_list[[j]] <- tmp_table
}
```

#creo un dataframe
```{r}
SEs_DF <- data.frame()

for (i in seq_along(SEs_list)) {
  SEs_DF <- bind_rows(SEs_DF, SEs_list[[i]])
}

SEs_DF <- SEs_DF |> 
  dplyr::mutate("IP" = case_when(
    str_detect(Sample, "[ADG]$") ~ "H3K27ac",
    str_detect(Sample, "[ADG].$") ~ "H3K27ac",
    str_detect(Sample, "[CFI]$") ~ "H3K4me1",
    str_detect(Sample, "[CFI].$") ~ "H3K4me1",
    TRUE ~ "H2BK120ac"
  )) |> 
  dplyr::arrange(desc(IP), Sample)
```

```{r}
SEs_H3K27ac_H2BK120ac_H3K4me1 <- SEs_DF |> 
  ggplot(aes(x = Sample, fill = IP)) +
  geom_bar(color = "white") +
  scale_fill_manual(values = c("#FFDA13", "#0066E7", "#D4070F") ) +
  facet_wrap(~ IP, scales = "free_x") +
  theme_bw() +
  theme(legend.position = "none") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(
    title = "SuperEnhancers",
    x = NULL,
    y = "Counts"
  )

ggsave(SEs_H3K27ac_H2BK120ac_H3K4me1, filename = "/media/alessio/Data/hypoxia/ChIPseq/plot/SEs_H3K27acxH2BK120acxH3K4me1.png", dpi = 300, height = 9, width = 15)
```


#Annotazione dei superEnhancers
```{r}
path = "/media/alessio/Data/hypoxia/ChIPseq/Homer_anno/Tag_Directories"

dirs = c("C2A_TagDir","K26H1_TagDir","C2H_TagDir","K125A1_TagDir","C2E_TagDir","C1B_TagDir","K125H1_TagDir","K26D1_TagDir","C1G_TagDir","K125D1_TagDir","C1A_TagDir","C2B_TagDir","K26A1_TagDir","C1H_TagDir","C1E_TagDir","C2G_TagDir","K26G1_TagDir","K26B1_TagDir","C1D_TagDir","K125E1_TagDir","C2D_TagDir","K26E1_TagDir","K125B1_TagDir","K125G1_TagDir")

file_Anno <- "superEnhacers_Anno.txt"

SEs_annotation <- list()

for (i in dirs) {
  j = str_remove(i, "_TagDir")
  tmp_path <- file.path(path,i,file_Anno)
  tmp_table <- read.delim(tmp_path, header = T)
  tmp_table <- tmp_table |>
    dplyr::rename(Peak_ID = 1) |> 
    dplyr::mutate(Annotation = str_remove(Annotation, "\\s*\\(.*\\)")) |> 
    dplyr::mutate(Annotation = str_remove(Annotation, "\\.[0-9]+")) |> 
    dplyr::mutate(Detailed.Annotation = str_remove(Detailed.Annotation, "\\s*\\(.*\\)")) |> 
    dplyr::mutate("Sample" = j)
  SEs_annotation[[j]] <- tmp_table
}
```

#creazione di un dataframe unico e barplot
```{r}
SEs_annotation_Dataframe <- data.frame()

for (i in names(SEs_annotation)) {
  tmp_df <- SEs_annotation[[i]] |> 
    dplyr::select(Annotation, Gene.Name, Sample)
  SEs_annotation_Dataframe <- bind_rows(SEs_annotation_Dataframe, tmp_df)
}

SEs_annotation_Dataframe <- na.omit(SEs_annotation_Dataframe) |>   
  dplyr::mutate("IP" = case_when(
    str_detect(Sample, "[ADG]$") ~ "H3K27ac",
    str_detect(Sample, "[ADG].$") ~ "H3K27ac",
    TRUE ~ "H2BK120ac"
  )) |> 
  dplyr::arrange(desc(IP), Sample)

Peaks_barplot_fill <- function(df, subtitle) {
  df |> 
    ggplot(aes(x = Sample, fill = Annotation)) +
    geom_bar(position = "fill", stat = "count", color = "black") +
    geom_text(aes(label = after_stat(count)),
              stat = "count",
              position = position_fill(vjust = 0.5),
              color = "black",
              size = 3) +
    scale_y_continuous(name = "Percentage", labels = label_percent()) +
    scale_fill_brewer(palette = 2) +
    #scale_fill_manual(values = colorsss) +
    theme_bw() +
    labs(
      title = "Position of peaks",
      subtitle = subtitle,
      x = NULL,
      fill = "Position"
    ) +
    facet_wrap(~ IP, scales = "free_x")
}

SEs_distr_anno_barplot <- Peaks_barplot_fill(SEs_annotation_Dataframe, "SEs distribution")
SEs_distr_anno_barplot

ggsave(SEs_distr_anno_barplot, filename = "/media/alessio/Data/hypoxia/ChIPseq/plot/SEs_Homer_anno_distribution.png", dpi = 300, height = 10, width = 18)
```




#Ho fatto intersect fra i replicati, faccio dei Venndiagram

#importo i file come GRanges
```{r}
SEs_intersected_reps <- list()

path = "/media/alessio/Data/hypoxia/ChIPseq/Homer_anno/SEs_intersect"

SEs_files = c("H3K27ac_Cas9_normoxia_SEs_intersect.bed", "H3K27ac_Cas9_6H_hypoxia_SEs_intersect.bed", "H3K27ac_Cas9_24H_hypoxia_SEs_intersect.bed", "H3K27ac_H4KO_normoxia_SEs_intersect.bed", "H3K27ac_H4KO_6H_hypoxia_SEs_intersect.bed", "H3K27ac_H4KO_24H_hypoxia_SEs_intersect.bed", "H2BK120ac_Cas9_normoxia_SEs_intersect.bed", "H2BK120ac_Cas9_6H_hypoxia_SEs_intersect.bed", "H2BK120ac_Cas9_24H_hypoxia_SEs_intersect.bed", "H2BK120ac_H4KO_normoxia_SEs_intersect.bed", "H2BK120ac_H4KO_6H_hypoxia_SEs_intersect.bed", "H2BK120ac_H4KO_24H_hypoxia_SEs_intersect.bed",  "H3K4me1_Cas9_normoxia_SEs_intersect.bed", "H3K4me1_Cas9_6H_hypoxia_SEs_intersect.bed", "H3K4me1_Cas9_24H_hypoxia_SEs_intersect.bed", "H3K4me1_H4KO_normoxia_SEs_intersect.bed")

for (i in SEs_files) {
  namez = str_remove(i, "_intersect.bed")
  tmp_path = file.path(path,i)
  #tmp_df = read.delim(tmp_path, header = F)
  tmp_df = readPeakFile(tmp_path,as = "GRanges")
  SEs_intersected_reps[[namez]] <- tmp_df
}
```


```{r}
findOverlaps(SEs_intersected_reps[[7]], SEs_intersected_reps[[10]], ignore.strand = TRUE )


Venn_to_SEs_list_pair <- function(pos, IP) {
  for (i in pos) {
    name1 = names(SEs_intersected_reps[i])
    name2 = names(SEs_intersected_reps[i + 3])
    png(filename = paste0("/media/alessio/Data/hypoxia/ChIPseq/plot/","Venn_",name1,"x",name2,".png"))
    makeVennDiagram(list(SEs_intersected_reps[[name1]], SEs_intersected_reps[[name2]]), method = "hyperG",
                    NameOfPeaks = c(str_replace(name1, paste0(IP,"_"), ""), str_replace(name2, paste0(IP,"_"), "")), fill=c("#009E73", "#F0E442"),  col=c("white", "white"),
                    height = 280 , 
                    width = 380 , 
                    resolution = 300,
                    compression = "lzw",
                    lwd = 1,
                    cex = 1,
                    fontfamily = "sans",
                    cat.cex = 1,
                    cat.default.pos = "outer",
                    cat.pos = c(-27, 27),
                    cat.dist = c(0.055, 0.055),
                    cat.fontfamily = "sans",
                    main.cex = 1,
                    main.fontfamily = "sans",
                    #main.pos = c(-0.001, 1),
                    output=TRUE,
                    imagetype = "png",
                    margin = 0.09,
                    #filename = "gigi",
                    main = paste0(IP," Super Enhancers")
                    #filename = "/media/alessio/Data/hypoxia/ChIPseq/plot/","Venn_xxxxx.png"
    )
    dev.off()
  }
}

Venn_to_SEs_list_pair(1:3, "H3K27ac")
Venn_to_SEs_list_pair(7:9, "H2BK120ac")
Venn_to_SEs_list_pair(13:15, "H3K4me1")



Venn_to_SEs_list_three <- function(pos, list) {
  for (i in pos) {
    name1 = names(list[i])
    name2 = names(list[i + 6])
    name3 = names(list[i + 12])
    png(filename = paste0("/media/alessio/Data/hypoxia/ChIPseq/plot/","Venn_",name1,"x",name2,"x",name3,".png"))
    makeVennDiagram(list(list[[name1]],
                         list[[name2]],
                         list[[name3]]),
                    method = "hyperG",
                    NameOfPeaks = c(name1,
                                    name2,
                                    name3),
                    fill=c("#0066E7", "#FFDA13", "#D4070F"),
                    col = c("white", "white", "white"),
                    height = 2800 , 
                    width = 3800 , 
                    resolution = 3000,
                    compression = "lzw",
                    lwd = 1,
                    cex = 1,
                    fontfamily = "sans",
                    cat.cex = 1,
                    cat.default.pos = "outer",
                    #cat.dist = c(-0.1,0, 0.1),
                    #cat.pos = c(-90, 0, 90),
                    cat.fontfamily = "sans",
                    main.cex = 1,
                    main.fontfamily = "sans",
                    #main.pos = c(-0.001, 1),
                    output=TRUE,
                    imagetype = "png",
                    margin = 0.18,
                    #main = "Super enhancers"
    )
    dev.off()
  }
}

Venn_to_SEs_list_three(1:6, SEs_intersected_reps)
```

#Annoto i SEs (ho già fatto con Homer per i campioni singoli, qua sono sul consensus tra i replicati)
```{r}
txdb_V44 <- makeTxDbFromGFF("/media/alessio/Data/genome110/gencode/gencode.v44.annotation.gtf")

Annotation_H3K27ac_SEs_intersected_reps <- lapply(H3K27ac_SEs_intersected_reps, function(SEs_Granges) {
  anno <- annotatePeak(SEs_Granges, columns = c("ENTREZID", "ENSEMBL", "SYMBOL", "GENENAME"),
                       annoDb="org.Hs.eg.db",
                       TxDb = txdb, tssRegion=c(-3000, 3000))
  return(anno)
})

Annotation_H3K27ac_SEs_intersected_reps_Dataframe <- lapply(Annotation_H3K27ac_SEs_intersected_reps, function(SEs_Granges) {
  anno <- as.data.frame(SEs_Granges@anno)
  return(anno)
})
```


#Faccio intersect di db_super stomach smooth muscle cells SEs file bed con Cas9 in normoxia SEs
```{r}
Stomach_SM_cells_SEs <- readPeakFile("/home/alessio/Downloads/hglft_genome_1f128_a15100.bed", as = "GRanges")

subsetByOverlaps(Stomach_SM_cells_SEs, H3K27ac_SEs_intersected_reps$H3K27ac_Cas9_normoxia_SEs, ignore.strand = T)

#troppo pochi
```