library(crayon)

cat(red$bold$bgGreen("R用NA表示 not available"), '\n')

NA
1 + NA
NA == 1
t = c(NA, 1: 50)
mean(t)



cat(red$bold$bgGreen("R大多数函数有 可选参数na.rm "), '\n')
mean(t, na.rm = TRUE)

cat(red$bold$bgGreen("R提供特别函数测试某个值是否是NA"), '\n')
is.na(NA)
is.na(c(1, 2, 3, NA))

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")
deck5 <- deck
deck5$value[deck5$face == 'ace'] <- NA
