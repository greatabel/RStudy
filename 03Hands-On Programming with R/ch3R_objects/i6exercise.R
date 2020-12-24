hand1 <- c('ace', 'king', 'queen', 'jack', 'ten'
    , 'spades', 'spades', 'spades', 'spades', 'spades')

m1 <- matrix(hand1, nrow = 5)
m1

m2 <- matrix(hand1, ncol = 2)
m2

dim(hand1) <- c(5, 2)
hand1
