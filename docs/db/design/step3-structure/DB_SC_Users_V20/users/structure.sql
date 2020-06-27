-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: May 25, 2020 at 05:36 PM
-- Server version: 10.4.13-MariaDB-1:10.4.13+maria~bionic
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DB_SC_Users_V20`
--

-- --------------------------------------------------------

--
-- Table structure for table `userActiveTabDetails`
--
use DB_SC_Users_V20;

CREATE TABLE `userActiveTabDetails` (
  `id` int(11) NOT NULL,
  `providerId` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `currentScreen` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userAssociationBetweenDoctorAndDoctorAdmin`
--

CREATE TABLE `userAssociationBetweenDoctorAndDoctorAdmin` (
  `id` int(11) UNSIGNED NOT NULL,
  `uidOfDoctor` int(11) UNSIGNED NOT NULL,
  `uidOfDoctorsAdmin` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userAssociationMasterTypes`
--

CREATE TABLE `userAssociationMasterTypes` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(55) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userAssociationRooms`
--

CREATE TABLE `userAssociationRooms` (
  `id` int(11) NOT NULL,
  `roomId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `status` enum('Active','Inactive','Rejected','Invited') NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userChat`
--

CREATE TABLE `userChat` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `senderId` int(11) UNSIGNED NOT NULL,
  `receiverId` int(11) UNSIGNED NOT NULL,
  `flag` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userDateOfBirth`
--

CREATE TABLE `userDateOfBirth` (
  `id` int(11) UNSIGNED NOT NULL,
  `uidOfPatient` int(11) UNSIGNED NOT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `dateOfBirthNotes` text DEFAULT NULL,
  `firstParentID` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `createdByUID` int(11) UNSIGNED DEFAULT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedByUID` int(11) UNSIGNED DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(20) DEFAULT NULL,
  `discontinuedByUID` int(11) UNSIGNED DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userEmailAddressesExtraOverLoginEmail`
--

CREATE TABLE `userEmailAddressesExtraOverLoginEmail` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED DEFAULT 0,
  `emailAddressTypeID` tinyint(4) UNSIGNED DEFAULT 0 COMMENT 'type id comes from contactsEmailAddressMasterTypes',
  `emailAddress` varchar(128) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedTimeZone` varchar(100) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(100) DEFAULT NULL,
  `notes` text NOT NULL,
  `discontinuedOnDate` datetime DEFAULT NULL,
  `isDeleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ok by VK on 28/7';

-- --------------------------------------------------------

--
-- Table structure for table `userGender`
--

CREATE TABLE `userGender` (
  `id` int(11) UNSIGNED NOT NULL,
  `uidOfPatient` int(11) UNSIGNED NOT NULL,
  `genderTypeID` tinyint(1) DEFAULT NULL,
  `firstParentID` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `createdByUID` int(11) UNSIGNED DEFAULT NULL,
  `createdOnDateTime` datetime DEFAULT NULL,
  `createdOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedByUID` int(11) UNSIGNED DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(20) DEFAULT NULL,
  `deletedByUID` int(11) UNSIGNED DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) DEFAULT NULL,
  `deletedFromIPAddress` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userOptimisedProfileImages`
--

CREATE TABLE `userOptimisedProfileImages` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `imageName` varchar(255) DEFAULT NULL,
  `binaryContentOfImageFile` longblob DEFAULT NULL,
  `imageCapturedDateTime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreatedAt` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForUpdated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='created for ad pages';

-- --------------------------------------------------------

--
-- Table structure for table `userOtherDetails`
--

CREATE TABLE `userOtherDetails` (
  `userID` int(11) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `sourceUserDetailsUrl` text DEFAULT NULL,
  `fetchedRowData` longtext DEFAULT NULL,
  `createdOnDateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userPhoneExtension`
--

CREATE TABLE `userPhoneExtension` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `extension` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userPhoneNumbers`
--

CREATE TABLE `userPhoneNumbers` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED DEFAULT 0,
  `phoneNumberTypeID` tinyint(4) UNSIGNED DEFAULT 0 COMMENT 'the type id comes from contactPhoneNumberMasterTypes',
  `phoneNumber` varchar(128) NOT NULL DEFAULT '',
  `countryDialCode` varchar(4) DEFAULT '1',
  `isDeleted` enum('No','Yes') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(100) DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(100) DEFAULT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ok by VK on 27/6. Doc: Say a user has a cell phone and a work phone. So for that uid there will be 2 entries in the userPhoneNumbers table';

-- --------------------------------------------------------

--
-- Table structure for table `userProfileImages`
--

CREATE TABLE `userProfileImages` (
  `id` int(11) UNSIGNED NOT NULL,
  `profileImageUniqueId` varchar(36) DEFAULT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `imageName` varchar(255) DEFAULT NULL,
  `binaryContentOfImageFile` longblob DEFAULT NULL,
  `imageCapturedDateTime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreatedAt` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForUpdated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ok by VK on 28/7';

-- --------------------------------------------------------

--
-- Table structure for table `userProfileImagesBack`
--

CREATE TABLE `userProfileImagesBack` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `imageName` varchar(255) DEFAULT NULL,
  `binaryContentOfImageFile` longblob DEFAULT NULL,
  `imageCapturedDateTime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreatedAt` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForUpdated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ok by VK on 28/7';

-- --------------------------------------------------------

--
-- Table structure for table `userProfileImages_backup`
--

CREATE TABLE `userProfileImages_backup` (
  `id` int(11) UNSIGNED NOT NULL,
  `profileImageUniqueId` varchar(36) DEFAULT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `imageName` varchar(255) DEFAULT NULL,
  `binaryContentOfImageFile` longblob DEFAULT NULL,
  `imageCapturedDateTime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreatedAt` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForUpdated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ok by VK on 28/7';

-- --------------------------------------------------------

--
-- Table structure for table `userReportCustomFilters`
--

CREATE TABLE `userReportCustomFilters` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_custom_state` text NOT NULL,
  `created_by` int(11) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL,
  `lastAccessedOn` datetime DEFAULT NULL,
  `timeZoneForLastAccessedOn` varchar(255) DEFAULT NULL,
  `noOfTimesAccessed` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userReportSummaries`
--

CREATE TABLE `userReportSummaries` (
  `summaryReportID` int(11) UNSIGNED NOT NULL,
  `summaryReportName` varchar(255) NOT NULL,
  `customReportID` int(11) UNSIGNED NOT NULL,
  `fieldNamesUsedInSummaryReportStoredAsCSV` text NOT NULL,
  `uidOfCreatedBy` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userReportSummaryStates`
--

CREATE TABLE `userReportSummaryStates` (
  `stateID` int(11) UNSIGNED NOT NULL,
  `summaryReportID` int(11) NOT NULL,
  `stateName` varchar(255) NOT NULL,
  `stateConfigurationObject` text NOT NULL,
  `isStateLocked` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `uidOfCreatedBy` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `timeZoneForCreatedAt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userRoleTypesMaster`
--

CREATE TABLE `userRoleTypesMaster` (
  `id` tinyint(4) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `securityLevel` int(5) DEFAULT 1,
  `roleType` enum('Internal','External') NOT NULL DEFAULT 'External',
  `companyID` int(11) UNSIGNED DEFAULT NULL,
  `isThisUserTypeInternal` tinyint(1) UNSIGNED DEFAULT 0 COMMENT '0 is for no 1 is for yes',
  `isThisAllowedForPublicAccess` enum('yes','no') NOT NULL DEFAULT 'no',
  `isBookingAndPatientHourAllowed` enum('yes','no') NOT NULL DEFAULT 'no',
  `isPubliclyViewable` enum('yes','no') NOT NULL DEFAULT 'no',
  `isPatientLoginAllowed` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `isEmrLoginAllowed` enum('yes','no') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ok by VK on 27/6';

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uuid`  CHAR(36) NOT NULL,
  `facebookID` text DEFAULT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `wikiUid` varchar(255) DEFAULT NULL,
  `wikiPass` varchar(255) DEFAULT NULL,
  `roleID` tinyint(4) UNSIGNED DEFAULT NULL,
  `genderTypeID` tinyint(4) UNSIGNED DEFAULT NULL,
  `firstName` varchar(128) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(128) DEFAULT NULL,
  `lastNameInitial` varchar(128) DEFAULT NULL,
  `namePrefix` varchar(100) DEFAULT NULL,
  `nameSuffix` varchar(256) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not deleted, 1: deleted',
  `companyID` int(11) UNSIGNED DEFAULT NULL,
  `emailValidatedOn` datetime DEFAULT NULL,
  `emailValidationCode` varchar(6) DEFAULT NULL,
  `forgotPasswordAccessToken` varchar(255) DEFAULT NULL,
  `allowedToLogin` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `allowedToMasterDB` enum('Yes','No') NOT NULL DEFAULT 'No',
  `dateOfBirth` date DEFAULT NULL COMMENT 'On 19th sept 2015 changed from 2 seperate tables to reduce complexity',
  `dateOfBirthNotes` text DEFAULT NULL,
  `preferredTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `uidOfCreatedBy` int(11) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreated_at` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForUpdated_at` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `isCachedForUserReport` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Not Cached, 1 = Cached',
  `numberOfLoggedIn` tinyint(11) NOT NULL DEFAULT 0,
  `lastLoggedIn` datetime DEFAULT NULL,
  `timeZoneAbbreviationOfLastLoggedIn` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `TFASecretCode` varchar(50) DEFAULT NULL,
  `receiveOTPByUsing` enum('GoogleAuthenticator','SMS') DEFAULT NULL,
  `uidOfTFASecretCodeUpdatedBy` int(11) UNSIGNED DEFAULT NULL,
  `forgotPasswordSecretCodeViaSMS` varchar(6) DEFAULT NULL,
  `isIntakeComplete` enum('yes','no') DEFAULT NULL,
  `isUserVisibleOnBookingSystem` enum('Yes','No') NOT NULL DEFAULT 'No',
  `googleCalendarID` varchar(255) DEFAULT NULL,
  `otpForMobileAppsLogin` varchar(10) DEFAULT NULL,
  `otpForMobileAppsLastUpdatedOn` datetime DEFAULT NULL,
  `associatedCalendarColorCode` varchar(10) DEFAULT NULL,
  `sentDataToGoogleCalender` enum('yes','no') NOT NULL DEFAULT 'yes',
  `recieveDataFromGoogleCalender` enum('yes','no') NOT NULL DEFAULT 'yes',
  `snapShot` longblob DEFAULT NULL,
  `snapShotTime` datetime DEFAULT NULL,
  `skypeId` varchar(255) DEFAULT NULL,
  `facetimeId` varchar(255) DEFAULT NULL,
  `userSignUpSource` varchar(100) DEFAULT NULL,
  `temporaryDisableTFACurrentStatus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ok by VK on 28/7';

-- --------------------------------------------------------

--
-- Table structure for table `usersAdditionalInfo`
--

CREATE TABLE `usersAdditionalInfo` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `isLoginSuspendedDueToManyAttempts` enum('Yes','No') NOT NULL DEFAULT 'No',
  `rocketChatId` varchar(100) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdAtTimezone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usersAssociatedWithDoctor`
--

CREATE TABLE `usersAssociatedWithDoctor` (
  `id` int(11) NOT NULL,
  `uidOfDoctor` int(11) UNSIGNED NOT NULL,
  `uidOfAssociatedUser` int(11) UNSIGNED NOT NULL,
  `userAssociationMasterTypeId` tinyint(3) UNSIGNED NOT NULL,
  `timezoneAbbreviation` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usersCareerHighlights`
--

CREATE TABLE `usersCareerHighlights` (
  `id` int(11) NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `uidOfLoggedInUser` int(11) UNSIGNED NOT NULL,
  `detail` varchar(255) NOT NULL,
  `timezoneAbbreviation` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userSelectedOptionForIntakeDetailData`
--

CREATE TABLE `userSelectedOptionForIntakeDetailData` (
  `id` int(11) NOT NULL,
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
  `initialPurposeOfVisit` text DEFAULT NULL,
  `onGoingMedications` text DEFAULT NULL,
  `pastMedications` text DEFAULT NULL,
  `specialNeedsRequired` enum('yes','no') DEFAULT NULL,
  `additionalNote` varchar(255) DEFAULT NULL,
  `canAffordCopay` enum('yes','no') DEFAULT NULL,
  `isTmsOnly` enum('yes','no') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userSession`
--

CREATE TABLE `userSession` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL,
  `localIpAddress` varchar(32) NOT NULL,
  `sessionData` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userSettings`
--

CREATE TABLE `userSettings` (
  `id` int(11) UNSIGNED NOT NULL,
  `settingsTypeId` int(11) NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userSettingsTypeMaster`
--

CREATE TABLE `userSettingsTypeMaster` (
  `id` int(11) NOT NULL,
  `settingsTypeName` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usersExpertiseDetails`
--

CREATE TABLE `usersExpertiseDetails` (
  `id` int(11) NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL,
  `uidOfLoggedInUser` int(11) UNSIGNED NOT NULL,
  `detail` varchar(255) NOT NULL,
  `timezoneAbbreviation` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usersMeditationsHistory`
--

CREATE TABLE `usersMeditationsHistory` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `meditateTime` int(11) NOT NULL,
  `sessionOm` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userSocialAccountInformation`
--

CREATE TABLE `userSocialAccountInformation` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `socialAccountTypeId` int(11) DEFAULT NULL,
  `socialAccountAddress` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `discontinuedOnDate` datetime DEFAULT NULL,
  `isDeleted` enum('No','Yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userSocialAddressMasterType`
--

CREATE TABLE `userSocialAddressMasterType` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usersRooms`
--

CREATE TABLE `usersRooms` (
  `id` int(11) NOT NULL,
  `roomName` varchar(255) NOT NULL,
  `createdUserId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usersTempForImportFromDrupal`
--

CREATE TABLE `usersTempForImportFromDrupal` (
  `uid` int(11) UNSIGNED NOT NULL,
  `drupalUID` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userStreetAddresses`
--

CREATE TABLE `userStreetAddresses` (
  `id` int(11) UNSIGNED NOT NULL,
  `firstParentId` int(11) UNSIGNED DEFAULT NULL,
  `publicUniqueAddressId` varchar(36) DEFAULT NULL,
  `uid` int(11) UNSIGNED DEFAULT 0,
  `createdById` int(11) DEFAULT NULL,
  `addressLine1` varchar(128) DEFAULT NULL,
  `addressLine2` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `zipCode` varchar(128) DEFAULT NULL,
  `streetAddressTypeID` tinyint(4) UNSIGNED DEFAULT NULL COMMENT 'For typeID use: contactStreetAddressMasterTypes',
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(20) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deletedFromIPAddress` varchar(20) DEFAULT NULL,
  `originId` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ok by VK on 30/7';

-- --------------------------------------------------------

--
-- Table structure for table `userStreetAddresses_bak`
--

CREATE TABLE `userStreetAddresses_bak` (
  `id` int(11) UNSIGNED NOT NULL,
  `publicUniqueAddressId` varchar(36) DEFAULT NULL,
  `uid` int(11) UNSIGNED DEFAULT 0,
  `createdById` int(11) DEFAULT NULL,
  `addressLine1` varchar(128) DEFAULT NULL,
  `addressLine2` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `country` varchar(128) DEFAULT NULL,
  `zipCode` varchar(128) DEFAULT NULL,
  `streetAddressTypeID` tinyint(4) UNSIGNED DEFAULT NULL COMMENT 'For typeID use: contactStreetAddressMasterTypes',
  `discontinuedByUID` int(11) DEFAULT NULL,
  `discontinuedOnDateTime` datetime DEFAULT NULL,
  `discontinuedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `discontinuedFromIPAddress` varchar(20) DEFAULT NULL,
  `deletedByUID` int(11) DEFAULT NULL,
  `deletedOnDateTime` datetime DEFAULT NULL,
  `deletedOnTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deletedFromIPAddress` varchar(20) DEFAULT NULL,
  `originId` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ok by VK on 30/7';

-- --------------------------------------------------------

--
-- Table structure for table `users_bk`
--

CREATE TABLE `users_bk` (
  `id` int(11) UNSIGNED NOT NULL,
  `publicUniqueId` varchar(36) DEFAULT NULL,
  `facebookID` text DEFAULT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `wikiUid` varchar(255) DEFAULT NULL,
  `wikiPass` varchar(255) DEFAULT NULL,
  `roleID` tinyint(4) UNSIGNED DEFAULT NULL,
  `genderTypeID` tinyint(4) UNSIGNED DEFAULT NULL,
  `firstName` varchar(128) DEFAULT NULL,
  `middleName` varchar(255) DEFAULT NULL,
  `lastName` varchar(128) DEFAULT NULL,
  `fullLastName` varchar(128) DEFAULT NULL,
  `namePrefix` varchar(100) DEFAULT NULL,
  `nameSuffix` varchar(256) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not deleted, 1: deleted',
  `companyID` int(11) UNSIGNED DEFAULT NULL,
  `emailValidatedOn` datetime DEFAULT NULL,
  `emailValidationCode` varchar(6) DEFAULT NULL,
  `forgotPasswordAccessToken` varchar(255) DEFAULT NULL,
  `allowedToLogin` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `allowedToMasterDB` enum('Yes','No') NOT NULL DEFAULT 'No',
  `dateOfBirth` date DEFAULT NULL COMMENT 'On 19th sept 2015 changed from 2 seperate tables to reduce complexity',
  `dateOfBirthNotes` text DEFAULT NULL,
  `preferredTimeZone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `uidOfCreatedBy` int(11) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForCreated_at` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `timeZoneAbbreviationForUpdated_at` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `isCachedForUserReport` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Not Cached, 1 = Cached',
  `numberOfLoggedIn` tinyint(11) NOT NULL DEFAULT 0,
  `lastLoggedIn` datetime DEFAULT NULL,
  `timeZoneAbbreviationOfLastLoggedIn` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `TFASecretCode` varchar(50) DEFAULT NULL,
  `receiveOTPByUsing` enum('GoogleAuthenticator','SMS') DEFAULT NULL,
  `uidOfTFASecretCodeUpdatedBy` int(11) UNSIGNED DEFAULT NULL,
  `forgotPasswordSecretCodeViaSMS` varchar(6) DEFAULT NULL,
  `isIntakeComplete` enum('yes','no') DEFAULT NULL,
  `isUserVisibleOnBookingSystem` enum('Yes','No') NOT NULL DEFAULT 'No',
  `googleCalendarID` varchar(255) DEFAULT NULL,
  `otpForMobileAppsLogin` varchar(10) DEFAULT NULL,
  `otpForMobileAppsLastUpdatedOn` datetime DEFAULT NULL,
  `associatedCalendarColorCode` varchar(10) DEFAULT NULL,
  `sentDataToGoogleCalender` enum('yes','no') NOT NULL DEFAULT 'yes',
  `recieveDataFromGoogleCalender` enum('yes','no') NOT NULL DEFAULT 'yes',
  `snapShot` longblob DEFAULT NULL,
  `snapShotTime` datetime DEFAULT NULL,
  `skypeId` varchar(255) DEFAULT NULL,
  `facetimeId` varchar(255) DEFAULT NULL,
  `userSignUpSource` varchar(100) DEFAULT NULL,
  `temporaryDisableTFACurrentStatus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ok by VK on 28/7';

-- --------------------------------------------------------

--
-- Table structure for table `userWhereAbouts`
--

CREATE TABLE `userWhereAbouts` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `whereAboutMasterID` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userWhereAboutsMaster`
--

CREATE TABLE `userWhereAboutsMaster` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdOn` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `userActiveTabDetails`
--
ALTER TABLE `userActiveTabDetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userAssociationBetweenDoctorAndDoctorAdmin`
--
ALTER TABLE `userAssociationBetweenDoctorAndDoctorAdmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userAssociationMasterTypes`
--
ALTER TABLE `userAssociationMasterTypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userAssociationRooms`
--
ALTER TABLE `userAssociationRooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userChat`
--
ALTER TABLE `userChat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userDateOfBirth`
--
ALTER TABLE `userDateOfBirth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_discontinuedByUID` (`discontinuedByUID`),
  ADD KEY `idx_firstParentId` (`firstParentID`),
  ADD KEY `idx_uidOfPatient` (`uidOfPatient`);

--
-- Indexes for table `userEmailAddressesExtraOverLoginEmail`
--
ALTER TABLE `userEmailAddressesExtraOverLoginEmail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contactID` (`uid`),
  ADD KEY `emailAddressTypeID` (`emailAddressTypeID`);

--
-- Indexes for table `userGender`
--
ALTER TABLE `userGender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userOptimisedProfileImages`
--
ALTER TABLE `userOptimisedProfileImages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `userOtherDetails`
--
ALTER TABLE `userOtherDetails`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `userPhoneExtension`
--
ALTER TABLE `userPhoneExtension`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userPhoneNumbers`
--
ALTER TABLE `userPhoneNumbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phoneNumberTypeID` (`phoneNumberTypeID`),
  ADD KEY `contactID` (`uid`);
ALTER TABLE `userPhoneNumbers` ADD FULLTEXT KEY `phone_search` (`phoneNumber`);

--
-- Indexes for table `userProfileImages`
--
ALTER TABLE `userProfileImages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `userProfileImagesBack`
--
ALTER TABLE `userProfileImagesBack`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `userProfileImages_backup`
--
ALTER TABLE `userProfileImages_backup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `userReportCustomFilters`
--
ALTER TABLE `userReportCustomFilters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userReportSummaries`
--
ALTER TABLE `userReportSummaries`
  ADD PRIMARY KEY (`summaryReportID`),
  ADD KEY `customReportID` (`customReportID`);

--
-- Indexes for table `userReportSummaryStates`
--
ALTER TABLE `userReportSummaryStates`
  ADD PRIMARY KEY (`stateID`);

--
-- Indexes for table `userRoleTypesMaster`
--
ALTER TABLE `userRoleTypesMaster`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companyID` (`companyID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `emailAddress` (`emailAddress`),
  ADD KEY `roleID` (`roleID`),
  ADD KEY `companyID` (`companyID`),
  ADD KEY `genderTypeID` (`genderTypeID`);

--
-- Indexes for table `usersAdditionalInfo`
--
ALTER TABLE `usersAdditionalInfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersAssociatedWithDoctor`
--
ALTER TABLE `usersAssociatedWithDoctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uidOfDoctor` (`uidOfDoctor`),
  ADD KEY `uidOfAssociatedUser` (`uidOfAssociatedUser`),
  ADD KEY `userAssociationMasterTypeId` (`userAssociationMasterTypeId`);

--
-- Indexes for table `usersCareerHighlights`
--
ALTER TABLE `usersCareerHighlights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `idOfLoggedInUser` (`uidOfLoggedInUser`);

--
-- Indexes for table `userSelectedOptionForIntakeDetailData`
--
ALTER TABLE `userSelectedOptionForIntakeDetailData`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`);

--
-- Indexes for table `userSession`
--
ALTER TABLE `userSession`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userSettings`
--
ALTER TABLE `userSettings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `userSettingsTypeMaster`
--
ALTER TABLE `userSettingsTypeMaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersExpertiseDetails`
--
ALTER TABLE `usersExpertiseDetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `idOfLoggedInUser` (`uidOfLoggedInUser`);

--
-- Indexes for table `usersMeditationsHistory`
--
ALTER TABLE `usersMeditationsHistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userSocialAccountInformation`
--
ALTER TABLE `userSocialAccountInformation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userSocialAddressMasterType`
--
ALTER TABLE `userSocialAddressMasterType`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersRooms`
--
ALTER TABLE `usersRooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersTempForImportFromDrupal`
--
ALTER TABLE `usersTempForImportFromDrupal`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `userStreetAddresses`
--
ALTER TABLE `userStreetAddresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contactID` (`uid`),
  ADD KEY `streetAddressTypeID` (`streetAddressTypeID`);

--
-- Indexes for table `userStreetAddresses_bak`
--
ALTER TABLE `userStreetAddresses_bak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contactID` (`uid`),
  ADD KEY `streetAddressTypeID` (`streetAddressTypeID`);

--
-- Indexes for table `users_bk`
--
ALTER TABLE `users_bk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emailAddress` (`emailAddress`),
  ADD KEY `roleID` (`roleID`),
  ADD KEY `companyID` (`companyID`),
  ADD KEY `genderTypeID` (`genderTypeID`);
ALTER TABLE `users_bk` ADD FULLTEXT KEY `name search` (`firstName`,`middleName`,`lastName`);

--
-- Indexes for table `userWhereAbouts`
--
ALTER TABLE `userWhereAbouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userWhereAboutsMaster`
--
ALTER TABLE `userWhereAboutsMaster`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `userActiveTabDetails`
--
ALTER TABLE `userActiveTabDetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `userAssociationBetweenDoctorAndDoctorAdmin`
--
ALTER TABLE `userAssociationBetweenDoctorAndDoctorAdmin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userAssociationMasterTypes`
--
ALTER TABLE `userAssociationMasterTypes`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `userAssociationRooms`
--
ALTER TABLE `userAssociationRooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `userChat`
--
ALTER TABLE `userChat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userDateOfBirth`
--
ALTER TABLE `userDateOfBirth`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15993;

--
-- AUTO_INCREMENT for table `userEmailAddressesExtraOverLoginEmail`
--
ALTER TABLE `userEmailAddressesExtraOverLoginEmail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5840;

--
-- AUTO_INCREMENT for table `userGender`
--
ALTER TABLE `userGender`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9746;

--
-- AUTO_INCREMENT for table `userOptimisedProfileImages`
--
ALTER TABLE `userOptimisedProfileImages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `userPhoneExtension`
--
ALTER TABLE `userPhoneExtension`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `userPhoneNumbers`
--
ALTER TABLE `userPhoneNumbers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18646;

--
-- AUTO_INCREMENT for table `userProfileImages`
--
ALTER TABLE `userProfileImages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2176;

--
-- AUTO_INCREMENT for table `userProfileImagesBack`
--
ALTER TABLE `userProfileImagesBack`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1882;

--
-- AUTO_INCREMENT for table `userProfileImages_backup`
--
ALTER TABLE `userProfileImages_backup`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2176;

--
-- AUTO_INCREMENT for table `userReportCustomFilters`
--
ALTER TABLE `userReportCustomFilters`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `userReportSummaries`
--
ALTER TABLE `userReportSummaries`
  MODIFY `summaryReportID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `userReportSummaryStates`
--
ALTER TABLE `userReportSummaryStates`
  MODIFY `stateID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `userRoleTypesMaster`
--
ALTER TABLE `userRoleTypesMaster`
  MODIFY `id` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19770;

--
-- AUTO_INCREMENT for table `usersAdditionalInfo`
--
ALTER TABLE `usersAdditionalInfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `usersAssociatedWithDoctor`
--
ALTER TABLE `usersAssociatedWithDoctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2021;

--
-- AUTO_INCREMENT for table `usersCareerHighlights`
--
ALTER TABLE `usersCareerHighlights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT for table `userSelectedOptionForIntakeDetailData`
--
ALTER TABLE `userSelectedOptionForIntakeDetailData`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8655;

--
-- AUTO_INCREMENT for table `userSession`
--
ALTER TABLE `userSession`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1224;

--
-- AUTO_INCREMENT for table `userSettings`
--
ALTER TABLE `userSettings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `userSettingsTypeMaster`
--
ALTER TABLE `userSettingsTypeMaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usersExpertiseDetails`
--
ALTER TABLE `usersExpertiseDetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `usersMeditationsHistory`
--
ALTER TABLE `usersMeditationsHistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `userSocialAccountInformation`
--
ALTER TABLE `userSocialAccountInformation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `userSocialAddressMasterType`
--
ALTER TABLE `userSocialAddressMasterType`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usersRooms`
--
ALTER TABLE `usersRooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `userStreetAddresses`
--
ALTER TABLE `userStreetAddresses`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14714;

--
-- AUTO_INCREMENT for table `userStreetAddresses_bak`
--
ALTER TABLE `userStreetAddresses_bak`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13971;

--
-- AUTO_INCREMENT for table `users_bk`
--
ALTER TABLE `users_bk`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19778;

--
-- AUTO_INCREMENT for table `userWhereAbouts`
--
ALTER TABLE `userWhereAbouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userWhereAboutsMaster`
--
ALTER TABLE `userWhereAboutsMaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
