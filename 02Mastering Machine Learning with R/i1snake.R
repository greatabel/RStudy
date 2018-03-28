library(crayon)

cat(blue$bold("snake river"), '\n')

library(alr3)
data(snake)

'dim(snake)';  dim(snake)
'head(snake)'; head(snake)

'names(snake)'
names(snake) <- c('content', 'yield')

attach(snake)
cat(blue$bold("after attach(snake)"), '\n')
head(snake)

plot(content, yield, xlab = 'water content of snow',
    ylab = 'water yield')