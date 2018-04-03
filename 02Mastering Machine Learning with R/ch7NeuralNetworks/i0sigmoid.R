sigmoid <- function(x) {
    1 / (1 + exp(-x) )
}

x <- seq(-5, 5, .1)
# 'x='; x
plot(sigmoid(x))


library(ggplot2)
s <- sigmoid(x)
t <- tanh(x)
z <- data.frame(cbind(x, s, t))
ggplot(z, aes(x)) + 
  geom_line(aes(y = s, color = "sigmoid")) + 
  geom_line(aes(y = t, color = "tanh")) +
  labs(x = "Input",y = "Output") 