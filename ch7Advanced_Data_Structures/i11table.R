library(crayon)
cat(red$bold$bgGreen("contingency table"), '\n')

# wt <- c(45, 46, 47, 48, 49, 100, 48, 69, 200)
diet <- c("A", "B", "C","A", "B", "C", "A", "B", "C")
gender <- c("M", "F", "M","M", "F", "M", "F", "M", "F")

t = table(list(diet, gender))
t


artery <- read.csv("i11graft_arteries.csv")
artery

t = table(list(artery$Diabets, artery$Hypertension))
t