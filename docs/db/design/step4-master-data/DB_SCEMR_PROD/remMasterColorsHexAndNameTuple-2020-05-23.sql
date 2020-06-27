use DB_SCEMR_PROD
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SCEMR_PROD
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `remMasterColorsHexAndNameTuple`
--

DROP TABLE IF EXISTS `remMasterColorsHexAndNameTuple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remMasterColorsHexAndNameTuple` (
  `colorID` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hexCode` char(6) NOT NULL,
  PRIMARY KEY (`colorID`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=latin1 COMMENT='ok by VK on 27/6';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remMasterColorsHexAndNameTuple`
--

LOCK TABLES `remMasterColorsHexAndNameTuple` WRITE;
/*!40000 ALTER TABLE `remMasterColorsHexAndNameTuple` DISABLE KEYS */;
INSERT INTO `remMasterColorsHexAndNameTuple` VALUES (1,'AliceBlue','F0F8FF'),(2,'AntiqueWhite','FAEBD7'),(3,'Aqua','00FFFF'),(4,'Aquamarine','7FFFD4'),(5,'Azure','F0FFFF'),(6,'Beige','F5F5DC'),(7,'Bisque','FFE4C4'),(8,'Black','000000'),(9,'BlanchedAlmond','FFEBCD'),(10,'Blue','0000FF'),(11,'BlueViolet','8A2BE2'),(12,'Brown','A52A2A'),(13,'BurlyWood','DEB887'),(14,'CadetBlue','5F9EA0'),(15,'Chartreuse','7FFF00'),(16,'Chocolate','D2691E'),(17,'Coral','FF7F50'),(18,'CornflowerBlue','6495ED'),(19,'Cornsilk','FFF8DC'),(20,'Crimson','DC143C'),(21,'Cyan','00FFFF'),(22,'DarkBlue','00008B'),(23,'DarkCyan','008B8B'),(24,'DarkGoldenRod','B8860B'),(25,'DarkGray','A9A9A9'),(26,'DarkGreen','006400'),(27,'DarkKhaki','BDB76B'),(28,'DarkMagenta','8B008B'),(29,'DarkOliveGreen','556B2F'),(30,'DarkOrange','FF8C00'),(31,'DarkOrchid','9932CC'),(32,'DarkRed','8B0000'),(33,'DarkSalmon','E9967A'),(34,'DarkSeaGreen','8FBC8F'),(35,'DarkSlateBlue','483D8B'),(36,'DarkSlateGray','2F4F4F'),(37,'DarkTurquoise','00CED1'),(38,'DarkViolet','9400D3'),(39,'DeepPink','FF1493'),(40,'DeepSkyBlue','00BFFF'),(41,'DimGray','696969'),(42,'DodgerBlue','1E90FF'),(43,'FireBrick','B22222'),(44,'FloralWhite','FFFAF0'),(45,'ForestGreen','228B22'),(46,'Fuchsia','FF00FF'),(47,'Gainsboro','DCDCDC'),(48,'GhostWhite','F8F8FF'),(49,'Gold','FFD700'),(50,'GoldenRod','DAA520'),(51,'Gray','808080'),(52,'Green','008000'),(53,'GreenYellow','ADFF2F'),(54,'HoneyDew','F0FFF0'),(55,'HotPink','FF69B4'),(56,'IndianRed ','CD5C5C'),(57,'Indigo  ','4B0082'),(58,'Ivory','FFFFF0'),(59,'Khaki','F0E68C'),(60,'Lavender','E6E6FA'),(61,'LavenderBlush','FFF0F5'),(62,'LawnGreen','7CFC00'),(63,'LemonChiffon','FFFACD'),(64,'LightBlue','ADD8E6'),(65,'LightCoral','F08080'),(66,'LightCyan','E0FFFF'),(67,'LightGoldenRodYellow','FAFAD2'),(68,'LightGray','D3D3D3'),(69,'LightGreen','90EE90'),(70,'LightPink','FFB6C1'),(71,'LightSalmon','FFA07A'),(72,'LightSeaGreen','20B2AA'),(73,'LightSkyBlue','87CEFA'),(74,'LightSlateGray','778899'),(75,'LightSteelBlue','B0C4DE'),(76,'LightYellow','FFFFE0'),(77,'Lime','00FF00'),(78,'LimeGreen','32CD32'),(79,'Linen','FAF0E6'),(80,'Magenta','FF00FF'),(81,'Maroon','800000'),(82,'MediumAquaMarine','66CDAA'),(83,'MediumBlue','0000CD'),(84,'MediumOrchid','BA55D3'),(85,'MediumPurple','9370DB'),(86,'MediumSeaGreen','3CB371'),(87,'MediumSlateBlue','7B68EE'),(88,'MediumSpringGreen','00FA9A'),(89,'MediumTurquoise','48D1CC'),(90,'MediumVioletRed','C71585'),(91,'MidnightBlue','191970'),(92,'MintCream','F5FFFA'),(93,'MistyRose','FFE4E1'),(94,'Moccasin','FFE4B5'),(95,'NavajoWhite','FFDEAD'),(96,'Navy','000080'),(97,'OldLace','FDF5E6'),(98,'Olive','808000'),(99,'OliveDrab','6B8E23'),(100,'Orange','FFA500'),(101,'OrangeRed','FF4500'),(102,'Orchid','DA70D6'),(103,'PaleGoldenRod','EEE8AA'),(104,'PaleGreen','98FB98'),(105,'PaleTurquoise','AFEEEE'),(106,'PaleVioletRed','DB7093'),(107,'PapayaWhip','FFEFD5'),(108,'PeachPuff','FFDAB9'),(109,'Peru','CD853F'),(110,'Pink','FFC0CB'),(111,'Plum','DDA0DD'),(112,'PowderBlue','B0E0E6'),(113,'Purple','800080'),(114,'RebeccaPurple','663399'),(115,'Red','FF0000'),(116,'RosyBrown','BC8F8F'),(117,'RoyalBlue','4169E1'),(118,'SaddleBrown','8B4513'),(119,'Salmon','FA8072'),(120,'SandyBrown','F4A460'),(121,'SeaGreen','2E8B57'),(122,'SeaShell','FFF5EE'),(123,'Sienna','A0522D'),(124,'Silver','C0C0C0'),(125,'SkyBlue','87CEEB'),(126,'SlateBlue','6A5ACD'),(127,'SlateGray','708090'),(128,'Snow','FFFAFA'),(129,'SpringGreen','00FF7F'),(130,'SteelBlue','4682B4'),(131,'Tan','D2B48C'),(132,'Teal','008080'),(133,'Thistle','D8BFD8'),(134,'Tomato','FF6347'),(135,'Turquoise','40E0D0'),(136,'Violet','EE82EE'),(137,'Wheat','F5DEB3'),(138,'White','FFFFFF'),(139,'WhiteSmoke','F5F5F5'),(140,'Yellow','FFFF00'),(141,'YellowGreen','9ACD32');
/*!40000 ALTER TABLE `remMasterColorsHexAndNameTuple` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
