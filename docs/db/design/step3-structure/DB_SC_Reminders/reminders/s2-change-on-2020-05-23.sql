# Why
# 1. There is no delete related 4 fields since it is a time travel DB
# 2. There is no need for firstParentID and discontinue related 4 fields and since it will be MariDB temporal feature

use DB_SC_Reminders;

ALTER TABLE `reminders`
  DROP `firstParentID`,
  DROP `deletedByUID`,
  DROP `deletedOnDateTime`,
  DROP `deletedTimeZone`,
  DROP `deletedFromIPAddress`,
  DROP `discontinuedByUID`,
  DROP `discontinuedOnDateTime`,
  DROP `discontinuedTimeZone`,
  DROP `originId`;

# Why
# 1. ipaddress and created (3 fields) needs to be recorded both during creation and deletion
ALTER TABLE `reminders` CHANGE `discontinuedFromIPAddress` `recordChangedFromIPAddress` VARCHAR(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;
ALTER TABLE `reminders` CHANGE `createdBy` `recordChangedByUID` INT(11) UNSIGNED NULL DEFAULT NULL;
ALTER TABLE `reminders` CHANGE `createdOn` `recordChangedOnDateTime` DATETIME NULL DEFAULT NULL;
ALTER TABLE `reminders` CHANGE `createdTimeZone` `recordChangedOnTimeZone` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;

# Why
# I do not want to set change on date time from app and let mysql take care of it
ALTER TABLE `reminders` CHANGE `recordChangedOnDateTime` `recordChangedOnDateTime` DATETIME NULL DEFAULT CURRENT_TIMESTAMP;

# Organize the sequence
ALTER TABLE `reminders` CHANGE `notes` `notes` VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL AFTER `description`;
ALTER TABLE `reminders` CHANGE `priority` `priority` INT(4) NULL DEFAULT NULL AFTER `notes`;

# More readable
ALTER TABLE `reminders` CHANGE `reminderStartDate` `remindMeOnDate` DATETIME NOT NULL;

# Why?
# Enabled temporal DB
ALTER TABLE reminders ADD SYSTEM VERSIONING;
# Ref: https://mariadb.com/kb/en/temporal-data-tables/#adding-or-removing-system-versioning-tofrom-a-table

# How to see the extra columns created give the command?
# SELECT value, ROW_START, ROW_END FROM reminders;
# Ref: https://mariadb.com/kb/en/temporal-data-tables/

# How to see all records that were also deleted?
# SELECT * FROM reminders FOR SYSTEM_TIME ALL;
# Ref: https://mariadb.com/kb/en/temporal-data-tables/#querying-historical-data

# How to see rows between start and end time?
# SELECT * FROM reminders FOR SYSTEM_TIME BETWEEN (NOW() - INTERVAL 1 YEAR) AND NOW();

/* TODO:

 Need to answer following questions for better design of all the other tables

 Q1) How should recordChangeOnDateTime time be stored?
 History: The dateTime and TimeZone was stored seperately due to 2038 problem as expplained in: https://stackoverflow.com/questions/2012589/php-mysql-year-2038-bug-what-is-it-how-to-solve-it
 Option1: Let mysql manage it set recordChangeOnDateTime to update_timestamp internal feature of mariaDB
 Reasons:
 1. Storing timezone makes no change since it can be changed by the user on the client. IP address given the location of the user better then the time zone. IP address is also not accurate 100% due to use of VPN. But is more trackable then browser TZ change.
 2. Storing in UTC will solve probkems related to PST and PDT. The timestamp column only supports dates 1970-01-01 00:00:01 to 2038-01-19 03:14:07 UTC, due to a limitation. Internally a MySQL timestamp column is stored as UTC but when selecting a date MySQL will automatically convert it to the current session timezone

Current plan:
1. Set the default value of recordChangeOnDateTime to CURRENT_TIMESTAMP and no need to store time_zone


 Q2) How should other application realated time be stored?
 Seems like UTC is a easier option

 Q3) Can this table be partitioned?
 While primary keys are supported on partitioned tables, foreign keys referencing partitioned tables are not supported. (Foreign key references from a partitioned table to some other table are supported
 Ref: https://mariadb.com/kb/en/temporal-data-tables/+comments/3678
 https://mariadb.com/kb/en/temporal-data-tables/#storing-the-history-separately

 Q4) Can the user who created it be stored coming from mysql user and the app users mapped to mysql user 

*/
