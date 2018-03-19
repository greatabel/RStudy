data(geyser, package = "MASS")


data = read.table("i0car.txt", header=TRUE, quote="\"")
data[1:2,]

library(crayon)
cat(red$bold$bgGreen("mode(data) is "))
mode(data)