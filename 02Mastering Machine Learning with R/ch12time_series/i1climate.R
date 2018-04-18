climate <- read.csv("../data/climate.csv", stringsAsFactors = F)
str(climate)

climate <- ts(climate[, 2:3], frequency = 1, 
              start = 1919, end = 2013)
head(climate)


library(forecast)
library(tseries)

plot(climate)


cor(climate)