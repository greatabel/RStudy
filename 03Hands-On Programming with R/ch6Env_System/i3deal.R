library(crayon)
library(pryr)

cat(red$bold$bgGreen("deal"), '\n')

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")

# assign('deck', deck, envir = globalenv())
# globalenv()$deck

deal <- function() {
    card <- deck[1,]
    # deck <- deck[-1, ]
    assign('deck', deck[-1, ], envir = globalenv())
    card
}

deal()
deal()