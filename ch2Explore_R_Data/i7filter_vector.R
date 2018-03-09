a <- c(-1, 1, -2, 4, -5, 9, NA)

'a='; a

b <- a[a<0]
'b='; b

a < 0
'a[a>=0]'; a[a>=0]
'subset(a, a>=0)='; subset(a, a>=0)

'which(a<0)='; which(a<0)