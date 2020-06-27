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
-- Table structure for table `users_bk`
--

DROP TABLE IF EXISTS `users_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_bk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `publicUniqueId` varchar(36) DEFAULT NULL,
  `facebookID` text,
  `emailAddress` varchar(255) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `wikiUid` varchar(255) DEFAULT NULL,
  `wikiPass` varchar(255) DEFAULT NULL,
  `roleID` tinyint(4) unsigned DEFAULT NULL,
  `genderTypeID` tinyint(4) unsigned DEFAULT NULL,
  `firstName` varchar(128) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(128) DEFAULT NULL,
  `fullLastName` varchar(128) DEFAULT NULL,
  `namePrefix` varchar(100) DEFAULT NULL,
  `nameSuffix` varchar(256) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: not deleted, 1: deleted',
  `companyID` int(11) unsigned DEFAULT NULL,
  `emailValidatedOn` datetime DEFAULT NULL,
  `emailValidationCode` varchar(6) DEFAULT NULL,
  `forgotPasswordAccessToken` varchar(255) DEFAULT NULL,
  `allowedToLogin` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `allowedToMasterDB` enum('Yes','No') NOT NULL DEFAULT 'No',
  `dateOfBirth` date DEFAULT NULL COMMENT 'On 19th sept 2015 changed from 2 seperate tables to reduce complexity',
  `dateOfBirthNotes` text,
  `preferredTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `uidOfCreatedBy` int(11) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreated_at` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForUpdated_at` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `isCachedForUserReport` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Not Cached, 1 = Cached',
  `numberOfLoggedIn` tinyint(11) NOT NULL DEFAULT '0',
  `lastLoggedIn` datetime DEFAULT NULL,
  `timeZoneAbbreviationOfLastLoggedIn` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `TFASecretCode` varchar(50) DEFAULT NULL,
  `receiveOTPByUsing` enum('GoogleAuthenticator','SMS') DEFAULT NULL,
  `uidOfTFASecretCodeUpdatedBy` int(11) unsigned DEFAULT NULL,
  `forgotPasswordSecretCodeViaSMS` varchar(6) DEFAULT NULL,
  `isIntakeComplete` enum('yes','no') DEFAULT NULL,
  `isUserVisibleOnBookingSystem` enum('Yes','No') NOT NULL DEFAULT 'No',
  `googleCalendarID` varchar(255) DEFAULT NULL,
  `otpForMobileAppsLogin` varchar(10) DEFAULT NULL,
  `otpForMobileAppsLastUpdatedOn` datetime DEFAULT NULL,
  `associatedCalendarColorCode` varchar(10) DEFAULT NULL,
  `sentDataToGoogleCalender` enum('yes','no') NOT NULL DEFAULT 'yes',
  `recieveDataFromGoogleCalender` enum('yes','no') NOT NULL DEFAULT 'yes',
  `snapShot` longblob,
  `snapShotTime` datetime DEFAULT NULL,
  `skypeId` varchar(255) DEFAULT NULL,
  `facetimeId` varchar(255) DEFAULT NULL,
  `userSignUpSource` varchar(100) DEFAULT NULL,
  `temporaryDisableTFACurrentStatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailAddress` (`emailAddress`),
  KEY `roleID` (`roleID`),
  KEY `companyID` (`companyID`),
  KEY `genderTypeID` (`genderTypeID`),
  FULLTEXT KEY `name search` (`firstName`,`middleName`,`lastName`),
  CONSTRAINT `users_bk_ibfk_1` FOREIGN KEY (`companyID`) REFERENCES `companyMasters` (`id`),
  CONSTRAINT `users_bk_ibfk_2` FOREIGN KEY (`roleID`) REFERENCES `userRoleTypesMaster` (`id`),
  CONSTRAINT `users_bk_ibfk_3` FOREIGN KEY (`genderTypeID`) REFERENCES `genderTypesMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19778 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 28/7';
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
