analyze <- {
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
    step_3 <- aggregate(. ~ Subject+Activity, step_2, ave)

    final <- data.frame()
    for(roww in 1:nrow(step_3))
        for(coll in 1:ncol(step_3))
            final[roww,coll] <- step_3[roww,][coll][1,][[1]][[1]]
    
    finalNames <- colnames(step_3)
    
    finalNames <- gsub(".mean...X", "X-Mean average", finalNames)
    finalNames <- gsub(".mean...Y", "Y-Mean average", finalNames)
    finalNames <- gsub(".mean...Z", "Z-Mean average", finalNames)
    
    finalNames <- gsub(".std...X", "X-Std average", finalNames)
    finalNames <- gsub(".std...Y", "Y-Std average", finalNames)
    finalNames <- gsub(".std...Z", "Z-Std average", finalNames)
    
    finalNames <- gsub(".std..", "-Std average", finalNames)
    finalNames <- gsub(".mean..", "-Mean average", finalNames)

    colnames(final) <- colnames(finalNames)
    
    write.table(final, "final.txt")
}