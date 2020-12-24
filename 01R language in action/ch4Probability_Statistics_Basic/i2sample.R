library(crayon)

'从52张扑克牌抽取5张'; sample(1: 52, 5) 

'抛均匀硬币3次'; sample(c('H','T'), 3, replace=TRUE)

'骰子丢10次'; sample(1:6, 10, replace=TRUE)

cat(blue$bold('不等可能随机抽样，例如运动员投篮命中率0.8，投篮10次'))
sample(c(1, 0), 10, replace=TRUE, prob=c(0.8, 0.2))