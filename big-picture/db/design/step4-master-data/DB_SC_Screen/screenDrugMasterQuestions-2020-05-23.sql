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
-- Table structure for table `screenDrugMasterQuestions`
--

DROP TABLE IF EXISTS `screenDrugMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDrugMasterQuestions` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` tinyint(4) DEFAULT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `question` varchar(255) NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') NOT NULL DEFAULT 'Select box',
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `option5` varchar(255) NOT NULL,
  `pointsForOption1` int(3) NOT NULL,
  `pointsForOption2` int(3) NOT NULL,
  `pointsForOption3` int(3) NOT NULL,
  `pointsForOption4` int(3) NOT NULL,
  `pointsForOption5` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenDrugMasterQuestions`
--

LOCK TABLES `screenDrugMasterQuestions` WRITE;
/*!40000 ALTER TABLE `screenDrugMasterQuestions` DISABLE KEYS */;
INSERT INTO `screenDrugMasterQuestions` VALUES (1,NULL,'No','Have you used drugs other than those required for medical reasons?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(2,NULL,'No','Do you abuse more than one drug at a time?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(3,NULL,'No','Are you always able to stop using drugs when you want to?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(4,NULL,'No','Have you had \"blackouts\' or \'flashbacks\" as a result of drug use?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(5,NULL,'No','Do you ever feel bad or guilty about your drug use?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(6,NULL,'No','Does your spouse (or parents) ever complain about your involvement with drugs?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(7,NULL,'No','Have you neglected your family because of your use of drugs?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(8,NULL,'No','Have you engaged in illegal activities in order to obtain drugs?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(9,NULL,'No','Have you ever experienced withdrawal symptoms (felt sick) when you stopped taking drugs?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(10,NULL,'No','Have you had medical problems as a result of your drug use (e.g. memory loss, hepatitis, convulsions, bleeding, etc.)?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0);
/*!40000 ALTER TABLE `screenDrugMasterQuestions` ENABLE KEYS */;
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
