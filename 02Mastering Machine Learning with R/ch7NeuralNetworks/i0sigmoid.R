sigmoid <- function(x) {
    1 / (1 + exp(-x) )
}

x <- seq(-5, 5, .1)
# 'x='; x
plot(sigmoid(x))