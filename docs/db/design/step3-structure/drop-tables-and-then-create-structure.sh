#!/bin/bash

# Create the DB if not exist
# Ref: https://stackoverflow.com/questions/51654041/loop-through-all-files-in-a-directory-and-subdirectories-using-bash
for file in $(find . -maxdepth 2 -type f -name "*.sql" -print)
do
    echo "== executing create DB $i";
    mysql -u $DB_USER --password=$DB_PASS < $file 
done


for file in $(find . -mindepth 3 -type f -name "*.sql" -print)
do
    echo "Executing the file $file"
    mysql -u $DB_USER --password=$DB_PASS < $file 
done
