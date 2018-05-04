library(crayon)



get_symbols <- function() {
    wheel <- c('DD', '7', 'BBB', 'BB', 'B', 'C', '0')
    sample(wheel, size = 3, replace = TRUE,
        prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}


score <- function(symbols){

    # 识别情形
    same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
    bars <- symbols %in% c('B', 'BB', 'BBB')

    # 计算中奖金额
    if (same) {
        payouts <- c("DD" = 100,
                 "7" = 80,
                 "BBB" = 40,
                 "BB" = 25,
                 "B" = 10,
                 "C" = 10,
                 "0" = 0
                 )
        prize <- unname(payouts[symbols[1]])

    } else if (all(bars)) {
        prize <- 5

    } else {
        cherries <- sum(symbols == 'C')
        prize <- c(0, 2, 5)[cherries + 1]
    }
    # 根据钻石的个数调整中奖金额
    diamonds <- sum(symbols == 'DD')
    prize * 2 ^ diamonds

}


play <- function() {
    symbols <- get_symbols()
    prize <- score(symbols)
    attr(prize, 'symbols') <- symbols
    prize
}


