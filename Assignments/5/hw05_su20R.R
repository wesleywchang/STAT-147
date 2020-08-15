# Statistics 147 Assignment #5
# Summer 2020
# Wesley Chang

# open file agility.dat, read into data set agility
setwd("C:/Users/wesle/iCloudDrive/Summer 2020 (UCR)/STAT 147 (Session A)/Assignments/5")
agility <- read.table(file = "agility.dat", header=TRUE, skip=1)
agility

# attach column names, and verify
attach(agility)
names(agility)
Cody
Dusty
Shadow

# convert data frame from wide to long
agility_long <- stack(agility)
agility_long

# attach column names, and verify
attach(agility_long)
names(agility_long)
values
ind

### R Question 1

## Part i
# test for underlying normality for each of the dogs (using Anderson-Darling Test)

# use ad.test, which is in the library nortest

# call nortest library
library(nortest)

## Anderson-Darling Test
# For Cody
ad.test(Cody)
# For Dusty
ad.test(Dusty)
# For Shadow
ad.test(Shadow)



## Part ii
# test for equality (homogeneity) of variances (using Bartlett's test), use a = 0.05

# bartlett.test(x,g), where x is the set of numeric vectors, and g is the set of factor objects
bartlett.test(values,ind)


## Part iii
# perform the appropriate test(s) of hypothesis to determine wheter one can conclude that
# at least of the dogs has a significantly different mean finishing time, using a = 0.05

# appropriate test is determined by whether normality and homogeneity assumptions are satisfied

# normality satisfied as per Anderson-Darling Test
# homogeneity satisfied as per Bartlett's test
# we can proceed with testing for equality of means

# testing difference in means, we can use aov()
# we set values ~ ind to indicate corresponding variables and group
# we set data=agility_long to indicate R to read from this data frame
results_anova <- aov(values ~ ind, data=agility_long)

# print data and a summary of the data
results_anova
summary(results_anova)


## Part iv
# if appropriate, use Tukey's test and the p-value method to determine which means(s) is(are)
# significantly different (justify answer)

# We concluded in Part iii that there is a significant difference such that not all means are equal

# we now can use Tukey's test
# TukeyHSD(results_anova,conf.level)
# we pass on the results_anova data frame to TukeyHSD and generate results at the 95% level
TukeyHSD(results_anova,conf.level=0.95)




