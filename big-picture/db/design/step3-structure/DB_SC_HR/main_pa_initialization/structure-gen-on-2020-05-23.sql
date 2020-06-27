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
-- Table structure for table `main_pa_initialization`
--

DROP TABLE IF EXISTS `main_pa_initialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_initialization` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `pa_configured_id` bigint(20) unsigned DEFAULT NULL COMMENT 'id of main_pa_implementation',
  `businessunit_id` bigint(20) unsigned DEFAULT NULL COMMENT 'id of business unit',
  `department_id` bigint(20) unsigned DEFAULT NULL COMMENT 'id of department else null',
  `enable_step` tinyint(1) unsigned DEFAULT NULL COMMENT '0=No,1=Managers,2=Employees',
  `appraisal_mode` enum('Yearly','Half-yearly','Quarterly') DEFAULT NULL COMMENT 'mode of appraisal',
  `appraisal_period` tinyint(1) unsigned DEFAULT NULL COMMENT '1,2,3,4 for quaterly, 1.2 for half yearly , 1 for yearly',
  `eligibility` varchar(40) DEFAULT NULL COMMENT 'comma separated employment status ids',
  `from_year` int(11) unsigned DEFAULT NULL COMMENT 'financial year -start',
  `to_year` int(11) unsigned DEFAULT NULL COMMENT 'financial year-end',
  `managers_due_date` date DEFAULT NULL COMMENT 'due date for enable to managers',
  `employees_due_date` date DEFAULT NULL COMMENT 'due date for enable to employees',
  `category_id` varchar(250) DEFAULT NULL COMMENT 'comma separated question category ids',
  `initialize_status` tinyint(1) unsigned DEFAULT NULL COMMENT '1=initlaize,2=initialize later',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '1=open, 2= close , 3= Force Close.Appraisal staus for the particular period',
  `pa_group_ids` text COMMENT 'Comma separated group ids',
  `manager_ids` text COMMENT 'Comma separated manager ids,Whenever manager completes initalization his id has to be appended',
  `manager_level_type` tinyint(1) unsigned DEFAULT NULL COMMENT '1=configure l1,2=use reporting mangers',
  `comments` text COMMENT 'To capture hr comments if forceful close of initialization',
  `group_settings` tinyint(1) DEFAULT '0' COMMENT '0=default screen,1= all, 2=groupwise',
  `employee_response` tinyint(1) DEFAULT '1' COMMENT '1-No response,2-Response',
  `appraisal_ratings` tinyint(1) unsigned DEFAULT NULL COMMENT 'same value as from implementation',
  `management_appraisal` tinyint(1) unsigned DEFAULT '0' COMMENT '1=management included,0=no management',
  `isactive` tinyint(1) unsigned DEFAULT NULL COMMENT '0=inactive,1=active',
  `performance_app_flag` tinyint(4) DEFAULT NULL,
  `createdby` bigint(20) unsigned DEFAULT NULL COMMENT 'id of created user',
  `createdby_role` bigint(20) unsigned DEFAULT NULL COMMENT 'role of created user',
  `createdby_group` bigint(20) unsigned DEFAULT NULL COMMENT 'group of created user',
  `modifiedby` bigint(20) unsigned DEFAULT NULL COMMENT 'id of user modified by',
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL COMMENT 'role of user modified by',
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL COMMENT 'group of user modified by',
  `createddate` datetime DEFAULT NULL COMMENT 'created date',
  `modifieddate` datetime DEFAULT NULL COMMENT 'modified date',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='initialize appriasal process';
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
