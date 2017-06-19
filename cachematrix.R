## Put comments here that give an overall description of what your
## functions do

## Function to put a matrix and inverse into cache memory
  
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
	x <<- y
	i <<- NULL
	}
  get <- function() x
  setinv <- function(solve) i <<- solve
  getinv <- function() i
  list (set = set, get = get, setinv = setinv, getinv = getinv)
}
 
  
## Function to solve the inverse of a matrix from cache memory, 
## if the inverse already exists it returns that value
 
cacheSolve <- function(x, ...) {
          ## Return a matrix that is the inverse of 'x'
	i <- x$getinv()
	if(!is.null(i)) {
		message("Getting cached data")
		return(i)
		}
	data <- x$get()
	i <- solve(data, ...)
	x$setinv(i)
	i
    }
