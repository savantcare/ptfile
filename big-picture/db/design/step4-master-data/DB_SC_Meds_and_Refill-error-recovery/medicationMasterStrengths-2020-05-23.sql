use DB_SC_Meds_and_Refill-error-recovery
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Meds_and_Refill-error-recovery
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
-- Table structure for table `medicationMasterStrengths`
--

DROP TABLE IF EXISTS `medicationMasterStrengths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationMasterStrengths` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `strength` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicationMasterStrengths`
--

LOCK TABLES `medicationMasterStrengths` WRITE;
/*!40000 ALTER TABLE `medicationMasterStrengths` DISABLE KEYS */;
INSERT INTO `medicationMasterStrengths` VALUES (1,'5 mg'),(2,'10 mg'),(3,'25 mg'),(4,'50 mg'),(5,'7.5 mg\r\n'),(6,'650 mg'),(8,'12.5 mg'),(9,'100mg'),(10,'90mg'),(11,'2.5mg'),(12,'10mg'),(13,'20mg'),(14,'5mg'),(15,'2'),(16,'200mg'),(17,'30 mg'),(18,'100 mg'),(19,'50mg'),(20,'15mg'),(21,'25mg'),(22,'150mg'),(23,'800I.U'),(24,'600mg'),(25,'30mg'),(26,'190mg'),(27,'130mg'),(28,'160mg'),(29,'145mg'),(30,'155mg'),(31,'20 mg'),(32,'200 mg'),(33,'300 mg'),(34,'400mg'),(35,'709mg'),(36,'05 mg'),(37,'60mg'),(38,'undefined'),(39,'120 mg'),(40,'60 mg '),(41,'130 mg '),(42,'160 mg '),(43,'90 mg '),(44,'4 mg'),(45,'18 mg'),(46,'500 mg'),(47,'1 mg'),(48,'37.5mg'),(49,'20'),(50,'0.5 mg'),(51,'150'),(52,'150 mg'),(53,'75 mg'),(54,'5  mg'),(55,'15 mg'),(56,'200'),(57,'2 mg'),(58,'0.25'),(59,'234 mg'),(60,'600 mg'),(61,'40 mg'),(62,'100'),(63,'10 mg/ml'),(64,'54 mg'),(65,'37.5 mg'),(66,'0.1 mg'),(67,'8 mg'),(68,'0.25 mg'),(69,'10 mg/5ml'),(70,'150 mg BID'),(71,'7.5 mg'),(72,'450mg'),(73,'35 mg'),(74,'45 mg'),(75,'80 mg'),(76,'3 mg'),(77,'28 mg'),(78,'20 ml'),(79,'156 mg/ml'),(80,'156mg'),(81,'2 years ago'),(82,'800 mg'),(83,'oral tablet'),(84,'050 mg'),(85,'2.0-0.5'),(86,'2.0-0.5 mg'),(87,'36 mg'),(88,'50 mg/5 ml'),(89,'250 mg/5 ml'),(90,'9 mg'),(91,'70 mg'),(92,'100 micro gram'),(93,'400 mg'),(94,'20 mg / ml'),(95,'1.5 mg'),(96,'6 mg'),(97,'900mg'),(98,'75mg'),(99,'16mg'),(100,'2mg'),(101,'20m'),(102,'250 mg'),(103,'Oral solution'),(104,'250 mg / 5 ml'),(105,'450 mg'),(106,'6.25 mg'),(107,'4.5 mg'),(108,'6/2/600'),(109,'300mg Wellbutrin'),(110,'12.5mg'),(111,'80mg'),(112,'25 mcg'),(113,'aripiprazole 2mg'),(114,'8.6 mg'),(115,'100 mg sr'),(116,'Lamictal 25mg nondissolving'),(117,'Wellbutrin 150 mg'),(118,'27 mg'),(119,'60'),(120,'Xanax 0.5 mg'),(121,'225 mg'),(122,'200 g'),(123,'3.5 mg'),(124,'50 mg / 5 ml'),(125,'2.5 mg'),(126,'MG/5ML'),(127,'8/2 mg'),(128,'Doxepin 100 mg'),(129,'0.125 mg'),(130,'24 mg'),(131,'40mg'),(132,'7.5mg'),(133,'18mg'),(134,'0.5mg'),(135,'1212121'),(136,'12'),(137,'300mg'),(138,'Tablet'),(139,'100 mcg'),(140,'125mg'),(141,'12mg'),(142,'0.2 mg'),(143,'10'),(144,'50'),(145,'75-21.5-8.5'),(146,'250 mg/5ml'),(147,'500mg'),(148,'54 g'),(149,'5'),(150,'102mg'),(151,'50 mg / ml'),(152,'50 mg/ml'),(153,'20 mg tab'),(154,'25'),(155,'12.5 mg/5mL'),(156,'750 mg'),(157,'0.1'),(158,'4mg'),(159,'101mg'),(160,'123mg'),(161,'140mg'),(162,'1.75 mg SL'),(163,'softgell'),(164,'.125'),(165,'300'),(166,'40'),(167,'22.5 mg'),(168,'37.5'),(169,'1000mg'),(170,'156 mg'),(171,'0.3 mg'),(172,'6-2-600'),(173,'3mg'),(174,'1.25 mg'),(175,'1.25 ml'),(176,'1mg'),(177,'158mg'),(178,'300-30'),(179,'250mg'),(180,'120mg'),(181,'60mg+30mg'),(182,'2 mg / ml'),(183,'54mg'),(184,'75'),(185,'1000 mg'),(186,'45'),(187,'0.5'),(188,'70mg'),(189,'140 mg'),(190,'333 mg'),(191,'50 g'),(192,'sdsdsd'),(193,'75 mg'),(194,'36'),(195,'34 mg'),(196,'0.5 g'),(197,'1'),(198,'8/90 mg'),(199,'0.75MG'),(200,'5 -300 mg'),(201,'117 mg'),(202,'125 mg'),(203,'30 mgta'),(204,'1gm'),(205,'666 mg'),(206,'1000 units'),(207,'unknown'),(208,'10 mg cap'),(209,'6mg'),(210,'600'),(211,'15'),(212,'i bid'),(213,'1%'),(214,'1.75'),(215,'50,000 IU'),(216,'50000 IU'),(217,'test'),(218,'348 mg'),(219,'9.5 mg'),(220,'250mg/5ml'),(221,'1.8 mg'),(222,'na'),(223,'50 mcg'),(224,'0.5 mg');
/*!40000 ALTER TABLE `medicationMasterStrengths` ENABLE KEYS */;
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
