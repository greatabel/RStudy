library(crayon)

wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")

combos <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)

combos