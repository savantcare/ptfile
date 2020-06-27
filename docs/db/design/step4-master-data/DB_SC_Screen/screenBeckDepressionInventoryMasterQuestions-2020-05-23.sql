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
-- Table structure for table `screenBeckDepressionInventoryMasterQuestions`
--

DROP TABLE IF EXISTS `screenBeckDepressionInventoryMasterQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screenBeckDepressionInventoryMasterQuestions` (
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenBeckDepressionInventoryMasterQuestions`
--

LOCK TABLES `screenBeckDepressionInventoryMasterQuestions` WRITE;
/*!40000 ALTER TABLE `screenBeckDepressionInventoryMasterQuestions` DISABLE KEYS */;
INSERT INTO `screenBeckDepressionInventoryMasterQuestions` VALUES (1,NULL,'Yes','Sadness',NULL,NULL,'Yes','Select Box','I do not feel sad','I feel sad much of the time.','I am sad all the time.','I am so sad or unhappy that i can\'t stand it.',NULL,NULL,1,2,3,NULL),(2,NULL,'Yes','Changes in Sleeping pattern',NULL,NULL,'No','Select Box','I have not experiences any change in my sleeping pattern','I sleep somewhat more or somewhat less than usual','I sleep a lot more or lot less than usual','I sleep most of the day.','I wake up 1-2 hours early and can\'t get back to sleep.',NULL,1,2,3,NULL),(3,NULL,'Yes','Changes in Appetite',NULL,NULL,'No','Select Box','I have not experienced any change in my appetite','My appetite is somewhat less or somewhat greater than usual.','My appetite is much less  or much greater than usual.','I have no appetite at all.','I crave food all the time.',NULL,1,2,3,3),(4,NULL,'Yes','Pessimism',NULL,NULL,'No','Select Box','I am not discouraged about my future.','I feel more discouraged about my future than i used to be.','I do not expect things to work out for me.','I feel my future is hopeless and will only get worse.',NULL,NULL,1,2,3,NULL),(5,NULL,'Yes','Past Failure',NULL,NULL,'No','Select Box','I do not feel like a failure.','I have failed more than i should have.','As i look back, I see a lot of failures.','I feel I am a total failure as a person.',NULL,NULL,1,2,3,NULL),(6,NULL,'Yes','Loss of Pleasure',NULL,NULL,'No','Select Box','I get as much pleasure as I ever did from the things I enjoy.','I don\'t enjoy things as much as I used to.','I get very little pleasure from the things I used to enjoy.','I can’t get any pleasure from the things I used to enjoy.',NULL,NULL,1,2,3,NULL),(7,NULL,'Yes','Guilty Feelings',NULL,NULL,'No','Select Box','I don’t feel particularly guilty.','I feel guilty over many things I have done or should have done.','I feel quite guilty most of the time.','I feel guilty all the time.',NULL,0,1,2,3,NULL),(8,NULL,'Yes','Punishment Feelings',NULL,NULL,'No','Select Box','I don’t feel I am being punished.','I feel I may be punished.','I expect to be punished.','I feel I am being punished.',NULL,NULL,1,2,3,NULL),(9,NULL,'Yes','Self-Dislike',NULL,NULL,'No','Select Box','I feel the same about myself as ever.','I have lost confidence in myself.','I am disappointed in myself.','I dislike myself.',NULL,NULL,1,2,3,NULL),(10,NULL,'Yes','Self-Criticalness',NULL,NULL,'No','Select Box','I don’t criticize or blame myself more than usual.','I am more critical of myself than I used to be.','I criticize myself for all of my faults.','I blame myself for everything bad that happens.',NULL,NULL,1,2,3,NULL),(11,NULL,'Yes','Suicidal Thoughts or wishes',NULL,NULL,'No','Select Box','I don’t have any thoughts of killing myself.','I have thoughts of killing myself, but I would not carry them out.','I would like to kill myself.','I would like to kill myself if I had the chance.',NULL,NULL,1,2,3,NULL),(12,NULL,'Yes','Crying',NULL,NULL,'No','Select Box','I don’t cry anymore than I used to.','I cry more than I used to.','I cry over every little thing.','I feel like crying, but I can’t.',NULL,NULL,1,2,3,NULL),(13,NULL,'Yes','Agitation',NULL,NULL,'No','Select Box','I am no more restless or wound up than usual.','I feel more restless or wound up than usual.','I am so restless or agitated that it’s hard to stay still.','I am so restless or agitated that I have to keep moving or doing something.',NULL,NULL,1,2,3,NULL),(14,NULL,'Yes','Loss of Interest',NULL,NULL,'No','Select Box','I have not lost interest in other people or activities.','I am less interested in other people or things than before.','I have lost most of my interest in other people or things.','It’s hard to get interested in anything.',NULL,NULL,1,2,3,NULL),(15,NULL,'Yes','Indecisiveness',NULL,NULL,'No','Select Box','I make decisions about as well as ever.','I find it more difficult to make decision than usual.','I have much greater difficulty in making decisions than I used to.','I have trouble making any decisions.',NULL,NULL,1,2,3,NULL),(16,NULL,'Yes','Worthlessness',NULL,NULL,'No','Select Box','I do not feel I am worthless.','I don’t consider myself as worthwhile and useful as I used to.','I feel more worthless as compared to other people.','I feel utterly worthless.',NULL,NULL,1,2,3,NULL),(17,NULL,'Yes','Loss of Energy',NULL,NULL,'No','Select Box','I have as much energy as ever.','I have less energy than I used to have.','I don’t have enough energy to do very much.','I don’t have enough energy to do anything.',NULL,NULL,1,2,3,NULL),(18,NULL,'Yes','Irritability',NULL,NULL,'No','Select Box','I am no more irritable than usual.','I am more irritable than usual.','I am much more irritable than usual.','I am irritable all the time.',NULL,NULL,1,2,3,NULL),(19,NULL,'Yes','Concentration Difficulty',NULL,NULL,'No','Select Box','I can concentrate as well as ever.','I can’t concentrate as well as usual.','It’s hard to keep my mind on anything for very long.','I find I can’t concentrate on anything.',NULL,NULL,1,2,3,NULL),(20,NULL,'Yes','Tiredness or Fatigue',NULL,NULL,'No','Select Box','I am no more tired or fatigued than usual.','I get more tired or fatigued more easily than usual.','I am too tired or fatigued  to do a lot of the things I used to do.','I am too tired or fatigued  to do most of the things I used to do.',NULL,NULL,1,2,3,NULL),(21,NULL,'Yes','Loss of Interest in Sex',NULL,NULL,'No','Select Box','I have not noticed any recent change in my interest in sex.','I am less interested in sex than I used to be.','I am much less interested in sex now.','I have lost interest in sex completely.',NULL,NULL,1,2,3,NULL);
/*!40000 ALTER TABLE `screenBeckDepressionInventoryMasterQuestions` ENABLE KEYS */;
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
