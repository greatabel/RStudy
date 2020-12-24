roll2 <- function(bones = 1:6) {
    dice <- sample(bones, size = 2, replace = TRUE)
    cat('dice=', dice)
    sum(dice)
}


roll2(bones = 1:4)
roll2()