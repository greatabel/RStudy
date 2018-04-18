library(arules)
library(arulesViz)

library(crayon)

data(Groceries)

cat(blue$bold$bgGreen("head(Groceries):"), '\n')
head(Groceries)
cat(blue$bold$bgGreen("str(Groceries):"), '\n')
str(Groceries)