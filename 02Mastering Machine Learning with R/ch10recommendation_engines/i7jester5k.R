library(crayon)
library(arules)
library(arulesViz)

library(recommenderlab)


data(Jester5k)
e <- evaluationScheme(Jester5k, 
                      method = "split", train = 0.8, 
                      given=15, goodRating = 5)

recommenderRegistry$get_entries(dataType = "realRatingMatrix")
ubcf <- Recommender(getData(e, "train"), "UBCF")
ibcf <- Recommender(getData(e, "train"), "IBCF")
svd <- Recommender(getData(e, "train"), "SVD")
popular <- Recommender(getData(e, "train"), "POPULAR")
# pca <- Recommender(getData(e, "train"), "PCA")
random <- Recommender(getData(e, "train"), "RANDOM")

ubcf_pred <- predict(ubcf, getData(e, "known"), type = "ratings")
ibcf_pred <- predict(ibcf, getData(e, "known"), type = "ratings")
svd_pred <- predict(svd, getData(e, "known"), type = "ratings")
pop_pred <- predict(popular, getData(e, "known"), type = "ratings")
ran_pred <- predict(random, getData(e, "known"), type = "ratings")

P1 <- calcPredictionAccuracy(ubcf_pred, getData(e, "unknown"))
P1
P2 <- calcPredictionAccuracy(ibcf_pred, getData(e, "unknown"))
P3 <- calcPredictionAccuracy(svd_pred, getData(e, "unknown"))
P4 <- calcPredictionAccuracy(pop_pred, getData(e, "unknown"))
P5 <- calcPredictionAccuracy(ran_pred, getData(e, "unknown"))

error <- rbind(P1, P2, P3, P4, P5)
rownames(error) <- c("UBCF", "IBCF", "SVD", "Popular", "Random")
error

algorithms <- list(
  POPULAR = list(name = "POPULAR"),
  UBCF = list(name = "UBCF"),
  IBCF = list(name = "IBCF"))
algorithms

evlist <- evaluate(e, algorithms, n = c(5, 10, 15))
options(digits = 3)
set.seed(1)
avg(evlist)
plot(evlist, legend = "topleft", annotate = TRUE)
plot(evlist, "prec", legend = "bottomright", annotate = TRUE)

R1 <- Recommender(Jester5k, method = "POPULAR")
R1
recommend <- predict(R1, Jester5k[1:2], n = 5)
as(recommend, "list")
rating <- predict(R1, Jester5k[300:309], type = "ratings")
rating
as(rating, "matrix")[, 71:73]

Jester.bin <- binarize(Jester5k, minRating = 5)
Jester.bin <- Jester.bin[rowCounts(Jester.bin) > 10]
Jester.bin
set.seed(456)
e.bin <- evaluationScheme(Jester.bin, 
                          method = "cross-validation", k = 5, given = 10)
algorithms.bin <- list("random" = list(name="RANDOM", param=NULL),
                       "popular" = list(name = "POPULAR", param = NULL),
                       "UBCF" = list(name="UBCF"))
results.bin <- evaluate(e.bin, algorithms.bin, n = c(5, 10, 15))
plot(results.bin, legend  ="topleft")
plot(results.bin, "prec", legend = "bottomright")