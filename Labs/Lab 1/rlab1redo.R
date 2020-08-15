# Statistics 147 Lab #1 Summer 2020
# Wesley Chang

setwd("/Users/wes_chang/Library/Mobile Documents/com~apple~CloudDocs/Summer 2020 (UCR)/STAT 147 (Session A)/Labs/Lab 1")

### Section 3.1, Basic Data Types

## Example 3.1
# Declare an integer x
# classify
# force it to be an integer (truncate after decimal point)

x = 21.56
x

class(x)
is.integer(x)

x1 <- as.integer(x)
x1
class(x1)

## Example 3.2


# create a data set my_data, then classify
my_data = c(4,6,2,7,9,5)
my_data
class(my_data)

# sort the data numerically
my_data_sorted = sort(my_data)
my_data_sorted

## Example 3.3

# make the 2nd value in my_data equal to "3"
my_data[2] = 3
my_data

## Example 3.4

# classify a character type data set
my_colors = c("brown", "red", "yellow", "blue", "orange", "green")
my_colors
class(my_colors)


## Example 3.5

# combine vectors my_data and my_colors, using c() function
combined1 = c(my_data,my_colors)
combined1



### Section 3.2: Arithmetic Operations

## Example 3.6

#     Create the following data set
#       x = 1,2,3,4,5
#       y = 2,4,6,8,10
x = c(1,2,3,4,5)
x
y = c(2,4,6,8,10)
y

# create variable x1 = 3.5x
x1 = 3.5*x
x1

# create variable sum1 = x + y
sum1 = x + y
sum1

# create variable diff1 = x - y
diff1 = x - y
diff1

# create variable prod1 = x*y
prod1 = x * y
prod1

# create variable div1 = x/y
div1 = x/y
div1

# create variable s = 2x + 3*sqrt(y)
s = 2*x + 3*sqrt(y)
s


### Section 3.3 Reading Data from an External File
# read.table(file="filename",header=TRUE,sep="")
# set header to TRUE when the first line of data contions the variable names
# sep option sets the delimiter for separation, otherwise the default is blank space

# skip option
# read.table(file="filename",header=TRUE/FALSE, skip = integer_value)
# if your file has more than one line of headers or lines that should be skipped, 
# use this option
#

## Example 3.7
cartest = read.table(file = "cartest1.dat", header = TRUE)
cartest

# use attach() function to make columns accessible individually
attach(cartest)
# use the names() function to obtain the column names
names(cartest)

# cartest is an r data frame 
#   A data frame is a table or a two-dimensional array-like structure in which each 
#   column contains values of one variable and each row contains one set of values 
#   from each column.

#                 Car BrandA BrandB
#             1   1    125    133
#             2   2     64     65
#             3   3     94    103
#             4   4     38     37
#             5   5     90    102
#             6   6    106    115

# You can access the vectors (Car, BrandA, BrandB)
#       cartest$Car
#       cartest$BrandA
#       cartest$BrandB

# We can also use the attach() function to make each column of the data frame
# into its own vector variable
#     we already did this above when we ran
     attach(cartest)


## Example 3.8

# Calculate sum of Brand A and Brand B
sum2 = BrandA + BrandB
sum2


## Example 3.9

# Use read.csv to read in csv files
gas_data = read.csv("gas1.csv", header = TRUE)
gas_data

# use names function to see variable names
names(gas_data)

# use the attach function to separate columns of data
attach(gas_data)

# print the data by column (vectors)
premium
regular
















