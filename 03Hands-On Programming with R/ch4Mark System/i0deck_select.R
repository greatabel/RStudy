library(crayon)

cat(black$bold$bgCyan("deck"), '\n')


deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")

cat(black$bold$bgCyan("head(deck)"), '\n')
head(deck)

'deck[1, 1]='; deck[1, 1]