## Read in the data
X_train <- read.table("~/Dropbox/R/UCI HAR Dataset/train/X_train.txt", 
                      quote="\"", colClasses = c("numeric"))
X_test <- read.table("~/Dropbox/R/UCI HAR Dataset/test/X_test.txt", 
                     quote="\"", colClasses = c("numeric"))
y_train <- read.table("~/Dropbox/R/UCI HAR Dataset/train/y_train.txt", 
                      quote="\"", col.names=c("Activity"),colClasses = c("numeric"))
y_test <- read.table("~/Dropbox/R/UCI HAR Dataset/test/y_test.txt", 
                     quote="\"", col.names=c("Activity"),colClasses = c("numeric"))
subject_train <- read.table("~/Dropbox/R/UCI HAR Dataset/train/subject_train.txt",
                            quote="\"", col.names=c("Subject"), colClasses=c("numeric"))
subject_test <- read.table("~/Dropbox/R/UCI HAR Dataset/test/subject_test.txt",
                           quote="\"", col.names=c("Subject"), colClasses=c("numeric"))
features <- read.table("~/Dropbox/R/UCI HAR Dataset/features.txt", quote="\"")
features <- features[,2]

## Appropriately label the data set with descriptive variable names
names(X_train) <- features
names(X_test) <- features

## Extract only the columns with mean() or std() in the features
desiredIndex = grepl("std()", features) | grepl("mean()", features)
X_train <- X_train[,desiredIndex]
X_test <- X_test[,desiredIndex]

## Add Activity type and Subject to each set
X_train <- cbind(X_train, y_train, subject_train)
X_test <- cbind(X_test, y_test, subject_test)

## Merge the data into one set
data <- rbind(X_train, X_test)

## Use descriptive activity names to name the activities in the data set
data$Activity <- factor(data$Activity, labels=c("Walking", "Walking_Upstairs", 
                                                "Walking Downstairs", "Sitting",
                                                "Standing", "Lying"))

## Create second, independent tidy data set with average of each variable
## for each activity and each subject
tidy_data <- aggregate(data, by=list(data$Activity, data$Subject), FUN=mean, na.rm=TRUE)
names(tidy_data)[1:2] = c("Activity", "Subject")

## Save file
write.table(tidy_data, file = "~/Dropbox/R/UCI HAR Dataset/tidy_data.txt", row.names=FALSE,
            sep="\t")
