my.data <- matrix(c(5.8, 7.9, 3.7, 7.4, 5.3), nrow = 1)
colnames(my.data) <- c("US", "Japan", "China", "Brazil", "India")
barplot(my.data, ylim = c(0, round(max(my.data))),
        main = 'barplot example',
        xlab = "Countries",
        ylab = "GDP per energy")

barplot(my.data, ylim = c(0, round(max(my.data))),
        horiz = TRUE,
        main = 'barplot example',
        xlab = "Countries",
        ylab = "GDP per energy")