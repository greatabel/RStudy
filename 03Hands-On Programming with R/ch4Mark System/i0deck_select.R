library(crayon)

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")

'R的索引和线性代数一样，第一个元素的索引值始终是1，因为R是为数学家编写的语言'
cat(black$bold$bgCyan("head(deck)"), '\n')
head(deck)

'deck[1, 1]='; deck[1, 1]
'deck[2, 2]='; deck[2, 2]
'deck[3, 3]='; deck[3, 3]

cat(black$bold$bgCyan("提取多个值,例如第一行所有值"), '\n')
deck[1, c(1, 2, 3)]
deck[1, 1:3]
new <- deck[1, c(1,2,3)]
new

cat(black$bold$bgCyan("重复提取相应值"), "\n")
deck[c(1, 1), c(1, 2, 3)]

vec <- c(6, 1, 3, 6, 10, 5)
vec[1:3]