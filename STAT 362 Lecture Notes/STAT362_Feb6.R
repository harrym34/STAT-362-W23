# Histrograms
# FOr estimatig the density of your variable



hist(mtcars$mpg, breaks = 20)

# Gives density on the y axis (instead of frequency)
hist(mtcars$mpg, breaks = 20, freq = FALSE)


# Boxplots

# display five number summary
# min, max, median, first quartile, third quartile

plot(x = ToothGrowth$supp, y = ToothGrowth$len)

boxplot(len ~ supp, data = ToothGrowth) 

# plot f(x)

curve(x^3 - 5 * x, from = -4, to = 4)
# Divide the interval into 1000 parts
x <- seq(-4, 4, len = 1000)
plot(x, x^3 - 5 * x, type = "l")


par(mfrow = c(2, 2))
x <- rnorm(100)
y <- x + rnorm(100)

# To see multiple plots at once, run these toghether
hist(x)
hist(y)
plot(x, y)
boxplot(x, y)


x <- -5:5
y <- x ^ 2
plot(x, y)
plot(x, y, type = "l")
plot(x, y, type = "b")
plot(x, y, type = "h")
plot(x, y, type = "o")

# Adding titles
plot(x, y, xlab = "x axis name!", ylab = "y axis name!",
     main = "this is the title!",
     xlim = c(-10, 10),
     ylim = c(0, 50))

# Elements on plot
a <- rnorm(100)
b <- a + rnorm(100)
plot(a, b)
abline(v = 1, col = "red")
abline(n = 2, col = "red")
lines(x = c(0, -1, 2), y = c(1, 2, 3), col = "blue")

#
# GG PLOT!!!
#

# tidyverse has ggplot2 in it
library(tidyverse)
install.packages("gcookbook")
library(gcookbook)

# Bar charts
pg_mean

ggplot(data = pg_mean, 
       mapping = aes(x = group, y = weight)) + 
geom_col()


# With the piping operator
mtcars %>%
  group_by(gear) %>% 
  summarize(mean_wt = mean(wt)) %>% 
  ggplot(mapping = aes(x = gear, y = mean_wt)) +
  
  # "color" is for the outline of the rectangles
  geom_col(fill = "lightblue", color = "red")


# Grouped bars
mtcars %>% 
  summarize(mean_wt = mean(wt)) %>% 
  ggplot(mapping = aes(x = gear, y = mean_wt, fill = vs)) +
  geom_col(position = "dodge")


# R Graphics Cookbook (r-graphics.org) is a good reference
# will be using it lots in this chapter

