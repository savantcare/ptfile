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
-- Temporary table structure for view `unlocknotereport`
--

DROP TABLE IF EXISTS `unlocknotereport`;
/*!50001 DROP VIEW IF EXISTS `unlocknotereport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `unlocknotereport` AS SELECT 
 1 AS `scEmployeeUID`,
 1 AS `roleName`,
 1 AS `scEmployeeFullName`,
 1 AS `minDate`,
 1 AS `totalAppointment`,
 1 AS `days14To27_total`,
 1 AS `days14To27`,
 1 AS `days28To44_total`,
 1 AS `days28To44`,
 1 AS `days45To59_total`,
 1 AS `days45To59`,
 1 AS `daysAfter60_total`,
 1 AS `daysAfter60`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `unlocknotereport`
--

/*!50001 DROP VIEW IF EXISTS `unlocknotereport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `unlocknotereport` AS (select `doctorDetail`.`id` AS `scEmployeeUID`,(case when (`doctorDetail`.`roleID` = 7) then 'Doctor' else 'Therapist' end) AS `roleName`,`doctorDetail`.`fullName` AS `scEmployeeFullName`,ifnull(cast(`reportData`.`minDate` as date),'') AS `minDate`,ifnull(`reportData`.`total`,0) AS `totalAppointment`,ifnull(`reportData`.`slab14`,0) AS `days14To27_total`,ifnull(((`reportData`.`slab14` * 100) / `reportData`.`total`),0) AS `days14To27`,ifnull(`reportData`.`slab28`,0) AS `days28To44_total`,ifnull(((`reportData`.`slab28` * 100) / `reportData`.`total`),0) AS `days28To44`,ifnull(`reportData`.`slab45`,0) AS `days45To59_total`,ifnull(((`reportData`.`slab45` * 100) / `reportData`.`total`),0) AS `days45To59`,ifnull(`reportData`.`slab60`,0) AS `daysAfter60_total`,ifnull(((`reportData`.`slab60` * 100) / `reportData`.`total`),0) AS `daysAfter60` from (((select `DB_SCEMR_PROD`.`users`.`id` AS `id`,concat(`DB_SCEMR_PROD`.`users`.`firstName`,' ',`DB_SCEMR_PROD`.`users`.`lastName`) AS `fullName`,`DB_SCEMR_PROD`.`users`.`roleID` AS `roleID` from `DB_SCEMR_PROD`.`users` where ((`DB_SCEMR_PROD`.`users`.`roleID` in (7,32)) and (`DB_SCEMR_PROD`.`users`.`id` <> 5985)))) `doctorDetail` left join (select `unlockedReportSlab`.`scEmployeeUID` AS `scEmployeeUID`,`unlockedReportSlab`.`minDate` AS `minDate`,count(0) AS `total`,sum((case when ((`unlockedReportSlab`.`slab` = '14-27') and (`unlockedReportSlab`.`allNotesAreLocked` <> 'Yes')) then 1 else 0 end)) AS `slab14`,sum((case when ((`unlockedReportSlab`.`slab` = '28-44') and (`unlockedReportSlab`.`allNotesAreLocked` <> 'Yes')) then 1 else 0 end)) AS `slab28`,sum((case when ((`unlockedReportSlab`.`slab` = '45-59') and (`unlockedReportSlab`.`allNotesAreLocked` <> 'Yes')) then 1 else 0 end)) AS `slab45`,sum((case when ((`unlockedReportSlab`.`slab` = 'after60') and (`unlockedReportSlab`.`allNotesAreLocked` <> 'Yes')) then 1 else 0 end)) AS `slab60` from `DB_SCEMR_PROD`.`unlockedReportSlab` group by `unlockedReportSlab`.`scEmployeeUID`) `reportData` on((`reportData`.`scEmployeeUID` = `doctorDetail`.`id`))) order by `doctorDetail`.`roleID`,`doctorDetail`.`fullName`) */;
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
