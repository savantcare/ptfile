use sc_recommendation;


DROP TABLE IF EXISTS `doctorRecommendationsForPatients`;
CREATE TABLE `doctorRecsForPts` (
  `uuid` CHAR(36) NOT NULL,
  `uuidOfRecommendationMadeFor` CHAR(36) NOT NULL,
  `recommendationDescription` longtext,
  `notes` text DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `isAutoRex` int(11) DEFAULT NULL,
  `autoRecommendationsOrderId` int(11) DEFAULT NULL,
  `recordChangedByUUID` CHAR(36) NOT NULL,
  `recordChangedFromIPAddress` varchar(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;
