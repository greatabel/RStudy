library(crayon)

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")

deck2 <- deck
cat(red$bold$bgCyan("修改值"), '\n')
deck2$new <- 1:52

head(deck2)