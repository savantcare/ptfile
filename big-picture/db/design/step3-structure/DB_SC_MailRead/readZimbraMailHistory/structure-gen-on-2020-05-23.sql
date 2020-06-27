use DB_SC_MailRead;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_MailRead
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
-- Table structure for table `readZimbraMailHistory`
--

DROP TABLE IF EXISTS `readZimbraMailHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `readZimbraMailHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idOfEmailOnMailServer` int(11) DEFAULT NULL,
  `mailMasterID` int(11) DEFAULT NULL,
  `formMailAddress` varchar(255) DEFAULT NULL,
  `fromName` varchar(200) DEFAULT NULL,
  `toMailAddress` varchar(255) DEFAULT NULL,
  `toName` varchar(200) DEFAULT NULL,
  `messageID` varchar(255) DEFAULT NULL,
  `inReplyTo` varchar(255) DEFAULT NULL,
  `mailDateTime` datetime DEFAULT NULL,
  `mailTimeZone` varchar(50) DEFAULT NULL,
  `mailSubject` varchar(255) DEFAULT NULL,
  `mailBody` longtext,
  `mailType` enum('Received','Sent') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mailMasterID` (`mailMasterID`) USING BTREE,
  CONSTRAINT `mailMasterID` FOREIGN KEY (`mailMasterID`) REFERENCES `mailMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
