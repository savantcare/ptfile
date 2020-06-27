use DB_SC_Notification
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Notification
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
-- Table structure for table `notifierMasterTemplateSettingsForSms`
--

DROP TABLE IF EXISTS `notifierMasterTemplateSettingsForSms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifierMasterTemplateSettingsForSms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `notifierTypeID` tinyint(4) unsigned DEFAULT NULL COMMENT 'Id of reminderTypes',
  `secondaryIdentifier` varchar(255) NOT NULL DEFAULT 'default',
  `smsBodyTemplate` text NOT NULL,
  `isItLatest` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: old, 1: latest',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifierMasterTemplateSettingsForSms`
--

LOCK TABLES `notifierMasterTemplateSettingsForSms` WRITE;
/*!40000 ALTER TABLE `notifierMasterTemplateSettingsForSms` DISABLE KEYS */;
INSERT INTO `notifierMasterTemplateSettingsForSms` VALUES (1,6,'default','You have appointment with %doctorName% on %eStartTime%. Reply YES to acknowledge this automated message',0),(2,6,'default','You have appointment with %doctorName% on %eStartTime%. Reply YES to acknowledge this automated message.',0),(3,6,'default','You have appointment with %doctorName% on %eStartTime%. Reply YES to acknowledge this automated message.',0),(4,6,'default','You have appointment with %doctorName% on %eStartTime%.',0),(5,6,'default','You have appointment with %doctorName% on %eStartTime% at SavantCare office in %city%.',0),(6,6,'default','You have appointment with %doctorName% on %eStartTime% at SavantCare (%assetCode%) office in %city%.',0),(7,6,'default','You have appointment with %doctorName% on %eStartTime% at SavantCare (%assetCode%) office in %city%. ( %assetCode% )',0),(8,6,'virtualAppointment','%assetCode%',0),(9,6,'default','You have appointment with %doctorName% on %eStartTime% at SavantCare (%assetCode%) office in %city%. \nAsset location is ( %assetCode% )',1),(10,6,'virtualAppointment','This is sms reminder',1),(11,6,'phoneAppointment','This is an SMS notification of Appointment reminder for an Phone appointment',1);
/*!40000 ALTER TABLE `notifierMasterTemplateSettingsForSms` ENABLE KEYS */;
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
