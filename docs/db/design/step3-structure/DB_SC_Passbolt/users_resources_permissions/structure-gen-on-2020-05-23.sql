use DB_SC_Passbolt;
-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DB_SC_Passbolt
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
-- Temporary table structure for view `users_resources_permissions`
--

DROP TABLE IF EXISTS `users_resources_permissions`;
/*!50001 DROP VIEW IF EXISTS `users_resources_permissions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `users_resources_permissions` AS SELECT 
 1 AS `user_id`,
 1 AS `resource_id`,
 1 AS `permission_id`,
 1 AS `permission_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `users_resources_permissions`
--

/*!50001 DROP VIEW IF EXISTS `users_resources_permissions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `users_resources_permissions` AS select `users`.`id` AS `user_id`,`resources`.`id` AS `resource_id`,if((coalesce(`direct_user_resource_permission`.`type`,0) > coalesce(`inherited_groups_resources_permission`.`type`,0)),`direct_user_resource_permission`.`id`,`inherited_groups_resources_permission`.`id`) AS `permission_id`,if((coalesce(`direct_user_resource_permission`.`type`,0) > coalesce(`inherited_groups_resources_permission`.`type`,0)),`direct_user_resource_permission`.`type`,`inherited_groups_resources_permission`.`type`) AS `permission_type` from (((`users` join `resources` on(TRUE)) left join `permissions` `direct_user_resource_permission` on(((`direct_user_resource_permission`.`aco_foreign_key` = `resources`.`id`) and (`direct_user_resource_permission`.`aro_foreign_key` = `users`.`id`)))) left join `permissions` `inherited_groups_resources_permission` on((`inherited_groups_resources_permission`.`id` = (select `groups_permissions`.`id` from (`permissions` `groups_permissions` join `groups_users`) where ((`groups_users`.`user_id` = `users`.`id`) and (`groups_permissions`.`aro_foreign_key` = `groups_users`.`group_id`) and (`groups_permissions`.`aco_foreign_key` = `resources`.`id`)) order by `groups_permissions`.`type` desc limit 1)))) where ((`direct_user_resource_permission`.`id` is not null) or (`inherited_groups_resources_permission`.`id` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
