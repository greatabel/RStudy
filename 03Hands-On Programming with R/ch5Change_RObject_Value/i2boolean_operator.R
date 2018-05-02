library(crayon)

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")


deck3 <- deck
deck3$value <- 0
deck3$value['hearts' == deck3$suit] <- 1