use DB_SCEMR_PROD;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SCEMR_PROD
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
-- Temporary table structure for view `providerUnlockNoteDetails`
--

DROP TABLE IF EXISTS `providerUnlockNoteDetails`;
/*!50001 DROP VIEW IF EXISTS `providerUnlockNoteDetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `providerUnlockNoteDetails` AS SELECT 
 1 AS `scEmployeeUID`,
 1 AS `eventId`,
 1 AS `eventStartDateTime`,
 1 AS `slab`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `providerUnlockNoteDetails`
--

/*!50001 DROP VIEW IF EXISTS `providerUnlockNoteDetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `providerUnlockNoteDetails` AS (select `table2`.`scEmployeeUID` AS `scEmployeeUID`,`table2`.`eventId` AS `eventId`,`table2`.`eventStartDateTime` AS `eventStartDateTime`,`table2`.`slab` AS `slab` from (select `table1`.`scEmployeeUID` AS `scEmployeeUID`,`table1`.`eventID` AS `eventId`,`table1`.`eventStartDateTime` AS `eventStartDateTime`,(case when (`table1`.`dateDifference` between 14 and 27) then '14-27' when (`table1`.`dateDifference` between 28 and 44) then '28-44' when (`table1`.`dateDifference` between 45 and 59) then '45-59' when (`table1`.`dateDifference` >= 60) then 'after60' end) AS `slab` from (select `DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`scEmployeeUID` AS `scEmployeeUID`,`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventID` AS `eventID`,`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventStartDateTime` AS `eventStartDateTime`,(to_days(curdate()) - to_days(`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventStartDateTime`)) AS `dateDifference` from `DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport` where ((`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventTypeName` = 'Appointment') and (`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventStatusName` = 'Step 4: Approved by doc') and (`DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`eventLockStatus` = 'No')) order by `DB_SCEMR_PROD`.`cronCreatedForCacheUsedByEventsReport`.`scEmployeeUID`) `table1`) `table2`) */;
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
