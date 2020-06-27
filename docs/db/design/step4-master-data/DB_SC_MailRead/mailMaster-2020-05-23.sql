use DB_SC_MailRead
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
-- Table structure for table `mailMaster`
--

DROP TABLE IF EXISTS `mailMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL,
  `mailAddress` varchar(255) DEFAULT NULL,
  `mailPassword` varchar(255) DEFAULT NULL,
  `passwordStatus` enum('success','wrong') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailMaster`
--

LOCK TABLES `mailMaster` WRITE;
/*!40000 ALTER TABLE `mailMaster` DISABLE KEYS */;
INSERT INTO `mailMaster` VALUES (1,1452,'lorraine.wong2@gmail.com','d29uZzEyMzQ=','wrong'),(2,6335,'springer.paul@outlook.com','cGFzc3dvcmQ=','wrong'),(3,5243,'peter@savantcare.com','UGF1bEAkYw==','wrong'),(4,10518,'gholsonlucy@yahoo.com','MTIzNDU2','wrong'),(5,6729,'michelle@savantcare.com','cGFzczEyNDU=','wrong'),(6,10615,'dwalsh10@aol.com','ZGVubmlzd2Fsc2g=','wrong'),(7,10614,'sephoraf3@gmail.com','MTIzNDU2','wrong'),(8,5268,'sreyaseal91@gmail.com','U2hhcm9uQDE5OTE=','wrong'),(9,10605,'leaaahtraaan@gmail.com','bGVhaHRyYQ==','wrong'),(10,10938,'stevemboyle@gmail.com','MTIzNDU2','wrong'),(11,10995,'wamgriffith@gmail.com','d2hpdG5leTEyMw==','wrong'),(12,6212,'elizabethcoltdesigns@gmail.com','MTIzNDU2','wrong'),(13,9511,'anandkedia86+testdec14@gmail.com','c2FyYWxhMTI=','wrong'),(14,10219,'kamath.anupama@gmail.com','YW51cGFtYTEyMw==','wrong'),(15,9600,'bfahimian@gmail.com','YmVuamFtaW4xMjM=','wrong'),(16,11341,'haw189@ucsd.edu','aGFubmFoMTI=','wrong'),(17,11355,'vineetaa@hotmail.com','dmluZWV0YTEyMjIyMzQ=','wrong'),(18,12274,'rehanamarie@yahoo.com','cmVoYW5hMTIz','wrong'),(19,1901,'ronellebroussard@gmail.com','cm9uZWxsZTEyMw==','wrong'),(20,12477,'stelliott523@gmail.com','c3RlcGVsbGlvdDEyMw==','wrong'),(21,13077,'drmink@gmail.com','OQ==','wrong'),(22,13111,'Miguelverdeberg@gmail.com','MTA=','wrong'),(23,12771,'mattjensema28@aol.com','Mg==','wrong'),(24,3540,'jessicagpullen@gmail.com','MTA=','wrong'),(25,13696,'kathy.m.zhou@gmail.com','MTA=','wrong'),(26,13712,'jadinp@gmail.com','amFkaW4x','wrong'),(27,13661,'karahalios.eleni@gmail.com','MTA=','wrong'),(28,14137,'danielle.novy@gmail.com','MTA=','wrong'),(29,2871,'adrian@savantcare.com','amFpbWFha2FsaTk5','wrong'),(30,13284,'samanthaglovercardenas@gmail.com','OQ==','wrong'),(31,549,'kamlesh@grmtech.com','amFpa2FsaW1h','wrong'),(32,5985,'testdoctor@grmtech.com','amFpa2FsaW1h','wrong'),(33,15448,'sreeparna@grmtech.com','amFpa2FsaW1h','wrong'),(34,19724,'akashdutta@grmtech.com','YWFhYQ==',NULL);
/*!40000 ALTER TABLE `mailMaster` ENABLE KEYS */;
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
