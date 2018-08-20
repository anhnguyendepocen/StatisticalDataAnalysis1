
library(dplyr)

students      <- c("Patrick", 
                   "Marshall",
                   "Jacob",
                   "Sam F.",
                   "Quinn",
                   "Darius",
                   "Greg",
                   "David",
                   "Sam H.",
                   "Hailey",
                   "Joe",
                   "Preston",
                   "Brian",
                   "William",
                   "Morgan",
                   "Henry",
                   "Jose",
                   "Nathaniel",
                   "Jackson",
                   "Kevin",
                   "Lauren")

groupletters1 <- c("A", "B", "C", "D", "E", "F", "G")
repetitions1  <- c(3, 3, 3, 3, 3, 3, 3)
groups1 <- rep(groupletters1, repetitions1)
arrange(data.frame(group = sample(groups1), students = students), group, students)