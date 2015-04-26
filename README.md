# gettingdata_project


I never really know what to put in here, so here goes.

According to the project rules:
You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script is not done according to the exact listing that was presented as above, mainly because once I have combined the information, it becomes very difficult to add labels to it, and it looks pretty much like gibberish. I have tried many different ways before I arrived at this solution which looks like it is correct. 

The different analysis files used to subset the information draws from various different sources, which are all part of the UCI HAR Dataset Directory.
There are two main folders which are TEST and TRAIN, which provides the following information.
TEST : offers data for xtest, ytest and subtest
TRAIN: offers data for xtrain, ytrain and subtrain
"activity_labels" offer actlab, which is the description of the activity done
"features" offer the column headings for the data
there is another file called "features_info" which is a readable text telling us what the short forms in "features" actually mean so we can draw information using the correct label.
