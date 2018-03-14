library(crayon)

x <- c(TRUE, FALSE, TRUE)
y <- c(TRUE, TRUE, FALSE)

if( x[1] && y[1]) cat('both true\n')

if(x & y) cat('both true again\n')