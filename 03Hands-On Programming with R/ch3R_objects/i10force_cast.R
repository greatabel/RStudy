library(crayon)

cat(black$bold$bgMagenta("sum(c(TRUE, TRUE, FALSE, FALSE))"), '\n')
sum(c(TRUE, TRUE, FALSE, FALSE))

cat(black$bold$bgCyan("明确强制转换 as.character(1) as.logical(1) as.numeric(1)"), '\n')
as.character(1)
as.logical(1)
as.numeric(1)