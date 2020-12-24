library(crayon)

cat(black$bold$bgCyan("deck"), '\n')


MyData <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")
MyData