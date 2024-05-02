## Function to create a special matrix object that caches its inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL # Initialize the cache for the inverse
  set <- function(y) {
    x <<- y
    inv <<- NULL # Reset the cache when the matrix changes
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse 
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Function to compute the inverse, using the cache if available
cacheSolve <- function(x, ...) {
  inv <- x$getinverse() # Get the cached inverse 
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv) 
  }
  mat <- x$get() 
  inv <- solve(mat, ...) # Compute the inverse
  x$setinverse(inv)  # Store the inverse in the cache
  inv
}

## Demonstration ##

# Create a sample matrix
my_matrix <- matrix(c(1, 2, 3, 4), nrow = 2, byrow = TRUE)

# Create the special matrix object
special_matrix <- makeCacheMatrix(my_matrix)

# Calculate the inverse (first time)
inv1 <- cacheSolve(special_matrix) 

# Calculate the inverse again (using cached result)
inv2 <- cacheSolve(special_matrix) 

# Print to verify the results are the same
print(inv1)
print(inv2)
