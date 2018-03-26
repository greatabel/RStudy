library(crayon)

cat(red$bold("数据框列添加\n"))

names <- c("jack", "steven")
ages <- c(15, 16)
students <- data.frame(names, ages, stringsAsFactors=F)

students

