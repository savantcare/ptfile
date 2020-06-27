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
-- Table structure for table `main_pa_questions_privileges`
--

DROP TABLE IF EXISTS `main_pa_questions_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_questions_privileges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pa_initialization_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Appraisal initialization id for appraisal else feedforward initialization id for feedforward',
  `group_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Null for feedforward else employee id',
  `hr_qs` text COMMENT 'Comma separated question ids created by hr',
  `hr_group_qs_privileges` text COMMENT '{''Q1'':{''Manager Comments'':1,''Employee Comments'':1,''Manager Ratings'':1,''Employee Ratings'':1}}',
  `manager_group_id` bigint(20) unsigned DEFAULT NULL COMMENT 'group id of employees created by manager',
  `manager_qs` text COMMENT 'Comma separeated question ids created by manager',
  `manager_qs_privileges` text COMMENT '{''Q1'':{''Manager Comments'':1,''Employee Comments'':1,''Manager Ratings'':1,''Employee Ratings'':1}}',
  `ff_qs` text COMMENT 'Comma separeated question ids created by management',
  `ff_qs_privileges` text COMMENT '{''Q1'':{''Employee Comments'':1,''Employee Ratings'':1}}',
  `module_flag` tinyint(1) DEFAULT NULL COMMENT '1=Performance appraisals,2=Feedforward',
  `line_manager_1` bigint(20) DEFAULT NULL COMMENT 'Line 1 manager id',
  `line_manager_2` bigint(20) DEFAULT NULL COMMENT 'Line 2 manager id',
  `line_manager_3` bigint(20) DEFAULT NULL COMMENT 'Line 3 manager id',
  `line_manager_4` bigint(20) DEFAULT NULL COMMENT 'Line 4 manager id',
  `line_manager_5` bigint(20) DEFAULT NULL COMMENT 'Line 5 manager id',
  `manager_levels` tinyint(1) unsigned DEFAULT NULL COMMENT 'no.of levels of appraisal',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='Stores the privileges of questions for each employee in json';
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
