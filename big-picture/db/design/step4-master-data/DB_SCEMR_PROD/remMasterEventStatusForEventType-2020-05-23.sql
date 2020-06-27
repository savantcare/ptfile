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
-- Table structure for table `remMasterEventStatusForEventType`
--

DROP TABLE IF EXISTS `remMasterEventStatusForEventType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remMasterEventStatusForEventType` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `eventTypeID` tinyint(4) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eventTypeID` (`eventTypeID`),
  CONSTRAINT `remMasterEventStatusForEventType_ibfk_1` FOREIGN KEY (`eventTypeID`) REFERENCES `remMasterEventTypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 27/6';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remMasterEventStatusForEventType`
--

LOCK TABLES `remMasterEventStatusForEventType` WRITE;
/*!40000 ALTER TABLE `remMasterEventStatusForEventType` DISABLE KEYS */;
INSERT INTO `remMasterEventStatusForEventType` VALUES (1,'Step 3: Not approved by doc',1,'2015-03-03 12:45:24',NULL),(2,'Step 4: Approved by doc',1,'2015-03-03 12:45:26',NULL),(3,'Step 5A: No show',1,'2015-03-03 12:45:28',NULL),(4,'Step 5B: Cancelled',1,'2015-03-03 12:45:37',NULL),(5,'Step 5D: Checked in',1,'2015-03-03 12:47:24',NULL),(6,'Step 6: Checked out',1,'2015-03-03 12:47:36',NULL),(7,'Not started',4,'2015-07-16 19:11:25',NULL),(8,'In Progress',4,'2015-07-16 19:11:25',NULL),(9,'Completed',4,'2015-07-16 19:11:44',NULL),(10,'Invited',2,'2015-05-15 07:38:57',NULL),(11,'Step 2: Incomplete info',1,'2015-09-17 05:11:32',NULL),(12,'Authorized by doctor',6,'2015-09-17 14:30:33',NULL),(13,'Sent to pharmacy',6,'2015-09-17 14:30:33',NULL),(14,'Being prepared',7,'2015-10-26 13:09:40',NULL),(15,'Given to patient',7,'2015-10-26 13:09:40',NULL),(16,'Cancelled',4,'2016-03-09 17:10:46',NULL),(17,'Unknown',4,'2016-04-21 06:48:27',NULL),(18,'Step 1: Cancelled due to incomplete intake',1,'2016-06-07 10:41:47',NULL),(19,'Step 5C: Late cancellation',1,'2016-07-25 08:59:54',NULL),(20,'Step 3A: On Hold',1,'2016-09-14 09:45:13',NULL),(21,'Step 1: AFA approved by doc',11,'2017-03-08 07:48:08',NULL),(22,'Step 2: AFA cancelled by doc',11,'2017-03-08 08:04:38',NULL),(23,'Step 7: Alignment billed',1,'2017-11-06 15:09:03',NULL),(24,'Test',13,'2019-10-29 08:11:01',NULL);
/*!40000 ALTER TABLE `remMasterEventStatusForEventType` ENABLE KEYS */;
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
