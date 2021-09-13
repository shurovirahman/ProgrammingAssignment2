### Introduction

The second assignment problem focuses on an important practical 
situation while dealing with matrix. For example, while working 
on a regression problem, it is cruicial to check the inverse of 
the design matrix. Often writing a long function, repeats the 
computation of inverting a matrix. When the dimension of the 
matrix increases, the computation time also increases if we repeatedly 
compute the inverse of the same matrix. 

To resolve this issue, two new functions have been written. 

### Caching the Inverse of a Matrix
The first function `makeCacheMatrix` creates a special matrix object 
which can cache its inverse


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


The second function `cacheSolve` works on the matrix object 
from the `makeCacheMatrix` function. The advantage of this function 
is that if the matrix has not changed, it will skip the computation 
of the inverse matrix. Otherwise, it will compute the inverse of matrix x.


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


