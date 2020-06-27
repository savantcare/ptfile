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
-- Table structure for table `main_leavemanagement`
--

DROP TABLE IF EXISTS `main_leavemanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_leavemanagement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cal_startmonth` int(11) unsigned DEFAULT NULL,
  `weekend_startday` int(11) unsigned DEFAULT NULL,
  `weekend_endday` int(11) unsigned DEFAULT NULL,
  `businessunit_id` int(11) unsigned DEFAULT NULL,
  `department_id` int(11) unsigned DEFAULT '0',
  `hr_id` int(11) DEFAULT NULL,
  `hours_day` int(11) DEFAULT NULL,
  `is_satholiday` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `is_halfday` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `is_leavetransfer` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `is_skipholidays` tinyint(1) DEFAULT NULL COMMENT '1-Yes,2-No',
  `description` varchar(255) DEFAULT NULL,
  `createdby` int(11) DEFAULT NULL,
  `modifiedby` int(11) DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `isactive` tinyint(1) DEFAULT NULL,
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_leavemanagement_aft_ins` AFTER INSERT ON `main_leavemanagement` FOR EACH ROW BEGIN
				    declare calmonth_name,weekend_name1,weekend_name2,dept_name,buss_unit_name varchar(200);
				    declare dept_id,bunit_id bigint(20);
				    select month_name into calmonth_name from tbl_months where monthid = new.cal_startmonth;
				    select week_name into weekend_name1 from tbl_weeks where week_id = new.weekend_startday;
				    select week_name into weekend_name2 from tbl_weeks where week_id = new.weekend_endday;
				    #select department_id into dept_id from main_employees where user_id = new.user_id;
				    select b.id,concat(d.deptname," (",d.deptcode,")") ,
				    if(b.unitcode != "000",concat(b.unitcode,"","-"),"") into bunit_id,dept_name,buss_unit_name 
				    FROM `main_departments` AS `d` LEFT JOIN `main_businessunits` AS `b` ON b.id=d.unitid 
				    WHERE (d.isactive = 1 and d.id = new.department_id);
				    insert into main_leavemanagement_summary (leavemgmt_id, cal_startmonth, cal_startmonthname, 
				    weekend_startday, weekend_startdayname, weekend_endday,weekend_enddayname, businessunit_id, 
				    businessunit_name, department_id, department_name, hours_day, is_satholiday, is_halfday, 
				    is_leavetransfer, is_skipholidays, description, createdby, modifiedby, createddate, 
				    modifieddate, isactive)
				    values(new.id,new.cal_startmonth, calmonth_name, new.weekend_startday, weekend_name1,
				    new.weekend_endday,weekend_name2,bunit_id, buss_unit_name, new.department_id, 
				    dept_name, new.hours_day, new.is_satholiday, new.is_halfday, new.is_leavetransfer, 
				    new.is_skipholidays, new.description,  new.createdby, new.modifiedby, new.createddate, 
				    new.modifieddate, new.isactive);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_leavemanagement_aft_upd` AFTER UPDATE ON `main_leavemanagement` FOR EACH ROW BEGIN
				    declare calmonth_name,weekend_name1,weekend_name2,dept_name,buss_unit_name varchar(200);
				    declare bunit_id bigint(20);
				    select month_name into calmonth_name from tbl_months where monthid = new.cal_startmonth;
				    select week_name into weekend_name1 from tbl_weeks where week_id = new.weekend_startday;
				    select week_name into weekend_name2 from tbl_weeks where week_id = new.weekend_endday;
				    select b.id,concat(d.deptname," (",d.deptcode,")") ,
				    if(b.unitcode != "000",concat(b.unitcode,"","-"),"") into bunit_id,dept_name,buss_unit_name 
				    FROM `main_departments` AS `d` LEFT JOIN `main_businessunits` AS `b` ON b.id=d.unitid 
				    WHERE (d.isactive = 1 and d.id = new.department_id);
				    UPDATE  main_leavemanagement_summary set
				    cal_startmonth = new.cal_startmonth, 
				    cal_startmonthname = calmonth_name, 
				    weekend_startday = new.weekend_startday, 
				    weekend_startdayname = weekend_name1,
				    weekend_endday = new.weekend_endday, 
				    weekend_enddayname = weekend_name2, 
				    businessunit_id = bunit_id, 
				    businessunit_name = buss_unit_name, 
				    department_id = new.department_id, 
				    department_name = dept_name, 
				    hours_day = new.hours_day, 
				    is_satholiday = new.is_satholiday, 
				    is_halfday = new.is_halfday, 
				    is_leavetransfer = new.is_leavetransfer, 
				    is_skipholidays = new.is_skipholidays, 
				    description = new.description, 
				    createdby = new.createdby, 
				    modifiedby = new.modifiedby, 
				    createddate = new.createddate, 
				    modifieddate = new.modifieddate, 
				    isactive = new.isactive where leavemgmt_id = new.id;
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
