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
-- Table structure for table `main_businessunits`
--

DROP TABLE IF EXISTS `main_businessunits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_businessunits` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unitname` varchar(255) NOT NULL,
  `unitcode` varchar(50) DEFAULT NULL,
  `description` text,
  `startdate` date DEFAULT NULL,
  `country` int(11) unsigned DEFAULT NULL,
  `state` int(11) unsigned DEFAULT NULL,
  `city` int(11) unsigned DEFAULT NULL,
  `address1` text,
  `address2` text,
  `address3` text,
  `timezone` int(11) DEFAULT NULL,
  `unithead` varchar(255) DEFAULT NULL,
  `service_desk_flag` tinyint(1) unsigned DEFAULT '1' COMMENT '1=buwise,0=deptwise',
  `createdby` int(11) unsigned DEFAULT NULL,
  `modifiedby` int(11) unsigned DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT '1',
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_businessunits_main_requisition_summary` AFTER UPDATE ON `main_businessunits` FOR EACH ROW BEGIN
					UPDATE main_requisition_summary rs SET rs.businessunit_name = NEW.unitname, rs.modifiedon = utc_timestamp() WHERE (rs.businessunit_id = NEW.id 
					AND rs.businessunit_name != NEW.unitname);
				        UPDATE main_leaverequest_summary ls SET ls.buss_unit_name = if(NEW.unitcode != "000",concat(NEW.unitcode,"","-"),""), ls.modifieddate = utc_timestamp() 
				        WHERE (ls.bunit_id = NEW.id AND ls.isactive=1);
				        
				        update main_leavemanagement_summary lm set lm.businessunit_name = if(NEW.unitcode != "000",concat(NEW.unitcode,"","-"),""),lm.modifieddate = utc_timestamp() 
				        where lm.businessunit_id = new.id and lm.isactive = 1;
					#start of main_employees_summary
					update main_employees_summary set businessunit_name = new.unitname,modifieddate = utc_timestamp() where businessunit_id = new.id and isactive = 1;
					#end of main_employees_summary
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
