# Statistics 147 Lab #4 Summer 2020
# Wesley Chang

# read file plant.dat in to variable plant_data
plant_data = read.table(file = "C:/Users/wesle/iCloudDrive/Summer 2020 (UCR)/STAT 147 (Session A)/Labs/Lab 4/plant.dat",header = TRUE)
plant_data

# use attach() function to make each column individually accessible
# use the names() function to obtain the column names
attach(plant_data)
names(plant_data)
PlA
PlB
PlC
PlD

# R Question 2

# sample mean
mean_PlA = mean(PlA)
mean_PlA

# sample median
median_PlA = median(PlA)
median_PlA

# sample variance
variance_PlA = var(PlA)
variance_PlA

# sample standard deviation
sd_PlA = sd(PlA)
sd_PlA


# R Question 3
# generate default descriptive statistics for Plant B (PlB)
summary_PlB = summary(PlB)
summary_PlB

# generate mean, median, variance, std dev for Plant C (PlC)
summary_PlC = summary(PlC)
variance_PlC = var(PlC)
sd_PlC = sd(PlC)

summary_PlC
variance_PlC
sd_PlC


# R Question 4
# Generate 98% Ci for Plant A
# Use t.test
# Format: t.test(name_of_variable,alternative = appropriate option,
# conf.level = confidence-level-in-decimal-format)
t.test(PlA,alternative="two.sided",conf.level=0.98)

# find and interpret a 96% confidence interval for the true mean discharge for Plant B
t.test(PlB,alternative="two.sided",conf.level=0.96)

# test mu(PlA) < 1.50
# use t.test
# Format: t.test(name_of_variable,alternative = appropriate option,
# conf.level = confidence-level-in-decimal-format)
t.test(PlA,alternative="less",mu=1.5,conf.level=0.95)

# using R to complete the caculations, test the hypothesis that the true mean discharge
# effluent (uB) for Plant B is significantly different from 1.75 pounds/gallon

# test mu(PlB) =/ 1.74
# two-sided test
t.test(PlB,alternative="two.sided",conf.level=0.95)

