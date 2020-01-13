# Resampling Permutation Test
# Generic vs. Brand Name Batteries
# Observed data include 6 of each battery type
# See also BatteryLifeExample.xlsx
# Last updated 11.05.20195 @ 07:00pm
# Update: 

library(tidyverse)



# Print out the observed data and statistics comparing the groups.





# Compute the observed difference in means in the dataset.
# Observed difference is called the TEST STATISTIC for Ho.
# Remove label from tapply output when printing obs.diff.
# (other scripts show a different way to compute obs.diff)
# Format OBS.DIFF output so that it reads as a sentence.
# (formatting as a sentence isn't required, but it's nice)

OBS.DIFF <- tapply(BATT$Hours, BATT$Type, mean)[2] - tapply(BATT$Hours, BATT$Type, mean)[1]    
attributes(OBS.DIFF) <- NULL
sprintf("The observed mean difference (xbar.G - xbar.B) is %1.2f hours.", OBS.DIFF)

# Select the variable you want to test and drop all the others.
# Dropping results in a numeric vector rather than a data frame.
# The vector is the observed values of the variable being tested.
# Data are randomly regrouped as Gen or Brand in the simulation.

hours <- subset(BATT, select=Hours, drop=T)

# Uncomment the seed command below to get reproducible results.
# Otherwise each simulation iteration generates unique results.

# set.seed(0)

# Conduct the resampling procedure for N simulation iterations.
# All of the commands included between the { } repeat N times.
# The vector RANDOM.DIFF stores the SIMULATED NULL DISTRIBUTION 
#     for test statistic XBAR.G - XBAR.B; each RANDOM.DIFF entry
#     is computed the same way as the test statistic OBS.DIFF.
# The data are randomly chosen to be in Generic and Brand groups.
# The vector "index" is the data locations selected for Generic.
# The vector "-index" is the un-selected values left to be Brand.
# In the textbook the RANDOM.DIFF vector is often called result.
# Start the resampling process!

# Set level of rejection for the null hypothesis.

alpha <- .05

# Set the number of iterations for the simulation.

N <- 10^5-1

# Create a vector to store the simulation results.
RANDOM.DIFF <- numeric(N)

# Aaaaaaaaaaaaaaaaaaaaaaaaaaaaand let's simulate!

for(i in 1:N)
   {
    index <- sample(12, 6)
    RANDOM.DIFF[i] <- mean(hours[index]) - mean(hours[-index])
   }

# Display resampling results (null distribution) as a histogram.
# Plot the observed difference on the null dist. for comparison.

hist(RANDOM.DIFF,
     main="Sampling Permutation Distribution",
     xlab="Randomly Resampled Differences")
abline(v=OBS.DIFF, col="blue", lty=5)       
text(OBS.DIFF, 5000, "Obs. Diff", pos=4, col="blue")

# Compute the upper-tail p-value and print it out.

pvalue.upper <- (sum(RANDOM.DIFF >= OBS.DIFF)+1)/(N+1)
sprintf("The p-value for Ho: mu.G = mu.B vs. Ha: mu.G > mu.B is %1.4f.", pvalue.upper)
ifelse(pvalue.upper <= alpha, sprintf("Reject Ho."), sprintf("Do not reject Ho."))
