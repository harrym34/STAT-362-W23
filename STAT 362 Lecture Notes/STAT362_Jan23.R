my_sum <- function(a, b) {
  return(a + b)
}


# Mean of a vector
my_mean <- function(x) {
  n <- length(x)
  output <- 0
  
  for (i in 1:n) {
    output <- output + x[i]
  }
  
  return(output / n)
}

my_mean(c(1, 3, 5, 7, 9))


# Function that takes a matrix and returns sum of diagonal entries
sum_diag <- function(A) {
  # diag() will return a vector of diagonal entries
  return(sum(diag(A)))
  
}

B <- matrix(1:9, nrow = 3, ncol = 3)
sum_diag(B)


# more on for loops baby
cool_sq <- function(n) {
  for (i in 1:n) {
    print(i)
  }
}

cool_sq(100)

v_names <- c("A", "B", "C", "D")
for (i in 1:length(v_names)) {
  print(v_names[i])
}

# for loop that iterates through a vector of numbers and only prints evens
only_evens <- function(a) {
  for (i in 1:length(a)) {
    if (a[i] %% 2 == 0) {
      print(a[i])
    }
  }
}

only_evens(c(1, 2, 3, 4, 5, 6, -1, -5000))



# generate a bunch of random integers
sample(1:1e6, size = 100) # 1e6 = n1 * 10^6 = 1,000,000


# a lil' nested if-else why not
# check if z is positive, and if it is, check if its even
z_info <- function(z) {
  if (z > 0) {
    if (z %% 2 == 0) {
      print("z is positive and even!")
    }
  }
  else {
    print("z is not positive, but is maybe even")
  }
}

z_info(40)
z_info(-3)




