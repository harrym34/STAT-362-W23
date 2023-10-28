# For random analysis; LDA
library(tidyverse)

# Classification and Visualization
library(MASS)
library(klaR)
library(devtools)

# https://www.r-bloggers.com/2021/05/linear-discriminant-analysis-in-r/

league <- read.csv("C:/Users/harry/OneDrive/Desktop/Classes/2nd Year/STAT 362/STAT 362 Project/high_diamond_ranked_10min.csv")

df <- select(league, blueWins, blueTotalGold, redTotalGold,
             blueGoldDiff, redGoldDiff)

set.seed(500)
ind <- sample(2, nrow(df),
              replace = TRUE,
              prob = c(0.6, 0.4))
training <- df[ind==1,]
testing <- df[ind==2,]