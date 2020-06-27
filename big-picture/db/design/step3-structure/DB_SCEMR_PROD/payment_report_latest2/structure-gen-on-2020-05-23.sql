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
-- Temporary table structure for view `payment_report_latest2`
--

DROP TABLE IF EXISTS `payment_report_latest2`;
/*!50001 DROP VIEW IF EXISTS `payment_report_latest2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `payment_report_latest2` AS SELECT 
 1 AS `paymentID`,
 1 AS `eventID`,
 1 AS `eventTypeName`,
 1 AS `eventStatusName`,
 1 AS `uidOfCreatedBy`,
 1 AS `fullNameOfCreatedBy`,
 1 AS `startDateTime`,
 1 AS `endDateTime`,
 1 AS `durationInMinute`,
 1 AS `companyID`,
 1 AS `isEventLocked`,
 1 AS `assetID`,
 1 AS `assetName`,
 1 AS `billingStatus`,
 1 AS `cptCodeForAppointmentID`,
 1 AS `cptCodeName`,
 1 AS `cptCodeID`,
 1 AS `paymentAmountClaimedIncludingFinanceCharges`,
 1 AS `paymentAmountClaimedForSCExcludingFinanceCharges`,
 1 AS `paymentAmountTransactionFee`,
 1 AS `paymentMerchantOneTransactionID`,
 1 AS `paymentAccountThisPaymentIsBeingMadeFrom`,
 1 AS `paymentLast4DigitChargedCreditCardNo`,
 1 AS `paymentAmountReceived`,
 1 AS `paymentAmountBadDebt`,
 1 AS `paymentAmountRemaining`,
 1 AS `paymentStatus`,
 1 AS `paymentMethod`,
 1 AS `entityResponsibleToMakeThisPaymentID`,
 1 AS `isCptLocked`,
 1 AS `isPaymentLocked`,
 1 AS `cptCreatedAt`,
 1 AS `cptCreatedByUID`,
 1 AS `cptCreatedByFullName`,
 1 AS `cptUpdatedAt`,
 1 AS `cptUpdatedByUID`,
 1 AS `cptUpdatedByFullName`,
 1 AS `paymentBadDebtUpdatedOn`,
 1 AS `paymentBadDebtUpdatedOnTimeZone`,
 1 AS `paymentBadDebtUpdatedByUID`,
 1 AS `paymentBadDebtUpdatedByName`,
 1 AS `paymentCreatedAt`,
 1 AS `paymentCreatedByUID`,
 1 AS `paymentCreatedByFullName`,
 1 AS `paymentUpdatedAt`,
 1 AS `paymentUpdatedByUID`,
 1 AS `paymentUpdatedByFullName`,
 1 AS `financialInstitutionID`,
 1 AS `financialInstitutionName`,
 1 AS `quickbookStatus`,
 1 AS `paymentNotes`,
 1 AS `dateTheMoneyComeIntoSCAccount`,
 1 AS `bankPostDateOfOfficeAlly`,
 1 AS `paymentStatusOfClaimFiledOnBehalfOfPatient`,
 1 AS `nameOfInsuranceCompanyPaymentRecdFrom`,
 1 AS `uidOfInsuranceCompanyPaymentRecdFrom`,
 1 AS `claimLastSubmittedOn`,
 1 AS `claimLastSubmittedOnTimeZone`,
 1 AS `claimLastSubmittedByUID`,
 1 AS `claimLastSubmittedByFullName`,
 1 AS `cptAmountExpected`,
 1 AS `cptAmountReceived`,
 1 AS `cptAmountBadDebt`,
 1 AS `cptAmountRemaining`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `payment_report_latest2`
--

/*!50001 DROP VIEW IF EXISTS `payment_report_latest2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `payment_report_latest2` AS select `payment`.`id` AS `paymentID`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`eventID` AS `eventID`,`eventdetails`.`eventTypeName` AS `eventTypeName`,'' AS `eventStatusName`,`eventdetails`.`uidOfCreatedBy` AS `uidOfCreatedBy`,`eventdetails`.`fullNameOfCreatedBy` AS `fullNameOfCreatedBy`,`eventdetails`.`startDateTime` AS `startDateTime`,`eventdetails`.`endDateTime` AS `endDateTime`,`eventdetails`.`duration` AS `durationInMinute`,`eventdetails`.`companyID` AS `companyID`,`eventdetails`.`lockStatus` AS `isEventLocked`,`eventdetails`.`assetID` AS `assetID`,'' AS `assetName`,`eventdetails`.`billingStatus` AS `billingStatus`,`payment`.`cptCodeForAppointmentID` AS `cptCodeForAppointmentID`,`cptDetails`.`cptCodeName` AS `cptCodeName`,`cptDetails`.`cptCodeID` AS `cptCodeID`,`payment`.`totalPaymentClaimedIncludingFinanceCharges` AS `paymentAmountClaimedIncludingFinanceCharges`,`payment`.`paymentClaimedForSCAcExcludingFinanceCharges` AS `paymentAmountClaimedForSCExcludingFinanceCharges`,ifnull(`payment`.`transactionFee`,0) AS `paymentAmountTransactionFee`,`payment`.`transactionIdProvidedByPaymentGateway` AS `paymentMerchantOneTransactionID`,ifnull(`paymentAccount`.`name`,'') AS `paymentAccountThisPaymentIsBeingMadeFrom`,ifnull(right(`payment`.`chargedCCNumber`,4),NULL) AS `paymentLast4DigitChargedCreditCardNo`,`payment`.`paymentAmountInSCAccount` AS `paymentAmountReceived`,`payment`.`badDebtAmount` AS `paymentAmountBadDebt`,(`payment`.`totalPaymentClaimedIncludingFinanceCharges` - ifnull(`payment`.`transactionFee`,0)) AS `paymentAmountRemaining`,ifnull(`paymentStatus`.`statusAndMethod`,'') AS `paymentStatus`,ifnull(`paymentMethod`.`statusAndMethod`,'') AS `paymentMethod`,`payment`.`entityResponsibleToMakeThisPayment` AS `entityResponsibleToMakeThisPaymentID`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`isThisEntityLockedAndHenceNonEditable` AS `isCptLocked`,`payment`.`isThisEntityLockedAndHenceNonEditable` AS `isPaymentLocked`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`created_at` AS `cptCreatedAt`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`created_by` AS `cptCreatedByUID`,concat_ws(' ',`cptCreatedBy`.`firstName`,`cptCreatedBy`.`lastName`) AS `cptCreatedByFullName`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`updated_at` AS `cptUpdatedAt`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`updated_by` AS `cptUpdatedByUID`,ifnull(concat_ws(' ',`cptUpdatedBy`.`firstName`,`cptUpdatedBy`.`lastName`),'') AS `cptUpdatedByFullName`,`payment`.`badDebtEntryDoneOn` AS `paymentBadDebtUpdatedOn`,`payment`.`badDebtEntryDoneOnTimeZone` AS `paymentBadDebtUpdatedOnTimeZone`,`payment`.`badDebtEntryDoneBy` AS `paymentBadDebtUpdatedByUID`,ifnull(concat_ws(' ',`badDebtUpdatedBy`.`firstName`,`badDebtUpdatedBy`.`middleName`,`badDebtUpdatedBy`.`lastName`),'') AS `paymentBadDebtUpdatedByName`,`payment`.`created_on` AS `paymentCreatedAt`,`payment`.`created_by` AS `paymentCreatedByUID`,concat_ws(' ',`paymentCreatedBy`.`firstName`,`paymentCreatedBy`.`lastName`) AS `paymentCreatedByFullName`,`payment`.`updated_on` AS `paymentUpdatedAt`,`payment`.`updated_by` AS `paymentUpdatedByUID`,ifnull(concat_ws(' ',`paymentUpdatedBy`.`firstName`,`paymentUpdatedBy`.`lastName`),'') AS `paymentUpdatedByFullName`,`payment`.`financialInstitutionID` AS `financialInstitutionID`,ifnull(concat_ws(' ',`financialInstitution`.`firstName`,`financialInstitution`.`lastName`),'') AS `financialInstitutionName`,`payment`.`quickbookStatus` AS `quickbookStatus`,ifnull(`payment`.`notes`,'') AS `paymentNotes`,`payment`.`dateOfTransactionInSCAccount` AS `dateTheMoneyComeIntoSCAccount`,`payment`.`bankPostDateOfOfficeAlly` AS `bankPostDateOfOfficeAlly`,ifnull(`payment`.`statusOfClaimFiledOnBehalfOfPatient`,'') AS `paymentStatusOfClaimFiledOnBehalfOfPatient`,(case when (`payment`.`entityResponsibleToMakeThisPayment` <> 1) then ifnull(concat_ws(' ',`insuranceCompany`.`firstName`,`insuranceCompany`.`lastName`),'') else NULL end) AS `nameOfInsuranceCompanyPaymentRecdFrom`,(case when (`payment`.`entityResponsibleToMakeThisPayment` <> 1) then `payment`.`insuranceUIDOnCreationDateIfClaimFilingIsRequired` else NULL end) AS `uidOfInsuranceCompanyPaymentRecdFrom`,`payment`.`claimLastSubmittedOn` AS `claimLastSubmittedOn`,`payment`.`claimLastSubmittedOnTimeZone` AS `claimLastSubmittedOnTimeZone`,`payment`.`claimLastSubmittedBy` AS `claimLastSubmittedByUID`,ifnull(concat_ws(' ',`claimLastSubmittedBy`.`firstName`,`claimLastSubmittedBy`.`middleName`,`claimLastSubmittedBy`.`lastName`),'') AS `claimLastSubmittedByFullName`,`cptDetails`.`cptAmountExpected` AS `cptAmountExpected`,`cptDetails`.`cptAmountReceived` AS `cptAmountReceived`,`cptDetails`.`cptAmountBadDebt` AS `cptAmountBadDebt`,`cptDetails`.`cptAmountRemaining` AS `cptAmountRemaining` from (((((((((((((((`DB_SCEMR_PROD`.`cptCodesPayment` `payment` left join `DB_SCEMR_PROD`.`paymentAccountBeingMadeMaster` `paymentAccount` on((`paymentAccount`.`id` = `payment`.`accountThisPaymentIsBeingMadeToID`))) left join `DB_SCEMR_PROD`.`cptCodesPaymentStatusMaster` `paymentStatus` on((`paymentStatus`.`id` = `payment`.`paymentStatusID`))) left join `DB_SCEMR_PROD`.`cptCodesPaymentMethodMaster` `paymentMethod` on((`paymentMethod`.`id` = `payment`.`paymentMethodID`))) left join `DB_SCEMR_PROD`.`cptPaymentEntityResponsibleToSCMaster` `entityResponsibleToSC` on((`entityResponsibleToSC`.`id` = `payment`.`entityResponsibleToMakeThisPayment`))) left join `DB_SCEMR_PROD`.`users` `insuranceCompany` on((`insuranceCompany`.`id` = `payment`.`insuranceUIDOnCreationDateIfClaimFilingIsRequired`))) left join `DB_SCEMR_PROD`.`users` `cptCreatedBy` on((`cptCreatedBy`.`id` = `payment`.`created_by`))) left join `DB_SCEMR_PROD`.`users` `cptUpdatedBy` on((`cptUpdatedBy`.`id` = `payment`.`updated_by`))) left join `DB_SCEMR_PROD`.`users` `paymentCreatedBy` on((`paymentCreatedBy`.`id` = `payment`.`created_by`))) left join `DB_SCEMR_PROD`.`users` `paymentUpdatedBy` on((`paymentUpdatedBy`.`id` = `payment`.`updated_by`))) left join `DB_SCEMR_PROD`.`users` `financialInstitution` on((`financialInstitution`.`id` = `payment`.`financialInstitutionID`))) left join `DB_SCEMR_PROD`.`users` `badDebtUpdatedBy` on((`badDebtUpdatedBy`.`id` = `payment`.`badDebtEntryDoneBy`))) left join `DB_SCEMR_PROD`.`users` `claimLastSubmittedBy` on((`claimLastSubmittedBy`.`id` = `payment`.`claimLastSubmittedBy`))) left join `DB_SCEMR_PROD`.`cptCodesForAnAppointment` on((`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`id` = `payment`.`cptCodeForAppointmentID`))) left join (select `cpt`.`cptAmountExpected` AS `cptAmountExpected`,`cpt`.`cptAmountReceived` AS `cptAmountReceived`,`cpt`.`cptAmountBadDebt` AS `cptAmountBadDebt`,`cpt`.`eventID` AS `eventID`,`cpt`.`cptCodeID` AS `cptCodeID`,`cpt`.`cptCodeName` AS `cptCodeName`,(`cpt`.`cptAmountExpected` - (`cpt`.`cptAmountReceived` + `cpt`.`cptAmountBadDebt`)) AS `cptAmountRemaining` from (select `DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`cptCodeAmountExpectedAsPerContractOnCodingDate` AS `cptAmountExpected`,round(sum(`DB_SCEMR_PROD`.`cptCodesPayment`.`paymentAmountInSCAccount`),2) AS `cptAmountReceived`,round(sum(`DB_SCEMR_PROD`.`cptCodesPayment`.`badDebtAmount`),2) AS `cptAmountBadDebt`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`eventID` AS `eventID`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`cptCodeID` AS `cptCodeID`,`DB_SCEMR_PROD`.`cptCodesMaster`.`name` AS `cptCodeName` from ((`DB_SCEMR_PROD`.`cptCodesForAnAppointment` join `DB_SCEMR_PROD`.`cptCodesPayment` on((`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`id` = `DB_SCEMR_PROD`.`cptCodesPayment`.`cptCodeForAppointmentID`))) left join `DB_SCEMR_PROD`.`cptCodesMaster` on((`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`cptCodeID` = `DB_SCEMR_PROD`.`cptCodesMaster`.`id`))) group by `DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`eventID`,`DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`cptCodeID`) `cpt`) `cptDetails` on(((`payment`.`cptCodeForAppointmentID` = `cptDetails`.`cptCodeID`) and (`cptDetails`.`eventID` is not null) and (`cptDetails`.`cptCodeID` is not null)))) left join (select `events`.`eventID` AS `eventID`,`DB_SCEMR_PROD`.`remForEventTypeAppointmentDetails`.`billingStatusOfThisAppointment` AS `billingStatus`,`mEventType`.`name` AS `eventTypeName`,`events`.`uidOfCreatedBy` AS `uidOfCreatedBy`,concat_ws(' ',`eventUsers`.`firstName`,`eventUsers`.`lastName`) AS `fullNameOfCreatedBy`,`events`.`startDateTime` AS `startDateTime`,`events`.`endDateTime` AS `endDateTime`,`events`.`companyID` AS `companyID`,timestampdiff(MINUTE,`events`.`startDateTime`,`events`.`endDateTime`) AS `duration`,`events`.`isItLocked` AS `lockStatus`,`eventAsset`.`assetID` AS `assetID` from ((((`DB_SCEMR_PROD`.`remEvents` `events` join `DB_SCEMR_PROD`.`users` `eventUsers` on((`events`.`uidOfCreatedBy` = `eventUsers`.`id`))) join `DB_SCEMR_PROD`.`remMasterEventTypes` `mEventType` on((`events`.`eventTypeID` = `mEventType`.`id`))) left join `DB_SCEMR_PROD`.`remEventAssets` `eventAsset` on((`eventAsset`.`eventID` = `events`.`eventID`))) join `DB_SCEMR_PROD`.`remForEventTypeAppointmentDetails` on((`DB_SCEMR_PROD`.`remForEventTypeAppointmentDetails`.`eventID` = `events`.`eventID`))) order by `events`.`eventID`) `eventdetails` on((`eventdetails`.`eventID` = `DB_SCEMR_PROD`.`cptCodesForAnAppointment`.`eventID`))) */;
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
