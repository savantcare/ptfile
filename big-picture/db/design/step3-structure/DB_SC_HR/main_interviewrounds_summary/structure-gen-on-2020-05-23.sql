use DB_SC_HR;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_HR
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
-- Table structure for table `main_interviewrounds_summary`
--

DROP TABLE IF EXISTS `main_interviewrounds_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_interviewrounds_summary` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_id` int(11) unsigned DEFAULT NULL,
  `candidate_id` bigint(20) unsigned DEFAULT NULL,
  `candidate_name` varchar(200) DEFAULT NULL,
  `candidate_status` enum('Shortlisted','Selected','Rejected','On hold','Disqualified','Scheduled','Not Scheduled','Recruited','Requisition Closed/Completed') DEFAULT NULL,
  `interview_status` enum('In process','Completed','On hold','Requisition Closed/Completed') DEFAULT NULL,
  `interview_id` int(11) unsigned DEFAULT NULL,
  `interviewround_id` int(11) unsigned DEFAULT NULL,
  `interviewer_id` bigint(20) unsigned DEFAULT NULL,
  `interviewer_name` varchar(255) DEFAULT NULL,
  `interview_time` time DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_mode` enum('In person','Phone','Video conference') DEFAULT NULL,
  `interview_round_number` int(11) unsigned DEFAULT NULL,
  `interview_round_name` varchar(200) DEFAULT NULL,
  `interview_location` varchar(200) DEFAULT NULL,
  `interview_city_id` int(11) unsigned DEFAULT NULL,
  `interview_state_id` int(11) unsigned DEFAULT NULL,
  `interview_city_name` varchar(255) DEFAULT NULL,
  `interview_state_name` varchar(255) DEFAULT NULL,
  `interview_country_id` int(11) unsigned DEFAULT NULL,
  `interview_country_name` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `created_by_name` varchar(255) DEFAULT NULL,
  `interview_feedback` text,
  `interview_comments` text,
  `round_status` enum('Schedule for next round','Qualified','Selected','Disqualified','Decision pending','On hold','Incompetent','Ineligible','Candidate no show','Requisition Closed/Completed') DEFAULT NULL,
  `modified_by` bigint(20) unsigned DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
