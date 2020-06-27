use DB_SC_Pharmacy_CT_V20;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Pharmacy
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
-- Table structure for table `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy` (
  `uuid` CHAR(36) NOT NULL,
  `uuidOfPatient` CHAR(36) NOT NULL,
  `createdByUUID` CHAR(36) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pharmacyName` varchar(128) DEFAULT NULL,
  `isPharmacyOnSurescripts` enum('On surescripts','Not on surescripts') DEFAULT NULL,
  `NCPDPID` varchar(255) DEFAULT NULL,
  `NPI` varchar(100) DEFAULT NULL,
  `pharmacyStreetAddressLine1` varchar(128) DEFAULT NULL,
  `pharmacyStreetAddressLine2` varchar(128) DEFAULT NULL,
  `pharmacyCity` varchar(128) DEFAULT NULL,
  `pharmacyState` varchar(128) DEFAULT NULL,
  `pharmacyZip` varchar(50) DEFAULT NULL,
  `pharmacyPhone` varchar(128) DEFAULT NULL,
  `pharmacyFax` varchar(128) DEFAULT NULL,
  `pharmacyURL` varchar(128) DEFAULT NULL,
  `pharmacyNotes` text,
  `isItPrimaryOrSecondary` tinyint(4) unsigned DEFAULT '0' COMMENT '1: primary, 2: secondary',
  `recordChangedByUUID` CHAR(36) NOT NULL,
  `recordChangedOnDateTime` datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
  `recordChangedFromIPAddress` varchar(20) NOT NULL,
  `notes` text,
  `isDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uuid`),
  KEY `uuidOfPatient` (`uuidOfPatient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;
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
