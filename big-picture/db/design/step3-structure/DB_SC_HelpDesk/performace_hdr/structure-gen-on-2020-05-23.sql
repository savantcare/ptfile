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
-- Temporary table structure for view `performace_hdr`
--

DROP TABLE IF EXISTS `performace_hdr`;
/*!50001 DROP VIEW IF EXISTS `performace_hdr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `performace_hdr` AS SELECT 
 1 AS `user_id`,
 1 AS `total`,
 1 AS `resolved`,
 1 AS `reopen`,
 1 AS `avg_response`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `performace_hdr`
--

/*!50001 DROP VIEW IF EXISTS `performace_hdr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `performace_hdr` AS (select `h`.`assignedId` AS `user_id`,count(0) AS `total`,sum((case when (`h`.`statusId` = 2) then 1 else 0 end)) AS `resolved`,ifnull(sum(`a`.`reopen`),0) AS `reopen`,ifnull(round((`c`.`comment_count` / count(0)),2),0) AS `avg_response` from ((`DB_SC_HelpDesk`.`userHelpdesk` `h` left join (select `DB_SC_HelpDesk`.`helpdeskActivityLog`.`requestId` AS `requestId`,count(0) AS `reopen` from `DB_SC_HelpDesk`.`helpdeskActivityLog` where ((`DB_SC_HelpDesk`.`helpdeskActivityLog`.`fieldName` = 'status') and (`DB_SC_HelpDesk`.`helpdeskActivityLog`.`oldValue` = 'closed') and (`DB_SC_HelpDesk`.`helpdeskActivityLog`.`newValue` = 'open')) group by `DB_SC_HelpDesk`.`helpdeskActivityLog`.`requestId`) `a` on((`h`.`id` = `a`.`requestId`))) left join (select `c`.`userId` AS `userId`,count(`c`.`ticketId`) AS `comment_count` from (`DB_SC_HelpDesk`.`userHelpdeskComment` `c` join `DB_SC_HelpDesk`.`userHelpdesk` `h` on(((`h`.`id` = `c`.`ticketId`) and (`c`.`userId` = `h`.`assignedId`)))) group by `c`.`userId` order by `c`.`userId`) `c` on((`c`.`userId` = `h`.`assignedId`))) group by `h`.`assignedId` order by `resolved`) */;
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
