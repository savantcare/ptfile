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
-- Table structure for table `main_sd_requests`
--

DROP TABLE IF EXISTS `main_sd_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_sd_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `request_for` tinyint(1) DEFAULT '1' COMMENT '1=service request, 2= asset request',
  `service_desk_id` bigint(20) unsigned DEFAULT NULL COMMENT 'if request_for is equal to 2 then dump id from asset table',
  `service_desk_conf_id` bigint(20) unsigned DEFAULT NULL,
  `service_request_id` bigint(20) unsigned DEFAULT NULL COMMENT 'If request_for is equal to 2 then dump category from asset table',
  `priority` tinyint(1) unsigned DEFAULT NULL COMMENT '1=low,2=medium,3=high',
  `description` varchar(250) DEFAULT NULL,
  `attachment` text,
  `status` enum('Open','Cancelled','Management approved','Management rejected','To management approve','Manager approved','Closed','Rejected','Manager rejected','To manager approve') DEFAULT NULL,
  `raised_by` bigint(20) unsigned DEFAULT NULL,
  `ticket_number` varchar(20) DEFAULT NULL,
  `executor_id` bigint(20) unsigned DEFAULT NULL,
  `executor_comments` varchar(250) DEFAULT NULL,
  `reporting_manager_id` bigint(20) unsigned DEFAULT NULL,
  `approver_status_1` enum('Approve','Reject','No answer') DEFAULT NULL,
  `approver_status_2` enum('Approve','Reject','No answer') DEFAULT NULL,
  `approver_status_3` enum('Approve','Reject','No answer') DEFAULT NULL,
  `reporting_manager_status` enum('Approve','Reject','No answer') DEFAULT NULL,
  `approver_1` bigint(20) unsigned DEFAULT NULL,
  `approver_2` bigint(20) unsigned DEFAULT NULL,
  `approver_3` bigint(20) unsigned DEFAULT NULL,
  `approver_1_comments` varchar(250) DEFAULT NULL,
  `approver_2_comments` varchar(250) DEFAULT NULL,
  `approver_3_comments` varchar(250) DEFAULT NULL,
  `reporting_manager_comments` varchar(250) DEFAULT NULL,
  `to_mgmt_comments` varchar(250) DEFAULT NULL,
  `to_manager_comments` varchar(250) DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT NULL COMMENT '1= active,0=inactive',
  `createdby` bigint(20) unsigned DEFAULT NULL,
  `modifiedby` bigint(20) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_sd_request_aft_ins` AFTER INSERT ON `main_sd_requests` 
					FOR EACH ROW BEGIN
					DECLARE x_service_desk_name,x_service_request_name,x_raised_by_name,x_executor_name,
						x_reporting_manager_name,x_approver_1_name,x_approver_2_name,x_approver_3_name,raised_empid,raised_img
						VARCHAR(250);
					
					IF(new.request_for=1) THEN
					SELECT service_desk_name INTO x_service_desk_name FROM main_sd_depts WHERE id = new.service_desk_id;
					SELECT service_request_name INTO x_service_request_name FROM main_sd_reqtypes WHERE id = new.service_request_id;
					ELSE
					SELECT NAME INTO x_service_desk_name FROM assets WHERE id = new.service_desk_id;
					SELECT NAME INTO x_service_request_name FROM assets_categories WHERE id = new.service_request_id AND parent=0;
					END IF;
					SELECT userfullname,employeeId,profileimg INTO x_raised_by_name,raised_empid,raised_img FROM main_employees_summary WHERE user_id = new.raised_by;
					SELECT userfullname INTO x_executor_name FROM main_employees_summary WHERE user_id = new.executor_id;
					SELECT userfullname INTO x_reporting_manager_name FROM main_employees_summary WHERE user_id = new.reporting_manager_id;
					SELECT userfullname INTO x_approver_1_name FROM main_employees_summary WHERE user_id = new.approver_1;
					SELECT userfullname INTO x_approver_2_name FROM main_employees_summary WHERE user_id = new.approver_2;
					SELECT userfullname INTO x_approver_3_name FROM main_employees_summary WHERE user_id = new.approver_3;
					
					INSERT INTO main_sd_requests_summary (
					request_for,sd_requests_id, service_desk_id, service_desk_name, service_desk_conf_id, service_request_name, service_request_id,
					priority, description, attachment, STATUS, raised_by, raised_by_name, ticket_number, executor_id, executor_name, executor_comments,
					reporting_manager_id, reporting_manager_name, approver_status_1, approver_status_2, approver_status_3, reporting_manager_status,
					approver_1, approver_1_name, approver_2, approver_2_name, approver_3, approver_3_name, isactive, createdby, modifiedby,
					createddate, modifieddate,raised_by_empid,approver_1_comments,approver_2_comments,approver_3_comments,reporting_manager_comments,
					to_mgmt_comments,to_manager_comments
					)
					VALUES	(	
					new.request_for,new.id, new.service_desk_id, x_service_desk_name, new.service_desk_conf_id, x_service_request_name, new.service_request_id,
					new.priority, new.description, new.attachment, new.status, new.raised_by, x_raised_by_name, new.ticket_number, new.executor_id,
					x_executor_name, new.executor_comments,	new.reporting_manager_id, x_reporting_manager_name, new.approver_status_1,
					new.approver_status_2, new.approver_status_3, new.reporting_manager_status, new.approver_1, x_approver_1_name, new.approver_2,
					x_approver_2_name, new.approver_3, x_approver_3_name, new.isactive, new.createdby, new.modifiedby, new.createddate, new.modifieddate,
						raised_empid,new.approver_1_comments,new.approver_2_comments,new.approver_3_comments,new.reporting_manager_comments,
					new.to_mgmt_comments,new.to_manager_comments
					);
					INSERT INTO main_request_history(request_id,description,emp_id,emp_name,createdby,modifiedby,createddate,modifieddate,isactive,emp_profileimg)
					VALUE (new.id,CONCAT(CONCAT(UCASE(LEFT(x_service_desk_name, 1)), SUBSTRING(x_service_desk_name, 2)) ,' Request has been raised by '),new.raised_by,CONCAT(UCASE(LEFT(x_raised_by_name, 1)), SUBSTRING(x_raised_by_name, 2)),new.createdby,new.createdby,new.createddate,new.modifieddate,new.isactive,raised_img);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_sd_request_aft_upd` AFTER UPDATE ON `main_sd_requests` 
					FOR EACH ROW BEGIN
					DECLARE x_service_desk_name,x_service_request_name,x_raised_by_name,x_executor_name,
						x_reporting_manager_name,x_approver_1_name,x_approver_2_name,x_approver_3_name
						VARCHAR(250);
					
					IF(new.request_for=1) THEN
					SELECT service_desk_name INTO x_service_desk_name FROM main_sd_depts WHERE id = new.service_desk_id;
					SELECT service_request_name INTO x_service_request_name FROM main_sd_reqtypes WHERE id = new.service_request_id;
					ELSE
					SELECT NAME INTO x_service_desk_name FROM assets WHERE id = new.service_desk_id;
					SELECT NAME INTO x_service_request_name FROM assets_categories WHERE id = new.service_request_id AND parent=0;
					END IF;
					SELECT userfullname INTO x_raised_by_name FROM main_employees_summary WHERE user_id = new.raised_by;
					SELECT userfullname INTO x_executor_name FROM main_employees_summary WHERE user_id = new.executor_id;
					SELECT userfullname INTO x_reporting_manager_name FROM main_employees_summary WHERE user_id = new.reporting_manager_id;
					SELECT userfullname INTO x_approver_1_name FROM main_employees_summary WHERE user_id = new.approver_1;
					SELECT userfullname INTO x_approver_2_name FROM main_employees_summary WHERE user_id = new.approver_2;
					SELECT userfullname INTO x_approver_3_name FROM main_employees_summary WHERE user_id = new.approver_3;
					
					UPDATE main_sd_requests_summary SET
					request_for=new.request_for,service_desk_id = new.service_desk_id, service_desk_name = x_service_desk_name, service_desk_conf_id = new.service_desk_conf_id,
					service_request_name = x_service_request_name, service_request_id = new.service_request_id, priority = new.priority,
					description = new.description, attachment = new.attachment, STATUS = new.status, raised_by = new.raised_by,
					raised_by_name = x_raised_by_name, ticket_number = new.ticket_number, executor_id = new.executor_id, executor_name = x_executor_name,
					executor_comments = new.executor_comments, reporting_manager_id = new.reporting_manager_id, reporting_manager_name = x_reporting_manager_name,
					approver_status_1 = new.approver_status_1, approver_status_2 = new.approver_status_2, approver_status_3 = new.approver_status_3,
					reporting_manager_status = new.reporting_manager_status, approver_1 = new.approver_1, approver_1_name = x_approver_1_name,
					approver_2 = new.approver_2, approver_2_name = x_approver_2_name, approver_3 = new.approver_3, approver_3_name = x_approver_3_name,
					isactive = new.isactive, createdby = new.createdby, modifiedby = new.modifiedby, createddate = new.createddate, modifieddate = new.modifieddate
					,approver_1_comments = new.approver_1_comments,approver_2_comments = new.approver_2_comments,approver_3_comments = new.approver_3_comments,reporting_manager_comments = new.reporting_manager_comments,
					to_mgmt_comments = new.to_mgmt_comments,to_manager_comments = new.to_manager_comments
					WHERE sd_requests_id = new.id;
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
