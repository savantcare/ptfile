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
-- Table structure for table `main_sd_requests_summary`
--

DROP TABLE IF EXISTS `main_sd_requests_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_sd_requests_summary` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_for` tinyint(1) DEFAULT '1' COMMENT '1=service request,2=asset request',
  `sd_requests_id` bigint(20) DEFAULT NULL,
  `service_desk_id` bigint(20) unsigned DEFAULT NULL COMMENT 'If request_for equal to 2 then dump asset id from asset table',
  `service_desk_name` varchar(250) DEFAULT NULL COMMENT 'If request_for equal to 2 then dump asset name from asset table',
  `service_desk_conf_id` bigint(20) unsigned DEFAULT NULL,
  `service_request_name` varchar(250) DEFAULT NULL COMMENT 'If request_for equal to 2 then dump asset category from asset table',
  `service_request_id` bigint(20) unsigned DEFAULT NULL COMMENT 'If request_for equal to 2 then dump asset name from asset_categories table',
  `priority` tinyint(1) unsigned DEFAULT NULL COMMENT '1=low,2=medium,3=high',
  `description` varchar(250) DEFAULT NULL,
  `attachment` text,
  `status` varchar(35) DEFAULT NULL,
  `raised_by` bigint(20) unsigned DEFAULT NULL,
  `raised_by_name` varchar(250) DEFAULT NULL,
  `raised_by_empid` varchar(20) DEFAULT NULL,
  `ticket_number` varchar(20) DEFAULT NULL,
  `executor_id` bigint(20) unsigned DEFAULT NULL,
  `executor_name` varchar(250) DEFAULT NULL,
  `executor_comments` varchar(250) DEFAULT NULL,
  `reporting_manager_id` bigint(20) unsigned DEFAULT NULL,
  `reporting_manager_name` varchar(250) DEFAULT NULL,
  `approver_status_1` varchar(30) DEFAULT NULL,
  `approver_status_2` varchar(30) DEFAULT NULL,
  `approver_status_3` varchar(30) DEFAULT NULL,
  `reporting_manager_status` varchar(30) DEFAULT NULL,
  `approver_1` bigint(20) unsigned DEFAULT NULL,
  `approver_1_name` varchar(250) DEFAULT NULL,
  `approver_2` bigint(20) unsigned DEFAULT NULL,
  `approver_2_name` varchar(250) DEFAULT NULL,
  `approver_3` bigint(20) unsigned DEFAULT NULL,
  `approver_1_comments` varchar(250) DEFAULT NULL,
  `approver_2_comments` varchar(250) DEFAULT NULL,
  `approver_3_comments` varchar(250) DEFAULT NULL,
  `reporting_manager_comments` varchar(250) DEFAULT NULL,
  `to_mgmt_comments` varchar(250) DEFAULT NULL,
  `to_manager_comments` varchar(250) DEFAULT NULL,
  `approver_3_name` varchar(250) DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT NULL COMMENT '1= active,0=inactive',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
