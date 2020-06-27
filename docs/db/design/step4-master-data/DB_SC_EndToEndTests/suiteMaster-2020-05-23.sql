use DB_SC_EndToEndTests
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_EndToEndTests
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
-- Table structure for table `suiteMaster`
--

DROP TABLE IF EXISTS `suiteMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suiteMaster` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `suiteName` varchar(255) NOT NULL,
  `parentSuiteId` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suiteMaster`
--

LOCK TABLES `suiteMaster` WRITE;
/*!40000 ALTER TABLE `suiteMaster` DISABLE KEYS */;
INSERT INTO `suiteMaster` VALUES (1,'Logging into the EMR',0),(2,'SMTA Skill',0),(3,'Child history skill',0),(4,'Medication',0),(5,'Medication Skill',4),(6,'Order Skill',4),(7,'Diagnosis skill',0),(8,'Reminders skill',0),(9,'Family history skill',0),(10,'Show me the plan for skills',0),(11,'SMTP for meds',10),(12,'SMTP for rex',10),(13,'SMTP for rem',10),(14,'SMTP for ss',10),(15,'SMTP for plan comments',10),(16,'Waist circumference skill',0),(17,'Allergies skill',0),(18,'Education Status skills',0),(19,'Pulse skill',0),(20,'Care team skill',0),(21,'Phone skill',0),(22,'Red flag panel',0),(23,'Patient reported diagnosis skill',0),(24,'Payer panel',0),(25,'Rule out diagnosis skill',0),(26,'Blood sugar skill',0),(27,'Weight skill',0),(28,'Goal panel',0),(29,'Policies panel',0),(30,'Service statement skill',0),(31,'Task panel',0),(32,'SC Brain billing',0),(33,'Symptoms skill',0),(34,'Oxygen saturation skill',0),(35,'BMI skill',0),(36,'Screening panel',0),(37,'Hospitalization skill',0),(38,'Height skill',0),(39,'Major life event skill',0),(40,'Pharmacy skill',0),(41,'Marital history skill',0),(42,'Plan comments skill',0),(43,'Employment status skill',0),(44,'Documents panel',0),(45,'Blood pressure skill',0),(46,'Official letters panel',0),(47,'Marital status skill',0),(48,'Education history skill',0),(49,'Address skill',0),(50,'Email skill',0),(51,'Age skill',0),(52,'Living children status skill',0),(53,'Employment history skill',0),(54,'Self harm skill',0),(55,'Lives in skill',0),(56,'Lives with skill',0),(57,'Suicide skill',0),(58,'Suggest skill',0),(59,'Appointment Skill',0),(60,'Mental status exam panel',0),(61,'Process note panel',0),(62,'Miscellaneous note panel',0),(63,'SC Brain help',0),(64,'SC Brain subscription',0),(65,'SC Brain referral',0),(66,'SC Brain health insurance coverage',0),(67,'SC Brain release of information',0),(68,'Check logs',0),(69,'Check disk Space',0),(70,'Recommendation skill',0),(71,'Gender panel',0),(72,'Name panel',0),(73,'See skill',0),(74,'Date of birth skill',0),(75,'Social history free text skill',0),(76,'Past psychiatric history skill',0),(77,'Temperature skill',0),(78,'Profile panel',0),(79,'Monitoring panel',0),(80,'Substance use skills',0),(81,'Body measurement skill',0),(82,'SC Brain Contacts',0);
/*!40000 ALTER TABLE `suiteMaster` ENABLE KEYS */;
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
