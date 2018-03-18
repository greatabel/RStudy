my.data <- matrix(c(38.1, 1.7,
                    27.8, 28.7,
                    34.1, 69.6)
                , nrow=2)

rownames(my.data) <- c("China", "Germany")
colnames(my.data) <- c("primary", "second", "tertiary")


barplot(my.data, main = "Grouped barplot",
        ylim = c(0, round(max(my.data))),
        xlab = "Industires", ylab = "Employment(%)",
        col = c("wheat", "orange"),
        beside = TRUE, 
        legend = rownames(my.data), 
        args.legend = list(x = "top")
       )