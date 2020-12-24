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


lda.fit <- lda(class ~ ., data = train)
lda.fit
plot(lda.fit, type="both")
train.lda.probs <- predict(lda.fit)$posterior[, 2]
misClassError(trainY, train.lda.probs)
confusionMatrix(trainY, train.lda.probs)

test.lda.probs <- predict(lda.fit, newdata = test)$posterior[, 2]
misClassError(testY, test.lda.probs)
confusionMatrix(testY, test.lda.probs)

qda.fit <- qda(class ~ ., data =train)
qda.fit
train.qda.probs <- predict(qda.fit)$posterior[, 2]
misClassError(trainY, train.qda.probs)
confusionMatrix(trainY, train.qda.probs)

test.qda.probs <- predict(qda.fit, newdata = test)$posterior[, 2]
misClassError(testY, test.qda.probs)
confusionMatrix(testY, test.qda.probs)