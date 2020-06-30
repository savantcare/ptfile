use sc_reminder;
-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Jun 26, 2020 at 10:46 AM
-- Server version: 10.4.13-MariaDB-1:10.4.13+maria~bionic
-- PHP Version: 7.4.5
--
-- Database: `sc_reminder`
--

-- --------------------------------------------------------

--
-- Table structure for table `reminder_news`
--

DROP TABLE IF EXISTS `reminder_news`;

CREATE TABLE `reminder_news` (
  `uuid` char(36) NOT NULL,
  `patientUUID` char(36) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `recordChangedByUUID` char(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(255) DEFAULT NULL,
  `recordChangedFromSection` varchar(255) DEFAULT 'patientFile',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

