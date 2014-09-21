## README
========================================================

Before running the script, a folder named **data** must be created in the working directory. After that, all other folder containing data have to be moved in the data folder : the train and **test folder**, including other text files (**features.txt**, **activity_labels.txt**, ...).
The script first reads text files related to train and merge them into one database called **train**. It does the same task with the test files and creates a database called **test**. Then it merges the train et test database into one database called **data.merged**. After that, it just extract variables recording means and standard deviation. 
At the end, it creates a database which name is **tidyData**. This database contains the average of each variable for each activity and each subject. 
