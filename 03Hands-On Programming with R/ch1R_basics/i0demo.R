library(crayon)


cat(blue$bold$bgMagenta("1 + 1"), '\n')
1 + 1

cat(blue$bold$bgMagenta("100:130"), '\n')
100:130

a <- 1
'a='; a
'a + 2 ='; a + 2

'R区分大小写'
Name <- 1
name <- 0
'Name='; Name
'name='; name

'查看已经命名啦哪些R对象'
'ls()='; ls()