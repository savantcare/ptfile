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
-- Table structure for table `main_requisition`
--

DROP TABLE IF EXISTS `main_requisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_requisition` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `requisition_code` varchar(20) DEFAULT NULL,
  `onboard_date` date DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `reporting_id` bigint(20) unsigned DEFAULT NULL,
  `businessunit_id` int(11) unsigned DEFAULT NULL,
  `department_id` int(11) unsigned DEFAULT NULL,
  `jobtitle` int(11) unsigned DEFAULT NULL,
  `req_no_positions` int(11) unsigned DEFAULT NULL,
  `selected_members` int(11) unsigned DEFAULT '0' COMMENT 'count of selected members',
  `filled_positions` int(11) unsigned DEFAULT '0',
  `jobdescription` text,
  `req_skills` text NOT NULL,
  `req_qualification` varchar(150) DEFAULT NULL,
  `req_exp_years` varchar(10) NOT NULL,
  `emp_type` int(11) unsigned DEFAULT NULL,
  `req_priority` tinyint(1) unsigned DEFAULT NULL COMMENT '1- High, 2- Medium,3- Low',
  `additional_info` text,
  `req_status` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `approver1` bigint(20) unsigned DEFAULT NULL,
  `approver2` bigint(20) unsigned DEFAULT NULL,
  `approver3` bigint(20) unsigned DEFAULT NULL,
  `appstatus1` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `appstatus2` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `appstatus3` enum('Initiated','Approved','Rejected','Closed','On hold','Complete','In process') DEFAULT NULL,
  `recruiters` varchar(150) DEFAULT NULL,
  `client_id` int(10) DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `un1` (`requisition_code`),
  KEY `NewIndex1` (`position_id`),
  KEY `reporting` (`reporting_id`),
  KEY `emptype` (`emp_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_requisition_aft_ins` AFTER INSERT ON `main_requisition` 
					FOR EACH ROW BEGIN
						DECLARE pos_name,rep_name,bunit_name,dept_name,job_name,empt_name,app1_name,app2_name,app3_name,createdbyname VARCHAR(200);
						SELECT positionname INTO pos_name FROM main_positions WHERE id = new.position_id;
						SELECT userfullname INTO rep_name FROM main_users WHERE id = new.reporting_id;
						SELECT userfullname INTO app1_name FROM main_users WHERE id = new.approver1;
						SELECT userfullname INTO createdbyname FROM main_users WHERE id = new.createdby;
						SET app2_name = NULL;
						SET app3_name = NULL;
						IF new.approver2 IS NOT NULL THEN 
						SELECT userfullname INTO app2_name FROM main_users WHERE id = new.approver2;
						END IF;
						
						IF new.approver3 IS NOT NULL THEN 
						SELECT userfullname INTO app3_name FROM main_users WHERE id = new.approver3;
						END IF;
						SELECT unitname INTO bunit_name FROM main_businessunits WHERE id = new.businessunit_id;
						SELECT deptname INTO dept_name FROM main_departments WHERE id = new.department_id;
						SELECT jobtitlename INTO job_name FROM main_jobtitles WHERE id = new.jobtitle;
						SELECT te.employemnt_status INTO empt_name FROM main_employmentstatus em 
					   INNER JOIN tbl_employmentstatus te ON te.id = em.workcodename WHERE em.id = new.emp_type;
						INSERT INTO main_requisition_summary 
						(req_id, requisition_code, onboard_date, position_id, position_name, reporting_id, reporting_manager_name,businessunit_id, businessunit_name, department_id, department_name, jobtitle, jobtitle_name,req_no_positions, selected_members, filled_positions, jobdescription, req_skills, req_qualification,req_exp_years,emp_type, emp_type_name, req_priority, additional_info, req_status, approver1, approver1_name,approver2, approver2_name, approver3, approver3_name, appstatus1, appstatus2, appstatus3,recruiters,client_id, isactive,createdby, modifiedby,createdon, modifiedon,createdby_name
						)
						VALUES
						(new.id, 
						 
						new.requisition_code, 
						new.onboard_date, 
						new.position_id, 
						pos_name, 
						new.reporting_id, 
						rep_name, 
						new.businessunit_id, 
						bunit_name, 
						new.department_id, 
						dept_name, 
						new.jobtitle, 
						job_name, 
						new.req_no_positions, 
						new.selected_members, 
						new.filled_positions, 
						new.jobdescription, 
						new.req_skills, 
						new.req_qualification, 
						new.req_exp_years, 
						new.emp_type, 
						empt_name, 
						new.req_priority, 
						new.additional_info, 
						new.req_status, 
						new.approver1, 
						app1_name, 
						new.approver2, 
						app2_name, 
						new.approver3, 
						app3_name, 
						new.appstatus1, 
						new.appstatus2, 
						new.appstatus3, 
						new.recruiters,
						new.client_id,
						new.isactive, 
						new.createdby, 
						new.modifiedby, 
						new.createdon, 
						new.modifiedon,createdbyname
						);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_requisition_aft_upd` AFTER UPDATE ON `main_requisition` 
					FOR EACH ROW BEGIN
					DECLARE pos_name,rep_name,bunit_name,dept_name,job_name,empt_name,app1_name,app2_name,app3_name VARCHAR(200);
					SELECT positionname INTO pos_name FROM main_positions WHERE id = new.position_id;
					SELECT userfullname INTO rep_name FROM main_users WHERE id = new.reporting_id;
					SELECT userfullname INTO app1_name FROM main_users WHERE id = new.approver1;
					SET app2_name = NULL;
					SET app3_name = NULL;
					IF new.approver2 IS NOT NULL THEN 
						SELECT userfullname INTO app2_name FROM main_users WHERE id = new.approver2;
						END IF;
					
					IF new.approver3 IS NOT NULL THEN 
						SELECT userfullname INTO app3_name FROM main_users WHERE id = new.approver3;
						END IF;
					SELECT unitname INTO bunit_name FROM main_businessunits WHERE id = new.businessunit_id;
					SELECT deptname INTO dept_name FROM main_departments WHERE id = new.department_id;
					SELECT jobtitlename INTO job_name FROM main_jobtitles WHERE id = new.jobtitle;
					SELECT te.employemnt_status INTO empt_name FROM main_employmentstatus em 
					   INNER JOIN tbl_employmentstatus te ON te.id = em.workcodename WHERE em.id = new.emp_type;
					UPDATE main_requisition_summary SET
					 requisition_code = new.requisition_code,onboard_date = new.onboard_date, position_id = new.position_id, position_name = pos_name, 
					 reporting_id = new.reporting_id, reporting_manager_name = rep_name , 
					businessunit_id = new.businessunit_id, businessunit_name = bunit_name, 
					department_id = new.department_id, department_name = dept_name, 
					jobtitle = new.jobtitle, jobtitle_name = job_name,	req_no_positions = new.req_no_positions, 
					selected_members = new.selected_members, filled_positions = new.filled_positions, 
					jobdescription = new.jobdescription, req_skills = new.req_skills, req_qualification = new.req_qualification, 
					req_exp_years = new.req_exp_years, 	emp_type = new.emp_type, emp_type_name = empt_name, 
					req_priority = new.req_priority, additional_info = new.additional_info, req_status = new.req_status,
					 approver1 = new.approver1, approver1_name = app1_name,	approver2 = new.approver2, 
					 approver2_name = app2_name, approver3 = new.approver3, approver3_name = app3_name, 
					 appstatus1 = new.appstatus1, appstatus2 = new.appstatus2, appstatus3 = new.appstatus3,recruiters=new.recruiters,client_id=new.client_id, 
					 modifiedby = new.modifiedby, 	modifiedon = new.modifiedon,isactive = new.isactive WHERE req_id = new.id ;
					 
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
