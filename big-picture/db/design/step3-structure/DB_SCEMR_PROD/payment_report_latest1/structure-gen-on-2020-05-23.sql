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
-- Temporary table structure for view `payment_report_latest1`
--

DROP TABLE IF EXISTS `payment_report_latest1`;
/*!50001 DROP VIEW IF EXISTS `payment_report_latest1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `payment_report_latest1` AS SELECT 
 1 AS `paymentTableId`,
 1 AS `cptCodeForAppointmentID`,
 1 AS `paymentAmountClaimedIncludingFinanceCharges`,
 1 AS `paymentAmountClaimedForSCExcludingFinanceCharges`,
 1 AS `paymentAmountReceived`,
 1 AS `paymentAmountBadDebt`,
 1 AS `transactionFee`,
 1 AS `tansactionID`,
 1 AS `paymentStatusID`,
 1 AS `paymentStatus`,
 1 AS `paymentMethodID`,
 1 AS `paymentMethod`,
 1 AS `paymentAccountThisPaymentIsBeingMadeFrom`,
 1 AS `paymentLast4DigitChargedCreditCardNo`,
 1 AS `entityResponsibleToMakeThisPaymentID`,
 1 AS `entityResponsibleToMakeThisPayment`,
 1 AS `insuranceUIDOnCreationDateIfClaimFilingIsRequired`,
 1 AS `nameOfInsuranceCompanyPaymentRecdFrom`,
 1 AS `eventId`,
 1 AS `isCptLocked`,
 1 AS `isPaymentLocked`,
 1 AS `cptCreatedAt`,
 1 AS `cptUpdatedAt`,
 1 AS `cptCreatedByUID`,
 1 AS `cptUpdatedByUID`,
 1 AS `paymentBadDebtUpdatedByUID`,
 1 AS `paymentBadDebtUpdatedByName`,
 1 AS `paymentBadDebtUpdatedOn`,
 1 AS `paymentBadDebtUpdatedOnTimeZone`,
 1 AS `paymentCreatedAt`,
 1 AS `paymentUpdatedAt`,
 1 AS `paymentCreatedByUID`,
 1 AS `paymentUpdatedByUID`,
 1 AS `financialInstitutionID`,
 1 AS `quickbookStatus`,
 1 AS `cptCreatedByFullName`,
 1 AS `cptUpdatedByFullName`,
 1 AS `paymentCreatedByFullName`,
 1 AS `paymentUpdatedByFullName`,
 1 AS `financialInstitutionName`,
 1 AS `paymentNotes`,
 1 AS `dateTheMoneyComeIntoSCAccount`,
 1 AS `bankPostDateOfOfficeAlly`,
 1 AS `paymentStatusOfClaimFiledOnBehalfOfPatient`,
 1 AS `claimLastSubmittedOn`,
 1 AS `claimLastSubmittedOnTimeZone`,
 1 AS `claimLastSubmittedByUID`,
 1 AS `claimLastSubmittedByFullName`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `payment_report_latest1`
--

/*!50001 DROP VIEW IF EXISTS `payment_report_latest1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `payment_report_latest1` AS (select `payment`.`id` AS `paymentTableId`,`payment`.`cptCodeForAppointmentID` AS `cptCodeForAppointmentID`,`payment`.`totalPaymentClaimedIncludingFinanceCharges` AS `paymentAmountClaimedIncludingFinanceCharges`,`payment`.`paymentClaimedForSCAcExcludingFinanceCharges` AS `paymentAmountClaimedForSCExcludingFinanceCharges`,`payment`.`paymentAmountInSCAccount` AS `paymentAmountReceived`,`payment`.`badDebtAmount` AS `paymentAmountBadDebt`,ifnull(`payment`.`transactionFee`,0) AS `transactionFee`,`payment`.`transactionIdProvidedByPaymentGateway` AS `tansactionID`,`payment`.`paymentStatusID` AS `paymentStatusID`,ifnull(`paymentStatus`.`statusAndMethod`,'') AS `paymentStatus`,`payment`.`paymentMethodID` AS `paymentMethodID`,ifnull(`paymentMethod`.`statusAndMethod`,'') AS `paymentMethod`,ifnull(`paymentAccount`.`name`,'') AS `paymentAccountThisPaymentIsBeingMadeFrom`,ifnull(right(`payment`.`chargedCCNumber`,4),NULL) AS `paymentLast4DigitChargedCreditCardNo`,`payment`.`entityResponsibleToMakeThisPayment` AS `entityResponsibleToMakeThisPaymentID`,ifnull(`entityResponsibleToSC`.`name`,'') AS `entityResponsibleToMakeThisPayment`,`payment`.`insuranceUIDOnCreationDateIfClaimFilingIsRequired` AS `insuranceUIDOnCreationDateIfClaimFilingIsRequired`,ifnull(concat_ws(' ',`insuranceCompany`.`firstName`,`insuranceCompany`.`lastName`),'') AS `nameOfInsuranceCompanyPaymentRecdFrom`,`cptCodesForAnAppointment`.`eventID` AS `eventId`,`cptCodesForAnAppointment`.`isThisEntityLockedAndHenceNonEditable` AS `isCptLocked`,`payment`.`isThisEntityLockedAndHenceNonEditable` AS `isPaymentLocked`,`cptCodesForAnAppointment`.`created_at` AS `cptCreatedAt`,`cptCodesForAnAppointment`.`updated_at` AS `cptUpdatedAt`,`cptCodesForAnAppointment`.`created_by` AS `cptCreatedByUID`,`cptCodesForAnAppointment`.`updated_by` AS `cptUpdatedByUID`,`payment`.`badDebtEntryDoneBy` AS `paymentBadDebtUpdatedByUID`,ifnull(concat_ws(' ',`badDebtUpdatedBy`.`firstName`,`badDebtUpdatedBy`.`middleName`,`badDebtUpdatedBy`.`lastName`),'') AS `paymentBadDebtUpdatedByName`,`payment`.`badDebtEntryDoneOn` AS `paymentBadDebtUpdatedOn`,`payment`.`badDebtEntryDoneOnTimeZone` AS `paymentBadDebtUpdatedOnTimeZone`,`payment`.`created_on` AS `paymentCreatedAt`,`payment`.`updated_on` AS `paymentUpdatedAt`,`payment`.`created_by` AS `paymentCreatedByUID`,`payment`.`updated_by` AS `paymentUpdatedByUID`,`payment`.`financialInstitutionID` AS `financialInstitutionID`,`payment`.`quickbookStatus` AS `quickbookStatus`,concat_ws(' ',`cptCreatedBy`.`firstName`,`cptCreatedBy`.`lastName`) AS `cptCreatedByFullName`,ifnull(concat_ws(' ',`cptUpdatedBy`.`firstName`,`cptUpdatedBy`.`lastName`),'') AS `cptUpdatedByFullName`,concat_ws(' ',`paymentCreatedBy`.`firstName`,`paymentCreatedBy`.`lastName`) AS `paymentCreatedByFullName`,ifnull(concat_ws(' ',`paymentUpdatedBy`.`firstName`,`paymentUpdatedBy`.`lastName`),'') AS `paymentUpdatedByFullName`,ifnull(concat_ws(' ',`financialInstitution`.`firstName`,`financialInstitution`.`lastName`),'') AS `financialInstitutionName`,ifnull(`payment`.`notes`,'') AS `paymentNotes`,`payment`.`dateOfTransactionInSCAccount` AS `dateTheMoneyComeIntoSCAccount`,`payment`.`bankPostDateOfOfficeAlly` AS `bankPostDateOfOfficeAlly`,ifnull(`payment`.`statusOfClaimFiledOnBehalfOfPatient`,'') AS `paymentStatusOfClaimFiledOnBehalfOfPatient`,`payment`.`claimLastSubmittedOn` AS `claimLastSubmittedOn`,`payment`.`claimLastSubmittedOnTimeZone` AS `claimLastSubmittedOnTimeZone`,`payment`.`claimLastSubmittedBy` AS `claimLastSubmittedByUID`,ifnull(concat_ws(' ',`claimLastSubmittedBy`.`firstName`,`claimLastSubmittedBy`.`middleName`,`claimLastSubmittedBy`.`lastName`),'') AS `claimLastSubmittedByFullName` from (((((((((((((`cptCodesPayment` `payment` left join `paymentAccountBeingMadeMaster` `paymentAccount` on((`paymentAccount`.`id` = `payment`.`accountThisPaymentIsBeingMadeToID`))) left join `cptCodesPaymentStatusMaster` `paymentStatus` on((`paymentStatus`.`id` = `payment`.`paymentStatusID`))) left join `cptCodesPaymentMethodMaster` `paymentMethod` on((`paymentMethod`.`id` = `payment`.`paymentMethodID`))) left join `cptPaymentEntityResponsibleToSCMaster` `entityResponsibleToSC` on((`entityResponsibleToSC`.`id` = `payment`.`entityResponsibleToMakeThisPayment`))) left join `users` `insuranceCompany` on((`insuranceCompany`.`id` = `payment`.`insuranceUIDOnCreationDateIfClaimFilingIsRequired`))) left join `users` `cptCreatedBy` on((`cptCreatedBy`.`id` = `payment`.`created_by`))) left join `users` `cptUpdatedBy` on((`cptUpdatedBy`.`id` = `payment`.`updated_by`))) left join `users` `paymentCreatedBy` on((`paymentCreatedBy`.`id` = `payment`.`created_by`))) left join `users` `paymentUpdatedBy` on((`paymentUpdatedBy`.`id` = `payment`.`updated_by`))) left join `users` `financialInstitution` on((`financialInstitution`.`id` = `payment`.`financialInstitutionID`))) left join `users` `badDebtUpdatedBy` on((`badDebtUpdatedBy`.`id` = `payment`.`badDebtEntryDoneBy`))) left join `users` `claimLastSubmittedBy` on((`claimLastSubmittedBy`.`id` = `payment`.`claimLastSubmittedBy`))) left join `cptCodesForAnAppointment` on((`cptCodesForAnAppointment`.`id` = `payment`.`cptCodeForAppointmentID`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
