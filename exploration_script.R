# Author
#   Cody Hatfield - cxh124730
#   CS-4375.001

# Instantiate and load the iris dataset into the 'iris' local object, define column names for the object, and show
# the first 6 entries of the dataset
iris <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data", header = FALSE)
colnames(iris) <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")
head(iris)

# Display the iris dataset as a scatter plot, and save the original iris dataset into a local file as a backup
plot(
  iris$Petal.Length,
  iris$Sepal.Width,
  xlab = "Petal Length",
  ylab = "Sepal Width"
)
save(iris, file="iris.rda")

# Display duplicated rows
iris[duplicated(iris),]

# Copy the iris dataset (without duplicate rows) into the nd_iris local object (nd_iris = non-duplicate iris)
nd_iris <- iris[!duplicated(iris),]

# Show there are no duplicates in the nd_iris data set, save it as a backup, and then move the duplicate-free 
# dataset back into the iris object
nd_iris[duplicated(nd_iris),]
save(nd_iris, file="nd_iris.rda")
iris <- nd_iris

# Shows there are no missing values in the dataset
iris[is.na(iris)]

# Add a missing value, and show that the missing value is recognized
iris[10,3] <- NA
iris[is.na(iris)]

# Displays the row with the missing value
iris[
  which(
    is.na(iris), 
    arr.ind=TRUE
  )[1],
]

# Copy the iris dataset (without missing data) into the complete_iris local object, show that complete_iris is
# free of missing data, and save the data as a backup
complete_iris <- iris[complete.cases(iris),]
complete_iris[is.na(complete_iris)]
save(complete_iris, file="complete_iris.rda")

# Move the new dataset back into the iris object, and display the iris object one final time
iris <- complete_iris
iris
