library(crayon)

cat(blue$bold("water"), '\n')

library(alr3)
'dim(water)'; dim(water)
data(water)
'str(water)'; str(water)
'head(water)'; head(water)

cat(red$bold("-----------"), '\n')
socal.water <- water[ ,-1]
head(socal.water)

library(corrplot)

water.cor <- cor(socal.water)
water.cor
corrplot(water.cor, method = "ellipse")

pairs(~ ., data = socal.water)