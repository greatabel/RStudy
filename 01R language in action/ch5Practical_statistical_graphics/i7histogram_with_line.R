attach(mtcars)


hist(mpg, breaks = 12, col = 'blue1', xlim=c(10, 35), ylim = c(0, 0.12),
    xlab = 'miles/gallon', freq = FALSE,
    main = 'colored histogram example (breaks=15)')
lines(density(mpg), col = 'red', lwd = 2)