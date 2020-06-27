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
-- Table structure for table `patientsMedicationOrder`
--

DROP TABLE IF EXISTS `patientsMedicationOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientsMedicationOrder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uidOfPatient` int(11) NOT NULL,
  `uidOfCreatedBy` int(11) NOT NULL,
  `drugCode` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_at_timezone` varchar(11) DEFAULT NULL,
  `isItLocked` enum('no','yes') NOT NULL DEFAULT 'no',
  `noteToPharmacist` text,
  `directionToPatient` text,
  `deletedByUid` int(11) DEFAULT NULL,
  `deletedDateTime` datetime DEFAULT NULL,
  `deletedTimeZone` varchar(11) DEFAULT NULL,
  `discontinueByUid` int(11) DEFAULT NULL,
  `discontinueOnDateTime` datetime DEFAULT NULL,
  `discontinueOnTimeZone` varchar(10) DEFAULT NULL,
  `discontinueReason` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `numberOfRefills` varchar(255) DEFAULT NULL,
  `orderType` varchar(255) DEFAULT NULL,
  `daysSupply` varchar(255) DEFAULT NULL,
  `isDispenseAsWritten` varchar(255) DEFAULT NULL,
  `submittedToAllscriptUID` int(11) DEFAULT NULL,
  `submittedToAllscriptDateTime` datetime DEFAULT NULL,
  `submittedToAllscripTimeZone` varchar(255) DEFAULT NULL,
  `pharmacyNCPDPID` varchar(255) DEFAULT NULL,
  `pharmacySCID` varchar(255) DEFAULT NULL,
  `otherNote` varchar(255) DEFAULT NULL,
  `orderingProviderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=latin1;
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
