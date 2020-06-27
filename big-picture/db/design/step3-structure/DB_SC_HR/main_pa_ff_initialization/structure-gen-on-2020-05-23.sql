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
-- Table structure for table `main_pa_ff_initialization`
--

DROP TABLE IF EXISTS `main_pa_ff_initialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_ff_initialization` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pa_configured_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Management configuration with module_flag=2',
  `businessunit_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `ff_mode` enum('Quarterly','Half-yearly','Yearly') DEFAULT NULL,
  `ff_period` tinyint(1) unsigned DEFAULT NULL COMMENT '1,2,3,4 for quaterly, 1.2 for half-yearly , 1 for yearly',
  `ff_from_year` int(11) DEFAULT NULL,
  `ff_to_year` int(11) DEFAULT NULL,
  `ff_due_date` date DEFAULT NULL,
  `appraisal_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Latest appraisal Id',
  `employee_name_view` tinyint(1) unsigned DEFAULT NULL COMMENT '0=Hide,1=Show',
  `enable_to` tinyint(1) DEFAULT NULL COMMENT '0=Appraisal Employees,1=All Employees',
  `initialize_status` tinyint(1) unsigned DEFAULT NULL COMMENT '1=initlaize,2=initialize later',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '1=open, 2= close ,Appraisal staus for the particular period',
  `questions` text,
  `qs_privileges` text,
  `isactive` tinyint(1) unsigned DEFAULT NULL COMMENT '1=active,0=inactive',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='initialize feedforward by management';
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
