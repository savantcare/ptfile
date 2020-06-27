use DB_SC_AutomatedSystemWork
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_AutomatedSystemWork
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
-- Table structure for table `automatedSystemMaster`
--

DROP TABLE IF EXISTS `automatedSystemMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automatedSystemMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `containerName` varchar(255) DEFAULT NULL,
  `scriptName` varchar(255) DEFAULT NULL,
  `work` varchar(255) DEFAULT NULL,
  `workStatus` enum('off','on') NOT NULL DEFAULT 'on',
  `runningFrequency` float(11,2) DEFAULT NULL COMMENT 'Entries value with minute',
  `minimumDuration` float(11,2) NOT NULL DEFAULT '1.00' COMMENT 'value with minute',
  `maximumDuration` float(11,2) NOT NULL DEFAULT '60.00' COMMENT 'value with minute',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automatedSystemMaster`
--

LOCK TABLES `automatedSystemMaster` WRITE;
/*!40000 ALTER TABLE `automatedSystemMaster` DISABLE KEYS */;
INSERT INTO `automatedSystemMaster` VALUES (1,'scssofficeally_file_read','updated-specific-data-of-incoming-payment-panel','incoming payment panel update by office ally claimed data','on',15.00,5.00,60.00),(2,'scssautomatedclaims_php','entries-incoming-payment-panel-for-co-pay','Automatically make \"Incoming payment panel\" entries for co-pay','on',5.00,5.00,60.00),(3,'scssautomatedclaims_php','entries-incoming-payment-panel-for-co-insurance','Automatically make \"Incoming payment panel\" entries for co-insurnace','on',5.00,5.00,60.00),(4,'scssautomatedclaims_php','entries-incoming-payment-panel-for-remaining-balance','Automatically make \"Incoming payment panel\" entries for balance over co-pay and co-insurance','on',5.00,5.00,60.00),(5,'scssautomatedclaims_php','entries-incoming-payment-panel-for-internal-account-funds','Automatically make \"Incoming payment panel\" entries for internal account funds','on',5.00,5.00,60.00),(6,'scsshelpdesk_file_read_1','support','When some one sends an email to support@savantcare.com this automated programme reads the email and converts the email to a HDR.','on',0.60,0.60,60.00),(7,'scsshelpdesk_file_read_1','convert','When someone sends an email to convert-to-hdr@savantcare.com this automated system reads that email and converts it to a HDR.','on',1.00,1.00,60.00),(8,'scssofficeally_file_read','read-file-from-officeally-ftp-server','Read file from office ally ftp server and stored data for each SC event','on',60.00,30.00,60.00),(9,'scssautomatedpayerpanel_php_1','s1-lock-payer-panel-data','lock the old entries of payer panel in user details section','on',1440.00,60.00,60.00),(10,'scsshelpdesk_file_read_1','daily-report-HDR','Daily report for HDR','on',1.00,1.00,60.00),(11,'scssofficeally_file_read','upload-file-in-officeally-ftp-server','Upload files in inbound folder of Office ally sftp server','on',30.00,15.00,60.00),(12,'scssemployeeperformance_php_1','voicemailConvertedToHdr','voicemail converted to HDR','on',20.00,15.00,60.00),(13,'scv3api_php_1','submitClaims:creditCardClaimsUsingMerchantOneGateway','credit card claims','on',60.00,60.00,60.00);
/*!40000 ALTER TABLE `automatedSystemMaster` ENABLE KEYS */;
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
