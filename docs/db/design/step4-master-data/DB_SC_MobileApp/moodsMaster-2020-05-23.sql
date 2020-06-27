use DB_SC_MobileApp
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_MobileApp
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
-- Table structure for table `moodsMaster`
--

DROP TABLE IF EXISTS `moodsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moodsMaster` (
  `id` smallint(4) NOT NULL,
  `colorCode` varchar(7) NOT NULL,
  `svgMouthCode` varchar(40) NOT NULL,
  `svgMouthShadowCode` varchar(40) NOT NULL,
  `moodValue` tinyint(4) NOT NULL,
  `isDefault` enum('No','Yes') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moodsMaster`
--

LOCK TABLES `moodsMaster` WRITE;
/*!40000 ALTER TABLE `moodsMaster` DISABLE KEYS */;
INSERT INTO `moodsMaster` VALUES (1,'#8e8d8e','M 46 145 q 52 -52 104 0','M 46 148 q 52 -52 104 0',-3,'No'),(2,'#5d8398','M 50 140 q 48 -35 96 0','M 50 143 q 48 -35 96 0',-2,'No'),(3,'#5b97b8','M 54 135 q 44 -20 88 0','M 54 138 q 44 -20 88 0',-1,'No'),(4,'#41b7b7','M 58 130 q 50 0 80 0','M 58 133 q 50 0 80 0',0,'Yes'),(5,'#49b768','M 54 126 q 44 20 88 0','M 54 129 q 44 20 88 0',1,'No'),(6,'#81c127','M 50 123 q 48 35 96 0','M 50 126 q 48 35 96 0',2,'No'),(7,'#edb220','M 46 120 q 52 52 104 0','M 46 123 q 52 52 104 0',3,'No');
/*!40000 ALTER TABLE `moodsMaster` ENABLE KEYS */;
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
