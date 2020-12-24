library(crayon)

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")

shuffle <- function(cards) {
    random <- sample(1:52, size = 52)
    cards[random, ]

}
print(shuffle(deck))