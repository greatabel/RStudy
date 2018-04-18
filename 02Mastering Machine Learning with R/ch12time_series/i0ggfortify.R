library(ggfortify)

set.seed(123)
ar1 <- arima.sim(list(order = c(1, 0, 0), ar = 0.5), n = 200)
autoplot(ar1, main = "AR1")
autoplot(acf(ar1, plot = F), main = "AR1 - ACF")
autoplot(pacf(ar1, plot = F), main = "AR1 - PACF")