## To do:
## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## 1) get all the data separately
## I 
xtrain <- read.table("~/a/train/X_train.txt")
## II
ytrain <- read.table("~/a/train/y_train.txt")
## III
subtrain <- read.table("~/a/train/subject_train.txt")
## IV
xtest <- read.table("~/a/test/X_test.txt")
## V
ytest <- read.table("~/a/test/y_test.txt")
## VI
subtest <- read.table("~/a/test/subject_test.txt")
## throw away the unnecessary stuff (46 variables left)


## 3. Name the activities descriptively - so it looks better
actlab <- read.table("~/a/activity_labels.txt", header= F)

## 4. Appropriately labels the data set with descriptive activity names.
y[,1] <-actlab[y[,1],2]

## merge datasets into x, y, subject
x <- rbind(xtrain, xtest)
y <- rbind(ytrain, ytest)
sub <- rbind(subtrain, subtest)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## so we need to put in the explainations to tell us which is a mean/standard deviation measurement:
feat <- read.table("~/a/features.txt")
## then we got to grab the measurements on mean and standard deviation
msd_feat <- grep("-mean|std\\(\\))", feat[, 2])
x<- x[, msd_feat]
data <- data[, msd_feat]
## name the columns correctly
names(y)<- "activity"
names(sub) <- "Subject"
names(x) <- feat[msd_feat, 2]

##merge data into 1 piece
data <- cbind(x,y,sub)

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## using reshape2
library(reshape2)

melted <- melt(data, id=c("Subject","activity"))
tidy <- dcast(melted, Subject+activity ~ variable, mean)

##finished!
write.table(tidy, "tidy_data.txt", row.names=F)