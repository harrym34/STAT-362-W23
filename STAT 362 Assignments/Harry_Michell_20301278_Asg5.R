# Harry Michell, 20301278

# Q1)

library(ISLR2)
library(tidyverse)
library(dplyr)
library(bestglm)
Hitters <- na.omit(Hitters)


# Categorical variables are:
  # League
  # Division
  # NewLeaguge

# Q2a)
ggplot(Hitters, mapping = aes(x = Years, y = Salary)) +
         geom_point()

# Q2b)
ggplot(Hitters, mapping = aes(x = Years, y = Salary,
      color = League)) + geom_point()

# Q3a)
ggplot(Hitters, mapping = aes(x = Salary)) +
  geom_histogram(bins = 20)
# Observation: The vast majority of  players have salaries 
# under $1,000,000.

# Q3b)
ggplot(Hitters, mapping = aes(x = Salary)) +
  geom_density()

# Q3c)
# The histogram and density estimator both tell a similar
# story, that the vast majority of players have salaries under
# $1,000,000. However, the density estimator predicts that
# 

# Q4a)
q4 <- lm(Salary ~ CHits, data = Hitters)
summary(q4)
# Q4b)

# Q5a)
CHits_quan <- quantile(Hitters$CHits, c(0.2, 0.4, 0.6, 0.8))


cat_CHits <- rep(0, nrow(Hitters))
cat_CHits[Hitters$CHits <= CHits_quan[1]] <- 1
cat_CHits[Hitters$CHits > CHits_quan[1] & Hitters$CHits <= CHits_quan[2]] <- 2
cat_CHits[Hitters$CHits > CHits_quan[2] & Hitters$CHits <= CHits_quan[3]] <- 3
cat_CHits[Hitters$CHits > CHits_quan[3] & Hitters$CHits <= CHits_quan[4]] <- 4
cat_CHits[Hitters$CHits > CHits_quan[4]] <- 5
cat_CHits <- factor(cat_CHits)

lm_hits <- lm(Salary ~ cat_CHits, Hitters)
summary(lm_hits)

# Q5b)
# The interpretataion of the regression coefficients

# Q6a)

# Split data
set.seed(1)
index <- sample(nrow(Hitters), nrow(Hitters) * 0.5)
train <- Hitters[index, ]
test <- Hitters[-index, ]

  

lm_hit2 <- lm(Salary ~ AtBat + Hits + HmRun + Runs + RBI + Walks + Years 
              + CAtBat + CHits + CHmRun + CRuns + CRBI + CWalks + League
              + Division + PutOuts + Assists + Errors + NewLeague, Hitters)

summary(lm_hit2)

# Q6b)
# The statistically significant variables at 0.05 are AtBat, Hits, Walks, CWalks
# Division, and PutOuts


# Q6c)
# The estimated regression coefficient of CHits is 0.13399, which is lower than 
# the p value of 0.05. This means that it is statistically insignificant. That is,
# we cannot conclude there is a strong linear relation ship# between CHits and 
# Salary.


# Q7a)

mean(train - predict(lm_hit2, (AtBat + Hits + HmRun + Runs + RBI + Walks + Years 
                               + CAtBat + CHits + CHmRun + CRuns + CRBI + CWalks + League
                               + Division + PutOuts + Assists + Errors + NewLeague)^2))

lm_hit2$coefficients

# Q7b)


# Q8)
iris_train <- read.csv(
  "C:/Users/harry/OneDrive/Desktop/Classes/2nd Year/STAT 362/STAT 362 Assignments/STAT 362 Datasets/iris_train.csv"
)

iris_test <- read.csv(
  "C:/Users/harry/OneDrive/Desktop/Classes/2nd Year/STAT 362/STAT 362 Assignments/STAT 362 Datasets/iris_test.csv"
)

iris_train$versicolor <- as.numeric(iris_train$Species == "versicolor")
iris_test$versicolor <- as.numeric(iris_test$Species == "versicolor")

fit_iris <- glm(versicolor ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
    data = iris_train)

summary(fit_iris)

# Q9)
# Sepal length and Petal Length

# Q10
prob <- predict(fit_iris, iris_test, type = "response")
predicted_class <- ifelse(prob > 0.5, "pos", "neg")

# Confusion Matrix
table(predicted_class, iris_test$versicolor) 

# Accuracy
acc <- (27 + 7) / (27 + 11 + 5 + 7)
acc

