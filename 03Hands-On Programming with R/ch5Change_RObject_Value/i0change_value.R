library(crayon)

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")

deck2 <- deck
cat(red$bold$bgCyan("修改值"), '\n')
deck2$new <- 1:52
head(deck2)

deck2$new <- NULL
head(deck2)

cat(red$bold$bgCyan("deck2[c(13, 26, 39, 52),]"), '\n')
deck2[c(13, 26, 39, 52),]

cat(red$bold$bgGreen("deck2[c(13, 26, 39, 52), 3]"), '\n')
deck2[c(13, 26, 39, 52), 3]

cat(red$bold$bgGreen("deck2$value[c(13, 26, 39, 52)]"), '\n')
deck2$value[c(13, 26, 39, 52)]

cat(red$bold$bgGreen("设定14为新值"), '\n')
deck2$value[c(13, 26, 39, 52)] <- c(14, 14, 14, 14)
cat(red$bold$bgGreen("或者"), '\n')
deck2$value[c(13, 26, 39, 52)] <- 14

head(deck2, 13)