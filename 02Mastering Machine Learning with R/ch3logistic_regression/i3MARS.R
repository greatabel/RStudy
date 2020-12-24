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

library(earth)
set.seed(1)
earth.fit <- earth(class ~ ., data = train,
                   pmethod = "cv",
                   nfold = 5,
                   ncross = 3,
                   degree = 1,
                   minspan = -1,
                   glm=list(family=binomial)
                   )
summary(earth.fit)
plotmo(earth.fit)
plotd(earth.fit)
evimp(earth.fit)

test.earth.probs <- predict(earth.fit, newdata = test, type = "response")
misClassError(testY, test.earth.probs)
confusionMatrix(testY, test.earth.probs)