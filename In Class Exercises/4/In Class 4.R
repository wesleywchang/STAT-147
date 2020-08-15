# Statistics 147 In Class Assignment #4
# Wesley Chang

# Part i

setwd('C:/Users/wesle/iCloudDrive/Summer 2020 (UCR)/STAT 147 (Session A)/In Class Exercises/4')
dog_data = read.table(file = "dograces.dat", header = TRUE, skip=1)
dog_data

attach(dog_data)
names(dog_data)
Dusty
Shadow
Lakota

# Part ii

t.test(Shadow,alternative="two.sided",conf.level=0.97)

# Part iii

t.test(Lakota,alternative="greater",mu=60,conf.level = 0.95)