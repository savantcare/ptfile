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
-- Table structure for table `main_leaverequest_summary`
--

DROP TABLE IF EXISTS `main_leaverequest_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_leaverequest_summary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `leave_req_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  `bunit_id` bigint(20) unsigned DEFAULT NULL,
  `buss_unit_name` varchar(255) DEFAULT NULL,
  `reason` text,
  `approver_comments` text,
  `leavetypeid` int(11) unsigned DEFAULT NULL,
  `leavetype_name` varchar(255) DEFAULT NULL,
  `leaveday` tinyint(1) DEFAULT NULL COMMENT '1-full day,2-half day',
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `leavestatus` enum('Pending for approval','Approved','Rejected','Cancel') DEFAULT 'Pending for approval',
  `rep_mang_id` int(11) unsigned DEFAULT NULL,
  `rep_manager_name` varchar(255) DEFAULT NULL,
  `hr_id` int(11) DEFAULT NULL,
  `hr_name` varchar(255) DEFAULT NULL,
  `no_of_days` float unsigned DEFAULT NULL,
  `appliedleavescount` float(4,1) unsigned DEFAULT NULL,
  `is_sat_holiday` tinyint(1) DEFAULT NULL COMMENT '1-yes,2-no',
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
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
