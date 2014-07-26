#Code Book

This code book that describes the variables, the data, and any transformations or work that was performed to clean up the data.

## Variables

| Variable      | Description   |
| ------------- |---------------|
| names | has all column names from features.txt |
| x_test | has data from X_test.txt |
| x_train | has data from X_train.txt |
| step_2 | has only the measurements on the mean and standard deviation for each measurement|
| activityDesc | has the description for the activity each volunteer had to do for the experiment |
| step_3 | has the average | of each variable for each activity and each subject |
| final | has the final tidy data | 
| finalNames | has the final column names for the tidy data |

To x_test and x_train, I used cbind to add Activity and Subject respectively from \*/y_\*.txt and \*/subject_\*.txt.

## Data

### x_train and x_test

To build thoses data frames, it was needed to read the files X_train.txt and X_test.txt. After that, I read the files that had the information for activity and subject and added them as a new column.

### final

final contains the tidy data consisting of the average | of each variable for each activity and each subject. 

## Transformation

### step_1

It is only the union of x_train and x_test.

### step_2

To build step_2, it was nedded to use grep to select only the column containing the standard deviation (std) or the mean of each variable. I kept the Activity and Subject columns here.
On step_2, the labels of activity were transformed by reading them to a data fram and with a for loop, they were replaced on step_2.

### step_3

For step_3, I just used aggregate function to group by subject and activity and calculated the average | for every variable on step_2 data frame.

### final

We have 68 columns, the average for each variable considered 68 values. As a result, we have a list of 68 values for each variable. I made a crazy for loop to build final data frame containing only one value for each variable for each row.

#### final column names

| step_3 column names      | final column names   |
| ------------- |---------------|
|Subject                    |Subject|
|Activity                   |Activity|
|tBodyAcc.mean...X          |tBodyAccX-Mean average |
|tBodyAcc.mean...Y          |tBodyAccY-Mean average |
|tBodyAcc.mean...Z          |tBodyAccZ-Mean average |
|tBodyAcc.std...X           |tBodyAccX-Std average |
|tBodyAcc.std...Y           |tBodyAccY-Std average |
|tBodyAcc.std...Z           |tBodyAccZ-Std average |
|tGravityAcc.mean...X       |tGravityAccX-Mean average |
|tGravityAcc.mean...Y       |tGravityAccY-Mean average |
|tGravityAcc.mean...Z       |tGravityAccZ-Mean average |
|tGravityAcc.std...X        |tGravityAccX-Std average |
|tGravityAcc.std...Y        |tGravityAccY-Std average |
|tGravityAcc.std...Z        |tGravityAccZ-Std average |
|tBodyAccJerk.mean...X      |tBodyAccJerkX-Mean average |
|tBodyAccJerk.mean...Y      |tBodyAccJerkY-Mean average |
|tBodyAccJerk.mean...Z      |tBodyAccJerkZ-Mean average |
|tBodyAccJerk.std...X       |tBodyAccJerkX-Std average |
|tBodyAccJerk.std...Y       |tBodyAccJerkY-Std average |
|tBodyAccJerk.std...Z       |tBodyAccJerkZ-Std average |
|tBodyGyro.mean...X         |tBodyGyroX-Mean average |
|tBodyGyro.mean...Y         |tBodyGyroY-Mean average |
|tBodyGyro.mean...Z         |tBodyGyroZ-Mean average |
|tBodyGyro.std...X          |tBodyGyroX-Std average |
|tBodyGyro.std...Y          |tBodyGyroY-Std average |
|tBodyGyro.std...Z          |tBodyGyroZ-Std average |
|tBodyGyroJerk.mean...X     |tBodyGyroJerkX-Mean average |
|tBodyGyroJerk.mean...Y     |tBodyGyroJerkY-Mean average |
|tBodyGyroJerk.mean...Z     |tBodyGyroJerkZ-Mean average |
|tBodyGyroJerk.std...X      |tBodyGyroJerkX-Std average |
|tBodyGyroJerk.std...Y      |tBodyGyroJerkY-Std average |
|tBodyGyroJerk.std...Z      |tBodyGyroJerkZ-Std average |
|tBodyAccMag.mean..         |tBodyAccMag-Mean average |
|tBodyAccMag.std..          |tBodyAccMag-Std average |
|tGravityAccMag.mean..      |tGravityAccMag-Mean average |
|tGravityAccMag.std..       |tGravityAccMag-Std average |
|tBodyAccJerkMag.mean..     |tBodyAccJerkMag-Mean average |
|tBodyAccJerkMag.std..      |tBodyAccJerkMag-Std average |
|tBodyGyroMag.mean..        |tBodyGyroMag-Mean average |
|tBodyGyroMag.std..         |tBodyGyroMag-Std average |
|tBodyGyroJerkMag.mean..    |tBodyGyroJerkMag-Mean average |
|tBodyGyroJerkMag.std..     |tBodyGyroJerkMag-Std average |
|fBodyAcc.mean...X          |fBodyAccX-Mean average |
|fBodyAcc.mean...Y          |fBodyAccY-Mean average |
|fBodyAcc.mean...Z          |fBodyAccZ-Mean average |
|fBodyAcc.std...X           |fBodyAccX-Std average |
|fBodyAcc.std...Y           |fBodyAccY-Std average |
|fBodyAcc.std...Z           |fBodyAccZ-Std average |
|fBodyAccJerk.mean...X      |fBodyAccJerkX-Mean average |
|fBodyAccJerk.mean...Y      |fBodyAccJerkY-Mean average |
|fBodyAccJerk.mean...Z      |fBodyAccJerkZ-Mean average |
|fBodyAccJerk.std...X       |fBodyAccJerkX-Std average |
|fBodyAccJerk.std...Y       |fBodyAccJerkY-Std average |
|fBodyAccJerk.std...Z       |fBodyAccJerkZ-Std average |
|fBodyGyro.mean...X         |fBodyGyroX-Mean average |
|fBodyGyro.mean...Y         |fBodyGyroY-Mean average |
|fBodyGyro.mean...Z         |fBodyGyroZ-Mean average |
|fBodyGyro.std...X          |fBodyGyroX-Std average |
|fBodyGyro.std...Y          |fBodyGyroY-Std average |
|fBodyGyro.std...Z          |fBodyGyroZ-Std average |
|fBodyAccMag.mean..         |fBodyAccMag-Mean average |
|fBodyAccMag.std..          |fBodyAccMag-Std average |
|fBodyBodyAccJerkMag.mean.. |fBodyBodyAccJerkMag-Mean average |
|fBodyBodyAccJerkMag.std..  |fBodyBodyAccJerkMag-Std average |
|fBodyBodyGyroMag.mean..    |fBodyBodyGyroMag-Mean average |
|fBodyBodyGyroMag.std..     |fBodyBodyGyroMag-Std average |
|fBodyBodyGyroJerkMag.mean..|fBodyBodyGyroJerkMag-Mean average |
|fBodyBodyGyroJerkMag.std.. |fBodyBodyGyroJerkMag-Std average |