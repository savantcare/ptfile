use DB_SC_Surescripts;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Surescripts
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
-- Table structure for table `271DemographicInfoByPBM`
--

DROP TABLE IF EXISTS `271DemographicInfoByPBM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271DemographicInfoByPBM` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PBMName` varchar(255) DEFAULT NULL,
  `PBMParticipantID` varchar(255) DEFAULT NULL,
  `PBMMemberID` varchar(255) DEFAULT NULL,
  `271MessagesFromSurescriptId` int(11) unsigned NOT NULL,
  `subscriberChangeFlag` varchar(11) DEFAULT NULL,
  `subscriberSuffixName` varchar(255) DEFAULT NULL,
  `subscriberFirstName` varchar(255) DEFAULT NULL,
  `subscriberMiddleName` varchar(255) DEFAULT NULL,
  `subscriberLastName` varchar(255) DEFAULT NULL,
  `subscriberGender` varchar(255) DEFAULT NULL,
  `subscriberDateOfBirth` varchar(255) DEFAULT NULL,
  `subscriberStreetAddress1` varchar(255) DEFAULT NULL,
  `subscriberStreetAddress2` varchar(255) DEFAULT NULL,
  `subscriberCity` varchar(255) DEFAULT NULL,
  `subscriberState` varchar(255) DEFAULT NULL,
  `subscriberZip` varchar(255) DEFAULT NULL,
  `isRequestValid` enum('Y','N') NOT NULL DEFAULT 'Y',
  `rejectReason` varchar(255) DEFAULT NULL,
  `followUpAction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `271MessagesFromSurescriptId` (`271MessagesFromSurescriptId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
