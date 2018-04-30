library(crayon)

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")


cat(black$bold$bgCyan("'返回除第一行元素之外的'"), '\n')
deck[-1, 1:3]
cat(black$bold$bgCyan("'返回排除第2行到第52行'"), '\n')
deck[-(2:52), 1:3]

cat(black$bold$bgCyan("空格告诉R提取代表维度所有元素"), '\n')
deck[1, ]

cat(black$bold$bgCyan("R会匹配索引值为TRUE的行位置/列位置"), '\n')
deck[1, c(TRUE, TRUE, FALSE)]


cat(red$bold$bgCyan("如果被索引的对象有名称，可以采用名称索引"), '\n')
deck[1, c('face', 'suit', 'value')]

'整个value列'
deck[, 'value']