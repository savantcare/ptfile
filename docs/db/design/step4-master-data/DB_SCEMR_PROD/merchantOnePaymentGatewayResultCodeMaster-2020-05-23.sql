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
-- Table structure for table `merchantOnePaymentGatewayResultCodeMaster`
--

DROP TABLE IF EXISTS `merchantOnePaymentGatewayResultCodeMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchantOnePaymentGatewayResultCodeMaster` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `details` varchar(1000) NOT NULL,
  `createdOn` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantOnePaymentGatewayResultCodeMaster`
--

LOCK TABLES `merchantOnePaymentGatewayResultCodeMaster` WRITE;
/*!40000 ALTER TABLE `merchantOnePaymentGatewayResultCodeMaster` DISABLE KEYS */;
INSERT INTO `merchantOnePaymentGatewayResultCodeMaster` VALUES (1,100,'Transaction was approved.','2016-07-28 00:00:00'),(2,200,'Transaction was declined by processor.','2016-07-28 00:00:00'),(3,201,'Do not honor.','2016-07-28 00:00:00'),(4,202,'Insufficient funds.','2016-07-28 00:00:00'),(5,203,'Over limit.','2016-07-28 00:00:00'),(6,204,'Transaction not allowed.','2016-07-28 00:00:00'),(7,220,'Incorrect payment information.','2016-07-28 00:00:00'),(8,221,'No such card issuer.','2016-07-28 00:00:00'),(9,222,'No card number on file with issuer.','2016-07-28 00:00:00'),(10,223,'Expired card.','2016-07-28 00:00:00'),(11,224,'Invalid expiration date','2016-07-28 00:00:00'),(12,225,'Invalid card security code.','2016-07-28 00:00:00'),(13,240,'Call issuer for further information.','2016-07-28 00:00:00'),(14,250,'Pick up card.','2016-07-28 00:00:00'),(15,251,'Lost card.','2016-07-28 00:00:00'),(16,252,'Stolen card.','2016-07-28 00:00:00'),(17,253,'Fraudulent card.','2016-07-28 00:00:00'),(18,260,'Declined with further instructions available. (See response text)','2016-07-28 00:00:00'),(19,261,'Declined-Stop all recurring payments.','2016-07-28 00:00:00'),(20,262,'Declined-Stop this recurring program.','2016-07-28 00:00:00'),(21,263,'Declined-Update cardholder data available.','2016-07-28 00:00:00'),(22,264,'Declined-Retry in a few days.','2016-07-28 00:00:00'),(23,300,'Transaction was rejected by gateway.','2016-07-28 00:00:00'),(24,400,'Transaction error returned by processor.','2016-07-28 00:00:00'),(25,410,'Invalid merchant configuration.','2016-07-28 00:00:00'),(26,411,'Merchant account is inactive.','2016-07-28 00:00:00'),(27,420,'Communication error.','2016-07-28 00:00:00'),(28,421,'Communication error with issuer.','2016-07-28 00:00:00'),(29,430,'Duplicate transaction at processor.','2016-07-28 00:00:00'),(30,440,'Processor format error.','2016-07-28 00:00:00'),(31,441,'Invalid transaction information.','2016-07-28 00:00:00'),(32,460,'Processor feature not available.','2016-07-28 00:00:00'),(33,461,'Unsupported card type.','2016-07-28 00:00:00');
/*!40000 ALTER TABLE `merchantOnePaymentGatewayResultCodeMaster` ENABLE KEYS */;
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
