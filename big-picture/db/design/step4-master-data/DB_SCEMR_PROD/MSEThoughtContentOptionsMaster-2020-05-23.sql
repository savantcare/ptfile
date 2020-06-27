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
-- Table structure for table `MSEThoughtContentOptionsMaster`
--

DROP TABLE IF EXISTS `MSEThoughtContentOptionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSEThoughtContentOptionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isCommon` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MSEThoughtContentOptionsMaster`
--

LOCK TABLES `MSEThoughtContentOptionsMaster` WRITE;
/*!40000 ALTER TABLE `MSEThoughtContentOptionsMaster` DISABLE KEYS */;
INSERT INTO `MSEThoughtContentOptionsMaster` VALUES (1,'No SI, intent or plan','2015-05-01 08:20:16',1),(2,'No passive death wish','2015-05-01 08:20:16',1),(3,'No HI, intent or plan','2015-05-01 08:20:16',1),(4,'No delusional thinking observed','2015-05-01 08:20:16',1),(5,'No obsessive thinking observed','2015-05-01 08:20:16',1),(6,'+ruminations','2015-05-01 08:20:16',0),(7,'+SI without intent or plan','2015-05-01 08:20:16',0),(8,'+SI as detailed below','2015-05-01 08:20:16',0),(9,'+HI as detailed below','2015-05-01 08:20:16',0),(10,'+delusions','2015-05-01 08:20:16',0),(11,'+IOR','2015-05-01 08:20:16',0),(12,'+obsessions','2015-05-01 08:20:16',0),(13,'Other','2015-05-01 08:20:16',0),(14,'Passive death wish','2016-09-06 14:52:17',0);
/*!40000 ALTER TABLE `MSEThoughtContentOptionsMaster` ENABLE KEYS */;
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
