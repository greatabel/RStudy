x <- c(1:5)
'x='; x

print_fun <- function(x) {
    for(i in 1:length(x)) {
        print( 10 * x[i])
    }
}

print_fun(x)