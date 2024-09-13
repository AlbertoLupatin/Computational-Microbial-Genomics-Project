library(readr)

x <- read_tsv("/Users/albertolupatin/Desktop/Genomics/Project/Prokka/genes.tsv")
x <- as.data.frame(x)

CDS <- subset(x, ftype == "CDS")
nrow(CDS)

tRNA <- subset(x, ftype == "tRNA")
nrow(tRNA)

h_pro <- subset(x, product == "hypothetical protein")
nrow(h_pro)

pro <- subset(x, ftype == "CDS" & product != "hypothetical protein")
nrow(pro)

core_EC<- names(which(table(x$EC_number) >= 30))
core <- x[x$EC_number %in% core_EC, ]

core_name <- names(which(table(x$locus_tag) < 30))

my_data <- list()
temp = list.files(path = "/Users/albertolupatin/Desktop/Genomics/Project/Prokka/TSVs", pattern="\\.tsv$",)
setwd("/Users/albertolupatin/Desktop/Genomics/Project/Prokka/TSVs")
my_data <- lapply(temp, read_tsv)


CDS <- names(my_data)[sapply(my_data, function(x) 'CDS' %in% x$ftype)]
