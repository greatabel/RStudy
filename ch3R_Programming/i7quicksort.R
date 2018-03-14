quicksort <- function(x){
    if(length(x) <= 1) return(x)
    pivot <- x[1]
    rest <- x[-1]
    sv1 <- rest[rest < pivot]
    sv2 <- rest[rest >= pivot]
    sv1 <- quicksort(sv1)
    sv2 <- quicksort(sv2)
    return(c(sv1, pivot, sv2))
}

x <- c(10, 9, 1, 2)
'x='; x
quicksort(x)