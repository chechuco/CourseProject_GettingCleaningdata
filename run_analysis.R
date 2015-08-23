## Open libraries
library(reshape2)
library(data.table)
library(plyr)

## Merge train and test data
# Set the root path to the data files (change properly).
path <- "./UCI HAR Dataset/"

# Get and merge the data files
file_names <- c("subject", "X", "y")
path_train <- paste0(path, "train/", "")
path_test <- paste0(path, "test/", "")
for (i in 1:length(file_names)) {
  var_name <- file_names[i]
  file_1 <- paste0(path_train, file_names[i], "_train.txt")
  file_2 <- paste0(path_test, file_names[i], "_test.txt")
  assign(var_name, rbind(read.table(file_1), read.table(file_2)))
}
# Join the cols together
data_raw <- cbind(subject, y, X)

## Change variable names, and select columns related with 'mean' or 'std'
features <- read.table(paste0(path, "features.txt"))
names(data_raw) <- c("subject", "activity", as.vector(features$V2)) 
data_selected <- data_raw[, grep('(mean|std)', features$V2)]

## Add activity names
activity_labels  <- read.table(paste0(path, "activity_labels.txt"))
data_tidy_wide<- mutate(data_selected, activity = activity_labels[data_selected$activity, "V2"])

## Summarize data
data_tidy_long <- data.table(melt(data_tidy_wide, c("subject", "activity")))
eureka <- data_tidy_long[, (media = median(value)), by=.(subject, activity, variable)]

## Rename columns and sort rows
setnames(eureka, 3, "feature")
setnames(eureka, 4, "mean")
eureka[order(subject, activity, feature)]
View(eureka)