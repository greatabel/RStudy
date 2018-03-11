a <- matrix(c(1, 5, 3, 7), nrow = 2)
a
b <- matrix(c(1, 10, 1000, 10000), nrow = 2)
b

a + b

'c(1, 2, 3 ) + b='; c(1, 2, 3 ) + b

z <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3)
'z='; z
'z * c(1, 20)='; z * c(1, 20)
'z * c(1, 20, 300)='; z * c(1, 20, 300)

m <- matrix(c(10, 20, 30, 40, 50, 60, 70, 80, 90), nrow=3)
'm='; m
'rowSums(m)=';rowSums(m)
'm/rowSums(m)='; m/rowSums(m)