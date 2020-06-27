use DB_SC_Surescripts
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Surescripts
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
-- Table structure for table `271MasterSegmentDetail`
--

DROP TABLE IF EXISTS `271MasterSegmentDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterSegmentDetail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `segmentID` varchar(255) NOT NULL,
  `segmentName` varchar(255) NOT NULL,
  `loopMasterID` int(11) unsigned NOT NULL,
  `maxUse` int(11) DEFAULT NULL,
  `loopRepeat` int(11) DEFAULT NULL,
  `usage` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `loopMasterID` (`loopMasterID`),
  CONSTRAINT `271MasterSegmentDetail_ibfk_1` FOREIGN KEY (`loopMasterID`) REFERENCES `271MasterLoop` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `271MasterSegmentDetail`
--

LOCK TABLES `271MasterSegmentDetail` WRITE;
/*!40000 ALTER TABLE `271MasterSegmentDetail` DISABLE KEYS */;
INSERT INTO `271MasterSegmentDetail` VALUES (1,'HL','Information Source Level(PBM/payer)',1,1,NULL,'Mandatory','To identify dependencies among and the content of hierarchically related groups of data segments'),(2,'AAA','Request Validation',1,9,NULL,'Situational','To specify the validity of the request and indicate follow-up action authorized'),(3,'NM1','Information Source Name',2,1,NULL,'Mandatory','To supply the full name of an individual or organizational entity'),(4,'AAA','Request Validation',2,9,NULL,'Situational','To specify the validity of the request and indicate follow-up action authorized'),(5,'HL','Information Receiver Level(Physician)',3,1,NULL,'Mandatory','To identify dependencies among and the content of hierarchically related groups of data segments.'),(6,'NM1','Information Receiver Name',4,1,NULL,'Mandatory','To supply the full name of an individual or organizational entity'),(7,'REF','Information Receiver Additional Identification S (Physician System Identification)',4,9,NULL,'Situational','To specify identifying information'),(8,'AAA','Information Receiver Request Validation',4,9,NULL,'Situational','To specify the validity of the request and indicate follow-up action authorized'),(9,'HL','Subscriber Level',5,1,NULL,'Situational','To identify dependencies among and the content of hierarchically related groups of data segments'),(10,'TRN','Subscriber Trace Number',5,3,NULL,'Situational','To uniquely identify a transaction to an application'),(11,'NM1','Subscriber Name',6,1,NULL,'Mandatory','To supply the full name of an individual or organizational entity'),(12,'REF','Subscriber Additional Identification (Person S Code, Cardholder ID, SSN, Patient Account\r\nNumber)',6,9,NULL,'Situational','To specify identifying information'),(13,'N3','Subscriber Address',6,1,NULL,'Situational','To specify the location of the named party'),(14,'N4','Subscriber City/State/ZIP Code',6,1,NULL,'Situational','To specify the geographic place of the named party'),(15,'AAA','Subscriber Request Validation',6,9,NULL,'Situational','To specify the validity of the request and indicate follow-up action authorized'),(16,'DMG','Subscriber Demographic Information',6,1,NULL,'Situational','To supply demographic information'),(17,'INS','Subscriber Relationship',6,1,NULL,'Situational','To provide benefit information on insured entities'),(18,'DTP','Subscriber Date',6,9,NULL,'Situational','To specify any or all of a date, a time, or a time period *Use this segment only if subscriber is patient.'),(19,'EB','Subscriber Eligibility or Benefit Information',7,1,NULL,'Situational','To supply eligibility or benefit information'),(20,'REF','Subscriber Additional Identification (Plan ID, S Group ID/Name, Formulary ID, Alternative ID, Coverage List ID, BIN/PCN, and Copay ID)',7,9,NULL,'Situational','To specify identifying information'),(21,'DTP','Subscriber Eligibility/Benefit Date',7,20,NULL,'Situational','To specify any or all of a date, a time, or a time period *Use this segment only if subscriber is patient.'),(22,'AAA','Subscriber Request Validation',7,9,NULL,'Situational','To specify the validity of the request and indicate follow-up action authorized'),(23,'MSG','Message Text',7,10,NULL,'Situational','To provide a free-form format that allows the transmission of text information'),(24,'LS','Loop Header2110C1',7,1,NULL,'Situational','To indicate that the next segment begins a loop.'),(25,'NM1','Subscriber Benefit Related Entity Name S 2120C1',8,1,1,'Situational','To supply the full name of an individual or organizational entity'),(26,'LE','Loop Trailer 2110C1',8,1,NULL,'Situational','To indicate that the loop immediately preceding this segment is complete.'),(27,'EB','Subscriber Eligibility or Benefit Information',9,1,NULL,'Situational','To supply eligibility or benefit information'),(28,'DTP','Subscriber Eligibility/Benefit Date',9,20,NULL,'Situational','To specify any or all of a date, a time, or a time period'),(29,'AAA','Subscriber Request Validation',9,9,NULL,'Situational','To specify the validity of the request and indicate follow-up action authorized'),(30,'MSG','Message Text',9,10,NULL,'Situational','To provide a free-form format that allows the transmission of text information\n'),(31,'LS','Loop Header 2110C2-5',9,1,NULL,'Situational','To indicate that the next segment begins a loop.'),(32,'NM1','Subscriber Benefit Related Entity Name 2120C2-5',10,1,1,'Situational','To supply the full name of an individual or organizational entity'),(33,'LE','Loop Trailer 2110C2-5',10,1,NULL,'Situational','To indicate that the loop immediately preceding this segment is complete.');
/*!40000 ALTER TABLE `271MasterSegmentDetail` ENABLE KEYS */;
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
