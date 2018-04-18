library(ggplot2) #support scatterplot
# library(GPArotation) #support rotation
library(psych) #PCA package

train <- read.csv("../data/NHLtrain.csv")
str(train)
names(train)