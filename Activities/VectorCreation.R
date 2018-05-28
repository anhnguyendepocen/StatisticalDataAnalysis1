# Vector creation and manipulation
# Last updated 05.28.2018 @ 05:00pm


# create a vector of values
v1 <- c("A", "B", "C", "D", "F")
v2 <- c(5, 16, 10, 2, 18)
v3 <- c(1.2, -3.5, 8.3, 2.9, -1.1)
v4 <- c(TRUE, TRUE, FALSE, TRUE, FALSE)


# create a vector with a sequence of integers
# sequence increments by 1 from start to end
int1 <- 1:10
int2 <- 32:47


# create a vector with a sequence of numbers
# sequence increments by a specified value
sequence1 <- seq(from = 0, to = 100, by = 2)
sequence2 <- seq(0, 100, 5)
sequence3 <- seq(from = 0, to = 10, by = 0.1)
sequence4 <- seq(10, 0, -1)


# create a vector with a repeated pattern
pattern1 <- rep(v1, times = 3)
pattern2 <- rep(v1, each = 3)
pattern3 <- rep(v1, times = c(2, 4, 3, 5, 1))


# create a vector of the integers 101 to 120
# turn V1 into matrices with various dimensions 
# specifies the number of rows in the matrix
# notice how the matrix fills with values
V1 <- 101:120
matrix(V1,nrow = 2)
matrix(V1,nrow = 4)
matrix(V1,nrow = 5)
matrix(V1,nrow = 10)


# create a vector of the integers 81 to 100
# turn V2 into matrices with various dimensions
# specifies the number of columns in the matrix
# notice how the matrix fills with the values
V2 <- 81:100
matrix(V2,ncol = 10)
matrix(V2,ncol = 5)
matrix(V2,ncol = 4)
matrix(V2,ncol = 2)


# create a matrix and add row and column names
M <- matrix(2*V1, ncol = 4)
colnames(M) <- c("Col A","Col B", "Col C", "Col D")
rownames(M) <- c("Row 1","Row 2","Row 3","Row 4","Row 5")
dimnames(M)
print(M)
M[1,2]
M["Row 1","Col B"]


# create a data frame from several vectors

df1 <- data.frame(v1, v2, v3, v4)
print.data.frame(df1)

X <- 1:20
df2 <- data.frame(X = X_value, 
                  Xsquared = X^2, 
                  Xcubed = X^3)
print.data.frame(df2)

