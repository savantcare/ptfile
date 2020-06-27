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
-- Table structure for table `screenADHDMasterQuestions`
--

DROP TABLE IF EXISTS `screenADHDMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenADHDMasterQuestions` (
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenADHDMasterQuestions`
--

LOCK TABLES `screenADHDMasterQuestions` WRITE;
/*!40000 ALTER TABLE `screenADHDMasterQuestions` DISABLE KEYS */;
INSERT INTO `screenADHDMasterQuestions` VALUES (1,1,'No','Have trouble wrapping up the final details of a project once the challenging parts have been done?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','',0,1,2,3,0),(2,1,'No','Have difficulty getting things in order when you have to do a task that requires organization?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','',0,1,2,3,0),(3,1,'No','Have problems remembering appointments or obligations?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','',0,1,2,3,0),(4,2,'No','When you have a task that requires a lot of thought, how often do you avoid or delay getting started?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','',0,1,2,3,0),(5,1,'No','Fidget or squirm with your hands or feet when you have to sit down for a long time?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','',0,1,2,3,0),(6,1,'No','Feel overly active and compelled to do things, like you were driven by a motor?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','',0,1,2,3,0),(7,3,'No','How often do you make careless mistakes when you have to work on a boring or difficult project?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(8,3,'No','How often do you have difficulty keeping your attention when you are doing boring or repetitive work?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(9,3,'No','How often do you have difficulty concentrating on what people say to you, even when they are speaking to you directly?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(10,3,'No','How often do you have trouble wrapping up the final details of a project, once the challenging parts have been done?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(11,3,'No','How often do you have difficulty getting things in order when you have to do a task that requires organization?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(12,3,'No','When you have a task that requires a lot of thought, how often do you avoid or delay getting started?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(13,3,'No','How often do you misplace or have difficulty finding things at home or at work?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(14,3,'No','How often are you distracted by activity or noise around you?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(15,3,'No','How often do you have problems remembering appointments or obligations?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(16,4,'No','How often do you fidget or squirm with your hands or feet when you have to sit down for a long time?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(17,4,'No','How often do you leave your seat in meetings or other situations in which you are expected to remain seated?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(18,4,'No','How often do you feel restless or fidgety?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(19,4,'No','How often do you have difficulty unwinding and relaxing when you have time to yourself?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(20,4,'No','How often do you feel overly active and compelled to do things, like you were driven by a motor?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(21,4,'No','How often do you find yourself talking too much when you are in social situations?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(22,4,'No','When you’re in a conversation, how often do you find yourself finishing the sentences of the people you are talking to, before they can finish them themselves?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(23,4,'No','How often do you have difficulty waiting your turn in situations when turn taking is required?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4),(24,4,'No','How often do you interrupt others when they are busy?',NULL,NULL,'No','Select box','Never','Rarely','Sometimes','Often','Very Often',0,1,2,3,4);
/*!40000 ALTER TABLE `screenADHDMasterQuestions` ENABLE KEYS */;
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
