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
-- Table structure for table `tm_ts_status`
--

DROP TABLE IF EXISTS `tm_ts_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_ts_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` int(10) unsigned NOT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `ts_year` smallint(4) unsigned NOT NULL,
  `ts_month` tinyint(2) unsigned DEFAULT NULL,
  `ts_week` tinyint(1) unsigned DEFAULT NULL,
  `cal_week` tinyint(2) DEFAULT NULL,
  `sun_date` date DEFAULT NULL,
  `sun_project_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `sun_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `sun_status_date` timestamp NULL DEFAULT NULL,
  `sun_reject_note` varchar(200) DEFAULT NULL,
  `mon_date` date DEFAULT NULL,
  `mon_project_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `mon_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `mon_status_date` timestamp NULL DEFAULT NULL,
  `mon_reject_note` varchar(200) DEFAULT NULL,
  `tue_date` date DEFAULT NULL,
  `tue_project_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `tue_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `tue_status_date` timestamp NULL DEFAULT NULL,
  `tue_reject_note` varchar(200) DEFAULT NULL,
  `wed_date` date DEFAULT NULL,
  `wed_project_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `wed_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `wed_status_date` timestamp NULL DEFAULT NULL,
  `wed_reject_note` varchar(200) DEFAULT NULL,
  `thu_date` date DEFAULT NULL,
  `thu_project_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `thu_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `thu_status_date` timestamp NULL DEFAULT NULL,
  `thu_reject_note` varchar(200) DEFAULT NULL,
  `fri_date` date DEFAULT NULL,
  `fri_project_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `fri_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `fri_status_date` timestamp NULL DEFAULT NULL,
  `fri_reject_note` varchar(200) DEFAULT NULL,
  `sat_date` date DEFAULT NULL,
  `sat_project_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `sat_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `sat_status_date` timestamp NULL DEFAULT NULL,
  `sat_reject_note` varchar(200) DEFAULT NULL,
  `week_status` enum('saved','submitted','approved','enabled','rejected','blocked','no_entry') DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_emp_ts_project_status` (`emp_id`,`project_id`,`ts_year`,`ts_month`,`ts_week`,`cal_week`),
  KEY `FK_tm_ts_status_project` (`project_id`),
  CONSTRAINT `FK_tm_ts_status_employee` FOREIGN KEY (`emp_id`) REFERENCES `main_users` (`id`),
  CONSTRAINT `FK_tm_ts_status_project` FOREIGN KEY (`project_id`) REFERENCES `tm_projects` (`id`)
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
