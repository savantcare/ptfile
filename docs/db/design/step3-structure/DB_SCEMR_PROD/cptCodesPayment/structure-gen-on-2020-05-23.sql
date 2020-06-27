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
-- Table structure for table `cptCodesPayment`
--

DROP TABLE IF EXISTS `cptCodesPayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cptCodesPayment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cptCodeForAppointmentID` int(11) unsigned NOT NULL,
  `paymentStatusID` tinyint(4) unsigned DEFAULT NULL,
  `totalPaymentClaimedIncludingFinanceCharges` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paymentClaimedForSCAcExcludingFinanceCharges` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paymentAmountInSCAccount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `badDebtAmount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `badDebtEntryDoneBy` int(11) DEFAULT NULL,
  `badDebtEntryDoneOn` datetime DEFAULT NULL,
  `badDebtEntryDoneOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `entityResponsibleToMakeThisPayment` tinyint(4) unsigned DEFAULT NULL,
  `instrumentInformationForThisPayment` varchar(255) DEFAULT NULL,
  `statusOfClaimFiledOnBehalfOfPatient` enum('Step 1: Claim to be submitted by SC','Step 2: Claim submitted by SC and now under process by Insurance company','Step 3A: Money received by the patient','Step 3B: Insurance company refuses to pay money to patient') DEFAULT NULL,
  `amountReceivedByThePatient` decimal(10,2) DEFAULT NULL,
  `insuranceUIDOnCreationDateIfClaimFilingIsRequired` int(11) unsigned DEFAULT NULL,
  `notes` text,
  `notesForBilling` text,
  `paymentMethodID` tinyint(4) unsigned DEFAULT NULL,
  `accountThisPaymentIsBeingMadeToID` int(11) DEFAULT '1',
  `transactionFee` decimal(10,2) DEFAULT NULL,
  `transactionIdProvidedByPaymentGateway` varchar(50) DEFAULT NULL,
  `isThisEntityLockedAndHenceNonEditable` enum('Yes','No') NOT NULL DEFAULT 'No',
  `financialInstitutionID` int(11) unsigned DEFAULT NULL,
  `dateOfTransactionInSCAccount` date DEFAULT NULL,
  `bankPostDateOfOfficeAlly` date DEFAULT NULL,
  `quickbookStatus` enum('Step 1: Data not entered','Step 2: Data entered but not matching with financial institution','Step 3: Data entered and matching with financial institution') DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `created_by` int(11) unsigned DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `timeZoneForCreatedOn` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `timeZoneForUpdatedOn` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `chargedCCNumber` varchar(30) DEFAULT NULL,
  `claimLastSubmittedOn` datetime DEFAULT NULL,
  `claimLastSubmittedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `claimLastSubmittedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cptCodeForAppointmentID` (`cptCodeForAppointmentID`),
  KEY `paymentStatusID` (`paymentStatusID`),
  KEY `entityResponsibleToMakeThisPayment` (`entityResponsibleToMakeThisPayment`),
  KEY `insuraneUIDOnCreationDateIfClaimFilingIsReqd` (`insuranceUIDOnCreationDateIfClaimFilingIsRequired`),
  KEY `paymentMethodID` (`paymentMethodID`),
  KEY `accountThisPaymentIsBeingMadeToID` (`id`),
  KEY `accountThisPaymentIsBeingMadeT_2` (`accountThisPaymentIsBeingMadeToID`),
  CONSTRAINT `cptCodesPayment_ibfk_1` FOREIGN KEY (`cptCodeForAppointmentID`) REFERENCES `cptCodesForAnAppointment` (`id`),
  CONSTRAINT `cptCodesPayment_ibfk_2` FOREIGN KEY (`paymentStatusID`) REFERENCES `cptCodesPaymentStatusMaster` (`id`),
  CONSTRAINT `cptCodesPayment_ibfk_3` FOREIGN KEY (`entityResponsibleToMakeThisPayment`) REFERENCES `cptPaymentEntityResponsibleToSCMaster` (`id`),
  CONSTRAINT `cptCodesPayment_ibfk_5` FOREIGN KEY (`paymentMethodID`) REFERENCES `cptCodesPaymentMethodMaster` (`id`),
  CONSTRAINT `cptCodesPayment_ibfk_6` FOREIGN KEY (`accountThisPaymentIsBeingMadeToID`) REFERENCES `paymentAccountBeingMadeMaster` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157069 DEFAULT CHARSET=utf8;
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
