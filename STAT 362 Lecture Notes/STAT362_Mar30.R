######################
# 18: Regularization #
######################

# Fitting a model where the estimated parameters are shrunken 
# towards zero. The aim is to reduce over-fitting and improve 
# prediction accuracy.

# Can basically be used in any situation
  # e.g linear regression, logistic regression, deep learning


install.packages("glmnet")
library(ISLR2)
library(glmnet)

Hitters <- na.omit(Hitters)


head(Hitters[, c("League", "Division", "NewLeague")])

# Use model.matrix to prepare the data. The first column is 
# the intercept and we remove it when putting into glmnet().
x <- model.matrix(Salary ~., Hitters)[, -1] 
y <- Hitters$Salary

head(x[, c("LeagueN", "DivisionW", "NewLeagueN")])


# Generate random indexes to split the data into training and testing data:
set.seed(1)

# Use half of data as training data
index <- sample(nrow(x), nrow(x) * 0.5)


#
# 18.3 Ridge Regression
#

# Perform ridge regression with cross-validation. The default 
# option is 10-fold CV. Note that by default, the variables 
# will be scaled automatically in the function.

ridge_cv <- cv.glmnet(x[index, ], y[index], alpha = 0)

# Shows the CV error (with different values of lambda on a 
# logarithmic scale).
plot(ridge_cv)

# Get the value of lambda that produces the smallest MSE
best_lambda <- ridge_cv$lambda.min

# Fit the ridge regression for the training data set with the
# “best” lambda and evaluate the test error.

# Ridge regression with a particular value of lambda
ridge_best <- glmnet(x[index, ], y[index], 
                     alpha = 0, lambda = best_lambda)

# Form predictions
ridge_pred <- predict(ridge_best, s = best_lambda, 
                      newx = x[-index, ])

# test error
mean((ridge_pred - y[-index])^2)



