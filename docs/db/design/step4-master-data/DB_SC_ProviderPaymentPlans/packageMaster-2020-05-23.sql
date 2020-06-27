use DB_SC_ProviderPaymentPlans
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_ProviderPaymentPlans
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
-- Table structure for table `packageMaster`
--

DROP TABLE IF EXISTS `packageMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packageMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `packageName` varchar(255) DEFAULT NULL,
  `packageDesc` text,
  `isItLocked` enum('No','Yes') NOT NULL DEFAULT 'No',
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdOnTimeZone` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packageMaster`
--

LOCK TABLES `packageMaster` WRITE;
/*!40000 ALTER TABLE `packageMaster` DISABLE KEYS */;
INSERT INTO `packageMaster` VALUES (1,'Package 1 - 1. 66.67% 2. 60% 3. 60% with $210 p/h cap 4. 60% with $90 follow up appt. cap','','No',11,'2017-04-24 07:21:57','PDT'),(2,'Package 2 - 1. 60% to 2. 60% with $210 cap','','No',8,'2017-04-24 09:08:21','PDT'),(3,'Package 3 - 60% with $180 per hour cap OR $140/hr of AFA Which ever is higher','Why do we pay $180 an hour?\nIn all our research in bay area a psychiatrist makes $250K+$10K in benefits when working 48 weeks * 40 hours a week.\n\nWhen patients are scheduled for 40 hours a week the actual patient hours are close to 36 hours a week due to no shows and cancellations. Collection rate is 95% Hence out of 36 hours a week getting paid for 36*.95 = 34 hours\n\n34 * 48  = 1632 hours\n\n1632 * 180 =  $293,760','No',8,'2017-04-24 09:12:28','PDT'),(4,'Package 4 - 60% with $180 cap with $80/hr of AFA as base pay',NULL,'No',8,'2017-04-24 09:21:03','PDT'),(5,'Package 5 - 60% with $180 cap with $120/Patient hr as base pay','','No',8,'2017-04-24 09:24:22','PDT'),(6,'Package 6 - $70/hr of Billing duration to $70/hr of Calendar block duration to 50% of collections with no cap',NULL,'No',8,'2017-04-24 09:26:41','PDT'),(7,'Package 7 - 60% of amount collected with $180 cap',NULL,'No',8,'2017-04-24 09:31:19','PDT'),(8,'Package 8 - Pay per CPT Code on collection','1) Service Provided - Intake (60 mins or more) \n    Payment - 60% of collections \n    Codes Billed - 99205 or anything else\n\nHow to decide if it is intake?\nIt is 1st appointment.\n\n2) Service Provided - Follow up (at least 16 mins) \n   a) Payment - $100 \n       Codes Billed - 99215 + 90833\n   b) Payment - $90\n       Codes Billed - 99214 + 90833\n    c) Payment - $85\n        Codes Billed - 99213 + 90833\n\nAny service not listed here - 60% of collections.','No',8,'2017-04-24 09:34:05','PDT'),(9,'Package 9 -Package 2 - 1. 60% to 2. 60% with $210 cap to 60% with $90 follow up appt. cap','','No',7,'2017-05-30 21:25:50','PDT'),(10,'Package 10- 60% of collections w/cap of $70/per hour Face to face time.','What is face time?\nPatient informed time from user preferences. If patient informed time is not given then face to face time is calendar block duration.\n\nFor non appointment events like phone encounters or official letters the pay will; be 60% of amount collected with a cap of $70 for the event duration.','No',7,'2017-05-30 21:49:35','PDT'),(11,'Package 11- 60% of collections w/cap of $60/per hour Face to face time.','60% of collection with a cap of $Parameter1/hr for patient informed time','No',8,'2017-07-12 12:00:53','PDT'),(14,'Package TEST- pay per CPT code with 60% cap and AFA base of 70/hr','Pay per CPT code capped at 60% collection for non listed CPT. AFA base pay of 70/H','No',7,'2017-09-14 14:28:26','PDT'),(15,'Package 12 - 50% of amount collected','Pay as per CPT codes to 60% of collection with a cap of 70 to 50% of collection.','No',8,'2017-10-27 14:58:24','PDT'),(16,'Package 13 - 50% of collection (2)','Pay as per CPT codes to 60% of collection with a cap of 70 to 50% of collection.','No',8,'2017-11-01 15:08:33','PDT'),(18,'Package 14 - 50% of amount collected (3)','50% of amount collected per patient face to face hr.','No',8,'2017-11-11 01:23:47','IST'),(19,'Package 15- 1. $79.48 for 90837 and $66.55 for 90834','Payments are to be made at :\n1. $79.48 for 90837\n2. $66.55 for 90834\n3. $0 for anything else.','No',7,'2018-06-04 12:01:09','PDT'),(20,'Package 16 - Appointment with 90837 gets paid $79.48 and 90834 gets paid $66.55. For No show appts $50 for less than 60 mins and $75 for 60 mins or more',NULL,'No',699,'2018-09-26 16:33:57','IST'),(21,'Package 17 - AFA+AFUA >= 120 hrs gets paid $8040 and RVU > 120 gets paid $67/RVU for each RVU > 120','During the probation period the contractor will be available for 120 patient hours and SC shall pay pay to the contractor a monthly salary of $8040. \n\nIf the contractor completes greater than 120 RVUs during any month of the probation period, contractor will be paid an additional $67 per RVU for each RVU above 120 during that month.','No',699,'2019-04-02 15:00:23','Ind'),(22,'Package 18 - AFA+AFUA >= 80 hrs gets paid $8400 and RVU > 80 gets paid $105/RVU for each RVU > 80','During the Probation Period, Contractor will be available for 80 physical hours monthly and Savant Care shall pay to Contractor a monthly salary of $8,400.00 (“Compensation”) pursuant to Savant Care’s normal payroll practices as the same may be modified from time to time by Savant Care. If Contractor completes greater than 80 RVUs during any month of the Probation Period, Contractor will be paid an additional $105 per RVU for each RVU above 80 during that month.','No',699,'2019-04-02 15:09:57','Ind'),(23,'Package 19',NULL,'No',699,'2019-05-06 10:42:43','Ind');
/*!40000 ALTER TABLE `packageMaster` ENABLE KEYS */;
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
