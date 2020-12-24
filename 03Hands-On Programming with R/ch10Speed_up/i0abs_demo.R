library(crayon)

abs_loop <- function(vec) {
    for (i in 1: length(vec)){
        if ( vec[i] < 0) {
            vec[i] <- -vec[i]
        }
    }
    vec
}

a <- c(1:100)
abs_loop(a)

cat(red$bold$bgGreen("向量化版本"), '\n')

abs_set <- function(vec) {
    negs <-  vec < 0
    vec[negs] <- vec[negs] * -1
    vec
}
abs_set(a)

long <- rep(c(-1, 1), 50000000)
system.time(abs_loop(long))
cat(red$bold$bgGreen("向量化版本"), '\n')
system.time(abs_set(long))