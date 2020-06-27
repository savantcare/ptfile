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
-- Table structure for table `pluginMasterPermissionForMyPortal`
--

DROP TABLE IF EXISTS `pluginMasterPermissionForMyPortal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginMasterPermissionForMyPortal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pluginID` tinyint(4) unsigned NOT NULL,
  `roleID` tinyint(4) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleID` (`roleID`),
  KEY `pluginID` (`pluginID`),
  CONSTRAINT `pluginMasterPermissionForMyPortal_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `userRoleTypesMaster` (`id`),
  CONSTRAINT `pluginMasterPermissionForMyPortal_ibfk_2` FOREIGN KEY (`pluginID`) REFERENCES `pluginMasterForPatientPortal` (`pluginID`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pluginMasterPermissionForMyPortal`
--

LOCK TABLES `pluginMasterPermissionForMyPortal` WRITE;
/*!40000 ALTER TABLE `pluginMasterPermissionForMyPortal` DISABLE KEYS */;
INSERT INTO `pluginMasterPermissionForMyPortal` VALUES (264,1,1,'2016-01-28 15:34:32'),(265,1,4,'2016-01-28 15:34:32'),(266,1,5,'2016-01-28 15:34:32'),(267,3,3,'2016-01-28 15:34:35'),(286,4,19,'2016-01-28 15:35:15'),(287,4,2,'2016-01-28 15:35:15'),(288,4,4,'2016-01-28 15:35:15'),(289,4,3,'2016-01-28 15:35:15'),(292,5,3,'2016-01-28 15:35:51'),(293,5,21,'2016-01-28 15:35:51'),(300,7,7,'2016-01-28 15:36:09'),(301,7,18,'2016-01-28 15:36:09');
/*!40000 ALTER TABLE `pluginMasterPermissionForMyPortal` ENABLE KEYS */;
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
