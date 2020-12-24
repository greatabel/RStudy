curve(dexp(x, rate=1/2), from=0, to=5, ylim=c(0, 1.5),
    main="Exponential", col = "red")
curve(dexp(x, rate=1), from=0, to=5, add=TRUE,
    col = "blue")
curve(dexp(x, rate=2), from=0, to=5, add=TRUE,
     col = "green")

text.legend = c("lambda = 0.5", "lambda = 1", "lambda = 2")
legend("topright", legend = text.legend, lty = c(1, 1, 1),
       col = c("red", "blue", "green"))
