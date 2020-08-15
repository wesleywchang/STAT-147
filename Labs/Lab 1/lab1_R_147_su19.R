# Statistics 147 Lab #1 Summer 2020
# Wesley Chang
#

x = 21.56		# Assigns a value to the variable x
x			# Prints the value of x

class(x)		# Prints the class of x
is.integer(x) 	# is x an integer?

x1 <- as.integer(x)
x1 	`		# Print the value of x1
class(x1)		# Print the class of x1


my_data = c(4,6,2,7,9,5)	# read in the data
my_data				# Print the data
class(my_data)			# Print the class name of the data

my_data_sorted = sort(my_data) # Create new variable containing the sorted data
my_data_sorted # Print the sorted data

my_colors = c("brown", "red", "yellow", "blue", "orange", "green") # enter the data
my_colors # Print the data
class(my_colors) # Print the class name of the data


combined1 = c(my_data,my_colors) # Combine the two data sets
combined1 # Print the new data set


x = c( 1,2,3,4,5) # enter values of x
x # print x
y = c(2,4,6,8,10) # enter values of y
y # print values of y


x1 = 3.5*x # create a new variable x1 = 3.5x
x1 # print x1

# Create new variable sum1 = x + y
sum1 = x + y
sum1 # print sum1


# Create new variable diff1 = x - y
diff1 = x - y
diff1 # print diff1


# Create new variable prod1 = x*y
prod1 = x*y
prod1 # print prod1


# Create new variable div1 = x/y
div1 = x/y
div1 # print div1


# Create a new variable s = 2x+ 3sqrt(y)
s = 2*x + 3*sqrt(y)			# fill in your code
s # print the values of s


cartest = read.table(file = "c:/Users/wesle/iCloudDrive/Summer 2020 (UCR)/STAT 147 (Session A)/Labs/Lab 1/cartest1.dat", header = TRUE)
cartest
attach(cartest)
names(cartest)

cartest$Car
cartest$BrandA
cartest$BrandB

sum2 = BrandA + BrandB
sum2



setwd("c:/Users/wesle/iCloudDrive/Summer 2020 (UCR)/STAT 147 (Session A)/Labs/Lab 1")
dir()

gas_data = read.csv("gas1.csv", header = TRUE)
gas_data 

names(gas_data)
attach(gas_data)

premium
regular









