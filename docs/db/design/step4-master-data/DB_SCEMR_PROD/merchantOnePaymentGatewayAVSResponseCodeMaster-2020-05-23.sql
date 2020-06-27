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
-- Table structure for table `merchantOnePaymentGatewayAVSResponseCodeMaster`
--

DROP TABLE IF EXISTS `merchantOnePaymentGatewayAVSResponseCodeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchantOnePaymentGatewayAVSResponseCodeMaster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL,
  `details` varchar(1000) NOT NULL,
  `createdOn` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantOnePaymentGatewayAVSResponseCodeMaster`
--

LOCK TABLES `merchantOnePaymentGatewayAVSResponseCodeMaster` WRITE;
/*!40000 ALTER TABLE `merchantOnePaymentGatewayAVSResponseCodeMaster` DISABLE KEYS */;
INSERT INTO `merchantOnePaymentGatewayAVSResponseCodeMaster` VALUES (1,'X','Exact match, 9-character numeric ZIP','2016-07-28 00:00:00'),(2,'Y','Exact match, 5-character numeric ZIP','2016-07-28 00:00:00'),(3,'D','Exact match, 5-character numeric ZIP','2016-07-28 00:00:00'),(4,'M','Exact match, 5-character numeric ZIP','2016-07-28 00:00:00'),(5,'A','Address match only','2016-07-28 00:00:00'),(6,'B','Address match only','2016-07-28 00:00:00'),(7,'W','9-character numeric ZIP match only\r\n','2016-07-28 00:00:00'),(8,'Z','5-character ZIP match only','2016-07-28 00:00:00'),(9,'P','5-character ZIP match only','2016-07-28 00:00:00'),(10,'L','5-character ZIP match only','2016-07-28 00:00:00'),(11,'N','No address or ZIP match only','2016-07-28 00:00:00'),(12,'C','No address or ZIP match only','2016-07-28 00:00:00'),(13,'U','Address unavailable','2016-07-28 00:00:00'),(14,'G','Non-U.S. issuer does not participate','2016-07-28 00:00:00'),(15,'I','Non-U.S. issuer does not participate','2016-07-28 00:00:00'),(16,'R','Issuer system unavailable','2016-07-28 00:00:00'),(17,'E','Not a mail/phone order','2016-07-28 00:00:00'),(18,'S','Service not supported','2016-07-28 00:00:00'),(19,'0','AVS not available','2016-07-28 00:00:00'),(20,'B','AVS not available','2016-07-28 00:00:00');
/*!40000 ALTER TABLE `merchantOnePaymentGatewayAVSResponseCodeMaster` ENABLE KEYS */;
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
