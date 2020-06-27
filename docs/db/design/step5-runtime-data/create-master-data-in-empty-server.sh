#!/bin/bash

# Option 1
# Ref: https://stackoverflow.com/questions/10523415/execute-command-on-all-files-in-a-directory
#find ./ -name "*.sql" -type f - exec mysql -u root < {} \; 


# Option 2
for file in **/*.sql
do
    echo $file
    mysql -u stanford2008 --password=jaidurgama < $file
done
