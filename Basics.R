---------
#     Anıl Ersöz        #
#     30 Haziran 2022   #
#     EdTalks Workshop  #

# ===== ~CONTENTS~  ====== 
#
#  1. Assignments
#  2. Value comparisons
#  3. Special constants
#  4. Vectors
#  5. Factors
#  6. Matrices & Arrays
#  7. Lists
#  8. Data Frames
#  9. Flow control
#  10. R packages
#  11. Read/write files
#  12. R troubleshooting
#


# ================  Introduction to R ================


# Run any part of your code by selecting it an pressing Ctrl+Enter / Cmd+Enter
# Any part of the code starting with the # sign is a comment 


#  -------~~ 1. Assignments --------


# You can assign a value to an object using assign(),  "<-", or "=".
# If you are just starting out, use "<-", there is less chance of confusion with it.


x <- 3         # Assignment
x              # Evaluate the expression and print result

y <- 4         # Assignment
y + 5          # Evaluation, y remains 4

assign("y", 5)
y=6

z <- x + 17*y  # Assignment
z              # Evaluation


rm(z)          # Remove z: deletes the object.
z              # Error!


# You can give the objects you create more helpful names.
# They should start with a letter or a period, and contain 
# letters, numbers, underscores, or periods.

my_dogs_age <- 4
my_dogs_age <- my_dogs_age + 1
my_dogs_age # Happy 5th birthday, dog!

#  -------~~ 2. Value comparisons --------

# Comparisons return the logical constants TRUE or FALSE 

2==2  # Equality
2!=2  # Inequality; ! in R means "not"
x <= y # less than or equal: "<", ">", and ">=" also work


# You can force TRUE and FALSE to behave like numbers
# In that case, TRUE will be 1, and FALSE will be 0
TRUE + TRUE 
5*TRUE
5*FALSE 

# TRUE and FALSE can be abbreviated to T and F (capitalized!)
T==F
T>F
!T

#  ------~~ 3. Special constants -------- 

# NA (not available), NULL, Inf, -Inf, NaN(#not a number)

# NA - missing or undefined data
5 + NA      # When used in an expression, the result is generally NA
is.na(5+NA) # Check if missing?

# NULL - an empty object, e.g. a null/empty list
10 + NULL     # returns an empty object (length zero)
is.null(NULL) # check if NULL

# Inf and -Inf represent positive and negative infinity
# They can be returned by  mathematical operations like division of a number by zero:

5/0
is.finite(5/0) # Check if a number is finite

# NaN (Not a Number) - the result of an operation that cannot be reasonably defined 
0/0
is.nan(0/0)


#  ------~~ 4. Vectors --------  
#Vector is a basic data structure which plays an important role in R programming
v1 <- c(1, 5, 11, 33)       # Numeric vector, length 4
v2 <- c("hello","world")    # Character vector, length 2 (a vector of strings)
v3 <- c(TRUE, TRUE, FALSE)  # Logical vector, same as c(T, T, F)

# Combining different types of elements in one vector will coerce the elements 
# to the least restrictive type:

v4 <- c(v1,v2,v3,"boo") 	# All elements turn into strings

# Other ways to create vectors:
v <- 1:7         # same as c(1,2,3,4,5,6,7)  
v <- rep(0, 77)  # repeat zero 77 times: v is a vector of 77 zeroes
v <- rep(1:3, times=2) # Repeat 1,2,3 twice  
v <- rep(1:10, each=2) # Repeat each element twice  
v <- seq(10,20,2) # sequence: numbers between 10 and 20, in jumps of 2  

length(v)        # check the length of the vector

v1 <- 1:5         # 1,2,3,4,5
v2 <- rep(1,5)    # 1,1,1,1,1 

# Element-wise operations:
v1 + v2      # Element-wise addition
v1 + 1       # Add 1 to each element
v1 * 2       # Multiply each element by 2
v1 + c(1,2)  # Problem: c(1,2) is a vector of a different length
v1 + c(1,2,3,4,5)
# Mathematical operations:
sum(v1)      # The sum of all elements
mean(v1)     # The average of all elements
sd(v1)       # The standard deviation
min(v1)      # the minimum value
max(v1)      # the maximum value
cor(v1,v1*5) # Correlation between v1 and v1*5 

# Logical operations:
v1 > 2       # Each element is compared to 2, returns logical vector
v1==v2       # Are corresponding elements equivalent, returns logical vector.
v1!=v2       # Are corresponding elements *not* equivalent? Same as !(v1==v2)

(v1>2) | (v2>0)   # | is the logical operator OR, returns a vector.
(v1>2) & (v2>0)   # & is the logical operator AND, returns a vector.
(v1>2) || (v2>0)  # || is the logical operator OR, returns a single value
(v1>2) && (v2>0)  # && is the logical operator AND, ditto

