library(crayon)
library(pryr)

cat(red$bold$bgGreen("deal"), '\n')

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")



deal <- function() {
    card <- deck[1,]
    # deck <- deck[-1, ]
    assign('deck', deck[-1, ], envir = globalenv())
    card
}

shuffle <- function() {
    random <- sample(1:52, size=52)
    assign('deck', DECK[random, ], envir = globalenv())
}


setup <- function(deck){
    DECK <- deck

    DEAL <- function(){
            card <- deck[1,]

            assign('deck', deck[-1, ], envir = parent.env(environment()))
            card
    }

    SHUFFLE <- function() {
            random <- sample(1:52, size=52)
            assign('deck', DECK[random, ], envir = parent.env(environment()))
    }
    list(deal = DEAL, shuffle = SHUFFLE)
}

cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle

cat(red$bold$bgGreen("===="), '\n')
deal()
deal()
cat(red$bold$bgGreen("==shuffle()=="), '\n')
shuffle()
deal()
deal()
