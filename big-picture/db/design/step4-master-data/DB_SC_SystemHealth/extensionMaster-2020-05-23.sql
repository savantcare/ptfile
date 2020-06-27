use DB_SC_SystemHealth
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_SystemHealth
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
-- Table structure for table `extensionMaster`
--

DROP TABLE IF EXISTS `extensionMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extensionMaster` (
  `id` int(11) NOT NULL,
  `extensionId` varchar(255) DEFAULT NULL,
  `extensionName` varchar(255) DEFAULT NULL,
  `extensionXML` varchar(255) DEFAULT NULL,
  `currentVersion` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extensionMaster`
--

LOCK TABLES `extensionMaster` WRITE;
/*!40000 ALTER TABLE `extensionMaster` DISABLE KEYS */;
INSERT INTO `extensionMaster` VALUES (1,'hehkbecoaieccbjgfcompobmfidocmgp','Note alert','SCNoteAlertApp.xml','2019.01.30','2019-07-01 00:00:00','2019-07-07 03:22:50'),(4,'moenigakdboiaajmbnplkippbpkphkho','Education tracker','SCEducationTracker.xml','2019.01.29','2019-07-01 00:00:00','2019-07-06 03:22:50'),(5,'jofebpabpobmbakkconhoodnkibmphal','HDR','SCHelpdeskNotifier.xml','2019.06.27','2019-07-01 00:00:00','2019-07-05 03:22:50'),(7,'oklboepianicnenhiaidmalkgilnbeck','Co sign','SCCoSignApp.xml','2018.12.05','2019-07-01 00:00:00','2019-07-05 03:22:50'),(8,'kbnljikoafeihlodeahninmljnbakhjh','Profile','SCProfileApp.xml','2019.06.26','2019-07-01 00:00:00','2019-07-05 03:22:50'),(10,'jhiboimgoaknpehkkimnalbipoilmokn','Task','SCTaskdeskNotifier.xml','2018.08.23','2019-07-01 00:00:00','2019-07-05 03:22:50'),(11,'iikacioplimgeoocggghcmhepkdffppo','Search','SCSearch.xml','2019.06.26','2019-07-01 00:00:00','2019-07-05 03:22:50'),(12,'jlkhbmbodahnbfafbnjabgllgljfncnc','Clear cache','SCCleanCache.xml','2019.07.11','2019-07-01 00:00:00','2019-07-05 03:22:50'),(16,'mgibjojhiamolffenagdkmjlbjjckaoc','Red flag','RedFlagEmergencyNotifier.xml','2019.01.29','2019-07-01 00:00:00','2019-07-05 03:22:50'),(17,'hlgjmmneojonfpbegkgloblkjpkoooid','Custom new tab','custom-new-tab.xml','2019.06.06','2019-07-01 00:00:00','2019-07-05 03:22:50'),(18,'mifiabhchghmmldpoakpdhjahhlaiaci','Scbrain skill video helper','scbrain-skill-video-helper.xml','2019.05.24','2019-07-01 00:00:00','2019-07-05 03:22:50'),(19,'lflbmkjdoipajakpiidocnlcpnelpcpj','Smartbar\r\n','smartbar.xml','2019.07.09','2019-07-01 00:00:00','2019-07-04 03:22:50'),(20,'ckmhfdplfmbmbokodnlphjoeakgpbgjk','Yellow flag','yellow-flag-emergency-notifier.xml','2019.01.29','2019-07-01 00:00:00','2019-07-05 03:22:50'),(21,'ijiiglnpfinibkoifebijhpbhnfhnaha','Activity log','activity-log.xml','2019.05.24','2019-07-01 00:00:00','2019-07-05 03:22:50'),(22,'egfflfljddledilmhlffhomgffainode','Career highlights','career-highlights.xml','2019.05.24','2019-07-01 00:00:00','2019-07-05 03:22:50'),(23,'dpdhbbcnfeljoijaaocehlgogngpobhf','Checking note requirements','checkingnotes.xml','2019.05.25','2019-07-01 00:00:00','2019-07-04 03:22:50'),(24,'pphpiponimipdfjhppmokooonfcoajfa','Two factor authentication (TFA)','tfa.xml','2019.05.24','2019-07-01 00:00:00','2019-07-05 03:22:50'),(25,'piadodjppefiadmginjhknejmehkbkfn','User preferences','user-preferences.xml','2019.07.09','2019-07-01 00:00:00','2019-07-04 03:22:50'),(26,'nldnbcocobamoekjlaeehijjpmigaekn','Care team','careteam.xml','2019.05.24','2019-07-01 00:00:00','2019-07-05 03:22:50'),(27,'hebdmbleogfkepbdeijjhkkeaebhjbnb','Correlate','correlate.xml','2019.05.24','2019-07-01 00:00:00','2019-07-05 03:22:50'),(28,'mnbjfpkjaofhfofajohnihdmlndlmmfl','Onebox','onebox.xml','2019.05.24','2019-07-01 00:00:00','2019-07-05 03:22:50'),(29,'glnbmihngfjkanokieohbnjdgjjmfbic','Screen Recording','screen-recording.xml','2019.06.24','2019-07-01 00:00:00','2019-07-05 03:22:50');
/*!40000 ALTER TABLE `extensionMaster` ENABLE KEYS */;
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
