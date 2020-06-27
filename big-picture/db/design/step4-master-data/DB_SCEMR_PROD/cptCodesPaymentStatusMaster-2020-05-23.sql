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
-- Table structure for table `cptCodesPaymentStatusMaster`
--

DROP TABLE IF EXISTS `cptCodesPaymentStatusMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptCodesPaymentStatusMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `statusAndMethod` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cptCodesPaymentStatusMaster`
--

LOCK TABLES `cptCodesPaymentStatusMaster` WRITE;
/*!40000 ALTER TABLE `cptCodesPaymentStatusMaster` DISABLE KEYS */;
INSERT INTO `cptCodesPaymentStatusMaster` VALUES (1,'Step 1A: Claim to be submitted manually','2015-09-18 02:04:32'),(2,'Step 2A: Submitted','2015-09-18 02:04:59'),(3,'Step 3A: Received','2015-09-18 02:05:33'),(4,'Step 3B: Rejected','2015-09-18 02:06:07'),(5,'Step 0: Unclaimed','2015-11-02 09:21:28'),(6,'Step 4: To be sent to collection agency','2015-12-31 12:28:45'),(7,'Step 5: Sent to collection agency','2015-12-31 12:28:45'),(8,'Step 2B: Submitted 2nd time','2016-06-22 05:07:28'),(9,'Step 2C: Submitted 3rd time','2016-06-22 05:07:28'),(10,'Step 1B: Claim to be submitted by script','2016-07-29 13:46:07'),(11,'Step 2D: Getting error on submitting','2016-07-29 13:46:07'),(12,'Step 2E: Submitted & finalised','2018-03-16 09:00:58'),(13,'Step 6A - Bad Debt','2018-09-12 08:17:23'),(14,'Step 6B - Fees Waived Off','2018-09-12 08:17:49'),(15,'Step 3C: NSF','2018-09-12 08:18:12');
/*!40000 ALTER TABLE `cptCodesPaymentStatusMaster` ENABLE KEYS */;
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
