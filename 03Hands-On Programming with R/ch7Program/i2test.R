symbols <- c("7", "7", "7")
symbols <- c("B", "BB", "BBB")

symbols

symbols[1]
symbols[2]
symbols[3]
symbols[1] == symbols[2] & symbols[2] == symbols[3]
all(symbols == symbols[1])
length(unique(symbols)) == 1

same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
bars <- symbols %in% c('B', 'BB', 'BBB')
if (same) {
    print('same')
} else if (all(bars)) {
    print('all are bars')
}

