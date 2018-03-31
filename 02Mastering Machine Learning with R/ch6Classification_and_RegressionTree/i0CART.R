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