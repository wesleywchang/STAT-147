# Statistics 147 Assignment #4
# Summer 2020
# Wesley Chang


### Question 1

## Part i
# write the R code to read in and print the data

# change working directory
setwd("C:/Users/wesle/iCloudDrive/Summer 2020 (UCR)/STAT 147 (Session A)/Assignments/4")

# read in and print data
question1 = read.table(file = "agility.dat", header=TRUE, skip=1)
question1


## Part ii
# add code to make the columns accessible individually and obtain their column headers
attach(question1)
names(question1)

# print column data to make sure it came out right
Cody
Dusty
Shadow


# Part iii
# using R to generate the appropriate output, test whether the true mean finishing time
# for Cody is more than 75 minutes
# use a = 0.05

t.test(Cody,alternative="greater",mu=75,conf.level=0.95)


## Part iv
# using R to generate the appropriate output, find and interpret a 96% confidence interval 
# for the true mean finishing time of Cody

t.test(Cody,alternative="two.sided",conf.level=0.96)


## Part v

# using R to generate the appropriate output, perform the appropriate 
# tests of hypothesis to determine whether one can conclude that the mean 
# finishing time foor Cody is longer thant the mean finishing time for Dusty

# use a = 0.05

# first, test for equality of variances
var.test(Cody,Dusty,ratio=1,alternative="two.sided",conf.level = 0.95)

# since above p value is 0.1723, do not reject the null hypothesis, that the ratio of
# variances is equal to 1
# conclude that you can assume equal variances

# then test the difference in mean finishing time
t.test(Cody,Dusty,alternative="greater",var.equal=TRUE,conf.level = 0.95)



### Question 2

## Part i

question2 = read.table(file = "dogdive.dat", header = TRUE, skip = 1)
question2

attach(question2)
names(question2)
Dog
Dive1
Dive2


## Part ii
# using R to generate the output, perform the test of hypothesis to determine wheter there is a
# significant difference in meann dive distance between the two dives
# use a = 0.05

# first, test for the equality of variances
var.test(Dive1,Dive2,ratio=1,alternative="two.sided",conf.level=0.95)

# p value is 0.7977, fail to reject null, assume equality of variances

# then, test the difference in mean finishing time
t.test(Dive1,Dive2,var.equal = TRUE,alternative="two.sided",conf.level=0.95)

