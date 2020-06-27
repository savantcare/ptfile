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
-- Table structure for table `cronCreatedForCacheUsedByUserReport`
--

DROP TABLE IF EXISTS `cronCreatedForCacheUsedByUserReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedForCacheUsedByUserReport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) unsigned NOT NULL,
  `userFullName` varchar(255) NOT NULL,
  `userRoleTypeID` int(11) unsigned DEFAULT NULL,
  `userRoleTypeName` varchar(255) DEFAULT NULL,
  `userDOB` date DEFAULT NULL,
  `numberOfLoggedIn` int(11) DEFAULT NULL,
  `userLastLoggedIn` datetime DEFAULT NULL,
  `userLastLoggedInTimeZone` varchar(255) DEFAULT NULL,
  `primaryCareTeamID` int(11) unsigned DEFAULT NULL,
  `primaryCareTeamName` varchar(255) DEFAULT NULL,
  `userCreatedOn` datetime DEFAULT NULL,
  `userCreatedOnTimeZone` varchar(255) DEFAULT NULL,
  `userCreatedByUID` int(11) unsigned DEFAULT NULL,
  `userCreatedByFullName` varchar(255) DEFAULT NULL,
  `userCity` varchar(200) DEFAULT NULL,
  `userState` varchar(200) DEFAULT NULL,
  `userInsuranceCompany1UID` int(11) DEFAULT NULL,
  `userInsuranceCompany1FullName` varchar(200) DEFAULT NULL,
  `userInsuranceCompany2UID` int(11) DEFAULT NULL,
  `userInsuranceCompany2FullName` varchar(200) DEFAULT NULL,
  `firstEventID` int(10) unsigned DEFAULT NULL,
  `firstAppointmentDate` datetime DEFAULT NULL,
  `firstAppointmentCreatedOn` datetime DEFAULT NULL,
  `firstAppointmentCreatedByUID` int(11) unsigned DEFAULT NULL,
  `firstAppointmentCreatedByFullName` varchar(255) DEFAULT NULL,
  `lastAppointmentID` int(11) unsigned DEFAULT NULL,
  `lastAppointmentDate` datetime DEFAULT NULL,
  `nextScheduledAppointmentID` int(11) unsigned DEFAULT NULL,
  `nextScheduledAppointmentDate` datetime DEFAULT NULL,
  `noOfTotalAppointments` int(11) DEFAULT NULL,
  `noOfCancelledAppointments` int(11) DEFAULT NULL,
  `noOfNoShowAppointments` int(11) DEFAULT NULL,
  `noOfUnlockedAppointments` int(11) DEFAULT NULL,
  `referredByUID` int(11) unsigned DEFAULT NULL,
  `referredByFullName` varchar(255) DEFAULT NULL,
  `noOfTasks` int(11) DEFAULT NULL,
  `noOfPhoneEncounter` int(11) DEFAULT NULL,
  `noOfPrescriptionRefill` int(11) DEFAULT NULL,
  `noOfOfficialLetters` int(11) DEFAULT NULL,
  `noOfRedFlag` int(11) DEFAULT NULL,
  `noOfSocialHistory` int(11) DEFAULT NULL,
  `noOfContacts` int(11) DEFAULT NULL,
  `noOfMedications` int(11) DEFAULT NULL,
  `noOfGoals` int(11) DEFAULT NULL,
  `noOfEmergencyContacts` int(11) DEFAULT NULL,
  `noOfSymptoms` int(11) DEFAULT NULL,
  `noOfMSE` int(11) DEFAULT NULL,
  `noOfROS` int(11) DEFAULT NULL,
  `companyID` int(11) DEFAULT NULL,
  `paymentDefaulter` enum('Yes','No') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2785873 DEFAULT CHARSET=latin1;
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
