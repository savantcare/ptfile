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
-- Table structure for table `temp_payment_report`
--

DROP TABLE IF EXISTS `temp_payment_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_payment_report` (
  `paymentTableId` int(11) unsigned NOT NULL DEFAULT '0',
  `cptCodeForAppointmentID` int(11) unsigned NOT NULL,
  `paymentAmountClaimedIncludingFinanceCharges` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paymentAmountClaimedForSCExcludingFinanceCharges` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paymentAmountReceived` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paymentAmountBadDebt` decimal(10,2) NOT NULL DEFAULT '0.00',
  `transactionFee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tansactionID` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `paymentStatusID` tinyint(4) unsigned DEFAULT NULL,
  `paymentStatus` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `paymentMethodID` tinyint(4) unsigned DEFAULT NULL,
  `paymentMethod` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `paymentAccountThisPaymentIsBeingMadeFrom` varchar(255) NOT NULL DEFAULT '',
  `paymentLast4DigitChargedCreditCardNo` varchar(4) CHARACTER SET utf8 DEFAULT NULL,
  `entityResponsibleToMakeThisPaymentID` tinyint(4) unsigned DEFAULT NULL,
  `entityResponsibleToMakeThisPayment` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `insuranceUIDOnCreationDateIfClaimFilingIsRequired` int(11) unsigned DEFAULT NULL,
  `nameOfInsuranceCompanyPaymentRecdFrom` varchar(257) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `eventId` int(11) unsigned DEFAULT NULL,
  `isCptLocked` enum('Yes','No') CHARACTER SET utf8,
  `isPaymentLocked` enum('Yes','No') CHARACTER SET utf8 NOT NULL DEFAULT 'No',
  `cptCreatedAt` datetime DEFAULT NULL,
  `cptUpdatedAt` datetime DEFAULT NULL,
  `cptCreatedByUID` int(11) unsigned DEFAULT NULL,
  `cptUpdatedByUID` int(11) unsigned DEFAULT NULL,
  `paymentBadDebtUpdatedByUID` int(11) DEFAULT NULL,
  `paymentBadDebtUpdatedByName` text CHARACTER SET utf8 NOT NULL,
  `paymentBadDebtUpdatedOn` datetime DEFAULT NULL,
  `paymentBadDebtUpdatedOnTimeZone` varchar(255) DEFAULT NULL,
  `paymentCreatedAt` datetime NOT NULL,
  `paymentUpdatedAt` datetime DEFAULT NULL,
  `paymentCreatedByUID` int(11) unsigned DEFAULT NULL,
  `paymentUpdatedByUID` int(11) DEFAULT NULL,
  `financialInstitutionID` int(11) unsigned DEFAULT NULL,
  `quickbookStatus` enum('Step 1: Data not entered','Step 2: Data entered but not matching with financial institution','Step 3: Data entered and matching with financial institution') CHARACTER SET utf8 DEFAULT NULL,
  `cptCreatedByFullName` varchar(257) CHARACTER SET utf8 DEFAULT NULL,
  `cptUpdatedByFullName` varchar(257) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `paymentCreatedByFullName` varchar(257) CHARACTER SET utf8 DEFAULT NULL,
  `paymentUpdatedByFullName` varchar(257) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `financialInstitutionName` varchar(257) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `paymentNotes` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `dateTheMoneyComeIntoSCAccount` date DEFAULT NULL,
  `bankPostDateOfOfficeAlly` date DEFAULT NULL,
  `paymentStatusOfClaimFiledOnBehalfOfPatient` varchar(72) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `claimLastSubmittedOn` datetime DEFAULT NULL,
  `claimLastSubmittedOnTimeZone` varchar(255) DEFAULT NULL,
  `claimLastSubmittedByUID` int(11) DEFAULT NULL,
  `claimLastSubmittedByFullName` text CHARACTER SET utf8 NOT NULL
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
