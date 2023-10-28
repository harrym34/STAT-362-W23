#
# More on k-means clustering
#

# For visualization
library(dplyr)
library(ggplot2)
library(factoextra)
install.packages("factoextra")
install.packages("jpeg")


# Read data
mall <- read.csv("C:/Users/harry/OneDrive/Desktop/Classes/2nd Year/STAT 362/STAT 362 Random/Mall_Customers.csv")

# Perform clustering
mall_kmeans <- kmeans(x = scale(mall[, 4:5]), 
                      centers = 3, nstart = 25)

# View the cluster centers (centroids)
mall_kmeans$centers

# Visualize the clusters
fviz_cluster(mall_kmeans,  data = mall[, 4:5], geom = "point")

# What if we try and use k = 5?
mall_kmeans5 <- kmeans(x = scale(mall[, 4:5]), centers = 5, nstart = 25)

# Visualize the 5 clusters (how bout it!)
fviz_cluster(mall_kmeans5,  data = mall[, 4:5], geom = "point")


# Using another variable for clustering
mall_kmeans <- kmeans(x = scale(mall[, 3:5]), centers = 5, nstart = 25)

# Visualize it, uses the first two principal components,
# that is, in R^2
fviz_cluster(mall_kmeans,  data = mall[, 3:5], geom = "point")


#
# Violin plots: an alternative
#

# Kind of density estimate

# Add the cluster information to our dataset
mall_cluster <- mutate(mall, Cluster = factor(mall_kmeans$cluster))

# Create the violin plots
mall_cluster %>% 
  ggplot(aes(x = Cluster, y = `Annual Income (k$)`)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = .1, fill = "black", outlier.colour = NA) +
  stat_summary(fun = median, geom = "point", fill = "white", shape = 21, size = 2.5)


# Determining the best value of k
# Use the elbow method, similar to the scree plot
# for principal components.

WSS <- rep(0, 10)
for (k in 1:10) {
  
  # extract the total within-group sum of squared errors
  WSS[k] = kmeans(x = scale(mall[, 3:5]), centers = k, nstart = 25)$tot.withinss
}

# Where it starts becoming asymptotic is the best
# value of k
ggplot(mapping = aes(x = 1:10, y = WSS)) +
  geom_line() + 
  geom_point() +
  geom_vline(xintercept = 4) +
  scale_x_discrete(name = "k", limits = factor(1:10)) +
  labs(title = "Elbow Method")


#
# Another example: hitters
#

install.packages("ISLR2")
library(ISLR2)

Hitters <- na.omit(Hitters)
Hitters_kmeans <- kmeans(x = scale(Hitters[, 1:10]), centers = 5, nstart = 25)

# Visualize clusters
fviz_cluster(Hitters_kmeans,  data = Hitters[, 1:10], geom = "point")


# Image segmentation and compression (RIP)
# sick fuckin application




