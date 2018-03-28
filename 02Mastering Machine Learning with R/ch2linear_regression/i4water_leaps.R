library(crayon)

cat(blue$bold("leaps"), '\n')

library(alr3)

data(water)



socal.water <- water[ ,-1]

library(leaps)
fit <- lm(BSAAM ~ ., data = socal.water)
summary(fit)

cat(blue$bold("====================="), '\n')

sub.fit <- regsubsets(BSAAM ~ ., data = socal.water)
best.summary <- summary(sub.fit)
'names(best.summary)'; names(best.summary)
'which.min(best.summary$rss)'; which.min(best.summary$rss)

par(mfrow = c(1,2))
plot(best.summary$cp, xlab = "number of features", ylab = "cp")
plot(sub.fit, scale = "Cp")

which.min(best.summary$bic)
which.max(best.summary$adjr2)

best.fit <- lm(BSAAM ~ APSLAKE + OPRC + OPSLAKE, data = socal.water)
summary(best.fit)

par(mfrow = c(2,2))
plot(best.fit)

vif(best.fit)
plot(socal.water$OPRC, socal.water$OPSLAKE, xlab = "OPRC", ylab = "OPSLAKE")
best.summary$adjr2
fit.2 <- lm(BSAAM ~ APSLAKE + OPSLAKE, data = socal.water)
summary(fit.2)
par(mfrow=c(2,2))
plot(fit.2)
vif(fit.2)
library(lmtest)
bptest(fit.2)
plot(fit.2$fitted.values, socal.water$BSAAM, xlab = "predicted", ylab = "actual", 
     main = "Predicted vs. Actual")



socal.water["Actual"] = water$BSAAM
socal.water$Forecast = predict(fit.2)
head(socal.water)
library(ggplot2)
ggplot(socal.water, aes(x = Forecast, y = Actual)) +
    geom_point() + geom_smooth(method = lm) +
    labs(title = "Forecast versus Actuals")

library(MPV)
PRESS(best.fit)
PRESS(fit.2)
PRESS.best = sum((resid(best.fit)/(1 - hatvalues(best.fit)))^2)
PRESS.fit.2 = sum((resid(fit.2)/(1 - hatvalues(fit.2)))^2)
PRESS.best
PRESS.fit.2

library(ISLR)
data(Carseats)
str(Carseats)
sales.fit = lm(Sales ~ Advertising + ShelveLoc, data = Carseats)
summary(sales.fit)
contrasts(Carseats$ShelveLoc)

library(MASS)
data(Boston)
str(Boston)
value.fit <- lm(medv ~ lstat * age, data = Boston)
summary(value.fit)
