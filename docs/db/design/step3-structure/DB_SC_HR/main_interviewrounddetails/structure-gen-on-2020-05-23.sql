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
-- Table structure for table `main_interviewrounddetails`
--

DROP TABLE IF EXISTS `main_interviewrounddetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_interviewrounddetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `interview_id` int(11) unsigned DEFAULT NULL,
  `req_id` int(11) unsigned DEFAULT NULL,
  `candidate_id` int(11) unsigned DEFAULT NULL,
  `interviewer_id` int(11) unsigned DEFAULT NULL,
  `interview_time` time DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_mode` enum('In person','Phone','Video conference') DEFAULT 'Phone',
  `interview_round_number` int(11) DEFAULT NULL,
  `interview_round` varchar(50) DEFAULT NULL,
  `interview_feedback` text,
  `interview_comments` text,
  `round_status` enum('Schedule for next round','Qualified','Selected','Disqualified','Decision pending','On hold','Incompetent','Ineligible','Candidate no show','Requisition Closed/Completed') DEFAULT NULL,
  `int_location` varchar(200) DEFAULT NULL,
  `int_city` int(11) unsigned DEFAULT NULL,
  `int_state` int(11) unsigned DEFAULT NULL,
  `int_country` int(11) unsigned DEFAULT NULL,
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_interviewrounddetails_aft_ins` AFTER INSERT ON `main_interviewrounddetails` FOR EACH ROW BEGIN
					declare cand_name,cstatus,istatus,int_name,cityname,statename,countryname,created_name varchar(255);
					select candidate_name,cand_status into cand_name,cstatus from main_candidatedetails where id = new.candidate_id and isactive =1;
					select userfullname into int_name from main_users where id = new.interviewer_id and isactive =1;
					select userfullname into created_name from main_users where id = new.createdby and isactive =1;
					select interview_status into istatus from main_interviewdetails where id = new.interview_id and isactive =1;
					select city into cityname from main_cities where city_org_id = new.int_city and isactive =1;
					select state into statename from main_states where state_id_org = new.int_state and isactive =1;
					select country into countryname from main_countries where country_id_org = new.int_country and isactive =1;
					insert into main_interviewrounds_summary 
					(requisition_id, candidate_id, candidate_name,candidate_status, interview_status, interview_id, interviewround_id, 
					interviewer_id, interviewer_name, interview_time, interview_date, interview_mode, interview_round_number, 
					interview_round_name, interview_location, interview_city_id, interview_state_id, interview_city_name, 
					interview_state_name, interview_country_id, interview_country_name, created_by, created_by_name, 
					interview_feedback, interview_comments, round_status, modified_by, created_date, modified_date, 
					isactive)
					values
					( new.req_id, new.candidate_id,	cand_name,cstatus,istatus,new.interview_id,new.id, 	
					new.interviewer_id,int_name,new.interview_time,new.interview_date,new.interview_mode,new.interview_round_number, 
					new.interview_round,new.int_location, 	new.int_city,new.int_state,cityname, 
					statename,new.int_country,countryname,new.createdby,created_name, 
					new.interview_feedback, new.interview_comments,	new.round_status,new.modifiedby, new.createddate, new.modifieddate, 
					new.isactive
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `main_interviewrounddetails_aft_upd` AFTER UPDATE ON `main_interviewrounddetails` FOR EACH ROW BEGIN
					declare cand_name,cstatus,istatus,int_name,cityname,statename,countryname varchar(255);
					select candidate_name,cand_status into cand_name,cstatus from main_candidatedetails where id = new.candidate_id and isactive =1;
					select userfullname into int_name from main_users where id = new.interviewer_id and isactive =1;
					
					select interview_status into istatus from main_interviewdetails where id = new.interview_id and isactive =1;
					select city into cityname from main_cities where city_org_id = new.int_city and isactive =1;
					select state into statename from main_states where state_id_org = new.int_state and isactive =1;
					select country into countryname from main_countries where country_id_org = new.int_country and isactive =1;
					update main_interviewrounds_summary set
					 candidate_name = cand_name,candidate_status = cstatus, interview_status = istatus,  
					interviewer_id = new.interviewer_id, interviewer_name = int_name, interview_time = new.interview_time,
					interview_date = new.interview_date, interview_mode = new.interview_mode, interview_round_number = new.interview_round_number, 
					interview_round_name = new.interview_round, interview_location = new.int_location, interview_city_id = new.int_city,
					interview_state_id = new.int_state, interview_city_name = cityname,interview_state_name = statename,
					interview_country_id = new.int_country, interview_country_name = countryname, interview_feedback = new.interview_feedback, 
					interview_comments = new.interview_comments, round_status = new.round_status, modified_by = new.modifiedby, 
					modified_date = new.modifieddate,isactive = new.isactive
					
					 where interviewround_id = new.id;
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
