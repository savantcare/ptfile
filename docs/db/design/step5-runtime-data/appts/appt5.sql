
--
-- Mock data for fifth Appointment
--

--
-- Insert AFA event
--

INSERT INTO `DB_SCEMR_PROD`.`remEvents` (`eventID`, `publicUniqueEventId`, `managedByRecurringEventParentID`, `eventTypeID`, `uidOfCreatedBy`, `title`, `startDateTime`, `endDateTime`, `locationOfThisEvent`, `cacheFieldCronCreatedForEventTimeZone`, `companyID`, `isItLocked`, `isNoteContainerMinimized`, `checkin_status`, `checkingUpdatedAt`, `created_at`, `updated_at`, `uidOfUpdatedBy`, `timeZoneForCreatedAt`, `timeZoneForUpdatedAt`, `isCached`, `priority`, `googleCalendarEventID`, `startDateTimeOfIntake`, `startTimeZoneOfIntake`, `isPreferredBunching`, `timeSpent`, `maxAllowedTime`, `minAllowedTime`, `isSurveyLinkSent`) VALUES ('9', NULL, NULL, '11', '548', 'Appointment slot', '2020-02-07 09:00:00', '2020-02-07 10:00:00', '4966 El Camino Real%*Unit 224%*Los Altos, CA 94022%*United States', NULL, '3', 'no', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'Green', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no');

--
-- Insert status of AFA event
--

INSERT INTO `DB_SCEMR_PROD`.`remEventStatusChronology` (`id`, `eventID`, `eventStatusID`, `uidOfStatusSetBy`, `created_at`, `updated_at`, `timeZoneAbbreviationForCreated_at`) VALUES (NULL, '9', '21', '548', CURRENT_TIMESTAMP, NULL, NULL);

--
-- Insert host of AFA event
--

INSERT INTO `DB_SCEMR_PROD`.`remEventAttendees` (`id`, `eventID`, `uid`, `isThisUserHost`, `created_at`, `updated_at`) VALUES (NULL, '9', '548', '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

--
-- Insert location of AFA event
--

INSERT INTO `DB_SCEMR_PROD`.`remEventLocations` (`mappingID`, `eventID`, `locationID`, `createdByUid`, `createdOn`, `createdOnTimezone`) VALUES (NULL, '9', '1', '548', '2020-02-03 00:00:00', NULL);

--
-- Insert room of AFA event
--

INSERT INTO `DB_SCEMR_PROD`.`remEventAssets` (`id`, `eventID`, `assetID`, `created_at`, `updated_at`) VALUES (NULL, '9', '1', CURRENT_TIMESTAMP, '2020-02-03 00:00:00');



--
-- Insert Appointment event
--

INSERT INTO `DB_SCEMR_PROD`.`remEvents` (`eventID`, `publicUniqueEventId`, `managedByRecurringEventParentID`, `eventTypeID`, `uidOfCreatedBy`, `title`, `startDateTime`, `endDateTime`, `locationOfThisEvent`, `cacheFieldCronCreatedForEventTimeZone`, `companyID`, `isItLocked`, `isNoteContainerMinimized`, `checkin_status`, `checkingUpdatedAt`, `created_at`, `updated_at`, `uidOfUpdatedBy`, `timeZoneForCreatedAt`, `timeZoneForUpdatedAt`, `isCached`, `priority`, `googleCalendarEventID`, `startDateTimeOfIntake`, `startTimeZoneOfIntake`, `isPreferredBunching`, `timeSpent`, `maxAllowedTime`, `minAllowedTime`, `isSurveyLinkSent`) VALUES ('10', NULL, NULL, '1', '548', 'Appointment slot', '2020-02-07 09:00:00', '2020-02-07 10:00:00', '4966 El Camino Real%*Unit 224%*Los Altos, CA 94022%*United States', NULL, '3', 'no', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 'Green', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no');

--
-- Insert status of Appointment event
--

INSERT INTO `DB_SCEMR_PROD`.`remEventStatusChronology` (`id`, `eventID`, `eventStatusID`, `uidOfStatusSetBy`, `created_at`, `updated_at`, `timeZoneAbbreviationForCreated_at`) VALUES (NULL, '10', '2', '548', CURRENT_TIMESTAMP, NULL, NULL);

--
-- Insert host of Appointment event
--

INSERT INTO `DB_SCEMR_PROD`.`remEventAttendees` (`id`, `eventID`, `uid`, `isThisUserHost`, `created_at`, `updated_at`) VALUES (NULL, '10', '548', '1', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

--
-- Insert attendee of Appointment event
--

INSERT INTO `DB_SCEMR_PROD`.`remEventAttendees` (`id`, `eventID`, `uid`, `isThisUserHost`, `created_at`, `updated_at`) VALUES (NULL, '10', '4740', '0', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


--
-- Insert room of Appointment event
--

INSERT INTO `DB_SCEMR_PROD`.`remEventAssets` (`id`, `eventID`, `assetID`, `created_at`, `updated_at`) VALUES (NULL, '10', '1', CURRENT_TIMESTAMP, '2020-02-03 00:00:00');