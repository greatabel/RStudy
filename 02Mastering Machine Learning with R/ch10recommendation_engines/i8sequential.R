library(TraMineR)
library(dplyr)

df <- read.csv("../data/sequential.csv")
str(df)

table(df$Cust_Segment)
table(df$Purchase1)
table(unlist(df[, -1]))
dfCount <- count(df, Purchase1, Purchase2)
dfCount <- arrange(dfCount, desc(n))
dim(dfCount)
head(dfCount)

seq <- seqdef(df[, -1], xtstep = 1)
head(seq)

#colors <- c("black", "dodgerblue", "darkviolet", "red",
           # "green", "darkmagenta", "yellow", "darkgreen",
           # "pink", "dodgerblue", "gray")

#cpal(seq) <- colors

seqiplot(seq, withlegend = "right")

# seqIplot(seq)
seqiplot(seq)
seqdplot(seq)
seqdplot(seq, group = df$Cust_Segment)
seqmsplot(seq, group = df$Cust_Segment)
seqmtplot(seq, group = df$Cust_Segment)

seqE <- seqecreate(seq)
subSeq <- seqefsub(seqE, pMinSupport = 0.05)
plot(subSeq[1:10], col = "dodgerblue")


# seqtab(seq, tlim = 1:5)
# seqmeant(seq)
seqMat <- seqtrate(seq) 
options(digits = 2)
seqMat[2:4, 1:3]
seqMat[, 1]
