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
-- Table structure for table `cptPaymentEntityResponsibleToSCMaster`
--

DROP TABLE IF EXISTS `cptPaymentEntityResponsibleToSCMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptPaymentEntityResponsibleToSCMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAtTimeStamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cptPaymentEntityResponsibleToSCMaster`
--

LOCK TABLES `cptPaymentEntityResponsibleToSCMaster` WRITE;
/*!40000 ALTER TABLE `cptPaymentEntityResponsibleToSCMaster` DISABLE KEYS */;
INSERT INTO `cptPaymentEntityResponsibleToSCMaster` VALUES (1,'Type 1D: Patient self pay with no insurance claim filled','2015-03-03 05:05:53'),(2,'Type 1C: Patient self pay with insurance claim filed for reimbursement to patient.','2015-03-03 05:06:02'),(3,'Type 2: Insurance company in contract with SC','2015-08-25 08:59:13'),(4,'Type 4: Backup insurance purchased by patient for copay','2015-10-08 14:38:44'),(5,'Type 3: Insurance company not in contract with SC','2015-10-13 15:14:37'),(6,'Type 1A: Patient self pay for co-pay (Claim filling required to update annual deductible consumed)','2015-12-01 00:34:04'),(7,'Type 1B: Patient self pay for deductible (Claim filling required to update annual deductible consumed)','2016-07-20 05:50:14'),(8,'Type 1E: Patient self pay for co-insurance (Claim filling required to update annual deductible consumed)','2017-03-24 04:51:02'),(9,'Type 1F: Patient self pay for insurance denial','2017-04-10 04:51:02');
/*!40000 ALTER TABLE `cptPaymentEntityResponsibleToSCMaster` ENABLE KEYS */;
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
