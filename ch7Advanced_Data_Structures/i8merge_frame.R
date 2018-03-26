library(crayon)

cat(red$bold("数据框合并\n"))

names <- c("jack", "steven")
ages <- c(15, 16)
genders <- c('M', 'F')

students <- data.frame(names, ages, stringsAsFactors=F)
students

students2 <- data.frame(names, genders)
students2

students3 <- merge(students, students2)
students3
