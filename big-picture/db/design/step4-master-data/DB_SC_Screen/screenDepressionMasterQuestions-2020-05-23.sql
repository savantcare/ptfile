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
-- Table structure for table `screenDepressionMasterQuestions`
--

DROP TABLE IF EXISTS `screenDepressionMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDepressionMasterQuestions` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenDepressionMasterQuestions`
--

LOCK TABLES `screenDepressionMasterQuestions` WRITE;
/*!40000 ALTER TABLE `screenDepressionMasterQuestions` DISABLE KEYS */;
INSERT INTO `screenDepressionMasterQuestions` VALUES (1,1,'No','Feeling down, depressed, or hopeless?',NULL,NULL,'Yes','Select box','Not at all','Several days','More than half the days','Nearly every day','',0,1,2,3,0),(2,1,'No','Trouble falling or staying asleep, or sleeping too much?',NULL,NULL,'Yes','Select box','Not at all','Several days','More than half the days','Nearly every day','',0,1,2,3,0),(3,1,'No','Feeling tired or having little energy?',NULL,NULL,'Yes','Select box','Not at all','Several days','More than half the days','Nearly every day','',0,1,2,3,0),(4,1,'No','Poor appetite or overeating?',NULL,NULL,'Yes','Select box','Not at all','Several days','More than half the days','Nearly every day','',0,1,2,3,0),(5,1,'No','Feeling bad about yourself -- or that you are a failure or have let yourself or your family down?',NULL,NULL,'Yes','Select box','Not at all','Several days','More than half the days','Nearly every day','',0,1,2,3,0),(6,1,'No','Trouble concentrating on things, such as reading newspapers or watching television?',NULL,NULL,'Yes','Select box','Not at all','Several days','More than half the days','Nearly every day','',0,1,2,3,0),(7,1,'No','Moving or speaking slowly that other could have noticed. Or the opposite -- being so figety or restless that you have been moving around a lot more than usual?',NULL,NULL,'Yes','Select box','Not at all','Several days','More than half the days','Nearly every day','',0,1,2,3,0),(8,1,'No','Thoughts that you would be better off dead, or of hurting yourself?',NULL,NULL,'Yes','Select box','Not at all','Several days','More than half the days','Nearly every day','',0,1,2,3,0),(9,2,'No','If you have checked off any problems, how difficult have these problems made it for you to do your work, take care of things at home, or get along with other people?',NULL,NULL,'Yes','Select box','Not difficult at all','Somewhat difficult','Very difficult','Extremely difficult','',0,1,2,3,0);
/*!40000 ALTER TABLE `screenDepressionMasterQuestions` ENABLE KEYS */;
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
