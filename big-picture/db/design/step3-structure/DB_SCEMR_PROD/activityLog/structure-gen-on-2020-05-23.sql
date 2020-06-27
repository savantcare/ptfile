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
-- Table structure for table `activityLog`
--

DROP TABLE IF EXISTS `activityLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activityLog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uidOfActivityDoneBy` int(11) unsigned DEFAULT NULL,
  `uidOfActivityDoneOn` int(11) unsigned DEFAULT NULL,
  `idOfEventOnWhichAcitivtyIsDone` int(11) DEFAULT NULL,
  `timeOfActivity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timezoneAbbreviationForActivity` varchar(255) DEFAULT NULL,
  `clientIPAddressForActivity` text,
  `typeOfSection` varchar(50) DEFAULT NULL,
  `pluginID` tinyint(4) unsigned DEFAULT NULL,
  `typeOfActivity` enum('add','edit','delete','open','review','rating','priority','api request','discontinued') NOT NULL,
  `pluginRowIDWhereActivityIsDone` int(11) unsigned DEFAULT NULL,
  `pluginRowNameWhereActivityIsDone` varchar(255) DEFAULT NULL,
  `pluginFieldName` varchar(255) DEFAULT NULL,
  `oldValue` varchar(2000) DEFAULT NULL,
  `newValue` varchar(2000) DEFAULT NULL,
  `apiRequestText` text,
  `apiResponseText` text,
  `othersDetailInfo` text,
  PRIMARY KEY (`id`),
  KEY `uidOfActivityDoneBy` (`uidOfActivityDoneBy`),
  KEY `uidOfActivityDoneOn` (`uidOfActivityDoneOn`),
  KEY `pluginID` (`pluginID`),
  KEY `eventId` (`idOfEventOnWhichAcitivtyIsDone`)
) ENGINE=InnoDB AUTO_INCREMENT=9751133 DEFAULT CHARSET=latin1;
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
