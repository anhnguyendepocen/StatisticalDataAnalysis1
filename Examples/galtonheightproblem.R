library(readr)
library(dplyr)
library(ggplot2)
library(moderndive)

galton <- read_csv(file = url("https://raw.githubusercontent.com/STAT-JET-ASU/Datasets/master/Instructor/galtonheightdata.csv"))

galton <- galton %>% 
  mutate(GenderR = case_when(Gender == "M" ~ "male",
                             Gender == "F" ~ "female"),
         HeightR = case_when(GenderR == "male" ~ Height,
                             GenderR == "female" ~ Height * 1.08),
         MidParent = (Father + Mother)/2) %>% 
  select(Father, Mother, MidParent, Gender, GenderR, Height, HeightR)

head(galton)

cor(galton$Father, galton$HeightR)
(cor(galton$Father, galton$HeightR))^2

cor(galton$Mother, galton$HeightR)
(cor(galton$Mother, galton$HeightR))^2

cor(galton$MidParent, galton$HeightR)
(cor(galton$MidParent, galton$HeightR))^2

galtonnum <- galton %>% 
  select(Father, Mother, MidParent, Height, HeightR)

cor(galtonnum)

round(cor(galtonnum), 3)

galton %>% get_correlation(HeightR ~ MidParent)








