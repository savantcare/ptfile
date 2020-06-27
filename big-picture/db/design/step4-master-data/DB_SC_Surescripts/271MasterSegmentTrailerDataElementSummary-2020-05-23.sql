use DB_SC_Surescripts
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Surescripts
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
-- Table structure for table `271MasterSegmentTrailerDataElementSummary`
--

DROP TABLE IF EXISTS `271MasterSegmentTrailerDataElementSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterSegmentTrailerDataElementSummary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `segmentTrailerMasterId` int(11) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `dataElement` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `attributes` varchar(255) NOT NULL,
  `isAdditionalCode` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `segmentTrailerMasterId` (`segmentTrailerMasterId`),
  CONSTRAINT `271segmenttrailerdataelementsummarymaster_ibfk_1` FOREIGN KEY (`segmentTrailerMasterId`) REFERENCES `271MasterSegmentTrailer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `271MasterSegmentTrailerDataElementSummary`
--

LOCK TABLES `271MasterSegmentTrailerDataElementSummary` WRITE;
/*!40000 ALTER TABLE `271MasterSegmentTrailerDataElementSummary` DISABLE KEYS */;
INSERT INTO `271MasterSegmentTrailerDataElementSummary` VALUES (1,1,'SE01','96','Number of Included Segments','N0 1/10','no'),(2,1,'SE02','329','Transaction Set Control Number','AN 4/9','no'),(3,2,'GE01','97','Number of Transaction Sets Included','N0 1/6','no'),(4,2,'GE02','28','Group Control Number','N0 1/9','no'),(7,3,'IEA01','I16','Number of Included Functional Groups','N0 1/5','no'),(8,3,'IEA02','I12','Interchange Control Number','N0 9/9','no');
/*!40000 ALTER TABLE `271MasterSegmentTrailerDataElementSummary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
