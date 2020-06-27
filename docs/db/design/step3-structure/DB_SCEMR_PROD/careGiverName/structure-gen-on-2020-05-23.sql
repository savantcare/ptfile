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
-- Temporary table structure for view `careGiverName`
--

DROP TABLE IF EXISTS `careGiverName`;
/*!50001 DROP VIEW IF EXISTS `careGiverName`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `careGiverName` AS SELECT 
 1 AS `careGiverFName`,
 1 AS `careGiverLName`,
 1 AS `uidOfCareGiver`,
 1 AS `uidOfPatient`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `careGiverName`
--

/*!50001 DROP VIEW IF EXISTS `careGiverName`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `careGiverName` AS (select `DB_SCEMR_PROD`.`users`.`firstName` AS `careGiverFName`,`DB_SCEMR_PROD`.`users`.`lastName` AS `careGiverLName`,`DB_SC_CareTeam`.`careTeam`.`uidOfCareGiver` AS `uidOfCareGiver`,`DB_SC_CareTeam`.`careTeam`.`uidOfPatient` AS `uidOfPatient` from (`DB_SC_CareTeam`.`careTeam` join `DB_SCEMR_PROD`.`users` on((`DB_SCEMR_PROD`.`users`.`id` = `DB_SC_CareTeam`.`careTeam`.`uidOfCareGiver`))) where (`DB_SC_CareTeam`.`careTeam`.`id` in (select max(`DB_SC_CareTeam`.`careTeam`.`id`) from (`DB_SC_CareTeam`.`careTeam` left join `DB_SC_CareTeam`.`careTeamMasterDesignations` `careTeamMD` on((`DB_SC_CareTeam`.`careTeam`.`careTeamDesignationID` = `careTeamMD`.`id`))) where (`careTeamMD`.`designationName` = 'Primary team') group by `DB_SC_CareTeam`.`careTeam`.`firstParentId`) and isnull(`DB_SC_CareTeam`.`careTeam`.`deletedOnDateTime`))) */;
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
