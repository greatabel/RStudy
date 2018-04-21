library(crayon)

cat(black$bold$bgMagenta("R函数就是一种不同类型的R对象
     它们保护的不是数据，而是代码"), '\n')

die <- 1:6
dice <- sample(die , size = 2, replace = TRUE)
dice
sum(dice)

print('----------')

roll <- function() {
    die <- 1: 6
    dice <- sample(die, size = 2, replace = TRUE)
    print(dice)
    sum(dice)
}

roll
print('#########')

roll()