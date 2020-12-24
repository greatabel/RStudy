library(crayon)

cat(blue$bold$bgMagenta("R函数执行方式是从内到外"), '\n')
'四舍五入'; round(3.14159265359)
'阶乘'; factorial(5)

'round(mean(1:6))'; round(mean(1:6))

cat(blue$bold$bgMagenta("🎲"), '\n')
die <- 1: 6
sample(x = die, size = 1)
sample(x = die, size = 1)

'查看参数名'; args(sample); args(round)
round(3.14159265359, digits = 4)
sample(size = 1, x = die)
