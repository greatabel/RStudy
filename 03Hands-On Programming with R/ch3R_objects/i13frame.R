library(crayon)

cat(black$bold$bgCyan("数据框frame"), '\n')

df <- data.frame(face=c('ace','two','six'), 
                 suit=c('clubs','clubs', 'clubs'), 
                 value=c(1,2, 3))
df

cat(black$bold$bgCyan("typeof(df)"), '\n')
typeof(df)
cat(black$bold$bgCyan("class(df)"), '\n')
class(df)
cat(black$bold$bgGreen("str(df)"), '\n')
str(df)