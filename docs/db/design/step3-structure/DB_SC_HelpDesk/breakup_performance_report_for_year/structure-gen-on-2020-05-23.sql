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
-- Temporary table structure for view `breakup_performance_report_for_year`
--

DROP TABLE IF EXISTS `breakup_performance_report_for_year`;
/*!50001 DROP VIEW IF EXISTS `breakup_performance_report_for_year`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `breakup_performance_report_for_year` AS SELECT 
 1 AS `assignedId`,
 1 AS `userId`,
 1 AS `id`,
 1 AS `open_time`,
 1 AS `response_time`,
 1 AS `response_duration`,
 1 AS `closed_time`,
 1 AS `resolution_duration`,
 1 AS `response`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `breakup_performance_report_for_year`
--

/*!50001 DROP VIEW IF EXISTS `breakup_performance_report_for_year`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `breakup_performance_report_for_year` AS (select `a`.`assignedId` AS `assignedId`,`a`.`userId` AS `userId`,`a`.`id` AS `id`,`a`.`open_time` AS `open_time`,`a`.`response_time` AS `response_time`,time_format(sec_to_time(timestampdiff(SECOND,`a`.`open_time`,`a`.`response_time`)),'%H:%i') AS `response_duration`,`a`.`closed_time` AS `closed_time`,time_format(sec_to_time(timestampdiff(SECOND,`a`.`open_time`,`a`.`closed_time`)),'%H:%i') AS `resolution_duration`,`a`.`response` AS `response` from (select `h`.`assignedId` AS `assignedId`,`c`.`userId` AS `userId`,`h`.`id` AS `id`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,`e`.`response_time` AS `response_time`,`d`.`closed_time` AS `closed_time`,`c`.`response` AS `response` from (((`DB_SC_HelpDesk`.`userHelpdeskForYear` `h` left join (select `c`.`userId` AS `userId`,`c`.`ticketId` AS `ticketId`,count(`c`.`ticketId`) AS `response` from (`DB_SC_HelpDesk`.`userHelpdeskComment` `c` join `DB_SC_HelpDesk`.`userHelpdeskForYear` `h` on(((`h`.`id` = `c`.`ticketId`) and (`c`.`userId` = `h`.`assignedId`)))) group by `c`.`userId`,`c`.`ticketId` order by `c`.`userId`,`c`.`ticketId`) `c` on((`c`.`ticketId` = `h`.`id`))) left join (select `h`.`assignedId` AS `assignedId`,`latest_data`.`requestId` AS `ticketId`,`latest_data`.`closed_time` AS `closed_time` from (`DB_SC_HelpDesk`.`userHelpdeskForYear` `h` join (select `a`.`requestId` AS `requestId`,(case when (`a`.`changeTimeZone` like '%IST%') then convert_tz(`a`.`changeOn`,'Asia/Kolkata','America/Los_Angeles') when (`a`.`changeTimeZone` like '%UTC%') then convert_tz(`a`.`changeOn`,'UTC','America/Los_Angeles') else convert_tz(`a`.`changeOn`,'America/Los_Angeles','America/Los_Angeles') end) AS `closed_time` from (`DB_SC_HelpDesk`.`helpdeskActivityLog` `a` join (select `test`.`tkt_id` AS `tkt_id`,max(`a`.`id`) AS `id` from (((select `userHelpdeskForYear`.`id` AS `tkt_id` from `DB_SC_HelpDesk`.`userHelpdeskForYear` where (`userHelpdeskForYear`.`statusId` = 2))) `test` left join `DB_SC_HelpDesk`.`helpdeskActivityLog` `a` on((`test`.`tkt_id` = `a`.`requestId`))) where (`a`.`fieldName` = 'status') group by `test`.`tkt_id` having (max(`a`.`id`) is not null)) `test` on(((`a`.`id` = `test`.`id`) and (`a`.`newValue` = 'closed'))))) `latest_data` on((`latest_data`.`requestId` = `h`.`id`)))) `d` on((`d`.`ticketId` = `h`.`id`))) left join (select `a`.`assignedId` AS `assignedId`,`h`.`id` AS `ticketId`,(case when (`c`.`createdTimeZone` like '%IST%') then convert_tz(`c`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`c`.`createdTimeZone` like '%UTC%') then convert_tz(`c`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`c`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `response_time` from ((((select `h`.`id` AS `id`,`h`.`assignedId` AS `assignedId`,min(`c`.`id`) AS `comment_id` from (`DB_SC_HelpDesk`.`userHelpdeskForYear` `h` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on(((`c`.`ticketId` = `h`.`id`) and (`h`.`assignedId` = `c`.`userId`)))) group by `h`.`id`,`h`.`assignedId` order by `h`.`id`)) `a` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on((`c`.`id` = `a`.`comment_id`))) join `DB_SC_HelpDesk`.`userHelpdeskForYear` `h` on((`h`.`id` = `a`.`id`)))) `e` on((`e`.`ticketId` = `h`.`id`)))) `a`) */;
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
