# Statistics 147 In Class Assignment #5
# Wesley Chang

### Question 1

## Part i
inclass5 = read.table(file = "C:/Users/wesle/iCloudDrive/Summer 2020 (UCR)/STAT 147 (Session A)/In Class Exercises/5/DOGRACES.DAT", header = TRUE, skip = 1)
inclass5

attach(inclass5)
names(inclass5)
Dusty
Shadow
Lakota

## Part ii
t.test(Shadow,alternative="two.sided",conf.level=0.97)

## Part iii
t.test(Lakota,alternative="greater",mu=60,conf.level=0.95)

## Part iv

# is it reasonable to assume equality of variances?
var.test(Shadow,Lakota,ratio=1,alternative="two.sided",conf.level=0.95)

# Assuming equality of variances, test whether the mean time for Lakota is significantly greater than the mean time for the Shadow team
t.test(Lakota,Shadow,alternative="greater", var.equal = TRUE, conf.level=0.95)

