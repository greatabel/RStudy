library(ggplot2)

x <- c(1, 2, 2, 2, 3, 3)
qplot(x, binwidth = 1)

x3 <- c(0, 1, 1, 2, 2, 2, 3, 3, 4)
qplot(x3, binwidth = 1)