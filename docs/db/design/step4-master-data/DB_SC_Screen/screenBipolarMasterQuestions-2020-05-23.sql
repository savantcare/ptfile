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
-- Table structure for table `screenBipolarMasterQuestions`
--

DROP TABLE IF EXISTS `screenBipolarMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBipolarMasterQuestions` (
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenBipolarMasterQuestions`
--

LOCK TABLES `screenBipolarMasterQuestions` WRITE;
/*!40000 ALTER TABLE `screenBipolarMasterQuestions` DISABLE KEYS */;
INSERT INTO `screenBipolarMasterQuestions` VALUES (1,1,'No','You felt so good or so hyper that other people thought you were not your normal self or you were so hyper that you go into trouble alot?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(2,1,'No','You felt much more self-confident than usual?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(3,1,'No','You got much less sleep than usual and found that you didn\'t really miss it?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(4,1,'No','You were more talkative or spoke much faster than usual?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(5,1,'No','Thoughts raced through your head or you couldn\'t slow down your mind?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(6,1,'No','You were so easily distracted by things around you that you had trouble concentrating or staying on track?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(7,1,'No','You had more energy than usual?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(8,1,'No','You were much more active or did many more things than usual?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(9,1,'No','You were more social or outgoing than usual, for example, you telephoned friends in the middle of the night?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(10,1,'No','You were much more interested in sex than usual?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(11,1,'No','You did things that were unusual for you or that other people might have thought were excessive, foolish, or risky ?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(12,1,'No','Spending money got you or your family in trouble?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(13,2,'No','If you have selected YES to more than one of the above, have several of these ever happened during the same period of time?',NULL,NULL,'No','Select box','Yes','No','','','',1,0,0,0,0),(14,2,'No','How much of a problem did any of these cause for you --like being unable to work; having family, money or legal troubles ; getting into arguments or fights?',NULL,NULL,'No','Select box','No problems','Minor problems','Moderate problems','Serious problems','',0,1,2,3,0);
/*!40000 ALTER TABLE `screenBipolarMasterQuestions` ENABLE KEYS */;
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
