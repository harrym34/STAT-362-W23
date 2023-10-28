## Back to ggplot

library(tidyverse)

# If you want to use a function in a package but there is a
# conflict you do
  # nameOfPackage::nameOfFunction, for instance
stats::filter()

# bar chart of counts
library(gcookbook) # contains some datasets
library(nycflights13)


# bar chart of counts
mtcars %>% 
  ggplot(mapping = aes(x = gear)) +
  geom_bar(fill = "turquoise", col = "purple")


flights %>% 
  ggplot(mapping = aes(x = month)) +
  geom_bar()


# Play around a  bit
flights2 <- flights
flights2$month <- factor(flights2$month)

flights2 %>% 
  ggplot(mapping = aes(x = month)) +
  geom_bar()

flights2 %>% 
  ggplot(mapping = aes(x = month)) +
  geom_bar(fill = "lightblue", width = 0.5)

flights2 %>% 
  ggplot(mapping = aes(x = origin, fill = month)) +
  geom_bar(position = "dodge")

flights2 %>% 
  ggplot(mapping = aes(x = month, fill = origin)) +
  geom_bar(position = "dodge")

flights2 %>% 
  ggplot(mapping = aes(x = month, fill = origin)) +
  geom_bar(position = "dodge") +
  scale_fill_brewer(palette = "Pastel2")

flights

#
# Line Graphs
#
  # Example: cate a line graph for the average arrival delay
  # in each day in the flights dataset

# Get new dataset as mean_arry_delay
flights %>% 
  group_by(month, day) %>% 
  summarize(mean_arr_delay = 
              mean(arr_delay, na.rm = TRUE)) %>% 
  ggplot(mapping = aes(x = 1:365, y = mean_arr_delay)) +
  geom_line() +
  labs(
    title = "Daily Average Arrival Delay",
    x = "Time",
    y = "Average Arrival Delay"
  ) +
  ylim(0, 50)



mean_delay %>% 
  ggplot(mapping = aes(x = 1:365, y = mean_arr_delay)) +
  geom_line() +
  labs(
    title = "Daily Average Arrival Delay",
    x = "Time",
    y = "Average Arrival Delay"
  )

# by origin as well
flights %>% 
  group_by(month, day, origin) %>% 
  summarize(mean_arr_delay = mean(arr_delay, na.ma = TRUE)) %>%
  ungroup()


  ggplot(mapping = aes(x = 1:365, y = mean_arr_delay, 
                        color = origin)) +
  geom_line()
  
  
by_day_origin$Time <- rep(1:365, each = 3)

by_day_origin %>% 
  ggplot(mapping = aes(x = Time, y = mean_arr_delay,
                       color = origin)) 
  geom_line()
  summarize(mean_arr_delay)
  
  
# Monthly arrival delay
flights3 <- flights
flights3$month <- factor(flights3$month)

flights3 %>% 
  group_by(month, origin) %>% 
  summarize(mean_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  ggplot(mapping = aes(x = month, y = mean_delay, color = origin)) +
  geom_line() +
  geom_point()



ggplot(flights, aes(x = origin, fill = factor(month))) + 
  geom_bar(position = "dodge", color = "black") +
  scale_fill_discrete(name = "Month") # change the title of the legend
