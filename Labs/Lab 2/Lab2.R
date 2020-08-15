# Statistics 147
# Lab #2 Summer 2020
# Wesley Chang
#


setwd("c:/Users/wesle/iCloudDrive/Summer 2020 (UCR)/STAT 147 (Session A)/Labs/Lab 2")

eyecolor1 <- c("blue", "green", "brown", "yellow", "yellow", "green", "brown",
"brown", "brown", "yellow", "brown", "blue", "brown", "green", "yellow")
# Print the data as a check
eyecolor1

# Create frequency table
eyecolor_table1 <- table(eyecolor1)
# Print table
eyecolor_table1

# Create labels for x axis
colors1 <- c("blue", "brown", "green", "yellow")
# Print the labels
colors1

# Create bar chart: xlab = x-axis label, ylab = y-axis label, main = main title,
# col = color of the bars
barplot(eyecolor_table1,xlab = "Color",ylab = "Frequency",main = "Bar Chart of Eye Color",
col=colors1)
# Note, the above, single line code is a pain to read and debug.
# Try writing each parameter on it?s own line
barplot(eyecolor_table1,
xlab = "Color",
ylab = "Frequency",
main = "Bar Chart of Eye Color",
col=colors1)


# Create pie chart: main = main title for chart, col = color of the slices,
# labels = labels for the slices
pie(eyecolor_table1,
main = "Pie Chart for Eye Color Data",
col = colors1,
labels = colors1)

# Create vector of slice frequencies
slice1 <- c(2,6,3,4)
slice1 # print to check
# Create new label by pasting together the colors and slice frequencies
labels1 = paste(colors1,slice1)
labels1 # print to check
# Create pie chart
pie(eyecolor_table1,
main = "Pie Chart for Eye Color Data",
col = colors1,
labels = labels1)


ages1_data <- read.table("ages.dat", header= TRUE)
# Print the data
ages1_data
# Confirm that the variables Father and Mother have not yet been created.
# Try printing them and see that they don?t yet exist
Father
Mother
# Use the names() function to obtain column names
names(ages1_data)
# Use the attach() function to make columns individually accessIble
attach(ages1_data)
# Show that the columns of data are now attached as separate vectors
Father
Mother


# Create histogram for variable Mother using the hist() command
hist(Mother)



# Create colors for the bars
colors1m <- c("brown","green","blue","yellow","red")
# Print the colors
colors1m
# Create interval breaks
brks1 <- c(15,20,25,30,35)
# Print the breaks
brks1
# Create histogram
# main = main title, breaks = interval breaks, col = colors of the bars# c
# To include the number of counts, you can just set labels=TRUE.
# xlim = range of the horizontal axis
# ylim = range for the vertical axis
# To see more, type ??hist? in the R console
hist(Mother,
main= "Age of the Mother",
breaks = brks1,
col = colors1m,
labels = TRUE,
xlim = c(15,35),
ylim = c(0,10))


# Use plot(x,y,xlab = x-axis label, ylab = y-axis label,main = title,pch = symbol_number)
plot(Father, Mother,
xlab = "Father",
ylab = "Mother",
main = "Ages of Father vs Mother",
pch = 8)



cartest = read.table(file = "cartest1.dat", header = TRUE)
# Print the data
cartest
# Make column names accessible using the attach() function
attach(cartest)
# Use names(0 function to obtain column names
names (cartest)
# Print to check
Car
BrandA
BrandB

# plot (variable, type = "o" = both point and line, ylab = label of y-axis,
# xlab = label of x-axis, pch = type of symbol)
plot(BrandA,
type = "b",
ylab = "Brand A Mileage",
xlab = "Car",
pch = 8)

# Plot the cars data with type = o to get both the points and the connecting
# line and an overlay
plot(BrandA,
type="o",
col="blue",
main = "Mileages of Tires Brands",
xlab = "Car",
ylim = c(30,140))
# graph line with type = "o" to get overlay, pch = 13 = circle cross symbol
# and lty = 2 = dashed line
lines(BrandB,
type="o",
pch=13,
lty=2,
col="red")



