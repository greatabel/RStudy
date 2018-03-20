male <- c(124, 88, 200)
female <- c(108, 56, 221)

degree <- c("low", "middle", "high")
myopia <- data.frame(degree, male, female)

myopia

'查看内部结构\n'
str(myopia)

myopia2 <- data.frame(c("low", "middle", "high"),
                      c(124, 88, 200),
                      c(108, 56, 221)
                      )
myopia2

weight <- c(50, 70, 80, 60)
age <- c(20, 30)
wag <- data.frame(weight, age)
wag

