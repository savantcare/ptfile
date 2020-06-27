use DB_SC_OfficeAllyClaims;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_OfficeAllyClaims
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
-- Table structure for table `uploadFileDetails`
--

DROP TABLE IF EXISTS `uploadFileDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadFileDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statusMasterID` int(11) NOT NULL,
  `eventId` int(11) DEFAULT NULL,
  `planID` int(11) DEFAULT NULL COMMENT '[1=>''Other'', 2=>''Medicare'',3=>''Medicaid'',4=>''Tricare'',5=>''Champva'',6=>''Group health'',7=>''Feca blk lung'']',
  `fileName` varchar(100) DEFAULT NULL,
  `requestData` longtext,
  `createdById` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdTimeZone` varchar(10) DEFAULT NULL,
  `updatedOn` datetime DEFAULT NULL,
  `updatedTimeZone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uploadStatusMaster` (`statusMasterID`),
  CONSTRAINT `uploadStatusMaster` FOREIGN KEY (`statusMasterID`) REFERENCES `uploadFileStatusMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29491 DEFAULT CHARSET=latin1;
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
