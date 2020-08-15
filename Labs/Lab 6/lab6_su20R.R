# Statistics 147 Lab #6
# Summer 2020
# Wesley Chang

### R Question 2

## Part i

lab6 = read.table(file = "C:/Users/wesle/iCloudDrive/Summer 2020 (UCR)/STAT 147 (Session A)/Labs/Lab 6/plant.dat", header = TRUE)
lab6

attach(lab6)
names(lab6)
PlA
PlB
PlC
PlD

# Perform the appropriate teset to determine whether there is a significant difference 
# in mean amount of effluent between the four plants

# Subpart a
# first, test for normality using the Anderson-Darling test
library(nortest)
ad.test(PlA)
ad.test(PlB)
ad.test(PlC)
ad.test(PlD)


# Subpart b
# test for equality (homogeneity) of variances using the bartlett.test function

# stack the data and make the columns acessible
stack_plants <- stack(lab6)
attach(stack_plants)
names(stack_plants)
values
ind

# Use bartlett.test(values,ind) to test for homogeneity of variances
# values = data values and ind = classes
bartlett.test(values,ind)

# Subpart c
# perform the appropriate test to determine whether there is a significant difference
# in mean amount of effluent between the four plants

# use the aov function to generate ANOVA information
# general format for 1 way CRD: aov(response~factor. data = dataname)
results2 = aov(values~ind,data=stack_plants)
summary(results2)

# Subpart d
# use Tukey's test to determine which treatment means are different
# if you did not conclude that there was a significant difference in treatment means, just state that

# use TukeyHSD to test for multiple comparisons
TukeyHSD(results2,conf.level=0.95)