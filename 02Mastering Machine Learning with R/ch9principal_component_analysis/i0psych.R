library(ggplot2) #support scatterplot
# library(GPArotation) #support rotation
library(psych) #PCA package

library(crayon)

'
 Team:球队所在城市。
 ppg:平均每场得分，得分规则如前所述。 
 Goals_For:平均每场进球数。 Goals_Against:平均每场失球数。
 Shots_For:平均每场射中球门次数。
 Shots_Against:平均每场被射中球门次数。
 PP_perc:球队获得以多打少机会时的进球百分比。
 PK_perc:对方获得以多打少机会时，球队力保球门不失的时间百分比。
 CF60_pp:球队在每60分钟以多打少时间内获得的Corsi分值;Corsi分值是射门次数总和，
包括射中球门次数(Shots_For)、射偏次数和被对方封堵的次数。
 CA60_sh:对方以多打少时，即本方人数劣势时，对方每60分钟获得的Corsi分值。
 OZFOperc_pp:球队以多打少时，在进攻区域发生的争球次数百分比。
 Give:平均每场丢球次数。
 Take:平均每场抢断次数。
 hits:平均每场身体冲撞次数。
 blks:平均每场封堵对方射门次数。
'
train <- read.csv("../data/NHLtrain.csv")

cat(blue$bold$bgGreen("str(train):"))
str(train)

cat(blue$bold$bgGreen("names(train):"))
names(train)

train.scale <- scale(train[, -1:-2])
nhl.cor = cor(train.scale)
cor.plot(nhl.cor)

'主成分抽取'
pca <- principal(train.scale, rotate="none")
plot(pca$values, type="b", ylab="Eigenvalues", xlab="Component")

'正交旋转与解释'
pca.rotate <- principal(train.scale, nfactors = 5, rotate = "varimax")
pca.rotate
pca.scores <- data.frame(pca.rotate$scores)
head(pca.scores)
pca.scores$ppg <- train$ppg

nhl.lm <- lm(ppg ~ ., data = pca.scores)
summary(nhl.lm)
nhl.lm2 <- lm(ppg ~ RC1 + RC2, data = pca.scores)
summary(nhl.lm2)

plot(nhl.lm2$fitted.values, train$ppg, 
     main="Predicted versus Actual",
     xlab="Predicted",ylab="Actual")

train$pred <- round(nhl.lm2$fitted.values, digits = 2)

p <- ggplot(train, aes(x = pred,
                           y = ppg,
                           label = Team)) 
p + geom_point() + 
  geom_text(size=3.5, hjust=0.1, vjust=-0.5, angle=0) + 
  xlim(0.8, 1.4) + ylim(0.8, 1.5) +
  stat_smooth(method="lm", se=FALSE)

pca.scores$Team <- train$Team
p2 <- ggplot(pca.scores, aes(x = RC1, y = RC2, label = Team))
p2 + geom_point() +
  geom_text(size = 2.75, hjust = .2, vjust = -0.75, angle = 0) +
  xlim(-2.5, 2.5) + ylim(-3.0, 2.5)

sqrt(mean(nhl.lm2$residuals^2))

test <- read.csv("../data/NHLtest.csv")
test.scores <- data.frame(predict(pca.rotate, test[, c(-1:-2)]))
test.scores$pred <- predict(nhl.lm2, test.scores)

test.scores$ppg <- test$ppg
test.scores$Team <- test$Team

p <- ggplot(test.scores, aes(x = pred,
                       y = ppg,
                       label = Team)) 
p + geom_point() + 
  geom_text(size=3.5, hjust=0.4, vjust = -0.9, angle = 35) + 
  xlim(0.75, 1.5) + ylim(0.5, 1.6) +
  stat_smooth(method="lm", se=FALSE)

resid <- test.scores$ppg - test.scores$pred
sqrt(mean(resid^2))
