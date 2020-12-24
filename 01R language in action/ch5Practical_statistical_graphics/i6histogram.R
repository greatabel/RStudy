attach(mtcars)


hist(mpg, breaks = 15, xlim=c(10, 35),
    xlab = 'miles/gallon', main = 'colored histogram example (breaks=15)')
hist(mpg, breaks = 10, xlim=c(10, 35),
    xlab = 'miles/gallon', main = 'colored histogram example (breaks=10)')

library(crayon)
cat(blue$blurred("breaks接受的值不仅可以是单一的数值，而且还可以是一个或者多个数值
   组成的向量类型数据 \n"))

t <- c(2*5:9, 5*4:7)
t

hist(mpg, breaks = c(2*5:9, 5*4:7), col='blue1',
    ylim = c(0, 0.12), 
    xlab = 'miles/gallon', main = 'non-equidistant breaks')

'freq=FALSE 根据概率密度而不是频数绘制'
hist(mpg, breaks = 12, col='blue1',
    ylim = c(0, 0.12), xlim = c(10, 35),
    freq = FALSE,
    xlab = 'miles/gallon', main = 'Density')