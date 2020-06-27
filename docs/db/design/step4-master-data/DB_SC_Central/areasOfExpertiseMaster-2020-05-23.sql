use DB_SC_Central
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Central
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
-- Table structure for table `areasOfExpertiseMaster`
--

DROP TABLE IF EXISTS `areasOfExpertiseMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areasOfExpertiseMaster` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `companyID` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `createdAtTimezone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areasOfExpertiseMaster`
--

LOCK TABLES `areasOfExpertiseMaster` WRITE;
/*!40000 ALTER TABLE `areasOfExpertiseMaster` DISABLE KEYS */;
INSERT INTO `areasOfExpertiseMaster` VALUES (1,'OCD',3,439,'2016-11-17 15:57:02','IST'),(2,'Anxiety',3,439,'2016-11-17 16:10:49','IST'),(3,'PTSD',3,439,'2016-11-17 16:10:59','IST'),(4,'Depression',3,439,'2016-11-17 16:11:06','IST'),(5,'Bipolar Disorder',3,439,'2016-11-17 16:11:22','IST'),(6,'Schizophrenia',3,439,'2016-11-17 16:11:32','IST'),(7,'Dementia',3,439,'2016-11-17 16:11:44','IST'),(8,'ADHD',3,439,'2016-11-17 16:11:52','IST'),(9,'Panic Disorder',3,439,'2016-11-17 16:12:08','IST'),(10,'Psychosis',3,439,'2016-11-17 16:12:27','IST'),(11,'Addiction',3,439,'2016-11-17 16:14:08','IST'),(12,'Stress or anger management',3,439,'2016-11-17 16:14:18','IST'),(13,'Grief',3,439,'2016-11-17 16:14:37','IST'),(14,'Loneliness',3,439,'2016-11-17 16:14:46','IST'),(15,'Low self-esteem',3,439,'2016-11-17 16:15:03','IST'),(16,'Insomnia',3,439,'2016-11-17 16:15:20','IST'),(17,'Relationship problems',3,439,'2016-11-17 16:15:33','IST');
/*!40000 ALTER TABLE `areasOfExpertiseMaster` ENABLE KEYS */;
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
