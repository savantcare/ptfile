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
-- Table structure for table `voiceCallQueueOutgoingLogTable`
--

DROP TABLE IF EXISTS `voiceCallQueueOutgoingLogTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voiceCallQueueOutgoingLogTable` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idOfVoiceCallQueue` int(11) unsigned NOT NULL,
  `source` varchar(255) NOT NULL DEFAULT '16506902362' COMMENT '16506902362 is SC phone number',
  `destination` varchar(255) DEFAULT NULL COMMENT 'should be numbers only, having country code and phone number without any delimiter. otherwise notify developer by email.',
  `answerURL` varchar(255) DEFAULT NULL COMMENT 'must have an api that is able to generate xml to be used by plivo',
  `answerMethod` enum('GET','POST') NOT NULL DEFAULT 'GET',
  `authID` varchar(255) NOT NULL DEFAULT 'MAMGU0MTC2ODG5YMRHMZ' COMMENT 'auth_id of plivo acount',
  `authToken` varchar(255) NOT NULL DEFAULT 'MGI0YWU4ZDM2ZTcyYzdhNjFlNjljOTg3MGI0ODNk' COMMENT 'auth_token of plivo account',
  `debugMode` enum('TRUE','FALSE') NOT NULL DEFAULT 'FALSE' COMMENT 'will be used by developer for testing',
  `emergencyMessage` enum('Yes','No') NOT NULL DEFAULT 'No',
  `additionalInfo` text COMMENT 'info to debug if malformed entry happens',
  `respectiveDeveloper` varchar(255) DEFAULT NULL COMMENT 'to whom send email incase of malformed entry',
  `reminderID` int(11) unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dataString` text,
  `plivoApiResponse` text,
  `reminderStatusUpdation` enum('na','sent','failed') NOT NULL DEFAULT 'na',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4741 DEFAULT CHARSET=latin1;
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
