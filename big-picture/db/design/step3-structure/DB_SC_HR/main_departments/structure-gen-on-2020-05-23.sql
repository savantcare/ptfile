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
-- Table structure for table `main_departments`
--

DROP TABLE IF EXISTS `main_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_departments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `deptname` varchar(150) NOT NULL,
  `deptcode` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `country` int(11) unsigned DEFAULT NULL,
  `state` int(11) unsigned DEFAULT NULL,
  `city` int(11) unsigned DEFAULT NULL,
  `address1` text NOT NULL,
  `address2` text,
  `address3` text,
  `timezone` int(11) DEFAULT NULL,
  `depthead` int(11) unsigned DEFAULT NULL,
  `unitid` int(11) DEFAULT NULL,
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_departments_main_requisition_summary` AFTER UPDATE ON `main_departments` FOR EACH ROW BEGIN
			        declare unit_code varchar(200);
				UPDATE main_requisition_summary rs SET rs.department_name = CASE WHEN NEW.isactive=1 then NEW.deptname ELSE NULL END, rs.modifiedon = utc_timestamp() 
	WHERE (rs.department_id = NEW.id);
			        update main_leaverequest_summary ls set ls.department_name = concat(new.deptname," (",new.deptcode,")"),ls.modifieddate = utc_timestamp() 
			        where ls.department_id = new.id and ls.isactive = 1;
			        update main_leavemanagement_summary lm set lm.department_name = concat(new.deptname," (",new.deptcode,")"),lm.modifieddate = utc_timestamp() 
			        where lm.department_id = new.id and lm.isactive = 1;
				
				#start of main_employees_summary
				update main_employees_summary es set es.department_name = new.deptname,es.modifieddate = utc_timestamp() 
			        where es.department_id = new.id and es.isactive = 1;
				#end of main_employees_summary
			        
			        # Start Updating BusinessUnit Id and Name if business unit is 0  
			        if new.unitid = 0 then 
				begin 
				       update main_leavemanagement_summary lm set lm.businessunit_id = 0,lm.businessunit_name = NULL,
			                 lm.modifieddate = utc_timestamp() where lm.department_id = new.id and lm.isactive = 1;
			               update main_leaverequest_summary ls set ls.bunit_id = 0,ls.buss_unit_name = NULL,
			               ls.modifieddate = utc_timestamp() where ls.department_id = new.id and ls.isactive = 1;
				end;
				end if; 
			        # End
			        
			        # Start Updating BusinessUnit Id and Name if business unit is not 0
			        if new.unitid != 0 then 
				begin 
			               select unitcode into unit_code from main_businessunits where id = new.unitid;
				       update main_leavemanagement_summary lm set lm.businessunit_id = new.unitid,
			                lm.businessunit_name = concat(unit_code,"","-"),lm.modifieddate = utc_timestamp() 
			                where lm.department_id = new.id and lm.isactive = 1;
			               update main_leaverequest_summary ls set ls.bunit_id = new.unitid,
			               ls.buss_unit_name = concat(unit_code,"","-"),ls.modifieddate = utc_timestamp() 
			               where ls.department_id = new.id and ls.isactive = 1;
				end;
				end if;
			        # End
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
