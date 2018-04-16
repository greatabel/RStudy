library(cluster) #conduct cluster analysis
library(compareGroups) #build descriptive statistic tables
library(HDclassif) #contains the dataset
library(NbClust) #cluster validity measures
library(sparcl) #colored dendrogram

data(wine)
str(wine)

names(wine) <- c("Class", "Alcohol", "MalicAcid", "Ash", "Alk_ash",
                 "magnesium", "T_phenols", "Flavanoids", "Non_flav",
                 "Proantho", "C_Intensity", "Hue", "OD280_315", "Proline")
names(wine)

df <- as.data.frame(scale(wine[, -1]))
str(df)
table(wine$Class)

#模型构建阶段