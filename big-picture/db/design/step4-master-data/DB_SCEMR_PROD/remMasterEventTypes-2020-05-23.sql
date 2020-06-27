use DB_SCEMR_PROD
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
-- Table structure for table `remMasterEventTypes`
--

DROP TABLE IF EXISTS `remMasterEventTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remMasterEventTypes` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `nonReleavantPlugins` text,
  `createdAtTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `restrictConflictOnEventTypeIDs` varchar(100) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `isAllDayEvent` enum('yes','no') NOT NULL DEFAULT 'no',
  `parentEventTypeID` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 28/07';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remMasterEventTypes`
--

LOCK TABLES `remMasterEventTypes` WRITE;
/*!40000 ALTER TABLE `remMasterEventTypes` DISABLE KEYS */;
INSERT INTO `remMasterEventTypes` VALUES (1,'Appointment','a:0:{}','2015-03-03 03:30:28','1,2,3','','no',11),(2,'Conference','a:4:{i:1;s:2:\"38\";i:2;s:2:\"33\";i:3;i:43;i:4;i:53;}','2015-03-03 03:30:55','1,2,3','','no',NULL),(3,'Personal time','a:4:{i:0;s:2:\"33\";i:1;s:2:\"38\";i:2;i:43;i:3;i:53;}','2015-03-03 03:30:35','1,2','What should this be used for? If you are working part of the day and taking the other part of the day off than mark the time you are not working as personal time','no',NULL),(4,'Task','a:4:{i:0;s:2:\"33\";i:1;s:2:\"38\";i:2;i:43;i:3;i:53;}','2015-05-13 13:29:47',NULL,'','no',NULL),(5,'Phone encounter',NULL,'2015-09-11 07:12:11',NULL,'Why is phone encounter different from appointment?\nAppointments are not allowed during personal time and day off.\nBut phone encounters are allowed during personal time and day off.','no',NULL),(6,'Prescription refill','a:4:{i:1;s:2:\"38\";i:2;i:33;i:3;i:43;i:4;i:53;}','2015-09-11 07:12:11',NULL,'','no',NULL),(7,'Official letters',NULL,'2015-10-26 05:18:37',NULL,'','no',NULL),(9,'Day off','a:4:{i:0;i:33;i:1;i:38;i:2;i:43;i:3;i:53;}','2015-11-26 04:11:26','1','Why is day off different than personal time? During the day if you are taking time off for things like lunch you mark it as personal time. If you are not working for the whole day you mark it as day off','yes',NULL),(10,'Monthly Payment','a:2:{i:1;i:38;i:3;i:53;}','2016-01-05 20:37:49',NULL,'What should this be used for? Used for SC-Internal doctors\' monthly payments of salary','no',NULL),(11,'Available for appointments','a:7:{i:0;i:33;i:1;i:38;i:2;i:43;i:3;i:53;i:4;i:59;i:5;i:51;i:6;i:48;}','2016-07-12 09:50:36',NULL,'','no',NULL),(12,'Zocdoc blocker',NULL,'2016-10-05 12:03:40',NULL,'This type of events blocks the zocdoc users from booking appointment for a doctor who has opted not to allow new appointment for some hours in Intake and appointment related settings under User Preferences panel','no',NULL),(13,'Available for urgent appointments',NULL,'2017-05-16 06:28:07',NULL,'This is a slot like AFA but the difference is only DA can create an appointment inside this slot and the patients will see the provider as unavailable from patient portals.','no',NULL),(14,'Miscellaneous note',NULL,'2017-10-19 12:00:00',NULL,'','no',NULL),(15,'Room unavailable',NULL,'2017-11-23 13:05:47',NULL,'','no',NULL);
/*!40000 ALTER TABLE `remMasterEventTypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
