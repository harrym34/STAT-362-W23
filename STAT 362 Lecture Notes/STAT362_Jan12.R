# Element-wise multiplication of matrices


X <- matrix(0, nrow = 100, ncol = 5)

X[,1] <- 1

# Random uniform distribution
X[,2:5] <- runif(400)

# Calculate beta hat (for linear regression)
Y <- runif(100)

solve(t(X) %*% X) %*% t(X) %*% Y


# LISTS

# Can store different data types
subject_name <- c("John", "Jane", "Steve")
temp <- c(37, 37.2, 37.3)
flu_status <- c(TRUE, FALSE, TRUE)

# Name of the first element of the list:
data <- list(name = subject_name,
             temperature = temp,
             flu = flu_status)

# Access the element of a list
data$temperature

# Get the second element
data [[2]]

data2 <- list(subject_name, temp, flu_status)

data2[[1]]


# Dataframe: a list organized in a rectangular shape
data3 <- data.frame(name_1 = subject_name, name_1 = temp, name_1 = flu_status)

data3$name_2

data3[,2]

colnames(data3)
colnames(data3) <- c("name", "temp", "flu")

data3[2,]

# Adding more data to dataframes
blood <- c("0", "AB+", "B-")
data3$blood_type <- blood

data3

# Deleting a column from a dataframe
data4 <- data3[,-3]
data4


#
# More Operators: *, /, +, -
#
2 ^ 5

# Modulus: finds remainder
7 %% 2

# Integer division
10 %/% 3

# Comparison
# >, >=, <, <=, ==, !=

4 > 2
4 >= 4
4 < 3
5 == 3 + 2 
10 != 7

# Logical OR  (|) and AND (&)
(4 > 2) | FALSE
TRUE | FALSE
FALSE | FALSE

(4 > 2) & TRUE
FALSE & FALSE

# Why not &&?
x <- c(TRUE, FALSE, FALSE)
y <- c(TRUE, TRUE, FALSE)

# & compares element wise
x & y

# Compares the first element
x && y


# Vectorized operations
g <- c(1, 5, 7)
h <- c(2, 4, 10)

# All done element wise
g + h
g * h
g / h
g ^ h

# Doing the same thing with a loop
z <- rep(0, 3)
for (i in 1:3) {
  z[i] <- x[i] + y[i]
}

# sqrt, abs, sin, cos, log, exp, pi

# e ^ 4
exp(4)

# default is ln()
log(5)

abs(-2)
sqrt(4)


