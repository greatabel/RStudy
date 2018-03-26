library(crayon)

male <- c(124, 88, 200)
female <- c(108, 56, 221)

degree <- c("low", "middle", "high")
myopia <- data.frame(degree, male, female)
myopia

cat(red$bold("'---------'\n"))
sub <- myopia[2:3, 1:2]
sub

cat(blue$bold("class(sub"))
class(sub)

sub1 <- myopia[2:3, 2]
sub1
cat(green$bold("class(sub1"))
class(sub1)