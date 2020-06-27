#!/bin/bash

# Step1 : Copy to the /dev/shm so the file are available to mysql docker
cp execute-in-mysql-container.sh /dev/shm
cp -rf data /dev/shm
cp -rf structure /dev/shm

# Execute the script on the mysql container
docker exec -ti scsdmysqlmasterforproduction_server_1 /dev/shm/execute-in-mysql-container-to-init-mysqld.sh
