use DB_SC_BillingMaster
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_BillingMaster
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
-- Table structure for table `codesForAppointmentTimeMaster`
--

DROP TABLE IF EXISTS `codesForAppointmentTimeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codesForAppointmentTimeMaster` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `appointmentType` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `createdById` int(11) unsigned NOT NULL,
  `createdOnDateTime` datetime NOT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codesForAppointmentTimeMaster`
--

LOCK TABLES `codesForAppointmentTimeMaster` WRITE;
/*!40000 ALTER TABLE `codesForAppointmentTimeMaster` DISABLE KEYS */;
INSERT INTO `codesForAppointmentTimeMaster` VALUES (1,'>10','first appointment','99201',549,'2017-01-19 00:00:00','IST'),(2,'>20','first appointment','99202',549,'2017-01-20 13:54:48','IST'),(3,'>30','first appointment','99203',549,'2017-01-20 15:22:04','IST'),(4,'>45','first appointment','99204',549,'2017-01-20 15:25:49','IST'),(5,'>60','first appointment','99205',549,'2017-01-20 15:25:59','IST'),(6,'>5','follow up appointment','99211',549,'2017-01-20 15:26:47','IST'),(7,'>10','follow up appointment','99212',549,'2017-01-20 15:54:16','IST'),(8,'>15','follow up appointment','99213',549,'2017-01-20 15:54:19','IST'),(9,'>25','follow up appointment','99214',549,'2017-01-20 15:54:23','IST'),(10,'>40','follow up appointment','99215',549,'2017-01-20 15:54:50','IST');
/*!40000 ALTER TABLE `codesForAppointmentTimeMaster` ENABLE KEYS */;
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
