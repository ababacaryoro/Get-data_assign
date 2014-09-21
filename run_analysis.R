setwd("D:\\Coursera\\Data science\\Getting and Cleaning Data\\Week 3")

#--- Creating a data folder
if(!file.exists("./data")) { dir.create("./data")}

#--- Reading labels
varLab <- read.table("./data/features.txt")
colnames(varLab) <- c("id", "varLab")
activLabel <- read.table("./data/activity_labels.txt", col.names = c("id", "activLabel"))

#--- Assembling test data sets (both, variables and signals)
# Note : labels are set simultaneously
test <- cbind(read.table("./data/test/subject_test.txt", col.names ="idSubject"),
              activity = factor(read.table("./data/test/y_test.txt", col.names = "activity")[,"activity"], levels = activLabel$id, labels = activLabel$activLabel) ,
              read.table("./data/test/X_test.txt", col.names = varLab$varLab),
              read.table("./data/test/Inertial Signals/total_acc_x_test.txt"),
              read.table("./data/test/Inertial Signals/total_acc_y_test.txt"),
              read.table("./data/test/Inertial Signals/total_acc_z_test.txt"),
              read.table("./data/test/Inertial Signals/body_acc_x_test.txt"),
              read.table("./data/test/Inertial Signals/body_acc_y_test.txt"),
              read.table("./data/test/Inertial Signals/body_acc_z_test.txt"),
              read.table("./data/test/Inertial Signals/body_gyro_x_test.txt"),
              read.table("./data/test/Inertial Signals/body_gyro_y_test.txt"),
              read.table("./data/test/Inertial Signals/body_gyro_z_test.txt"))
#--- Assembling train data sets (both, variables and signals)
# Note : labels are set simultaneously
train <- cbind(read.table("./data/train/subject_train.txt", col.names ="idSubject"),
              activity = factor(read.table("./data/train/y_train.txt", col.names = "activity")[,"activity"], levels = activLabel$id, labels = activLabel$activLabel) ,
              read.table("./data/train/X_train.txt", col.names = varLab$varLab),
              read.table("./data/train/Inertial Signals/total_acc_x_train.txt"),
              read.table("./data/train/Inertial Signals/total_acc_y_train.txt"),
              read.table("./data/train/Inertial Signals/total_acc_z_train.txt"),
              read.table("./data/train/Inertial Signals/body_acc_x_train.txt"),
              read.table("./data/train/Inertial Signals/body_acc_y_train.txt"),
              read.table("./data/train/Inertial Signals/body_acc_z_train.txt"),
              read.table("./data/train/Inertial Signals/body_gyro_x_train.txt"),
              read.table("./data/train/Inertial Signals/body_gyro_y_train.txt"),
              read.table("./data/train/Inertial Signals/body_gyro_z_train.txt"))
#--- Merging on one database
data.merged <- rbind(train, test)
#--- Extracting measurements on the mean and standard deviation for each measurement
# Looking for variables to keep

#varExtract <- c(grep("mean()", varLab$varLab, ignore.case=F, value =TRUE, fixed = T),
#                grep("std()", varLab$varLab, ignore.case=F, value =TRUE, fixed = T))
varExtract <- c(grep("mean.", colnames(data.merged), ignore.case=F, value =TRUE, fixed = T),
                grep("std", colnames(data.merged), ignore.case=F, value =TRUE, fixed = T))

# Extracting variables
dataExtract <- data.merged[,c("idSubject", "activity",varExtract)]
#--- Creating independent tidy data set with the average of each variable for each activity and each subject
library(reshape2)
dataExtract.melt <- melt(dataExtract, id = c("idSubject", "activity") , measure.vars = varExtract)
tidyData <- dcast(dataExtract.melt, idSubject + activity ~ variable, mean)

#--- Exporting to .txt format

write.table(tidyData, file = "./data/tidyData.txt", row.name=FALSE)

#************************************ The End *********************************************#
