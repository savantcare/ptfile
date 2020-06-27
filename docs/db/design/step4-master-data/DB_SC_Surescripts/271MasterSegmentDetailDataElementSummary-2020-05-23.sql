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
-- Table structure for table `271MasterSegmentDetailDataElementSummary`
--

DROP TABLE IF EXISTS `271MasterSegmentDetailDataElementSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `271MasterSegmentDetailDataElementSummary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `segmentDetailMasterId` int(11) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `dataElement` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `attributes` varchar(255) NOT NULL,
  `isAdditionalCode` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `segmentHeaderMasterId` (`segmentDetailMasterId`),
  CONSTRAINT `271segmentdetaildataelementsummarymaster_ibfk_1` FOREIGN KEY (`segmentDetailMasterId`) REFERENCES `271MasterSegmentDetail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `271MasterSegmentDetailDataElementSummary`
--

LOCK TABLES `271MasterSegmentDetailDataElementSummary` WRITE;
/*!40000 ALTER TABLE `271MasterSegmentDetailDataElementSummary` DISABLE KEYS */;
INSERT INTO `271MasterSegmentDetailDataElementSummary` VALUES (1,1,'HL01','628','Hierarchical ID Number','AN 1/12','no'),(2,1,'HL03','735','Hierarchical Level Code','ID 1/2','yes'),(3,1,'HL04','736','Hierarchical Child Code','ID 1/1','yes'),(4,2,'AAA01','1073','Yes/No Condition or Response Code','ID 1/1','yes'),(5,2,'AAA03','901','Reject Reason Code','ID 2/2','yes'),(6,2,'AAA04','889','Follow-up Action Code','ID 1/1','yes'),(7,3,'NM101','98','Entity Identifier Code','ID 2/3','yes'),(8,3,'NM102','1065','Entity Type Qualifier','ID 1/1','yes'),(9,3,'NM103','1035','Organization Name','AN 1/60','no'),(10,3,'NM108','66','Identification Code Qualifier','ID 1/2','yes'),(11,3,'NM109','67','Identification Code','AN 2/80','no'),(12,4,'AAA01','1073','Yes/No Condition or Response Code','ID 1/1','yes'),(13,4,'AAA03','901','Reject Reason Code','ID 2/2','yes'),(14,4,'AAA04','889','Follow-up Action Code','ID 1/1','yes'),(15,5,'HL01','628','Hierarchical ID Number','AN 1/12','no'),(16,5,'HL02','734','Hierarchical Parent ID Number','AN 1/12','no'),(17,5,'HL03','735','Hierarchical Level Code','ID 1/2','yes'),(18,5,'HL04','736','Hierarchical Child Code','ID 1/1','yes'),(19,6,'NM101','98','Entity Identifier Code','ID 2/3','yes'),(20,6,'NM102','1065','Entity Type Qualifier','ID 1/1','yes'),(21,6,'NM103','1035','Name Last or Organization Name','AN 1/60','no'),(22,6,'NM104','1036','Name First','AN 1/35','no'),(23,6,'NM105','1037','Name Middle','AN 1/25','no'),(24,6,'NM107','1039','Name Suffix','AN 1/10','no'),(25,6,'NM108','66','Identification Code Qualifier','ID 1/2','no'),(26,6,'NM108','66','Identification Code Qualifier','ID 1/2','yes'),(27,6,'NM109','67','Identification Code','AN 2/80','no'),(28,7,'REF01','128','Reference Identification Qualifier','ID 2/3','yes'),(29,7,'REF02','127','Reference Identification','AN 1/50','no'),(30,7,'REF03','352','Description','AN 1/80','no'),(31,8,'AAA01','1073','Yes/No Condition or Response Code','ID 1/1','yes'),(32,8,'AAA03','901','Reject Reason Code','ID 2/2','yes'),(33,8,'AAA04','889','Follow-up Action Code','ID 1/1','yes'),(34,9,'HL01','628','Hierarchical ID Number','AN 1/12','no'),(35,9,'HL02','734','Hierarchical Parent ID Number','AN 1/12','no'),(36,9,'HL03','735','Hierarchical Level Code','ID 1/2','yes'),(37,9,'HL04','736','Hierarchical Child Code','ID 1/1','yes'),(38,10,'TRN01','481','Trace Type Code','ID 1/2','yes'),(39,10,'TRN02','127','Reference Identification','AN 1/50','no'),(40,10,'TRN03','509','Originating Company Identifier','AN 10/10','no'),(41,10,'TRN04','127','Reference Identification','AN 1/50','no'),(42,11,'NM101','98','Entity Identifier Code','ID 2/3','yes'),(43,11,'NM102','1065','Entity Type Qualifier','ID 1/1','yes'),(44,11,'NM103','1035','Name Last or Organization Name','AN 1/60','no'),(45,11,'NM104','1036','Name First','AN 1/35','no'),(46,11,'NM105','1037','Name Middle','AN 1/25','no'),(47,11,'NM107','1039','Name Suffix','AN 1/10','no'),(48,11,'NM108','66','Identification Code Qualifier','ID 1/2','yes'),(49,11,'NM109','67','Identification Code','AN 2/80','no'),(50,12,'REF01','128','Reference Identification Qualifier','ID 2/3','yes'),(51,12,'REF02','127','Reference Identification','AN 1/50','no'),(52,12,'REF03','352','Description','AN 1/80','no'),(53,13,'N301','166','Address Information','AN 1/55','no'),(54,13,'N302','166','Address Information','AN 1/55','no'),(55,14,'N401','19','City Name','AN 2/30','no'),(56,14,'N402','156','State or Province Code','ID 2/2','no'),(57,14,'N403','116','Postal Code','ID 3/15','no'),(58,14,'N404','26','Country Code','ID 2/3','no'),(59,15,'AAA01','1073','Yes/No Condition or Response Code','ID 1/1','yes'),(60,15,'AAA03','901','Reject Reason Code','ID 2/2','yes'),(61,15,'AAA04','889','Follow-up Action Code','ID 1/1','yes'),(62,16,'DMG01','1250','Date Time Period Format Qualifier','ID 2/3','no'),(63,16,'DMG02','1251','Date Time Period','AN 1/35','no'),(64,16,'DMG03','1068','Gender Code','ID 1/1','yes'),(65,17,'INS01','1073','Yes/No Condition or Response Code','ID 1/1','yes'),(66,17,'INS02','1069','Individual Relationship Code','ID 2/2','yes'),(67,17,'INS03','875','Maintenance Type Code','ID 3/3','yes'),(68,17,'INS04','1203','Maintenance Reason Code','Maintenance Reason Code\r\n','yes'),(69,18,'DTP01','374','Date/Time Qualifier','ID 3/3','yes'),(70,18,'DTP02','1250','Date Time Period Format Qualifier','ID 2/3','yes'),(71,18,'DTP03','1251','Date Time Period','AN 1/35','no'),(72,19,'EB01','1390','Eligibility or Benefit Information','ID 1/2','yes'),(73,19,'EB03','1365','Service Type Code','ID 1/2','yes'),(74,19,'EB04','1336','Insurance Type Code','ID 1/3','yes'),(75,19,'EB05','1204','Plan Coverage Description','AN 1/50','no'),(76,19,'EB07','782','Monetary Amount','R 1/18','no'),(77,20,'REF01','128','Reference Identification Qualifier','ID 2/3','yes'),(78,20,'REF02','127','Reference Identification','AN 1/50','no'),(79,20,'REF03','352','Description','AN 1/80','no'),(80,21,'DTP01','374','Date/Time Qualifier','ID 3/3','yes'),(81,21,'DTP02','1250','Date Time Period Format Qualifier','ID 2/3','yes'),(82,21,'DTP03','1251','Date Time Period','AN 1/35','no'),(83,22,'AAA01','1073','Yes/No Condition or Response Code','ID 1/1','yes'),(84,22,'AAA03','901','Reject Reason Code','ID 2/2','yes'),(85,22,'AAA04','889','Follow-up Action Code','ID 1/1','yes'),(86,23,'MSG01','933','Free-Form Message Text','AN 1/264','no'),(87,24,'LS01','447','Loop Identifier Code','AN 1/4','no'),(88,25,'NM101','98','Entity Identifier Code','ID 2/3','yes'),(89,25,'NM102','1065','Entity Type Qualifier','ID 1/1','yes'),(90,25,'NM103','1035','Name Last or Organization Name','AN 1/60','no'),(91,25,'NM104','1036','Name First','AN 1/35','no'),(92,25,'NM105','1037','Name Middle','AN 1/25','no'),(93,25,'NM107','1039','Name Suffix','AN 1/10','no'),(94,25,'NM108','66','Identification Code Qualifier','ID 1/2','yes'),(95,25,'NM109','67','Identification Code','AN 2/80','no'),(96,26,'LE01','447','Loop Identifier Code','AN 1/4','no'),(97,27,'EB01','1390','Eligibility or Benefit Information','ID 1/2','yes'),(98,27,'EB03','1365','Service Type Code','ID 1/2','yes'),(99,27,'EB04','1336','Insurance Type Code','ID 1/3','yes'),(100,27,'EB05','1204','Plan Coverage Description','AN 1/50','no'),(101,27,'EB07','782','Monetary Amount','R 1/18','no'),(102,28,'DTP01','374','Date/Time Qualifier','ID 3/3','yes'),(103,28,'DTP02','1250','Date Time Period Format Qualifier','ID 2/3','yes'),(104,28,'DTP03','1251','Date Time Period','AN 1/35','no'),(105,29,'AAA01','1073','Yes/No Condition or Response Code','ID 1/1','yes'),(106,29,'AAA03','901','Reject Reason Code','ID 2/2','yes'),(107,29,'AAA04','889','Follow-up Action Code','ID 1/1','yes'),(108,30,'MSG01','933','Free-Form Message Text','AN 1/264','no'),(109,31,'LS01','447','Loop Identifier Code','AN 1/4','no'),(110,32,'NM101','98','Entity Identifier Code','ID 2/3','yes'),(111,32,'NM102','1065','Entity Type Qualifier','ID 1/1','yes'),(112,32,'NM103','1035','Name Last or Organization Name','AN 1/60','no'),(113,32,'NM104','1036','Name First','AN 1/35','no'),(114,32,'NM105','1037','Name Middle','AN 1/25','no'),(115,32,'NM107','1039','Name Suffix','AN 1/10','no'),(116,32,'NM108','66','Identification Code Qualifier','ID 1/2','yes'),(117,32,'NM109','67','Identification Code','AN 2/80','no'),(118,33,'LE01','447','Loop Identifier Code','AN 1/4','no');
/*!40000 ALTER TABLE `271MasterSegmentDetailDataElementSummary` ENABLE KEYS */;
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
