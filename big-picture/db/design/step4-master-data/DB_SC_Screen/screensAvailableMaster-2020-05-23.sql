use DB_SC_Screen
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Screen
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
-- Table structure for table `screensAvailableMaster`
--

DROP TABLE IF EXISTS `screensAvailableMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screensAvailableMaster` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `screenName` varchar(255) NOT NULL,
  `scientificName` varchar(255) NOT NULL,
  `clinicalStudies` text NOT NULL,
  `isItLocked` enum('yes','no') NOT NULL DEFAULT 'no',
  `dynamicTableAliasName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screensAvailableMaster`
--

LOCK TABLES `screensAvailableMaster` WRITE;
/*!40000 ALTER TABLE `screensAvailableMaster` DISABLE KEYS */;
INSERT INTO `screensAvailableMaster` VALUES (1,'Depression','PHQ-9','1. Kroenke K, Spitzer RL, Williams JB (2001). The PHQ-9: validity of a brief depression severity measure. J Gen Intern Med. 16(9):606. Pub Med ID 11556941\r\n\r\n2. Arroll B, Goodyear-Smith F, Crengle S, Gunn J, Kerse N, Fishman T, Falloon K, Hatcher S. Validation of PHQ-2 and PHQ-9 to screen for major depression in the primary care population. Ann Fam Med. 2010 Jul-Aug;8(4):348-53. doi: 10.1370/afm.1139 Pub Med ID: 20644190','no','Depression'),(2,'Bipolar','MDQ','','no','Bipolar'),(3,'Schizophrenia','','','no','Schizophrenia'),(4,'Anxiety','','','no','Anxiety'),(5,'OCD','','','no','OCD'),(6,'ADHD','ASRS- v1.1','The Adult ADHD Self-Report Scale (ASRS-v1.1) Symptom Checklist was developed in conjunction with the World Health Organization (WHO), and the Workgroup on Adult ADHD that included the following team of psychiatrists and researchers:','yes','ADHD'),(7,'PTSD','','','no','PTSD'),(8,'SPIN','','','no','SPIN'),(9,'Substance Abuse','AUDIT','','yes','Substance'),(10,'Drug Use','DAST-10','','no','Drug'),(11,'TechTestForDoctors','','','no','TechTestForDoctors'),(12,'TechTestForDA','','','no','TechTestForDA'),(14,'YBOCS','','','no','YBOCS'),(15,'Connie\'s Screen','','','no','Connie\'sScreen'),(16,'Beginner Tech Test','','','no','BeginnerTechTest'),(17,'DA Tech Test','','','no','DATechTest'),(18,'Tech Test for Providers','','','yes','TechTestforProviders'),(19,'Test','Test 123','','no','Test'),(20,'RK screen','','','no','RKscreen'),(21,'testak','','','no','testak'),(22,'Suicide Screening','asQ','NATIONAL INSTITUTE OF MENTAL HEALTH (NIMH) 6/13/2017','no','SuicideScreening'),(23,'Alcoholism screening','MAST','','no','Alcoholismscreening'),(24,'Beck Depression Inventory','BDI-II','','no','BeckDepressionInventory');
/*!40000 ALTER TABLE `screensAvailableMaster` ENABLE KEYS */;
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
