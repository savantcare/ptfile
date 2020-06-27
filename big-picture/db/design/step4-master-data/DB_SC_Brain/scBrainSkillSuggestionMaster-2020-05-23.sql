use DB_SC_Brain
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Brain
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
-- Table structure for table `scBrainSkillSuggestionMaster`
--

DROP TABLE IF EXISTS `scBrainSkillSuggestionMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scBrainSkillSuggestionMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `suggestion` text,
  `createdBy` int(11) NOT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scBrainSkillSuggestionMaster`
--

LOCK TABLES `scBrainSkillSuggestionMaster` WRITE;
/*!40000 ALTER TABLE `scBrainSkillSuggestionMaster` DISABLE KEYS */;
INSERT INTO `scBrainSkillSuggestionMaster` VALUES (1,'goal','description','test by sp\'s account.',11564,10,'2019-12-18 13:02:23','2019-12-24 10:38:24'),(2,'goal','score','hello',5985,5985,'2019-12-18 13:03:38',NULL),(3,'rateGoal','score','test',10,10,'2019-12-18 13:07:12',NULL),(4,'goal','Start_date_of_goal','Examples:\n1. 2/15/2016\n2. March 2016\n3. first day of March 2016\n4. last day of march 2016\n5. 10 March 2016\n6. 10th March 2016\n7. 10 feb 2016\n8. 2 days ago\n9. 2 years ago\n10. first day of 2 years 1 month ago\n11. today\n12. tomorrow\n13. yesterday\n14. 5 years ago',439,439,'2019-12-18 13:11:06',NULL),(5,'diagnosis','name','......',11564,10,'2019-12-19 11:04:55','2019-12-24 10:38:52'),(6,'addReminders','description','test 123s',11564,10,'2020-04-16 13:36:56','2020-04-21 19:40:36'),(7,'addRecommendations','description','cvxds',11564,11564,'2020-04-21 10:04:38',NULL);
/*!40000 ALTER TABLE `scBrainSkillSuggestionMaster` ENABLE KEYS */;
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
