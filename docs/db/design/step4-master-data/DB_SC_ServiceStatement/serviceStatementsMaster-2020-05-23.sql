use DB_SC_ServiceStatement
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_ServiceStatement
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
-- Table structure for table `serviceStatementsMaster`
--

DROP TABLE IF EXISTS `serviceStatementsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serviceStatementsMaster` (
  `serviceStatementID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serviceStatement` longtext NOT NULL,
  `createdByUID` int(11) NOT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`serviceStatementID`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviceStatementsMaster`
--

LOCK TABLES `serviceStatementsMaster` WRITE;
/*!40000 ALTER TABLE `serviceStatementsMaster` DISABLE KEYS */;
INSERT INTO `serviceStatementsMaster` VALUES (1,'The risks, benefits and side effects of psychotropic medications have been discussed with the patient.',11,'2016-05-16 00:00:00','PST'),(12,'Spent greater than 50 % of time face to face with patient and/or family doing counselling and/or coordination of care.',440,NULL,''),(21,'14-Point Review of Systems: I performed a complete review of systems. All are negative except as documented elsewhere.',10,NULL,''),(23,'I provided 53 minutes or more of individual psychotherapy, using behaviour modification, motivational interviewing, and/or a supportive techniques.',10,NULL,''),(24,'I provided 16 minutes or more of individual psychotherapy, using behaviour modification, motivational interviewing, and/or a supportive techniques.',10,NULL,''),(25,'I provided 38 minutes or more of individual psychotherapy, using behaviour modification, motivational interviewing, and/or a supportive techniques.',10,NULL,''),(26,'Patient educated about and provided input into the treatment plan. Patient understands potential risks and benefits of the proposed treatment and agrees to the plan.',10,NULL,''),(27,'Further data and history obtained from family member as per patient’s consent.',10,NULL,''),(28,'Further data and history obtained from other health provider as per patient’s consent.',10,NULL,''),(29,'Pertinent Medical Records, Labs, and Diagnostic Tests Reviewed',10,NULL,''),(30,'Patient is deemed low risk.',10,NULL,''),(31,'Patient is deemed moderate risk.',10,NULL,''),(32,'Patient is deemed high risk.',10,NULL,''),(33,'Status is improving.',10,NULL,''),(34,'Status is worsening.',10,NULL,''),(35,'Status is stable.',10,NULL,''),(36,'Had client begin to reframe and challenge negative self-talk.',2323,NULL,''),(38,'Establishing a Therapeutic Alliance- developed a strong therapeutic alliance support treatment being joint and therefore more effectively, planned and implemented. Tailored communication style to the patient\'s needs and capacities, explaining symptoms in ',1937,NULL,''),(41,'Explained to patient that some antidepressants may cause more side effects than others and you may need to try several different antidepressant medications before finding the one that helps. Educated patient on the most common side effects listed by the F',11,NULL,''),(42,'Went over suicide safety plan with patient. In case nothing helps patient will call 911 or walk in to nearest Emergency.',11,NULL,''),(43,'Discussed risks-benefits and side effects of medication(s) above. All the common and serious side effects were explained to patient. Discussed rationale for current treatment plan.',11,NULL,''),(44,'Discussed risks of Antipsychotics including but not limited to metabolic syndrome and tardive dyskinesia.',11,NULL,''),(45,'Discussed black box warning for Antipsychotics in patients with Dementia.',11,NULL,''),(46,'Discussed black box warning with Antidepressants in patients below age of 26.',11,NULL,''),(47,'Discussed addiction potential of above medication. Educated patient to report any misuse or abuse. Strictly instructed to take as prescribed and report any unexpected effects immediately.',11,NULL,''),(50,'CBT- had client identify beliefs, emotions, and behaviors initiating their symptoms and develop more adaptive responses.',1937,NULL,''),(55,'Pt stats checked',1599,'2017-05-04 13:39:31','PDT'),(56,'All vitals checked',1599,'2017-05-12 14:13:00','PDT'),(57,'CURES: CA state controlled substance patient registry was checked on this patient and reviewed',4181,'2017-06-21 13:13:41','PDT'),(61,'TEST FOR JB',6005,'2017-07-28 13:14:51','CDT'),(62,'I counseled patient extensively on sleep hygiene, including consistent bedtime and wake up time, minimizing screen time/exercise/food intake before bed, etc.',10,'2017-12-12 18:31:21','PST'),(63,'testForConflicts',5842,'2018-01-03 16:51:50','IST'),(65,'onlyForTest',5842,'2018-01-03 21:30:06','PST'),(66,'test',5842,'2018-01-03 21:41:52','PST'),(69,'this is a test service statement for demo',1050,'2018-04-18 20:00:41','PDT'),(70,'Discussed risks, benefits and side effects of medications with both parents and patient in detail and consent obtained from both parents and patient.',1050,'2018-04-18 20:21:11','PDT'),(71,'At this time, patient is not at imminent risk of harm to self or others and can be maintained at an outpatient level of care.',5239,'2018-04-18 20:55:14','PDT'),(72,'Discuss safety, to go to the ER, call the clinic or 911 if there is any sense of danger to self or others.',5239,'2018-04-18 20:55:32','PDT'),(73,'Discussed safety regards to guns, medications and sharps',5239,'2018-04-27 18:17:15','PDT'),(74,'Risks, benefits and the side effects of the medications discussed with patient and consent for treatment obtained',10607,'2018-05-21 13:39:12','PDT'),(75,'This patient was made aware, that Savantcare does not provide after-hours, weekend or holiday on-call coverage for psychiatric emergencies. If an urgent or emergent psychiatric or medical concern comes up when we are not open, the patient was made aware to seek assistance from the closest emergency room, their primary care physician, or call 911',10607,'2018-05-29 15:54:54','PDT'),(76,'The patient is not at acute risk of harm to self or others at this time and can be maintained at an outpatient level of care',10607,'2018-06-29 09:58:51','Pacific Daylight Time'),(77,'Discussed safety, to go to the ER, call the clinic or 911 if there is any sense of danger to self or others',606,'2018-07-24 08:46:13','PDT');
/*!40000 ALTER TABLE `serviceStatementsMaster` ENABLE KEYS */;
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
