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
-- Table structure for table `screenSuicideScreeningMasterQuestions`
--

DROP TABLE IF EXISTS `screenSuicideScreeningMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSuicideScreeningMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` smallint(6) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` blob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select Box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select Box',
  `option1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pointsForOption1` smallint(6) DEFAULT NULL,
  `pointsForOption2` smallint(6) DEFAULT NULL,
  `pointsForOption3` smallint(6) DEFAULT NULL,
  `pointsForOption4` smallint(6) DEFAULT NULL,
  `pointsForOption5` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenSuicideScreeningMasterQuestions`
--

LOCK TABLES `screenSuicideScreeningMasterQuestions` WRITE;
/*!40000 ALTER TABLE `screenSuicideScreeningMasterQuestions` DISABLE KEYS */;
INSERT INTO `screenSuicideScreeningMasterQuestions` VALUES (1,NULL,'No','In the past few weeks, have you wished you were dead?',NULL,NULL,'Yes','Select Box','Yes','No',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(2,NULL,'No','In the past few weeks, have you felt that you or your family would be better off if you were dead?',NULL,NULL,'Yes','Select Box','Yes','No',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(3,NULL,'No','In the past week, have you been having thoughts about killing yourself?',NULL,NULL,'Yes','Select Box','Yes','No',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(4,NULL,'No','Have you ever tried to kill yourself?',NULL,NULL,'Yes','Select Box','Yes','No',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(5,NULL,'No','Are you having thoughts of killing yourself right now?',NULL,NULL,'Yes','Select Box','Yes','No',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(6,NULL,'No','If you are having thoughts of killing yourself right now, please describe:',NULL,NULL,'No','Text box',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,'No','If you have tried to kill yourself, please explain How and when:',NULL,NULL,'No','Text box',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `screenSuicideScreeningMasterQuestions` ENABLE KEYS */;
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
