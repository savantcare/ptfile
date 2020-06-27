use DB_SC_Meds_and_Refill;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Meds_and_Refill
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
-- Table structure for table `medsFromOtherDoctors`
--

DROP TABLE IF EXISTS `medsFromOtherDoctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medsFromOtherDoctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publicUniqueMedsId` varchar(36) DEFAULT NULL,
  `uidOfPatient` int(11) NOT NULL,
  `NDCCode` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `providerName` varchar(255) DEFAULT NULL,
  `createdByUid` int(11) NOT NULL,
  `status` enum('verified','not verified') NOT NULL DEFAULT 'not verified',
  `statusApprovedByUid` int(11) DEFAULT NULL,
  `statusApprovedOnDate` datetime DEFAULT NULL,
  `statusApprovedOnTimeZone` varchar(10) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `createdAtTimezone` varchar(10) DEFAULT NULL,
  `discontinueByUid` int(11) DEFAULT NULL,
  `discontinueOnDateTime` datetime DEFAULT NULL,
  `discontinueOnTimeZone` varchar(25) DEFAULT NULL,
  `discontinueReason` text,
  `isDeleted` enum('yes','no') NOT NULL DEFAULT 'no',
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(5) DEFAULT NULL,
  `deletedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1299 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `generate_uuid4_for_meds` BEFORE INSERT ON `medsFromOtherDoctors` FOR EACH ROW begin
    DECLARE P1 VARCHAR(36);
    DECLARE P2 bigint(21);
    SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'DB_SC_Meds_and_Refill' AND TABLE_NAME = 'medsFromOtherDoctors' INTO @P2;
    Select uuid_v4_custom_medicine(@P2) INTO @P1;
    IF (NEW.publicUniqueMedsId IS NULL) THEN
    	SET NEW.publicUniqueMedsId = @P1;
    ELSEIF (NEW.publicUniqueMedsId = '') THEN
    	SET NEW.publicUniqueMedsId = @P1;  
	ELSE
    	SET NEW.publicUniqueMedsId = NEW.publicUniqueMedsId;
    END IF;
end */;;
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
