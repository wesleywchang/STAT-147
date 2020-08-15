# Statistics 147
# Summer 2020
# In Class R Exercise #1
# Wesley Chang
# Use the read.table command to open and read in the data from the ages.dat file # BE SURE TO CHECK IF YOU NEED TO USE THE ‘header‘ OR ‘skip‘ OPTIONS
# BY OPENING/INSPECTING THE FILE

setwd("/Users/wes_chang/Library/Mobile Documents/com~apple~CloudDocs/Summer 2020 (UCR)/STAT 147 (Session A)/In Class Exercises/1/")

ages_df <- read.table("ages.dat", header=TRUE)
# Print to check ages_df
ages_df

attach(ages_df)
names(ages_df)

age_diff <- Father - Mother
age_diff

# Sort the vector and assign to a new variable called 'age_diff_sorted'
age_diff_sorted <- sort(age_diff)
age_diff_sorted

abs_age_diff <- abs(age_diff)
abs_age_diff

abs_age_diff_sorted <- sort(abs_age_diff)
abs_age_diff_sorted