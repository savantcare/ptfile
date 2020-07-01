use sc_goal;

DROP TABLE IF EXISTS `goal`;

CREATE TABLE `goal` (
  `uuid` CHAR(36) NOT NULL,
  `patientUUID` CHAR(36) NOT NULL,
  `description` text DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT 0,
  `discontinuedNotes` text DEFAULT NULL,
  `recordChangedByUUID` CHAR(36) NOT NULL,
  `recordChangedFromIPAddress` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;
