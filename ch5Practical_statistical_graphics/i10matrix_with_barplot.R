my.data <- matrix(c(38.1, 1.7,
                    27.8, 28.7,
                    34.1, 69.6)
                , nrow=2)

rownames(my.data) <- c("China", "Germany")
colnames(my.data) <- c("primary", "second", "tertiary")

my.data

barplot(my.data, main = "Grouped barplot",
        xlab = "Industires", ylab = "Employment(%)",
        col = c("wheat", "orange"),
        legend = rownames(my.data), 
        args.legend = list(x = "top")
       )