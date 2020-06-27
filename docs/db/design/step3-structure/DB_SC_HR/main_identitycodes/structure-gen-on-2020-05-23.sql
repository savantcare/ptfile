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
-- Table structure for table `main_identitycodes`
--

DROP TABLE IF EXISTS `main_identitycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_identitycodes` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `employee_code` varchar(100) DEFAULT NULL,
  `backgroundagency_code` varchar(100) DEFAULT NULL,
  `vendors_code` varchar(100) DEFAULT NULL,
  `staffing_code` varchar(100) DEFAULT NULL,
  `users_code` varchar(10) DEFAULT NULL COMMENT 'for users',
  `requisition_code` varchar(10) DEFAULT NULL COMMENT 'for requisition',
  `createdBy` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_identitycodes_aft_upd` AFTER UPDATE ON `main_identitycodes` 
				    FOR EACH ROW BEGIN
				    if old.employee_code != new.employee_code then 
				    begin
					update main_users set employeeId = replace(employeeId,SUBSTRING(employeeId,1,CHAR_LENGTH(old.employee_code)),new.employee_code),modifieddate = utc_timestamp() where SUBSTRING(employeeId,1,CHAR_LENGTH(old.employee_code)) = old.employee_code;
				    end;
				    end if;
				    if old.backgroundagency_code != new.backgroundagency_code then 
				    begin
					update main_users set employeeId = replace(employeeId,SUBSTRING(employeeId,1,CHAR_LENGTH(old.backgroundagency_code)),new.backgroundagency_code),modifieddate = utc_timestamp() where SUBSTRING(employeeId,1,CHAR_LENGTH(old.backgroundagency_code)) = old.backgroundagency_code;
				    end;
				    end if;
				    if old.users_code != new.users_code then 
				    begin
					update main_users set employeeId = replace(employeeId,SUBSTRING(employeeId,1,CHAR_LENGTH(old.users_code)),new.users_code),modifieddate = utc_timestamp() where SUBSTRING(employeeId,1,CHAR_LENGTH(old.users_code)) = old.users_code;
				    end;
				    end if;	
				    if old.requisition_code != new.requisition_code then 
				    begin
					update main_requisition r set r.requisition_code = replace(r.requisition_code,left(r.requisition_code,LOCATE('/',r.requisition_code)),CONCAT(new.requisition_code,'/')),r.modifiedon = utc_timestamp() where left(r.requisition_code,LOCATE('/',r.requisition_code)) = CONCAT(old.requisition_code,'/');
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
