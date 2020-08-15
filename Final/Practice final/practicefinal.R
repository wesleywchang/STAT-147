# Practice Final Statistics 147


### Question 1

## Part i

# Read in and print out the data, making sure the columns are accessible individually

setwd("C:/Users/wesle/iCloudDrive/Summer 2020 (UCR)/STAT 147 (Session A)/Final/Practice final/")

agegroup <- read.table( file = "agegroup_f19.dat", header = TRUE, skip = 1)
agegroup

attach(agegroup)
names(agegroup)
G1
G2
G3
G4


## Part ii
# test whether there is a signficant differnce in mean increase in heart rate between the four groups
# independent samples
# paired groups

# Subpart a
# test for normality of each of the 4 age groups, using the Anderson-Darling test

# load nortest package
library(nortest)

# anderson darling test ad.test() for each group
ad.test(G1)
ad.test(G2)
ad.test(G3)
ad.test(G4)


# Subpart b
# if appropriate, test for equality (homogeneity) of variances


# from the above tests, we can assume normality for each sample
# now, we conduct the equality of variances test

# convert from wide to long form
# stack agegroup, then attach and obtain names
st_agegroup <- stack(agegroup)
st_agegroup
attach(st_agegroup)
names(st_agegroup)

# bartlett's test for equality of variances
bartlett.test(values,ind)


# Subpart c
# we assume normality and homogeneity of variances
# now test for equality of means

anovaq1 = aov(values~ind,data=st_agegroup)
anovaq1
summary(anovaq1)


# Subpart d

# multiple comparisons of means (Tukey's test) to determine which means are significantly different

TukeyHSD(anovaq1,conf.level=0.95)



## Part iii
# perform the appropriate test(s) of hypothesis to determine whether there is a significant
# difference in mean increase in heart rate between age group 3 (40-59) and 4 (60-69)

# pretend you dont  have the results from part ii

library(TeachingDemos)

# Subpart a
# test for equality of variances
# var.test(x,y,ratio=1,alternative="",conf.level=)
var.test(G3,G4,ratio=1,alternative="two.sided",conf.level=0.95)

# Subpart b
# testing means, based on results in Subpart a
# assume equality of variances

# t.test(Pop1,Pop2,alternative="",mu=0,var.equal=TRUE,conf.level=)
t.test(G3,G4,alternative="two.sided",mu=0,var.equal = TRUE,conf.level = 0.95)



## Part iv
# perform the appropriate test of hypothesis to determine wheter the mean
# increase in heart rate for G3 is more that 25
# use t.test(x,alternative="",mu=,conf.level=)
t.test(G3,alternative="greater",mu=25,conf.level=0.95)

## Part v
# find and interpret a 95% CI for the mean increase in heart reate for G4
# use t.test
t.test(G4,alternative="two.sided",conf.level=0.95)



### Question 2

## Part i
# read in and print out data, making sure the columns are accessible individually

litter <- read.table(file = "litter2_f19.dat", header=TRUE)
litter

attach(litter)
names(litter)
Litter
Male
Female

## Part ii
# perform the appropriate test of hypothesis to test whether the avg selling price of male
# puppies is significantly higher than the avg selling price of the female puppies, a = 0.05

# data is a paired sample
t.test(Male,Female,paired=TRUE,alternative="greater",conf.level = 0.95)

