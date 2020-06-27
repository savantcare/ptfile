use DB_SC_Surescripts;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Surescripts
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
-- Table structure for table `directory`
--

DROP TABLE IF EXISTS `directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory` (
  `NCPDPID` int(11) DEFAULT NULL,
  `StoreNumber` varchar(20) DEFAULT NULL,
  `OrganizationName` varchar(100) DEFAULT NULL,
  `AddressLine1` varchar(100) DEFAULT NULL,
  `AddressLine2` varchar(100) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Zip` int(11) DEFAULT NULL,
  `StandardizedAddressLine1` varchar(100) DEFAULT NULL,
  `StandardizedAddressLine2` varchar(100) DEFAULT NULL,
  `StandardizedCity` varchar(50) DEFAULT NULL,
  `StandardizedState` varchar(50) DEFAULT NULL,
  `StandardizedZip` int(11) DEFAULT NULL,
  `PhonePrimary` varchar(100) DEFAULT NULL,
  `Fax` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `AlternatePhoneNumbers` varchar(100) DEFAULT NULL,
  `ActiveStartTime` datetime DEFAULT NULL,
  `ActiveEndTime` datetime DEFAULT NULL,
  `ServiceLevel` varchar(100) DEFAULT NULL,
  `PartnerAccount` varchar(100) DEFAULT NULL,
  `LastModifiedDate` datetime DEFAULT NULL,
  `CrossStreet` varchar(100) DEFAULT NULL,
  `RecordChange` varchar(100) DEFAULT NULL,
  `OldServiceLevel` varchar(100) DEFAULT NULL,
  `Version` varchar(100) DEFAULT NULL,
  `NPI` varchar(100) DEFAULT NULL,
  `SpecialtyType` varchar(100) DEFAULT NULL,
  `FileID` varchar(100) DEFAULT NULL,
  `StateLicenseNumber` varchar(100) DEFAULT NULL,
  `MedicareNumber` varchar(100) DEFAULT NULL,
  `MedicaidNumber` varchar(100) DEFAULT NULL,
  `PPONumber` varchar(100) DEFAULT NULL,
  `PayerID` varchar(100) DEFAULT NULL,
  `BINLocationNumber` varchar(100) DEFAULT NULL,
  `DEANumber` varchar(100) DEFAULT NULL,
  `HIN` varchar(100) DEFAULT NULL,
  `SecondaryCoverage` varchar(100) DEFAULT NULL,
  `NAICCode` varchar(100) DEFAULT NULL,
  `PromotionNumber` varchar(100) DEFAULT NULL,
  `SocialSecurity` varchar(100) DEFAULT NULL,
  `PriorAuthorization` varchar(100) DEFAULT NULL,
  `MutuallyDefined` varchar(100) DEFAULT NULL,
  `DirectAddress` varchar(100) DEFAULT NULL,
  `OrganizationType` varchar(100) DEFAULT NULL,
  `OrganizationID` int(11) DEFAULT NULL,
  `ParentOrganizationID` varchar(100) DEFAULT NULL,
  `Latitude` varchar(100) DEFAULT NULL,
  `Longitude` varchar(100) DEFAULT NULL,
  `Precise` varchar(100) DEFAULT NULL,
  `UseCases` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
