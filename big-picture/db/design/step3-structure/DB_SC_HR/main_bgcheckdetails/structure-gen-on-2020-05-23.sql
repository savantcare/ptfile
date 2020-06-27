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
-- Table structure for table `main_bgcheckdetails`
--

DROP TABLE IF EXISTS `main_bgcheckdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_bgcheckdetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `specimen_id` int(11) unsigned DEFAULT NULL,
  `flag` tinyint(1) DEFAULT '1' COMMENT '1 - employee, 2- candidate',
  `process_status` enum('In process','On hold','Complete') DEFAULT 'In process',
  `bgagency_id` int(11) unsigned DEFAULT NULL,
  `bgcheck_type` varchar(100) DEFAULT NULL,
  `bgagency_pocid` int(11) unsigned DEFAULT NULL,
  `bgcheck_status` enum('Yet to start','In process','On hold','Complete') DEFAULT 'In process',
  `explanation` text,
  `feedback_file` varchar(50) DEFAULT NULL,
  `feedback_deletedby` int(11) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1' COMMENT '0 - Process deleted, 1 - Active, 2 - Agency deleted',
  `recentlycommentedby` int(11) unsigned DEFAULT NULL,
  `recentlycommenteddate` datetime DEFAULT NULL,
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_bgchecks_summary` AFTER INSERT ON `main_bgcheckdetails` FOR EACH ROW BEGIN
					declare detailid,specimen_id, specimen_name, emp_id, specimen_flag_name, agency_name, 
						screening_type, created_name, modified_name,createdbyname,
						modifiedbyname varchar(250);
					declare	specimen_flag_id,agency_id,screeningtype_id int(11);
					select id,flag,if(flag=1,'Employee','Candidate')
						into detailid,specimen_flag_id,specimen_flag_name
						from main_bgcheckdetails where id = new.id;
					if(specimen_flag_id = 1)then
						select userfullname,id, employeeId into specimen_name,specimen_id,emp_id from main_users where id = new.specimen_id;
					end if;
					if(specimen_flag_id = 2) then
						select candidate_name,id into specimen_name,specimen_id from main_candidatedetails where id = new.specimen_id;
					end if;
					select userfullname into createdbyname from main_users where id = new.createdby;
					select userfullname into modifiedbyname from main_users where id = new.modifiedby;
					select id,agencyname into agency_id,agency_name from main_bgagencylist where id = new.bgagency_id;
					select id,type into screeningtype_id,screening_type from main_bgchecktype where id = new.bgcheck_type;
					
					insert into main_bgchecks_summary 
					(detail_id,specimen_name,specimen_id, specimen_flag,specimen_flag_name,employee_id,screeningtypeid,screeningtype_name,
						agencyid,agencyname,process_status,month_name,year_year,createddate,modifieddate,createdby,createdname,modifiedby,modifiedname,
						isactive,isactive_text)
					values
					(detailid,specimen_name,specimen_id,specimen_flag_id,specimen_flag_name,emp_id,screeningtype_id,screening_type, 
					agency_id,agency_name,new.process_status,month(new.createddate),year(new.createddate),new.createddate,new.modifieddate,new.createdby,createdbyname,new.modifiedby,modifiedbyname,
					new.isactive,
					if(new.isactive = 0,'Process deleted',if(new.isactive = 1,'Active',if(new.isactive = 2,'Agency deleted',if(new.isactive = 3,'Agency User deleted',if(new.isactive = 4,'POC deleted','Active'))))));
					
				    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_bgchecks_aft_update` AFTER UPDATE ON `main_bgcheckdetails` FOR EACH ROW BEGIN
					declare detailid,specimen_id, specimen_name, emp_id, specimen_flag_name, agency_name, 
						screening_type, created_name, modified_name,createdbyname,
						modifiedbyname varchar(250);
					declare	specimen_flag_id,agency_id,screeningtype_id int(11);
					select id,flag,if(flag=1,'Employee','Candidate')
						into detailid,specimen_flag_id,specimen_flag_name
						from main_bgcheckdetails where id = new.id;
					if(specimen_flag_id = 1)then
						select userfullname,id, employeeId into specimen_name,specimen_id,emp_id from main_users where id = new.specimen_id;
					end if;
					if(specimen_flag_id = 2) then
						select candidate_name,id into specimen_name,specimen_id from main_candidatedetails where id = new.specimen_id;
					end if;
					select userfullname into createdbyname from main_users where id = new.createdby;
					select userfullname into modifiedbyname from main_users where id = new.modifiedby;
					select id,agencyname into agency_id,agency_name from main_bgagencylist where id = new.bgagency_id;
					select id,type into screeningtype_id,screening_type from main_bgchecktype where id = new.bgcheck_type;
					UPDATE  main_bgchecks_summary set	
					detail_id = new.id , 
					specimen_name = specimen_name , 
					specimen_id = specimen_id , 
					specimen_flag = specimen_flag_id , 
					specimen_flag_name = specimen_flag_name , 
					employee_id = emp_id , 
					screeningtypeid = screeningtype_id , 
					screeningtype_name = screening_type , 
					agencyid = agency_id , 
					agencyname = agency_name , 
					process_status = new.process_status , 
					modifieddate = new.modifieddate, 
					modifiedby = new.modifiedby , 
					modifiedname = modifiedbyname , 
					isactive = new.isactive , 
					isactive_text = if(new.isactive = 0,'Process deleted',if(new.isactive = 1,'Active',if(new.isactive = 2,'Agency deleted',if(new.isactive = 3,'Agency User deleted',if(new.isactive = 4,'POC deleted','Active')))))
					where
					detail_id = new.id ;
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
