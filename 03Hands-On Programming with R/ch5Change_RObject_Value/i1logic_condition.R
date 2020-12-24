library(crayon)

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")

deck2 <- deck

sum('ace' == deck2$face)
deck2$value['ace' == deck2$face] <- 14
head(deck2, 13)

cat(red$bold$bgCyan("应用到新扑克牌游戏 Hearts游戏中：除花色为♥️的和♠️Q，其他点数都是0"), '\n')
deck3 <- deck
deck3$value <- 0
deck3$value['hearts' == deck3$suit] <- 1


deck3
