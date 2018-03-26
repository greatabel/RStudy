attach(mtcars)

d <- density(mpg)
plot(d)

plot(d, main = "density of miles/gallon")
polygon(d, col = 'wheat', border = 'blue')
rug(jitter(mpg, amount = 0.01), col = 'brown')