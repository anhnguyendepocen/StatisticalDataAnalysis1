# summarizing quantitative data
# includes filtering and mutating
# Last updated 05.31.2018 @ 9:30pm

ML <- read.csv("https://raw.githubusercontent.com/STAT-JET-ASU/Datasets/master/Instructor/maunaloaCO2.csv")

library(dplyr)

# some basic descriptive measures
# we need to be careful about NAs
# most functions have na.rm option

mean(ML$co2adj)
mean(ML$co2raw)
mean(ML$co2raw, na.rm = TRUE)

sd(ML$co2adj)
variance(ML$co2adj)

fivenum(ML$co2adj)
fivenum(ML$co2adj)[1] # minimum
fivenum(ML$co2adj)[2] # first quartile
fivenum(ML$co2adj)[3] # median
fivenum(ML$co2adj)[4] # third quartile
fivenum(ML$co2adj)[5] # maximum

min(ML$co2adj)
median(ML$co2adj)
max(ML$co2adj)

IQR(ML$co2adj)

range(ML$co2adj)
diff(range(ML$co2adj))

quantile(ML$co2adj, 0.25)

# we can get several stats at once
# use the dplyr summarize function

# datasetname inside summarize
# what is the output structure?
summarize(ML, n = n(), mean = mean(co2adj), sd = sd(co2adj))

# piping, more flexible for doing multiple steps
ML %>% summarize(n = n(), mean = mean(co2adj), sd = sd(co2adj))

# group by decade to get summaries for each decade
# summaries are computed separately for each group
# pipe %>% ends a line when breaking across lines 
# here I am breaking over lines for my readability
ML %>% 
  group_by(decade) %>%
  summarize(n = n(), 
            mean = mean(co2adj), 
            sd = sd(co2adj))

# to control appearance, save results and print 
# use ?print.data.frame to see possible options

mysummaries <- ML %>% 
  group_by(decade) %>%
  summarize(n = n(), 
            mean = mean(co2adj), 
            sd = sd(co2adj))

print.data.frame(mysummaries)
print.data.frame(mysummaries, digits = 5)
print.data.frame(mysummaries, row.names = FALSE)

# filter chooses certain rows of the dataset
# select chooses certain columns of the dataset
# mutate creates new variables in the dataset
# this code does not store the modified dataset

ML %>%
  filter(year >= 1960) %>%
  select(decade, year, co2raw, co2adj) %>%
  mutate(difference = co2raw - co2adj) %>%
  summarize(n = n(), 
            mean = mean(difference, na.rm = TRUE), 
            sd = sd(difference, na.rm = TRUE))

# to use the modified dataset later, store it!
# we can also store the summary if we want to

ML2 <- ML %>%
  filter(year >= 1960) %>%
  select(decade, year, co2raw, co2adj) %>%
  mutate(difference = co2raw - co2adj)

# we can use boolean logic in our filtering
# boolean equals ==, not equal !=, and &, or |
# single = assigns values inside functions

ML3 <- ML %>% filter(year >= 1960 & year < 2010) # and

ML4 <- ML %>% filter(decade != "1950s" & decade != "2010s")

ML5 <- ML %>% filter(decade == "1960s" | decade == "1970s")

ML5 <- ML %>% filter(decade %in% c("1960s", "1970s"))

ML6 <- ML %>% filter(year >= 1960 & co2raw !="NA")

# when we remove cases, factor levels get left behind
# we need to explicitly tell R to forget unused levels
# the first table shows zero entries for 1950s, 2010s
# we filtered out those case, but they remain defined
# after we droplevels, the categories are "forgotten"
# remember to resave after the mutate or it is lost!

table(ML3$decade)
ML3 <- mutate(ML3, decade = droplevels(decade))
table(ML3$decade)
