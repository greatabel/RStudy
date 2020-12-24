library(crayon)

cat(red$bold("因子\n"))

ssample <- c("BJ", "SH", "CQ", "SH")
sf <- factor(ssample)
'sf=';sf

nsample <- c(2, 3, 3, 5, 5, 5, 6)
nf <- factor(nsample)
'nf='; nf

cat(red$bold$bgGreen("查看内部结构"), '\n')
str(nf)
'unclass(nf)=';unclass(nf)
cat(red$bold$bgGreen("--------"), '\n')
str(sf)
'unclass(sf)=';unclass(sf)


cat(red$bold$bgGreen("指定顺序"), '\n')


assessment <- c('weak', 'good', 'limited', 'fair')
assessment0 <- factor(assessment)
'assessment0='; assessment0

assessment1 <- factor(assessment, order=TRUE,
                levels=c('good', 'fair', 'limited','weak'))
'assessment1='; assessment1
str(assessment1)