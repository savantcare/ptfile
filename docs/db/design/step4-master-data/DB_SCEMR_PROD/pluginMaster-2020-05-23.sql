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
-- Table structure for table `pluginMaster`
--

DROP TABLE IF EXISTS `pluginMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginMaster` (
  `pluginID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `sectionID` tinyint(4) unsigned DEFAULT NULL,
  `pluginTitle` varchar(255) DEFAULT NULL,
  `hotkey` varchar(50) DEFAULT NULL,
  `typeOfSectionThisPluginIsUsefulIn` varchar(255) DEFAULT NULL COMMENT 'Each section has further classification of mutually exclusive types. Like users have user roles and events have event types. Some plugins like Coding and payment for section events are not applicable when the event type is conference. We will store this information here.',
  `pluginCategoryMasterId` tinyint(3) unsigned DEFAULT NULL,
  `parentPluginId` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`pluginID`),
  KEY `sectionID` (`sectionID`),
  KEY `parentPluginId` (`parentPluginId`),
  KEY `pluginCategoryMasterId` (`pluginCategoryMasterId`),
  CONSTRAINT `pluginMaster_ibfk_1` FOREIGN KEY (`sectionID`) REFERENCES `sectionsMaster` (`id`),
  CONSTRAINT `pluginMaster_ibfk_2` FOREIGN KEY (`parentPluginId`) REFERENCES `pluginMaster` (`pluginID`),
  CONSTRAINT `pluginMaster_ibfk_3` FOREIGN KEY (`pluginCategoryMasterId`) REFERENCES `pluginMasterCategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 4/8';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pluginMaster`
--

LOCK TABLES `pluginMaster` WRITE;
/*!40000 ALTER TABLE `pluginMaster` DISABLE KEYS */;
INSERT INTO `pluginMaster` VALUES (1,6,'Profile','shift+f','1{1,2,5}',2,NULL),(2,6,'Social history','shift+h','1{5}',1,NULL),(3,6,'Goals analysis','shift+g','1{5}',1,NULL),(4,6,'Mental status exam','shift+e','1{5}',1,NULL),(6,6,'Care team','shift+t','1{5}',2,NULL),(7,6,'Assessment','shift+n','1{5}',1,NULL),(8,6,'Appointments','shift+a','1{5}',2,NULL),(9,6,'Allergies','shift+l','1{5}',1,NULL),(10,6,'Medications','shift+m','1{5}',1,NULL),(11,6,'Hospitalizations','shift+z','1{5}',1,NULL),(12,6,'Contacts','shift+o','1{1,2,5}',2,NULL),(13,6,'Payer','shift+y','1{5}',3,NULL),(14,6,'Pharmacy','shift+r','1{5}',2,NULL),(15,6,'Policies','shift+p','1{5}',3,NULL),(16,6,'Documents','shift+d','1{1,2,5}',3,NULL),(17,6,'Psychiatric Review of Systems','shift+v','1{5}',1,NULL),(18,6,'Body measurement','shift+b','1{5}',1,NULL),(19,6,'Screening','shift+s','1{5}',1,NULL),(20,6,'Billing','shift+i','1{5}',3,NULL),(21,6,'Substance use','shift+u','',1,NULL),(22,6,'Symptoms','','',1,NULL),(25,6,'Emails','','',2,NULL),(26,6,'Referral','','',3,NULL),(30,7,'Event details',NULL,'1,2,3,4,5,6',NULL,NULL),(31,7,'Status history',NULL,'1,2,3,4,5,6',NULL,NULL),(32,7,'Notes',NULL,'1,2,3,4,5,6',NULL,NULL),(33,7,'Coding (Step 1 of 3)',NULL,'1',NULL,NULL),(35,6,'Phone encounters','','',2,NULL),(38,7,'Incoming payment (Step 2 of 3)',NULL,'1',NULL,NULL),(39,6,'Prescription refill',NULL,'',2,NULL),(40,6,'Red Flags','',NULL,3,NULL),(41,6,'Official letters',NULL,NULL,2,NULL),(42,6,'Task',NULL,NULL,2,NULL),(43,7,'Outgoing payment',NULL,NULL,NULL,NULL),(44,6,'Career highlights',NULL,NULL,3,NULL),(45,6,'Notes',NULL,NULL,1,NULL),(46,6,'Subscription',NULL,NULL,2,NULL),(47,6,'Self harm','',NULL,2,NULL),(48,7,'Documents',NULL,NULL,NULL,NULL),(50,6,'Voicemail',NULL,NULL,3,NULL),(51,7,'Cosign',NULL,NULL,NULL,NULL),(52,6,'Health insurance coverage',NULL,NULL,3,NULL),(53,7,'Claims using Eligible Inc',NULL,NULL,NULL,NULL),(54,6,'Release of information',NULL,NULL,3,NULL),(56,6,'Eligibility for med insurance and med history',NULL,NULL,3,NULL),(57,6,'Service statements',NULL,NULL,1,NULL),(58,6,'Process Note',NULL,NULL,1,NULL),(59,7,'Claims using Office Ally Inc (Step 3 of 3)',NULL,NULL,NULL,NULL),(60,6,'Mood Tracker',NULL,NULL,NULL,NULL),(61,6,'Body measurementV2',NULL,'1{5}',1,NULL),(62,6,'Activity log',NULL,NULL,3,NULL),(63,6,'Member summary',NULL,NULL,3,NULL),(64,6,'Onebox',NULL,NULL,2,NULL),(65,6,'Miscellaneous note',NULL,NULL,1,NULL),(66,6,'Medication order',NULL,NULL,1,NULL),(67,6,'Patient meds monitoring conditions',NULL,NULL,1,NULL),(68,6,'Fill from pharmacy',NULL,NULL,3,NULL),(69,6,'Medical review of system',NULL,NULL,1,NULL),(70,6,'Recommendations',NULL,NULL,1,NULL),(71,6,'Reminders',NULL,NULL,1,NULL),(73,6,'Subjective and psych review of systems',NULL,NULL,1,NULL),(74,6,'Let doctor be doctor',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `pluginMaster` ENABLE KEYS */;
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
