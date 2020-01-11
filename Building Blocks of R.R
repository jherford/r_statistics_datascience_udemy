# Objects are created through functions
## Objects are stored in data structures
# object name <- value

# create vector of numbers (object)
a <- 1:10
print(a) 

# naming objects in R: small letters, a-z, 0123456789, ., _
## examples: longer.name, longer_name, longerName

x <- 10:20
y <- x + 2
z <- y * 3
answer <- z-6/3
print(answer)

answer <- x+2*3-6/3
print(answer)

answer <- ((x+2)*3-6)/3
print(answer)

x <- 10:20

# or you could do it like this

x <- c(10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20)

y <- x + 2
z <- y*3
subtotal <- z - 6
answer <- sub/3
answer

answer <- x+2*3-6/3 

# because R follows the order of operation, whereby 
# any exponents or roots are carried out first, followed by
# divisions, multiplications, additions, then subtractions
# this statement is equvalent to doing the following:
# x + (2*3) - (6/3) or x + 6 - 2 or x + 4 

answer

# to get the initial result, you would need to explicitly define the order in which your operations
# must be carried out

answer <- ((x + 2) * 3 - 6 ) / 3
answer

# data types in R (integers and doubles)
a*2
is.vector(a) 

# six types of vectors: integer, double, character, logical, complex, raw
## vector sequence of elements with same data type
int <- c(5, 6, 7, 8) # stores as default double
int <- c(5L, 6L, 7L, 8L) #ensures the object will store integers instead of the default double
typeof(int)

# list all elements in environment
ls()

# characters and logicals
char <- c("R", "for", "life")
typeof(char)

char2 <- c("The answer to life", "the universe", "and everything", "is", "42")
typeof(char2)

# logical vectors store Boolean data (TRUE & FALSE values)
spock <- c(FALSE, TRUE, F, F, T, FALSE)
typeof(spock)

cards <- c("Blue-Eyes White Dragon", "Exodius", "The Winged Dragon of Ra", "Raigeki", "Slifer the Sky Dragon", 
           "Obelisk the Tormentor", "Black Luster Soldier", "5-Headed Dragon", "Exodia the Forbidden One", "Dragon Master Knight")
typeof(cards)

atk <- c(3000, NA, NA, NA, NA, NA, 4000, 3000, 5000, 1000, 5000)
typeof(atk)

yugioh <- c(cards, atk)
typeof(yugioh)
print(yugioh)

# seems like R has converted all of the double values to characters 
# this happens often in R and is done in strict adherence to rules
# called COERCION rules
# this will be the topic of the next lesson

atk <- c(3000, TRUE, FALSE, T, F, F, 4000, 3000, 5000, 1000, 5000)
typeof(atk)

yugioh <- c(cards, atk)
typeof(yugioh)
print(yugioh)

# Coercion Rules
## if a vector has even one string element, all other elements will be converted to strings
## if a vector has only logical and numeric elements, all logicals will be converted to numbers T=1, F=0
spock <- c(FALSE, TRUE, F, F, 1, 0)
print(spock)

monster <- c(T, T, T, F, T, T, T, T, T, T)
coercion <- c(monster, yugioh)
typeof(coercion)
print(coercion)

coercion.check <- c(atk, monster)
typeof(coercion.check)
print(coercion.check)
# T, T, T, F, T, T, T, T, T, T has become
# 1, 1, 1, 0, 1, 1, 1, 1, 1, 1 

# Functions in R
# User functions to create objects
## object <- function(), x is created from y

round(2, 4271)
mean(1:10)
mean(a)
round(mean(a)) # first execute mean(a), then round the result
# function arguments: what we pass in the parentheses after the function name

lvl <- c(8, 10, 10, 1, 10, 10, 8, 12, 1, 12)
typeof(lvl)
print(lvl)
sum(lvl)
mean(lvl)
median(lvl)
length(lvl)
sd(lvl)
round(sd(lvl))       
print(round(sd(lvl))) # this doesn't look super easy to read -- we will learn a better way to
# do consecutive operations that doesn't involve nesting like this

# Functions and arguments
# function (x, digits = 0) # digits after the decimal
args(round)
round(2.4271, digits = 2)

args(sample)
args(median)
# sample(x, size = , replace = ,prob = )
# median(x, na.rm = FALSE)
# alternatively, you can call HELP!! on it and look at the arguments section

