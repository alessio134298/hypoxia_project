{
  library(tidyverse)
  library(patchwork)
  library(clusterProfiler)
}

interactions_hypoxia_genes_folder <-  'interaction_hypoxia_repclones/'

# Genes due to interaction
#NB: remember that here up means: more effect in KO, down: more effect in Cas9
{
  genes_interaction_files <- list.files(interactions_hypoxia_genes_folder, full.names = T)
  genes_interaction_up <- vector()
  genes_interaction_down <- vector()
  
  for (i in genes_interaction_files) {
    g <- read_lines(i)
    if (str_detect(i, 'up')) {
      genes_interaction_up <- c(genes_interaction_up, g)
    } else {
      genes_interaction_down <- c(genes_interaction_down, g)    
    }
    
  }
}

# gene ontology
GO_enrichment_more_H4KO_effect <- enrichGO(genes_interaction_up, 
                             ont = "ALL",
                             keyType = "SYMBOL",
                             OrgDb = "org.Hs.eg.db")

GO_enrichment_more_Cas9_effect <- enrichGO(genes_interaction_down, 
                               ont = "ALL",
                               keyType = "SYMBOL",
                               OrgDb = "org.Hs.eg.db")


dotplot(GO_enrichment_more_H4KO_effect, title = 'Genes with more \ninteraction in HDAC4 KO')
dotplot(GO_enrichment_more_Cas9_effect, title = 'Genes with more \ninteraction in Cas9')

genes_hypoxia_related <- GO_enrichment_more_Cas9_effect %>% 
  as.data.frame() %>% 
  dplyr::filter(str_detect(Description, 'hypoxia|oxygen levels')) 
genes_hypoxia_related <- genes_hypoxia_related$geneID

genes_hypoxia_related_vector <- vector()
for (i in genes_hypoxia_related) {
  u <- str_split(i, pattern = '/') %>% unlist()
  print(u)
  genes_hypoxia_related_vector <- unique(c(genes_hypoxia_related_vector, u))
}

genes_hypoxia_related_vector


