library(crayon)

library(caret)
library(MASS)
library(neuralnet)
library(vcd)

cat(blue$bold$bgCyan("Neuralnet包用于构建模型，caret包用于数据准备，vcd包会帮助我们进行数据可视化"))

data(shuttle)
str(shuttle)
cat(blue$bold$bgCyan("table(shuttle$use)="))
table(shuttle$use)


table1 <- structable(wind + magn ~ use, shuttle)
table1


mosaic(table1, shade = T)
mosaic(use ~ error + vis, shuttle)
table(shuttle$use, shuttle$stability)
prop.table(table(shuttle$use, shuttle$stability))
chisq.test(shuttle$use, shuttle$stability)

cat(blue$bold$bgCyan("神经网络的数据准备是非常重要的，因为所有协变量和响应变量都必须是数值型"))
dummies <- dummyVars(use ~. ,shuttle, fullRank = T)
dummies

cat(blue$bold$bgCyan("======="), "\n")
shuttle.2 <- data.frame(predict(dummies, newdata = shuttle))
names(shuttle.2)
head(shuttle.2)

cat(blue$bold$bgCyan("======="), "\n")
shuttle.2$use <- ifelse(shuttle$use == "auto", 1, 0)
table(shuttle.2$use)

set.seed(123)
trainIndex <- createDataPartition(shuttle.2$use, p = .7,
                                  list = F)
# head(trainIndex)
shuttleTrain <- shuttle.2[ trainIndex, ]
shuttleTest  <- shuttle.2[-trainIndex, ]

n <- names(shuttleTrain)
form <- as.formula(paste("use ~", paste(n[!n %in% "use"], collapse = " + ")))
form

set.seed(1)
fit <- neuralnet(form, data = shuttleTrain, hidden = c(2, 1), err.fct = "ce", 
                 linear.output = F)
fit$result.matrix

head(fit$generalized.weights[[1]])
plot(fit)

par(mfrow=c(1,2))
gwplot(fit, selected.covariate = "vis.yes")
gwplot(fit, selected.covariate = "wind.tail")

resultsTrain <- compute(fit, shuttleTrain[, 1:10])

predTrain <- resultsTrain$net.result
predTrain <- ifelse(predTrain >= 0.5, 1, 0)
table(predTrain, shuttleTrain$use)

resultsTest <- compute(fit, shuttleTest[,1:10])
predTest <- resultsTest$net.result
predTest <- ifelse(predTest >= 0.5, 1, 0)
table(predTest, shuttleTest$use)

cat(red$bold$bgCyan("======="), "\n")
which(predTest == 1 & shuttleTest$use == 0)
shuttleTest[62,]

