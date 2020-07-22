#!/bin/bash

MYSQL_USER="stanford2008"
MYSQL_PASSWORD="jaidurgama"

/gt/sc-prog-repos/ptfile/utils/db/create-first-user.sh
/gt/sc-prog-repos/ptfile/utils/db/restrict-root-user.sh

# Find comand to run DB init scripts inside ptclient/cts/

## Step 1: Create DB scripts 
for file in $(find /gt/sc-prog-repos/ptfile/ptclient/cts/ -type f -name "create-db-*.sql" -print)
do
    echo "== executing create DB $i";
    mysql -u $DB_USER --password=$DB_PASS < $file 
done

## Step 2: structure of tables
for file in $(find /gt/sc-prog-repos/ptfile/ptclient/cts/ -type f -name "structure-gen-*.sql" -print)
do
    echo "== executing create DB $i";
    mysql -u $DB_USER --password=$DB_PASS < $file 
done

## Mock data
for file in $(find /gt/sc-prog-repos/ptfile/ptclient/cts/ -type f -name "mock-data*.sql" -print)
do
    echo "== executing create DB $i";
    mysql -u $DB_USER --password=$DB_PASS < $file 
done
