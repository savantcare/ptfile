use DB_SC_Correlate
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Correlate
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
-- Table structure for table `dataSeriesMasterNames`
--

DROP TABLE IF EXISTS `dataSeriesMasterNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataSeriesMasterNames` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `typeID` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeID` (`typeID`),
  CONSTRAINT `dataSeriesMasterNames_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `dataSeriesMasterGroupNames` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataSeriesMasterNames`
--

LOCK TABLES `dataSeriesMasterNames` WRITE;
/*!40000 ALTER TABLE `dataSeriesMasterNames` DISABLE KEYS */;
INSERT INTO `dataSeriesMasterNames` VALUES (1,1,'Weight','#F0DC82'),(2,1,'BMI','#800020'),(3,1,'Waist circumference','#DEB887'),(4,1,'Blood sugar','#CC5500'),(5,2,'Diagnosis','#E97451'),(12,3,'Symptoms','#E30022'),(13,4,'Sleep','#A3C1AD'),(14,5,'Thoughts','#78866B'),(15,6,'Medications','#FFEF00'),(16,8,'Gateway Mood Symptoms','#FF0800'),(17,8,'Depression','#C41E3A'),(18,8,'Mania / Hypomania','#00CC99'),(19,8,'Psychosis','#960018'),(20,8,'Sleep','#99BADD'),(21,10,'Substance Use','#ED9121'),(22,8,'GAD','#92A1CF'),(23,8,'Panic Attacks','#ACE1AF'),(24,8,'Social Anxiety','#007BA7'),(25,8,'OCD','#2A52BE'),(26,8,'PTSD','#A0785A'),(27,8,'ADHD','#F7E7CE'),(28,8,'Anorexia','#36454F'),(29,8,'Bulimia','#DFFF00'),(30,8,'Dementia','#DE3163'),(31,8,'Suicide Assessment','#FFB7C5'),(32,8,'Homicide Assessment','#CD5C5C'),(34,9,'Distance Traveled','#FFA700'),(35,9,'TalkTime','#98817B'),(36,10,'Substance Abuse','#E34234'),(37,9,'Physical Activity Index','#D2691E'),(38,9,'Social Activity Index','#E4D00A'),(39,11,'Appointments','#FBCCE7'),(40,12,'Allergies','#00FF6F'),(41,13,'Hospitalizations','#0047AB'),(42,14,'Goal','#9BDDFF'),(43,15,'Depression','#002E63'),(44,15,'Schizophrenia','#8C92AC'),(45,15,'Bipolar','#B87333'),(46,15,'Anxiety','#FF3800'),(47,15,'OCD','#FF7F50'),(48,15,'ADHD','#893F45'),(49,15,'PTSD','#FBEC5D'),(50,15,'SPIN','#B31B1B'),(51,15,'Substance Abuse','#6495ED'),(52,15,'Drug Use','#ff0000'),(53,15,'TechTestForDoctors',NULL),(54,15,'TechTestForDA',NULL),(56,15,'YBOCS',NULL),(57,15,'Connie\'s Screen',NULL),(58,16,'Mood Tracker',NULL),(59,15,'Beginner Tech Test',NULL),(60,15,'DA Tech Test',NULL),(61,1,'height','#FFEF00'),(62,1,'bp(systolic)','#FF7F50'),(63,1,'bp(diastolic)','#6495ED'),(64,1,'sao2','#FF3800'),(65,1,'pulse','#ACE1AF'),(66,7,'dob','#6495ED'),(67,7,'mle','#A3C1AD'),(68,15,'Tech Test for Providers',NULL),(69,17,'Self Harm','#9BDDFF'),(71,15,'RK screen',NULL),(72,1,'temperature','#636e72'),(73,15,'testak',NULL),(74,15,'Suicide Screening',NULL),(75,15,'Alcoholism screening',NULL),(76,15,'test',NULL),(77,15,'Beck Depression Inventory',NULL);
/*!40000 ALTER TABLE `dataSeriesMasterNames` ENABLE KEYS */;
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
