library(crayon)

cat(blue$bold$bgMagenta("需要矩阵乘法，必须作出请求"), '\n')

die <- 1:6

'die %*% die 行内乘法 1*1 + 2*2 + 3*3 + 4*4 + 5*5 + 6*6'
die %*% die
'die %o% die 行外乘法'
die %o% die