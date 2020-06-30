USE `DB_SC_Diagnosis_CT_V20`;
-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Jun 26, 2020 at 11:40 AM
-- Server version: 10.4.13-MariaDB-1:10.4.13+maria~bionic
-- PHP Version: 7.4.5

--
-- Database: `DB_SC_Diagnosis_CT_V20`
--

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;

CREATE TABLE `diagnosis` (
  `uuid` char(36) NOT NULL,
  `uid` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icd10Code` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `agree` varchar(255) DEFAULT NULL,
  `assessment` varchar(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `recordChangedByUUID` char(36) NOT NULL,
  `recordChangedOnDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `recordChangedFromIPAddress` varchar(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosisAssessment`
--

DROP TABLE IF EXISTS `diagnosisAssessment`;

CREATE TABLE `diagnosisAssessment` (
  `uuid` char(36) NOT NULL,
  `diagnosisId` int(11) NOT NULL,
  `uid` char(36) NOT NULL,
  `assessment` text DEFAULT NULL,
  `recordChangedByUUID` char(36) NOT NULL,
  `recordChangedOnDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `recordChangedFromIPAddress` varchar(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `dsmMasterCodes`
--

DROP TABLE IF EXISTS `dsmMasterCodes`;

CREATE TABLE `dsmMasterCodes` (
  `uuid` char(36) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `dsm5Code` varchar(50) DEFAULT NULL,
  `icd10Code` varchar(50) DEFAULT NULL,
  `recordChangedByUUID` char(36) NOT NULL,
  `recordChangedOnDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `recordChangedFromIPAddress` varchar(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `icd10AndScreenMappingDetails`
--

DROP TABLE IF EXISTS `icd10AndScreenMappingDetails`;

CREATE TABLE `icd10AndScreenMappingDetails` (
  `uuid` char(36) NOT NULL,
  `icd10ID` int(11) NOT NULL,
  `screenID` int(11) NOT NULL,
  `recordChangedByUUID` char(36) NOT NULL,
  `recordChangedOnDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `recordChangedFromIPAddress` varchar(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `icd10MasterCodes`
--

DROP TABLE IF EXISTS `icd10MasterCodes`;

CREATE TABLE `icd10MasterCodes` (
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icd10Code` varchar(255) NOT NULL,
  `recordChangedByUUID` char(36) NOT NULL,
  `recordChangedOnDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `recordChangedFromIPAddress` varchar(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `patientReportedDiagnosis`
--

DROP TABLE IF EXISTS `patientReportedDiagnosis`;

CREATE TABLE `patientReportedDiagnosis` (
  `uuid` char(36) NOT NULL,
  `uid` char(36) NOT NULL,
  `diagnosisName` varchar(255) NOT NULL,
  `whenHappened` datetime DEFAULT NULL,
  `status` enum('Patient reported','Other provider confirmed') NOT NULL DEFAULT 'Patient reported',
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `agree` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `recordChangedByUUID` char(36) NOT NULL,
  `recordChangedOnDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `recordChangedFromIPAddress` varchar(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `patientReportedDiagnosisNote`
--

DROP TABLE IF EXISTS `patientReportedDiagnosisNote`;

CREATE TABLE `patientReportedDiagnosisNote` (
  `uuid` char(36) NOT NULL,
  `diagnosisReportedId` char(36) NOT NULL,
  `note` text NOT NULL,
  `recordChangedByUUID` char(36) NOT NULL,
  `recordChangedOnDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `recordChangedFromIPAddress` varchar(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `ruledOutDiagnosis`
--

DROP TABLE IF EXISTS `ruledOutDiagnosis`;

CREATE TABLE `ruledOutDiagnosis` (
  `uuid` char(36) NOT NULL,
  `uid` char(36) NOT NULL,
  `diagnosisId` int(11) NOT NULL,
  `diagnosisName` varchar(255) NOT NULL,
  `icd10Code` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `endDate` timestamp NULL DEFAULT NULL,
  `ruledOutBy` int(10) UNSIGNED DEFAULT NULL,
  `ruledOutOn` datetime DEFAULT NULL,
  `recordChangedByUUID` char(36) NOT NULL,
  `recordChangedOnDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `recordChangedFromIPAddress` varchar(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `ruledOutNotes`
--

DROP TABLE IF EXISTS `ruledOutNotes`;

CREATE TABLE `ruledOutNotes` (
  `uuid` char(36) NOT NULL,
  `ruledOutId` char(36) NOT NULL,
  `note` text DEFAULT NULL,
  `recordChangedByUUID` char(36) NOT NULL,
  `recordChangedOnDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `recordChangedFromIPAddress` varchar(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

