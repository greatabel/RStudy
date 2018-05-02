library(crayon)

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")


deck3 <- deck
deck3$value <- 0
deck3$value['hearts' == deck3$suit] <- 1

cat(red$bold$bgCyan("Q牌"), '\n')
deck3[deck3$face == 'queen', ]

cat(red$bold$bgCyan("黑桃"), '\n')
deck3[deck3$suit == 'spades', ]

cat(red$bold$bgCyan("黑桃Q 点数设置为13"), '\n')
deck3$value[deck3$face == 'queen' & deck3$suit == 'spades'] <- 13
deck3[deck3$face == 'queen' & deck3$suit == 'spades',]