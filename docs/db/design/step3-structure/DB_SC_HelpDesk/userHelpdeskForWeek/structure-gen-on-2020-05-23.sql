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
-- Temporary table structure for view `userHelpdeskForWeek`
--

DROP TABLE IF EXISTS `userHelpdeskForWeek`;
/*!50001 DROP VIEW IF EXISTS `userHelpdeskForWeek`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `userHelpdeskForWeek` AS SELECT 
 1 AS `id`,
 1 AS `publicUniqueId`,
 1 AS `title`,
 1 AS `description`,
 1 AS `userId`,
 1 AS `behalfOf`,
 1 AS `typeId`,
 1 AS `assignedId`,
 1 AS `statusId`,
 1 AS `sourceId`,
 1 AS `created_at`,
 1 AS `createdTimeZone`,
 1 AS `updated_at`,
 1 AS `updateTimeZone`,
 1 AS `priority`,
 1 AS `urls`,
 1 AS `mail_remainder_sent_date_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `userHelpdeskForWeek`
--

/*!50001 DROP VIEW IF EXISTS `userHelpdeskForWeek`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `userHelpdeskForWeek` AS (select `userHelpdesk`.`id` AS `id`,`userHelpdesk`.`publicUniqueId` AS `publicUniqueId`,`userHelpdesk`.`title` AS `title`,`userHelpdesk`.`description` AS `description`,`userHelpdesk`.`userId` AS `userId`,`userHelpdesk`.`behalfOf` AS `behalfOf`,`userHelpdesk`.`typeId` AS `typeId`,`userHelpdesk`.`assignedId` AS `assignedId`,`userHelpdesk`.`statusId` AS `statusId`,`userHelpdesk`.`sourceId` AS `sourceId`,`userHelpdesk`.`created_at` AS `created_at`,`userHelpdesk`.`createdTimeZone` AS `createdTimeZone`,`userHelpdesk`.`updated_at` AS `updated_at`,`userHelpdesk`.`updateTimeZone` AS `updateTimeZone`,`userHelpdesk`.`priority` AS `priority`,`userHelpdesk`.`urls` AS `urls`,`userHelpdesk`.`mail_remainder_sent_date_time` AS `mail_remainder_sent_date_time` from `userHelpdesk` where (cast(`userHelpdesk`.`created_at` as date) >= (curdate() - interval 1 week))) */;
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
