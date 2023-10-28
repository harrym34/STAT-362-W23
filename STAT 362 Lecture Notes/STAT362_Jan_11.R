# This is a comment!

# Combining numbers and objects:
a <- c(1, 5, 7)
b <- c(4, 5, 6)
a + b

#
# Data structures in R
#

# Vectors: collection of objects, different types of vectors
  # Integer, double, character, logical
  # All elements in a vector have to have the same type

  # Integer vector
  x <- 1:5
  typeof(x)
  
  # Double vector
  y <- c(7.4, 8.1, 9.99)
  typeof(y)
  
  # Character vector
  z <- c("Harry", "Henry", "Evan")
  typeof(z)
  
  # Logical vector
  p <- c(TRUE, FALSE, TRUE, FALSE)
  typeof(p)
  
  # What if you combine different types?
  q <- c("a", 2)
  
  g <- c("a", -1, TRUE)
  
  # Indexing a vector (NO ZERO BASED INDEXING!)
  a <- c(1, 2, 3, 4, 5)
  a[1]
  a[2]
  a[3]
  
  # Indexing multiple elements
  a[2:3]
  a[c(2, 4)]
  
  # Length of a vector
  length(a)
  
  
# Factors: like vectors, but with categorical variables
  # For example, hot/cold, low/medium/high, gender, etc.
  
  
  # Will have two "levels": H and C
  factor(c("H", "C", "H", "H", "C"))
  
# Matrices: rows/columns of vectors
  
  # By default, will fill by column
  A <- matrix(1:12, nrow = 3, ncol = 4)
  
  # You have to manually make it fill by row:
  B <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
  
  # Dimension of a matrix, 3 x 4
  dim(B)
  
  # Number of rows, cols
  nrow(B)
  ncol(B)
  
  # Getting a value from a matrix, A[row, col]
  B[1, 3]
  
  # Getting an entire row or col from a matrix
  A[3,] # row
  B[,1] # col
  
  # Combine columns or rows
  cbind(A, B)
  rbind(B, A)
  
  # Transpose
  t(A)
  
  # Matrix addition element-wise
  A + B
  
  # Matrix multiplication, use %*%, make sure matrices are compatible.
  C <- matrix(1:12, nrow = 4, ncol = 3)
  
  A %*% C
  
  # Element-wise multiplication
  A * B
  
  # Multiplication by a scalar
  m <- 2
  m * A
  
  # Matrix-vector multiplication
  c(1, 3, 5) * A
  
  # Diagonal matrices
  diag(4) # Identity matrix of dim 4
  
  diag(c(1, 2, 3)) # Diagonal with 1, 2, 3 on diagonal
  
  # Get the diagonal from a matrix (only works for square matrices)
  E <- matrix(1:9, nrow = 3, ncol = 3)
  diag(E)
  
  F <- matrix(c(1, 2, 2, 5), 2, 2)
  solve(F)
  solve(F %*% F)
  
  
  # Element wise multiplication of matrices

  


  
  
  
  
  
  
  