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

