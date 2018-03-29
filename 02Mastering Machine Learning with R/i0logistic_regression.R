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

