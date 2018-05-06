library(crayon)

die <- c(1:6)
die

rolls <- expand.grid(die, die)
rolls

cat(red$bold$bgGreen("计算点数和"), '\n')

rolls$value <- rolls$Var1 + rolls$Var2
rolls

cat(red$bold$bgGreen("prob"), '\n')
prob <- c("1" = 1/8, "2" = 1/8,
          "3" = 1/8, "4" = 1/8,
          "5" = 1/8, "6" = 3/8
          )
prob

cat(red$bold$bgGreen("prob[rolls$Var1]"), '\n')
prob[rolls$Var1]

rolls$prob1 <- prob[rolls$Var1]
rolls$prob2 <- prob[rolls$Var2]

rolls$prob <- rolls$prob1 * rolls$prob2
head(rolls, 3)
sum(rolls$value * rolls$prob)