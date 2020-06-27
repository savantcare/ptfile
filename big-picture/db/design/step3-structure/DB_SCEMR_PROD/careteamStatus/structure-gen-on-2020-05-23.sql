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
-- Temporary table structure for view `careteamStatus`
--

DROP TABLE IF EXISTS `careteamStatus`;
/*!50001 DROP VIEW IF EXISTS `careteamStatus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `careteamStatus` AS SELECT 
 1 AS `eventID`,
 1 AS `eventStatusID`,
 1 AS `attendeeId`,
 1 AS `host`,
 1 AS `hostRoleId`,
 1 AS `hostRole`,
 1 AS `startDateTime`,
 1 AS `id`,
 1 AS `careteamflag`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `careteamStatus`
--

/*!50001 DROP VIEW IF EXISTS `careteamStatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `careteamStatus` AS (select `finaldata`.`eventID` AS `eventID`,`finaldata`.`eventStatusID` AS `eventStatusID`,`finaldata`.`attendeeId` AS `attendeeId`,`finaldata`.`host` AS `host`,`finaldata`.`hostRoleId` AS `hostRoleId`,`finaldata`.`hostRole` AS `hostRole`,`finaldata`.`startDateTime` AS `startDateTime`,`DB_SCEMR_PROD`.`careTeam`.`id` AS `id`,(case when isnull(`DB_SCEMR_PROD`.`careTeam`.`id`) then 0 else 1 end) AS `careteamflag` from (((select `newdata`.`eventID` AS `eventID`,`newdata`.`eventStatusID` AS `eventStatusID`,`newdata`.`uid` AS `attendeeId`,`newdata`.`host` AS `host`,`newdata`.`roleID` AS `hostRoleId`,`DB_SCEMR_PROD`.`userRoleTypesMaster`.`name` AS `hostRole`,`newdata`.`startDateTime` AS `startDateTime` from (((select `testdata`.`eventID` AS `eventID`,`testdata`.`uid` AS `uid`,`testdata`.`startDateTime` AS `startDateTime`,`testdata`.`eventStatusID` AS `eventStatusID`,`testdata`.`host` AS `host`,`DB_SCEMR_PROD`.`users`.`roleID` AS `roleID` from (((select `dummydata`.`eventID` AS `eventID`,`dummydata`.`uid` AS `uid`,`dummydata`.`startDateTime` AS `startDateTime`,`dummydata`.`eventStatusID` AS `eventStatusID`,`DB_SCEMR_PROD`.`remEventAttendees`.`uid` AS `host` from (((select `DB_SCEMR_PROD`.`remEvents`.`eventID` AS `eventID`,`DB_SCEMR_PROD`.`remEventAttendees`.`uid` AS `uid`,`DB_SCEMR_PROD`.`remEvents`.`startDateTime` AS `startDateTime`,`remEventStatusChronology`.`eventStatusID` AS `eventStatusID` from ((`DB_SCEMR_PROD`.`remEventAttendees` join `DB_SCEMR_PROD`.`remEvents` on(((`DB_SCEMR_PROD`.`remEvents`.`eventID` = `DB_SCEMR_PROD`.`remEventAttendees`.`eventID`) and (`DB_SCEMR_PROD`.`remEventAttendees`.`isThisUserHost` = 0)))) join (select `DB_SCEMR_PROD`.`remEventStatusChronology`.`eventID` AS `eventID`,`DB_SCEMR_PROD`.`remEventStatusChronology`.`eventStatusID` AS `eventStatusID` from `DB_SCEMR_PROD`.`remEventStatusChronology` where `DB_SCEMR_PROD`.`remEventStatusChronology`.`id` in (select max(`DB_SCEMR_PROD`.`remEventStatusChronology`.`id`) from `DB_SCEMR_PROD`.`remEventStatusChronology` group by `DB_SCEMR_PROD`.`remEventStatusChronology`.`eventID`)) `remEventStatusChronology` on((`remEventStatusChronology`.`eventID` = `DB_SCEMR_PROD`.`remEventAttendees`.`eventID`))) where ((`DB_SCEMR_PROD`.`remEvents`.`eventTypeID` = 1) and (`remEventStatusChronology`.`eventStatusID` in (2,5,6))) order by `DB_SCEMR_PROD`.`remEventAttendees`.`uid`,`DB_SCEMR_PROD`.`remEvents`.`startDateTime`)) `dummydata` left join `DB_SCEMR_PROD`.`remEventAttendees` on(((`dummydata`.`eventID` = `DB_SCEMR_PROD`.`remEventAttendees`.`eventID`) and (`DB_SCEMR_PROD`.`remEventAttendees`.`isThisUserHost` = 1)))))) `testdata` join `DB_SCEMR_PROD`.`users` on((`DB_SCEMR_PROD`.`users`.`id` = `testdata`.`host`))))) `newdata` join `DB_SCEMR_PROD`.`userRoleTypesMaster` on((`DB_SCEMR_PROD`.`userRoleTypesMaster`.`id` = `newdata`.`roleID`))))) `finaldata` left join `DB_SCEMR_PROD`.`careTeam` on(((`DB_SCEMR_PROD`.`careTeam`.`uidOfCareGiver` = `finaldata`.`host`) and (`DB_SCEMR_PROD`.`careTeam`.`uidOfPatient` = `finaldata`.`attendeeId`)))) order by `finaldata`.`attendeeId`,`finaldata`.`startDateTime`) */;
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
