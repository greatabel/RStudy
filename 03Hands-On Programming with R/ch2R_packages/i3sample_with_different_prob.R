library(ggplot2)

roll <- function() {
    dice <- sample(1:6, size = 2, replace = TRUE, prob=c(.125,.125,.125, .125,.125, .375))
    # cat(' dice=', dice)
    sum(dice)
}


rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)
