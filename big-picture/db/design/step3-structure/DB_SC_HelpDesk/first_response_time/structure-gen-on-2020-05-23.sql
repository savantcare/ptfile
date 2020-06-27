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
-- Temporary table structure for view `first_response_time`
--

DROP TABLE IF EXISTS `first_response_time`;
/*!50001 DROP VIEW IF EXISTS `first_response_time`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `first_response_time` AS SELECT 
 1 AS `user_id`,
 1 AS `avg_response_time_in_min`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `first_response_time`
--

/*!50001 DROP VIEW IF EXISTS `first_response_time`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `first_response_time` AS (select `b`.`assignedId` AS `user_id`,(avg(time_to_sec(timediff(`b`.`response_time`,`b`.`open_time`))) / 60) AS `avg_response_time_in_min` from (select `a`.`assignedId` AS `assignedId`,(case when (`h`.`createdTimeZone` like '%IST%') then convert_tz(`h`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`h`.`createdTimeZone` like '%UTC%') then convert_tz(`h`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`h`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `open_time`,(case when (`c`.`createdTimeZone` like '%IST%') then convert_tz(`c`.`created_at`,'Asia/Kolkata','America/Los_Angeles') when (`c`.`createdTimeZone` like '%UTC%') then convert_tz(`c`.`created_at`,'UTC','America/Los_Angeles') else convert_tz(`c`.`created_at`,'America/Los_Angeles','America/Los_Angeles') end) AS `response_time` from ((((select `h`.`id` AS `id`,`h`.`assignedId` AS `assignedId`,min(`c`.`id`) AS `comment_id` from (`DB_SC_HelpDesk`.`userHelpdesk` `h` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on(((`c`.`ticketId` = `h`.`id`) and (`h`.`assignedId` = `c`.`userId`)))) group by `h`.`id`,`h`.`assignedId` order by `h`.`id`)) `a` join `DB_SC_HelpDesk`.`userHelpdeskComment` `c` on((`c`.`id` = `a`.`comment_id`))) join `DB_SC_HelpDesk`.`userHelpdesk` `h` on((`h`.`id` = `a`.`id`)))) `b` group by `b`.`assignedId` order by `b`.`assignedId`) */;
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
