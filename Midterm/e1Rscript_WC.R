# Statistics 147 Exam I, Part 2 R
# Summer 2020
# Wesley Chang

# change working directory
setwd("c:/Users/wesle/iCloudDrive/Summer 2020 (UCR)/STAT 147 (Session A)/Midterm")
# verify working directory and display contents of current working directory
getwd()
dir()

###############################################################################
###############################################################################
# Question 1

# Part (i)

# read and print dogdiet.dat
# file includes a header, and we skip one line (due to variable name)
dogdiet <- read.table("dogdiet.dat",header=TRUE,skip=1,sep="")
dogdiet

###############################################################################
# Part (ii)

# add code to make columns accessible individually
attach(dogdiet)
# verify that code worked
names(dogdiet)
F1
F2
F3


###############################################################################
###############################################################################
# Question 2

# Part (i)
# generate descriptive statistics for above data set (mean,median,sd)
  #stat.desc(F1)
    # i would have used this command but received error 'could not find function
    # "stat.desc"'

# F1
  mean(F1)
  median(F1)
  sd(F1)
  

###############################################################################
# Part (ii)
# create a histogram for F1, using breaks from 2 to 5 in increments of 0.5. Be
# sure to include the following colors (Red, Green, Blue, Purple, Orange, Brown)
# Title: "Histogram of weight loss for Formula 1"
  
# create colors for the bars
  colorsq2 <- c("red","green","blue","purple","orange","brown")
# print
colorsq2
  
# create frequency table
F1table <- table(F1)
F1table
  
# create interval breaks
brksq2 <- c(2,2.5,3,3.5,4,4.5,5)
# print
brksq2

# Create histogram

hist(F1,
     main= 'Histogram of Weight Loss for Formula 1',
     breaks = brksq2,
     col = colorsq2,
     )


###############################################################################
###############################################################################
# Question 3

# Part (i)
# read and print dogjudge.dat
# file includes a header, and we skip one line (due to variable name)
dogjudge <- read.table("dogjudge.dat",header=TRUE,skip=1,sep="")
dogjudge

# extra stuff to attach variable names to columns
attach(dogjudge)
names(dogjudge)
dog
J1
J2

###############################################################################
# Part (ii)

# create scatterplot of J1 vs J2, using J1 as horiz axis
# title: Scatterplot of Judge 1 vs Judge 2
# x-axis limits: 75-100 and y-axis limits: 70-100
# symbol pch = 16

# J1 vs J2
plot(J1,J2,
    # x axis label
    xlab = "Judge 1",
    # y axis labl
    ylab = "Judge 2",
    # plot title
    main = 'Scatterplot of Judge 1 vs Judge 2',
    # x axis limits
    xlim = c(75,100),
    # y axis limits
    ylim = c(70,100),
    # symbol pch = 16
    pch = 16
     )


###############################################################################
###############################################################################
# Question 4

# specification limits for bottle 40.0 +- 2.50
# aka appropriate level is 37.5-42.5 ounces

# filling process is normally distributed with mean 40 ounces and sd 1.75
# select bottle at random

# use normal distribution

# Part (i)

# find probability that the bottle is overfilled
# P (X > 42.5)
# use pnorm(x,mean,sd,lower=FALSE) for P(X>x) = 1 - cdf of X
q4p1 <- pnorm(42.5,40,1.75,lower=FALSE)
q4p1

###############################################################################
# Part (ii)

# find probability that the amount of fill is between 37 ounces and 41 ounces
# P(37 < X < 41)
# = P(X <= 41) - P(X < 37)
q4p2 <- pnorm(41,40,1.75) - pnorm(37,40,1.75)
q4p2

###############################################################################
# Part (iii)

# find the 96th percentile (find x such that P(X<=x)=0.96)
# use qnorm fuction with p = 0.96, mean, sd
q4p3 <- qnorm(0.96,40,1.75)
q4p3


###############################################################################
###############################################################################
# Question 5

# 35% of current students prefer that change in class times
# random sample of 24 students selected
# use binomial distribution


# Part (i)
# find probability that exactly 10 of the students prefer the change in class times
# P(X=10)
# use dbinom(x,n,p) for P(X=x)
q5p1 <- dbinom(10,24,.35)
q5p1

###############################################################################
# Part (ii)
# find probability between 7 and 10 of the students that prefer the change in class times
# P(7<=X<=10) = P(X<=10) - P(X<=7)
# pbinom for P(X<=x)
q5p2 <- pbinom(10,24,.35) - pbinom(7,24,.35)
q5p2


###############################################################################
###############################################################################
# Question 6


# Part (i)
# enter data into variable skittles1 and print
skittles1 <- c("blue","yellow","red","blue","red","green","orange","blue",
              "yellow","orange","green","green","yellow","yellow","red","red",
              "red","red","blue","red","green","blue","red","yellow","orange",
              "blue","blue")
skittles1


###############################################################################
# Part (ii)
# create frequency table for the colors of the skittles
skittles1colors <- table(skittles1)
skittles1colors

###############################################################################
# Part (iii)
# make a vertical bar chart of the colors of the skittles with matching colors
# define colors
colorsskittles <- c("blue","green","orange","red","yellow")
colorsskittles

# create bar chart
barplot(skittles1colors,
          xlab = "Color",
          ylab = "Frequency",
          main = "Distribution of Skittles Colors in Bag",
          col=colorsskittles
          )


###############################################################################
###############################################################################
# Question 7

# Part (i)
# store sequence into variable xq7
xq7 = seq(0.2,0.5,0.1)
xq7

# evalute expression y = 2x^2 + sqrt(2x)
yq7 = NULL
for (n in seq(along=xq7)){yq7[n]= (2*xq7[n]^3+sqrt(2*xq7[n]))}

yq7 = 2*xq7^3 + sqrt(2*xq7)
yq7

###############################################################################
# Part (ii)
# combine two columns together into one table
xyq7 = cbind(xq7,yq7)
xyq7



