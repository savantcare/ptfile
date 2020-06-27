use DB_SC_PatientFilePluginSettings
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_PatientFilePluginSettings
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
  `pluginTitle` varchar(255) DEFAULT NULL,
  `hotkey` varchar(50) DEFAULT NULL,
  `pluginCategoryMasterId` tinyint(3) unsigned DEFAULT NULL,
  `isEnable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `isMovable` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`pluginID`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 4/8';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pluginMaster`
--

LOCK TABLES `pluginMaster` WRITE;
/*!40000 ALTER TABLE `pluginMaster` DISABLE KEYS */;
INSERT INTO `pluginMaster` VALUES (1,'Profile','shift+f',2,'yes','yes'),(2,'Social history','shift+h',1,'yes','yes'),(3,'Goals analysis','shift+g',1,'yes','yes'),(4,'Mental status exam','shift+e',1,'yes','yes'),(7,'Assessment','shift+n',1,'yes','yes'),(8,'Appointments','shift+a',1,'yes','yes'),(9,'Allergies','shift+l',1,'yes','yes'),(10,'Medications','shift+m',1,'yes','yes'),(11,'Hospitalizations','shift+z',1,'yes','yes'),(12,'Contacts','shift+o',2,'yes','yes'),(13,'Payer','shift+y',2,'yes','yes'),(14,'Pharmacy','shift+r',2,'yes','yes'),(15,'Policies','shift+p',2,'yes','yes'),(16,'Documents','shift+d',2,'yes','yes'),(17,'Subjective and psych review of systems','shift+v',1,'yes','yes'),(18,'Body measurement','shift+b',1,'yes','yes'),(19,'Screening','shift+s',1,'yes','yes'),(20,'Billing','shift+i',2,'yes','yes'),(21,'Substance use','shift+u',1,'yes','yes'),(22,'Symptoms','',1,'yes','yes'),(25,'Emails','',2,'no','yes'),(26,'Referral','',2,'yes','yes'),(30,'Event details',NULL,NULL,'yes','yes'),(31,'Status history',NULL,NULL,'yes','yes'),(32,'Notes',NULL,NULL,'yes','yes'),(33,'Coding (Step 1 of 3)',NULL,NULL,'yes','yes'),(38,'Incoming payment (Step 2 of 3)',NULL,NULL,'yes','yes'),(39,'Prescription refill',NULL,2,'no','yes'),(40,'Red Flags','',2,'yes','yes'),(41,'Official letters',NULL,2,'yes','yes'),(42,'Task',NULL,2,'yes','yes'),(43,'Outgoing payment',NULL,NULL,'yes','yes'),(44,'Career highlights',NULL,2,'no','yes'),(45,'Notes',NULL,1,'yes','yes'),(46,'Subscription',NULL,2,'yes','yes'),(47,'Self harm','',1,'yes','yes'),(48,'Documents',NULL,NULL,'yes','yes'),(50,'Voicemail',NULL,2,'no','yes'),(51,'Cosign',NULL,NULL,'yes','yes'),(52,'Health insurance coverage',NULL,2,'yes','yes'),(53,'Claims using Eligible Inc',NULL,NULL,'yes','yes'),(54,'Release of information',NULL,2,'yes','yes'),(56,'Eligibility for med insurance and med history',NULL,2,'yes','yes'),(57,'Service statements',NULL,1,'yes','yes'),(58,'Process Note',NULL,1,'yes','yes'),(59,'Claims using Office Ally Inc (Step 3 of 3)',NULL,NULL,'yes','yes'),(60,'Mood Tracker',NULL,NULL,'yes','yes'),(61,'Body measurementV2',NULL,1,'no','yes'),(63,'Member summary',NULL,2,'yes','yes'),(65,'Miscellaneous note',NULL,1,'yes','yes'),(66,'Medication order',NULL,1,'yes','yes'),(67,'Patient meds monitoring conditions',NULL,1,'yes','yes'),(68,'Fill from pharmacy',NULL,2,'yes','yes'),(69,'Medical review of system',NULL,1,'yes','yes'),(70,'Recommendations',NULL,1,'yes','yes'),(71,'Reminders',NULL,1,'yes','yes'),(72,'Family history',NULL,1,'yes','yes'),(73,'Past psychiatric history',NULL,1,'yes','yes'),(74,'Medical history',NULL,1,'yes','yes'),(75,'Let doctor be doctor',NULL,1,'yes','yes');
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
