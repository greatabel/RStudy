# https://stackoverflow.com/questions/7743768/using-nnet-for-prediction-am-i-doing-it-right/7795265
require(nnet)
require(caret)

#Make toy dataset
y <- sin(seq(0, 20, 0.1))
te <- data.frame(y, x1=Lag(y), x2=Lag(y,2))
names(te) <- c("y", "x1", "x2")

#Fit model
model <- train(y ~ x1 + x2, te, method='nnet', linout=TRUE, trace = FALSE,
                #Grid of tuning parameters to try:
                tuneGrid=expand.grid(.size=c(1,5,10),.decay=c(0,0.001,0.1))) 
ps <- predict(model, te)

#Examine results
model
plot(y)
lines(ps, col=2)