# Permutation Test for Two Means
# One-tailed test for the 1970 the Vietnam draft lottery data
# Did the second half of the year have lower average draft numbers?

# Ho: mu_second = mu_first
# Ha: mu_second < mu_first

DRAFT <- read.csv(file=url("https://raw.githubusercontent.com/STAT-JET-ASU/Datasets/master/Instructor/vietnamdraft.csv"))

# Descriptive analysis of the two groups
# Remember that the sample mean is x-bar
# Also be sure to check for any NA values!

summary <- DRAFT %>% 
  group_by(halfyear) %>%
  summarize(n    = n(),
            xbar = mean(num1970),
            s    = sd(num1970))
print.data.frame(summary)

ggplot(DRAFT, aes(x = halfyear, y = num1970)) + 
  geom_boxplot() +
  ggtitle("Draft Numbers by Half-Year for 1970") +
  ylab("draft number")

ggplot(filter(DRAFT, halfyear == "First"), aes(sample = num1970)) +
  geom_qq() +
  geom_qq_line(color = "red")

ggplot(filter(DRAFT, halfyear == "Second"), aes(sample = num1970)) +
  geom_qq() +
  geom_qq_line(color = "red")

# How many data regroupings would we have in an exact test?

sprintf("The number of regroupings is %1.0f.", choose(366, 184))

# Compute the observed difference in means in the dataset.
# Observed difference is called the TEST STATISTIC for Ho.
# We can use the diff() function on our vector of x-bars.
# Using diff() subtracts takes each vector element and
# subtracts the element before, so here xbar2 - xbar1.
# So we get x-bar (second half) - x-bar (first half).
# What does the sign of the test statistic tell you?

testStatistic <- diff(summary$xbar)
print(testStatistic)

# Select the variable you want to test, be careful of NA values.
# You will need to remove NA values if there are any and adjust.
# The vector is the observed values of the variable being tested.
# In this case, we are testing 1970 draft numbers between groups.
# We need to know the total number of data values and the number
# of data values in the group designated Group 1 (here "Second").
# We use as.numeric() to turn the tibble into a numeric vector.

draftnumbers   <- DRAFT$num1970
n_all          <- length(draftnumbers)
n_second       <- as.numeric(filter(DRAFT, halfyear == "Second") %>% 
                               summarize(length(num1970)))

# Uncomment the seed command below to get reproducible results.
# Otherwise each simulation iteration generates unique results.

# set.seed(0)

# Conduct the resampling procedure for N simulation iterations.
# All of the commands included between the { } repeat N times.
# The vector randomDiffs stores the SIMULATED NULL DISTRIBUTION 
#     for test statistic XBAR1 - XBAR2; each randomDiffs entry
#     is computed the same as the test statistic from the data.
# The data are randomly permuted into the two comparison groups.
# The vector "index" is the data locations chosen to be "Second".
# The vector "-index" is un-selected values left to be "First".
# In the textbook the randomDiffs vector is often called result.
# Start the resampling process!

# Set level of rejection for the null hypothesis.

alpha <- .05

# Set the number of iterations for the simulation.
# Why the -1? The actual data is one of the possible 
# permutations, so we conduct one fewer simulations.

N <- 10^5-1

# Create a vector to store the simulation results.
randomDiffs <- numeric(N)

# Aaaaaaaaaaaaaaaaaaaaaaaaaaaaand let's simulate!

for(i in 1:N){
    index <- sample(n_all, n_first)
    randomDiffs[i] <- mean(draftnumbers[index]) - mean(draftnumbers[-index])
   }

# Display resampling results (null distribution) as a histogram.
# Plot the observed difference on the null dist. for comparison.

library(ggplot2)
ggplot(data.frame(nulldist = randomDiffs), aes(x = nulldist)) +
  geom_histogram() +
  geom_vline(xintercept = testStatistic)

# The p-value is the fraction of results less than testStatistic.
# Remember, Ha: mu_second < mu_first so it's a lower-tailed test.
# Why the +1? Because the actual data is one possible permutation.
# Using it as one of our values prevents a p-value equal to zero.

pvalueLower <- (sum(randomDiffs <= testStatistic) + 1) / (N + 1)
print(pvalueLower)

# We can add some logic to help us make our decision, using alpha.
sprintf("The p-value for Ho: mu1 = mu2 vs. Ha: mu1 < mu2 is %1.5f.", pvalueLower)
ifelse(pvalueLower <= alpha, sprintf("Reject Ho."), sprintf("Do not reject Ho."))
