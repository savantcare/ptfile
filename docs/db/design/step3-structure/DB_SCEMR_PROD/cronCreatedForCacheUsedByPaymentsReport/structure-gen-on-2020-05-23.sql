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
-- Table structure for table `cronCreatedForCacheUsedByPaymentsReport`
--

DROP TABLE IF EXISTS `cronCreatedForCacheUsedByPaymentsReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cronCreatedForCacheUsedByPaymentsReport` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `eventID` int(11) unsigned NOT NULL,
  `uidOfProvider` int(11) unsigned DEFAULT NULL,
  `uidOfPatient` int(11) unsigned DEFAULT NULL,
  `dobOfPatient` date DEFAULT NULL,
  `cptCodeID` int(11) unsigned DEFAULT NULL,
  `cptCodeName` varchar(128) DEFAULT NULL,
  `paymentID` int(11) unsigned DEFAULT NULL,
  `fullNameOfProvider` varchar(255) DEFAULT NULL,
  `fullNameOfPatient` varchar(255) DEFAULT NULL,
  `eventTypeName` varchar(255) NOT NULL,
  `eventStatusName` varchar(255) DEFAULT NULL,
  `uidOfCreatedBy` int(11) unsigned DEFAULT NULL,
  `fullNameOfCreatedBy` varchar(255) NOT NULL,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  `durationInMinute` int(11) DEFAULT NULL,
  `companyID` int(11) unsigned DEFAULT NULL,
  `billingStatus` varchar(255) DEFAULT NULL,
  `cptAmountExpected` decimal(10,2) DEFAULT NULL,
  `cptAmountReceived` decimal(10,2) DEFAULT NULL,
  `cptAmountBadDebt` decimal(10,2) DEFAULT NULL,
  `cptAmountRemaining` decimal(10,2) DEFAULT NULL,
  `paymentAmountClaimedIncludingFinanceCharges` decimal(10,2) DEFAULT NULL,
  `paymentAmountClaimedForSCExcludingFinanceCharges` decimal(10,2) DEFAULT NULL,
  `paymentAmountTransactionFee` decimal(10,2) DEFAULT NULL,
  `paymentAmountReceived` decimal(10,2) DEFAULT NULL,
  `paymentAmountBadDebt` decimal(10,2) DEFAULT NULL,
  `paymentBadDebtUpdatedOn` datetime DEFAULT NULL,
  `paymentBadDebtUpdatedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `paymentBadDebtUpdatedByUID` int(11) DEFAULT NULL,
  `paymentBadDebtUpdatedByName` varchar(255) DEFAULT NULL,
  `paymentAmountRemaining` decimal(10,2) DEFAULT NULL,
  `paymentMerchantOneTransactionID` varchar(50) DEFAULT NULL,
  `paymentAccountThisPaymentIsBeingMadeFrom` varchar(255) DEFAULT NULL,
  `paymentLast4DigitChargedCreditCardNo` varchar(4) DEFAULT NULL,
  `paymentStatus` varchar(255) DEFAULT NULL,
  `paymentMethod` varchar(255) DEFAULT NULL,
  `entityResponsibleToMakeThisPayment` varchar(128) DEFAULT NULL,
  `nameOfInsuranceCompanyPaymentRecdFrom` varchar(255) DEFAULT NULL,
  `uidOfInsuranceCompanyPaymentRecdFrom` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isEventLocked` enum('No','Yes') DEFAULT NULL,
  `isCptLocked` enum('No','Yes') DEFAULT NULL,
  `isPaymentLocked` enum('No','Yes') DEFAULT NULL,
  `cptCreatedAt` datetime DEFAULT NULL,
  `cptCreatedByUID` int(11) unsigned DEFAULT NULL,
  `cptCreatedByFullName` varchar(255) DEFAULT NULL,
  `cptUpdatedAt` datetime DEFAULT NULL,
  `cptUpdatedByUID` int(11) unsigned DEFAULT NULL,
  `cptUpdatedByFullName` varchar(255) DEFAULT NULL,
  `paymentCreatedAt` datetime DEFAULT NULL,
  `paymentCreatedByUID` int(11) unsigned DEFAULT NULL,
  `paymentCreatedByFullName` varchar(255) DEFAULT NULL,
  `paymentUpdatedAt` datetime DEFAULT NULL,
  `paymentUpdatedByUID` int(11) unsigned DEFAULT NULL,
  `paymentUpdatedByFullName` varchar(255) DEFAULT NULL,
  `financialInstitutionID` int(11) unsigned DEFAULT NULL,
  `financialInstitutionName` varchar(255) DEFAULT NULL,
  `quickbookStatus` varchar(255) DEFAULT NULL,
  `dateTheMoneyComeIntoSCAccount` date DEFAULT NULL,
  `bankPostDateOfOfficeAlly` date DEFAULT NULL,
  `paymentNotes` varchar(255) DEFAULT NULL,
  `paymentStatusOfClaimFiledOnBehalfOfPatient` varchar(500) DEFAULT NULL,
  `claimLastSubmittedOn` datetime DEFAULT NULL,
  `claimLastSubmittedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `claimLastSubmittedByUID` int(11) DEFAULT NULL,
  `claimLastSubmittedByFullName` varchar(255) DEFAULT NULL,
  `assetID` int(11) DEFAULT NULL,
  `assetName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1201520 DEFAULT CHARSET=utf8 COMMENT='This is a denomalized table. Advnatages 1. easier to program 2. fast page load for end user';
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
