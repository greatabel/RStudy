library(crayon)

cat(black$bold$bgCyan("deck"), '\n')

mypath <- file.path("../data/cards.csv")
MyData <- read.csv(file=mypath, header=TRUE, sep=",")
MyData