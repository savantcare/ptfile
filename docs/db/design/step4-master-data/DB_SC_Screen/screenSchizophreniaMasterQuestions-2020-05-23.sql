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
-- Table structure for table `screenSchizophreniaMasterQuestions`
--

DROP TABLE IF EXISTS `screenSchizophreniaMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSchizophreniaMasterQuestions` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(512) NOT NULL,
  `imageFile` longblob,
  `imageFileName` varchar(255) DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') NOT NULL DEFAULT 'Select box',
  `groupID` tinyint(4) DEFAULT NULL,
  `isItLocked` enum('Yes','No') NOT NULL DEFAULT 'No',
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
-- Dumping data for table `screenSchizophreniaMasterQuestions`
--

LOCK TABLES `screenSchizophreniaMasterQuestions` WRITE;
/*!40000 ALTER TABLE `screenSchizophreniaMasterQuestions` DISABLE KEYS */;
INSERT INTO `screenSchizophreniaMasterQuestions` VALUES (1,'I have trouble speaking the words I want to say, or I am able to speak but other people have told me that what I say in incoherent.',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(2,'I see or hear things that others cannot see or hear.',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(3,'I have had the experience of being completely unable to speak.',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(4,'I sometimes have trouble distinguishing whether something I experience or perceive may be real or may only be part of my imagination or my dreams',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(5,'I have heard two or more voices conversing with one another in voices that other people would not be able to hear',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(6,'I think other people can sometimes read my mind, or I can read other\'s mind',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(7,'I sometimes find that something interrupts or controls my thoughts, feelings, or actions',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(8,'I believe that someone may be planning to cause me harm, or may be about to cause me harm in the near future',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(9,'I believe I have special or supernatural gifts beyond my natural talents',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(10,'I sometimes feel completely unresponsive emotionally, as if I don\'t feel anything',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(11,'I have heard one or more people mumbling or talking about my behavior or my thoughts in voices that other people would not be able to hear',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(12,'I have difficulty getting myself organized to complete any kind of daily activity',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(13,'I think I may be able to predict what will happen in the future',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(14,'As a result of starting to have some of the experiences previously listed, I have experienced significant problems with work, my relationships or social activities, or my ability to look after myself.',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(15,'Some of the experiences previously listed have been due to my having used alcohol or drugs or taken prescription medications which I have been advised may alter my mood or behavior',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(16,'I have been diagnosed with a medical condition which I have been advised may affect my mood or behavior',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0),(17,'I have previously been diagnosed with a mental disorder that I have been told might account for the types of experiences above, or I believe that I may be experiencing such a disorder. This might include Schizoaffective Disorder and Mood Disorder with Psychotic Features, as well as Autistic Disorder or another Pervasive Developmental Disorder',NULL,NULL,'No','Select box',NULL,'No','No, not at all','Yes, slightly','Yes, somewhat or moderately','Yes, definitely','',0,1,2,3,0);
/*!40000 ALTER TABLE `screenSchizophreniaMasterQuestions` ENABLE KEYS */;
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
