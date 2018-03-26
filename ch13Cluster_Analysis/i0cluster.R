library(crayon)


cat(blue$bold("cluster"))

countries = read.csv('i0countries_data.csv')
'head(countries)='; head(countries)

var = as.character(countries$countries)
for(i in 1: 10) dimnames(countries)[[1]][i] = var[i]
countries = countries[,2:3]
names(countries) = c("Services(%)", "Aged_Population(%)")
head(countries)

my.km <- kmeans(countries, center = 2)
my.km$center
head(my.km$cluster)

plot(countries, col = my.km$cluster)
points(my.km$centers, col=1:2, pch =8, cex=2)

cat(blue$bold("-----Mclust------"))
library(mclust)

my.em <- Mclust(countries)
summary(my.em)