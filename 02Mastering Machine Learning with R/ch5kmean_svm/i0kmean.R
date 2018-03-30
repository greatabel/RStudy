library(crayon)

library(class) #k-nearest neighbors
library(kknn) #weighted k-nearest neighbors
library(e1071) #SVM
library(caret) #select tuning parameters
library(MASS) # contains the data
library(reshape2) #assist in creating boxplots
library(ggplot2) #create boxplots
library(kernlab) #assist with SVM feature selection

cat(red$bold$bgCyan("研究那些糖尿病患者，
    并对这个人群中可能导致糖尿病的风险因素进行预测"))
cat(red$bold$bgYellow("
 npreg:怀孕次数
 glu:血糖浓度，由口服葡萄糖耐量测试给出
 bp:舒张压(单位为mm Hg)
 skin:三头肌皮褶厚度(单位为mm)
 bmi:身体质量指数 8  ped:糖尿病家族影响因素
 age:年龄
 type:是否患有糖尿病(是/否)"), "\n")
data(Pima.tr)
str(Pima.tr)
cat(red$bold$bgCyan("=============="),"\n")
data(Pima.te)
str(Pima.te)