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

'尽管matrix 按列存储，但生成矩阵时候，可以通过设置byrow 按行排列'
m <- matrix(c(1,2,3,4,5,6), nrow = 2, byrow = TRUE)
m

record <- matrix(c(10, 12, 13, 14, 15, 16), nrow = 2)
colnames(record) <- c('math', 'physics', 'chemistry')
rownames(record) <- c('john', 'mary')
record