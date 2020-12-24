library(crayon)


die <- 1:6
cat(black$bold$bgMagenta("维度属性: dim(die) <- c(2, 3) 变成3X2矩阵"), '\n')
dim(die) <- c(2, 3)
die
cat(black$bold$bgMagenta("维度属性: dim(die) <- c(2, 3) 变成1X23超立方体"), '\n')
dim(die) <- c(1, 2, 3)
die