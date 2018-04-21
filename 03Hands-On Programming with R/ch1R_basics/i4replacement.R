library(crayon)

cat(blue$bold$bgMagenta("不可放回抽样: 不会出现2个一样点数"), '\n')
die <- 1:6
for(i in 1:25) {
    two_die = sample(die, size = 2)
    print(two_die)
}

cat(blue$bold$bgMagenta("可放回抽样: 出现2个一样点数"), '\n')

for(i in 1:25) {
    two_die = sample(die, size = 2, replace = TRUE)
    print(two_die)
}