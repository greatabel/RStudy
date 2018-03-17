attach(mtcars)

mpg
hist(mpg)

hist(mpg, breaks = 12, col = 'lightblue' , border = 'pink',
    xlab = 'miles/gallon', main = 'colored histogram example .1')
hist(mpg, breaks = 12, col = 'blue1' , xlim = c(10, 35),
    xlab = 'miles/gallon', main = 'colored histogram example .2')
