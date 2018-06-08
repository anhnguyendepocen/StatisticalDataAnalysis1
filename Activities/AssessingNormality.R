# assessing approximate normality
# includes skewness and kurtosis
# Last updated 06.07.2018 @ 9:30pm

ANTHRO <- read.csv("https://raw.githubusercontent.com/STAT-JET-ASU/Datasets/master/Instructor/anthropometric.csv")

require(car)
require(dplyr)
require(ggplot2)
require(moments)

# In the 1800s, Adolph Quetelet investigated
# the distribution of physical measurements 
# such as height by measuring many soldiers

# Skewness and kurtosis measures quantify
# the degree of skewness and "peakiness"

ANTHRO %>%
  filter(height != "NA") %>%
  summarize(skew = round(skewness(height), 4),
            kurt = round(kurtosis(height), 4))

# We need the mean and sd of the data
# to construct reference curves based 
# on a theoretical normal distribution 
# --we compare observed data to theory

mHt <- mean(ANTHRO$height, na.rm = TRUE)
sHt <- sd(ANTHRO$height, na.rm = TRUE)

# Graph the actual data using geom_density
# Graph a theoretical normal using dnorm
# Here we are looking at the pdf or f(x)

ggplot(ANTHRO, aes(x = height)) +
  geom_density() +
  stat_function(fun = dnorm, args = list(mHt, sHt), color = "red")

# Graph the actual data using stat_ecdf
# Graph a theoretical normal using pnorm
# Here we are looking at the CDF or F(x)

ggplot(ANTHRO, aes(x = height)) +
  stat_ecdf() +
  stat_function(fun = pnorm, args = list(mHt, sHt), color = "red")

# A quantile-quantile plot uses percentile rank
# As above, compare data to theoretical normal
# to use geom_qq_line, run the below to update
# devtools::install_github('tidyverse/ggplot2')

ggplot(ANTHRO, aes(sample = height)) +
  geom_qq() +
  geom_qq_line(color = "red")

# from 'car' package, includes confidence band

qqPlot(ANTHRO$height)

# A little more theoretical peek under the hood
# https://en.wikipedia.org/wiki/Percentile_rank
# p_i = i/n - 1/2n, the percentile rank of 1:n

ANTHRO2 <- ANTHRO %>% 
  filter(height != "NA") %>% 
  mutate(p = (1 : length(height)) / length(height) - 0.5 / length(height))

ggplot(ANTHRO2) + geom_point(aes(x = qnorm(p), y = sort(height)))

# --------------------------------------------

n <- 100 # set number of observations
m <- 0   # set mean
s <- 1   # set standard deviation

normaldata <- data.frame(observations = rnorm(n, m, s))

m1 <- mean(normaldata$observations)
s1 <- sd(normaldata$observations)

normaldata %>% summarize(skew = skewness(observations),
                         kurt = kurtosis(observations))

ggplot(normaldata, aes(x = observations)) +
  geom_density() +
  stat_function(fun = dnorm, args = list(m1, s1), color = "red")

ggplot(normaldata, aes(x = observations)) +
  stat_ecdf() +
  stat_function(fun = pnorm, args = list(m1, s1), color = "red")

ggplot(normaldata, aes(sample = observations)) +
  geom_qq() +
  geom_qq_line(color = "red")

qqPlot(normaldata$observations)

