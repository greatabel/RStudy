library(crayon)

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")


cat(black$bold$bgCyan("'返回除第一行元素之外的'"), '\n')
deck[-1, 1:3]
cat(black$bold$bgCyan("'返回排除第2行到第52行'"), '\n')
deck[-(2:52), 1:3]

cat(black$bold$bgCyan("空格告诉R提取代表维度所有元素"), '\n')
deck[1, ]