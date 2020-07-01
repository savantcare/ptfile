use DB_SC_Recommendation_CT_V20;

DROP TABLE IF EXISTS `recommendationLanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommendationLanguage` (
  `uuid` CHAR(36) NOT NULL,
  `template` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `recordChangedByUUID` CHAR(36) NOT NULL,
  `recordChangedFromIPAddress` varchar(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 WITH SYSTEM VERSIONING;;

/* Question: What is the type field 
There are 2 types for created on and discontinued on
This should be a enum

*/
