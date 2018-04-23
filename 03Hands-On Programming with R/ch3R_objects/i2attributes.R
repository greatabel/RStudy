library(crayon)

die <- 1:6
attributes(die)
names(die)

cat(black$bold$bgMagenta("设置names"), '\n')

names(die) <- c('一','二', '三', '四', '五', '六')
'attributes(die)'; attributes(die)
'names(die)'; names(die)
'die'
die
'die + 1'
die + 1