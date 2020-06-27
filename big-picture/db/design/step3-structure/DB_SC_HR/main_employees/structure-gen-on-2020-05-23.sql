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
-- Table structure for table `main_employees`
--

DROP TABLE IF EXISTS `main_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `date_of_joining` date DEFAULT '0000-00-00',
  `date_of_leaving` date DEFAULT '0000-00-00',
  `reporting_manager` bigint(20) unsigned DEFAULT NULL,
  `emp_status_id` int(11) unsigned DEFAULT NULL,
  `businessunit_id` int(11) unsigned DEFAULT NULL,
  `department_id` int(11) unsigned DEFAULT NULL,
  `jobtitle_id` int(11) unsigned DEFAULT NULL,
  `position_id` int(11) unsigned DEFAULT NULL,
  `years_exp` varchar(20) DEFAULT NULL COMMENT 'for numbers we are using varchar datatype',
  `holiday_group` int(11) unsigned DEFAULT NULL,
  `prefix_id` int(11) unsigned DEFAULT NULL,
  `extension_number` varchar(20) DEFAULT NULL COMMENT 'for numbers we are using varchar datatype',
  `office_number` varchar(100) DEFAULT NULL,
  `office_faxnumber` varchar(100) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) unsigned DEFAULT '1' COMMENT '1-active,5-deleted',
  `is_orghead` tinyint(1) unsigned DEFAULT '0' COMMENT '1=organisation head,0=normal employee',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_employees_aft_ins` AFTER INSERT ON `main_employees` 
				    FOR EACH ROW BEGIN
					declare user_id,fname,lname,username,role_name,rep_name,emp_status,bunit_name,dept_name,job_name,pos_name,prefix_name,
						createdbyname,holidaygrp,modifiedbyname,emailid,cnumber,bgstatus,empid,mode_entry,omode_entry,sel_date,
				                ref_by_name,img_src
						varchar(250);
					declare ref_by_id,role_id int(11);
					select firstname,lastname,userfullname,emailaddress,contactnumber,backgroundchk_status,employeeId,modeofentry,other_modeofentry,selecteddate,candidatereferredby,
				               profileimg,emprole  
						into fname,lname,username,emailid,cnumber,bgstatus,empid,mode_entry,omode_entry,sel_date,ref_by_id,img_src,role_id 
					from main_users where id = new.user_id;
					select userfullname into rep_name from main_users where id = new.reporting_manager;
				/*
					select employemnt_status into emp_status from tbl_employmentstatus where id = (select workcodename 
					from main_employmentstatus where id = new.emp_status_id);*/
					select employemnt_status into emp_status from tbl_employmentstatus where id = new.emp_status_id	;
					set user_id = new.user_id;
					set bunit_name = null;
					if new.businessunit_id is not null then
						select unitname into bunit_name from main_businessunits where id = new.businessunit_id;
					end if;
					set holidaygrp = null;
					if new.holiday_group is not null then
						select groupname into holidaygrp from main_holidaygroups where id = new.holiday_group;
					end if;
					select deptname into dept_name from main_departments where id = new.department_id;
					select jobtitlename into job_name from main_jobtitles where id = new.jobtitle_id;
					select positionname into pos_name from main_positions where id = new.position_id;
					select prefix into prefix_name from main_prefix where id = new.prefix_id;
					select userfullname into createdbyname from main_users where id = new.createdby;
					select rolename into role_name from main_roles where id = role_id;
					if (ref_by_id != '' and ref_by_id > 0) then 
				        begin 
					    select userfullname into ref_by_name from main_users where id = ref_by_id;
				        end;
				        end if;
				insert into main_employees_summary ( 
					user_id, date_of_joining, date_of_leaving, reporting_manager, reporting_manager_name, emp_status_id, 
					emp_status_name, businessunit_id, businessunit_name, department_id, department_name, jobtitle_id, 
					jobtitle_name, position_id, position_name, years_exp, holiday_group, holiday_group_name, 
					prefix_id, prefix_name, extension_number, office_number, office_faxnumber, emprole, 
					emprole_name, firstname,lastname,userfullname, emailaddress, contactnumber, backgroundchk_status, 	employeeId, 
					modeofentry, other_modeofentry, selecteddate, candidatereferredby, referer_name, profileimg, 
					createdby, createdby_name, modifiedby, createddate, modifieddate, isactive)
					values	(	
					new.user_id, new.date_of_joining, new.date_of_leaving,new.reporting_manager,rep_name,new.emp_status_id, 
					emp_status,new.businessunit_id,	bunit_name,new.department_id,dept_name,new.jobtitle_id, 
					job_name, new.position_id, pos_name,new.years_exp, new.holiday_group, holidaygrp, 
					new.prefix_id, 	prefix_name, new.extension_number, new.office_number, new.office_faxnumber,role_id, 
					role_name,fname,lname,username, emailid,cnumber,bgstatus,empid, 
					mode_entry,omode_entry,	sel_date, ref_by_id, ref_by_name,img_src, 
					new.createdby, 	createdbyname, new.modifiedby,new.createddate, new.modifieddate, new.isactive
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_employees_aft_upd` AFTER UPDATE ON `main_employees` 
				    FOR EACH ROW BEGIN
					declare fname,lname,username,role_name,rep_name,emp_status,bunit_name,dept_name,job_name,pos_name,prefixname,
						createdbyname,holidaygrp,modifiedbyname,emailid,cnumber,bgstatus,empid,mode_entry,omode_entry,sel_date,
				                ref_by_name,img_src
						varchar(250);
					declare ref_by_id,role_id int(11);
					select firstname,lastname,userfullname,emailaddress,contactnumber,backgroundchk_status,employeeId,modeofentry,other_modeofentry,selecteddate,candidatereferredby,
				               profileimg,emprole  
						into fname,lname,username,emailid,cnumber,bgstatus,empid,mode_entry,omode_entry,sel_date,ref_by_id,img_src,role_id 
					from main_users where id = new.user_id;
					select userfullname into rep_name from main_users where id = new.reporting_manager;
					/*select employemnt_status into emp_status from tbl_employmentstatus where id = (select workcodename 
					from main_employmentstatus where id = new.emp_status_id);*/
					select employemnt_status into emp_status from tbl_employmentstatus where id = new.emp_status_id	;
					set bunit_name = null;
					if new.businessunit_id is not null then
						select unitname into bunit_name from main_businessunits where id = new.businessunit_id;
					end if;
					set holidaygrp = null;
					if new.holiday_group is not null then
						select groupname into holidaygrp from main_holidaygroups where id = new.holiday_group;
					end if;
					select deptname into dept_name from main_departments where id = new.department_id;
					select jobtitlename into job_name from main_jobtitles where id = new.jobtitle_id;
					select positionname into pos_name from main_positions where id = new.position_id;
					select prefix into prefixname from main_prefix where id = new.prefix_id;
					select userfullname into createdbyname from main_users where id = new.createdby;
					select rolename into role_name from main_roles where id = role_id;
					if (ref_by_id != '' and ref_by_id > 0) then 
				        begin 
					    select userfullname into ref_by_name from main_users where id = ref_by_id;
				        end;
				        end if;
				        update main_employees_summary set  
					 date_of_joining = new.date_of_joining, date_of_leaving = new.date_of_leaving, reporting_manager = new.reporting_manager, 
				         reporting_manager_name = rep_name, emp_status_id = new.emp_status_id, 	emp_status_name = emp_status, 
					businessunit_id = new.businessunit_id, businessunit_name = bunit_name, department_id = new.department_id, 
				        department_name = dept_name, jobtitle_id = new.jobtitle_id,jobtitle_name = job_name, position_id = new.position_id, 
				        position_name = pos_name, years_exp = new.years_exp, holiday_group = new.holiday_group, holiday_group_name = holidaygrp, 
					prefix_id = new.prefix_id, prefix_name = prefixname, extension_number = new.extension_number, office_number = new.office_number, 
					office_faxnumber = new.office_faxnumber, emprole = role_id, emprole_name = role_name, firstname=fname, lastname=lname,userfullname = username, 
					emailaddress = emailid, contactnumber = cnumber, backgroundchk_status = bgstatus,employeeId = empid, 
					modeofentry = mode_entry, other_modeofentry = omode_entry, selecteddate = sel_date, candidatereferredby = ref_by_id,
					referer_name = ref_by_name, profileimg = img_src,  modifiedby = new.modifiedby, modifieddate = new.modifieddate, isactive = new.isactive
					
					 where user_id = new.user_id;
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
