temp <- list(1:10, -2:-9)

library(crayon)
cat(red$bold$bgGreen("temp") , "\n")
temp

'向量模式\n'
lapply(temp, mean)

'矩阵模式\n'
sapply(temp, mean)