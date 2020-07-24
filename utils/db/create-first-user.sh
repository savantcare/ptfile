#!/bin/bash


# The following needs to be defined from github web interface of actions as a secret

echo "Creating the user which ptclient will use to connect to ptserver"

mysql -u root --password="qwerty" -e "CREATE USER 'stanford2008'@'%' IDENTIFIED BY '$MYSQLPASS';"
mysql -u root --password="qwerty" -e "GRANT ALL PRIVILEGES ON *.* TO 'stanford2008'@'%';"
