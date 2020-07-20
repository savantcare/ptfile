#!/bin/bash

mysql -u root -p -e "DELETE FROM `user` WHERE `user`.`Host` = \'%\' AND `user`.`User` = \'root\'"