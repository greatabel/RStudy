library(crayon)
cat(blue$bold$bgGreen("-----------------"), '\n')

ratings <- c(3,5,5,5,1,1,5,2,5,1,1,5,3,5,1,5,4,2,4,3,4,2,1,4)
ratingMat <- matrix(ratings, nrow = 6)
rownames(ratingMat) <- c("Homer","Marge","Bart","Lisa","Flanders","Me")
colnames(ratingMat) <- c("Avengers","American Sniper","Les Miserable","Mad Max")


library(psych)
pca <- principal(ratingMat, nfactors = 2, rotate = "none")
pca