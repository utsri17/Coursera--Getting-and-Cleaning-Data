# Project : Getting and Cleaning Data:

# The following tasks are implemented in this code :
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement.
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names.
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


#------------------------------------------------------------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------------------------------------------------------


# Step 1

current.wd <- get.filepath()
folder.dataset <- file.path(current.wd, "dataset", "UCI HAR Dataset")
folder.train <- file.path(folder.dataset, "train")
folder.test <- file.path(folder.dataset, "test")
xTrain <- read.table(file.path(folder.train, "X_train.txt"))
xTest <- read.table(file.path(folder.test, "X_test.txt"))
X <- rbind(xTrain, xTest)
subTrain <- read.table(file.path(folder.train, "subject_train.txt"))
subTest <- read.table(file.path(folder.test, "subject_test.txt"))
subjects <- rbind(subTrain, subTest)
yTrain <- read.table(file.path(folder.train, "y_train.txt"))
yTest <- read.table(file.path(folder.test, "y_test.txt"))
y <- rbind(yTrain, yTest)

# Step 2

features <- read.table(file.path(folder.dataset, "features.txt"))
features.selected <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, features.selected]  
names(X) <- features[features.selected, 2]
names(X) <- gsub("\\(|\\)", "", names(X))  
names(X) <- gsub("\\-", " ", names(X)) 
# Step 3

activities <- read.table(file.path(folder.dataset, "activity_labels.txt"))
y[,1] <- activities[y[,1], 2]
names(y) <- "activity" 

#Step 4

names(subjects) <- "subject"
data.cleaned <- cbind(subjects, y, X)

#Step 5


subjects.unique <- unique(subjects)[,1]
subjects.len <-  length(subjects.unique)
activities.len <- length(activities[,1])
columns <- ncol(data.cleaned)

data.tidy <- data.cleaned[1:(subjects.len * activities.len), ]
row <- 1
for (k in 1:subjects.len) {
	for (a in 1:activities.len) {
	  data.tidy[row, 1] <- subjects.unique[k]
	  data.tidy[row, 2] <- activities[a, 2]
		subset <- data.cleaned[data.cleaned$subject==k & 
                        data.cleaned$activity==activities[a, 2], ]
		data.tidy[row, 3:columns] <- colMeans(subset[, 3:columns])
		row <- row+1
	}
}

write.table(data.tidy, 
            file.path(current.wd, "Tidy_Dataset.txt"), 
            row.names = FALSE)

#---------------------------------------------------------
