# Code Book

This code book contains detailed information about the data and  variables used in the Project


## 1. Dataset Information 

**Human Activity Recognition Using Smartphones**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window. The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain 

## 2. The Data Set

The dataset includes the following files:

- `README.txt`
- `features_info.txt`: Shows information about the variables used on the feature vector.
- `features.txt`: List of all features.
- `activity_labels.txt`: Links the class labels with their activity name.
- `train/X_train.txt`: Training set.
- `train/y_train.txt`: Training labels.
- `test/X_test.txt`: Test set.
- `test/y_test.txt`: Test labels.




## 3. Variable Description
The below variables are used in the code :

1. current.wd : Current file directory
2. folder.dataset : File Path for dataset folder
3. folder.train : File Path for train folder
4. folder.test  : File Path for test folder
5. xTrain : Variable to store Training Data
6. xTest : Variable to store Test Data
7. X : Binded Data Frame
8. subTrain : Variable to store Subject Train Data
9. subTest : Variable to store Subject Test Data
10. yTrain : Variable to store Training Data
11. yTest : Variable to store Test Data
12. Y : Binded Data Frame
13. features : Store Features data
14. features.selected : Grep Mean and Std features only
15. activities : Store activities data
16. data.cleaned : Merged and Cleaned data
17. columns: Number of columns 
18. data.tidy : Tidy dataset wth avg Values
19. k : Loop Variable
20. a : Loop Varaible
