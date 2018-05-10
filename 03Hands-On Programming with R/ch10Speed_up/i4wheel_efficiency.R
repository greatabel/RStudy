score_many <- function(symbols) {
    chrries <- rowSums(symbols == 'C')
    diamonds <- rowSums(symbols == 'DD')

    prize <- c(0, 2, 5)[chrries + diamonds + 1]

    prize[!chrries] <- 0

    same <- symbols[, 1] == symbols[, 2] & symbols[, 2] == symbols[, 3]
    payoffs <- c('DD' = 100, '7' = 80, 'BBB' = 40,
                 'BB' = 25, 'B' = 10, 'C' = 10, '0' = 0)
    prize[same] <- payoffs[symbols[same, 1]]

    bars <- symbols == 'B' | symbols == 'BB' | symbols == 'BBB'
    all_bars <- bars[, 1] & bars[, 2] & bars[, 3] & !same
    prize[all_bars] <- 5

    #处理百搭

}

get_many_symbols <- function(n) {
    wheel <- c('DD', '7', 'BBB', 'BB', 'B', 'C', '0')
    vec <- sample(wheel, size = 3 * n, replace = TRUE,
        prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
    matrix(vec, ncol = 3)
}

play_many <- function(n) {
    symbols_mat <- get_many_symbols(n = n)
    data.frame(w1 = symbols_mat[, 1], w2 = symbols_mat[,2],
               w3 = symbols_mat[, 3], prize = score_many(symbols_mat))
}

plays <- play_many(1000000)

mean(plays$prize)