# Use mean function to generate mean of Father
mean_Father <- mean(Father)
# Print result
mean_Father
# Use the median function to generate the median of Father
median_Father <- median(Father)
# Print result
median_Father
# Use the sd function to generate the standard deviation of Father
sd_Father <- sd(Father)
# Print result
sd_Father


install.packages("pastecs")
library("pastecs")


# Use stat.desc (from the pastecs package) to generate DESCriptive STATistics for Mother
# To see more, type ??stat.desc? in the R Console
stat.desc(Mother)


# Use seq function to generate sequence 0 to 6
x <- seq(0,6)
x # Print the values


# Use the dbinom function to generate pdf: size = sample size, prob = p
pdf_x <- dbinom(x,size = 6,prob = 0.30)
pdf_x # Print the values


# Use the pbinom function to generate cdf: size = sample size, prob = p
cdf_x <- pbinom(x,size = 6,prob = 0.30)
cdf_x # Print the values


all_together <- cbind(x,pdf_x,cdf_x)
all_together # Print the values


# Use the plot function to generate a plot of x vs pdf_x
# Format: plot(x_variable,y_variable, main = "Title of Graph",
# col = color of plot points & line
# type = "o" to get points and connecting line on same axes,
# pch = symbol_type (see p. 89 in notes)
# cex = magnification of the plot symbols
plot(x,pdf_x,
main = "x vs pdf_x",
col = "blue",
type = "o",
pch = 18,
cex =1.5)


# Use the plot function to generate a plot of x vs cdf_x
# Format: plot(x_variable,y_variable, main = "Title of Graph",
# col = color of plot points & line
# type = "o" to get points and connecting line on same axes,
# pch = symbol_type (see p. 106 in notes)
# cex = magnification of the plot symbols
plot (x,cdf_x,
main = "x vs cdf_x",
col = "blue",
type = "o",
pch = 17,
cex =1.5)


# P(X = 9)
# Use dbinom (x,size = sample size, prob = probability of success)
exactly9 <- dbinom(9,25,0.30)
exactly9 # Print the answer


# P(X <= 9)
# Use pbinom (x,size = sample size, prob = probability of success)
nomorethan9 <- pbinom(9,size=25,prob=0.30)
nomorethan9 # Print the answer


# P(X > 9)
# Use pbinom (x,size = sample size, prob = probability of success, lower = FALSE)
# lower = FALSE = P(X > x)
morethan9 <- pbinom(9,size=25,prob = 0.30, lower = FALSE)
morethan9 # Print the answer


# P( 9 <= X <= 12) = P(X <= 12) - P(X < 9) = P(X <= 12) - P(X <= 8)
# Calculate between9and12 = P(X <= 12) - P(X <= 8)
between9and12 <- pbinom(12,size = 25,prob = 0.30) - pbinom(8,size=25,prob = 0.30)
between9and12 # Print the answer

# P( X < 7, X > 12) = P(X <= 6) + P(X > 12)
lessthen7morethan12 <- pbinom(6,size=25,prob=0.30) + pbinom(12,size=25,prob=0.30, lower=FALSE)
lessthen7morethan12


# P(X < 6.4)
# Use pnorm(x,mean,sd)
lower1 <- pnorm(6.4,mean = 8,sd = 1.25)
lower1 # Print the answer


# P(X > 6)
# Use pnorm(x,mu,sigma,lower = FALSE) to get upper tail
upper1 <- pnorm(6.4,8,1.25,lower = FALSE)
upper1 # Print the answer


# P(6.65 < X < 8.35) = P(X <= 8.35) - P(X > 6.65)
between665and835 <- pnorm(9.35,8,1.25) - pnorm(6.65,8,1.25)
between665and835

# find 87th percentile, P(X<=x) = 0.87, mean = 8, sd = 1.25
percentile87 <- qnorm(.87,mean=8,sd=1.24)
percentile87


























