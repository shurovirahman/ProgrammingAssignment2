## The "makeCacheMatrix" has the following arguments
## Arguments:
##   x: is a square matrix
## The goal of this function is to create a matrix 
## which can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

## The "cacheSolve" function has the following arguments
## Arguments:
##  x: is a square matrix
## The goal of this function is to first check 
## whether the inverse is already been calculated 
## in the makeCacheMatrix. If not, then this function
## will compute the inverse of the x matrix
cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("Getting an inverse matrix")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
