# Statistics 147 Assignment #2
# Summer 2020
# Wesley Chang


# change working directory to assignment folder for easy access
setwd("/Users/wes_chang/Library/Mobile Documents/com~apple~CloudDocs/Summer 2020 (UCR)/STAT 147 (Session A)/Assignments/2/")


# R Question 1

## Subpart i

  # generate sequence 0 through 12 and store sequence in a variable named y
  y <- seq(0,12)
  y

## Subpart ii
  
  # generate the pdf of y and store in var pdf1
  # Y~Bin(n=12,p=0.07)
  pdf1 <- dbinom(y,size=12,prob=0.07)
  pdf1
  
## Subpart iii
  
  # generate cdf of y and store in var cdf1
  # y~bin(n=12,p=0.07)
  cdf1 <- pbinom(y,size=12,prob=0.07)
  cdf1
  
## Subpart iv
  
  # Generate values of P(Y > y) and store in var sdf1
  # Y~Bin(n=12,p=0.07)
  sdf1 <- pbinom(y, size=12,prob=0.07, lower=FALSE)
  sdf1
  
## Subpart v
  
  # use cbind function to generate a data frame with y1, pdf1, cdf1, and sdf1
  all_together <- cbind(y,pdf1,cdf1,sdf1)
  all_together
  

## Subpart vi
  
  # P(X = 3) 
  p6 <- dbinom(3,size=12,prob=0.07)
  p6
  
## Subpart vii
  
  # P(X <= 3)
  p7 <- pbinom(3,size=12,prob=0.07, lower=TRUE)
  p7
  
## Subpart viii
  
  # P( 2 <= X <= 4) = P( X <= 4) - P(X <= 2)
  p8 <- pbinom(4,size=12,prob=0.07, lower=TRUE) - pbinom(2,size=12,prob=0.07, lower=TRUE)
  p8

## Subpart ix
  
  plot(y, pdf1,
       xlab = "y",
       ylab = "pdf1",
       main = "Plot of y vs pdf1"
       )

## Subpart x
  
  plot(y, cdf1,
       xlab = "y",
       ylab = "cdf1",
       main = "Plot of y vs cdf1"
       )
  
  
# R Question 2
  # normally distributed, mean = 40 pounds, std dev = 0.50
  # functioning level = 38.75 to 41.25
  # randomly selected from assembly line
  
  
## Subpart i
  
  # Prob bag is underfilled
  # P(X<38.75)
  # pnorm(x,mean,sd)
  p1 <- pnorm(38.75,mean=40,sd=0.50)
  p1
  
## Subpart ii
  
  # Prob bag is not underfilled
  # P(X > 38.75), lower tail is FALSE
  p2 <- pnorm(38.75,mean=40,sd=0.50, lower=FALSE)
  p2
  
## Subpart iii
  
  # Prob bag is overfilled or underfilled
  # P(X<38.75) + P(X>41.25)
  p3 <- pnorm(38.75,mean=40,sd=0.50) + pnorm(38.75,mean=40,sd=0.50, lower=FALSE)
  p3
  
## Subpart iv
  
  # Prob bag has a fill amount that meets specifications
  # P(38.75<X<41.25)
  #     = P(X < 41.25) - P(X < 38.75)
  p4 <- pnorm(41.25,mean=40,sd=0.50) + pnorm(38.75,mean=40,sd=0.50)
  p4
  

## Subpart v  
  # Find the 97th percentile
  # use the quantile function qnorm(quantile, mean, sd)
  p5 <- qnorm(0.97,mean=40,sd=0.50)
  p5
  

# R Question 3
  
## Subpart i
  # Read from file into p1 with header, skip one line
  p1 = read.table(file="agility.dat",header=TRUE,skip=1,sep="")
  p1

## Subpart ii
  # add code that allows the columns to be accessible individually
  attach(p1)
  # display columns to verify that the code above worked
  names(p1)
  
  
  
  
  
  
  