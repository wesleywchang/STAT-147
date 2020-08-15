# Statistics 147 Assignment #1
# Summer 2020
# Wesley Chang


# R Question 3.1

# change working directory to assignment folder for easy access
setwd("/Users/wes_chang/Library/Mobile Documents/com~apple~CloudDocs/Summer 2020 (UCR)/STAT 147 (Session A)/Assignments/1/")

# i

  # read and print wheat1.csv
  # csv has one line of header and data values are separated by a ","
  wheat1 <- read.table("wheat1.csv", header=TRUE, sep=",")
  wheat1

  # make columns invidiually accessible variables and print column names
  attach(wheat1)
  names(wheat1)

# ii
  
  # sum of yields/acre for seventeen acres of SoftRed wheat
  sum_SoftRed <- sum(SoftRed)
  sum_SoftRed
  
# iii
  
  # sum of yields/acre for seventeen acres of HardRed wheat
  sum_HardRed <- sum(HardRed)
  sum_HardRed
  
# iv
  
  # sum of all thirty-four acres of wheat
  total_all <- sum_HardRed + sum_SoftRed
  total_all
  
# v
  
  # generate descriptive statistics obs, mean, median, std dev, var, max, min
  
  # use pastecs library
  library("pastecs")
  
  # generate a table of descriptive statistics using the stat.desc function
  stat.desc(HardRed)
  stat.desc(SoftRed)
  

# vi
  
  # create a histogram for SoftRed, using breaks from 40 to 65 in increments of 5
  # make sure frequencies are listed above each bar in the histogram
  
  # define the breaks for the interval, in increments of 5
  brks1 <- c(40,45,50,55,60,65)
  brks1
  
  # create a histogram for SoftRed, with title and breaks as defined above
  hist(SoftRed,
        main="yields/acre for SoftRed",
        breaks = brks1,
        ylim = c(0,10),
        xlab = "yields/acre",
        labels = TRUE
       )
  
  
  
  
  