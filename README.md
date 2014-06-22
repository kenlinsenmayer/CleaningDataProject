CleaningDataProject
===================

###Course project for Getting and Cleaning Data Course

run_analysis.R is the main file
This script reads in the training and test data collected from the accelerometers from the Samsung Galaxy S smartphone per the Course assignment.  The script reads in the labels for the data sets from the "subject_train.txt" and
"subject_test.txt" files and applies that to the data.  The script then selects the variables with either
"std()" or "mean()" in the name to focus on just the standard deviation and mean values.  The script then adds the
subject and activity values for each observation, mergers the training and test data into one big dataframe
(labeled "data"), and aggregates the data based on the Activity and Subject.  Finally, the script saves the
new data in "tidy_data.txt", a tab-delimited text file

tidy_data.txt is the resulting tab-delimited text file resulting from running "run_analysis.txt"

README.md is this file

CodeBook.md is the codebook describing the data in "tidy_data.txt"


