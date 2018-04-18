library(crayon)
library(arules)
library(arulesViz)

library(recommenderlab)


data(Jester5k)
Jester5k
Jester5k[10, ]
rowMeans(Jester5k[10, ])
colMeans(Jester5k[, 1])

hist(getRatings(Jester5k), breaks = 100)
hist(getRatings(normalize(Jester5k)), breaks = 100)
hist(rowCounts(Jester5k), breaks = 50)

set.seed(123)
e <- evaluationScheme(Jester5k, 
                      method = "split", train = 0.8, 
                      given=15, goodRating = 5)