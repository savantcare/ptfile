use sc_reminder;

DROP TABLE IF EXISTS `reminder`;

CREATE TABLE `reminders` (
  `uuid` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `uuidOfRemMadeFor` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `isAutoRem` int(11) DEFAULT NULL,
  `recordChangedByUUID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recordChangedFromIPAddress` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recordChangedFromSection` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'patientFile',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 WITH SYSTEM VERSIONING;
