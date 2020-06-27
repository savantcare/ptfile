use DB_SCEMR_PROD;
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
-- Table structure for table `cptCodesForAnAppointment`
--

DROP TABLE IF EXISTS `cptCodesForAnAppointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptCodesForAnAppointment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(11) unsigned DEFAULT NULL,
  `cptCodeID` int(11) unsigned DEFAULT NULL,
  `cptCodeAmountExpectedAsPerContractOnCodingDate` decimal(10,2) NOT NULL,
  `isThisEntityLockedAndHenceNonEditable` enum('Yes','No') NOT NULL,
  `isThisCodeAllowedFromSCBrainCoding` enum('yes','no') NOT NULL DEFAULT 'yes',
  `noteForDisallowingInSCBrain` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `updated_by` int(11) unsigned DEFAULT NULL,
  `createdFrom` varchar(11) DEFAULT NULL,
  `isCachedForPaymentsReport` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not cached, 1 = cached',
  `timeZoneForCreatedAt` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `timeZoneForUpdatedAt` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cptCodeID` (`cptCodeID`),
  KEY `eventID` (`eventID`),
  CONSTRAINT `cptCodesForAnAppointment_ibfk_1` FOREIGN KEY (`cptCodeID`) REFERENCES `cptCodesMaster` (`id`),
  CONSTRAINT `cptCodesForAnAppointment_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `remEvents` (`eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=89584 DEFAULT CHARSET=utf8;
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
