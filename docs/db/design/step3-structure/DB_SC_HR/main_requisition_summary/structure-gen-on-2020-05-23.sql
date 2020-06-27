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
-- Table structure for table `main_requisition_summary`
--

DROP TABLE IF EXISTS `main_requisition_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_requisition_summary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `req_id` int(11) DEFAULT NULL,
  `requisition_code` varchar(20) DEFAULT NULL,
  `onboard_date` date DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `position_name` varchar(200) DEFAULT NULL,
  `reporting_id` bigint(20) unsigned DEFAULT NULL,
  `reporting_manager_name` varchar(200) DEFAULT NULL,
  `businessunit_id` int(11) unsigned DEFAULT NULL,
  `businessunit_name` varchar(200) DEFAULT NULL,
  `department_id` int(11) unsigned DEFAULT NULL,
  `department_name` varchar(200) DEFAULT NULL,
  `jobtitle` int(11) unsigned DEFAULT NULL,
  `jobtitle_name` varchar(200) DEFAULT NULL,
  `req_no_positions` int(11) unsigned DEFAULT NULL,
  `selected_members` int(11) unsigned DEFAULT '0' COMMENT 'count of selected members',
  `filled_positions` int(11) unsigned DEFAULT '0',
  `jobdescription` text,
  `req_skills` text NOT NULL,
  `req_qualification` varchar(150) DEFAULT NULL,
  `req_exp_years` varchar(10) NOT NULL,
  `emp_type` int(11) unsigned DEFAULT NULL,
  `emp_type_name` varchar(200) DEFAULT NULL,
  `req_priority` tinyint(1) unsigned DEFAULT NULL COMMENT '1- High, 2- Medium,3- Low',
  `additional_info` text,
  `req_status` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `approver1` bigint(20) unsigned DEFAULT NULL,
  `approver1_name` varchar(200) DEFAULT NULL,
  `approver2` bigint(20) unsigned DEFAULT NULL,
  `approver2_name` varchar(200) DEFAULT NULL,
  `approver3` bigint(20) unsigned DEFAULT NULL,
  `approver3_name` varchar(200) DEFAULT NULL,
  `appstatus1` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `appstatus2` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `appstatus3` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `recruiters` varchar(150) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT NULL,
  `createdby_name` varchar(200) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `un1` (`requisition_code`),
  KEY `NewIndex1` (`position_id`),
  KEY `reporting` (`reporting_id`),
  KEY `emptype` (`emp_type`),
  KEY `NewIndex2` (`req_id`),
  KEY `NewIndex3` (`businessunit_id`),
  KEY `NewIndex4` (`department_id`),
  KEY `NewIndex5` (`jobtitle`),
  KEY `NewIndex6` (`approver1`),
  KEY `NewIndex7` (`approver2`),
  KEY `NewIndex8` (`approver3`),
  KEY `NewIndex9` (`createdby`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