?sample
?median
# or like this 
help(sample)
help(median)

median(lvl, na.rm = TRUE)
median(lvl)
median(atk, na.rm = TRUE)
median(atk)

# NA or missing values make it difficult for R to do operations on objects because R doesn't know their value
# telling R to ignore them when running an operation is one of the easiest ways to sidestep this
# you will learn about other methods of dealing with missing data further on

# ---------Building a function-----------

deck <- c("Duke", "Assassin", "Captain", "Ambassador", "Contessa")
print(deck)

#sample(deck, size = 3)
hand <- sample(deck, size = 3, replace = TRUE)
print(hand)
 
# create function where sample(hand) isn't the same every time
## each time we draw, the sample will be different
## name of function + body + arguments

# objectives: 1. Create a deck every time, 2. Sample 3 cards from it, 3. Allow repitition
draw <- function(){
  deck <- c("Duke", "Assassin", "Captain", "Ambassador", "Contessa")
  hand <- sample(deck, size = 3, replace = TRUE)
  print(hand)
}
draw()

# Create coinflip simulation function with 70/30 fairness
coin <- c("heads", "tails")
flip <- sample(coin, size=100, replace = TRUE, prob= c(0.3, 0.7))

toss <- function(){
  coin <- c("heads", "tails")
  flip <- sample(coin, size=100, replace = TRUE, prob= c(0.3, 0.7)) # Makes coin toss unfair
  return(flip)
}
toss()

# The return() statement is the more conventional way of defining what a function's output should be
# In this case, print() works just as well as return() because this is a simple function
# We will come back to the difference between print() and return() when we revisit writing functions
vec <- c(1,2,3)
vic <- c(11,12,13)

vec + vic
vec - vic
vec * vic
vec / vic

mean(vic)
median(vic)
sd(vic)

sum(vic)
prod(vic)

min(vic)
max(vic)

# Vector Recycling
weight <- c(71,67,83,67)
height <- c(1.75,1.81,1.78,1.82,1.97,2.12,2.75)

# Calculate BMI for all data (weight & height)
## BMI = weight(kg) / height(m^2)
BMI <- weight/height^2

# OUTPUT
# Warning message:
# In weight/height^2 :
# longer object length is not a multiple of shorter object length
BMI
# R still carried out the operation, but it recycled the weight object to match the length
# of the height vector
# For the purposes of this operation, the weight vector looked like this: 71, 67, 83, 67, 71, 67, 83 

# Naming a vector
age <- c(23, 26, 24, 26)

attributes(age)
names(age)
names(age) <- c("George", "John", "Paul", "Ringo")
age
attributes(age)
names(age)
names(age) <- c("George Harrison", "John Lennon", "Paul McCartney", "Ringo Starr")
age

# removing names
names(age) <- NULL
age
attributes(age)

# to recreate cards and atk, if needed: 

cards <- c("Blue-Eyes White Dragon", "Exodius", "The Winged Dragon of Ra", "Raigeki", 
           "Slifer the Sky Dragon", "Obelisk the Tormentor", "Black Luster Soldier", 
           "5-Headed Dragon", "Exodia the Forbidden One", "Dragon Master Knight")
atk <- c(3000, NA, NA, NA, NA, 4000, 3000, 5000, 1000, 5000)

names(atk) <- cards
attributes(atk)
names(atk)
atk

names(atk) <- NULL
atk

# You can also add names when creating an object

atk <- c("Blue-Eyes White Dragon" = 3000, "Exodius" = NA, "The Winged Dragon of Ra" = NA,
         "Raigeki" = NA, "Slifer the Sky Dragon" = NA, "Obelisk the Tormentor" = 4000, 
         "Black Luster Soldier" = 3000, "5-Headed Dragon" = 5000, "Exodia the Forbidden One" = 1000, 
         "Dragon Master Knight" = 5000)
atk

# Slicing and Indexing a Vector 
## some reasons: creating new variable, editing variables, matrices/data frames
n.deck <- c(6,7,8,9,10)
deck <- c("Duke","Assassin","Captain","Ambassador","Contessa")
#vector.name[n]
deck[4] #indexing

#vector.name[-n]
##selects all values but the one indexed
deck[-4]

#select specific values
## vector.name[c(n1,n2,n3)]
deck[c(1,3,5)]