# Vector elements
v1[3]            # third element of v1
v1[2:4]           # elements 2, 3, 4 of v1
v1[c(1,3)]        # elements 1 and 3 - note that your indexes are a vector
v1[c(T,T,F,F,F)]  # elements 1 and 2 - only returns the ones that are TRUE
v1[v1>3]          # v1>3 is a logical vector TRUE for elements >3
v1[-3]            # negative number: will return all elements *except* the third

# NOTE: If you are used to languages indexing from 0, R will surprise you by indexing from 1.

# To replace elements in a vector, assign them a new value
v1[5] <- 10
v1

# To add more elements to a vector, simply assign them values.
v1[6:10] <- 6:10

# We can even directly assign the vector a length:
length(v1) <- 15 # the last 5 elements are added as missing data: NA


#  ------~~ 5. Factors --------

# Factors are used to store categorical data.

eye_col_v <- c("brown", "green", "brown", "blue", "blue", "blue")         #vector
eye_col_f <- factor(c("brown", "green", "brown", "blue", "blue", "blue")) #factor
eye_col_v
eye_col_f

# R will identify the different levels of the factor - e.g. all distinct values. 
# The data is stored internally as integers - each number corresponding to a factor level.

levels(eye_col_f)  # The levels (distinct values) of the factor (categorical variable)

as.numeric(eye_col_f)  # The factor as numeric values: 1 is  blue, 2 is brown, 3 is green
as.numeric(eye_col_v)  # The character vector, however, can not be coerced to numeric

as.character(eye_col_f)  
as.factor(eye_col_v) 

# Sometimes, our categorical data can be ordered.
# For example, we may have a survey question asking people
# how they feel about puppies:

puppy_v <- c("love", "love", "hate", "like", "dislike", "love")
liking_levels <- c("love", "like","neutral", "dislike", "hate")

puppy_f <- factor(puppy_v, levels=liking_levels, ordered=TRUE)
puppy_f

# In the code above, we did two things: mentioned a possible level
# that was not in our data (neutral) and specified order


#  ------~~ 6. Matrices & Arrays --------  

# A matrix is a vector with dimensions:
m <- rep(1, 20)   # A vector of 20 elements, all 1
dim(m) <- c(5,4)  # Dimensions set to 5 & 4, so m is now a 5x4 matrix

# Create a matrix using matrix():
m <- matrix(data=1, nrow=5, ncol=4)  # same matrix as above, 5x4, full of 1s
#LET'S USE HELP FUNCTION OF RSTUDIO
?matrix
m <- matrix(1,5,4) 			             # same matrix as above
dim(m)                               # What are the dimensions of m?


# Create a matrix by combining vectors:
m <- cbind(1:5, 5:1, 5:9)  # Bind 3 vectors as columns, 5x3 matrix
m
m <- rbind(1:5, 5:1, 5:9)  # Bind 3 vectors as rows, 3x5 matrix
m
m <- matrix(1:10,10,10)
m

# Select matrix elements: 
m[2,3]  # Matrix m, row 2, column 3 - a single cell
m[2,]   # The whole second row of m as a vector
m[,2]   # The whole second column of m as a vector
m[1:2,4:6] # submatrix: rows 1 and 2, columns 4, 5 and 6
m[-1,]     # all rows *except* the first one

m[1,]==m[,1]  # Are elements in row 1 equivalent to corresponding elements from column 1? 
m>3           # A logical matrix: TRUE for m elements >3, FALSE otherwise
m[m>3]        # Selects only TRUE elements - that is ones greater than 3


# Arrays: more than 2 dimensions
# Created with the array() function:

a <- array(data=1:18,dim=c(3,3,2)) # 3d with dimensions 3x3x2
a  <- array(1:18,c(3,3,2))          # the same array


#  ------~~ 7. Lists --------  

# Lists are collections of objects (e.g. of strings, vectors, matrices, other lists, etc.)

l1 <- list(boo=v1,foo=v2,moo=v3,zoo="Animals!")  # A list with four components
l2 <- list(v1,v2,v3,"Animals!")

l3 <- list()
l4 <- NULL

l1["boo"]      # Access boo: this returns a list.
l1[["boo"]]    # Access boo: this returns the numeric vector
l1[[1]]        # Returns the first component of the list, equivalent to above.
l1$boo         # Named elements can be accessed using the $ operator - equivalent to [[]]

# How can I tell if something is a list or not?
is.list(v1) # is this a list?
is.list(l1) # is this a list?
class(l1)   # what kind of object is this?
class(v1)
class(v3)

# Add more elements to a list:
l3[[1]] <- 11 # add an element to the empty list l3
l3
l4[[3]] <- c(22, 23) # add a vector as element 3 in the empty list l4. 
l4
# Since we added element 3, elements 1 & 2 will be generated and empty (NULL)
l4[[1]]
l4[[3]]

l1[[5]] <- "More elements!" # The list l1 had 4 elements, we're adding a 5th here.
l1[[8]] <- 1:11 # We added an 8th element, but not 6th or 7th. Those will be created empty (NULL)
l1$Something <- "A thing"  # Adds a ninth element - "A thing", named "Something"

