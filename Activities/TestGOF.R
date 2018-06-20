# Chi-Square Goodness of Fit Test
# requires the BenfordTests package

# Does a given sample come from a Benford distribution?
# see the Probability glossary for Benford distribution

firstdigit   <- 1:9
benfordprobs <- log10(1+1/firstdigit)

# Consider Census data about North Carolina's 100 counties 
# We have population and land area in miles and kilometers

NC <- read.csv("https://raw.githubusercontent.com/STAT-JET-ASU/Datasets/master/Instructor/nccounties20102016.csv")

# examine the population of each county in 2016
# Ho: county pop sizes follow a Benford distribution
# Ha: county pop sizes do not follow a Benford distribution

library(dplyr)
library(BenfordTests)

# use signifd function to strip off first digit

NC <- NC %>% mutate(firstdigit2016 = signifd(pop2016, digits=1))

# find the table of observed first digit counts 
# for comparison, also find the expected counts

observed <- table(NC$firstdigit2016)

n <- sum(observed)

expected <- benfordprobs * n

# use chisq.test function, specify probabilities
# we have to do this because they are not all =

chisq.test(observed, p = benfordprobs)

chisq.test(observed, p = benfordprobs, simulate.p.value = TRUE)

# Benford package has a goodness of fit test

chisq.benftest(NC$firstdigit2016)

# examine the size of each county in 2016 (square miles)
# Ho: county areas in square miles follow a Benford distribution
# Ha: county areas in square miles do not follow a Benford distribution

NC <- NC %>% mutate(firstdigitmiles = signifd(area_m2, digits=1))
chisq.test(table(NC$firstdigitmiles), p = benfordprobs, simulate.p.value = TRUE)
table(NC$firstdigitmiles)

# Benford package has a goodness of fit test

chisq.benftest(NC$firstdigitmiles)

# type chisq.test or chisq.benftest at the > to see "under the hood"

# --------------------------------------------------------------------

# goodness of for for normal distribution
# we have to "categorize" continuous data
# build a rough test using Empirical Rule
# Calculate the six areas using N(0, 1)

pi1 <- pnorm(-2)
pi2 <- pnorm(-1) - pnorm(-2)
pi3 <- pnorm( 0) - pnorm(-1)
pi4 <- pnorm(+1) - pnorm( 0)
pi5 <- pnorm(+2) - pnorm(+1)
pi6 <- pnorm(+2, lower.tail=F)

nullprobs <- c(pi1, pi2, pi3, pi4, pi5, pi6)
print(nullprobs)

# consider the Anthropometric dataset

ANTHRO <- read.csv("https://raw.githubusercontent.com/STAT-JET-ASU/Datasets/master/Instructor/anthropometric.csv")

# test height of self-identified male students
# calculate z-scores to standardize the values

ANTHROM <- ANTHRO %>% 
  filter(gender == "male" & height != "NA") %>% 
  mutate(zscoreht = (height - mean(height)) / sd(height))

# count how many scores fall in each category

observed <- c(sum(ANTHRO$zscoreht <= -2),
              sum(-2 < ANTHROM$zscoreht & ANTHROM$zscoreht <= -1),
              sum(-1 < ANTHROM$zscoreht & ANTHROM$zscoreht <=  0),
              sum( 0 < ANTHROM$zscoreht & ANTHROM$zscoreht <= +1),
              sum(+1 < ANTHROM$zscoreht & ANTHROM$zscoreht <= +2),
              sum(ANTHROM$zscoreht > +2))
names(observed) <- c("less than -2sd",
                     "between -2sd and -1sd",
                     "between -1sd and 0",
                     "between 0 and +1sd",
                     "between +1sd and +2sd",
                     "greater than =2sd")
print(observed)

n <- sum(observed)

expected <- nullprobs * n
names(expected) <- c("less than -2sd",
                     "between -2sd and -1sd",
                     "between -1sd and 0",
                     "between 0 and +1sd",
                     "between +1sd and +2sd",
                     "greater than =2sd")
print(expected)

chisq.test(observed, p = nullprobs)

# note that the plots have the same shape
# linear transformations preserve shape!

library(ggplot2)

ggplot(ANTHROM, aes(x = zscoreht)) +
  geom_density()

ggplot(ANTHROM, aes(x = height)) +
  geom_density()
