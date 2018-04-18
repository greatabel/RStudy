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