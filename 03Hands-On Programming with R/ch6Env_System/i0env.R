library(crayon)
library(pryr)

cat(red$bold$bgGreen("环境"), '\n')

parenvs(all = TRUE)

cat(red$bold$bgGreen("as.environment('package:stats')"), '\n')
as.environment('package:stats')

cat(red$bold$bgGreen("parent.env(globalenv())"), '\n')
parent.env(globalenv())

cat(red$bold$bgGreen("ls(emptyenv())"), '\n')
ls(emptyenv())

assign('new', 'Hello global', envir = globalenv())
globalenv()$new