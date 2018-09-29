FISH <- read.csv("https://raw.githubusercontent.com/STAT-JET-ASU/Datasets/master/Chihara/Walleye.csv")

str(FISH)
summary(FISH)

boxplot(FISH$Length)

inchesmean <- mean(FISH$Length)
inchesstdv <- sd(FISH$Length)
inches_n   <- length(FISH$Length)
inches_df  <- inches_n - 1

# what if we do a traditional 95% CI?

CI_LB <- inchesmean - qt(0.975, inches_df) * inchesstdv / sqrt(inches_n)
CI_UB <- inchesmean + qt(0.975, inches_df) * inchesstdv / sqrt(inches_n)
print(c(CI_LB, CI_UB))

# bootstrap 95% percentile interval
  
N <- 10^4
bootmeans <- numeric(N)
for (i in 1:N){
  bootsample   <- sample(FISH$Length, replace = TRUE)
  bootmeans[i] <- mean(bootsample)
}

quantile(bootmeans, c(0.025, 0.975))

# is the distribution approximately normal?
hist(bootmeans)
require(car)
qqPlot(bootmeans)

# same idea, but for weight this time

boxplot(FISH$Weight)

weightmean <- mean(FISH$Weight)
weightstdv <- sd(FISH$Weight)
weight_n   <- length(FISH$Weight)
weight_df  <- weight_n - 1

# traditional 95% CI

CI_LB <- weightmean - qt(0.975, weight_df) * weightstdv / sqrt(weight_n)
CI_UB <- weightmean + qt(0.975, weight_df) * weightstdv / sqrt(weight_n)
print(c(CI_LB, CI_UB))

# bootstrap 95% percentile interval

N <- 10^4
bootmeans <- numeric(N)
for (i in 1:N){
  bootsample   <- sample(FISH$Weight, replace = TRUE)
  bootmeans[i] <- mean(bootsample)
}

quantile(bootmeans, c(0.025, 0.975))

# is the distribution approximately normal?
hist(bootmeans)
require(car)
qqPlot(bootmeans)

