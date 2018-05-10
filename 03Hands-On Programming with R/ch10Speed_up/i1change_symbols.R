change_symbols <- function(vec) {
    for(i in 1: length(vec)){
        if (vec[i] == 'DD') {
            vec[i] <- 'joker'
         } else if (vec[i] == 'C') {
            vec[i] <- 'ace'
         } else if (vec[i] == '7') {
            vec[i] <- 'king'
         } else if (vec[i] == 'B') {
            vec[i] <- 'queen'
         } else if (vec[i] == 'BB') {
            vec[i] <- 'jack'
         } else if (vec[i] == 'BBB') {
            vec[i] <- 'ten'
         } else {
            vec[i] <- 'nine'
         }
    }
    vec
}

vec <- c('DD', 'C', '7', 'B', 'BB', 'BBB', '0')
change_symbols(vec)