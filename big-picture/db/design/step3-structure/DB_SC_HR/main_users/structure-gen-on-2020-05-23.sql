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
-- Table structure for table `main_users`
--

DROP TABLE IF EXISTS `main_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `emprole` int(11) unsigned DEFAULT NULL,
  `userstatus` enum('new','old') DEFAULT 'new',
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `userfullname` varchar(255) DEFAULT NULL,
  `emailaddress` varchar(255) DEFAULT NULL,
  `contactnumber` varchar(15) DEFAULT NULL,
  `empipaddress` varchar(255) DEFAULT NULL,
  `backgroundchk_status` enum('In process','Completed','Not Applicable','Yet to start','On hold') DEFAULT 'Yet to start',
  `emptemplock` tinyint(1) unsigned DEFAULT '0',
  `empreasonlocked` varchar(255) DEFAULT NULL,
  `emplockeddate` date DEFAULT NULL,
  `emppassword` varchar(255) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` smallint(6) unsigned DEFAULT '1' COMMENT '0=inactive,1-Active,2-resigned,3-left,4-suspended,5-deleted,',
  `employeeId` varchar(255) DEFAULT NULL,
  `modeofentry` varchar(255) DEFAULT NULL,
  `other_modeofentry` varchar(255) DEFAULT NULL,
  `entrycomments` varchar(255) DEFAULT NULL,
  `rccandidatename` int(11) unsigned DEFAULT NULL,
  `selecteddate` date DEFAULT NULL,
  `candidatereferredby` int(11) unsigned DEFAULT NULL,
  `company_id` int(11) unsigned DEFAULT NULL,
  `profileimg` varchar(255) DEFAULT NULL,
  `jobtitle_id` bigint(11) unsigned DEFAULT NULL,
  `tourflag` tinyint(1) unsigned DEFAULT '0' COMMENT '0=not seen,1=seen',
  `themes` enum('default','brown','gray','peacock','skyblue','green','orange') DEFAULT 'default',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`employeeId`),
  KEY `IDX_4632B9B67F771501` (`emprole`),
  KEY `IDX_4632B9B6647385F4` (`rccandidatename`),
  KEY `IDX_4632B9B662E3F462` (`candidatereferredby`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_users_aft_upd` AFTER UPDATE ON `main_users` 
				    FOR EACH ROW BEGIN
				    declare groupid int(11);
				    
				    select group_id into groupid from main_roles where id = old.emprole;
				    if old.userfullname != new.userfullname then
				    begin 
				    
				    if (groupid != 5 or groupid is null) then 
				    begin
					#start of main_leaverequest_summary
				        update main_leaverequest_summary set rep_manager_name = new.userfullname,modifieddate = utc_timestamp() where rep_mang_id = new.id and isactive = 1;
				        update main_leaverequest_summary set user_name = new.userfullname,modifieddate = utc_timestamp() where user_id = new.id and isactive = 1; 
					#end of main_leaverequest_summary
					#start of main_requisition_summary
					update main_requisition_summary set reporting_manager_name = new.userfullname,modifiedon = utc_timestamp() where reporting_id = new.id and isactive = 1;
					update main_requisition_summary set approver1_name = new.userfullname,modifiedon = utc_timestamp() where approver1 = new.id and isactive = 1;
					update main_requisition_summary set approver2_name = new.userfullname,modifiedon = utc_timestamp() where approver2 = new.id and isactive = 1;
					update main_requisition_summary set approver3_name = new.userfullname,modifiedon = utc_timestamp() where approver3 = new.id and isactive = 1;
					update main_requisition_summary set createdby_name = new.userfullname,modifiedon = utc_timestamp() where createdby = new.id and isactive = 1;
					#end of main_requisition_summary
					#start of main_employees_summary
					update main_employees_summary set reporting_manager_name = new.userfullname,modifieddate = utc_timestamp() where reporting_manager = new.id and isactive = 1;
					update main_employees_summary set referer_name = new.userfullname,modifieddate = utc_timestamp() where candidatereferredby = new.id and isactive = 1;
					update main_employees_summary set createdby_name = new.userfullname,modifieddate = utc_timestamp() where createdby = new.id and isactive = 1;
				        update main_employees_summary set userfullname = new.userfullname,modifieddate = utc_timestamp() where user_id = new.id and isactive = 1;
					#end of main_employees_summary
					#start of main_bgchecks_summary
					update main_bgchecks_summary set specimen_name = new.userfullname,modifieddate = utc_timestamp() where specimen_id = new.id and specimen_flag = 1 and isactive = 1;
					update main_bgchecks_summary set createdname = new.userfullname,modifieddate = utc_timestamp() where createdby = new.id and isactive = 1;
					update main_bgchecks_summary set modifiedname = new.userfullname,modifieddate = utc_timestamp() where modifiedby = new.id and isactive = 1;
					#end of main_bgchecks_summary
					# start of main_interviewrounddetails_summary
					update main_interviewrounds_summary set interviewer_name = new.userfullname,modified_date = utc_timestamp() where interviewer_id = new.id and isactive = 1;
					update main_interviewrounds_summary set created_by_name = new.userfullname,modified_date = utc_timestamp() where created_by = new.id and isactive = 1;
					# end of main_interviewrounddetails_summary
					# start of main_userloginlog
					update main_userloginlog set userfullname = new.userfullname where userid = new.id;
					# end of main_userloginlog
					#start of main_sdrequests_summary
					update main_sd_requests_summary set raised_by_name = new.userfullname,modifieddate = utc_timestamp() where raised_by = new.id;
					update main_sd_requests_summary set executor_name = new.userfullname,modifieddate = utc_timestamp() where executor_id = new.id;
					update main_sd_requests_summary set reporting_manager_name = new.userfullname,modifieddate = utc_timestamp() where reporting_manager_id = new.id;
					update main_sd_requests_summary set approver_1_name = new.userfullname,modifieddate = utc_timestamp() where approver_1 = new.id;	
					update main_sd_requests_summary set approver_2_name = new.userfullname,modifieddate = utc_timestamp() where approver_2 = new.id;
					update main_sd_requests_summary set approver_3_name = new.userfullname,modifieddate = utc_timestamp() where approver_3 = new.id;
					# end of main_sdrequests_summary	
				    end;
				    end if;
				    end;
				    end if;#end of if of user full name
				    if old.employeeId != new.employeeId then 
				    begin 
				        if (groupid != 5 or groupid is null) then 
				        begin
					    #start of main_employees_summary
				            update main_employees_summary set employeeId = new.employeeId,modifieddate = utc_timestamp() where user_id = new.id; 
				            #end of main_employees_summary
				        end;
				        end if;
				    end;
				    end if;#end of if of employeeId
				    if old.isactive != new.isactive then
				    begin
					if (groupid != 5 or groupid is null) then 
				        begin
					    #start of main_employees_summary
				            update main_employees_summary set isactive = new.isactive,modifieddate = utc_timestamp() where user_id = new.id; 
				            #end of main_employees_summary
				        end;
				        end if;
				    end;
				    end if; #end of if of isactive
				    if old.profileimg != new.profileimg then
				    begin
					if (groupid != 5 or groupid is null) then 
				        begin
					    #start of main_employees_summary
				            update main_employees_summary set profileimg = new.profileimg,modifieddate = utc_timestamp() where user_id = new.id; 
				            #end of main_employees_summary
					    #start of main_request_history
				            update main_request_history set emp_profileimg = new.profileimg,modifieddate = utc_timestamp() where emp_id = new.id; 
				            #end of main_request_history
				        end;
				        end if;
				    end;
				    end if; #end of if of isactive
				    if old.backgroundchk_status != new.backgroundchk_status then
				    begin
					if (groupid != 5 or groupid is null) then 
				        begin
					    #start of main_employees_summary
				            update main_employees_summary set backgroundchk_status = new.backgroundchk_status,modifieddate = utc_timestamp() where user_id = new.id; 
				            #end of main_employees_summary
				        end;
				        end if;
				    end;
				    end if;#end of if of background check status
				if (old.contactnumber != new.contactnumber || new.contactnumber IS NOT NULL) then
				    begin
					if (groupid != 5 or groupid is null) then 
				        begin
					    #start of main_employees_summary
				            update main_employees_summary set contactnumber = new.contactnumber,modifieddate = utc_timestamp() where user_id = new.id; 
				            #end of main_employees_summary
				        end;
				        end if;
				    end;
				    end if;#end of if of contact number
				    
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
