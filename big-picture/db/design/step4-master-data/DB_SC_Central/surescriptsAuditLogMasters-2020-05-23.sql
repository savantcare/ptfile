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
-- Table structure for table `surescriptsAuditLogMasters`
--

DROP TABLE IF EXISTS `surescriptsAuditLogMasters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surescriptsAuditLogMasters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=System 1=Prescription',
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surescriptsAuditLogMasters`
--

LOCK TABLES `surescriptsAuditLogMasters` WRITE;
/*!40000 ALTER TABLE `surescriptsAuditLogMasters` DISABLE KEYS */;
INSERT INTO `surescriptsAuditLogMasters` VALUES (1,'Login Success',0,'Login Success','2018-12-03 14:42:42'),(2,'Login Error',0,'Login Error','2018-12-03 14:42:42'),(3,'Logout',0,'Logout','2018-12-03 14:54:57'),(4,'Prescription Created',1,'When prescription is written','2018-12-03 14:54:57'),(5,'Prescription ready to sign',1,'Prescription ready to sign','2018-12-04 06:18:25'),(6,'Prescription digitally signed',1,'Prescription digitally signed','2018-12-04 06:18:25'),(7,'Prescription transfered to surescripts',1,'Prescription transfered to surescripts','2018-12-04 06:20:39'),(8,'Prescription accepted by surescripts',1,'Prescription accepted by surescripts','2018-12-04 06:20:39'),(9,'Prescription rejected from surescripts',1,'Prescription rejected from surescripts','2018-12-04 06:21:34'),(10,'Prescription deleted',1,'Prescription deleted','2018-12-04 06:21:34'),(11,'Invalid user public key',1,'Invalid user public key for generating digital signed document','2018-12-04 06:24:04'),(12,'Invalid user private key',1,'Invalid user private key for generating digital signed document','2018-12-04 06:24:04'),(13,'Invalid user passphrase',1,'Invalid user passphrase for generating digitally signed document','2018-12-04 06:27:00'),(14,'Invalid login password for two factor authentication',1,'Invalid login password for two factor authentication in process of prescription submission to surescripts','2018-12-04 06:27:00'),(15,'DEA license number not entered',1,'DEA license number not entered','2018-12-04 06:40:59'),(16,'DEA license Expired',1,'DEA license Expired','2018-12-04 06:40:59'),(17,'DEA expiry date not provided',1,'DEA expiry date not provided','2018-12-04 06:42:27'),(18,'Empty note for schedule drug',1,'Empty note for schedule drug','2018-12-04 06:42:27'),(19,'Prescription altered',1,'Prescription altered','2018-12-04 06:43:12'),(20,'Prescription refill request',1,'Prescription refill request','2018-12-04 06:43:12'),(21,'Eprescribe not enabled',1,'Eprescribe not enabled','2018-12-04 06:44:41'),(22,'Refill is schedule drug\r\n',1,'Refill is schedule drug\r\n','2018-12-04 06:45:47'),(23,'More than 30 days of supply for schedule drug',1,'More than 30 days of supply for schedule drug','2018-12-04 06:44:41'),(24,'Eprescribe not verified',1,'Eprescribe not verified','2018-12-04 06:44:41'),(25,'Eprescribe enabled',1,'Eprescribe enabled','2019-02-06 14:31:06'),(26,'Eprescribe verified',1,'Eprescribe verified','2019-02-06 14:31:06'),(27,'Eprescribe approval status',1,'Eprescribe approval status from masterdb','2019-03-19 14:31:06');
/*!40000 ALTER TABLE `surescriptsAuditLogMasters` ENABLE KEYS */;
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
