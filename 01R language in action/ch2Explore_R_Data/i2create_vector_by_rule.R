z0 <- seq(1, 5, by=0.5)
z0
z1 <- seq(from=1, to=5, by=0.5)
z1

z2 <- seq(10, 100, length=3)
z2
z2 <- seq(10, 100, length=4)
z2
z2 <- seq(10, 100, length=10)
z2

z3 <- rep(1:5,2)
'rep(1:5,2)'; z3
z3 <- rep(1:5, times=2)
z3

z4 <- rep(1:4, each=2, times=3)
z4

'c() 若向量（序列) 没什么规律'
z5 <- c(11, 13, 17, 19)
z5
z5 <- c(1, 2, 3, 1)
z5