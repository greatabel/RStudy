library(crayon)
library(pryr)
# https://stackoverflow.com/questions/27541539/r-could-not-find-function-parenvs

cat(red$bold$bgGreen("R活动环境 任何时候只有一个"), '\n')
environment()

cat(red$bold$bgGreen("show_env()"), '\n')
show_env <- function(){
    a <- 1
    b <- 2
    c <- 3
    list(ran.in = environment(),
         parent = parent.env(environment()),
         objects = ls.str(environment()))
}

show_env()
show_env()

cat(red$bold$bgGreen("environment(parenvs)"), '\n')
environment(parenvs)