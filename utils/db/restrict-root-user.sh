#!/bin/bash

mysql -u root --password="qwerty" -e "DELETE FROM mysql.user WHERE Host = '%' AND User = 'root'"
