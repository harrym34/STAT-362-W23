mat_multi <- function(X, Y) {
  return(X %*% Y)
}


tot <- 0 
for (i in 1:100) {
  for (j in 1:4) {
    tot <- tot + (exp(-i) / j)
  }
}
print(tot)

Q7 <- function(vec) {
  for (v in vec) {
    if (v < 0) {
      print("Some numbers are negative")
      break
    }
    else {
      print("All numbers are positive")
    }
  }
}

library(tidyverse)
j <- mtcars %>% 
  filter(gear == 5, carb < 5)


# Compute correlation
cor(c(1, 3, 6, 20), c(2, 9, 10, NA), use = "complete.obs")


# Plotting
mtcars$gear <- factor(mtcars$gear)
mtcars %>% 
  ggplot(mapping = aes(x = wt, y = disp, color = gear)) +
  geom_point(size = 2)

library(MASS)

birthwt %>% 
  filter(race == 1, smoke == 1) %>% 
  ggplot(mapping = aes(x = lwt)) +
  geom_density()

diamonds[sample(1:nrow(diamonds), size = 5000), ] %>% 
  ggplot(mapping = aes(y = carat, x = price, color = clarity)) +
  geom_point()
