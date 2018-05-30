
library(dplyr)

students <- c("Patrick", 
              "Matthew", 
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
              "William",
              "Morgan",
              "Henry",
              "Caleb",
              "Jose",
              "Nathaniel",
              "Jackson",
              "Kevin",
              "Lauren")

groupletters <- c("A", "B", "C", "D", "E", "F", "G")

repetitions  <- c(3, 3, 3, 3, 3, 3, 4)

groups <- rep(groupletters, repetitions)

arrange(data.frame(group = sample(groups), students = students), group, students)

