library(crayon)

cat(black$bold$bgCyan("数据框frame"), '\n')

df <- data.frame(face=c('ace','two','six'), suit=c('clubs','clubs', 'clubs'), 
                 value=c(1,2, 3))
df