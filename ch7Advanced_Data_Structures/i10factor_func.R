library(crayon)
cat(red$bold$bgGreen("因子和常用函数"), '\n')

wt <- c(45, 46, 47, 48, 49, 100)
group <- c("A", "B", "C","A", "B", "C")
r = tapply(wt, as.factor(group), mean)
r