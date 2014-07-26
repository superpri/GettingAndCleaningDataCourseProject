clean <- {
    library(plyr)
    
    download.file("https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip",
                  destfile="dataset.zip",
                  method="wget")
    unzip("dataset.zip")
    setwd("UCI HAR Dataset")
    
    #Appropriately labels the data set with descriptive variable names.
    names <- read.table("features.txt")
    x_test<- read.table("test/X_test.txt", col.names = names$V2, na.strings="NA")
    x_train <- read.table("train/X_train.txt", col.names = names$V2, na.strings="NA")
    
    # add columns: activity and subject
    x_test <- cbind(x_test, read.table("test/y_test.txt", col.names="Activity"))
    x_test <- cbind(x_test, read.table("test/subject_test.txt", col.names="Subject"))
    
    x_train <- cbind(x_train, read.table("train/y_train.txt", col.names="Activity"))
    x_train <- cbind(x_train, read.table("train/subject_train.txt", col.names="Subject"))
    
    # Merges the training and the test sets to create one data set.
    step_1 <- rbind(x_test, x_train)
    
    #Extracts only the measurements on the mean and standard deviation for each measurement. 
    #keeping activity and subject columns (562 and 563)
    measurements <- c(grep("-mean\\(\\)|-std\\(\\)", names$V2), c(562, 563))
    step_2 <- step_1[,measurements]
    
    #Uses descriptive activity names to name the activities in the data set
    activityDesc <- read.table("activity_labels.txt")
    for (i in 1:6)
        step_2$Activity <- replace(step_2$Activity,
                                   step_2$Activity == i, 
                                   as.character(activityDesc[activityDesc$V1 == i,2]))
    
    #Creates a second, independent tidy data set with the average of each variable 
    #for each activity and each subject. 
    m <- c(grep("-mean\\(\\)|-std\\(\\)", names$V2))
    names[m,]
    m <- c(m, 562, 563)
    write.table(ddply(step_2, .(Subject), summary),file="text.txt")
}