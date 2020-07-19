#!/bin/bash

if [[ -z "$MYSQLPASS" ]]; then
    echo "Must provide MYSQLPASS in environment" 1>&2
    exit 1
fi

mysql -u root -p -e "CREATE USER 'stanford2008'@'%' IDENTIFIED BY '$MYSQLPASS';"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO 'stanford2008'@'%';"