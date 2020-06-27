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
-- Table structure for table `screenSPINMasterQuestions`
--

DROP TABLE IF EXISTS `screenSPINMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSPINMasterQuestions` (
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenSPINMasterQuestions`
--

LOCK TABLES `screenSPINMasterQuestions` WRITE;
/*!40000 ALTER TABLE `screenSPINMasterQuestions` DISABLE KEYS */;
INSERT INTO `screenSPINMasterQuestions` VALUES (1,1,'No','I am afraid of people in authority',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(2,1,'No','I am bothered by blushing in front of people',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(3,1,'No','Parties and social events scare me',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(4,1,'No','I avoid talking to people I don\'t know',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(5,1,'No','Being criticized scares me a lot',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(6,1,'No','Fear of embarrassment causes me to avoid doing things or speaking to people',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(7,1,'No','Sweating in front of people causes me distress',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(8,1,'No','I avoid going to parties',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(9,1,'No','I avoid activities in which I am the centre of attention',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(10,1,'No','Talking to strangers scares me',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(11,1,'No','I avoid having to give speeches',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(12,1,'No','I would do anything to avoid being criticized',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(13,1,'No','Heart palpitations bother me when I am around people',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(14,1,'No','I am afraid of doing things when people might be watching',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(15,1,'No','Being embarrassed or looking stupid is among my worst fears',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(16,1,'No','I avoid speaking to anyone in authority',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4),(17,1,'No','Trembling or shaking in front of others is distressing to me',NULL,NULL,'No','Select box','Not at all','A little bit','Somewhat','Very much','Extremely',0,1,2,3,4);
/*!40000 ALTER TABLE `screenSPINMasterQuestions` ENABLE KEYS */;
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
