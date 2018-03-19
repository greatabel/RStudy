x <- seq(-3, 3, by = 0.1)
cdf <- pnorm (x, 0, 1)
plot(cdf ~ x, type = "o")