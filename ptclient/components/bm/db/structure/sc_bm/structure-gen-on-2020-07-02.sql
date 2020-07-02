use sc_bm;

CREATE TABLE `bloodPressure` (
  `ptUUID` char(36) NOT NULL,
  `systolicValue` int(11) NOT NULL COMMENT 'mm Hg',
  `diastolicValue` int(11) NOT NULL COMMENT 'mm Hg',
  `timeOfEvaluation` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` char(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ptUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

CREATE TABLE `bloodSugar` (
  `ptUUID` char(36) NOT NULL,
  `bloodSugar` int(11) NOT NULL,
  `relationToMeal` enum('Before breakfast','After breakfast','Before lunch','After lunch','Before dinner','After dinner','Bed time','Other') NOT NULL,
  `timeOfEvaluation` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` char(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(20) DEFAULT NULL,
   PRIMARY KEY (`ptUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

CREATE TABLE `BMI` (
  `ptUUID` char(36) NOT NULL,
  `bmiValue` decimal(10,2) NOT NULL,
  `timeOfEvaluation` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` char(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ptUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;


CREATE TABLE `height` (
  `ptUUID` char(36) NOT NULL,
  `heightInInch` int(4) NOT NULL,
  `timeOfEvaluation` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` char(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ptUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;


CREATE TABLE `oxygenSaturation` (
  `ptUUID` char(36) NULL,
  `oxygenSaturation` int(11) NOT NULL,
  `timeOfEvaluation` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` char(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ptUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;


CREATE TABLE `pulse` (
  `ptUUID` char(36) NOT NULL,
  `beatsPerMinuteValue` int(4) NOT NULL,
  `timeOfEvaluation` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` char(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ptUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;


CREATE TABLE `temperature` (
  `ptUUID` char(36) DEFAULT NULL,
  `temperatureInFarehnite` decimal(10,0) NOT NULL,
  `timeOfEvaluation` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` char(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(20) DEFAULT NULL,
   PRIMARY KEY (`ptUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;


CREATE TABLE `waistCircumference` (
  `ptUUID` char(36) NOT NULL,
  `waistCircumferenceInInches` decimal(10,2) NOT NULL,
  `timeOfEvaluation` date NOT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` char(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ptUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;


CREATE TABLE `weight` (
  `ptUUID` char(36) NOT NULL,
  `weightInPounds` decimal(10,2) NOT NULL,
  `timeOfEvaluation` date DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `recordChangedByUUID` char(36) DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ptUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;

