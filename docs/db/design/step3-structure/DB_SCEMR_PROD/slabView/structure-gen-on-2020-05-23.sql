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
-- Temporary table structure for view `slabView`
--

DROP TABLE IF EXISTS `slabView`;
/*!50001 DROP VIEW IF EXISTS `slabView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `slabView` AS SELECT 
 1 AS `eventID`,
 1 AS `patientUID`,
 1 AS `scEmployeeUID`,
 1 AS `scEmployeeFullName`,
 1 AS `eventTypeName`,
 1 AS `allNotesAreLocked`,
 1 AS `eventStatusName`,
 1 AS `eventStartDateTime`,
 1 AS `dateDifference`,
 1 AS `minDate`,
 1 AS `slab`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `slabView`
--

/*!50001 DROP VIEW IF EXISTS `slabView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `slabView` AS (select `mainData`.`eventID` AS `eventID`,`mainData`.`patientUID` AS `patientUID`,`mainData`.`scEmployeeUID` AS `scEmployeeUID`,`mainData`.`scEmployeeFullName` AS `scEmployeeFullName`,`mainData`.`eventTypeName` AS `eventTypeName`,`mainData`.`allNotesAreLocked` AS `allNotesAreLocked`,`mainData`.`eventStatusName` AS `eventStatusName`,`mainData`.`eventStartDateTime` AS `eventStartDateTime`,`mainData`.`dateDifference` AS `dateDifference`,`subData`.`minDate` AS `minDate`,(case when (`mainData`.`dateDifference` between 14 and 27) then '14-27' when (`mainData`.`dateDifference` between 28 and 44) then '28-44' when (`mainData`.`dateDifference` between 45 and 59) then '45-59' when (`mainData`.`dateDifference` >= 60) then 'after60' end) AS `slab` from (`DB_SCEMR_PROD`.`unlockreportmasterdata` `mainData` join (select `unlockreportmasterdata`.`scEmployeeUID` AS `scEmployeeUID`,min(cast(`unlockreportmasterdata`.`eventStartDateTime` as date)) AS `minDate` from `DB_SCEMR_PROD`.`unlockreportmasterdata` where ((`unlockreportmasterdata`.`allNotesAreLocked` <> 'Yes') and (`unlockreportmasterdata`.`dateDifference` > 13)) group by `unlockreportmasterdata`.`scEmployeeUID`) `subData` on((`mainData`.`scEmployeeUID` = `subData`.`scEmployeeUID`))) where (`mainData`.`eventStartDateTime` >= `subData`.`minDate`)) */;
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
