library(rpart) #classification and regression trees
library(partykit) #treeplots
library(MASS) #breast and pima indian data
library(ElemStatLearn) #prostate data
library(randomForest) #random forests
library(xgboost) #gradient boosting 
library(caret) #tune hyper-parameters

data(prostate)
prostate$gleason <- ifelse(prostate$gleason == 6, 0, 1)
pros.train <- subset(prostate, train == TRUE)[, 1:9]
pros.test = subset(prostate, train == FALSE)[, 1:9]

set.seed(123)
tree.pros <- rpart(lpsa ~ ., data = pros.train)
tree.pros$cptable
plotcp(tree.pros)

cp <- min(tree.pros$cptable[5, ])
prune.tree.pros <- prune(tree.pros, cp = cp)
plot(as.party(tree.pros))
plot(as.party(prune.tree.pros))

party.pros.test <- predict(prune.tree.pros, 
                           newdata = pros.test)
rpart.resid <- party.pros.test - pros.test$lpsa #calculate residual
mean(rpart.resid^2)