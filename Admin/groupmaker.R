
library(dplyr)

classlist <- read.csv("F18Students.csv")

secnum <- 101

students <- classlist %>% 
  filter(section == secnum)
  
groupnames <- c("Group 01", 
                "Group 02", 
                "Group 03", 
                "Group 04", 
                "Group 05", 
                "Group 06",
                "Group 07",
                "Group 08",
                "Group 09",
                "Group 10",
                "Fill-In")

repetitions  <- c(rep(3, 10), 1)

groups <- rep(groupnames, repetitions)

print.data.frame(data.frame(students = students$name, group = sample(groups)), 
                 right = FALSE,
                 row.names = FALSE)





