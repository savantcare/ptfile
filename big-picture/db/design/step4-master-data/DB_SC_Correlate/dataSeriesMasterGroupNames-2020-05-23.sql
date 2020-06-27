use DB_SC_Correlate
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Correlate
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
-- Table structure for table `dataSeriesMasterGroupNames`
--

DROP TABLE IF EXISTS `dataSeriesMasterGroupNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataSeriesMasterGroupNames` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `correlatedTypeName` varchar(100) NOT NULL,
  `createdAtTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataSeriesMasterGroupNames`
--

LOCK TABLES `dataSeriesMasterGroupNames` WRITE;
/*!40000 ALTER TABLE `dataSeriesMasterGroupNames` DISABLE KEYS */;
INSERT INTO `dataSeriesMasterGroupNames` VALUES (1,'Body measurement','2015-04-21 12:53:10'),(2,'Diagnosis','2015-04-21 12:53:37'),(3,'Symptoms','2015-04-21 12:53:53'),(4,'Sleep','2015-04-21 12:54:07'),(5,'Thoughts','2015-04-21 12:54:20'),(6,'Medications','2015-04-21 12:54:32'),(7,'Social History','2015-04-21 12:54:47'),(8,'Review of systems','2015-04-21 12:55:04'),(9,'Nous Gram','2015-05-01 13:19:49'),(10,'Substance Use','2015-05-13 11:35:14'),(11,'Appointments','2015-09-04 12:23:39'),(12,'Allergies','2015-09-10 11:44:18'),(13,'Hospitalizations','2015-09-24 13:12:13'),(14,'Goal','2015-09-24 13:12:27'),(15,'Screening','2015-10-13 15:00:42'),(16,'Mood Tracker','2016-11-08 07:24:47'),(17,'Self Harm','2017-07-28 13:15:07');
/*!40000 ALTER TABLE `dataSeriesMasterGroupNames` ENABLE KEYS */;
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
