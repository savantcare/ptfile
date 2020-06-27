use DB_SC_Monitoring
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Monitoring
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
-- Table structure for table `frequencyOfMonitoringNameMaster`
--

DROP TABLE IF EXISTS `frequencyOfMonitoringNameMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `frequencyOfMonitoringNameMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type_id` int(11) NOT NULL,
  `no_of_days_when_meds_prescribed` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_on_time_zone` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `frequencyOfMonitoringNameMaster_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `frequencyOfMonitoringTypeMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequencyOfMonitoringNameMaster`
--

LOCK TABLES `frequencyOfMonitoringNameMaster` WRITE;
/*!40000 ALTER TABLE `frequencyOfMonitoringNameMaster` DISABLE KEYS */;
INSERT INTO `frequencyOfMonitoringNameMaster` VALUES (1,'Initial',1,0,699,'2018-08-20 10:14:27','IST'),(2,'3 months',1,90,699,'2018-08-20 10:15:23','IST'),(3,'6 months',1,180,699,'2018-08-20 10:15:46','IST'),(4,'Q 3 months',2,90,699,'2018-08-20 10:16:03','IST'),(5,'Q 6 months',2,180,699,'2018-08-20 10:16:34','IST'),(6,'Q 12 months',2,365,699,'2018-08-20 10:16:51','IST'),(7,'Q visit',2,30,699,'2018-08-20 10:17:16','IST'),(8,'Q 2 months',2,60,699,'2018-08-23 08:13:29','IST'),(9,'Q 4 months',2,120,549,'2019-02-05 18:10:38','Pac');
/*!40000 ALTER TABLE `frequencyOfMonitoringNameMaster` ENABLE KEYS */;
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
