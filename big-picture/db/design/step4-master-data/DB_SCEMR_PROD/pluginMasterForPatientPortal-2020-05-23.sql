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
-- Table structure for table `pluginMasterForPatientPortal`
--

DROP TABLE IF EXISTS `pluginMasterForPatientPortal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginMasterForPatientPortal` (
  `pluginID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `pluginTitle` varchar(255) DEFAULT NULL,
  `isEnabled` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`pluginID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pluginMasterForPatientPortal`
--

LOCK TABLES `pluginMasterForPatientPortal` WRITE;
/*!40000 ALTER TABLE `pluginMasterForPatientPortal` DISABLE KEYS */;
INSERT INTO `pluginMasterForPatientPortal` VALUES (1,'Goal','Yes'),(2,'Symptoms','Yes'),(3,'Screens','Yes'),(4,'Policies','Yes'),(5,'Profile','Yes'),(6,'Appointment reminder options','No'),(7,'Emergency contacts','Yes'),(8,'Meditation','Yes'),(9,'Subscription','Yes'),(10,'Two Factor Authentication','Yes'),(11,'Billing','Yes'),(12,'Payment options','Yes'),(13,'Social history','Yes'),(14,'Appointment','Yes'),(15,'Health insurance coverage','No'),(16,'Release of information','Yes'),(17,'Medication','Yes'),(18,'File claim on your behalf for out of network services','Yes'),(19,'Allow me to direct login from email','Yes');
/*!40000 ALTER TABLE `pluginMasterForPatientPortal` ENABLE KEYS */;
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
