Fib <- function(n){
    if(n <= 1) return(n)
    else return (Fib(n-1) + Fib(n-2))
}

Fib.array <- function(n){
    for(i in 1:n){
        cat(Fib(i), " ")
        if(i >= n){
            cat("\n")
            break
        }
    }
}

Fib.array(10)