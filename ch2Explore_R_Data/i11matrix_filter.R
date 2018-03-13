library(crayon)
cat(red$bold$bgGreen("matrix filter"))

''
x = rbind(c(11, 13, 15), c(12, 14, 16), c(17, 19, 21))
x
cat(red('x[x[, 3]%%3 ==0, ] 显示矩阵x 第3列 可以被3整除的 行\n'))
x[x[, 3]%%3 ==0, ]

cat(blue$bold('如果单独执行 %% 取模操作\n'))
result <- x[, 3] %% 3 == 0
'result <- x[, 3] %% 3 == 0'; result
cat(green$bold('将该向量应用到矩阵x \n'))
'x[result, ]'; x[result, ]

cat(yellow$bold('矩阵也是向量，向量的运算同样适用\n'))
m <- matrix(c(4, 3, 8,
    9, 5, 1,
    2, 7, 6), nrow = 3)
'm='; m
'which(m %% 2 == 0)'; which(m %% 2 == 0)
cat(magenta$bold('筛选处元素全部是奇数的行\n'))

'm[m[, 1] %% 2 == 1 && m[, 2] %% 2 == 1 & m[, 3] %% 2 == 1,]';
m[m[, 1] %% 2 == 1 & m[, 2] %% 2 == 1 & m[, 3] %% 2 == 1,]

'通过设置drop为False 我们最终得到矩阵，而非向量'
m[m[, 1] %% 2 == 1 & m[, 2] %% 2 == 1 & m[, 3] %% 2 == 1, ,drop=FALSE]

'R是函数式语言，[ ]也是函数'
"["(m, m[, 1] %% 2 == 1 & m[, 2] %% 2 == 1 & m[, 3] %% 2 == 1, ,drop=FALSE )