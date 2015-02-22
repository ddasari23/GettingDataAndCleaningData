
##Getting data and cleaning data - Project 1 
## Deepika Dasari 
## Change to Aprropriate folder 

##Step 1: Read data sets and combine
##Read Data Sets 
testX <- read.table("test/X_test.txt")
trainX <- read.table("train/X_train.txt")
testSub <- read.table("test/subject_test.txt")
trainSub <- read.table("train/subject_train.txt")
testLabel <- read.table("test/y_test.txt")
trainLabel <- read.table("train/y_train.txt")


## Combine Data sets 
X <- rbind(testX, trainX)
S <- rbind(testSub, trainSub)
Y <- rbind(testLabel, trainLabel)


## Step 2: Logical Vector to keep only std and mean columns
## Step 3 : Assign column names for data using feature text 
features <- read.table("features.txt", stringsAsFactors=FALSE)
featuresList <- features$V2
keepColumns <- grepl("(std|mean[^F])", featuresList, perl=TRUE)
X <- X[, keepColumns]
names(X) <- featuresList[keepColumns]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

## Step 4: Appropriately labels the data set with descriptive variable names

activities <- read.table("activity_labels.txt")
activities[,2] = gsub("_", "", tolower(as.character(activities[,2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity" ## Add activity label

names(S) <- "subject"
Data1 <- cbind(S, Y, X)
write.table(Data1, "Data1.txt")

## Step 5: Second independent tidy data set with the average of each variable for each activity and each subject.
Su = unique(S)[,1]
Sn = length(Su)
An = length(activities[,1])
Cn = length(names(Data1))
ds2 = Data1[ 1:(Sn*An), ]

row = 1
for (s in 1:Sn) {
  for (a in 1:An) {
    ds2[row,1] = Su[s]
    ds2[row,2] = activities[a, 2]
    tmp <- Data1[Data1$subject==s & Data1$activity==activities[a,2],]
    ds2[row, 3:Cn] <- colMeans(tmp[, 3:Cn])
    row = row + 1
  }
}

write.table(ds2, "Data2.txt")


