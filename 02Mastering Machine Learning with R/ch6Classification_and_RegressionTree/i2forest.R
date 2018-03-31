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

###########CART first
data(biopsy)
biopsy <- biopsy[, -1]
names(biopsy) <- c("thick", "u.size", "u.shape", "adhsn", "s.size",
                     "nucl", "chrom", "n.nuc", "mit", "class")
biopsy.v2 <- na.omit(biopsy)
set.seed(123) #random number generator
ind <- sample(2, nrow(biopsy.v2), replace = TRUE, prob = c(0.7, 0.3))
biop.train <- biopsy.v2[ind == 1, ] #the training data set
biop.test <- biopsy.v2[ind == 2, ] #the test data set

set.seed(123)
rf.pros <- randomForest(lpsa ~ ., data = pros.train)
rf.pros
plot(rf.pros)
which.min(rf.pros$mse)
set.seed(123)
rf.pros.2 <- randomForest(lpsa ~ ., data = pros.train, ntree = 75)
rf.pros.2
varImpPlot(rf.pros.2, scale = TRUE,
           main = "Variable Importance Plot - PSA Score")
importance(rf.pros.2)
rf.pros.test <- predict(rf.pros.2, newdata = pros.test)
#plot(rf.pros.test, pros.test$lpsa)
rf.resid <- rf.pros.test - pros.test$lpsa #calculate residual
mean(rf.resid^2)

set.seed(123)
rf.biop <- randomForest(class ~ ., data = biop.train)
rf.biop
plot(rf.biop)
which.min(rf.biop$err.rate[, 1])
set.seed(123)
rf.biop.2 <- randomForest(class ~ ., data = biop.train, ntree = 19)
#getTree(rf.biop,1)
rf.biop.2
rf.biop.test <- predict(rf.biop.2, 
                        newdata = biop.test, 
                        type = "response")
table(rf.biop.test, biop.test$class)
(139 + 67) / 209
varImpPlot(rf.biop.2)