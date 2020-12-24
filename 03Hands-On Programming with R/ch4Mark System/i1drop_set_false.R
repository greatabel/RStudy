library(crayon)

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")


deck[1:2, 1:2]
class(deck[1:2, 1:2])

cat(black$bold$bgCyan("如果只提取1列，R返回是向量，而不是数据框"), '\n')
deck[1:2, 1]
class(deck[1:2, 1])

cat(black$bold$bgCyan("想要返回数据框，可以使用drop = FALSE"), '\n')
deck[1:2, 1, drop = FALSE]
class(deck[1:2, 1, drop = FALSE])