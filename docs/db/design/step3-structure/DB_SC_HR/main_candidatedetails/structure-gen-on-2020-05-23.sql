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
-- Table structure for table `main_candidatedetails`
--

DROP TABLE IF EXISTS `main_candidatedetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_candidatedetails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_id` int(11) DEFAULT NULL,
  `candidate_firstname` varchar(50) DEFAULT NULL,
  `candidate_lastname` varchar(50) DEFAULT NULL,
  `candidate_name` varchar(100) NOT NULL,
  `emailid` varchar(70) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `profileimg` varchar(100) DEFAULT NULL,
  `cand_resume` varchar(100) DEFAULT NULL COMMENT 'resume file location',
  `cand_resume_deletedby` int(11) DEFAULT NULL,
  `qualification` varchar(100) NOT NULL,
  `experience` float DEFAULT NULL,
  `skillset` text,
  `education_summary` text,
  `summary` text COMMENT 'instead of resume',
  `cand_status` enum('Shortlisted','Selected','Rejected','On hold','Disqualified','Scheduled','Not Scheduled','Recruited','Requisition Closed/Completed') NOT NULL,
  `backgroundchk_status` enum('In process','Completed','Not Applicable','Yet to start','On hold') DEFAULT 'Yet to start',
  `cand_location` varchar(150) DEFAULT NULL,
  `city` int(11) unsigned DEFAULT NULL,
  `state` int(11) unsigned DEFAULT NULL,
  `country` int(11) unsigned DEFAULT NULL,
  `pincode` varchar(15) DEFAULT NULL,
  `source` enum('Vendor','Website','Referal') DEFAULT NULL,
  `source_val` varchar(150) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_candidates_aft_upd` AFTER UPDATE ON `main_candidatedetails` FOR EACH ROW BEGIN
					if(old.candidate_name != new.candidate_name) then
					begin
					update main_bgchecks_summary set specimen_name = new.candidate_name,modifieddate = utc_timestamp() where specimen_id = new.id and specimen_flag = 2 and isactive = 1;
					update main_interviewrounds_summary set candidate_name = new.candidate_name,modified_date = utc_timestamp() where candidate_id = new.id and isactive = 1;
				        end;
					end if;
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
