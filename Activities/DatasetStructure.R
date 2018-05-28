# Functions for discovering structural information about a dataset
# Use ?read.csv to learn more about inputting comma separated data
# In general use ?functionname to learn more about using functions
# Last updated 05.28.2018 @ 04:00pm


require(dplyr) # required to use glimpse function

# Specify the URL of the data set and read it into R Studio
# A dataset name should usually be descriptive, here we use 
# a generic 'datasetname' so you can explore other datasets
# with minimal changes to the script---just change the URL.

datasetname <- read.csv("https://raw.githubusercontent.com/STAT-JET-ASU/Datasets/master/Instructor/vietnamdraft.csv")

# Structure of the dataset (#observations, variables, variable types)
str(datasetname)

# Structure of the dataset (#observations, variables, variable types)
# This function presents the dataset information differently than str
glimpse(datasetname)

# Print brief summaries of all variables in the dataset, including NA
summary(datasetname)

# List the attributes (column names, class, rownames) of the dataset
# If the rows do not have names, then the rownames are their numbers
attributes(datasetname)

# Find the row and column dimensions (the number of rows and columns)
dim(datasetname)

# Row dimension only
nrow(datasetname)
dim(datasetname)[1]

# Column dimension only
ncol(datasetname)
dim(datasetname)[2]

# Variable (column) names
names(datasetname)
attributes(datasetname)[1]

# Class of each variable
# Output is a list vector
lapply(datasetname, class)

# Class of each variable
# Output character vector
sapply(datasetname, class)

# Find the number of rows that do not contain NA values (missing data)
sum(complete.cases(datasetname))

# Find the number of rows that contain NA values (i.e., missing data)
sum(!complete.cases(datasetname))

# Print the first n rows of the dataset; input how many rows you want
head(datasetname, 5)

# Print the last n rows of the dataset; input how many rows you want
tail(datasetname, 5)

# Print the whole dataset (be careful if your dataset is very large!)
print(datasetname)

# Offers different options for printing datasets than just using print
print.data.frame(datasetname)
