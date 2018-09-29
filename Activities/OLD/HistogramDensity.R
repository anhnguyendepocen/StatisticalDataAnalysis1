ML <- read.csv("https://raw.githubusercontent.com/STAT-JET-ASU/Datasets/master/Instructor/maunaloaCO2.csv")

library(dplyr)
library(ggplot2)

# basic histogram of a single variable
# the y-axis is a count of data points

ggplot(ML, aes(x = co2raw)) + geom_histogram()

# a few possible ways to specify bins in a histogram
# modify values here to explore various graphs below

numberofbins  <- sqrt(length(ML$co2raw))
widthofbins   <- 10
binboundaries <- seq(from = 300, to = 420, by = 10)

# comparing the same variable using different bin specs

ggplot(ML, aes(x = co2raw)) + geom_histogram(bins = numberofbins)
ggplot(ML, aes(x = co2raw)) + geom_histogram(binwidth = widthofbins)
ggplot(ML, aes(x = co2raw)) + geom_histogram(breaks = binboundaries)

# adding color to the histogram
ggplot(ML, aes(x = co2raw)) +
  geom_histogram(bins = numberofbins, 
                 color = "black",     # sets outline
                 fill = "lightblue")  # sets shading

# using a grouping variable to make comparisons

# the groups are stacked in this version
ggplot(ML, aes(x = co2raw, fill = decade)) +
  geom_histogram(bins = numberofbins)

# groups are overlaid and semi-transparent
ggplot(ML, aes(x = co2raw, fill = decade)) +
  geom_histogram(bins = numberofbins, 
                 position = "identity", # makes the bars unstack
                 alpha = 0.5) # sets fill color transparency 0-1

# groups are split into separate plots
ggplot(ML, aes(x = co2raw)) +
  geom_histogram(bins = numberofbins) +
  facet_wrap( ~ decade)

ggplot(ML, aes(x = co2raw)) +
  geom_histogram(bins = numberofbins) +
  facet_grid(decade ~ .)


# using density plots for the same data
# a density plot is a smoothed histogram
# uses a moving average to draw the plot
# note the y-axis in these is not counts
# total area under a density curve is 1

ggplot(ML, aes(x = co2raw)) + geom_density()

# bandwidth is the size of the averaging band
# play with the bandwidth to see what happens
# like setting bins, we could smooth too much

ggplot(ML, aes(x = co2raw)) + geom_density(bw = 20)


# add some features or use grouping in plots
ggplot(ML, aes(x = co2raw)) + geom_density(fill = "lightblue")

# density plots do not use bins...what happens?
# can you update this to the proper code?
ggplot(ML, aes(x = co2raw, fill = decade)) +
  geom_density(bins = numberofbins, 
               position = "identity", # makes bars unstack
               alpha = 0.5) # sets fill color transparency 

ggplot(ML, aes(x = co2raw)) +
  geom_density(fill = "lightblue") +
  facet_grid(decade ~ .)


# overlay a density plot on a histogram
# we have to adjust the histogram y-axis
# you can have more than one geom in a plot!

ggplot(ML, aes(x = co2raw)) + 
  geom_histogram(aes(y = ..density..), bins = numberofbins, fill = "lightblue") +
  geom_density(fill = "yellow", alpha = 0.5)


# filter out the incomplete 1950s decade
# facet wrap the rest to compare decades

ggplot(filter(ML, year >= 1960), aes(x = co2raw)) + 
  geom_histogram(aes(y = ..density..), bins = numberofbins, fill = "lightblue") +
  geom_density(fill = "yellow", alpha = 0.20) +
  facet_wrap(~ decade)