## These functions calculate the inverse matrix and save the result cached

## The function creates a list containing the functions
## 1. To set matrix
## 2. To get original matrix
## 3. To set inverse matrix
## 4. To get inverse matrix

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set=set,get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## While the inverse matrix is saved into cache, the function gets it
## otherwise it finds inverse matrix and store it into cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}
