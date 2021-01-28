# EBIO338/358: Analysis and Visualization of Biological Data
# Class 2: R Essentials

# Type in your own versions of the code examples yourself; 
# passively following along won't build your R muscles.

# Basic math:
3 + 2
4 * 5
5 - 3


# Spaces don't affect functionality (in most contexts).
4/5
4 / 5
4           /              5


# If you haven't completed a line, R will ask you to finish it.
5 + 6 + 89 - 4 +
  # finish the command on the next line, or use ESC to exit
  # text or lines preceded by '#' are not executed
  
  lines not preceded by '#' are executed  #oops 


# Use up and down arrows to move around in your history.


# Create sequences of numbers.
4:8
12:1

# seq (from, to, by)
seq(1, 10, 2)           
seq(5, 4, -0.1)


# but
seq(5, 4, 0.1)

# get help to understand how the function works
?seq

# note the following two produce the same sequence

seq(1, 10, 2)   
seq(from = 1, 
    to = 10, 
    by = 2)

# adding the additional argument text can help make your code more easily 
# understood; it is a good habit to get into for all but the simplest code.


# Generate repeats.

rep(5, 3)

rep(1:4, 8)
rep(1:4, each = 2)
rep(1:4, each = 2, times = 3)

# if you specify the terms, the order doesn't matter
rep(1:4, times = 3, each = 2)

# repeat elements a different number of times
rep(1:4, 1:4)
# lengths must be equal
rep(1:4, 1:5)



# R displays big and small #s using normal scientific notation.

456000000000000000
5 / 298657635


# Note: some basic operators mean different things inside and outside formulae
# e.g., * (multiply / main effects + interaction); : (sequence, interaction)


## Artithmetic functions 
sqrt(9)
4 ^ 3
abs(-945.2368)
log(8)

# you can always use ? to get help
?log

# or get an example
example(log)
example(seq)


# Common arithmetic functions:
# abs(x)	                 absolute value
# sqrt(x)                  square root
# factorial (x)            x!
# ceiling(x)	             ceiling(3.475) is 4
# floor(x)	               floor(3.475) is 3
# trunc(x)	               trunc(5.99) is 5
# round(x, digits = n)     round(3.475, digits  2) is 3.48
# signif(x, digits = n)	   signif(3.475, digits = 2) is 3.5
# cos(x), sin(x), tan(x)   basic trig
# log(x)	                 natural logarithm
# log10(x)	               common logarithm
# exp(x)	                 e^x


#  Order of operations matters; use parentheses

3 / 5 + 7
7 + 3 / 5
(7 + 3) / 5
sqrt(144) / 3 + 1
sqrt(144) / (3 + 1)


# TO DO: Compute the difference between 2021 and the year you started at Rice. 
# Divide this by the difference between 2021 and the year you were born.
# Multiply this with 100 to get the percent of your life you have spent at Rice.


# R resolves ambiguities in the following order:
# Function calls & grouping expressions   (), {}
# Index and lookup operators              [ ]
# Arithmetic                              * , /, + , - 
# Comparison                              > , ≤
# Formulas                                P ~ I - E          
# Assignment                              x <- 3 + 4
# Help                                    ?mean


## Logical operators

# Essentially, you are asking R logical questions requiring TRUE / FALSE responses

4 < 5
23 ^ 0.5 < 34 / 56
4 == 8 / 2
4 != 4

# careful!
4 = 8 / 2


# Operator	 Description
# <	         less than
# <=	       less than or equal to
# >	         greater than
# >=	       greater than or equal to
# ==	       exactly equal to
# !=	       not equal to
# !x	       not x
# x | y	     x OR y
# x & y	     x AND y
# isTRUE(x)  test if X is TRUE


## Assigning variables 

# Use '<-' to assign anything you want to a variable.

x <- 5
x

z <- "we the people"
z

# mind the space!
y <- 67
y
y < -7
y

# this works, but avoid it:
x = 6
x

# you can then use the variable to represent that item(s) in a formula
x * 8
y <- sqrt(4)

x * y
x == y


# Important things to note regarding variables:
# case sensitive (g != G)
# should not begin with numbers or symbols (5x, %cover)
# should not contain spaces (fun_games not fun games)
# make as short and intuitive as possible

# Now repeat the TO DO in line 142 using several steps in between giving any name you want to the variable starting with a letter



# Combine 'c()' values into a vector object

x <- c(5, 7, 8, 10)
x
# as before, the variable represets its contents in a formula
x * 2



# We can use logical operators on vectors just like values.
x <- c(1:10)
x[(x>8) | (x<5)]
x > 8
x < 5
x > 8 | x < 5

# doesn't have to be numbers

cities <- c("Houston", "New York", "Atlanta", "Seattle")
cities
cities == "Los Angeles"
"Houston" > "New York"
"Seattle" > "Atlanta"

