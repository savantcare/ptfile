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
-- Table structure for table `apiAccessMaster`
--

DROP TABLE IF EXISTS `apiAccessMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apiAccessMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `locationInNginx` varchar(255) DEFAULT NULL,
  `minSecurityLevelOfUserRoleToAccess` int(5) unsigned DEFAULT NULL,
  `Notes` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apiAccessMaster`
--

LOCK TABLES `apiAccessMaster` WRITE;
/*!40000 ALTER TABLE `apiAccessMaster` DISABLE KEYS */;
INSERT INTO `apiAccessMaster` VALUES (1,'Old events report',NULL,NULL,''),(3,'Payments report',NULL,1,''),(4,'Faq',NULL,NULL,''),(5,'Master DB','/v3/api/masterdb',2,''),(6,'User','/api/index.php',2,''),(7,'Event management',NULL,NULL,''),(9,'Activity report',NULL,NULL,''),(10,'Create User',NULL,NULL,''),(11,'Old Calendar',NULL,NULL,''),(12,'Old Reminders effectiveness report','/v3/api/reminders-effectiveness-report',2,''),(13,'Payments summary report',NULL,2,''),(14,'Old User report','/v3/app/userreport',2,''),(15,'Old user summary report',NULL,NULL,''),(16,'Events summary report',NULL,NULL,''),(17,'Activity summary report',NULL,NULL,''),(18,'Voicemail report',NULL,NULL,''),(19,'Browse patient my health portal',NULL,NULL,''),(20,'Prescription refill report','/v3/app/prescription-refill-report',2,''),(21,'Drive','/v3/app/drive',2,''),(22,'Helpdesk report','/v3/api/helpdesk/public/index.php',2,''),(23,'Claim detail',NULL,NULL,''),(24,'Manual',NULL,NULL,''),(25,'Cpt codes report',NULL,NULL,''),(26,'Files report',NULL,NULL,''),(28,'Wiki',NULL,NULL,''),(29,'Videos report',NULL,NULL,''),(30,'Cpt codes report',NULL,NULL,''),(31,'Eligible claims report',NULL,NULL,''),(34,'Calendar','/v3/api/calendar',2,''),(36,'User Report',NULL,NULL,''),(37,'Events report','/v3/api/eventreport',2,''),(38,'Office Ally Claims Report',NULL,NULL,''),(39,'Reminders effectiveness report',NULL,NULL,''),(40,'Providers seen at SC','/v3/api/provider-seen-report',2,''),(41,'Provider payment report','/v3/api/provider-payment-plans/public/index.php',2,''),(42,'Master service statements',NULL,NULL,''),(43,'Waiting list',NULL,NULL,''),(44,'Patient hours report','/v3/api/patient-hours/public/index.php',2,''),(45,'Employee performance report','/v3/app/employee-performance-report',2,''),(47,'Capacity utilization','/v3/api/capacity-utilization/public/index.php',2,''),(48,'Percentage of patients across insurance companies','/v3/app/percentage-of-patients-across-insurance-companies',2,''),(49,'Credentialing matrix report','/v3/app/credentialingmatrix',2,''),(50,'Cash flow','/v3/api/cash-flow/public/index.php/',5,''),(51,'Room occupancy report','/v3/app/room-occupancy-report',2,''),(52,'Doctor retention rate','/v3/app/doctor-retention-rate',2,''),(53,'Official letter','/v3/api/official-letter/public/index.php',2,''),(54,'Search','/v3/app/search',2,''),(55,'Smartbar','/smartbar/api/public/index.php',2,'emr header smartbar access'),(56,'Correlate','/v3/api/correlate/public/index.php',2,''),(57,'Medications','/v3/api/medications/public/index.php',2,''),(58,'smartbar-profile-image','/v1/api/smartbar-profile-image/public/index.php',2,''),(59,'screeninggraph','/v3/api/screeninggraph/public/index.php',2,''),(60,'Waiting list','/v3/api/waiting-list/public/index.php',2,''),(61,'nameplate management','/v3/api/ma-nameplate-management/public/index.php',2,''),(62,'training completion comparative report','/v3/api/training-completion-comparative-report/public/index.php',2,''),(63,'Education Tracker','/v3/api/education-tracker/public/index.php',2,''),(64,'Patient hours report v4','/v4/api/patient-hours-report/public/index.php',2,''),(65,'Login','/v1/api/login/public/index.php',NULL,''),(66,'Payment collection ratio report','/v1/api/payment-collection-ratio-report/public/index.php',5,''),(67,'fax','/v3/api/fax/public/index.php',2,''),(68,'Trusted IPs','/v1/api/trusted-ips/public/index.php',NULL,''),(69,'Monitoring of patients report','/v1/api/monitoring-of-patients-report/public/index.php',2,''),(70,'Employee performance report v4','/v4/api/employee-performance-report/public/index.php',NULL,''),(71,'Analysis of revenue expenses profit per provider\r\n\r\n','/v1/api/analysis-of-revenue-expenses-profit-per-provider/public/index.php',NULL,''),(72,'Calendar','/api/calendar/public/index.php/',2,''),(73,'Event details','/v1/api/eventdetails/public/index.php/',NULL,''),(74,'patient file only panels','/patient-file-only-panels/api/',2,'');
/*!40000 ALTER TABLE `apiAccessMaster` ENABLE KEYS */;
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
