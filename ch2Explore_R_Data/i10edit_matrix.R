new_col <- c(0, 0, 0, 0)
'new_col= '; new_col

m <- matrix(rep(1:4, times=3), nrow = 4)
'm='; m

new_m <- cbind(new_col, m)
'new_m='; new_m

m <- rbind(c(1, 2, 3), c(4, 5, 6))
'm'; m

new_m <- m[, c(1,3)]
'new_m <- m[, c(1,3)]='; new_m

'对行列调用函数 apply(m, dimcode, f, fargs)'
'dimcode = 1 代表对矩阵每一行应用函数'
'dimcode = 2 代表矩阵中每一列应用函数'

apply(m, 1 , max)
apply(m, 2 , max)

z <- matrix(c(20, 40, 90, 80, 60, 10), nrow = 3)
'z='; z

f <- function(x) { x / sum(x)}

y <- apply(z, 1, f)
'y='; y
'转秩后：'
't(y)='; t(y)

library(crayon)
cat(blue$blurred("Hello", "world!\n"))
cat(red$inverse("Hello", "world!\n"))
cat(green(
  'I am a green line ' %+%
  blue$underline$bold('with a blue substring') %+%
  ' that becomes green again!\n'
))

