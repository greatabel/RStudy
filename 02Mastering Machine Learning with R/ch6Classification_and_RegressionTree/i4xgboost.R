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

grid = expand.grid(
  nrounds = c(75, 100),
  colsample_bytree = 1,
  min_child_weight = 1,
  eta = c(0.01, 0.1, 0.3), #0.3 is default,
  gamma = c(0.5, 0.25),
  subsample = 0.5,
  max_depth = c(2, 3)
)
grid

cntrl = trainControl(
  method = "cv",
  number = 5,
  verboseIter = TRUE,
  returnData = FALSE,
  returnResamp = "final"                                                        
)

set.seed(1)
train.xgb = train(
  x = pima.train[, 1:7],
  y = ,pima.train[, 8],
  trControl = cntrl,
  tuneGrid = grid,
  method = "xgbTree"
)

train.xgb

param <- list(  objective           = "binary:logistic", 
                booster             = "gbtree",
                eval_metric         = "error",
                eta                 = 0.1, 
                max_depth           = 2, 
                subsample           = 0.5,
                colsample_bytree    = 1,
                gamma               = 0.5
)

x <- as.matrix(pima.train[, 1:7])
y <- ifelse(pima.train$type == "Yes", 1, 0)
train.mat <- xgb.DMatrix(data = x, 
                         label = y)

set.seed(1)
xgb.fit <- xgb.train(params = param, data = train.mat, nrounds = 75)
xgb.fit
pred <- predict(xgb.fit, x)
# summary(pred)
# head(pred)
# head(y)
impMatrix <- xgb.importance(feature_names = dimnames(x)[[2]], model = xgb.fit)
impMatrix 
xgb.plot.importance(impMatrix, main = "Gain by Feature")

library(InformationValue)
pred <- predict(xgb.fit, x)
optimalCutoff(y, pred)
pima.testMat <- as.matrix(pima.test[, 1:7])
xgb.pima.test <- predict(xgb.fit, pima.testMat)
y.test <- ifelse(pima.test$type == "Yes", 1, 0)
optimalCutoff(y.test, xgb.pima.test)
confusionMatrix(y.test, xgb.pima.test, threshold = 0.39)
1 - misClassError(y.test, xgb.pima.test, threshold = 0.39)
plotROC(y.test, xgb.pima.test)

# BORUTA

data(Sonar, package="mlbench")
dim(Sonar)
table(Sonar$Class)

library(Boruta)
set.seed(1)
feature.selection <- Boruta(Class ~ ., data = Sonar, doTrace = 1)
feature.selection$timeTaken
table(feature.selection$finalDecision)

fNames <- getSelectedAttributes(feature.selection) #withTentative = TRUE
fNames
Sonar.features <- Sonar[, fNames]
dim(Sonar.features)




