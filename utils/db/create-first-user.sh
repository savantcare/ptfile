#!/bin/bash


# The following needs to be defined from github web interface of actions as a secret

echo "Creating the user which ptclient will use to connect to ptserver"

mysql -u root -pqwerty -e "CREATE USER 'stanford2008'@'%' IDENTIFIED BY 'jaidurgama';"
mysql -u root -pqwerty -e "GRANT ALL PRIVILEGES ON *.* TO 'stanford2008'@'%';"
