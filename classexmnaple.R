dat <- rexp(10000, 1)

sampledat <- data.frame(data = dat)

library(ggplot2)
ggplot(sampledat, aes(x = dat)) +
  geom_density()

ggplot(sampledat, aes(sample = dat)) +
  geom_qq() +
  geom_qq_line(color = "red")

# -----------------------

means2 <- numeric(10000)
n <- 2

# I will get 10000 means, each from
# a sample of size n from Unif(0,1)

for (i in 1:10000){
   means2[i] <- mean(rexp(n, 1))
}
  
sampledat <- data.frame(data = means2)

# density, QQ plot of the 10,000 means 
# NOT individual values from Unif(0,1)

library(ggplot2)
ggplot(sampledat, aes(x = means2)) +
  geom_density()

ggplot(sampledat, aes(sample = means2)) +
  geom_qq() +
  geom_qq_line(color = "red")  
  