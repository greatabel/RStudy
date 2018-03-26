library(crayon)
cat(red$bold$bgGreen("因子和常用函数"), '\n')

wt <- c(45, 46, 47, 48, 49, 100)
group <- c("A", "B", "C","A", "B", "C")
r = tapply(wt, as.factor(group), mean)
r

cat(red$bold$bgGreen("=========="), '\n')
wt <- c(45, 46, 47, 48, 49, 100, 48, 69, 200)
diet <- c("A", "B", "C","A", "B", "C", "A", "B", "C")
gender <- c("M", "F", "M","M", "F", "M", "F", "M", "F")
r = tapply(wt, list(as.factor(diet), as.factor(gender)), mean)
r

split(wt, list(diet, gender))