goods <- list(name="Cookie", price=4.0, outdate=FALSE)
goods
cat('----\n')
goods$name
goods[['name']]
goods[[1]]

library(crayon)
cat(red$bold$bgGreen("typeof"))

typeof(goods$name)
typeof(goods$price)
typeof(goods$outdate)

cat(red$bold$bgGreen("vector"))

temp <- vector(mode="list")
temp[['name']] <- 'Cookie'
temp