#!/bin/bash


# The following needs to be defined from github web interface of actions as a secret
MYSQLPASS=jaidurgama 

if [[ -z "$MYSQLPASS" ]]; then
    echo "Must provide MYSQLPASS in environment" 1>&2
    exit 1
fi

mysql -u root --password="qwerty" -e "CREATE USER 'stanford2008'@'%' IDENTIFIED BY '$MYSQLPASS';"
mysql -u root --password="qwerty" -e "GRANT ALL PRIVILEGES ON *.* TO 'stanford2008'@'%';"
