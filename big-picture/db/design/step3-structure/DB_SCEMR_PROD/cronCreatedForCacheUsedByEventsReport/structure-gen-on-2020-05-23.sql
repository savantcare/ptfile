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
-- Table structure for table `cronCreatedForCacheUsedByEventsReport`
--

DROP TABLE IF EXISTS `cronCreatedForCacheUsedByEventsReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedForCacheUsedByEventsReport` (
  `companyID` int(11) unsigned DEFAULT NULL,
  `eventID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `patientUID` int(11) unsigned DEFAULT NULL,
  `patientFullName` varchar(255) DEFAULT NULL,
  `patientDOB` date DEFAULT NULL,
  `scEmployeeUID` int(11) unsigned DEFAULT NULL,
  `scEmployeeFullName` varchar(255) DEFAULT NULL,
  `eventTypeName` varchar(255) NOT NULL,
  `eventSummary` varchar(128) DEFAULT NULL,
  `eventStatusName` varchar(255) DEFAULT NULL,
  `eventStatusUpdatedByUID` int(11) unsigned DEFAULT NULL,
  `eventStatusUpdatedByFullName` varchar(255) DEFAULT NULL,
  `eventLockStatus` enum('Yes','No') NOT NULL COMMENT 'Yes = Locked, no = Not lockeN',
  `eventCreatedOn` datetime DEFAULT NULL,
  `eventCreatedByUID` int(11) unsigned DEFAULT NULL,
  `eventCreatedByFullName` varchar(255) NOT NULL,
  `eventUpdatedOn` datetime DEFAULT NULL,
  `eventUpdatedByUID` int(11) unsigned DEFAULT NULL,
  `eventUpdatedByFullName` varchar(255) DEFAULT NULL,
  `eventStartDateTime` datetime DEFAULT NULL,
  `eventDurationInMinutes` int(11) DEFAULT NULL,
  `eventActualTimeSpentInMinutes` int(11) DEFAULT NULL,
  `eventNoOfCptCodeAssigned` smallint(2) NOT NULL DEFAULT '0',
  `eventNoOfZeroAmountExpectedCptCodeAssigned` smallint(2) NOT NULL DEFAULT '0',
  `eventEndDateTime` datetime DEFAULT NULL,
  `codingTotalAmountExpected` decimal(10,2) DEFAULT NULL,
  `codingTotalAmountReceived` decimal(10,2) DEFAULT NULL,
  `paymentTotalClaimed` decimal(10,2) DEFAULT NULL,
  `paymentTotalReceived` decimal(10,2) DEFAULT NULL,
  `paymentTotalRemaining` decimal(10,2) DEFAULT NULL COMMENT 'paymentTotalClaimed - paymentTotalReceived',
  `taskAssignedByUID` int(11) unsigned DEFAULT NULL,
  `taskAssignedByFullName` varchar(255) DEFAULT NULL,
  `taskRoleAssignedToUID` int(11) unsigned DEFAULT NULL,
  `taskRoleAssignedToFullName` varchar(255) DEFAULT NULL,
  `allNotesAreLocked` enum('Yes','No','Not applicable') DEFAULT NULL,
  `typeOfNote1` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote1` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote1` varchar(255) DEFAULT NULL,
  `typeOfNote2` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote2` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote2` varchar(255) DEFAULT NULL,
  `typeOfNote3` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote3` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote3` varchar(255) DEFAULT NULL,
  `typeOfNote4` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote4` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote4` varchar(255) DEFAULT NULL,
  `typeOfNote5` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote5` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote5` varchar(255) DEFAULT NULL,
  `typeOfNote6` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote6` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote6` varchar(255) DEFAULT NULL,
  `typeOfNote7` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote7` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote7` varchar(255) DEFAULT NULL,
  `typeOfNote8` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote8` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote8` varchar(255) DEFAULT NULL,
  `typeOfNote9` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote9` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote9` varchar(255) DEFAULT NULL,
  `typeOfNote10` varchar(255) DEFAULT NULL,
  `uidOfCreatedByForNote10` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedByForNote10` varchar(255) DEFAULT NULL,
  `notesLockedOn` datetime DEFAULT NULL,
  `notesLockedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `notesLockedByUID` int(11) DEFAULT NULL,
  `notesLockedByFullName` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `toBeCoSignedByUID` int(11) unsigned DEFAULT NULL,
  `toBeCoSignedByFullName` varchar(255) DEFAULT NULL,
  `coSignedOnDateTime` datetime DEFAULT NULL,
  `assetID` int(11) DEFAULT NULL,
  `assetName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`eventID`)
) ENGINE=InnoDB AUTO_INCREMENT=433107 DEFAULT CHARSET=utf8 COMMENT='This is a denomalized table. Advnatages 1. easier to program 2. fast page load for end user';
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