# indexing by name
##named.vector["value name"]
names(n.deck) <- deck
n.deck
n.deck["Contessa"]
n.deck[c("Contessa","Duke","Ambassador")]

# slicing(selecting several consecutive values at once)
##vector.name[n1:nk]
n.deck[3:5]

# select all other elements but a slice
lv <- seq(10, 100, by=10)
lv
lv[-(4:7)]

#slicing with comparison operator
lv[lv > 30]

atk

atk[6]
atk["Obelisk the Tormentor"]
atk[-2]
atk[c(1, 3, 5, 7, 9)]

# alternatively

atk[seq(1, 9, 2)] # the sequence function creates a sequence of numbers 
# starting with the first element you define, and ending with the second, 
# with a step of whatever you pass as a third value 
# the corresponding argument names are intuitive: from = , to = , by = 
atk[-(4:6)]
atk[atk > 2000]   # notice that R also returns the NA elements because it doesn't know their values

# Changing dimensions of an object
## Vector attributes [Names, Dimensions, Class]
a <- seq(10, 120, by = 10)
dim(a) <- c(3, 4)  #  dim(object.to.transform) <- c(n, m) interprets as "You need this 1D vector to bend into a 2D object that has 3 rows and 4 columns"
## n = number of rows, m = number of columns
a # transforms into 3x4 matrix

# Classes, changing dimensions = special case of the object
## no effect on basic type, but structure changes

s <- seq(2, 30, by = 2)
s
dim(s)
dim(s) <- c(3, 5)


# Creating a hypercube that has 1 row, 3 columns, and 5 "slices"
# R creates 3 dimensional object but because the interface is 2-D, when asked to print it, 
# it returns slice-by-slice image 

# Multi-dimensional data structures can be useful for collecting/storing multi-dimensional data
# e.g. water pressure in different locations in a tank
# or for data that is best stored and accessed in a multidimensional array
# e.g. colors & their RBG spectrums
dim(s) <- c(1, 3, 5)
s












# Section 5: Matrices


# 1. Matrices (2D) are a natural extension to vectors (1D arrays)
# 2. They have a fixed number of rows and columns
# 3. Can contain only one basic data type
# matrix(data = , nrow = , ncol = , ...) creates a matrix from a given set of values
mtrx <- matrix(1:12, nrows = 3)
mtrx
mtrx <- matrix(1:12, ncol = 4)
mtrx
mtrx <- matrix(1:12, ncol = 4, byrow = TRUE) # cleaner/better way
mtrx

# using rbind(...) and cbind(...)
usa <- c(1.3, 1.5, 1.2, 1.4, 1.5)
usa
de <- c(0.2, 0.4, 0.7, 0.8, 0.8)
de

ngo <- cbind(usa, de)

# naming rows
rownames(ngo) <- c("2013", "2014", "2015", "2016", "2017")
ngo

# transpose function to change the orientation of data object
# t(x) transposes x
ngo <-t(ngo)
ngo

# add row to existing matrix
ind <- c(2, 2.2, 2.4, 2.5, 2.6)
ngo <- rbind(ngo, ind) 
ngo

# faster code: creating matrix in a single line of code
# dimnames = an attribute argument; can contain a list giving the row and column names
gdp <- matrix(c(47.9, 41.2, 41.9, 54.6, 56.2, 57.5, 1.6, 1.6, 1.7),
              nrow = 3, byrow = TRUE,
              dimnames = list(c("de", "usa", "ind"),  # row names vector
                              c("2014", "2015", "2016")))        # column names vector
gdp


# recreate matrix in 3 different ways
player <- c(rep("dark", 5), rep("light", 5))

# the rep() function repeats a value the stated number of times
# use ?rep for more information

piece <- c("king", "queen", "pawn", "pawn", "knight", "bishop", "king", "rook", "pawn", "pawn")
chess <- c(player, piece)

dim(chess) <- c(10, 2)
colnames(chess) <- c("Player", "Piece")

# or

chess.mat <- matrix(chess, nrow = 10, dimnames = list(NULL, c("Player", "Piece"))) 

# byrow = FALSE is the default value which is what we need here
# because we've defined nrow = 10, R will infer that ncol = 2
# setting the first argument of dimnames to NULL tells R we won't be setting row names

chess.bind <- cbind("Player" = player, "Piece" = piece)
chess.bind

