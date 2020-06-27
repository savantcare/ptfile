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
-- Temporary table structure for view `openNoReply`
--

DROP TABLE IF EXISTS `openNoReply`;
/*!50001 DROP VIEW IF EXISTS `openNoReply`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `openNoReply` AS SELECT 
 1 AS `ticketId`,
 1 AS `title`,
 1 AS `comment`,
 1 AS `created_at`,
 1 AS `fullname`,
 1 AS `status`,
 1 AS `updated_at`,
 1 AS `typeId`,
 1 AS `assignedId`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `openNoReply`
--

/*!50001 DROP VIEW IF EXISTS `openNoReply`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `openNoReply` AS select `a`.`ticketId` AS `ticketId`,`a`.`title` AS `title`,`a`.`comment` AS `comment`,`a`.`created_at` AS `created_at`,`a`.`fullname` AS `fullname`,`a`.`status` AS `status`,`a`.`updated_at` AS `updated_at`,`a`.`typeId` AS `typeId`,`a`.`assignedId` AS `assignedId` from (select `h`.`id` AS `ticketId`,`h`.`title` AS `title`,`h`.`description` AS `comment`,`h`.`created_at` AS `created_at`,concat_ws(' ',`u`.`firstName`,`u`.`lastName`) AS `fullname`,'0' AS `status`,`h`.`updated_at` AS `updated_at`,`h`.`typeId` AS `typeId`,`h`.`assignedId` AS `assignedId` from (`DB_SC_HelpDesk`.`userHelpdesk` `h` join `DB_SCEMR_PROD`.`users` `u` on((`u`.`id` = `h`.`userId`))) where ((`h`.`statusId` <> 2) and (not(`h`.`id` in (select distinct `c`.`ticketId` from `DB_SC_HelpDesk`.`userHelpdeskComment` `c` where (`c`.`isPublish` = 1)))))) `a` */;
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
