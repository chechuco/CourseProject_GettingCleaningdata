"This script assume the data has been downloaded and the UCI HAR Dataset folder is in the working directory" kind of thing.
Anyway, data can be.... with this script:
if(!file.exists("./dirname")) {dir.create("dirname")}
setwd("./dirname")
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "filename.zip", method = "curl")
unzip("filename.zip")

As stated in https://class.coursera.org/getdata-031/forum/thread?thread_id=28, 
the data can be read into R with:

data <- read.table(file_path, header = TRUE)





Notas:
· Describir los distintos archivos y cómo están relacionados.


· The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.


· The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity 

· Each feature vector is a row on the text file.

·