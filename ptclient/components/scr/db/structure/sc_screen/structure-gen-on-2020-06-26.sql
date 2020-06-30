USE `sc_screen`;
-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Jun 26, 2020 at 12:52 PM
-- Server version: 10.4.13-MariaDB-1:10.4.13+maria~bionic
-- PHP Version: 7.4.5

--
-- Database: `sc_screen`
--

-- --------------------------------------------------------

--
-- Table structure for table `phq9PatientResponses`
--

CREATE TABLE `phq9PatientResponses` (
  `patientUUID` char(36) NOT NULL,
  `question1` enum('0','1','2','3') DEFAULT NULL,
  `question2` enum('0','1','2','3') DEFAULT NULL,
  `question3` enum('0','1','2','3') DEFAULT NULL,
  `question4` enum('0','1','2','3') DEFAULT NULL,
  `question5` enum('0','1','2','3') DEFAULT NULL,
  `question6` enum('0','1','2','3') DEFAULT NULL,
  `question7` enum('0','1','2','3') DEFAULT NULL,
  `question8` enum('0','1','2','3') DEFAULT NULL,
  `question9` enum('0','1','2','3') DEFAULT NULL,
  `question10` enum('0','1','2','3') DEFAULT NULL,
  `recordChangedByUUID` char(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `screensAssignedToPatients`
--

CREATE TABLE `screensAssignedToPatients` (
  `uuid` char(36) NOT NULL,
  `screenUUID` char(36) DEFAULT NULL,
  `patientUUID` char(36) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `recordChangedByUUID` char(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `screensListMasters`
--

CREATE TABLE `screensListMasters` (
  `uuid` char(36) NOT NULL,
  `screenName` varchar(255) DEFAULT NULL,
  `scientificName` varchar(255) DEFAULT NULL,
  `clinicalStudies` text DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

