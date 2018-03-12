new_col <- c(0, 0, 0, 0)
'new_col= '; new_col

m <- matrix(rep(1:4, times=3), nrow = 4)
'm='; m

new_m <- cbind(new_col, m)
'new_m='; new_m

m <- rbind(c(1, 2, 3), c(4, 5, 6))
'm'; m

new_m <- m[, c(1,3)]
'new_m <- m[, c(1,3)]='; new_m