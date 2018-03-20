data(geyser, package = "MASS")


data = read.table("i0car.txt", header=TRUE, quote="\"")
data[1:2,]

library(crayon)
cat(red$bold$bgGreen("mode(data) is "))
mode(data)

cat(blue$bold$bgGreen("names(data) is "))
names(data)

cat(yellow$bold$bgGreen("dim(data) is "))
dim(data)

cat(red$bold$bgGreen("data$lp100km is "))
data$lp100km