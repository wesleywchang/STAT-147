# Statistics 147 Assignment #3
# Summer 2020
# Wesley Chang


# Question 1

## Supbart (i)
# Read in datafile agility.dat
setwd("C:/Users/wesle/iCloudDrive/Summer 2020 (UCR)/STAT 147 (Session A)/Assignments/3")

agility = read.table(file = "agility.dat", header = TRUE,skip = 1)
agility

## Subpart (ii)
# add in code to make the columns accessible individually and obtain the headers
attach(agility)
names(agility)
Cody
Dusty
Shadow

## Subpart (iii)
# test whether the true mean finishing time for Cody is more than 75 minutes
# H0 = u = 75
# H1 = u > 75
# significance level a = 0.05

# find standard deviation of data set
sd_a = sd(Cody)
sd_a

# generate hypothesis conclusion from t.test
t.test(Cody,alternative="greater",mu=75,sd=sd_a,conf.level=0.95)

# Subpart (iv)

# generate confidence interval
t.test(Cody,alternative="two.sided",conf.level=0.96)

