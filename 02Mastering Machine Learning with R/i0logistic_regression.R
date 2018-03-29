library(crayon)


library(MASS)
data(biopsy)

cat(blue$bold$bgMagenta("str(biopsy)"), '\n')
str(biopsy)

'我们可以删除ID列'; biopsy$ID = NULL

'重命名变量，并确认操作结果'
names(biopsy) <- c("thick", "u.size", "u.shape",
       "adhsn", "s.size", "nucl", "chrom", "n.nuc",
           "mit", "class")
names(biopsy)

biopsy.v2 <- na.omit(biopsy)
head(biopsy.v2)

y <- ifelse(biopsy.v2$class == "malignant", 1, 0)

library(reshape2)
library(ggplot2)

biop.m <- melt(biopsy.v2, id.var = "class")

ggplot(data = biop.m, aes(x = class, y = value)) +
geom_boxplot() + facet_wrap( ~ variable, ncol = 3)

library(corrplot)
bc <- cor(biopsy.v2[, 1:9])
# 'bc'; bc
corrplot.mixed(bc)

cat(blue$bold$bgMagenta("划分训练和测试"), '\n')
set.seed(100) #random number generator
ind <- sample(2, nrow(biopsy.v2), replace = TRUE, prob=c(0.7, 0.3))
train <- biopsy.v2[ind==1, ] #the training data set
test <- biopsy.v2[ind==2, ] #the test data set

str(test) #confirm it worked
cat(blue$bold$bgMagenta("===="), '\n')
str(train)
cat(blue$bold$bgMagenta("确保两个数据集的结果变量是均衡的，我们做以下检查"), '\n')

table(train$class)
table(test$class)

full.fit <- glm(class ~ . , family = binomial, data = train)
summary(full.fit)
cat(blue$bold$bgMagenta("confint(full.fit)"), '\n')
confint(full.fit)
cat(blue$bold$bgRed("exp(coef(full.fit))"), '\n')
exp(coef(full.fit))

library(car)
cat(blue$bold$bgCyan("vif(full.fit)"), '\n')
vif(full.fit)