library(crayon)
cat(red$bold$bgYellow("matrix filter"))
''
x = rbind(c(11, 13, 15), c(12, 14, 16), c(17, 19, 21))
x
cat(red('x[x[, 3]%%3 ==0, ] 显示矩阵x 第3列 可以被3整除的 行\n'))
x[x[, 3]%%3 ==0, ]