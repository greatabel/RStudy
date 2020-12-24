library(plotrix)

countries <- c("Brazil", "Russia", "India", "China", "Souch Africa")
GDP <- c(23920, 20790, 18618, 94906, 3660)

fan.plot(GDP, labels = countries, main = "Fan plot")