library(arules)
library(arulesViz)

library(crayon)

data(Groceries)
'设定最小支持度为0.001 最小置信度90% 项集中最大项数为4'
rules <- apriori(Groceries, 
                 parameter = list(supp = 0.001, conf = 0.9, maxlen = 4))

cat(blue$bold$bgGreen("rules:"), '\n')
rules


'建立一个交叉表,表格建立之后，检查商品之间的共同购买关系。先看看表格的前3行和前3列'
tab <- crossTable(Groceries)
tab[1:3, 1:3]
tab["bottled beer", "bottled beer"]
tab["bottled beer", "canned beer"]