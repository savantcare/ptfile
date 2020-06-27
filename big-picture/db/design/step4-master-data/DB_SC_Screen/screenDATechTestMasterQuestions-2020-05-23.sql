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
-- Table structure for table `screenDATechTestMasterQuestions`
--

DROP TABLE IF EXISTS `screenDATechTestMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenDATechTestMasterQuestions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` smallint(6) DEFAULT NULL,
  `isItLocked` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageFile` blob,
  `imageFileName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isThisRequiredToAnswer` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `answerInputType` enum('Select box','Text box','Text area') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Select box',
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenDATechTestMasterQuestions`
--

LOCK TABLES `screenDATechTestMasterQuestions` WRITE;
/*!40000 ALTER TABLE `screenDATechTestMasterQuestions` DISABLE KEYS */;
INSERT INTO `screenDATechTestMasterQuestions` VALUES (1,NULL,'No','1. What is Spectacle?',NULL,NULL,'Yes','Select box','Application to help you move windows using shortcuts','Application to allow \"Spotlight Search\"','Application to help you magnify the screen','Application to integrate a dictionary using shortcuts',NULL,1,NULL,NULL,NULL,NULL),(2,NULL,'No','2. How do I make a window full screen using Spectacle?',NULL,NULL,'Yes','Select box','Option Command F','Command F','Control Command F','Control F',NULL,1,NULL,NULL,NULL,NULL),(3,NULL,'No','3. What is the password to log into incoming.fax@savantcare.com',NULL,NULL,'Yes','Select box','jaikailma99','Fax@SC!','Fax@scare','fax@sc2015',NULL,NULL,NULL,1,NULL,NULL),(4,NULL,'No','4. How do I add a med to a patient file using SC Brain',NULL,NULL,'Yes','Select box','meds {name} {strength} {form} {frequency} {directions}','meds {name} {strength} {form} {directions}','meds {name} {form} {strength} {frequency} {directions}','meds {name} {form} {strength} {directions} {frequency}',NULL,1,NULL,NULL,NULL,NULL),(5,NULL,'No','5. In SC Brain which key do I use to see the next field?',NULL,NULL,'Yes','Select box','Space','Tab','Enter','Right Arrow',NULL,NULL,1,NULL,NULL,NULL),(6,NULL,'No','6. In SC Brain which key do I use to select a highlighted option?',NULL,NULL,'Yes','Select box','Space','Tab','Enter','Right Arrow',NULL,NULL,1,NULL,NULL,NULL),(7,NULL,'No','7. In SC Brain which key do I use to send a command to SC Brain?',NULL,NULL,'Yes','Select box','Space','Tab','Enter','Right Arrow',NULL,NULL,NULL,1,NULL,NULL),(8,NULL,'No','8. How do I move a window to a certain part of the screen using Spectacle?',NULL,NULL,'Yes','Select box','Command Arrow Key','Control Arrow Key','Option command Arrow Key','Control Command Arrow Key',NULL,NULL,NULL,1,NULL,NULL),(9,NULL,'No','9. What is the easiest way to book a followup appt?',NULL,NULL,'Yes','Select box','SC Brain command \"sa\"','SC Brain command \"Subsequent appointment\"','SC Brain command \"fa\"','SC Brain command \"na\"',NULL,NULL,NULL,1,NULL,NULL),(10,NULL,'No','10. Why do we lock appts?',NULL,NULL,'Yes','Select box','So we always have a record of every appt even if it gets rescheduled.','Because if an event isn\'t locked it can be altered accidentally','Since dragging an appt to a new time will not update the patient.','Locking appts can prevent errors in a system where multiple users can edit the same information.','All of the above.',NULL,NULL,NULL,NULL,1),(11,NULL,'No','11. Where do you go to leave a note for the billing team?',NULL,NULL,'Yes','Select box','Notes field in the appointment box','At the end of the plan in doctor\'s note.','In the event tab under notes panel.','In SC Chat finance channel.',NULL,NULL,NULL,1,NULL,NULL),(12,NULL,'No','12. Where do I update the actual duration of an appt?',NULL,NULL,'Yes','Select box','In Event Detail Panel','In Appointments Panel','In notes for billing team','notes field in appointment box',NULL,1,NULL,NULL,NULL,NULL),(14,NULL,'No','13. Create a task in SC Chat and enter the task id here',NULL,NULL,'Yes','Text box',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,NULL,'No','14. Which of the following is appropriate to tell a patient over the phone',NULL,NULL,'Yes','Select box','I might be able to offer you a discounted rate.','I promise....','I understand how you feel.','I apologize, I have made a mistake',NULL,0,NULL,NULL,1,NULL),(16,NULL,'No','15. In SC Brain, if I want to select the previous field I press...',NULL,NULL,'Yes','Select box','Control Tab','Command Tab','Shift Tab','Option Tab',NULL,NULL,NULL,1,NULL,NULL),(17,NULL,'No','16. If I book an appointment as approved, but later change the status to \"on hold\" the patient will get an email.',NULL,NULL,'Yes','Select box','True','False',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(18,NULL,'No','17. Create a custom report of the patients a doctor you assist hasn\'t seen in over 6 months and write the title here.  Use rolling dates feature.',NULL,NULL,'Yes','Text box',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,NULL,'No','18. Find something in the EMR you think could be improved and create a gitlab issue.  Post the issue # here.',NULL,NULL,'Yes','Text box',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,NULL,'No','19. How do you check for software updates on your mac computer?',NULL,NULL,'Yes','Select box','Go to General Settings','Click on apple icon and then \"About my mac\"','Ask Tanmoy-Das','Login as an admin and go to Mac Settings',NULL,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `screenDATechTestMasterQuestions` ENABLE KEYS */;
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
