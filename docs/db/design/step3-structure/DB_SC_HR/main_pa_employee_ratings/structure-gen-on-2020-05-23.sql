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
-- Table structure for table `main_pa_employee_ratings`
--

DROP TABLE IF EXISTS `main_pa_employee_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_pa_employee_ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pa_initialization_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `employee_response` text COMMENT '{''Q1'':{''Comment'':''good'',''Rating'':''rating_id''},''Q2'':{''Comment'':''excellent'',''Rating'':''rating_id''}}',
  `manager_response` text COMMENT '{''Q1'':{''Comment'':''good'',''Rating'':''rating_id''},''Q2'':{''Comment'':''excellent'',''Rating'':''rating_id''}}',
  `skill_response` text COMMENT '{''skill_id'':''rating_id''}',
  `line_manager_1` bigint(20) DEFAULT NULL,
  `line_manager_2` bigint(20) DEFAULT NULL,
  `line_manager_3` bigint(20) DEFAULT NULL,
  `line_manager_4` bigint(20) DEFAULT NULL,
  `line_manager_5` bigint(20) DEFAULT NULL,
  `line_comment_1` text COMMENT '{''rating_id'':''comment''}',
  `line_comment_2` text COMMENT '{''rating_id'':''comment''}',
  `line_comment_3` text COMMENT '{''rating_id'':''comment''}',
  `line_comment_4` text,
  `line_comment_5` text,
  `line_rating_1` int(11) unsigned DEFAULT NULL,
  `line_rating_2` int(11) unsigned DEFAULT NULL,
  `line_rating_3` int(11) unsigned DEFAULT NULL,
  `line_rating_4` int(11) DEFAULT NULL,
  `line_rating_5` int(11) DEFAULT NULL,
  `consolidated_rating` float(10,2) DEFAULT NULL COMMENT 'Consolidated rating.Need to be updated after each manager rating.',
  `appraisal_status` enum('Pending employee ratings','Pending L1 ratings','Pending L2 ratings','Pending L3 ratings','Pending L4 ratings','Pending L5 ratings','Completed') DEFAULT 'Pending employee ratings' COMMENT '1=Pending employee ratings,2=Pending L1 ratings,3=Pending L2 ratings,4=Pending L3 ratings,5=Pending L4 ratings,6=Pending L5 ratings,7=Completed,',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `createdby_role` bigint(20) unsigned DEFAULT NULL,
  `createdby_group` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_role` bigint(20) unsigned DEFAULT NULL,
  `modifiedby_group` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `NewIndex1` (`pa_initialization_id`),
  KEY `NewIndex2` (`employee_id`),
  CONSTRAINT `FK_main_pa_employee_ratings` FOREIGN KEY (`pa_initialization_id`) REFERENCES `main_pa_initialization` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='Employee appraisal response is stored in this table';
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
