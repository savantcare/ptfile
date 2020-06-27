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
-- Table structure for table `271MasterSegmentHeaderDataElementSummaryAdditionalCode`
--

DROP TABLE IF EXISTS `271MasterSegmentHeaderDataElementSummaryAdditionalCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterSegmentHeaderDataElementSummaryAdditionalCode` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `segmentHeaderDataElementSummaryMasterId` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `segmentHeaderMasterId` (`segmentHeaderDataElementSummaryMasterId`),
  CONSTRAINT `271MasterSegmentHeaderDataElementSummaryAdditionalCode_ibfk_1` FOREIGN KEY (`segmentHeaderDataElementSummaryMasterId`) REFERENCES `271MasterSegmentHeaderDataElementSummary` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `271MasterSegmentHeaderDataElementSummaryAdditionalCode`
--

LOCK TABLES `271MasterSegmentHeaderDataElementSummaryAdditionalCode` WRITE;
/*!40000 ALTER TABLE `271MasterSegmentHeaderDataElementSummaryAdditionalCode` DISABLE KEYS */;
INSERT INTO `271MasterSegmentHeaderDataElementSummaryAdditionalCode` VALUES (1,'00',1,'No Authorization Information Present (No Meaningful Information in I02)'),(2,'01',3,'Password'),(3,'ZZ',5,'Mutually Defined'),(4,'ZZ',7,'Mutually Defined'),(5,'00501',12,'Standards Approved for Publication by ASC X12 Procedures Review Board through October 2003'),(6,'0',14,'No Acknowledgment Requested'),(7,'1',14,'Interchange Acknowledgment Requested (TA1)'),(8,'P',15,'Production Data'),(9,'T',15,'Test Data'),(10,'HB',17,'Eligibility, Coverage or Benefit Information (271)'),(11,'X',23,'Accredited Standards Committee X12'),(12,'005010X279A1',24,'Draft Standards Approved for Publication by ASC X12 Procedures Review Board through October 2003, as published in this implementation guide.'),(13,'271',26,'Eligibility, Coverage or Benefit Information'),(14,'0022',29,'Information Source, Information Receiver, Subscriber, Dependent'),(15,'11',30,'Response');
/*!40000 ALTER TABLE `271MasterSegmentHeaderDataElementSummaryAdditionalCode` ENABLE KEYS */;
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
