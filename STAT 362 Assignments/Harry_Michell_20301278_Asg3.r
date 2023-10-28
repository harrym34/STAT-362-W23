library(tidyverse)
library(nycflights13)
library(gcookbook)
library(MASS)

# Q1a)
flights %>% 
  filter(month == 2) %>% 
  ggplot(mapping = aes(x = dep_delay)) +
  geom_histogram(binwidth = 10)

# Q1b)
flights %>% 
  filter(month == 2, dep_delay < 100) %>% 
  ggplot(mapping = aes(x = dep_delay)) +
  geom_histogram(binwidth = 5)


# Q2a)
flights %>% 
  filter(day == 1, dep_delay < 180) %>% 
  ggplot(mapping = aes(x = dep_delay, y = arr_delay)) +
  geom_point()

# Q2b)
flights %>% 
  filter(day == 1, dep_delay < 10) %>% 
  ggplot(mapping = aes(x = dep_delay, y = arr_delay)) +
  geom_point()

# Q2c)
# The graph in a) shows a much clearer trend simply because
# there is much more data present. 
# There certainly is a trend in the graph of b), but it
# is not as clearly pronounced as the graph in a).

# Q2d)

# for 2a)
flights %>% 
  filter(day == 1, dep_delay < 180) %>% 
  summarize(correlation = cor(dep_delay, arr_delay, use = "complete.obs"))

# for 2b)
flights %>% 
  filter(day == 1, dep_delay < 10) %>% 
  summarize(correlation = cor(dep_delay, arr_delay, use = "complete.obs"))

# The correlation from a) is 0.875, and the correlation
# from b) is 0.260, so these make sense.

# Q3)
plot_delay <- function(which_month, which_day, lower_range, upper_range) {
  flights %>% 
    filter(month == which_month, day == which_day, dep_delay >= lower_range, dep_delay <= upper_range) %>% 
    ggplot(mapping = aes(x = dep_delay, y = arr_delay)) +
    geom_point()
}

# Testing
plot_delay(which_month = 1, which_day = 30, lower_range = -5, upper_range = 30)

# Q4a)
flights %>% 
  ggplot(mapping = aes(x = month)) +
  geom_bar()

# Q4b) 
flights %>% 
  filter(month == 1) %>% 
  ggplot(mapping = aes(x = day)) + 
  geom_bar()

# Q4c)
flights %>%
  filter(month == 1) %>%
  group_by(day) %>%
  summarize(avg_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  ggplot(aes(x = day, y = avg_delay)) +
  geom_col()

# Q4d)
flights %>% 
  
  # idk man
  
  
# Q5)
flights %>%
  group_by(year, month, day) %>%
  summarize(avg_delay = mean(dep_delay, na.rm = TRUE)) %>% 
  ggplot(aes(x = 1:365, y = avg_delay)) +
  geom_line()

# Q6)
birthwt %>% 
  filter(age >= 25) %>% 
  ggplot(mapping = aes(x = age)) + 
  geom_density()

# Q7a)
mpg
ggplot(data = mpg)
# I don't see anything in the plot window

# Q7b)
mpg %>% 
  ggplot(mapping = aes(x = drv, y = class)) +
  geom_point()

# This is not a useful plot as it is plotting
# categorical data, not numerical data.

# Q7c)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

# The color should be outside the aes brackets.

# Q7d)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")


# Q8)
flights %>% 
  group_by()




# Q9a)
diamonds %>%
  group_by(cut) %>%
  summarise(avg_price = mean(price))

# These don't really make sense, wouldn't Ideal
# be the most expensive?

# Q9b)
diamonds %>% 
  group_by(cut) %>% 
  ggplot(mapping = aes(x = price, fill = cut)) +
  geom_histogram() + 
  facet_grid(scales = "free_y")

#

