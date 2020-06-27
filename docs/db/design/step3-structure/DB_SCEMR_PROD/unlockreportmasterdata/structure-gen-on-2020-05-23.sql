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
-- Temporary table structure for view `unlockreportmasterdata`
--

DROP TABLE IF EXISTS `unlockreportmasterdata`;
/*!50001 DROP VIEW IF EXISTS `unlockreportmasterdata`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `unlockreportmasterdata` AS SELECT 
 1 AS `eventID`,
 1 AS `patientUID`,
 1 AS `scEmployeeUID`,
 1 AS `scEmployeeFullName`,
 1 AS `eventTypeName`,
 1 AS `allNotesAreLocked`,
 1 AS `eventStatusName`,
 1 AS `eventStartDateTime`,
 1 AS `dateDifference`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `unlockreportmasterdata`
--

/*!50001 DROP VIEW IF EXISTS `unlockreportmasterdata`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `unlockreportmasterdata` AS (select `cronCreatedForCacheUsedByEventsReport1`.`eventID` AS `eventID`,`cronCreatedForCacheUsedByEventsReport1`.`patientUID` AS `patientUID`,`cronCreatedForCacheUsedByEventsReport1`.`scEmployeeUID` AS `scEmployeeUID`,`cronCreatedForCacheUsedByEventsReport1`.`scEmployeeFullName` AS `scEmployeeFullName`,`cronCreatedForCacheUsedByEventsReport1`.`eventTypeName` AS `eventTypeName`,`cronCreatedForCacheUsedByEventsReport1`.`allNotesAreLocked` AS `allNotesAreLocked`,`cronCreatedForCacheUsedByEventsReport1`.`eventStatusName` AS `eventStatusName`,`cronCreatedForCacheUsedByEventsReport1`.`eventStartDateTime` AS `eventStartDateTime`,(to_days(cast(convert_tz(now(),'UTC','America/Los_Angeles') as date)) - to_days(cast(`cronCreatedForCacheUsedByEventsReport1`.`eventStartDateTime` as date))) AS `dateDifference` from `cronCreatedForCacheUsedByEventsReport1` where ((`cronCreatedForCacheUsedByEventsReport1`.`eventTypeName` = 'Appointment') and (`cronCreatedForCacheUsedByEventsReport1`.`eventStatusName` = 'Step 4: Approved by doc') and (`cronCreatedForCacheUsedByEventsReport1`.`patientUID` <> 453) and (cast(`cronCreatedForCacheUsedByEventsReport1`.`eventStartDateTime` as date) <= cast(convert_tz(now(),'UTC','America/Los_Angeles') as date)) and (cast(`cronCreatedForCacheUsedByEventsReport1`.`eventStartDateTime` as date) >= (cast(convert_tz(now(),'UTC','America/Los_Angeles') as date) - interval 6 month))) order by `cronCreatedForCacheUsedByEventsReport1`.`eventStartDateTime` desc) */;
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
