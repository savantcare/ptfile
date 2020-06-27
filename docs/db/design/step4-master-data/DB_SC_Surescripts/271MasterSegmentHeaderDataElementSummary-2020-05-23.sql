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
-- Table structure for table `271MasterSegmentHeaderDataElementSummary`
--

DROP TABLE IF EXISTS `271MasterSegmentHeaderDataElementSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterSegmentHeaderDataElementSummary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `segmentHeaderMasterId` int(11) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `dataElement` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `attributes` varchar(255) NOT NULL,
  `isAdditionalCode` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `segmentHeaderMasterId` (`segmentHeaderMasterId`),
  CONSTRAINT `271MasterSegmentHeaderDataElementSummary_ibfk_1` FOREIGN KEY (`segmentHeaderMasterId`) REFERENCES `271MasterSegmentHeader` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `271MasterSegmentHeaderDataElementSummary`
--

LOCK TABLES `271MasterSegmentHeaderDataElementSummary` WRITE;
/*!40000 ALTER TABLE `271MasterSegmentHeaderDataElementSummary` DISABLE KEYS */;
INSERT INTO `271MasterSegmentHeaderDataElementSummary` VALUES (1,1,'ISA01','I01','Authorization Information Qualifier','ID 2/2','yes'),(2,1,'ISA02','I02','Authorization Information','AN 10/10','no'),(3,1,'ISA03','I03','Security Information Qualifier','ID 2/2','yes'),(4,1,'ISA04','I04','Security Information','AN 10/10','no'),(5,1,'ISA05','I05','Interchange ID Qualifier','ID 2/2','yes'),(6,1,'ISA06','I06','Interchange Sender ID','AN 15/15','no'),(7,1,'ISA07','I05','Interchange ID Qualifier','ID 2/2','yes'),(8,1,'ISA08','I07','Interchange Receiver ID','AN 15/15','no'),(9,1,'ISA09','I08','Interchange Date','DT 6/6','no'),(10,1,'ISA10','I09','Interchange Time','TM 4/4','no'),(11,1,'ISA11','I65','Repetition Separator','1/1','no'),(12,1,'ISA12','I11','Interchange Control Version Number','ID 5/5','yes'),(13,1,'ISA13','I12','Interchange Control Number','N0 9/9','no'),(14,1,'ISA14','I13','Acknowledgment Requested','D 1/1','yes'),(15,1,'ISA15','I14','Interchange Usage Indicator','AN 1/1','yes'),(16,1,'ISA16','I15','Component Element Separator','AN 1/1','no'),(17,2,'GS01','479','Functional Identifier Code','ID 2/2','no'),(18,2,'GS02','142','Application Sender’s Code','AN 2/15','no'),(19,2,'GS03','124','Application Receiver’s Code','AN 2/15','no'),(20,2,'GS04','373','Date','DT 8/8','no'),(21,2,'GS05','337','Time','TM 4/8','no'),(22,2,'GS06','28','Group Control Number','N0 1/9','no'),(23,2,'GS07','455','Responsible Agency Code','ID 1/2','yes'),(24,2,'GS08','480','Version / Release / Industry Identifier Code','AN 1/12','yes'),(26,3,'ST01','143','Transaction Set Identifier Code','ID 3/3','no'),(27,3,'ST02','329','Transaction Set Control Number','AN 4/9','no'),(28,3,'ST03','1705','Implementation Convention Reference','AN 1/35','no'),(29,4,'BHT01','1005','Hierarchical Structure Code','ID 4/4','yes'),(30,4,'BHT02','353','Transaction Set Purpose Code','ID 2/2','yes'),(31,4,'BHT03','127','Reference Identification','AN 1/50','no'),(32,4,'BHT04','373','Date','DT 8/8','no'),(33,4,'BHT05','337','Time','TM 4/8','no');
/*!40000 ALTER TABLE `271MasterSegmentHeaderDataElementSummary` ENABLE KEYS */;
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
