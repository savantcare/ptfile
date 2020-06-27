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
-- Table structure for table `screenSubstanceMasterQuestions`
--

DROP TABLE IF EXISTS `screenSubstanceMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenSubstanceMasterQuestions` (
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
-- Dumping data for table `screenSubstanceMasterQuestions`
--

LOCK TABLES `screenSubstanceMasterQuestions` WRITE;
/*!40000 ALTER TABLE `screenSubstanceMasterQuestions` DISABLE KEYS */;
INSERT INTO `screenSubstanceMasterQuestions` VALUES (1,NULL,'No','How often do you have a drink containing alcohol?',NULL,NULL,'No','Select box','never','monthly','2-4 times a month','2-3 times a week','4 or more times a week',0,1,2,3,4),(2,NULL,'No','How many drinks containing alcohol do you have on a typical day when you are drinking?',NULL,NULL,'No','Select box','1-2','3 or 4','5 or 6','7-9','10 or more',0,1,2,3,4),(3,NULL,'No','How often do you have six or more drinks on one occasion?',NULL,NULL,'No','Select box','never','less than monthly','monthly','weekly','daily or almost daily',0,1,2,3,4),(4,NULL,'No','How often during the last year have you found that you were unable to stop drinking once you started? ',NULL,NULL,'No','Select box','never','less than monthly','monthly','weekly','daily or almost daily',0,1,2,3,4),(5,NULL,'No','How often during the last year have you failed to do what was normally expected of you because of drinking?',NULL,NULL,'No','Select box','never','less than monthly','monthly','weekly','daily or almost daily',0,1,2,3,4),(6,NULL,'No','How often during the last year have you needed a first drink in the morning to get yourself going after a heavy drinking session?',NULL,NULL,'No','Select box','never','less than monthly','monthly','weekly','daily or almost daily',0,1,2,3,4),(7,NULL,'No','How often during the last year have you felt guilt or remorse after drinking?',NULL,NULL,'No','Select box','never','less than monthly','monthly','weekly','daily or almost daily',0,1,2,3,4),(8,NULL,'No','How often during the last year have you been unable to remember what happened the night before because of drinking?',NULL,NULL,'No','Select box','never','less than monthly','monthly','weekly','daily or almost daily',0,1,2,3,4),(9,NULL,'No','Have you or someone else been injured as the result of your drinking?',NULL,NULL,'No','Select box','no','yes, but not in the last year','yes, during the last year',' ',' ',0,1,2,3,4),(10,NULL,'No','Has a friend, relative, or doctor or other health worker been concerned about your drinking or suggested you cut down?',NULL,NULL,'No','Select box','no','yes, but not in the last year','yes, during the last yea',' ',' ',0,1,2,3,4);
/*!40000 ALTER TABLE `screenSubstanceMasterQuestions` ENABLE KEYS */;
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
