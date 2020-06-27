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
-- Table structure for table `userRoleTypesMaster`
--

DROP TABLE IF EXISTS `userRoleTypesMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userRoleTypesMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `securityLevel` int(5) DEFAULT '1',
  `roleType` enum('Internal','External') NOT NULL DEFAULT 'External',
  `companyID` int(11) unsigned DEFAULT NULL,
  `isThisUserTypeInternal` tinyint(1) unsigned DEFAULT '0' COMMENT '0 is for no 1 is for yes',
  `isThisAllowedForPublicAccess` enum('yes','no') NOT NULL DEFAULT 'no',
  `isBookingAndPatientHourAllowed` enum('yes','no') NOT NULL DEFAULT 'no',
  `isPubliclyViewable` enum('yes','no') NOT NULL DEFAULT 'no',
  `isPatientLoginAllowed` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `isEmrLoginAllowed` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyID` (`companyID`),
  CONSTRAINT `userRoleTypesMaster_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `companyMasters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 27/6';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userRoleTypesMaster`
--

LOCK TABLES `userRoleTypesMaster` WRITE;
/*!40000 ALTER TABLE `userRoleTypesMaster` DISABLE KEYS */;
INSERT INTO `userRoleTypesMaster` VALUES (1,'Doctor',1,'External',1,1,'no','no','no','yes','yes','2015-03-03 03:29:40',NULL),(2,'Doctor\'s Associate',1,'External',1,1,'no','no','no','yes','yes','2015-03-03 03:29:53',NULL),(3,'Revenue cycle manager',1,'External',1,1,'no','no','no','yes','yes','2015-03-03 03:30:04',NULL),(4,'Manager',1,'External',1,1,'no','no','no','yes','yes','2015-03-03 03:31:32',NULL),(5,'Patient',1,'External',1,0,'no','no','no','yes','yes','2015-03-06 20:01:59',NULL),(6,'Operator',1,'External',1,0,'no','no','no','yes','yes','2015-05-12 13:09:21',NULL),(7,'Doctor',4,'Internal',3,0,'yes','yes','yes','yes','yes','2015-07-30 10:59:17',NULL),(8,'Patient - Discharged',1,'External',3,0,'no','no','no','yes','yes','2015-07-30 10:59:17',NULL),(9,'Patient - Deceased',1,'External',3,0,'no','no','no','yes','yes','2015-07-30 10:59:54',NULL),(10,'Insurance company - Not in contract with SC',1,'External',3,0,'no','no','no','yes','yes','2015-07-30 10:59:54',NULL),(11,'Patient',2,'External',3,0,'no','no','no','yes','yes','2015-07-30 11:00:18',NULL),(12,'Medical professional in the community',1,'External',3,0,'no','no','no','yes','yes','2015-07-30 11:00:18',NULL),(13,'Insurance company - In contract with SC',1,'External',3,0,'no','no','no','yes','yes','2015-08-26 14:01:15',NULL),(15,'Internet advertising channels',1,'External',3,0,'no','no','no','yes','yes','2015-09-01 11:01:21',NULL),(18,'Finance associate',3,'Internal',3,0,'no','no','no','yes','yes','2015-09-08 01:18:35',NULL),(19,'Doctor\'s Admin',3,'Internal',3,0,'no','no','yes','yes','yes','2015-09-09 11:02:26',NULL),(20,'Ex employee',1,'External',3,0,'no','no','no','yes','yes','2015-10-07 12:43:36',NULL),(21,'Financial institution',1,'External',3,0,'no','no','no','yes','yes','2015-11-17 13:45:52',NULL),(22,'Hospitals in the community',1,'External',3,0,'no','no','no','yes','yes','2015-11-17 14:24:58',NULL),(23,'PCP (Primary care practitioner)',1,'External',3,0,'no','no','no','yes','yes','2015-11-27 19:57:58',NULL),(24,'MATCH dept',4,'Internal',3,0,'no','no','no','yes','yes','2015-11-27 19:59:23',NULL),(25,'Office Manager',4,'Internal',3,0,'no','no','no','yes','yes','2015-12-21 18:51:23',NULL),(26,'Prospective Patient',1,'External',3,0,'no','no','no','yes','yes','2016-01-20 18:43:28',NULL),(27,'Health coach',1,'External',3,0,'no','no','no','yes','yes','2016-02-02 05:59:49',NULL),(28,'Community Health Professional',1,'External',3,0,'no','no','no','yes','yes','2016-02-19 20:10:17',NULL),(29,'Graduating psychiatrist 2016-to-be-deleted',1,'External',3,0,'no','no','no','yes','yes','2016-03-01 03:44:45',NULL),(30,'Intake co-ordinator',1,'Internal',3,0,'no','no','no','yes','yes','2016-05-25 06:40:20',NULL),(31,'Therapy Patient',1,'External',3,0,'no','no','no','yes','yes','2016-07-21 10:22:53',NULL),(32,'Therapist',3,'Internal',3,0,'yes','yes','yes','yes','yes','2016-07-22 10:03:20',NULL),(33,'Consultant Therapist',1,'External',3,0,'no','no','no','yes','yes','2016-07-28 06:43:23',NULL),(34,'Bot',1,'External',3,0,'no','no','no','yes','yes','2016-08-17 07:41:15',NULL),(35,'Technology employees',3,'Internal',3,0,'no','no','no','yes','yes','2017-02-06 21:49:41',NULL),(36,'Test account no longer used',1,'External',3,0,'no','no','no','yes','yes','2017-02-06 21:49:53',NULL),(37,'Website visitor',1,'External',3,0,'no','no','no','yes','yes','2017-03-11 12:37:49',NULL),(38,'Other employees',2,'Internal',3,0,'no','no','no','yes','yes','2017-03-15 11:03:58',NULL),(39,'Recruiters',1,'External',3,0,'no','no','no','yes','yes','2017-04-03 15:04:54',NULL),(40,'Asset',1,'External',3,0,'no','no','no','yes','yes','2017-08-14 06:14:28',NULL),(41,'Cashflow access',5,'Internal',3,0,'no','no','no','yes','yes','2017-12-19 13:29:41',NULL),(42,'Sonka Vital machines installed in clinics',1,'Internal',3,0,'no','no','no','yes','yes','2018-03-26 09:47:09',NULL),(43,'Patient\'s Guardian',1,'External',3,0,'no','no','no','yes','yes','2018-03-27 13:50:00',NULL),(44,'Emergency Flag Tester',6,'Internal',3,0,'no','no','no','yes','yes','2018-03-28 11:44:16',NULL),(45,'Used for test- to be deleted',1,'Internal',3,0,'no','no','no','yes','yes','2018-04-05 21:36:01',NULL),(46,'Finance Analyst',4,'Internal',3,0,'no','no','no','yes','yes','2018-06-18 23:08:50',NULL),(47,'Patient - Discharged without letter',1,'External',3,0,'no','no','no','yes','yes','2018-10-08 11:17:43',NULL),(48,'Ex employee(Doctor)',1,'External',3,0,'no','no','no','yes','yes','2019-04-04 13:11:08',NULL),(49,'Ex employee(Therapist)',1,'External',3,0,'no','no','no','yes','yes','2019-04-04 13:11:35',NULL),(50,'Screen Recorder',1,'Internal',3,0,'no','no','no','yes','yes','2019-05-16 08:11:14',NULL),(51,'Capacity Utilization  Access',2,'External',3,0,'no','no','no','yes','yes','2019-06-05 07:23:16',NULL),(52,'Team Leader',1,'Internal',3,0,'no','no','no','yes','yes','2019-06-17 10:40:57',NULL);
/*!40000 ALTER TABLE `userRoleTypesMaster` ENABLE KEYS */;
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
