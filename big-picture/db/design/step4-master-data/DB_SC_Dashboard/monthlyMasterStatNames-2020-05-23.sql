use DB_SC_Dashboard
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Dashboard
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
-- Table structure for table `monthlyMasterStatNames`
--

DROP TABLE IF EXISTS `monthlyMasterStatNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monthlyMasterStatNames` (
  `id` int(11) NOT NULL,
  `statName` varchar(255) NOT NULL,
  `masterReportURL` text NOT NULL,
  `valueFetchType` enum('Manual','Automatic','Calculated') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthlyMasterStatNames`
--

LOCK TABLES `monthlyMasterStatNames` WRITE;
/*!40000 ALTER TABLE `monthlyMasterStatNames` DISABLE KEYS */;
INSERT INTO `monthlyMasterStatNames` VALUES (1,'Psych team total available for appointment hours','https://www.savantcare.com/v4/app/patient-hours-report/#!/','Automatic'),(2,'Psych team total actual patient hours ','https://www.savantcare.com/v4/app/patient-hours-report/#!/','Automatic'),(3,'Therapist team total available for appointment hours','https://www.savantcare.com/v4/app/patient-hours-report/#!/','Automatic'),(4,'Therapist team actual patient hours','https://www.savantcare.com/v4/app/patient-hours-report/#!/','Automatic'),(5,'Highest occupancy ratio of individual psych','https://www.savantcare.com/v4/app/patient-hours-report/#!/details','Automatic'),(6,'Lowest occupancy ratio of individual psych','https://www.savantcare.com/v4/app/patient-hours-report/#!/details','Automatic'),(7,'Highest occupancy ratio of individual therapist','https://www.savantcare.com/v4/app/patient-hours-report/#!/details','Automatic'),(8,'Lowest occupancy ratio of individual therapist','https://www.savantcare.com/v4/app/patient-hours-report/#!/details','Automatic'),(9,'Highest RVU per available hour of individual psych','https://www.savantcare.com/v4/app/patient-hours-report/#!/details','Automatic'),(10,'Lowest RVU per available hour of individual psych','https://www.savantcare.com/v4/app/patient-hours-report/#!/details','Automatic'),(11,'Highest RVU per available hour of individual therapist','https://www.savantcare.com/v4/app/patient-hours-report/#!/details','Automatic'),(12,'Lowest RVU per available hour of individual therapist','https://www.savantcare.com/v4/app/patient-hours-report/#!/details','Automatic'),(13,'Current open hdr','','Automatic'),(14,'Current in-progress hdr','','Automatic'),(15,'Current open task','','Automatic'),(16,'Current in-progress task','','Automatic'),(17,'Yelp reputation score for SC SF','https://www.yelp.com/biz/savant-care-clinic-san-francisco-san-francisco','Manual'),(18,'Yelp reputation score for SC SJ','https://www.yelp.com/biz/savant-care-clinic-san-jose-san-jose','Manual'),(19,'Yelp reputation score for SC LS','https://www.yelp.com/biz/savant-care-clinic-los-altos-los-altos','Manual'),(20,'Yelp reputation score for SC SM','https://www.yelp.com/biz/savant-care-clinic-santa-monica-santa-monica','Manual'),(21,'Yelp reputation score for SC LP','https://www.yelp.com/biz/savant-care-clinic-la-palma-la-palma','Manual'),(22,'Google reputation score for SC SF','','Manual'),(23,'Google reputation score for SC SJ','','Manual'),(24,'Google reputation score for SC LS','','Manual'),(25,'Google reputation score for SC SM','','Manual'),(26,'Google reputation score for SC LP','','Manual'),(27,'AFA/Total available hours For SF','https://www.savantcare.com/v3/app/room-occupancy-report/','Automatic'),(28,'AFA/Total available hours For LS','https://www.savantcare.com/v3/app/room-occupancy-report/','Automatic'),(29,'AFA/Total available hours For SJ','https://www.savantcare.com/v3/app/room-occupancy-report/','Automatic');
/*!40000 ALTER TABLE `monthlyMasterStatNames` ENABLE KEYS */;
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
