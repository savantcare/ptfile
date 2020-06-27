use DB_SC_Notification;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Notification
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
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reminderTypeID` tinyint(4) unsigned DEFAULT NULL,
  `trackId` varchar(255) DEFAULT NULL,
  `eventID` int(11) unsigned DEFAULT NULL,
  `eventStatusAtTheTimeOfQueue` varchar(255) DEFAULT NULL COMMENT 'this is needed for such case where we need to remove reminders for cancelled events',
  `daysAheadReminder` tinyint(1) DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `fullNameOfPatient` varchar(255) DEFAULT NULL,
  `uidOfDoctor` int(11) unsigned DEFAULT NULL,
  `fullNameOfDoctor` varchar(255) DEFAULT NULL,
  `uidOfDoctorsAdmin` int(11) unsigned DEFAULT NULL,
  `fullNameOfDoctorsAdmin` varchar(255) DEFAULT NULL,
  `emailAddressOfDoctorsAdmin` varchar(255) DEFAULT NULL,
  `fromUID` int(11) unsigned DEFAULT NULL,
  `fromEmail` varchar(255) DEFAULT NULL,
  `fromFullName` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `subject` text,
  `messageHeader` text,
  `messageBody` text,
  `contentType` enum('text','html') NOT NULL DEFAULT 'text',
  `reminderChannel` enum('email','text','call') NOT NULL,
  `status` enum('processing','scheduled','sending','sent','failed','error') NOT NULL,
  `messageForAdmin` varchar(255) DEFAULT NULL,
  `timeToSend` datetime DEFAULT NULL,
  `scriptTookActionAt` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `emailReceivedByDA` enum('Not set','Yes','No') DEFAULT 'Not set',
  `messageForDevelopers` longtext,
  PRIMARY KEY (`id`),
  KEY `trackId` (`trackId`),
  KEY `uidOfPatient` (`uidOfPatient`),
  KEY `reminderTypeID` (`reminderTypeID`),
  KEY `fromUID` (`fromUID`),
  KEY `eventID` (`eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=12135707 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
