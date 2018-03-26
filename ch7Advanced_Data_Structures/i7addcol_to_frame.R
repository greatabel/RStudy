library(crayon)

cat(red$bold("数据框列添加\n"))

names <- c("jack", "steven")
ages <- c(15, 16)
students <- data.frame(names, ages, stringsAsFactors=F)

students

cat(red$bold("rbind\n"))
rbind(students, list('sariah', 15))

cat(green$bold("cbind\n"))
cbind(students, gender=c("M","F"))



