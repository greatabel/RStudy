library(arules)
library(arulesViz)

library(crayon)

data(Groceries)
'设定最小支持度为0.001 最小置信度90% 项集中最大项数为4'
rules <- apriori(Groceries, 
                 parameter = list(supp = 0.001, conf = 0.9, maxlen = 4))

cat(blue$bold$bgGreen("rules:"), '\n')
rules

rules <- sort(rules, by = "lift", decreasing = TRUE)
inspect(rules[1:5])
cat(red$bold$bgGreen("======="), '\n')
rules <- sort(rules, by = "confidence", decreasing = TRUE)
inspect(rules[1:5])

