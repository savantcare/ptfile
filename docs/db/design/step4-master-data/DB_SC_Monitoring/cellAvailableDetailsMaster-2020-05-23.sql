use DB_SC_Monitoring
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Monitoring
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
-- Table structure for table `cellAvailableDetailsMaster`
--

DROP TABLE IF EXISTS `cellAvailableDetailsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cellAvailableDetailsMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drugName` varchar(255) NOT NULL,
  `frequencyID` int(11) NOT NULL,
  `conditionID` int(11) NOT NULL,
  `isAvailable` tinyint(1) NOT NULL DEFAULT '0',
  `lastUpdatedBy` int(11) NOT NULL,
  `lastUpdatedOn` datetime NOT NULL,
  `lastUpdatedOnTimeZone` char(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cellAvailableDetailsMaster`
--

LOCK TABLES `cellAvailableDetailsMaster` WRITE;
/*!40000 ALTER TABLE `cellAvailableDetailsMaster` DISABLE KEYS */;
INSERT INTO `cellAvailableDetailsMaster` VALUES (1,'valproic acid',2,1,1,699,'2018-08-20 10:20:05','IST'),(2,'valproic acid',2,9,1,699,'2018-08-20 10:20:07','IST'),(3,'valproic acid',3,9,1,699,'2018-08-20 10:20:12','IST'),(4,'valproic acid',4,9,0,699,'2018-08-20 10:21:38','IST'),(5,'valproic acid',4,1,1,699,'2018-08-20 10:21:28','IST'),(6,'valproic acid',7,1,1,699,'2018-08-20 10:21:30','IST'),(7,'valproic acid',6,9,1,699,'2018-08-20 10:21:39','IST'),(8,'valproic acid',4,10,1,699,'2018-08-20 10:21:46','IST'),(9,'valproic acid',2,11,1,699,'2018-08-20 10:21:54','IST'),(10,'valproic acid',2,12,1,699,'2018-08-20 10:22:05','IST'),(11,'valproic acid',3,12,1,699,'2018-08-20 10:22:09','IST'),(12,'valproic acid',6,12,1,699,'2018-08-20 10:22:11','IST'),(13,'valproic acid',2,13,1,699,'2018-08-20 10:22:19','IST'),(14,'valproic acid',4,13,1,699,'2018-08-20 10:22:21','IST'),(15,'valproic acid',2,14,1,699,'2018-08-20 10:22:26','IST'),(16,'valproic acid',2,15,1,699,'2018-08-20 10:22:27','IST'),(17,'valproic acid',2,16,1,699,'2018-08-20 10:22:28','IST'),(18,'valproic acid',8,16,1,699,'2018-08-20 10:22:33','IST'),(19,'lamotrigine',19,17,1,699,'2018-08-20 10:24:38','IST'),(20,'lamotrigine',22,18,1,699,'2018-08-20 10:24:39','IST'),(21,'lithium carbonate',38,32,1,699,'2018-08-20 10:29:05','IST'),(22,'lithium carbonate',33,23,1,699,'2018-08-20 10:29:09','IST'),(23,'lithium carbonate',33,24,1,699,'2018-08-20 10:29:09','IST'),(24,'lithium carbonate',33,25,0,699,'2018-10-02 19:17:30','IST'),(25,'lithium carbonate',33,26,1,699,'2018-08-20 10:29:11','IST'),(26,'lithium carbonate',33,27,1,699,'2018-08-20 10:29:12','IST'),(27,'lithium carbonate',33,28,1,699,'2018-08-20 10:29:12','IST'),(28,'lithium carbonate',33,29,1,699,'2018-08-20 10:29:13','IST'),(29,'lithium carbonate',33,30,1,699,'2018-08-20 10:29:14','IST'),(30,'lithium carbonate',33,31,1,699,'2018-08-20 10:29:15','IST'),(31,'lithium carbonate',34,23,1,699,'2018-08-20 10:29:22','IST'),(32,'lithium carbonate',36,23,1,699,'2018-08-20 10:29:23','IST'),(33,'lithium carbonate',34,24,1,699,'2018-08-20 10:29:29','IST'),(34,'lithium carbonate',36,24,1,699,'2018-08-20 10:29:30','IST'),(35,'lithium carbonate',34,25,1,699,'2018-08-22 11:44:10','IST'),(36,'lithium carbonate',35,25,1,699,'2018-08-20 10:29:41','IST'),(37,'lithium carbonate',34,26,1,699,'2018-08-20 10:29:46','IST'),(38,'lithium carbonate',35,26,1,699,'2018-08-20 10:29:47','IST'),(39,'lithium carbonate',34,27,1,699,'2018-08-20 10:29:48','IST'),(40,'lithium carbonate',35,27,1,699,'2018-08-20 10:29:49','IST'),(41,'lithium carbonate',36,30,1,699,'2018-08-20 10:29:59','IST'),(42,'lithium carbonate',37,25,1,699,'2018-08-20 10:30:08','IST'),(43,'lithium carbonate',37,26,1,699,'2018-08-20 10:30:08','IST'),(44,'lithium carbonate',37,27,1,699,'2018-08-20 10:30:10','IST'),(45,'lithium aspartate',49,39,1,699,'2018-08-20 10:33:07','IST'),(46,'lithium aspartate',50,39,1,699,'2018-08-20 10:33:08','IST'),(47,'lithium aspartate',52,39,1,699,'2018-08-20 10:33:12','IST'),(48,'lithium aspartate',52,40,1,699,'2018-08-20 10:33:13','IST'),(49,'lithium aspartate',50,40,1,699,'2018-08-20 10:33:15','IST'),(50,'lithium aspartate',49,40,1,699,'2018-08-20 10:33:16','IST'),(51,'lithium aspartate',49,41,1,699,'2018-08-20 10:33:17','IST'),(52,'lithium aspartate',50,41,1,699,'2018-08-20 10:33:18','IST'),(53,'lithium aspartate',51,41,1,699,'2018-08-20 10:33:19','IST'),(54,'lithium aspartate',53,41,1,699,'2018-08-20 10:33:20','IST'),(55,'lithium aspartate',49,42,1,699,'2018-08-20 10:33:21','IST'),(56,'lithium aspartate',50,42,1,699,'2018-08-20 10:33:24','IST'),(57,'lithium aspartate',51,42,1,699,'2018-08-20 10:33:25','IST'),(58,'lithium aspartate',53,42,1,699,'2018-08-20 10:33:25','IST'),(59,'lithium aspartate',49,43,1,699,'2018-08-20 10:33:26','IST'),(60,'lithium aspartate',50,43,1,699,'2018-08-20 10:33:27','IST'),(61,'lithium aspartate',51,43,1,699,'2018-08-20 10:33:27','IST'),(62,'lithium aspartate',53,43,1,699,'2018-08-20 10:33:28','IST'),(63,'lithium aspartate',49,44,1,699,'2018-08-20 10:33:49','IST'),(64,'lithium aspartate',49,45,1,699,'2018-08-20 10:33:51','IST'),(65,'lithium aspartate',49,46,1,699,'2018-08-20 10:33:55','IST'),(66,'lithium aspartate',52,46,1,699,'2018-08-20 10:33:57','IST'),(67,'lithium aspartate',49,47,1,699,'2018-08-20 10:34:00','IST'),(68,'lithium aspartate',54,48,1,699,'2018-08-20 10:34:02','IST'),(69,'lithium citrate',70,64,1,699,'2018-08-20 10:36:49','IST'),(70,'lithium citrate',65,63,1,699,'2018-08-20 10:36:50','IST'),(71,'lithium citrate',65,62,1,699,'2018-08-20 10:36:53','IST'),(72,'lithium citrate',68,62,1,699,'2018-08-20 10:36:54','IST'),(73,'lithium citrate',65,61,1,699,'2018-08-20 10:36:58','IST'),(74,'lithium citrate',65,60,1,699,'2018-08-20 10:36:59','IST'),(75,'lithium citrate',65,59,1,699,'2018-08-20 10:37:02','IST'),(76,'lithium citrate',66,59,1,699,'2018-08-20 10:37:03','IST'),(77,'lithium citrate',68,59,0,699,'2018-08-20 10:37:11','IST'),(78,'lithium citrate',65,58,1,699,'2018-08-20 10:37:09','IST'),(79,'lithium citrate',67,59,1,699,'2018-08-20 10:37:10','IST'),(80,'lithium citrate',69,59,1,699,'2018-08-20 10:37:12','IST'),(81,'lithium citrate',69,58,1,699,'2018-08-20 10:37:12','IST'),(82,'lithium citrate',69,57,1,699,'2018-08-20 10:37:13','IST'),(83,'lithium citrate',67,58,1,699,'2018-08-20 10:37:14','IST'),(84,'lithium citrate',67,57,1,699,'2018-08-20 10:37:14','IST'),(85,'lithium citrate',66,58,1,699,'2018-08-20 10:37:16','IST'),(86,'lithium citrate',66,57,1,699,'2018-08-20 10:37:16','IST'),(87,'lithium citrate',65,57,1,699,'2018-08-20 10:37:17','IST'),(88,'lithium citrate',65,56,1,699,'2018-08-20 10:37:22','IST'),(89,'lithium citrate',66,56,1,699,'2018-08-20 10:37:22','IST'),(90,'lithium citrate',68,56,1,699,'2018-08-20 10:37:23','IST'),(91,'lithium citrate',68,55,1,699,'2018-08-20 10:37:24','IST'),(92,'lithium citrate',66,55,1,699,'2018-08-20 10:37:24','IST'),(93,'lithium citrate',65,55,1,699,'2018-08-20 10:37:25','IST'),(94,'lexapro',71,72,1,699,'2018-08-23 08:14:16','IST'),(95,'lexapro',73,75,1,699,'2018-10-02 19:13:18','IST'),(96,'lexapro',74,76,1,699,'2018-09-21 18:49:34','IST'),(97,'lithium citrate',65,64,0,699,'2018-10-02 19:16:42','IST'),(98,'diazepam',78,77,1,10,'2018-10-03 07:09:41','IST'),(99,'diazepam',79,77,1,10,'2018-10-03 07:09:42','IST'),(100,'latuda',81,80,1,10,'2018-10-10 07:38:18','IST'),(101,'accu-chek active test strip',94,82,1,699,'2018-11-01 12:48:51','IST'),(102,'accu-chek active test strip',94,83,1,699,'2018-11-14 15:18:08','IST'),(103,'accu-chek active test strip',94,84,1,699,'2018-11-15 18:21:46','IST'),(104,'accu-chek active test strip',94,86,1,699,'2018-11-15 18:21:47','IST'),(105,'accu-chek active test strip',94,85,1,699,'2018-11-15 18:21:47','IST'),(106,'accu-chek active test strip',94,87,1,699,'2018-11-15 18:21:48','IST'),(107,'accu-chek active test strip',94,88,1,699,'2018-11-15 18:21:49','IST'),(108,'accu-chek active test strip',94,89,1,699,'2018-11-15 18:21:50','IST'),(109,'accu-chek active test strip',94,90,1,699,'2018-11-15 18:21:50','IST'),(110,'accu-chek active test strip',94,91,1,699,'2018-11-15 18:21:51','IST'),(111,'accu-chek active test strip',94,92,1,699,'2018-11-15 18:21:53','IST'),(112,'accu-chek active test strip',94,93,1,699,'2018-11-01 12:48:58','IST'),(113,'accu-chek active test strip',95,82,1,699,'2018-11-01 12:49:08','IST'),(114,'accu-chek active test strip',95,84,1,699,'2018-11-12 12:36:24','IST'),(115,'accu-chek active test strip',95,86,1,699,'2018-11-01 12:49:12','IST'),(116,'accu-chek active test strip',95,93,1,699,'2018-11-01 12:49:14','IST'),(117,'accu-chek active test strip',95,90,1,699,'2018-11-01 12:49:16','IST'),(118,'accu-chek active test strip',96,84,1,699,'2018-11-01 12:49:25','IST'),(119,'accu-chek active test strip',96,88,1,699,'2018-11-01 12:49:30','IST'),(120,'accu-chek active test strip',96,92,1,699,'2018-11-01 12:49:35','IST'),(121,'accu-chek active test strip',95,83,1,699,'2018-11-12 12:36:23','IST'),(122,'accu-chek active test strip',95,85,1,699,'2018-11-12 12:36:25','IST'),(123,'accu-chek active test strip',95,87,1,699,'2018-11-12 12:36:26','IST'),(124,'accu-chek active test strip',95,88,1,699,'2018-11-12 12:36:26','IST'),(125,'accu-chek active test strip',95,89,1,699,'2018-11-12 12:36:27','IST'),(126,'accu-chek active test strip',95,91,1,699,'2018-11-12 12:36:28','IST'),(127,'accu-chek active test strip',95,92,1,699,'2018-11-12 12:36:28','IST'),(128,'accu-chek active test strip',96,82,1,699,'2018-11-12 15:46:15','IST'),(129,'lexapro',100,98,1,699,'2018-12-10 14:29:38','IST'),(130,'lexapro',100,99,1,699,'2018-12-10 14:29:38','IST'),(131,'lexapro',101,98,1,699,'2018-12-10 14:29:40','IST'),(132,'ana-lex',104,102,0,549,'2018-12-18 17:45:27','Pac'),(133,'ana-lex',104,103,0,549,'2018-12-18 17:45:28','Pac'),(134,'diazepam',79,106,1,549,'2019-02-05 18:09:52','Pac'),(135,'diazepam',107,106,1,549,'2019-02-05 18:10:42','Pac'),(136,'diazepam',79,108,1,549,'2019-02-07 02:46:24','Pac'),(137,'lexapro',100,109,1,699,'2019-02-07 16:58:41','IST'),(138,'lexapro',101,109,1,699,'2019-02-07 16:58:42','IST');
/*!40000 ALTER TABLE `cellAvailableDetailsMaster` ENABLE KEYS */;
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
