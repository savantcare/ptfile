use DB_SC_HelpDesk;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_HelpDesk
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `performance_report_hdr_week`
--

DROP TABLE IF EXISTS `performance_report_hdr_week`;
/*!50001 DROP VIEW IF EXISTS `performance_report_hdr_week`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `performance_report_hdr_week` AS SELECT 
 1 AS `user_id`,
 1 AS `role`,
 1 AS `Fullname`,
 1 AS `total`,
 1 AS `resolved`,
 1 AS `reopen`,
 1 AS `avg_response`,
 1 AS `avg_resolution_time_in_min`,
 1 AS `avg_response_time_in_min`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `performance_report_hdr_week`
--

/*!50001 DROP VIEW IF EXISTS `performance_report_hdr_week`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `performance_report_hdr_week` AS (select `a`.`assignedId` AS `user_id`,`u`.`roleID` AS `role`,`a`.`Fullname` AS `Fullname`,cast(`p`.`total` as unsigned) AS `total`,cast(ifnull(`p`.`resolved`,0) as unsigned) AS `resolved`,cast(`p`.`reopen` as unsigned) AS `reopen`,`p`.`avg_response` AS `avg_response`,cast(round(ifnull(`r`.`avg_resolution_time_in_min`,0.00),2) as unsigned) AS `avg_resolution_time_in_min`,cast(round(ifnull(`t`.`avg_response_time_in_min`,0.00),2) as unsigned) AS `avg_response_time_in_min` from ((((((select distinct `h`.`assignedId` AS `assignedId`,concat(`u`.`firstName`,' ',`u`.`lastName`) AS `Fullname` from (`DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` join `DB_SCEMR_PROD`.`users` `u` on(((`u`.`id` = `h`.`assignedId`) and (`u`.`roleID` <> 11)))))) `a` left join (select `h`.`assignedId` AS `user_id`,count(0) AS `total`,sum((case when (`h`.`statusId` = 2) then 1 else 0 end)) AS `resolved`,ifnull(sum(`a`.`reopen`),0) AS `reopen`,ifnull(round((`c`.`comment_count` / count(0)),2),0) AS `avg_response` from ((`DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` left join (select `DB_SC_HelpDesk`.`helpdeskActivityLog`.`requestId` AS `requestId`,count(0) AS `reopen` from `DB_SC_HelpDesk`.`helpdeskActivityLog` where ((`DB_SC_HelpDesk`.`helpdeskActivityLog`.`fieldName` = 'status') and (`DB_SC_HelpDesk`.`helpdeskActivityLog`.`oldValue` = 'closed') and (`DB_SC_HelpDesk`.`helpdeskActivityLog`.`newValue` = 'open')) group by `DB_SC_HelpDesk`.`helpdeskActivityLog`.`requestId`) `a` on((`h`.`id` = `a`.`requestId`))) left join (select `c`.`userId` AS `userId`,count(`c`.`ticketId`) AS `comment_count` from (`DB_SC_HelpDesk`.`userHelpdeskComment` `c` join `DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` on(((`h`.`id` = `c`.`ticketId`) and (`c`.`userId` = `h`.`assignedId`)))) group by `c`.`userId` order by `c`.`userId`) `c` on((`c`.`userId` = `h`.`assignedId`))) group by `h`.`assignedId` order by `resolved`) `p` on((`a`.`assignedId` = `p`.`user_id`))) left join (select `temp_table`.`assignedId` AS `user_id`,(avg(time_to_sec(timediff(`temp_table`.`closed_time`,`temp_table`.`open_time`))) / 60) AS `avg_resolution_time_in_min` from (select `latest_data`.`requestId` AS `requestId`,`h`.`assignedId` AS `assignedId`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,`latest_data`.`closed_time` AS `closed_time` from (`DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` join (select `a`.`requestId` AS `requestId`,(case when (`a`.`changeTimeZone` like '%IST%') then convert_tz(`a`.`changeOn`,'Asia/Kolkata','America/Los_Angeles') when (`a`.`changeTimeZone` like '%UTC%') then convert_tz(`a`.`changeOn`,'UTC','America/Los_Angeles') else convert_tz(`a`.`changeOn`,'America/Los_Angeles','America/Los_Angeles') end) AS `closed_time` from (`DB_SC_HelpDesk`.`helpdeskActivityLog` `a` join (select `test`.`tkt_id` AS `tkt_id`,max(`a`.`id`) AS `id` from (((select `userHelpdeskForWeek`.`id` AS `tkt_id` from `DB_SC_HelpDesk`.`userHelpdeskForWeek` where (`userHelpdeskForWeek`.`statusId` = 2))) `test` left join `DB_SC_HelpDesk`.`helpdeskActivityLog` `a` on((`test`.`tkt_id` = `a`.`requestId`))) where (`a`.`fieldName` = 'status') group by `test`.`tkt_id` having (max(`a`.`id`) is not null)) `test` on(((`a`.`id` = `test`.`id`) and (`a`.`newValue` = 'closed'))))) `latest_data` on((`latest_data`.`requestId` = `h`.`id`)))) `temp_table` group by `temp_table`.`assignedId` order by `temp_table`.`assignedId`) `r` on((`a`.`assignedId` = `r`.`user_id`))) left join (select `b`.`assignedId` AS `user_id`,(avg(time_to_sec(timediff(`b`.`response_time`,`b`.`open_time`))) / 60) AS `avg_response_time_in_min` from (select `a`.`assignedId` AS `assignedId`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,(case when (`c`.`createdTimeZone` like '%IST%') then convert_tz(`c`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`c`.`createdTimeZone` like '%UTC%') then convert_tz(`c`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`c`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `response_time` from ((((select `h`.`id` AS `id`,`h`.`assignedId` AS `assignedId`,min(`c`.`id`) AS `comment_id` from (`DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on(((`c`.`ticketId` = `h`.`id`) and (`h`.`assignedId` = `c`.`userId`)))) group by `h`.`id`,`h`.`assignedId` order by `h`.`id`)) `a` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on((`c`.`id` = `a`.`comment_id`))) join `DB_SC_HelpDesk`.`userHelpdeskForWeek` `h` on((`h`.`id` = `a`.`id`)))) `b` group by `b`.`assignedId` order by `b`.`assignedId`) `t` on((`a`.`assignedId` = `t`.`user_id`))) left join `DB_SCEMR_PROD`.`users` `u` on((`a`.`assignedId` = `u`.`id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
