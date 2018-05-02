library(crayon)
library(pryr)

cat(red$bold$bgGreen("函数带有参数，运行环境为每个参数制作一个副本"), '\n')

foo <- 'take me to your runtime'

show_env <- function(x = foo){
    a <- 1
    b <- 2
    c <- 3
    list(ran.in = environment(),
         parent = parent.env(environment()),
         objects = ls.str(environment()))
}

show_env()