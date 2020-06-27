use DB_SC_Feature
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Feature
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
-- Table structure for table `featureMaster`
--

DROP TABLE IF EXISTS `featureMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featureMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdAtDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedAtDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featureMaster`
--

LOCK TABLES `featureMaster` WRITE;
/*!40000 ALTER TABLE `featureMaster` DISABLE KEYS */;
INSERT INTO `featureMaster` VALUES (1,'Login',538,'2019-11-12 13:30:23',NULL,NULL),(2,'diagnosis',549,'2019-10-28 11:49:51',NULL,NULL),(3,'order labs',549,'2019-10-28 11:49:51',538,'2019-11-08 01:10:22'),(4,'medication',549,'2019-10-28 11:49:51',NULL,NULL),(5,'medicine notes',549,'2019-10-28 11:49:51',NULL,NULL),(6,'order',549,'2019-10-28 11:49:51',NULL,NULL),(7,'patient reported medication',549,'2019-10-28 11:49:51',NULL,NULL),(9,'activity log',549,'2019-10-28 11:49:51',NULL,NULL),(10,'age',549,'2019-10-28 11:49:51',NULL,NULL),(11,'allergies',549,'2019-10-28 11:49:51',NULL,NULL),(12,'app',549,'2019-10-28 11:49:51',NULL,NULL),(13,'appointments',549,'2019-10-28 11:49:51',NULL,NULL),(14,'billing',549,'2019-10-28 11:49:51',NULL,NULL),(15,'birthplace',549,'2019-10-28 11:49:51',NULL,NULL),(16,'blood pressure',549,'2019-10-28 11:49:51',NULL,NULL),(17,'blood sugar',549,'2019-10-28 11:49:51',NULL,NULL),(18,'bmi',549,'2019-10-28 11:49:51',NULL,NULL),(19,'body measurement',549,'2019-10-28 11:49:51',NULL,NULL),(20,'care team',549,'2019-10-28 11:49:51',NULL,NULL),(21,'career highlights',549,'2019-10-28 11:49:51',NULL,NULL),(22,'chat',549,'2019-10-28 11:49:51',NULL,NULL),(23,'child history',549,'2019-10-28 11:49:51',NULL,NULL),(24,'clear',549,'2019-10-28 11:49:51',NULL,NULL),(25,'close',549,'2019-10-28 11:49:51',NULL,NULL),(26,'code',549,'2019-10-28 11:49:51',NULL,NULL),(27,'common screen',549,'2019-10-28 11:49:51',NULL,NULL),(28,'contacts',549,'2019-10-28 11:49:51',NULL,NULL),(29,'correlate',549,'2019-10-28 11:49:51',NULL,NULL),(30,'current employment status',549,'2019-10-28 11:49:51',NULL,NULL),(31,'date of birth',549,'2019-10-28 11:49:51',NULL,NULL),(32,'documents',549,'2019-10-28 11:49:51',NULL,NULL),(33,'education history',549,'2019-10-28 11:49:51',NULL,NULL),(34,'email',549,'2019-10-28 11:49:51',NULL,NULL),(35,'employment history',549,'2019-10-28 11:49:51',NULL,NULL),(36,'family history',549,'2019-10-28 11:49:51',NULL,NULL),(37,'followup appointment',549,'2019-10-28 11:49:51',NULL,NULL),(38,'gender',549,'2019-10-28 11:49:51',NULL,NULL),(39,'goal',549,'2019-10-28 11:49:51',NULL,NULL),(40,'guidelines',549,'2019-10-28 11:49:51',NULL,NULL),(41,'health insurance coverage',549,'2019-10-28 11:49:51',NULL,NULL),(42,'height',549,'2019-10-28 11:49:51',NULL,NULL),(43,'help',549,'2019-10-28 11:49:51',NULL,NULL),(44,'help desk request',549,'2019-10-28 11:49:51',NULL,NULL),(45,'highest education',549,'2019-10-28 11:49:51',NULL,NULL),(46,'hospitalization',549,'2019-10-28 11:49:51',NULL,NULL),(47,'info',549,'2019-10-28 11:49:51',NULL,NULL),(48,'intake summary',549,'2019-10-28 11:49:51',NULL,NULL),(49,'lives in',549,'2019-10-28 11:49:51',NULL,NULL),(50,'lives with',549,'2019-10-28 11:49:51',NULL,NULL),(51,'major life event',549,'2019-10-28 11:49:51',NULL,NULL),(52,'marital history',549,'2019-10-28 11:49:51',NULL,NULL),(53,'marital status',549,'2019-10-28 11:49:51',NULL,NULL),(54,'medical history',549,'2019-10-28 11:49:51',NULL,NULL),(55,'medical review of system',549,'2019-10-28 11:49:51',NULL,NULL),(56,'mental status exam',549,'2019-10-28 11:49:51',NULL,NULL),(57,'miscellaneous note',549,'2019-10-28 11:49:51',NULL,NULL),(58,'monitoring panel',549,'2019-10-28 11:49:51',NULL,NULL),(59,'mse history',549,'2019-10-28 11:49:51',NULL,NULL),(60,'name',549,'2019-10-28 11:49:51',NULL,NULL),(61,'number of living children',549,'2019-10-28 11:49:51',NULL,NULL),(62,'official letters',549,'2019-10-28 11:49:51',NULL,NULL),(63,'onebox',549,'2019-10-28 11:49:51',NULL,NULL),(64,'open chart',549,'2019-10-28 11:49:51',NULL,NULL),(65,'oxygen saturation',549,'2019-10-28 11:49:51',NULL,NULL),(66,'past medical history',549,'2019-10-28 11:49:51',NULL,NULL),(67,'past psychiatric history',549,'2019-10-28 11:49:51',NULL,NULL),(68,'payer',549,'2019-10-28 11:49:51',NULL,NULL),(69,'payment info',549,'2019-10-28 11:49:51',NULL,NULL),(70,'pharmacy',549,'2019-10-28 11:49:51',NULL,NULL),(71,'phone',549,'2019-10-28 11:49:51',NULL,NULL),(72,'plan comments',549,'2019-10-28 11:49:51',NULL,NULL),(73,'policies',549,'2019-10-28 11:49:51',NULL,NULL),(74,'process note',549,'2019-10-28 11:49:51',NULL,NULL),(75,'profile',549,'2019-10-28 11:49:51',NULL,NULL),(76,'pulse',549,'2019-10-28 11:49:51',NULL,NULL),(77,'purpose of visit',549,'2019-10-28 11:49:51',NULL,NULL),(79,'red flag',549,'2019-10-28 11:49:51',NULL,NULL),(80,'referral',549,'2019-10-28 11:49:51',NULL,NULL),(81,'release of information',549,'2019-10-28 11:49:51',NULL,NULL),(82,'review of systems',549,'2019-10-28 11:49:51',NULL,NULL),(83,'ros history',549,'2019-10-28 11:49:51',NULL,NULL),(84,'rule out',549,'2019-10-28 11:49:51',NULL,NULL),(85,'screening',549,'2019-10-28 11:49:51',NULL,NULL),(87,'see',549,'2019-10-28 11:49:51',NULL,NULL),(88,'self harm',549,'2019-10-28 11:49:51',NULL,NULL),(89,'service statements',549,'2019-10-28 11:49:51',NULL,NULL),(90,'show me the assessment for',549,'2019-10-28 11:49:51',NULL,NULL),(91,'show me the plan for',549,'2019-10-28 11:49:51',NULL,NULL),(92,'smartbar',549,'2019-10-28 11:49:51',NULL,NULL),(93,'sms',549,'2019-10-28 11:49:51',NULL,NULL),(94,'social history',549,'2019-10-28 11:49:51',NULL,NULL),(95,'social history free text',549,'2019-10-28 11:49:51',NULL,NULL),(97,'subscription',549,'2019-10-28 11:49:51',NULL,NULL),(98,'substance use',549,'2019-10-28 11:49:51',NULL,NULL),(99,'suggest',549,'2019-10-28 11:49:51',NULL,NULL),(100,'suicide',549,'2019-10-28 11:49:51',NULL,NULL),(101,'supports',549,'2019-10-28 11:49:51',NULL,NULL),(102,'symptoms',549,'2019-10-28 11:49:51',NULL,NULL),(103,'task',549,'2019-10-28 11:49:51',NULL,NULL),(104,'temperature',549,'2019-10-28 11:49:51',NULL,NULL),(105,'two factor authentication',549,'2019-10-28 11:49:51',NULL,NULL),(106,'user preferences',549,'2019-10-28 11:49:51',NULL,NULL),(107,'video conference',549,'2019-10-28 11:49:51',NULL,NULL),(108,'waist circumference',549,'2019-10-28 11:49:51',NULL,NULL),(109,'weight',549,'2019-10-28 11:49:51',NULL,NULL),(110,'recommendations',549,'2019-10-28 11:49:51',NULL,NULL),(111,'reminders',549,'2019-10-28 11:49:51',NULL,NULL),(112,'assessment',549,'2019-11-05 08:17:30',NULL,NULL),(119,'status patient medication',549,'2019-11-05 08:17:30',NULL,NULL),(223,'addend',538,'2019-11-06 09:22:51',NULL,NULL),(224,'address',538,'2019-11-06 09:24:38',NULL,NULL),(225,'Diagnosis Management',538,'2019-11-14 10:01:07',NULL,NULL),(226,'Let doctor be doctor',11564,'2019-11-15 10:01:07',NULL,NULL),(227,'intake coordinator listing',17059,'2019-12-26 09:42:47',NULL,NULL);
/*!40000 ALTER TABLE `featureMaster` ENABLE KEYS */;
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
