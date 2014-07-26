#Code Book

This code book that describes the variables, the data, and any transformations or work that was performed to clean up the data.

## Variables

| Variable      | Description   |
| ------------- |---------------|
| names | has all column names from features.txt |
| x_test | has data from X_test.txt |
| x_train | has data from X_train.txt |

To x_test and x_train, I used cbind to add Activity and Subject respectivly from \*/y_\*.txt and \*/subject_\*.txt.


1) Read all files
2) Add column Subject and Label
3) Merge data