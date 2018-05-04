library(crayon)
cat(red$bold$bgGreen("S3"), '\n')

num <- 1000000000
print(num)

class(num) <- c("POSIXct", "POSIXt")
print(num)