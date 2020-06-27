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
-- Table structure for table `screenOCDMasterQuestions`
--

DROP TABLE IF EXISTS `screenOCDMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenOCDMasterQuestions` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` tinyint(4) unsigned DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenOCDMasterQuestions`
--

LOCK TABLES `screenOCDMasterQuestions` WRITE;
/*!40000 ALTER TABLE `screenOCDMasterQuestions` DISABLE KEYS */;
INSERT INTO `screenOCDMasterQuestions` VALUES (1,3,'No','Do you have unwanted ideas, images, or impulses that seem silly, nasty or horrible?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(2,3,'No','Do you worry excessively about dirt, germs, or chemicals?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(3,3,'No','Are you constantly worried that something bad will happen because you forgot something important, like locking the door or turning off appliances?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(4,3,'No','Do you experience shortness of breath?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(5,3,'No','Are you afraid you will act or speak aggressively when you really don\'t want to ?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(6,3,'No','Are there things you feel you must do excessively or thoughts you must think repeatedly to feel comfortable or ease anxiety?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(7,3,'No','Trouble falling or staying asleep, or restless and unsatisfying sleep?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(8,3,'No','Do you wash yourself or things around you excessively ?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(9,3,'No','Do you have to check things over and over or repeat actions many times to be sure they are done properly?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(10,3,'No','Do you avoid situations or people you worry about hurting by aggressive words or actions?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(11,3,'No','Do you keep many useless things because you feel that you can\'t throw them away?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(12,3,'No','Have you experienced changes in sleeping or eating habits?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(13,1,'No','Sad or depressed?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(14,1,'No','Disinterested in life?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(15,1,'No','Worthless or guilty?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(16,2,'No','Resulted in your failure to fulfill responsibilities with work, school or family?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(17,2,'No','Placed you in a dangerous situation, such as driving a car under the influence?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(18,2,'No','Gotten you arrested?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(19,2,'No','Continued despite causing problems for you or your loved ones?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0);
/*!40000 ALTER TABLE `screenOCDMasterQuestions` ENABLE KEYS */;
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
