# Back to the Kernel Density Estiamte (KDE)
library(tidyverse)
library(MASS)

ggplot(birthwt, aes(x = bwt)) +
  geom_density() +
  geom_density(adjust = 0.25, color = "red") + # smaller bandwidth -> noisy
  geom_density(adjust = 2, color = "blue") # large bandwidth -> smoother

# Usually choice h by cross-validation (BRUH!)


birthwt_mod <- birthwt
birthwt_mod$smoke <- ifelse(birthwt_mod$smoke == 1, "Smoke", "No Smoke")

ggplot(birthwt_mod, aes(x = bwt, fill = smoke)) +
  geom_density(alpha = 0.3) # to control the transparency 

# Saving plots

setwd("C:/Users/harry/OneDrive/Desktop/Classes/2nd Year/STAT 362/STAT 362 Images")
pdf("STAT362TestImage")


# Swapping x and y coordinates

# Boxplot
plot1 <- ggplot(PlantGrowth, aes(x = group, y = weight)) +
  geom_boxplot()

plot2 <- plot1 +
  coord_flip()

# From this package
library(ggpubr)
ggarrange(plot1, plot2)


# Adding titles to a plot
hw_plot <- ggplot(heightweight, aes(x = ageYear, y = heightIn)) +
  geom_point() 
hw_plot1 <- hw_plot +
  ggtitle("Age and Height of Schoolchildren")
hw_plot2 <- hw_plot +
  ggtitle("Age and Height \nof Schoolchildren")
ggarrange(hw_plot1, hw_plot2)