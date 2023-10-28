# Quiz info
  # First day after reading week, in class, 50 minutes
  # Can use notes, but no internet, bring laptop
  # Questions will be from chapter 1-6
  # Short questions, like the short questions in the assignment
  # Sample quiz will be posted
  # The questions will be on OnQ
  # Come early
  # Also submit to OnQ

library(tidyverse)
library(gcookbook)
library(nycflights13)
install.packages("ggrepel")
library(ggrepel)

 countries %>% 
   filter(Year == 2009, healthexp > 2000) %>% 
   ggplot(mapping = aes(x = healthexp, y = infmortality)) +
   geom_point()
 
 
 countries_small <- countries %>% 
   filter(Year == 2009, healthexp > 2000)
 
 
 countries_small %>% 
   ggplot(mapping = aes(x = healthexp, y = infmortality)) +
   geom_point() +
   # Label all the points
   geom_text_repel(aes(label = Name), size = 2)
 
 
 
 #
 # Summarizing distribtions
 #
 
 # Histogram, kernel density estimator
 
 
 # Histograms are really estimating the PDFs of a 
 # continious random variable, how do we do it in ggplot2?
 
 
library(MASS)

# Frequency, not density
hist(birthwt$bwt, breaks = 20, freq = FALSE)

# Actually shows density
birthwt %>% 
  ggplot(mapping = aes(x = bwt)) +
  geom_histogram(aes(y = ..density..))

# e.g. want to see the distributions among smoking and 
# non-smoking gropus
birthwt

birthwt %>% 
  ggplot(mapping = aes(x = bwt)) +
  geom_histogram() +
  facet_grid(smoke - .)
 

# Changing the names of smoke (0 = no smoke, 1 = smoke)
birthwt2 <- birthwt

birthwt2$smoke <- ifelse( birthwt2$smoke == 0, "no smoke", "smoke")
 


birthwt2 %>% 
  ggplot(mappinig = aes(x = bwt)) +
  geom_histogram() +
  facet_grid(smoke - .)


# Lighter babies = didn't smoke 
birthwt2 %>% 
  ggplot(mapping = aes(x = bwt, fill = smoke)) +
  geom_histogram(position = "identity", alpha = 0.8,
                 aes(y = ..density..))

# A smooth estimate: the kernel density estimator, with a histogram
birthwt %>% 
  ggplot(mapping = aes(x = bwt)) +
  # Have to use ..density.. here, otherwise there will be no overlap
  geom_histogram(aes(y = ..density..)) + 
  geom_density()


# KDE is a non-parametric method of estimating the 
# density function of a continuous random variable.

# For example, estimating the density function
# Parametric model/method: 
  # e.g. normal distribution, exp dist,
# they have a parameter (a vector)

# Usually use theta to denote the parameter, finite
# dimensional means that \theta \in \mathbb{R}^{p}, p \in \mathbb{N}


# Non-parametric:
  # KDE, empirical dist function: to estimate CDF



