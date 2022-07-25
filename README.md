# Data Cleaning with Shell

fauzan-8mHG

#### Description

A simple cleaning shell script to clean ecommerce activity data in `csv` format. 

There are 6 main steps in cleaning the data:

1. Stack two files using `csvstack`

2. Remove unnecessary column using `csvcut`

3. Remove unnecessary classification using `sed` and regular expressions

4. Split product by utilizing the nature of delimiter (insert delimiter symbol to split a column between two classifications) using `sed` and regular expression

5. Reorder column using `csvcut`

#### How to Run

- Make sure that `csvkit` and python has been installed in your shell

- Make sure that the database and `Data_clean.sh` are in the same folder

- Run `Data_clean.sh` in your shell. The shell will produce `2019-Oct-Nov-sample-clean.csv` as cleaned data

#### Future improvements

Make it universal so that the script cant be run in a regular basis (Example: Shell can be run regularly, and automatically choose the newest dataset and stack with the old ones)
