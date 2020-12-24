library(crayon)

deck <- read.csv(file="../data/cards.csv", header=TRUE, sep=",")
cat(red$bold$bgCyan("$提取数据框或者列表对象中的值"), '\n')

deck[1:5,]

cat(black$bold$bgCyan("deck$value"), '\n')

t = deck[1:5,]
t$value
cat(black$bold$bgCyan("mean(t$value)"), '\n')
mean(t$value)
median(t$value)

lst <- list(numbers = c(1, 2), logical = TRUE, strings = c('a', 'b', 'c'))
lst
'lst$logical'; lst$logical
'lst$strings';lst$strings
'lst$numbers'; lst$numbers
'typeof(lst$numbers)'; typeof(lst$numbers)
'lst[1]'; lst[1]
'typeof(lst[1])'; typeof(lst[1])
'lst[2]'; lst[2]

cat(black$bold$bgCyan("双中括号代替单中括号加$"), '\n')
'lst[[1]]'; lst[[1]]