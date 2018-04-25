library(crayon)

gender <- factor(c("male", "female", "female", "male"))

gender
cat(black$bold$bgMagenta("typeof(gender)"), '\n')
typeof(gender)

cat(black$bold$bgMagenta("attributes(gender)"), '\n')
attributes(gender)

cat(black$bold$bgMagenta("unclass(gender)"), '\n')
unclass(gender)

cat(black$bold$bgGreen("as.character(gender)"), '\n')
as.character(gender)