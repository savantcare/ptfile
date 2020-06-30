use sc_body_measurement

CREATE TABLE `bloodPressure` (
  `patientUUID` varchar(36) NOT NULL,
  `systolicValue` int(11) NOT NULL COMMENT 'mm Hg',
  `diastolicValue` int(11) NOT NULL COMMENT 'mm Hg',
  `measurementDate` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` varchar(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `bodyMeasurementBloodSugar`
--

CREATE TABLE `bloodSugar` (
  `patientUUID` varchar(36) NOT NULL,
  `bloodSugar` int(11) NOT NULL,
  `relationToMeal` enum('Before breakfast','After breakfast','Before lunch','After lunch','Before dinner','After dinner','Bed time','Other') NOT NULL,
  `measurementDate` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` varchar(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(255) DEFAULT NULL,
   PRIMARY KEY (`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `bodyMeasurementBMI`
--

CREATE TABLE `BMI` (
  `patientUUID` varchar(36) NOT NULL,
  `bmiValue` decimal(10,2) NOT NULL,
  `measurementDate` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` varchar(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `bodyMeasurementHeight`
--

CREATE TABLE `height` (
  `patientUUID` varchar(36) NOT NULL,
  `heightInInch` int(4) NOT NULL,
  `measurementDate` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` varchar(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `bodyMeasurementOxygenSaturation`
--

CREATE TABLE `oxygenSaturation` (
  `patientUUID` varchar(36) NULL,
  `oxygenSaturation` int(11) NOT NULL,
  `measurementDate` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` varchar(36) DEFAULT NULL,
  `recordChangedOnDateTime` datetime DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `bodyMeasurementPulse`
--

CREATE TABLE `pulse` (
  `patientUUID` varchar(36) NOT NULL,
  `beatsPerMinuteValue` int(4) NOT NULL,
  `measurementDate` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` varchar(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `bodyMeasurementTemperature`
--

CREATE TABLE `temperature` (
  `patientUUID` varchar(36) DEFAULT NULL,
  `temperatureInFarehnite` decimal(10,0) NOT NULL,
  `measurementDate` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` varchar(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(255) DEFAULT NULL,
   PRIMARY KEY (`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `bodyMeasurementWaistCircumference`
--

CREATE TABLE `waistCircumference` (
  `patientUUID` varchar(36) NOT NULL,
  `waistCircumferenceInInches` decimal(10,2) NOT NULL,
  `measurementDate` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` varchar(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

-- --------------------------------------------------------

--
-- Table structure for table `bodyMeasurementWeight`
--

CREATE TABLE `weight` (
  `patientUUID` varchar(36) NOT NULL,
  `weightInPounds` decimal(10,2) NOT NULL,
  `measurementDate` date DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` varchar(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patientUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

