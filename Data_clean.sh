# Author: Fauzan Kemal Musthofa
# Description: Simple stacking and cleaning ecommerce activity data in October-November 2019


#Stack two files
csvstack ./2019-Oct-sample.csv ./2019-Nov-sample.csv > ./2019-Oct-Nov-sample.csv

#Filter database (keep purchase activity only)
csvgrep -c  3 -m purchase ./2019-Oct-Nov-sample.csv > ./2019-Oct-Nov-sample-edit.csv 

#remove 1st column
csvcut -c 2-8 ./2019-Oct-Nov-sample-edit.csv > ./2019-Oct-Nov-sample-edit2.csv 

#remove middle category - 3 column
sed -r  's/(,)([a-z_]+[.])([a-z_]+[.])([a-z_]+)(,)/\1\2\4\5/g' ./2019-Oct-Nov-sample-edit2.csv > ./2019-Oct-Nov-sample-edit3.csv 

#remove middle category - 4 column
sed -r  's/(,)([a-z_]+[.])([a-z_]+[.])([a-z_]+[.])([a-z_]+)(,)/\1\2\5\6/g' ./2019-Oct-Nov-sample-edit3.csv > ./2019-Oct-Nov-sample-edit4.csv 

#add new header
sed -r  's/category_code/category,product_name/g' ./2019-Oct-Nov-sample-edit4.csv > ./2019-Oct-Nov-sample-edit5.csv

#split category and product data
sed -r  's/(,)([a-z_]+)([.])([a-z_]+)(,)/\1\2,\4\5/g' ./2019-Oct-Nov-sample-edit5.csv > ./2019-Oct-Nov-sample-edit6.csv

#reorder column
csvcut -c 1,2,3,4,7,8,5,6 ./2019-Oct-Nov-sample-edit6.csv > ./2019-Oct-Nov-sample-clean.csv

#Check dataset 
cat ./2019-Oct-Nov-sample-clean.csv | wc
cat ./2019-Oct-Nov-sample-clean.csv | grep electronics | grep smartphone| awk -F ',' '{print $5}'| sort | uniq -c | sort -nr