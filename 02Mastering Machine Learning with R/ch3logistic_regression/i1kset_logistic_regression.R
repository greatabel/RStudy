library(crayon)

library(MASS)
data(biopsy)
str(biopsy)
biopsy$ID = NULL
names(biopsy) = c("thick", "u.size", "u.shape", "adhsn", 
                  "s.size", "nucl", "chrom", "n.nuc", "mit", "class")
names(biopsy)
biopsy.v2 <- na.omit(biopsy)
y <- ifelse(biopsy.v2$class == "malignant", 1, 0)
library(reshape2)
library(ggplot2)
biop.m <- melt(biopsy.v2, id.var = "class")
ggplot(data = biop.m, aes(x = class, y = value)) + 
  geom_boxplot() +
  facet_wrap(~ variable, ncol = 3)
library(corrplot)
bc <- cor(biopsy.v2[ ,1:9]) #create an object of the features
corrplot.mixed(bc)

set.seed(123) #random number generator
ind <- sample(2, nrow(biopsy.v2), replace = TRUE, prob = c(0.7, 0.3))
train <- biopsy.v2[ind==1, ] #the training data set
test <- biopsy.v2[ind==2, ] #the test data set
str(test) #confirm it worked
table(train$class)
table(test$class)

library(InformationValue)
trainY <- y[ind==1]
testY <- y[ind==2]

library(bestglm)
X <- train[, 1:9]
Xy <- data.frame(cbind(X, trainY))
bestglm(Xy = Xy, IC = "CV", CVArgs = list(Method = "HTF", K = 10, REP = 1), 
        family=binomial)
reduce.fit <- glm(class ~ thick + u.size + nucl, family = binomial, data = train)

test.cv.probs = predict(reduce.fit, newdata = test, type = "response")
cat(blue$bold$bgGreen("misClassError(testY, test.cv.probs):"))
misClassError(testY, test.cv.probs)
confusionMatrix(testY, test.cv.probs)

cat(blue$bold$bgGreen("精简了特征的模型和全特征模型相比，精确度略有下降，
    但这并不是“世界末日”。我们可 以用bestglm包再试一次，这次使用信息准则为BIC的最优子集方法"))
bestglm(Xy = Xy, IC = "BIC", family = binomial)
bic.fit <- glm(class ~ thick + adhsn + nucl + n.nuc, 
               family = binomial, data = train)
test.bic.probs = predict(bic.fit, newdata = test, type = "response")
misClassError(testY, test.bic.probs)
confusionMatrix(testY, test.bic.probs)