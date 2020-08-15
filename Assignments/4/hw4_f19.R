# R Question 1
# Part i
# Read in file using the read.table function
agility_f19 <- read.table("/Users/iandimapasok/Downloads/agility_f19.dat", header = TRUE, skip = 1)
agility_f19
#########################################################################
# Part ii
# Use the attach function to use each column individually
attach(agility_f19)
# Use the names function to see the headers
names(agility_f19)
#########################################################################
# Part iii
# Test mu(Cody) > 75
# Use t.test
# Format: t.test(name_of_variable,alternative = appropriate option,
# conf.level = confidence-level-in-decimal-format)
t.test(Cody, alternative = "greater", mu = 75, conf.level = 0.95)
#########################################################################
# Part iv
# Generate 96% CI for Plant B
# Use t.test
# Format: t.test(name_of_variable, alternative = appropriate option
# conf.level = confidence_level_in_decimal_format)
t.test(Cody, alternative = "two.sided", conf.level = 0.98)
#########################################################################
# Part v
# Test for equality of variances between Cody and Dusty
# Use var.test function:
# var.test(Pop1,Pop2,ratio = value, alternative = "two.sided", conf.level = 0.95)
var.test(Cody,Dusty,ratio = 1, alternative = "two.sided", conf.level = 0.95)
###########################################################################################
# Use t.test to test for equality of means, assuming equal variances
# Use t.test function:
# t.test(Pop1,Pop2,ratio = value, alternative = "two.sided", mu = value_to_be_tested)
# var.equal = TRUE or FALSE, conf.level = 0.95)
t.test(Cody,Dusty, alternative = "greater", mu = 0, var.equal = TRUE, conf.level = 0.95)
###########################################################################################
###########################################################################################
# R Question 2
# Part i
# Read in file using the read.table function
dog_dive <- read.table("/Users/iandimapasok/Downloads/dogdive_f19.dat", header = TRUE, skip = 1)
dog_dive
# Use the attach function to use each column individually
attach(dog_dive)
# Use the names function to see the headers
names(dog_dive)
###########################################################################################
# Part ii
# Test for equality of variances between Cody and Dusty
# Use var.test function:
# var.test(Pop1,Pop2,ratio = value, alternative = "two.sided", conf.level = 0.95)
var.test(Dive1,Dive2,ratio = 1, alternative = "two.sided", conf.level = 0.95)
# Use t.test to test for equality of means, assuming equal variances
# Use t.test function:
# t.test(Pop1,Pop2,ratio = value, alternative = "two.sided", mu = value_to_be_tested)
# var.equal = TRUE or FALSE, conf.level = 0.95)
t.test(Dive1,Dive2, alternative = "two.sided", mu = 0, var.equal = TRUE, conf.level = 0.95)