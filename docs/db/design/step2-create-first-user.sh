#!/bin/bash
mysql -u root -p -e "CREATE USER 'stanford2008'@'%' IDENTIFIED BY 'jaidurgama';"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO 'stanford2008'@'%';"
