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
-- Table structure for table `main_employees_summary`
--

DROP TABLE IF EXISTS `main_employees_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_employees_summary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `date_of_leaving` date DEFAULT NULL,
  `reporting_manager` int(11) unsigned DEFAULT NULL,
  `reporting_manager_name` varchar(250) DEFAULT NULL,
  `emp_status_id` int(11) unsigned DEFAULT NULL,
  `emp_status_name` varchar(250) DEFAULT NULL,
  `businessunit_id` int(11) unsigned DEFAULT NULL,
  `businessunit_name` varchar(250) DEFAULT NULL,
  `department_id` int(11) unsigned DEFAULT NULL,
  `department_name` varchar(250) DEFAULT NULL,
  `jobtitle_id` int(11) unsigned DEFAULT NULL,
  `jobtitle_name` varchar(250) DEFAULT NULL,
  `position_id` int(11) unsigned DEFAULT NULL,
  `position_name` varchar(250) DEFAULT NULL,
  `years_exp` varchar(10) DEFAULT NULL,
  `holiday_group` int(11) unsigned DEFAULT NULL,
  `holiday_group_name` varchar(250) DEFAULT NULL,
  `prefix_id` int(11) unsigned DEFAULT NULL,
  `prefix_name` varchar(250) DEFAULT NULL,
  `extension_number` varchar(20) DEFAULT NULL,
  `office_number` varchar(20) DEFAULT NULL,
  `office_faxnumber` varchar(20) DEFAULT NULL,
  `emprole` int(11) unsigned DEFAULT NULL,
  `emprole_name` varchar(250) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `userfullname` varchar(250) DEFAULT NULL,
  `emailaddress` varchar(100) DEFAULT NULL,
  `contactnumber` varchar(20) DEFAULT NULL,
  `backgroundchk_status` enum('In process','Completed','Not Applicable','Yet to start','On hold') DEFAULT NULL,
  `employeeId` varchar(20) DEFAULT NULL,
  `modeofentry` varchar(100) DEFAULT NULL,
  `other_modeofentry` varchar(100) DEFAULT NULL,
  `selecteddate` date DEFAULT NULL,
  `candidatereferredby` int(11) unsigned DEFAULT NULL,
  `referer_name` varchar(250) DEFAULT NULL,
  `profileimg` varchar(250) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `createdby_name` varchar(250) DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(2) unsigned DEFAULT NULL COMMENT '0=inactive,1-Active,2-resigned,3-left,4-suspended,5-deleted,',
  PRIMARY KEY (`id`),
  UNIQUE KEY `un1` (`user_id`),
  KEY `NewIndex1` (`user_id`),
  KEY `NewIndex2` (`reporting_manager`),
  KEY `NewIndex3` (`emp_status_id`),
  KEY `NewIndex4` (`businessunit_id`),
  KEY `NewIndex5` (`department_id`),
  KEY `NewIndex6` (`jobtitle_id`),
  KEY `NewIndex7` (`position_id`),
  KEY `NewIndex8` (`holiday_group`),
  KEY `NewIndex9` (`prefix_id`),
  KEY `NewIndex10` (`emprole`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
