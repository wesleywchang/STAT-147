# Statistics 147 Lab #5
# Summer 2020

## Question 1

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


# test of equal variances
var.test(PlA,PlB,ratio=1,alternative="two.sided",conf.level = 0.95)

# test of equal means
t.test(PlA,PlB,alternative="two.sided",mu=0,var.equal=TRUE,conf.level = 0.95)


## Question 2

var.test(PlA,PlC,ratio=1,alterantive="two.sided",conf.level = 0.95)

t.test(PlA,PlC,alternative="two.sided",mu=0,var.equal=TRUE,conf.level=0.95)


## Question 3

setwd("C:/Users/wesle/iCloudDrive/Summer 2020 (UCR)/STAT 147 (Session A)/Labs/Lab 5/")
cartest = read.table(file="cartest1.dat", header = TRUE)
cartest
attach(cartest)
names(cartest)

# paired t test

t.test(BrandA,BrandB,alternative="two.sided",mu=0,paired=TRUE,conf.level=0.95)

# paired t test
t.test(BrandA,BrandB,alternative="less",mu=0,paired=TRUE,conf.level=0.95)