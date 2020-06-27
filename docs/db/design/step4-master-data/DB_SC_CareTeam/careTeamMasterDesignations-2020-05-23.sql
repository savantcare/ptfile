use DB_SC_CareTeam
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_CareTeam
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
-- Table structure for table `careTeamMasterDesignations`
--

DROP TABLE IF EXISTS `careTeamMasterDesignations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `careTeamMasterDesignations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `companyID` int(10) unsigned NOT NULL,
  `designationName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careTeamMasterDesignations`
--

LOCK TABLES `careTeamMasterDesignations` WRITE;
/*!40000 ALTER TABLE `careTeamMasterDesignations` DISABLE KEYS */;
INSERT INTO `careTeamMasterDesignations` VALUES (1,1,'Psychiatrist\r\n','2015-06-24 11:02:33','0000-00-00 00:00:00'),(2,1,'Admin','2015-05-08 18:11:25','0000-00-00 00:00:00'),(3,1,'Revenue cycle manager\r\n','2015-05-18 12:46:20','0000-00-00 00:00:00'),(4,3,'Psychiatrist','2015-08-05 07:00:39','0000-00-00 00:00:00'),(5,1,'12345','2015-08-05 07:05:08','0000-00-00 00:00:00'),(6,3,'Version 1 Audited by','2015-08-07 06:28:38','0000-00-00 00:00:00'),(7,3,'Admin Asst.','2015-08-12 03:29:47','0000-00-00 00:00:00'),(8,3,'Primary team','2016-01-05 04:51:01','0000-00-00 00:00:00'),(10,3,'Consulting Therapist','2016-06-01 19:45:06','0000-00-00 00:00:00'),(11,3,'Therapist','2016-07-23 00:05:05','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `careTeamMasterDesignations` ENABLE KEYS */;
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
