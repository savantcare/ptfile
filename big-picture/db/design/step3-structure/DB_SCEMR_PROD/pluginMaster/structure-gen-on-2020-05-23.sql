use DB_SCEMR_PROD;
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
-- Table structure for table `pluginMaster`
--

DROP TABLE IF EXISTS `pluginMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pluginMaster` (
  `pluginID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `sectionID` tinyint(4) unsigned DEFAULT NULL,
  `pluginTitle` varchar(255) DEFAULT NULL,
  `hotkey` varchar(50) DEFAULT NULL,
  `typeOfSectionThisPluginIsUsefulIn` varchar(255) DEFAULT NULL COMMENT 'Each section has further classification of mutually exclusive types. Like users have user roles and events have event types. Some plugins like Coding and payment for section events are not applicable when the event type is conference. We will store this information here.',
  `pluginCategoryMasterId` tinyint(3) unsigned DEFAULT NULL,
  `parentPluginId` tinyint(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`pluginID`),
  KEY `sectionID` (`sectionID`),
  KEY `parentPluginId` (`parentPluginId`),
  KEY `pluginCategoryMasterId` (`pluginCategoryMasterId`),
  CONSTRAINT `pluginMaster_ibfk_1` FOREIGN KEY (`sectionID`) REFERENCES `sectionsMaster` (`id`),
  CONSTRAINT `pluginMaster_ibfk_2` FOREIGN KEY (`parentPluginId`) REFERENCES `pluginMaster` (`pluginID`),
  CONSTRAINT `pluginMaster_ibfk_3` FOREIGN KEY (`pluginCategoryMasterId`) REFERENCES `pluginMasterCategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='ok by VK on 4/8';
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
