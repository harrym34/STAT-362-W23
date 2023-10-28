# Q1

library(tidyverse)
library(MASS)
library(dplyr)

# Q2a
mtcars %>% 
  filter(vs == 1, mpg > 20)

# Q2b
Q2b_mtcars <- mtcars %>% filter(mpg, hp, vs)
print(Q2b_mtcars)


# Q3
Q3_data <- c(1, 3, NA, 5)
mean(Q3_data, na.rm = TRUE)


# Q4
Q4 <- function(n, operation) {
  total <- 0
  if (operation == "sum_normal") {
    for (i in 1:n) {
      total <- total + rnorm(n, 0)
      
    }
  }
  
  if (operation == "mean_unif") {
    for (i in 1:n) {
      total <- total + mean(runif(0, 1))
      
    }
  }
}

# Q5
total <- 0
for (x in 1:20) {
  for (y in 1:20) {
    total <- total + exp(-abs(x * x - y))
  }
}

# Q6
birthwt %>% 
  ggplot(mapping = aes(x = lwt, y = bwt, color = race)) +
  geom_point(size = 2) +
  xlab("mother's weight in pounds at last menstrual period") +
  ylab("birth weight in grams")

# Q7a
diamonds %>% 
  filter(carat > 0.7, color == "D") %>% 
  ggplot(mapping = aes(x = price)) +
  geom_density()

# Q7b
diamonds %>% 
  filter(carat > 0.7, color == "D") %>% 
  ggplot(mapping = aes(x = price)) +
  geom_histogram()


# Q8
Orange %>% 
  filter(Tree != 3, Tree != 4, Tree != 5) %>% 
  ggplot(mapping = aes(x = age, y = circumference, color = Tree)) +
  geom_line() +
  geom_point()