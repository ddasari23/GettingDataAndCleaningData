## Code Book for Course Project of Getting data and Cleaning data 

Data was downlaoded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script run_analysis.R (found in th repo) cleans up the data and create useful tiny data sets for further analysis:

Steps: 
1. The training and test data sets are read into memory and mergedthem ( Used: read.table and rbind commands) 
2. The features.txt  was read and the measurements on the mean and standard deviation for each measurement were kept. 
3. The activity_labels.txt was read and each activities were given a name in the data set.
4. Labels are added to the data set with descriptive names.
5. The features with activity labels and subject IDs are merged and saved as Data.txt
6. For each subject and each activity the averaged is merged to form a second data set and saved as Data2.txt

Variables

testX - data in test/X_test.txt 

trainX - data in train/X_train.txt 

testSub - data in test/subject_test.txt

trainSub - data in test/subject_train.txt

testLabel - data in test/y_test.txt

trainLabel - data in train/y_train.txt

(Command : read.table was used for above lines)

X -  Merge data set of testData and trainData - Measurement data

S -  Merge data set of testSub and trainSub - Subjects 

Y -  Merge data set of testLabel and trainLabel - Labels

(Command: rbind was used for above lines )

features - data in features.txt

featuresList - Extracted names of columns from featuresList

keepColumns -  A logical vector of featuresList to extract data from X

activities - data in activity_labels.txt

Data1 - subsetted according to project description (cbind : S,Y and X)

S - No. of  unique subjects ; An - No. of activities ; Su - Unique subject ; Cn - Tidy data set columsn to mean ; Ds2 - Dataset 2 with average of each variable for each activity and subject

Results: 

Data.txt - 10299x68 data frame ; Data2.txt - 180x68 data frame  

Data.txt description:

The first column contains subject IDs- 1 and 30
The second column contains activity names
The last 66 columns are measurements

Data2.txt description: 

The first column contains subject IDs
The second column contains activity names
The averages for each of the 66 attributes are in columns 3-68
