
library(dplyr)

classlist <- read.csv("Admin/F18Students.csv")

students <- classlist %>% 
  filter(section == 102)

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
                "Floating")

repetitions  <- c(rep(3, 10), 1)

groups <- rep(groupnames, repetitions)

print.data.frame(data.frame(students = students$name, 
                            group = sample(groups)), 
                 right = FALSE,
                 row.names = FALSE)



