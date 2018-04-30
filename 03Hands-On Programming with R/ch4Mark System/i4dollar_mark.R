library(crayon)

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")
cat(red$bold$bgCyan("$提取数据框或者列表对象中的值"), '\n')

deck[1:5,]

cat(black$bold$bgCyan("deck$value"), '\n')

t = deck[1:5,]
t$value