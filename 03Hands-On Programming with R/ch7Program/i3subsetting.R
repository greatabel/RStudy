library(crayon)

payouts <- c("DD" = 100,
             "7" = 80,
             "BBB" = 40,
             "BB" = 25,
             "B" = 10,
             "C" = 10,
             "0" = 0
             )

payouts
cat(red$bold$bgGreen("payouts['DD']"), '\n')
payouts['DD']

cat(red$bold$bgGreen("unname(payouts['DD'])"), '\n')
unname(payouts['DD'])

cat(red$bold$bgGreen("================="), '\n')
symbols <- c("7", "7", "7")
symbols <- c("DD", "C", "BBB")

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
prize <- prize * 2 ^ diamonds
cat(red$bold$bgGreen(prize), '\n')