#oops
cities * 2
cities <- c(Houston, New York, Atlanta, Seattle)

rep(1:4, c(2, 1, 4, 9))
#but
rep(1:4, c(2, 1, 4, 9, 1))

rep(cities, 5)
rep(cities, c(1,3,6,0))



## Basic statistical functions 

x <- c (4, 5, 7, 8, 9, 10)
mean(x)
mean(2 * x)
2 * mean(x)
sum(x)
range(x)
sd(x)
max(x)



# Simple statistical functions
# mean (x)               mean of object x
# mean(x, trim = 0.5)    trimmed mean 
# sd(x)	                 standard deviation of object x
# var (x)                variance of object x
# median(x)	             median of object x
# quantile(x, probs)	   quantiles where x is the numeric vector whose quantiles are desired and probs is a numeric vector with probabilities in [0,1]. e.g., 30th and 84th percentiles of x: 
# y <- quantile(x, c(0.3, 0.84))
# range(x)	             range of object x
# sum(x), max(x), min(x)  ... etc



## VECTORS AND VECTOR FUNCTIONS

# R has many data types: scalars, vectors, matrices, data frames, and lists. A vector is a collection of values of the same type. There are multiple types:

# A numeric vector:
a <- c(67, 52, -7.4, 0.006, -2, 4)
a
a <- c(67,52,-7.4,0.006,-2,4)

(a <- c(67, 52, -7.4, 0.006, -2, 4))


# A character vector:
states <- c("Texas", "California", "Georgia", "Michigan", 
            "Florida", "Iowa")
states

# Logical vector:
c <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE) 

# There are others, too (e.g., raw, integer).

# We can ask questions about vectors:
class(a)
is.class(states)


# And use them as input in functions:

length(a)
mean(a)
max(a)
quantile(a)


# And extract elements using brackets [ ]:

a[3]
a
states[2:4]

g <- c(2:20)
g
sample <- c(1, 5, 8)
g[sample]



# And drop values using brackets [ ]:

cities
cities[-2]
cities[-4]
cities[-length(cities)]



## Matrices & dataframes 

# Matrices: a matrix is a two dimensional collection of numbers

# This code generates 5 x 4 numeric matrix:

y <- matrix(1:20, nrow = 5, ncol = 4)
y

# another example
cells <- c(5, 65, -4, 2000)
cells
mymatrix <- matrix(cells, nrow = 2, ncol = 2)
mymatrix

#name the rows, columns
rnames <- c("R1", "R2")
cnames <- c("C1", "C2") 
mymatrix <- matrix(cells, nrow = 2, ncol = 2, byrow = TRUE,
                   dimnames = list(rnames, cnames))
mymatrix



# We can identify elements, rows, columns, and subsets as with vectors, 
# but now we need to give R two pieces of information [row, column], rather than just one.

y
y[1, 2]       # element
y[2, ]        # row
y[ ,4]        # column
y[1:3, 3:4]   # subset


# We can apply logical operators to matrices, just like we did to vectors:

y == 13
y != 13
y > 18
#careful!
y = 13
y



# Dataframes: a dataframe is a matrix with vectors of different types

cities
population <-  c(2.1, 8.2, 0.4, 6.1)
area <- c(637, 468, 134, 142)
density <- (population/area)*1000000
mydataframe <- data.frame(cities, population, area, density)
mydataframe
# add column names
names(mydataframe) <- c("City","people","sq_miles", "pop_density")
mydataframe

mydataframe <- data.frame(City=cities, people=population, sq_miles=area, pop_density=density)


# We can identify elements, rows, columns, etc in dataframes just like in matrices and vectors

mydataframe [1,2]        # element
mydataframe [2, ]        # row
mydataframe [ ,4]        # column
mydataframe [1:3, 3:4]   # subset



## Getting help 

# Option 1:"?function"

?lm
?plot
# R will tell you if you look for something that doesn't exist:
?gr



# Option 2:"help()"

help(lm)
?help



# option 3: "help.search("keyword")

help.search("mle")
# the "??" shortcut gives you the same thing:
??"mle"



############ GOOD HOUSEKEEPING ############

# List the objects we created:
ls()


# Remove objects
rm(x)
ls()


# Remove all objects
rm(list = ls(all = TRUE))
ls()


# Simple controls
options(width = 80)
?options



# Set the working directory (If you want to read files from a specific location or write files to a specific location you will need to set working directory, or for each file specify the path where you want it to be read from or written to)
setwd ("/Users/evanfricke/Documents")
# must use forward slash / or double backslash \\ in R! (Windows format single backslash will not work)


# Check current working directory
getwd() 


# Quit
quit()


# Save the r code file, not the workspace
