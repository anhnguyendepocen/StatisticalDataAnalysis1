spruce <- read.csv(file = url("https://raw.githubusercontent.com/STAT-JET-ASU/Datasets/master/Chihara/Spruce.csv"))

library(dplyr)
library(ggplot2)

summ <- spruce %>% 
  filter(!is.na(Height5)) %>% 
  group_by(Fertilizer) %>% 
  summarize(n    = n(),
            xbar = mean(Height5),
            s    = sd(Height5)) 
print(summ)

summ$xbar

diff(summ$xbar)   # NF - F
-diff(summ$xbar)  # F - NF

ggplot(spruce, aes(x = Height5, color = Fertilizer)) +
  geom_density() +
  geom_vline(xintercept = summ$xbar, 
             linetype = "dashed",
             color = c("blue", "red")) +
  scale_color_manual(values = c("blue", "red"))

ggplot(spruce, aes(x = Fertilizer, y = Height5)) +
  geom_boxplot()

ggplot(spruce, aes(sample = Height5, color = Fertilizer)) +
  stat_qq() + 
  stat_qq_line()

t.test(spruce$Height5 ~ spruce$Fertilizer)



Height5_F <- spruce %>% 
  filter(!is.na(Height5), Fertilizer == "F") %>% 
  pull(Height5)
n_F <- length(Height5_F)

Height5_NF <- spruce %>% 
  filter(!is.na(Height5), Fertilizer == "NF") %>% 
  pull(Height5)
n_NF <- length(Height5_NF)

sims <- 10^5
mean_diff <- numeric(sims)  

for (i in 1:sims) {
  sample_F  <- sample(Height5_F, n_F, replace = TRUE)
  sample_NF <- sample(Height5_NF, n_NF, replace = TRUE)
  mean_diff[i] <- mean(sample_F) - mean(sample_NF)
}

ggplot(NULL, aes(x = mean_diff)) + 
  geom_density(fill = "gray") + 
  labs(title = "Bootstrap distribution of mean difference") + 
  geom_vline(xintercept = -diff(summ$xbar), colour = "blue", linetype = "dashed")

ggplot(NULL, aes(sample = mean_diff)) + 
  stat_qq() + 
  stat_qq_line(color = "red")

quantile(mean_diff, c(.025, .975))
