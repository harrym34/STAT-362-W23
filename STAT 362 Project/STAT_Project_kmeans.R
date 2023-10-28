# For random analysis
library(tidyverse)

# Cluster visualization
library(factoextra)

league <- read.csv("C:/Users/harry/OneDrive/Desktop/Classes/2nd Year/STAT 362/STAT 362 Project/high_diamond_ranked_10min.csv")

df <- select(league, blueWins, blueGoldDiff)

lol_kmeans <- kmeans(x = scale(df[, 1:2]), centers = 3,
                     nstart = 25)

lol_kmeans$cluster

fviz_cluster(lol_kmeans,  data = df[, 1:2], geom = "point")