# Do matrices recycle?
## Yes! 
## In the context of matrices, it's repeating values in order to reach the necessary vector length to complete an operation
exmpl <- matrix(1:10, nrow = 4, ncol = 4)
exmpl


# Indexing an element from a matrix
gross <- c(381, 1340, 318, 975, 396, 960, 292, 940,
           302, 934, 290, 897, 262, 879, 249, 797)
hp.mat <- matrix(gross, nrow = 8, byrow = T)
hp.mat   # box office grosses for each Harry Potter movie in US and Worldwide

hp.mat[6, 2]
hp.mat[6, ]
hp.mat[ ,2]



# Slicing a matrix in R
## recap: vector slicing - vector[c(n1, n2, n3)]
hp.snip <- hp.mat[c(1, 3, 7), ]  # returns rows within a matrix
hp.snip  #subsetting matrices with column names and row names

colnames(hp.mat) <- c("USA", "Worldwide")
rownames(hp.mat) <- c("Hallows Part 2", "Sorcerer's Stone", "Hallows Part 1",
                      "Order", "Prince", "Goblet", "Chamber", "Prisoner")
hp.mat

hp.mat["Goblet", ]
hp.mat[ ,"USA"]

chess.t <- t(chess)
turn <- c(3, 5, 2, 2, 7, 4, 6, 5, 2, 1)

chess.t <- rbind(chess.t, "Turn" = turn)
chess <- t(chess.t)

chess[6, 2]
chess[, 1:2]
# or
chess[, -3]
# or
chess[, c("Player", "Piece")]
chess[1:5, ]
chess[, 2, drop = FALSE]
chess[, -2]
chess[2, c(1, 3)]
chess[7, 3] <- 3
chess[7, 3]


# Matrix arithmetric
## element-wise execution
b.office <- c(171.5, 292, 281.6, 460.6, 139.3, 288)
matrix.mat <- matrix(b.office, nrow = 3, byrow = T,
                     dimnames = list(c("The Matrix", "Reloaded", "Revolutions"),
                                     c("US", "Worldwide")))
matrix.mat # in millions

# Convert from millions to billions for calculations
matrix.scaled <- matrix.mat/1000
matrix.scaled

# What's the average margin for each Matrix movie?
avg.margin <- matrix.mat - 121
avg.margin

# Subtracting two matrices, creating the budget matrix
budget <- matrix(c(63, 150, 150), nrow = 3, ncol = 2)
budget
margin <- matrix.mat - budget    # discovering margin
margin
matrix.mat - c(63, 150, 150)  # subtracting vector from a matrix

# Matrix multiplication
v <- matrix(1:6), nrow = 3)
v
matrix.multiplied <- matrix.mat*v
matrix.multiplied

## ***Inner multiplication (%*%) & Outer multiplication (%o%)

# Matrix arithmetic solution
my.mat <- matrix(runif(12), nrow = 3, byrow = TRUE, dimnames = list(c("x", "y", "z"),
                                                                    c("uno", "dos", "tres", "cuatro")))
my.mat <- my.mat*10
s.mat <- my.mat[1:2, ]

my.mat - s.mat

m.mat <- my.mat[ , -4]

my.mat - m.mat

uno <- my.mat[, "uno"]

my.mat - uno

# you can only do matrix operations with two matrices when they are of the same size
# R's recycling rules apply when you try to do an operation with a matrix and a vector

new.mat <- matrix(rnorm(12), nrow = 3, byrow = TRUE)
my.mat * new.mat

#### my.mat ####

#       uno      dos     tres   cuatro
# x 8.706670 4.685807 3.334491 8.639755
# y 9.774909 3.976767 2.970817 5.511657
# z 3.310194 5.695044 4.817533 3.456972

#### new.mat ####

#           [,1]       [,2]       [,3]       [,4]
# [1,] -1.5695645 -0.3105366 -0.4700605 -0.5500765
# [2,]  0.4982614  1.7446698  0.8613690  0.5359502
# [3,] -0.8992205 -1.2731801 -1.1282080 -0.8967721

#### my.mat * new.mat ####

#       uno       dos      tres    cuatro
# x -13.665680 -1.455114 -1.567412 -4.752526        # filled out element-by-element
# y   4.870460  6.938146  2.558970  2.953974
# z  -2.976594 -7.250817 -5.435180 -3.100116

