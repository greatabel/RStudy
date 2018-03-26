rnorm(10)

normal.pop <- rnorm(1000)
par(mfrow = c(1, 2)) # 准备绘制2个并列的图
plot(density(normal.pop), xlim = c(-4, 4), main='标准正态分布（模拟）')
curve(dnorm(x), from = -4, to=4, main='标准正态分布（标准）')