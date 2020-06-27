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
-- Table structure for table `cptCodesMaster`
--

DROP TABLE IF EXISTS `cptCodesMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptCodesMaster` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isThisEntityLockedAndHenceNonEditable` enum('Yes','No') NOT NULL DEFAULT 'No',
  `allowUserToLockFromCodingPanel` enum('Yes','No') NOT NULL,
  `allowCustomCodesForCoding` varchar(11) NOT NULL DEFAULT 'No',
  `createdBy` int(11) unsigned NOT NULL,
  `createdAtTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cptCodesMaster`
--

LOCK TABLES `cptCodesMaster` WRITE;
/*!40000 ALTER TABLE `cptCodesMaster` DISABLE KEYS */;
INSERT INTO `cptCodesMaster` VALUES (1,'99214','Med Follow Up-Moderate','Yes','Yes','No',0,'2015-05-21 06:31:44'),(5,'99205','Intake Evaluation without medication','Yes','Yes','Yes',0,'2015-09-16 14:31:39'),(6,'00000','This CPT code is used by the software for cases when there is no coding done and a payment is received.','Yes','Yes','No',0,'2015-09-16 14:34:40'),(23,'90833','Add On Psychotherapy  (17-30 Min)','Yes','Yes','Yes',0,'2015-10-07 16:08:37'),(24,'99203','Eval of New Patient','Yes','Yes','No',0,'2015-10-07 20:45:46'),(25,'99204','Eval of New Patient','Yes','Yes','No',0,'2015-10-07 20:46:12'),(26,'99242','Consult of New Patient','Yes','Yes','No',0,'2015-10-07 20:46:44'),(27,'99211','Med Follow Up','Yes','Yes','No',0,'2015-10-07 20:47:28'),(28,'99212','Med Follow Up','Yes','Yes','No',0,'2015-10-07 20:47:54'),(29,'99213','Med Follow Up','Yes','Yes','No',0,'2015-10-07 20:48:24'),(30,'99215','Med Follow Up- Complex','No','Yes','No',0,'2015-10-07 20:49:02'),(31,'90836','Add On Psychotherapy (45 Min)','No','Yes','No',0,'2015-10-07 20:49:54'),(32,'90838','Add On Psychotherapy (60 Min)','No','Yes','No',0,'2015-10-07 20:50:30'),(33,'90832','Psychotherapy by Itself (30 min)','No','Yes','No',0,'2015-10-07 20:50:52'),(34,'90834','Psychotherapy by Itself (45 min)','No','Yes','No',0,'2015-10-07 20:51:14'),(35,'90837','Psychotherapy by Itself (60 min)','No','Yes','No',0,'2015-10-07 20:51:37'),(36,'90839','Psychotherapy by Itself, Crisis Initial (60 min)','No','Yes','No',0,'2015-10-07 20:52:04'),(37,'90840','Psychotherapy by itself, Crisis Add On (extra 30 min)','No','Yes','No',0,'2015-10-07 20:52:23'),(38,'90853','Group Psychotherapy','No','Yes','No',0,'2015-10-07 20:52:45'),(39,'99406','Behav chng smoking 3-10 min','No','Yes','No',0,'2015-10-07 20:53:08'),(40,'99409','Behav chng smoking &gt; 10 min','No','Yes','No',0,'2015-10-07 20:53:23'),(41,'90785','Interactive Complexity','No','Yes','No',0,'2015-10-07 20:53:40'),(42,'90846','Family psychotherapy (without the patient present)','No','Yes','Yes',0,'2015-10-07 20:54:04'),(43,'90847','Family psychotherapy (conjoint psychotherapy w/patient present)','No','Yes','No',0,'2015-10-07 20:54:42'),(44,'90870','Electroconvulsive therapy (includes necessary monitoring)','No','Yes','No',0,'2015-10-07 20:55:08'),(45,'96101','Psychological testing','No','Yes','No',0,'2015-10-07 20:55:24'),(46,'90791','Psych Diagnostic Eval without Med Services','No','Yes','Yes',0,'2015-10-08 15:28:00'),(47,'90792','Psychiatric diagnostic interview with Medical services','No','Yes','Yes',0,'2015-10-08 15:28:16'),(48,'1212','test','No','Yes','No',0,'2015-10-09 13:38:01'),(49,'Not coded duration less than 31 mins (system assigned)','','No','Yes','No',0,'2015-10-09 13:38:01'),(50,'Not coded duration between 31 and 61 mins (system assigned)','','No','Yes','No',0,'2015-10-09 13:38:01'),(51,'Not coded duration greater than 61 mins (system assigned)','','No','Yes','No',0,'2015-10-09 13:38:01'),(52,'SCI- No Show','Charge for no-show appointment','No','Yes','No',7,'2015-11-11 08:11:48'),(53,'SCI- Copay','copayments made to SC from backup insurance','No','Yes','No',7,'2015-11-11 08:15:02'),(54,'SCI - Paper Work','Paper-work- desability, letter of accommodation, etc.','No','Yes','No',8,'2015-11-13 00:48:22'),(55,'SCI- Phone Encounter','Extended Phone calls from patients','No','Yes','No',8,'2015-11-13 16:30:43'),(57,'SCI - coordination of care','coordination of care','No','Yes','No',8,'2015-11-20 01:40:01'),(58,'SCI-Rescheduled','Rescheduled to another date','No','Yes','No',8,'2015-11-27 20:47:34'),(59,'SCI-Insurance Overpay','Used for excess Insurance payment','No','Yes','No',7,'2015-12-22 02:08:32'),(60,'96118','Test reports interpretation','No','Yes','No',8,'2015-12-23 02:05:34'),(61,'SCI- Refund','Used to record refund of SCI pt internal a/c','No','Yes','No',8,'2015-12-25 02:08:01'),(62,'SCI- Monthly Payment','Used to record D\'s monthly payment','No','Yes','No',7,'2016-01-05 20:35:57'),(63,'SCI-Patient Responsibility','Patient Responsibility','No','Yes','No',8,'2016-01-07 19:30:11'),(64,'99058','emergency basis for disrupting normal office','No','Yes','No',9,'2016-05-12 18:39:34'),(65,'90791 (By Non medical doctor)',NULL,'No','Yes','No',440,'2016-07-25 07:21:52'),(68,'SCI - Late Cancellation','Use this when Pt. cancels an appointment within 3 days of the appointment and doesn\'t / can\'t book another one in next 7days time frame.','No','Yes','No',8,'2016-08-05 23:49:45'),(69,'99201','Eval of New Patient','No','Yes','No',1153,'2016-09-09 18:00:26'),(71,'99202','Eval of New Patient','No','Yes','No',1153,'2016-09-09 18:10:35'),(72,'99358','prolonged physician service without direct face-to-face patient contact.','No','Yes','No',8,'2016-09-21 00:18:29'),(73,'96103','Code for Psychological testing.','No','Yes','No',14,'2016-10-03 20:43:02'),(74,'SCI - CREDIT','Code used for providing credits to patients','No','Yes','No',8,'2016-11-10 21:43:13'),(75,'SCI - Medical Record','Medical records sent to Instituations','No','Yes','No',8,'2017-08-11 21:03:51'),(76,'96102','Code for Psychological testing','No','Yes','No',9,'2017-12-13 18:51:26'),(77,'99305','Tele-Health Intake','No','Yes','No',5083,'2018-06-05 17:08:00'),(78,'99306','Telehealth Intake','No','Yes','No',5083,'2018-06-05 17:09:57'),(79,'99354','Add on Therapy','No','Yes','No',9,'2018-06-20 21:52:01'),(80,'99310','SKF Follow Up code','No','Yes','No',9111,'2018-08-01 19:45:13'),(81,'SCI- Exp Reimbursement','Provider spendings','No','Yes','No',9,'2019-02-14 19:12:07'),(82,'SCI- Cosign Compensation','Paid to provider','No','Yes','No',9,'2019-02-14 19:12:36');
/*!40000 ALTER TABLE `cptCodesMaster` ENABLE KEYS */;
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
