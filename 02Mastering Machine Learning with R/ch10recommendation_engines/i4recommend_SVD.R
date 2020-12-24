library(crayon)
cat(blue$bold$bgGreen("-----------------"), '\n')

ratings <- c(3,5,5,5,1,1,5,2,5,1,1,5,3,5,1,5,4,2,4,3,4,2,1,4)
ratingMat <- matrix(ratings, nrow = 6)
rownames(ratingMat) <- c("Homer","Marge","Bart","Lisa","Flanders","Me")
colnames(ratingMat) <- c("Avengers","American Sniper","Les Miserable","Mad Max")
ratingMat

svd <- svd(ratingMat)
cat(blue$bold$bgGreen("svd"), '\n')
svd

sum(svd$d)
var <- sum(svd$d[1:2])
var
var/sum(svd$d)

f1 <- function(x) {
  score = 0
  for(i in 1:n )
    score <- score + svd$u[, i] %*% t(svd$v[, i]) * svd$d[i] 
  return(score)
}
n = 4
f1(svd)
n = 2
f1(svd)