my.mat %*% t(new.mat) 

#       [,1]     [,2]      [,3]
# x -21.44073 20.01609 -25.30498
# y -21.00558 17.32155 -22.14734                    # do not forget to transpose with t()
# z -11.13021 17.58775 -18.76271

# Matrix operations in R
matrix.mat <- matrix(c(171.5, 292, 281.6, 460.6, 139.3, 288), nrow = 3, byrow = T,
                     dimnames = list(c("The Matrix", "Reloaded", "Revolutions"),
                                     c("US", "Worldwide")))
matrix.mat
#colSums(data): returns the sum for each column in your data structure
# what is the sum of matrix movies?
colSums(matrix.mat)
rowSums(matrix.mat)

#colMeans(data): returns the mean for each column in your data structure
colMeans(matrix.mat)

# saving preliminary results & adding to data structure
## need to save outputs as vectors, then bind them with cbind() and rbind()
total <- colSums(matrix.mat)
total
average <- colMeans(matrix.mat)
average

matrix.prelim <- rbind(matrix.mat, average, total)
matrix.prelim # a number informed story


# Create a 5x5 matrix with the rnorm() function, and a 5x5 matrix with runif(). Create each in a single line of code (Hint: nest the operations)  

#For the two matrices, get the following information; for the first four, save the new values as columns and rows in their corresponding matrixes:   
##Column averages,Row averages, Column sums, Row sums, Minimum/maximum value in the matrix  
###Minimum and maximum value for the 3rd column in each matrix  
###The means and standard deviations for each matrix (compare the two values; if interested in the mathematics side of things, recreate the matrices a couple of times, and compare the results; can you explain what is happening?)  
n <- matrix(rnorm(25), nrow = 5, byrow = TRUE)
u <- matrix(runif(25), nrow = 5, byrow = TRUE)

avg.n <- colMeans(n)
avg.u <- colMeans(u)

total.n <- colSums(n)
total.u <- colSums(u)

n.avg.total <- rbind(n, avg.n, total.n)
u.avg.total <- rbind(u, avg.u, total.u)

r.avg.n <- rowMeans(n.avg.total)
r.avg.u <- rowMeans(u.avg.total)

r.total.n <- rowSums(n.avg.total)
r.total.u <- rowSums(u.avg.total)

n.avg.total <- cbind(n.avg.total, r.avg.n, r.total.n)
u.avg.total <- cbind(u.avg.total, r.avg.u, r.total.u)


min(n)
min(u)

max(n)
max(u)

min(n[, 3])
min(u[, 3])

max(n[, 3])
max(u[, 3])

mean(n)
mean(u)

sd(n)
sd(u)

# the data generated with rnorm() will always have an sd close to 1, because this is how the function is defined to work
# rnorm() generates data with default settings mean = 0, standard deviation = 1 

# runif() generates data within the [0, 1] range



# Categorical data
## Levels are the different categories within a categorical variable
## R's factor() function creates a factor variable from a vector
marital.status <- c("Married", "Married", "Single", "Married", "Divorced", 
                    "Widowed", "Divorced")
str(marital.status)
# factor(data) encodes a vector as a factor variable
marital.factor <- factor(marital.status)
marital.factor # the data is converted into integer values from character values
typeof(marital.factor)
str(marital.factor)
# default organization is alphabetical

# manually order factor variables
## factor(data, levels = ) levels = sets the order of encoding
new.factor <- factor(marital.status,
                     levels = c("Single", "Married", "Divorced", "Widowed"))
str(new.factor)

# levels() provides access to the levels attribute of a variable; can use it to rename the levels
levels(new.factor) <- c("s", "m", "d", "w") # order should match levels above
str(new.factor)

new.factor <- factor(marital.status,
                     levels = c("Single", "Married", "Divorced", "Widowed"),
                     labels = c("Sin", "Mar", "Div", "Wid"))
str(new.factor)

# assigning order to variable levels (ordinal)
## factor(data), ordered = TRUE)
ordered.factor <- factor(marital.status, ordered = TRUE,
                         levels = c("Single", "Married", "Divorced", "Widowed"))
ordered.factor

# Creating a factor in R exercise



# Lists in R




# Data Frames




# Manipulating Data




# Visualizing Data




# Exploratory Data Analysis




# Hypothesis Testing




# Linear Regression Analysis














