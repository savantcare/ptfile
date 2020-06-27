use DB_SC_ServiceStatement
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_ServiceStatement
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
-- Table structure for table `conflictRelationshipBetweenServiceStatementMaster`
--

DROP TABLE IF EXISTS `conflictRelationshipBetweenServiceStatementMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conflictRelationshipBetweenServiceStatementMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serviceStatementMasterId` int(11) NOT NULL,
  `conflictWithServiceStatementMasterId` int(11) DEFAULT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conflictRelationshipBetweenServiceStatementMaster`
--

LOCK TABLES `conflictRelationshipBetweenServiceStatementMaster` WRITE;
/*!40000 ALTER TABLE `conflictRelationshipBetweenServiceStatementMaster` DISABLE KEYS */;
INSERT INTO `conflictRelationshipBetweenServiceStatementMaster` VALUES (1,25,NULL,5985,'2018-09-25 20:40:48','India Standard Time'),(2,25,NULL,5985,'2018-09-25 20:40:51','India Standard Time'),(3,25,NULL,5985,'2018-09-25 20:41:18','India Standard Time'),(4,25,NULL,5985,'2018-09-25 20:41:24','India Standard Time'),(5,25,24,549,'2018-09-26 07:43:03','IST'),(6,25,23,549,'2018-09-26 07:43:08','IST');
/*!40000 ALTER TABLE `conflictRelationshipBetweenServiceStatementMaster` ENABLE KEYS */;
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
