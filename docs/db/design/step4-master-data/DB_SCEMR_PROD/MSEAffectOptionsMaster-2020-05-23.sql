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
-- Table structure for table `MSEAffectOptionsMaster`
--

DROP TABLE IF EXISTS `MSEAffectOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEAffectOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MSEAffectOptionsMaster`
--

LOCK TABLES `MSEAffectOptionsMaster` WRITE;
/*!40000 ALTER TABLE `MSEAffectOptionsMaster` DISABLE KEYS */;
INSERT INTO `MSEAffectOptionsMaster` VALUES (1,'Euthymic','2015-05-01 08:20:16',1),(2,'Dysphoric','2015-05-01 08:20:16',0),(3,'Irritable','2015-05-01 08:20:16',0),(4,'Angry','2015-05-01 08:20:16',0),(5,'Bright','2015-05-01 08:20:16',0),(6,'Euphoric','2015-05-01 08:20:16',0),(7,'Labile','2015-05-01 08:20:16',0),(8,'Stable','2015-05-01 08:20:16',0),(9,'Mood congruent','2015-05-01 08:20:16',0),(10,'Mood incongruent','2015-05-01 08:20:16',0),(11,'Expansive','2015-05-01 08:20:16',0),(12,'Full Range','2015-05-01 08:20:16',0),(13,'Constricted','2015-05-01 08:20:16',0),(14,'Blunted','2015-05-01 08:20:16',0),(15,'Flat','2015-05-01 08:20:16',0),(16,'Anxious','2015-05-01 08:20:16',0),(17,'Tearful','2015-07-17 06:50:32',0),(18,'Other','2015-07-17 06:50:32',0),(19,'Dysthymic','2016-09-06 14:52:17',0),(20,'Stable','2016-09-15 13:16:30',1),(21,'Full-range','2016-09-15 13:16:30',1),(22,'Mood congruent','2016-09-15 13:16:30',1);
/*!40000 ALTER TABLE `MSEAffectOptionsMaster` ENABLE KEYS */;
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
