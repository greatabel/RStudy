library(alr3)
data(snake)

names(snake) <- c('content', 'yield')

attach(snake)

yield.fit <- lm(yield ~ content)
summary(yield.fit)

plot(content, yield)
abline(yield.fit, lwd=3, col='red')

par(mfrow = c(2,2))
plot(yield.fit)
qqPlot(yield.fit)