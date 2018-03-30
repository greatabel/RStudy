library(ElemStatLearn) #contains the data
library(car) #package to calculate Variance Inflation Factor
library(corrplot) #correlation plots
library(leaps) #best subsets regression
library(glmnet) #allows ridge regression, LASSO and elastic net
library(caret) #this will help identify the appropriate parameters
library(crayon)

data(prostate)
prostate$gleason <- ifelse(prostate$gleason == 6, 0, 1)


cat(red$bold$bgCyan("拆分train 和 test:"))

train <- subset(prostate, train == TRUE)[, 1:9]
cat(blue$bold$bgCyan("str(train)"))
str(train)

test = subset(prostate, train==FALSE)[,1:9]
cat(blue$bold$bgGreen("str(test)"))
str(test)

cat(blue$bold$bgGreen("======先用最优子集回归建立一个模型"),'\n')

subfit <- regsubsets(lpsa ~., data = train)
b.sum <- summary(subfit)
cat(blue$bold$bgCyan("which.min(b.sum$bic)"))
which.min(b.sum$bic)
cat(blue$bold$bgYellow("？特征模型具有最小的bic值"),'\n')
plot(b.sum$bic, type = "l", xlab = "# of Features", ylab = "BIC", 
     main = "BIC score by Feature Inclusion")


plot(subfit, scale = "bic", main = "Best Subset Features")

ols <- lm(lpsa ~ lcavol + lweight + gleason, data = train)
plot(ols$fitted.values, train$lpsa, xlab = "Predicted", ylab = "Actual", 
     main = "Predicted vs Actual")


pred.subfit = predict(ols, newdata=test)
plot(pred.subfit, test$lpsa , xlab = "Predicted", 
     ylab = "Actual", main = "Predicted vs Actual")
resid.subfit = test$lpsa - pred.subfit
mean(resid.subfit^2)