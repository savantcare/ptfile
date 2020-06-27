use DB_SC_Meds_and_Refill-error-recovery;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Meds_and_Refill-error-recovery
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
-- Table structure for table `medicationRefill`
--

DROP TABLE IF EXISTS `medicationRefill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationRefill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `medicationPatientID` int(11) unsigned DEFAULT '0',
  `uidOfCreatedBy` int(11) unsigned DEFAULT '0',
  `uidPrescribeBy` int(11) DEFAULT NULL,
  `uidPrescribedBy` int(11) DEFAULT NULL,
  `numberOfRefills` int(11) unsigned DEFAULT '0',
  `qty` int(11) unsigned DEFAULT '0',
  `toBeOrderedOn` date DEFAULT NULL,
  `noteForPatient` text,
  `status` tinyint(3) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `createdAtTimeZone` varchar(3) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updatedAtTimeZone` varchar(3) DEFAULT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no',
  `isDeleted` int(1) NOT NULL,
  `directionsForPatient` text,
  PRIMARY KEY (`id`),
  KEY `medsPatientIdWithMedsRefill` (`medicationPatientID`),
  KEY `statusId` (`status`),
  CONSTRAINT `medicationRefill_ibfk_1` FOREIGN KEY (`medicationPatientID`) REFERENCES `medicationPatients` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26196 DEFAULT CHARSET=utf8;
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
