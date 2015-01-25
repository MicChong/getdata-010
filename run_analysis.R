## Read in the training data
trainFilename <- "./UCI HAR Dataset/train/X_train.txt"
testFilename <- "./UCI HAR Dataset/test/X_test.txt"
labelsFilename <- "./UCI HAR Dataset/features.txt"

labels <- read.table(labelsFilename)
labels <- labels[,2]
labels <-as.character(labels)

allData <- read.table(trainFilename, col.names=labels)
allData <- rbind(allData, read.table(testFilename, col.names=labels))

## Remove from memory
rm(trainFilename)
rm(testFilename)
rm(labelsFilename)

meanIDX <- grep(labels, pattern="mean\\(\\)")
stdIDX <- grep(labels, pattern="std\\(\\)")

requiredIDX <- sort(c(meanIDX, stdIDX))

## Remove from memory
rm(meanIDX)
rm(stdIDX)

## Extract required columns
requiredData <- allData[, requiredIDX]

## Prepare the new column names
newLabels <- sub("\\.\\.", "", names(requiredData))
newLabels <- sub("\\.mean", ".Mean", newLabels)
newLabels <- sub("\\.std", ".Std", newLabels)
newLabels <- sub("\\.", "", newLabels)
newLabels <- sub("\\.", "", newLabels)
names(requiredData) <- newLabels

## Calculate the average of each column
finalTidyData <- sapply(requiredData, mean)
finalTidyData <- as.data.frame(finalTidyData)
names(finalTidyData) <- c("mean")
finalTidyData <- t(finalTidyData)

## Output to a file
write.table(finalTidyData, "finalTidyData.txt", row.name=FALSE, sep=", ")

## Remove from memory
rm(labels)
rm(newLabels)
rm(requiredIDX)
