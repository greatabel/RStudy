reverse.list <- function(x){
    for(i in 1: (length(x)/2)){
        tmp = x[i]
        x[i] = x[length(x)-i + 1]
        x[length(x)-i+1] = tmp
    }
    return (x)
}

x <- c(1, 2, 3)
x
reverse.list(x)

new_reverse.list <- function(x){
    for(i in 1: (length(x)/2)){
        tmp = x[i]
        x[i] = x[length(x)-i + 1]
        x[length(x)-i+1] = tmp
    }
    x
}

new_reverse.list(x)
