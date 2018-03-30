library(ElemStatLearn) #contains the data
library(car) #package to calculate Variance Inflation Factor
library(corrplot) #correlation plots
library(leaps) #best subsets regression
library(glmnet) #allows ridge regression, LASSO and elastic net
library(caret) #this will help identify the appropriate parameters
library(crayon)

data(prostate)

str(prostate)
plot(prostate)

plot(prostate$gleason, ylab = "Gleason Score")

cat(blue$bold$bgGreen("table(prostate$gleason):"))
table(prostate$gleason)

boxplot(prostate$lpsa ~ prostate$gleason, xlab = "Gleason Score", 
        ylab = "Log of PSA")

prostate$gleason <- ifelse(prostate$gleason == 6, 0, 1)
cat(red$bold$bgGreen("table(prostate$gleason):"))
table(prostate$gleason)

cat(red$bold$bgCyan("相关性统计图:"))
p.cor = cor(prostate)
corrplot.mixed(p.cor)