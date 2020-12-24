library(crayon)
cat(red$bold$bgGreen("temperature"))

x <- c(1, 2, 3)
'x='; x
'length(x)='; length(x)

if (length(x) == 0) {
    cat(red('empty evtor'))
} else {
    cat(green('here\n'))

    m = mean(x)
    s = sum(x)

    
}
'---------'
'm='; m
's='; s

cat(red('-------'))
x <- 9
if (x >=0) sqrt(x) else NA
y <- if (x >=0) sqrt(x) else NA
'y='; y

cat(red('ifelse是函数'))
ifelse(x >=0, sqrt(x), NA)

x <- 1: 10
'x='; x

y <- ifelse( x %% 2 == 0, 0, 1)
y