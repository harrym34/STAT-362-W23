# More data visualization for ggplot2
library(tidyverse)
library(gcookbook)

# Last time: line graphs, bar charts, 
# Today: scatterplots, overplotting
  # Usually, use scatterplots to visualize the relationship
  # between two continuous variables.

# dataset
heightweight %>% 
  # Always use + in ggplot, %>% is not related to ggplot
  ggplot(mapping = aes(x = ageYear, y = heightIn)) +
  geom_point()

plot_year_height <- ggplot(heightweight, 
                    mapping = aes(x = ageYear, y = heightIn)) +
  geom_point()

plot_year_height + 
  geom_point(size = 1.5, shape = 4, color = "purple")


# Visualize one additional variable to this plot

heightweight %>% 
  # Change the colour according to a categorical variable
  ggplot(mapping = aes(x = ageYear, y = heightIn, color = sex)) +
  geom_point()


heightweight %>% 
  # Change the colour according to a continous variable
  ggplot(mapping = aes(x = ageYear, y = heightIn, color = weightLb)) +
  geom_point()


# Overplotting
diamonds %>%
  ggplot(mapping = aes(x = carat, y = price)) +
  geom_point(size = 0.1)

# alpha = 0.05 means 95% transparent
diamonds %>%
  ggplot(mapping = aes(x = carat, y = price)) +
  geom_point(size = 0.1, alpha = 0.05)

# Make a random subset of the data
index <- sample(1:nrow(diamonds), size = 2000, replace = FALSE)

# Put the data into a tibble
diamonds_small <- diamonds[index,]

diamonds_small %>%
  ggplot(mapping = aes(x = carat, y = price)) +
  geom_point(size = 0.1, alpha = 0.5)

# Could also try grouping the points, called "binning" the data
# into rectangles.

# Pretty sick looking graphs, relationship seems to be 
# somewhat linear just by looking at the graph
diamonds %>%
  ggplot(mapping = aes(x = carat, y = price)) +
  stat_bin2d(bins = 30)



# What if the variable on the x-axis is discrete?
  # You will have another overplotting issue.

# Doesn't look great, concentrated on like 5 values
ChickWeight %>% 
  ggplot(mapping = aes(x = Time, y = weight)) +
  geom_point()

# Can add random noise by "jittering"
# Can get the same plot by using set.seed()
ChickWeight %>% 
  ggplot(mapping = aes(x = Time, y = weight)) +
  geom_point(position = "jitter", size = 0.5, alpha = 0.5)


# Can control the amount of noise
ChickWeight %>% 
  ggplot(mapping = aes(x = Time, y = weight)) +
  geom_point(position = position_jitter(width = 0.5, height = 0),
             size = 0.5, alpha = 0.5)


# Labelling points in a scatterplot
countries
?countries
dim(countries)
str(countries)

# Select the data from the year 2009, and healthexp > 2000

# Store as a variable if you plan on using it frequently (or more
# than once)
countries_small <- countries %>% 
  filter(Year == 2009, healthexp > 2000)

# We don't know which country is which when we plot
countries %>% 
  filter(Year == 2009, healthexp > 2000) %>% 
  ggplot(mapping = aes(x = healthexp, y = infmortality)) + 
  geom_point() +
  # Simplest way is using annotate()
  annotate("text", x = x_y[1], y = x_y[2] + 0.2, label = "Canada")

# Will give x and y coordinates??
x_y <- as.numeric(countries_small[which((countries_small$Name == "Canada"), 
                      c("healthexp", "infomortality"))])


