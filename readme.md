** Summary
This dataset summarize the data obtained by Samsung in an experiment with 30 volunteers
 within an age bracket of 19-48 years. Each person performed six activities (WALKING, 
 WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 
 (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they
  captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The final goal is getting the median from diferent features related with median and standard deviation.

** Data processing
The original data was split in train and test data, and other relevant information like 
the name of the features measured or the name of the activities performed by the volunteers.
To perform the analysis, several modifications was performed:
- merge the train and test data sets
- change numbers identifying variables with variable names
- change numbers identifying features with feature names
- select features related with median and standard deviation of the data
- calculate median for each combination of subject-variable-feature, by reshaping the data set 
into a new data.table object data set, long-format.

** Raw data
This script assume the original data has been downloaded and the UCI HAR Dataset folder 
is in the working directory". Anyway, data can be retrieved with this script:
if(!file.exists("./Wearable")) {dir.create("Wearable")}
setwd("./Wearable")
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "filename.zip", method = "curl")
unzip("filename.zip")

** Reading data
As stated in https://class.coursera.org/getdata-031/forum/thread?thread_id=28, 
the data can be read into R with:

data <- read.table(file_path, header = TRUE)

· The dataset includes the following files:

- run_analysis.R: the script to perform the analysis.
- codebook.md:	describes the dataset.
- readme.md: this file.