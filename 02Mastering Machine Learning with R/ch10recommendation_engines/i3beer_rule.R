library(arules)
library(arulesViz)

library(crayon)

data(Groceries)

###
beer.rules <- apriori(data = Groceries, 
                      parameter = list(support = 0.0015, confidence = 0.3),
                      appearance = list(default = "lhs", rhs = "bottled beer"))
beer.rules
beer.rules <- sort(beer.rules, decreasing = TRUE, by = "lift")
inspect(beer.rules)

cat(blue$bold$bgGreen("-----------------"), '\n')
tab <- crossTable(Groceries)
tab["bottled beer", "red/blush wine"]
tab["red/blush wine", "red/blush wine"]

tab["white wine", "white wine"]
tab["bottled beer", "white wine"]

plot(beer.rules, method = "graph", measure = "lift", 
     shading = "confidence")