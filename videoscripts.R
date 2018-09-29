# Data from 100 gas mileage recordings for a given vehicle
# The mpg variable in this dataset is relatively symmetric

gas <- read.csv("https://raw.githubusercontent.com/STAT-JET-ASU/Datasets/master/Instructor/gasmileage.csv")

library(dplyr)
gas %>% summarize(
  range_dat    = diff(range(mpg)),
                  mean_abs_dev = mean(abs(mpg - mean(mpg))), 
                  variance     = var(mpg),
                  std_dev      = sd(mpg))


# Flight Delays dataset from Chihara & Hesterberg textbook
# The Delay variable in this dataset is quite right skewed

flightDelays <- read.csv("https://raw.githubusercontent.com/STAT-JET-ASU/Datasets/master/Chihara/FlightDelays.csv")

library(dplyr)
delaySumm <- flightDelays %>% 
  summarize(range_dat    = diff(range(Delay)), 
            mean_abs_dev = mean(abs(Delay - mean(Delay))), 
            variance     = var(Delay),
            std_dev      = sd(Delay))

print.data.frame(delaySumm)

# Group by carrier and then summarize

delaySumm_byC <- flightDelays %>% 
  group_by(Carrier) %>% 
  summarize(range_dat    = diff(range(Delay)), 
            mean_abs_dev = mean(abs(Delay - mean(Delay))), 
            variance     = var(Delay),
            std_dev      = sd(Delay))

print.data.frame(delaySumm_byC)
