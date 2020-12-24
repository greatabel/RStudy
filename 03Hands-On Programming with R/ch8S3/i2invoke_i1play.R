source("i1change_play_func.R")

# play()
# play()
# play()

slot_display <- function(prize){

    #提取符号输出结果
    symbols <- attr(prize, 'symbols')

    #将所有符号压缩为一个字符串
    symbols <- paste(symbols, collapse = " ")

    string <- paste(symbols, prize, '###', sep = "\n$")

    cat(string)
}

one_play = play()
slot_display(one_play)