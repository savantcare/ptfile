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
-- Table structure for table `sectionsMaster`
--

DROP TABLE IF EXISTS `sectionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectionsMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `stateName` varchar(255) NOT NULL,
  `pageUrl` varchar(255) DEFAULT NULL,
  `minSecurityLevelToAccess` int(5) unsigned DEFAULT NULL,
  `isDeleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0: not deleted, 1: deleted',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectionsMaster`
--

LOCK TABLES `sectionsMaster` WRITE;
/*!40000 ALTER TABLE `sectionsMaster` DISABLE KEYS */;
INSERT INTO `sectionsMaster` VALUES (1,'Old events report','home.eventsReport',NULL,NULL,1),(3,'Payments report','home.paymentsReport',NULL,NULL,0),(4,'Faq','home.faq',NULL,NULL,0),(5,'Master DB','home.masterdb','/v3/app/masterdb',2,0),(6,'User','home.user','/u7',2,0),(7,'Event management','home.event',NULL,NULL,0),(9,'Activity report','home.activityReport',NULL,NULL,0),(10,'Create User','home.masterdb.adduser',NULL,NULL,0),(11,'Old Calendar','home.resourceManagement',NULL,NULL,1),(12,'Old Reminders effectiveness report','home.reminderReport','/v3/app/reminders-effectiveness-report',2,1),(13,'Payments summary report','home.paymentsSummaryReport',NULL,NULL,1),(14,'Old User report','home.userReport','/v4/app/userreport',2,1),(15,'Old user summary report','home.userSummaryReport',NULL,NULL,1),(16,'Events summary report','home.eventsSummaryReport',NULL,NULL,1),(17,'Activity summary report','home.activitySummaryReport',NULL,NULL,1),(18,'Voicemail report','home.voicemailReport',NULL,NULL,0),(19,'Browse patient my health portal','home.browse-patient-my-health-portal',NULL,NULL,0),(20,'Prescription refill report','home.prescriptionRefillReport','/v3/app/prescription-refill-report',2,0),(21,'Drive','home.Drive','/v3/app/drive',2,0),(22,'Helpdesk report','home.helpdesk','/v3/app/helpdesk',2,0),(23,'Claim detail','home.claimDetail',NULL,NULL,1),(24,'Manual','home.manual',NULL,NULL,0),(25,'Cpt codes report','home.cptCodesReport',NULL,NULL,1),(26,'Files report','home.filesReport',NULL,NULL,0),(28,'Wiki','home.wiki',NULL,NULL,0),(29,'Videos report','home.videosReport',NULL,NULL,0),(30,'Cpt codes report','home.cptCodesReport',NULL,NULL,1),(31,'Eligible claims report','home.eligibleClaimsReport',NULL,NULL,0),(34,'Calendar','home.calendar','/v3/app/calendar',2,0),(36,'User Report','',NULL,NULL,0),(37,'Events report','home.eventreport','/v4/app/eventreport',2,0),(38,'Office Ally Claims Report','home.officeallyClaimsReport',NULL,NULL,0),(39,'Reminders effectiveness report','',NULL,NULL,0),(40,'Providers seen at SC','home.providersSeenatSC','/v3/app/provider-seen-report',2,1),(41,'Provider payment report','home.providerpayment','/v3/app/provider-payment-report',2,1),(42,'Master service statements','home.master-service-statements',NULL,NULL,0),(43,'Waiting list','',NULL,NULL,0),(44,'Patient hours report','home.patienthours','/v3/app/patient-hours',2,0),(45,'Employee performance report','home.employeeperformance','/v3/app/employee-performance-report',2,0),(47,'Capacity utilization','home.Capacityutilization','/v3/app/capacity-utilization',2,0),(48,'Percentage of patients across insurance companies','home.percentageofpatients','/v3/app/percentage-of-patients-across-insurance-companies',2,0),(49,'Credentialing matrix report','home.credentialingmatrix','/v3/app/credentialingmatrix',2,0),(50,'Cash flow','home.cashflow','/v3/app/cash-flow',2,0),(51,'Room occupancy report','home.room-occupancy-report','/v3/app/room-occupancy-report',2,0),(52,'Doctor retention rate','home.doctor-retention-rate','/v3/app/doctor-retention-rate',2,0),(53,'Official letter','home.officialletter','/v3/app/official-letter',2,0),(54,'Search','home.search','/v3/app/search',2,0),(55,'Helpdesk Summary','','/v3/app/helpdesk-summary',2,0),(56,'Video Conference','','/v3/app/video-conference',NULL,0);
/*!40000 ALTER TABLE `sectionsMaster` ENABLE KEYS */;
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
