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
-- Table structure for table `cronCreatedForCacheUsedByPatientInsuranceInfoUpdateReport`
--

DROP TABLE IF EXISTS `cronCreatedForCacheUsedByPatientInsuranceInfoUpdateReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedForCacheUsedByPatientInsuranceInfoUpdateReport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `patientName` varchar(255) DEFAULT NULL,
  `patientDOB` date DEFAULT NULL,
  `latestAppointmentID` int(11) DEFAULT NULL,
  `latestAppointmentDate` datetime DEFAULT NULL,
  `numberOfEventCodedButIncomingPaymentEntryNotDone` int(11) NOT NULL DEFAULT '0',
  `detailsOfEventCodedButIncomingPaymentEntryNotDone` longtext,
  `numberOfEventCodedButNoIncomingPaymentEntryFoundForInsuranceCom` int(11) NOT NULL DEFAULT '0',
  `detailsOfEventCodedButNoIncomingPaymentEntryFoundForInsuranceCom` longtext,
  `numberOfEventUnsuccessfulByRobots` int(11) NOT NULL DEFAULT '0',
  `detailsOfEventUnsuccessfulByRobots` longtext,
  `copayUpdatedOn` datetime DEFAULT NULL,
  `copayUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  `copayUpdatedByUID` int(11) DEFAULT NULL,
  `copayUpdatedByName` varchar(255) DEFAULT NULL,
  `copayCheckedByUID` int(11) DEFAULT NULL,
  `copayCheckedByName` varchar(255) DEFAULT NULL,
  `copayCheckedOn` datetime DEFAULT NULL,
  `copayCheckedOnTimeZone` varchar(255) DEFAULT NULL,
  `annualDeductibleUpdatedOn` datetime DEFAULT NULL,
  `annualDeductibleUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  `annualDeductibleUpdatedByUID` int(11) DEFAULT NULL,
  `annualDeductibleUpdatedByName` varchar(255) DEFAULT NULL,
  `annualDeductibleCheckedByUID` int(11) DEFAULT NULL,
  `annualDeductibleCheckedByName` varchar(255) DEFAULT NULL,
  `annualDeductibleCheckedOn` datetime DEFAULT NULL,
  `annualDeductibleCheckedOnTimeZone` varchar(255) DEFAULT NULL,
  `annualDeductibleRemainingUpdatedOn` datetime DEFAULT NULL,
  `annualDeductibleRemainingUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  `annualDeductibleRemainingUpdatedByUID` int(11) DEFAULT NULL,
  `annualDeductibleRemainingUpdatedByName` varchar(255) DEFAULT NULL,
  `annualDeductibleRemainingCheckedByUID` int(11) DEFAULT NULL,
  `annualDeductibleRemainingCheckedByName` varchar(255) DEFAULT NULL,
  `annualDeductibleRemainingCheckedOn` datetime DEFAULT NULL,
  `annualDeductibleRemainingCheckedOnTimeZone` varchar(255) DEFAULT NULL,
  `coinsuranceUpdatedOn` datetime DEFAULT NULL,
  `coinsuranceUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  `coinsuranceUpdatedByUID` int(11) DEFAULT NULL,
  `coinsuranceUpdatedByName` varchar(255) DEFAULT NULL,
  `coinsuranceCheckedByUID` int(11) DEFAULT NULL,
  `coinsuranceCheckedByName` varchar(255) DEFAULT NULL,
  `coinsuranceCheckedOn` datetime DEFAULT NULL,
  `coinsuranceCheckedOnTimeZone` varchar(255) DEFAULT NULL,
  `lastUpdatedOn` datetime DEFAULT NULL,
  `lastUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=latin1;
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
