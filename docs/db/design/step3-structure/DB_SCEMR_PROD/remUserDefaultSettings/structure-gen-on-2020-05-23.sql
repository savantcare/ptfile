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
-- Table structure for table `remUserDefaultSettings`
--

DROP TABLE IF EXISTS `remUserDefaultSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remUserDefaultSettings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `defaultHosts` text,
  `defaultAssets` text,
  `eventTypeId` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `eventStatusId` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `eventDuration` tinyint(4) NOT NULL DEFAULT '0',
  `location` int(10) DEFAULT NULL,
  `calendarEventBackGroundColorCode` varchar(10) DEFAULT NULL,
  `calendarEventTextColorCode` varchar(10) DEFAULT NULL,
  `allowSCBrainToCancelIncompleteAppts` enum('yes','no') NOT NULL DEFAULT 'no',
  `hourGapForNewAppointment` int(10) DEFAULT NULL,
  `durationForNewAppointmentOld` int(10) DEFAULT NULL,
  `durationForRepeatAppointmentOld` int(10) DEFAULT NULL,
  `durationForAdminHours` int(10) DEFAULT NULL,
  `maxIntakesAllowedInADay` int(10) DEFAULT NULL,
  `patientDurationForInitialConsultationOld` int(10) DEFAULT NULL,
  `patientDurationForFollowupOld` int(10) DEFAULT NULL,
  `doMatchingBeforeAppt` enum('yes','no') NOT NULL DEFAULT 'no',
  `durationComboForInitialConsultation` text,
  `durationComboForFollowup` text,
  `doGoogleAdvertising` enum('yes','no') NOT NULL DEFAULT 'yes',
  `doZocdocAdvertising` enum('yes','no') NOT NULL DEFAULT 'yes',
  `superSpeciality` enum('childPsychiatrist','medicallyComplicated') DEFAULT NULL,
  `provides` text COMMENT 'This will contain a serialized array for facilities provided by provider like Therapy or Medication etc.',
  `supportedLanguages` text COMMENT 'This will contain a serialised array of the language list that the provider supports',
  `messageForPatient` text COMMENT 'If the doctor has filled out a message when “Request initial consultation is clicked” show this message to the user and they must click on “I agree” to go the next page',
  `defaultEntriesCountToShowOnAppointmentPanel` int(3) DEFAULT '2',
  `defaultRecursionType` varchar(100) DEFAULT NULL,
  `PrimaryAvailabilityCalendar` enum('internal','google') DEFAULT NULL,
  `defaultRecursionDay` varchar(100) DEFAULT NULL,
  `defaultScBrainSize` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
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
