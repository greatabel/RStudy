m <- matrix(c(1,2,3,4,5,6), nrow =2 , ncol = 3)
'matrix(c[1,2,3,4,5,6], nrow=2, ncol=3) =>'; m

m <- matrix(c(1,2,3,4,5,6), nrow=2, ncol=4)
m
'-------'
m <- matrix(c(1,2,3,4,5,6), nrow=2)
m
m <- matrix(c(1,2,3,4,5,6), ncol=3)
m

'element in matrix'
'm[1,2]='; m[1, 2]
'm[2,]='; m[2, ]
'm[,3]='; m[,3]

m <- matrix(nrow = 2, ncol = 2)
m[1, 1] = 1; m[1, 2] = 2
m[2, 1] = 3; m[2, 2] = 4
m