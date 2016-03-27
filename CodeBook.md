# Introduction

The script `run_analysis.R`performs the 5 steps described in the course project's definition.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Variables

* `xtrain`, `ytrain`, `xtest`, `ytest`, `subjecttrain` and `subjecttest` contain the data from the downloaded files.
* `x`, `y` and `subject` merge the previous datasets.
* `features` contains the correct names for the `x` dataset.
* `activities` contains the correct names for the `y` dataset.
* `alldata` merges `x`, `y` and `subject` one dataset.
* `datamean` contains the averages which will be saved in `tidy.txt`.
