use DB_SC_Meds_and_Refill
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Meds_and_Refill
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
-- Table structure for table `medicationMasterForms`
--

DROP TABLE IF EXISTS `medicationMasterForms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationMasterForms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicationMasterForms`
--

LOCK TABLES `medicationMasterForms` WRITE;
/*!40000 ALTER TABLE `medicationMasterForms` DISABLE KEYS */;
INSERT INTO `medicationMasterForms` VALUES (1,'Oral tablet'),(2,'Oral solution'),(3,'Test 1'),(4,'test'),(5,'Oral tablet\\'),(6,'tab'),(7,'cap'),(8,'tet'),(9,'Oroal tablet'),(10,'0'),(11,'oral sol'),(12,'tablet'),(13,'Oral Capsule'),(14,'Oral'),(15,'oral tab'),(16,'IM shot'),(17,'Capsule'),(18,'solution'),(19,'Oral suspension'),(20,'Oral tablemt'),(21,'SL Tab'),(22,'Lozenge'),(23,'Oal Syrup'),(24,'Patch'),(25,'liquid'),(26,'Liquid solution'),(27,'50 mg'),(28,'Oral cap'),(29,'PO Tab'),(30,'sublingual FILM'),(31,'Tab/Film'),(32,'PO Cap'),(33,'oral  tablet'),(34,'20 mg'),(35,'oral tba'),(36,'121212'),(37,'2'),(38,'tonic'),(39,'1'),(40,'capsules'),(41,'today'),(42,'tablets'),(43,'Intra muscular'),(44,'OREL'),(45,'Sublingual'),(46,'transdermal patch'),(47,'softgell'),(48,'mg'),(49,'tabs'),(50,'im'),(51,'adderall XR'),(52,'cap 30'),(53,'tab 30'),(54,'tab #90'),(55,'oral tabs'),(56,'cap #30 6-28-17'),(57,'cap #30'),(58,'cap#30 RF2'),(59,'tab #30'),(60,'tblet'),(61,'tab .'),(62,'cap #60'),(63,'2 tabs po qam'),(64,'tab . 30'),(65,'tab   45'),(66,'Tablt'),(68,'ODT'),(69,'Injection'),(70,'capsul'),(71,'cp'),(72,'Oral Capsules'),(73,'oral tabley'),(74,'oral tablety'),(75,'unknown'),(76,'teeeee'),(77,'60');
/*!40000 ALTER TABLE `medicationMasterForms` ENABLE KEYS */;
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
