# Data Access Guide
# Sadie Allen
# June 21, 2017
# Reminders of which data are stored where and how to access them

## Loading Data ##
# islet data
load("/Users/s-allens/Documents/ssp/summer_project/data/DO378_islet.RData")
rownames(annot.samples) <- annot.samples$Mouse.ID

# phenotype data
#matched_phenotypes <- read.csv("/Users/s-allens/Documents/ssp/summer_project/data/old_data/matched_pheno_clin.csv", as.is=TRUE)
#ghrelin_shortlist <- read.csv("/Users/s-allens/Documents/ssp/summer_project/data/old_data/ghrelin_shortlist2.csv")
#rownames(ghrelin_shortlist) <- ghrelin_shortlist[,1]
#rownames(matched_phenotypes) <- ghrelin_shortlist[,1]

# UPDATED PHENOTYPE DATA
matched_phenos <- read.csv("/Users/s-allens/Documents/ssp/summer_project/data/matched_phenos.csv", as.is=TRUE)
rownames(matched_phenos) <- matched_phenos[,1]
ghrelin_list <- read.csv(file = "/Users/s-allens/Documents/ssp/summer_project/data/ghrelin_list.csv")
rownames(ghrelin_list) <- ghrelin_list$Mouse.ID

## annot.mrna ##
# Contains name, function, and position information about the 21,771 genes

# Remember, these do not contain any of the expression data, just name data!
gene_ids <- annot.mrna$id
gene_names <- annot.mrna$symbol

# To get an entire row of information for a specific gene (when you know the name):
gene_info <- annot.mrna[which(annot.mrna$symbol == "NAME_YOU_WANT"), ]
# Do the same thing with the id using:
gene_info <- annot.mrna[which(annot.mrna$id == "ID_YOU_WANT"), ]
# This will provide you with the start and end position of the gene,
# the chromosome it is on, the nearest snip, and its "biotype"
# (protein coding, etc)

## annot.samples ##
# Contains basic information about mice

mouse_ids <- annot.samples$Mouse.ID # these can be used for row names on many occasions!
# annot.samples also contains sex, generation, and age data for the mice

## rankz.mrna ##
# Contains normalized expression data for all 21,771 genes

# To use this to get gene expression data for a gene in column i:
gene_exp <- rankz.mrna[,1]

# To get gene expression data for a gene named "NAME_YOU_WANT", use the get_exp_dat function!
gene_exp <- gene_exp_dat("NAME_YOU_WANT")




