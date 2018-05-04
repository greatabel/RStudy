library(crayon)
cat(red$bold$bgGreen("R的S3系统有3个组成部分：属性attribu，
    泛型函数generic funcion, 方法method"), '\n')

num <- 1000000000
print(num)

class(num) <- c("POSIXct", "POSIXt")
print(num)

DECK <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")
attributes(DECK)

cat(red$bold$bgGreen("row.names(DECK)"), '\n')
row.names(DECK)

cat(red$bold$bgGreen("修改后："), '\n')
row.names(DECK) <- 1001: 1052
levels(DECK) <- c("level 1", "level 2", "level 3")

attributes(DECK)

source("../ch7Program/i4score_func.R")
one_play <- play()
cat(red$bold$bgGreen("play："), '\n')
one_play

attributes(one_play)

attr(one_play, "symbols") <- c("B", "0", "B")

attributes(one_play)
attr(one_play, "symbols")
one_play

'one_play + 1'; one_play + 1