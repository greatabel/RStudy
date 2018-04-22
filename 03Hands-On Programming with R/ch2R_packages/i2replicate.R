library(ggplot2)


replicate(3, 1 + 1)

roll <- function(bones = 1:6) {
    dice <- sample(bones, size = 2, replace = TRUE)
    # cat(' dice=', dice)
    sum(dice)
}


rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)
