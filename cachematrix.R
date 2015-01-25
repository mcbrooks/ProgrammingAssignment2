## Put comments here that give an overall description of what your
## functions do

# These functions offer the ability to create a special matrix that can
# cache it's inverse with makeCacheMatrix(), and the ability to generate the 
# inverse of a cached matrix and store the result with cacheSolve()

## Write a short comment describing this function

# This function creates a special "matrix", a list containing functions to
# retrieve the matrix, get the inverse of the matrix and set the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

# This function checks to see if the inverse of the matrix has already been solved,
# and returns that if it exists, if not, it solves the matrix, and saves 
# and returns the value
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }    
    inv <- solve(x$get())
    x$setinverse(inv)
    inv
}
