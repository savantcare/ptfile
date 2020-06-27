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
-- Table structure for table `remMasterEventNoteTypes`
--

DROP TABLE IF EXISTS `remMasterEventNoteTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remMasterEventNoteTypes` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `eventTypeID` tinyint(4) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `initialTemplateContent` text,
  `numberOfNotesOfThisNoteTypeAllowedInAnEvent` tinyint(4) NOT NULL,
  `requiredForLockingNotesOfAnEvent` enum('No','Yes') NOT NULL DEFAULT 'No',
  `AllowedToAddAfterNotesOfAnEventIsLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`),
  KEY `eventTypeID` (`eventTypeID`),
  CONSTRAINT `remMasterEventNoteTypes_ibfk_1` FOREIGN KEY (`eventTypeID`) REFERENCES `remMasterEventTypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COMMENT='ok by VK on 30/8';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remMasterEventNoteTypes`
--

LOCK TABLES `remMasterEventNoteTypes` WRITE;
/*!40000 ALTER TABLE `remMasterEventNoteTypes` DISABLE KEYS */;
INSERT INTO `remMasterEventNoteTypes` VALUES (1,1,'Plan',NULL,1,'Yes','No'),(2,1,'Assessment',NULL,1,'Yes','No'),(3,1,'Subjective',NULL,1,'Yes','No'),(4,1,'Comments for billing team',NULL,100,'No','Yes'),(5,2,'Conference Comments',NULL,100,'No','Yes'),(6,3,'Personal time comments',NULL,100,'No','Yes'),(7,4,'Task comments',NULL,100,'Yes','Yes'),(8,1,'Appointment comments',NULL,100,'No','Yes'),(9,5,'Phone encounter comments',NULL,100,'No','Yes'),(10,6,'Prescription refill comments',NULL,100,'No','Yes'),(11,5,'Phone conversation',NULL,1,'Yes','No'),(12,6,'Prescription refill details',NULL,1,'No','No'),(13,7,'Disability letter','This is a disability letter',1,'Yes','No'),(14,7,'Accommodation letter','This is a accommodation letter',1,'Yes','No'),(15,7,'Other letter','This is a Other letter',1,'No','No'),(16,5,'Plan during phone encounter',NULL,1,'No','No');
/*!40000 ALTER TABLE `remMasterEventNoteTypes` ENABLE KEYS */;
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
