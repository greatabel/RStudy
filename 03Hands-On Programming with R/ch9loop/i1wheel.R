library(crayon)

wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")

combos <- expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)

combos

# source("../ch7Program/i0tiger.R")
prob <- c("DD" = 0.03, "7" = 0.03, "BBB" = 0.06,
          "BB" = 0.1,  "B" = 0.25, "C" = 0.01, "0" = 0.52
          )

combos$prob1 <- prob[combos$Var1]
combos$prob2 <- prob[combos$Var2]
combos$prob3 <- prob[combos$Var3]

# combos
combos$prob <- combos$prob1 * combos$prob2 * combos$prob3
sum(combos$prob)

combos$prize <- NA
source("../ch7Program/i4score_func.R")
for(i in 1:nrow(combos)) {
    symbols <- c(combos[i, 1], combos[i, 2], combos[i, 3])
    combos$prize[i] <- score(symbols)
}

head(combos, 10)
cat(red$bold$bgGreen("计算期望值，也就是老虎机的返还率"), '\n')
sum(combos$prize * combos$prob)