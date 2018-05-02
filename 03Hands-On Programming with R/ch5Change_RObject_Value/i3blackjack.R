library(crayon)

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")

shuffle <- function(cards) {
    random <- sample(1:52, size = 52)
    cards[random, ]

}

deck5 <- deck

facecard <- deck5$face %in% c('king', 'queen', 'jack')
deck5[facecard,]
deck5$value[facecard] <- 10
head(deck5, 13)

cat(red$bold$bgGreen("----------"), '\n')
# print(shuffle(deck5))