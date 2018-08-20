n <- 10
p <- .5
x <- 0

probs = dbinom(0:n, n, p)
barplot(probs, names = 0:n, space = 0, 
        xlim = c(0, n + 1), ylim = c(0, 1.1 * max(probs)), 
        main = "Normal Approximation to Binomial",
        col = c(rep("red", x + 1), rep("gray", n - (x + 1))))
curve(dnorm((x-0.5), n*p, sqrt(n*p*(1-p))), 
      from = 0, to = n + 1, 
      xlim = c(0, n + 1), 
      add=T, col="blue")
abline(v = x + .5)