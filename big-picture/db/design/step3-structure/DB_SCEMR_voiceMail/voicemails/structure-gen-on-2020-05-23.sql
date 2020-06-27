use DB_SCEMR_voiceMail;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SCEMR_voiceMail
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
-- Table structure for table `voicemails`
--

DROP TABLE IF EXISTS `voicemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voicemails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audioFile` longblob,
  `autoTranslationText` text,
  `autoTranslationDoneBy` enum('Google','Microsoft') DEFAULT NULL,
  `autoTranslationConfidenceValue` float DEFAULT NULL,
  `autoTranslationConfidencePercentage` float DEFAULT NULL,
  `autoTranslationConfidenceType` varchar(50) DEFAULT NULL,
  `autoTranslationStatus` varchar(100) DEFAULT NULL,
  `manualTranslationText` text,
  `manualTranslationDoneByUID` int(11) DEFAULT NULL,
  `manualTranslationDoneByFullName` varchar(100) DEFAULT NULL,
  `datetimeOfManualTranslationDoneOn` datetime DEFAULT NULL,
  `timeZoneOfManualTranslationDoneOn` varchar(255) DEFAULT NULL,
  `uidOfPatient` int(11) DEFAULT NULL,
  `fullNameOfPatient` varchar(100) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `voiceMailSourcePhoneNo` varchar(50) DEFAULT NULL,
  `voiceMailChannelId` varchar(50) DEFAULT NULL,
  `voiceMailDuration` int(11) DEFAULT NULL,
  `voiceMailOriginalDateTimeUnixFormat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4339 DEFAULT CHARSET=latin1;
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