#  ------~~ 8. Data Frames --------  

# The data frame is a special kind of list used for storing our dataset tables.
# Think of rows as cases, columns as variables. Each column is a vector or factor.

# Creating a dataframe:

dfr1 <- data.frame( ID=1:4,
                    FirstName=c("John","Jim","Jane","Jill"),
                    Female=c(F,F,T,T), 
                    Age=c(22,33,44,55) )

View(dfr1)

dfr1$FirstName   # Access the second column of dfr1. 
# Notice that R thinks this is a categorical variable 
# and so it's treating it like a factor, not a character vector.

# Let's get rid of the factor by telling R to treat FirstName as a vector:
dfr1$FirstName <- as.vector(dfr1$FirstName)

# Alternatively, you can tell R you don't like factors from the start using stringsAsFactors=FALSE
dfr2 <- data.frame(FirstName=c("John","Jim","Jane","Jill"), stringsAsFactors=FALSE)
dfr2$FirstName   # Success: not a factor.

# Access elements of the data frame
dfr1[1,]   # First row, all columns
dfr1[,1]   # First column, all rows
dfr1$Age   # Age column, all rows
dfr1[1:2,3:4] # Rows 1 and 2, columns 3 and 4 - the gender and age of John & Jim
dfr1[c(1,3),] # Rows 1 and 3, all columns

# Find the names of everyone over the age of 30 in the data
dfr1[dfr1$Age>30,2]

# Find the average age of all females in the data:
mean ( dfr1[dfr1$Female==TRUE,4] )


#  ------~~ 9. Flow Control --------

# if (condition) expr1 else expr2
x <- 5
y <- 10
if (x==0) y <- 0 else y <- y/x  
y

# To do several things if x equals 0, we can enclose the block of code
# that includes all of those things in {} like this:
if(x>0) {
  x <- 10
  y <- 42
}

# for (variable in sequence) expr
ASum <- 0
AProd <- 1
for (i in 1:x) {
  ASum <- ASum + i
  AProd <- AProd * i
}

ASum  # equivalent to sum(1:x)
AProd # equivalent to prod(1:x)

# while (condition) expr
while (x > 0) {
  print(x)
  x <- x-1 }

# repeat expr, use break to exit the loop
repeat { 
  print(x)
  x <- x+1
  if (x>10) break }


#  ------~~ 10. R packages --------

# Much of the functionality of R is contained in packages.
# Packages group together related code and data that we can use.
# Anyone can create a package (I will show you how later on)
# "Official" versions of packages are stored in the CRAN repository.
# You can install those directly as long as you know the package name.

# For example: 
install.packages("igraph") 

# You can start using any package by loading it first:
library("igraph")          

# That allows you to access functions and data from that package.
# For example, graph.ring() is a function from the 'igraph' package.
# It creates a ring graph with a certain number of nodes (here 7)
g <- graph.ring(7)
plot(g)

# To get help on a package, try this:
package?igraph

# When you are done using a package, it is a good idea to let R know
# Detaching a package:
detach(package:igraph)    


#  ------~~ 11. Read/write files --------

# Set the working folder where you want to read/write files:
# Note the forward slashes (as opposed to backslash in Windows paths)
setwd("C:/Workshops/R CODE")

dfr1 <- data.frame( ID=1:4,
                    FirstName=c("John","Jim","Jane","Jill"),
                    Female=c(F,F,T,T), 
                    Age=c(22,33,44,55) )

# Save to a CSV file:
write.csv(dfr1, "my_data_frame.csv", row.names=F)

# Read the CSV file back:
dfr2 <- read.csv("my_data_frame.csv")
dfr2


#  ------~~ 12. R troubleshooting --------

# While I generate many (and often very creative) errors in R, there are three
# simple things that will most often go wrong for me. Those include: 

# 1) Capitalization. R is case sensitive - a graph vertex named "Jack" is not the same
# as one named "jack". The function "rowSums" won't work as "rowsums" or "RowSums".
#
# 2) Object class. While many functions are willing to take anything you throw
# at them, some will still surprisingly require character vector or a factor instead of
# a numeric vector, or a matrix instead of a data frame. Functions will also occasionally
# return results in an unexpected format.
#
# 3) Package namespaces. Occasionally problems will arise when different packages
# contain functions with the same name. R may warn you about this by saying something
# like "The following object(s) are masked from 'package:igraph'" as you load a package.
# One way to deal with this is to call functions from a package explicitly using '::'.
# For instance, if function 'blah' is present in packages A and B, you can call
# A::blah and B::blah. In other cases the problem is more complicated, and you may
# have to load packages in certain order, or not use them together at all. 

library(igraph)          # load a package
detach(package:igraph)   # detach a package

# For more advanced troubleshooting, check out try(), tryCatch(), and debug().
?tryCatch