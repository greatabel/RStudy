library(rpart) #classification and regression trees
library(partykit) #treeplots
library(MASS) #breast and pima indian data
library(ElemStatLearn) #prostate data
library(randomForest) #random forests
library(xgboost) #gradient boosting 
library(caret) #tune hyper-parameters

data(Pima.tr)
data(Pima.te)
pima <- rbind(Pima.tr, Pima.te)
set.seed(502)
ind <- sample(2, nrow(pima), replace = TRUE, prob = c(0.7, 0.3))
pima.train <- pima[ind == 1, ]
pima.test <- pima[ind == 2, ]

set.seed(321)
rf.pima <- randomForest(type ~ ., data = pima.train)
rf.pima
# plot(rf.pima)
which.min(rf.pima$err.rate[,1])
set.seed(321)
rf.pima.2 <- randomForest(type ~ ., data = pima.train, ntree = 80)
rf.pima.2
rf.pima.test <- predict(rf.pima.2, 
                        newdata = pima.test, 
                        type = "response")
table(rf.pima.test, pima.test$type)