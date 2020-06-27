#!/bin/bash

TIMESTAMP=$(date +"%F")
BACKUP_DIR="./"
MYSQL_USER="root"
MYSQL=/usr/bin/mysql
MYSQL_PASSWORD="jaikalima"
MYSQLDUMP=/usr/bin/mysqldump
 
mkdir -p "$BACKUP_DIR"
 
allDatabases=`$MYSQL --user=$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema)" | grep "DB_SC"`

# Not writing the time stamp in the file name so it is easy to know if there is a diff using git diff or gitlab web interface.

# --skip-dump-date  has been given since otherwise git diff will show that the file has changed since the file have the statement
# --- Dump completed on 2020-01-29  9:10:06
# +-- Dump completed on 2020-01-29  9:11:14

when=$(date +%F);

for db in $allDatabases; do
    echo "== Working on $db =="
    mkdir $db

    echo "create database $db" > $db/create-db-gen-on-$when.sql
    
    allTableNames=`mysql $db -u $MYSQL_USER -p$MYSQL_PASSWORD -N -e 'show tables'`

    for table in $allTableNames; do
	mkdir $db/$table
	echo "use $db;" > $db/$table/structure-gen-on-$when.sql
	$MYSQLDUMP $db --force --opt --user=$MYSQL_USER -p$MYSQL_PASSWORD $table --no-data --skip-dump-date >> "$BACKUP_DIR/$db/$table/structure-gen-on-$when.sql"
    done
done
