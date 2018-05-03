library(crayon)



cat(red$bold$bgGreen("随机生成3个符号"), '\n')

get_symbols <- function() {
    wheel <- c('DD', '7', 'BBB', 'BB', 'B', 'C', '0')
    sample(wheel, size = 3, replace = TRUE,
        prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}

get_symbols()