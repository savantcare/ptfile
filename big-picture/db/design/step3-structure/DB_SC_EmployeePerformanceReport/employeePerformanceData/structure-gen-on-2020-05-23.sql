use DB_SC_EmployeePerformanceReport;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_EmployeePerformanceReport
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
-- Table structure for table `employeePerformanceData`
--

DROP TABLE IF EXISTS `employeePerformanceData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeePerformanceData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `src` varchar(20) DEFAULT NULL,
  `dst` varchar(20) DEFAULT NULL,
  `recordingFileName` varchar(255) DEFAULT NULL,
  `numberOfCallsAnswered` int(11) DEFAULT NULL,
  `numberOfCallsNoAnswered` int(11) DEFAULT NULL,
  `numberOfCallsMade` int(11) DEFAULT NULL,
  `secondsOnPhone` int(11) DEFAULT NULL,
  `numberOfMessagesInVMBox` int(11) DEFAULT NULL,
  `numberOfMessagesForReachingInVMBox` int(11) DEFAULT NULL,
  `numberOfHDRClosed` int(11) DEFAULT NULL,
  `numberOfHDRCreated` int(11) DEFAULT NULL,
  `liveChat` int(11) DEFAULT NULL,
  `smsSent` int(11) DEFAULT NULL,
  `smsRecd` int(11) DEFAULT NULL,
  `emailsSent` int(11) DEFAULT NULL,
  `emailsRecd` int(11) DEFAULT NULL,
  `daysAbsent` int(11) DEFAULT NULL,
  `hdrCreat` enum('no','yes') NOT NULL DEFAULT 'no',
  `voiceMessageID` varchar(200) DEFAULT NULL,
  `ratingPoint` int(11) DEFAULT NULL,
  `ratingVoiceMessageFile` varchar(200) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57212915 DEFAULT CHARSET=latin1;
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
