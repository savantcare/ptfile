use DB_SCEMR_PROD;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SCEMR_PROD
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
-- Table structure for table `userSelectedOptionForIntakeDetailData`
--

DROP TABLE IF EXISTS `userSelectedOptionForIntakeDetailData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userSelectedOptionForIntakeDetailData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `hasDiagnosisData` enum('yes','no') DEFAULT NULL,
  `hasSuicideData` enum('yes','no') DEFAULT NULL,
  `hasPlannedSuicideData` enum('yes','no') DEFAULT NULL,
  `hasSelfHurtData` enum('yes','no') DEFAULT NULL,
  `hasMentalHealthData` enum('yes','no') DEFAULT NULL,
  `hasHospitalisationData` enum('yes','no') DEFAULT NULL,
  `hasVisitedPsychiatristData` enum('yes','no') DEFAULT NULL,
  `hasVisitedTherapistData` enum('yes','no') DEFAULT NULL,
  `hasRehabData` enum('yes','no') DEFAULT NULL,
  `hasPsychotropicMedData` enum('yes','no') DEFAULT NULL,
  `hasAllergicMedData` enum('yes','no') DEFAULT NULL,
  `isCurrentlyEmployed` enum('yes','no') DEFAULT NULL,
  `hasMajorLifeEventData` enum('yes','no') DEFAULT NULL,
  `hasInsuranceInContract` enum('yes','no') DEFAULT NULL,
  `canClimbStairs` enum('yes','no') DEFAULT NULL,
  `initialPurposeOfVisit` text,
  `onGoingMedications` text,
  `pastMedications` text,
  `specialNeedsRequired` enum('yes','no') DEFAULT NULL,
  `additionalNote` varchar(255) DEFAULT NULL,
  `canAffordCopay` enum('yes','no') DEFAULT NULL,
  `isTmsOnly` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=8655 DEFAULT CHARSET=latin1;
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
