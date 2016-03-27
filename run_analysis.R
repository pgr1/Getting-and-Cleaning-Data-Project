
## Merge the training and test sets to create one data set

library(plyr)
xtrain <- read.table("Dataset/train/X_train.txt")
ytrain <- read.table("Dataset/train/y_train.txt")
subjecttrain <- read.table("Dataset/train/subject_train.txt")

xtest <- read.table("Dataset/test/X_test.txt")
ytest <- read.table("Dataset/test/y_test.txt")
subjecttest <- read.table("Dataset/test/subject_test.txt")

# create data sets
x <- rbind(xtrain, xtest)
y <- rbind(ytrain, ytest)
subject <- rbind(subjecttrain, subjecttest)


## Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("Dataset/features.txt")

# columns with mean() or std() 
meanstd <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the columns
x <- x[, meanstd]
names(x) <- features[meanstd, 2]


## Use descriptive activity names to name the activities in the data set

activitieslabels <- read.table("Dataset/activity_labels.txt")
# update values
y[, 1] <- activitieslabels[y[, 1], 2]
names(y) <- "activity"


## Appropriately label the data set with descriptive variable names

# single data set
names(subject) <- "subject"
alldata <- cbind(x, y, subject)


## Create a second, independent tidy data set with the average of each variable for each activity and each subject

datamean <- ddply(alldata, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(datamean, "tidy.txt", row.name=FALSE)


