use DB_SCEMR_PROD
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
-- Table structure for table `miscellaneousNoteTypeMaster`
--

DROP TABLE IF EXISTS `miscellaneousNoteTypeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscellaneousNoteTypeMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noteType` varchar(255) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miscellaneousNoteTypeMaster`
--

LOCK TABLES `miscellaneousNoteTypeMaster` WRITE;
/*!40000 ALTER TABLE `miscellaneousNoteTypeMaster` DISABLE KEYS */;
INSERT INTO `miscellaneousNoteTypeMaster` VALUES (4,'Phone encounter',11,'2017-10-18 01:07:39'),(5,'Lab test review',11,'2017-10-18 01:08:36'),(6,'Appointment comment',11,'2017-10-18 01:08:47'),(7,'Vacation coverage',11,'2017-10-18 01:09:34'),(8,'Treatment closure',11,'2017-10-18 01:09:49'),(9,'Coordination of care',11,'2017-10-18 01:09:58'),(10,'Other',11,'2017-10-18 01:10:06'),(11,'Text',5,'2017-11-14 12:53:52'),(12,'Claim Notes',699,'2018-02-21 08:36:25'),(13,'Billing Notes',8,'2018-02-23 15:48:14');
/*!40000 ALTER TABLE `miscellaneousNoteTypeMaster` ENABLE KEYS */;
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
