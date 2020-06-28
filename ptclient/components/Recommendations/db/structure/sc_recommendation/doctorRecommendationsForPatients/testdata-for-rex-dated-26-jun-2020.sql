-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Jun 26, 2020 at 05:51 AM
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
-- Database: `sc_recommendation`
--

--
-- Dumping data for table `doctorRecommendationsForPatients`
--

INSERT INTO `doctorRecommendationsForPatients` (`uuid`, `uuidOfRecommendationMadeFor`, `recommendationDescription`, `notes`, `priority`, `isAutoRex`, `autoRecommendationsOrderId`, `recordChangedByUUID`, `recordChangedFromIPAddress`) VALUES
('897f78c6-3584-47fe-9236-2c3dd1070bdf', 'bfe041fa-073b-4223-8c69-0540ee678ff8', 'This is a test rex 1', NULL, NULL, NULL, NULL, '1', ''),
('bfe041fa-073b-4223-8c69-0540ee8721dd', 'bfe041fa-073b-4223-8c69-0540ee678ff8', 'This is a test rex 2', NULL, NULL, NULL, NULL, '1', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
