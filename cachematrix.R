## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# makeCacheMatrix: 


# This function creates a special 
# "matrix" object
# that can cache its inverse.
        

# 
# matrix inverse is explained here -  
# https://www.khanacademy.org/math/precalculus/precalc-matrices/
#         inverting_matrices/v/inverse-of-a-2x2-matrix
        
# the inverse of a matrix is (1/determinate(A)) 'times' the adjugate(A)        
        
# R fills a matrix column-wise so an R matrix is [a,c,b,d]     
# The determinate of a matrix in R is 1/ad-cb
# The adjjugate is [d,-c,-b,a]
# The inverse is 1/ad-cb 'times' [d,-c,-b,a]




makeCacheMatrix <- function(x = matrix()) {
		m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}









## Write a short comment describing this function

# This function computes the inverse of the 
# special "matrix" returned by makeCacheMatrix above.
# If the inverse has already been calculated
# (and the matrix has not changed), 
# then cacheSolve should retrieve
# the inverse from the cache.
# 
# Computing the inverse 
# of a square matrix can be done with the 
# solve function in R.
# For example,if X is a square invertible 
# matrix, then solve(X) returns its inverse.

## Return a matrix that is the inverse of 'x'



cacheSolve <- function(x, ...) {

		m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- inverse(data, ...)
        x$setinverse(m)
        m
        
}
