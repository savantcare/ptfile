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
-- Table structure for table `conditionOfMonitoringNameMaster`
--

DROP TABLE IF EXISTS `conditionOfMonitoringNameMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditionOfMonitoringNameMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `select_option_details` text,
  `monitoring_type_id` tinyint(4) NOT NULL DEFAULT '1',
  `type_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `created_on_time_zone` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `monitoring_type_id` (`monitoring_type_id`),
  CONSTRAINT `conditionOfMonitoringNameMaster_ibfk_1` FOREIGN KEY (`monitoring_type_id`) REFERENCES `monitoringType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditionOfMonitoringNameMaster`
--

LOCK TABLES `conditionOfMonitoringNameMaster` WRITE;
/*!40000 ALTER TABLE `conditionOfMonitoringNameMaster` DISABLE KEYS */;
INSERT INTO `conditionOfMonitoringNameMaster` VALUES (1,'VPA level (trough)',NULL,1,1,699,'2018-08-20 10:06:58','IST'),(2,'CBC with differential + platelets',NULL,1,1,699,'2018-08-20 10:17:34','IST'),(3,'Ammonia level',NULL,1,1,699,'2018-08-20 10:17:45','IST'),(4,'Coagulation profile (platelet count, aPTT, PT with INR)',NULL,1,1,699,'2018-08-20 10:17:57','IST'),(5,'LFT',NULL,1,1,699,'2018-08-20 10:18:08','IST'),(6,'Pregnancy test',NULL,1,5,699,'2018-08-20 10:19:06','IST'),(7,'Written consent',NULL,1,1,699,'2018-08-20 10:19:26','IST'),(8,'Ask  - is patient on birth control? - hx of bleeding disorders and liver problems',NULL,1,1,699,'2018-08-20 10:19:43','IST'),(9,'Medications reconciled, drug interactions checked',NULL,1,1,699,'2018-08-20 10:19:57','IST'),(10,'Written consent for prescribing Lamotrigine',NULL,1,1,699,'2018-08-20 10:23:22','IST'),(11,'BUN',NULL,1,1,699,'2018-08-20 10:26:10','IST'),(12,'Creatinine',NULL,1,1,699,'2018-08-20 10:26:19','IST'),(13,'TSH',NULL,1,4,699,'2018-08-20 10:26:29','IST'),(14,'free T4',NULL,1,1,699,'2018-08-20 10:26:37','IST'),(15,'free T3',NULL,1,1,699,'2018-08-20 10:26:50','IST'),(16,'12 lead ECG',NULL,1,1,699,'2018-08-20 10:27:01','IST'),(17,'Lithium Level (trough)',NULL,1,1,699,'2018-08-20 10:27:56','IST'),(18,'Written consent for prescribing Lithium',NULL,1,1,699,'2018-08-20 10:28:10','IST'),(21,'Get patient consent',NULL,2,NULL,699,'2018-10-25 00:00:00','IST'),(22,'Blood pressure',NULL,3,NULL,699,'2018-11-01 06:53:56','IST'),(23,'Blood Sugar',NULL,3,NULL,699,'2018-11-01 06:53:56','IST'),(24,'BMI',NULL,3,NULL,699,'2018-11-01 06:53:56','IST'),(25,'Height',NULL,3,NULL,699,'2018-11-01 06:53:56','IST'),(26,'Oxigen Saturation',NULL,3,NULL,699,'2018-11-01 06:53:56','IST'),(27,'Pulse',NULL,3,NULL,699,'2018-11-01 06:53:56','IST'),(28,'Temperature',NULL,3,NULL,699,'2018-11-01 06:53:56','IST'),(29,'Waist Circumference',NULL,3,NULL,699,'2018-11-01 06:53:56','IST'),(30,'Weight',NULL,3,NULL,699,'2018-11-01 06:53:56','IST'),(31,'Check Cures Report',NULL,4,NULL,699,'2018-11-01 06:53:56','IST');
/*!40000 ALTER TABLE `conditionOfMonitoringNameMaster` ENABLE KEYS */;
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
