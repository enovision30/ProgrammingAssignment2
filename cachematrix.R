## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

#Assignment 2 for R

#function 1 :this function creates a special object that can cache the inverse of a matrix
#function 1 really creates a list of 4 functions(set,get,setinv,getinv)

makeCacheMatrix <- function (x=matrix()) {
  inv <- NULL
  set <- function(y) { #set value of the matrix
    x <<- y
    inv <<- NULL
  }
  get <- function() x #get value of the matrix
  setinv <- function(inverse) inv <<- inverse #set value of the inverse
  getinv <- function() inv #get value of the inverse
  list(set = set, get = get, #list of the 4 functions returned which contains the 4 subfunctions
       setinv = setinv,
       getinv = getinv)
}

#second function calculates the inverse of the matrix created by the first function
#second function firstly checks if the inverse has already been calculated.This is done with get$ and if so skips the calculation
#secondly if not so it calculates the inverse and sets the value of the inverse in the cache via the set inv function


cacheSolve <- function(x, ...) { 
  inv <- x$getinv() #checks if x$getinv value is not null
  if(!is.null(inv)) {
    message("getting cached data") #if not null print this message
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...) #run the function solve to find the inverse 
  x$setinv(inv) 
  inv
}

#example a 3X3 matrix with determinant different than zero 

a<-matrix(c(1,4,5,3,5,6,7,9,2), 3)
b <- makeCacheMatrix(a)

#run the cacheSolve function using object a

cacheSolve(b)
#rerun in order to test that the message "getting cash data" will appear

cacheSolve(b)
