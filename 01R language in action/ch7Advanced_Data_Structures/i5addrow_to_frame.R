names <- c("Jack", "Steven")
ages <- c(16,36)
students <- data.frame(names, ages, stringsAsFactors=F)
students

library(crayon)
cat(red$bold$bgGreen("添加数据row") , "\n")

rbind(students, list("Sasa", 45))
