library(crayon)


die <- 1:6
cat(black$bold$bgMagenta("矩阵"), '\n')

m <- matrix(die, nrow = 2)
m

m <- matrix(die, nrow = 2, byrow = TRUE)
m