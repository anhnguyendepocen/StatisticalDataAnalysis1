# Chi-Square Test of Independence
# Looking at the Popular Kids data
# Are gender and goal independent?

# Create a new function to compute the chi-squared test statistic
# The function's name is chisq, the required input is a data table 
# Obs(erved) is the observed data table; variables are defined later
# Exp(ected) is a contingency table computed from the Observed data
# Outer is the outer product of two vectors, which makes a matrix
# http://en.wikipedia.org/wiki/Outer_product
# http://calculator.vhex.net/calculator/linear-algebra/outer-product

chisq<-function(Obs){ 
  Exp <- outer(rowSums(Obs),colSums(Obs))/sum(Obs)
  sum((Obs-Exp)^2/Exp)
}

# Load the dataset
POP <- read.csv(file=url("https://raw.githubusercontent.com/STAT-JET-ASU/Datafiles/master/Instructor/popular.csv"))

# Select the two variables we want to test and make a table

Observed <- table(POP$district_type,POP$top_goal)
prop.table(Observed, 1)

# Use function we created to calculate the chi-square test statistic

testStatistic <- chisq(Observed)

# This computes the expected counts if we want to see them, but this
# separate step is not necessary to carry out the permutation test; 
# our function does it for us when calculating the test statistic.

Expected <- outer(rowSums(Observed),colSums(Observed))/sum(Observed)

# Resampling permutation test loop and graph of results
# Start with selecting the two variables to be analyzed
# If there is missing data, filter out those cases first

gender <- POP$district_type
goals  <- POP$top_goal

alpha <- .05
N <- 10^4-1

randomChisq <- numeric(N)

for (i in 1:N){
  goalPerm <-sample(goals)
  randomTable <- table(gender, goalPerm)
  randomChisq[i] <- chisq(randomTable)
}

# Graph the null distribution of the test statistic

library(ggplot2)
ggplot(data.frame(nulldist = randomChisq), aes(x = nulldist)) +
  geom_histogram(color = "blue", fill = "lightblue") +
  geom_vline(xintercept = testStatistic, color = "red")

pvalue <- (sum(randomChisq >= testStatistic) + 1) / (N + 1)

# Print the test statistic and p-value
# The p-value is rounded to four places
# because we performed 10^4 simulations

print(paste("The chi-square test statistic is ", round(testStatistic, 4), ".", sep=""), quote = F)
print(paste("The p-value for the test of independence is ", format(pvalue, scientific = F), ".", sep=""), quote=F)

# -----------------------------------------------

# The built-in R function for the chi-square test
# This is NOT the same function we created earlier

chisq.test(table(POP$district_type,POP$top_goal))

# Using Monte-Carlo simulation to get a p-value

chisq.test(table(POP$district_type,POP$top_goal), simulate.p.value = TRUE)



