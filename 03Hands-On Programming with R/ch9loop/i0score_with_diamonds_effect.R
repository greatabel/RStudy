library(crayon)
cat(red$bold$bgGreen("函数化"), '\n')


get_symbols <- function() {
    wheel <- c('DD', '7', 'BBB', 'BB', 'B', 'C', '0')
    sample(wheel, size = 3, replace = TRUE,
        prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}


new_score <- function(symbols){

    diamonds <- sum(symbols == "DD")
    cherries <- sum(symbols == 'C')
    # 识别情形
    # 考虑没有钻石的情况
    slots <- symbols[symbols != "DD"]
    # 3个符号相同以及都是杠的情形

    same <- length(unique(slots)) == 1
    bars <- slots %in% c('B', 'BB', 'BBB')

    # 计算中奖金额
    if(diamonds == 3){
        prize <- 100
    } else if (same) {
        payouts <- c(
                 "7" = 80,
                 "BBB" = 40,
                 "BB" = 25,
                 "B" = 10,
                 "C" = 10,
                 "0" = 0
                 )
        prize <- unname(payouts[slots[1]])

    } else if (all(bars)) {
        prize <- 5

    } else if (cherries > 0){

        prize <- c(0, 2, 5)[cherries + 1 + diamonds]
    } else {
        prize <- 0
    }
    # 根据钻石的个数调整中奖金额

    prize * 2 ^ diamonds

}


play <- function() {
    symbols <- get_symbols()
    # print(symbols)
    new_score(symbols)
}



# play()
# cat(red$bold$bgGreen("play again!"), '\n')
# play()
# cat(red$bold$bgGreen("play again!"), '\n')
# play()
