# Below are two functions that are used to create a special object
# that stores an invertible matrix and cache's its inverse.

# The first function, makeCacheMatrix creates a special "matrix", which is really a
# list containing a function to

# 1. Set the value of the matrix
# 2. Get the value of the matrix
# 3. Set the value of the inverse
# 4. Get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) i <<- solve
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}

# This function tests the value of the stored inverse and if it is NOT NULL
# returns the cached value of the previously calculated matrix inverse.
# If the stored inverse is the initial NULL value, it will use the solve()
# function calculate the inverse and the set function from above to cache it,
# then display the inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
