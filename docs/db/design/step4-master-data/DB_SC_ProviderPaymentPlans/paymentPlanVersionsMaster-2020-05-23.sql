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
-- Table structure for table `paymentPlanVersionsMaster`
--

DROP TABLE IF EXISTS `paymentPlanVersionsMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentPlanVersionsMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('Phase 1: Being developed by the programmer','Phase 2: Waiting for approval by finance team','Phase 3: Used to pay the providers') NOT NULL,
  `notes` text,
  `parameter1DefaultValue` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentPlanVersionsMaster`
--

LOCK TABLES `paymentPlanVersionsMaster` WRITE;
/*!40000 ALTER TABLE `paymentPlanVersionsMaster` DISABLE KEYS */;
INSERT INTO `paymentPlanVersionsMaster` VALUES (1,'60% of collection capped at $parameter1 per hour','e.g. 60% of collections capped at $210 per hour\n\n\nCalculation explanation:\n------------------------\nA. In a month If D has AFA of 1 hour. D has 1 appt for 30 mins. The 2nd appt slot is empty. \n\nScenario 1: SC collects $100 for 1st appt. D will get paid $60\n\nScenario 2: SC collects $300 for 1st appt. D will get paid $105\n\nScenario 3: SC collects $400 for 1st appt. D will get paid $105\n\nScenario 4: SC collects $350 for 1st appt. D will get paid $105\n\nB. In a month If D has AFA of 1 hour. D has 2 appt for 30 mins.\nScenario 1: SC collects $300 for 1st appt and $400 for 2nd appt. \nD will get paid: 1st appt: $180 cap: $105 2nd appt: $240 cap: $105. Hence total pay =  $210\n\nScenario 2: SC collects $100 for 1st appt and $300 for 2nd appt. \nD will get paid: 1st appt: $60 cap: $105 2nd appt: $180 cap:105. Hence total pay = $165\n\nScenario 3: SC collects $350 for 1st appt and $0 for 2nd appt. \nD will get paid: 1st appt: $210 cap: $105 2nd appt: $0. Hence total pay = $105.\n\nC. If D has AFA of 1 hour. Has 2 appts for 30 mins. 2nd appt slot patient is no show.\nScenario1: SC collects $200 for appt 1 and $100 for appt 2. D will get paid $105+$60 = $165\nScenario2: SC Collects $100 for 1st appt and nothing for 2nd appt. D will get paid $60.\n\n','Phase 3: Used to pay the providers','The columns in the report will be:\n\ndate | eventid | event duration | 60% of collections / hourly cap\n\ne.g\n\n1st Jan 2017 | 98 | 30 mins | 60% of collections = $180 or Hourly cap = $105 hence payment = 105 ',210.00),(2,'60% of collections capped at $parameter1 for AFA hours','e.g. 60% of collections capped at $210 for monthly AFA hours\n\nCalculation explanation:\n------------------------\nA. In a month If D has AFA of 1 hour. D has 1 appt for 30 mins. The 2nd appt slot is empty. \n\nScenario 1: SC collects $300 for 1st appt. D will get paid $180\n\nScenario 2: SC collects $400 for 1st appt. D will get paid $210\n\nScenario 3: SC collects $350 for 1st appt. D will get paid $210\n\nB. In a month If D has AFA of 1 hour. D has 2 appt for 30 mins.\nScenario 1: SC collects $300 for 1st appt and $400 for 2nd appt. \nD will get paid: 1st appt: $180 2nd appt: $240. Total $420. Cap applied 1hr *210 = 210. Hence total pay =  $210\n\nScenario 2: SC collects $100 for 1st appt and $300 for 2nd appt. \nD will get paid: 1st appt: $60 2nd appt: $180. Total $240. Cap applied 1hr * 210 = 210. Hence total pay = $210\n\nScenario 3: SC collects $350 for 1st appt and $0 for 2nd appt. \nD will get paid: 1st appt: $210 2nd appt: $0. Total $210. Cap applied 1hr *210 = 210. Hence total pay = $210.','Phase 3: Used to pay the providers',NULL,210.00),(3,'$Parameter1 per hour of AFA (Available for appointment)','e.g. $140 per hour of AFA (Available for appointment)','Phase 3: Used to pay the providers',NULL,140.00),(4,'$Parameter1 per hour of calendar block duration for appts where money is collected','e.g. $70 per hour of calendar block duration for appointments where money is collected\n\nCalculation explanation:\n------------------------\nD has 2 events which block the calendar for 1 hour each. \nScenario1: For the 1st event SC collects $10 and for 2nd event SC collects $0\nD will get paid $70','Phase 3: Used to pay the providers',NULL,70.00),(6,'Parameter1% of collection without any cap','e.g. 60% of collections without any cap.','Phase 3: Used to pay the providers',NULL,60.00),(7,'$Parameter1 per hour of billing duration for appts where money is collected.','e.g. $210 per hour of billing duration for appts where money is collected.','Phase 3: Used to pay the providers',NULL,NULL),(8,'60% with $180 per hour cap with $Parameter1/hr of AFA as base pay','e.g. 60% with $180 per hour cap with $140/hr of AFA as base pay','Phase 3: Used to pay the providers',NULL,140.00),(9,'60% with $180 cap with $Parameter1/Patient hr as base pay','e.g. 60% with $180 cap with $120/Patient hr as base pay','Phase 3: Used to pay the providers',NULL,120.00),(10,'Pay as per CPT Codes on collection. Default collection- Parameter1%','Payment plan for Alison, Bowdle and Walker are same -\r\n\r\n1) Service Provided - Intake (60 mins or more) \r\n Payment - 60% of collections \r\n Codes Billed - 99205\r\n\r\n\r\n2) Service Provided - Follow up (at least 16 mins) \r\n a) Payment - $100 \r\n Codes Billed - 99215 + 90833\r\n b) Payment - $90\r\n Codes Billed - 99214 + 90833\r\n c) Payment - $85\r\n Codes Billed - 99213 + 90833\r\n\r\nAny service not listed here - 60% of collections.','Phase 3: Used to pay the providers',NULL,60.00),(11,'60% of amount collected with a cap of $Parameter1 per follow up appointment','e.g. 60% of amount collected with a cap of $90 per follow up appointment. \r\n60% of amount collected per intake appointment','Phase 3: Used to pay the providers',NULL,90.00),(12,'60% of collection with a cap of $Parameter1/hr for patient informed time','e.g. 60% of collection with a cap of $70 for patient informed time. If patient informed time is not given then calendar block duration.','Phase 3: Used to pay the providers',NULL,70.00),(13,'Appointment with 90833 gets paid 60% of collection with a cap of $Parameter1. Everything else gets paid 60% of collection.','Any appt with 90833 gets paid 60% of collection with a cap of $90. Everything else gets paid 60% of collection.','Phase 3: Used to pay the providers','',90.00),(14,'Appointment with 90837 gets paid $79.48 and 90834 gets paid $66.55','Any appointment with 90837 gets paid $79.48 and 90834 gets paid $66.55.\r\nOtherthan this gets paid $0.00','Phase 3: Used to pay the providers',NULL,NULL),(15,'Appointment with 90837 gets paid $79.48 and 90834 gets paid $66.55. For No show appts $50 for less than 60 mins and $75 for 60 mins or more','Any appointment with 90837 gets paid $79.48 and 90834 gets paid $66.55.\r\n\r\nFor No Shows, upon collections, $50 for less than 60 mins appts and $75 for 60 mins or more.','Phase 3: Used to pay the providers',NULL,NULL),(16,'Pay $Parameter1 for every cosign acceptance','Pay $4.50 for every cosign acceptance','Phase 3: Used to pay the providers',NULL,4.50),(17,'Parameter1% of no show/late cancellation collected','40% of no show/late cancellation collected\r\n\r\nIf Event type is \"Appointment\" and status is \"Step 5A: No show\" or \"Step 5C: Late cancellation\" then 40% of collected amount need to pay to doctor\r\n','Phase 3: Used to pay the providers',NULL,40.00),(18,'$Parameter1/hr per RVU on collection','$80/hr per RVU on collection','Phase 3: Used to pay the providers',NULL,80.00),(19,'AFA+AFUA >= 120 hrs gets paid $8040 and RVU > 120 gets paid $67/RVU for each RVU > 120','During the probation period the contractor will be available for 120 patient hours and SC shall pay pay to the contractor a monthly salary of $8040. \r\n\r\nIf the contractor completes greater than 120 RVUs during any month of the probation period, contractor will be paid an additional $67 per RVU for each RVU above 120 during that month. ','Phase 3: Used to pay the providers',NULL,NULL),(20,'AFA+AFUA >= 80 hrs gets paid $8400 and RVU > 80 gets paid $105/RVU for each RVU > 80','During the Probation Period, Contractor will be available for 80 physical hours monthly and Savant Care shall pay to Contractor a monthly salary of $8,400.00 (“Compensation”) pursuant to Savant Care’s normal payroll practices as the same may be modified from time to time by Savant Care. If Contractor completes greater than 80 RVUs during any month of the Probation Period, Contractor will be paid an additional $105 per RVU for each RVU above 80 during that month.','Phase 3: Used to pay the providers',NULL,NULL),(21,'$Parameter1 for per RVU earned','$67 for per RVU earned','Phase 2: Waiting for approval by finance team',NULL,67.00);
/*!40000 ALTER TABLE `paymentPlanVersionsMaster` ENABLE KEYS */;
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
