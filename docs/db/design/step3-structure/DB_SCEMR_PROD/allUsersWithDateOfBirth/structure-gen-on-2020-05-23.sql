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
-- Temporary table structure for view `allUsersWithDateOfBirth`
--

DROP TABLE IF EXISTS `allUsersWithDateOfBirth`;
/*!50001 DROP VIEW IF EXISTS `allUsersWithDateOfBirth`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `allUsersWithDateOfBirth` AS SELECT 
 1 AS `name`,
 1 AS `id`,
 1 AS `typeId`,
 1 AS `googleCalendarID`,
 1 AS `typeOfResource`,
 1 AS `dateOfBirth`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `allUsersWithDateOfBirth`
--

/*!50001 DROP VIEW IF EXISTS `allUsersWithDateOfBirth`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `allUsersWithDateOfBirth` AS select concat_ws(' ',`DB_SCEMR_PROD`.`users`.`firstName`,`DB_SCEMR_PROD`.`users`.`lastName`,convert(date_format(`dob`.`dateOfBirth`,'(%M %D %Y)') using utf8)) AS `name`,`DB_SCEMR_PROD`.`users`.`id` AS `id`,`DB_SCEMR_PROD`.`users`.`roleID` AS `typeId`,`DB_SCEMR_PROD`.`users`.`googleCalendarID` AS `googleCalendarID`,`DB_SCEMR_PROD`.`userRoleTypesMaster`.`name` AS `typeOfResource`,`dob`.`dateOfBirth` AS `dateOfBirth` from ((`DB_SCEMR_PROD`.`users` left join `DB_SCEMR_PROD`.`userRoleTypesMaster` on((`DB_SCEMR_PROD`.`users`.`roleID` = `DB_SCEMR_PROD`.`userRoleTypesMaster`.`id`))) left join (select `DB_SCEMR_PROD`.`userDateOfBirth`.`id` AS `id`,`DB_SCEMR_PROD`.`userDateOfBirth`.`uidOfPatient` AS `uidOfPatient`,`DB_SCEMR_PROD`.`userDateOfBirth`.`dateOfBirth` AS `dateOfBirth` from `DB_SCEMR_PROD`.`userDateOfBirth` where `DB_SCEMR_PROD`.`userDateOfBirth`.`id` in (select max(`DB_SCEMR_PROD`.`userDateOfBirth`.`id`) from (`DB_SCEMR_PROD`.`userDateOfBirth` left join `DB_SCEMR_PROD`.`users` on((`DB_SCEMR_PROD`.`users`.`id` = `DB_SCEMR_PROD`.`userDateOfBirth`.`uidOfPatient`))) where ((`DB_SCEMR_PROD`.`users`.`isDeleted` = 0) and (`DB_SCEMR_PROD`.`users`.`companyID` = 3)) group by `DB_SCEMR_PROD`.`userDateOfBirth`.`firstParentID`)) `dob` on((`dob`.`uidOfPatient` = `DB_SCEMR_PROD`.`users`.`id`))) where ((`DB_SCEMR_PROD`.`users`.`isDeleted` = 0) and (`DB_SCEMR_PROD`.`users`.`companyID` = 3)) */;
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
