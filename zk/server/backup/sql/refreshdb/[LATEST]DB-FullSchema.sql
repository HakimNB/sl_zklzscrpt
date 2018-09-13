-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: amc_game
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Current Database: `amc_game`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `amc_game` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `amc_game`;

--
-- Table structure for table `tbl_config`
--

DROP TABLE IF EXISTS `tbl_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_config` (
  `name` char(36) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_item_data`
--

DROP TABLE IF EXISTS `tbl_item_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_item_data` (
  `iggid` bigint(20) NOT NULL,
  `item_id` smallint(5) unsigned NOT NULL,
  `num` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`iggid`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_item_purchase_data`
--

DROP TABLE IF EXISTS `tbl_item_purchase_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_item_purchase_data` (
  `iggid` bigint(20) NOT NULL,
  `item_id` smallint(5) unsigned NOT NULL,
  `purchase_count` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`iggid`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_player_data`
--

DROP TABLE IF EXISTS `tbl_player_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_player_data` (
  `iggid` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `birthday` int(11) NOT NULL DEFAULT '0',
  `icon_index` tinyint(4) NOT NULL DEFAULT '0',
  `accept_friend_flag` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `diamond` bigint(20) NOT NULL DEFAULT '0',
  `stamina` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `star` smallint(6) NOT NULL DEFAULT '0',
  `last_recharge_stamina_time` bigint(20) NOT NULL DEFAULT '0',
  `last_check_out_time` bigint(20) NOT NULL DEFAULT '0',
  `last_login_time` bigint(20) NOT NULL DEFAULT '0',
  `last_logout_time` bigint(20) NOT NULL DEFAULT '0',
  `main_stage_id` int(11) NOT NULL DEFAULT '0',
  `friendship` int(11) NOT NULL DEFAULT '0',
  `last_used_device_key` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iggid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_player_ext_data`
--

DROP TABLE IF EXISTS `tbl_player_ext_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_player_ext_data` (
  `iggid` int(11) NOT NULL,
  `last_take_bonus_time` bigint(20) NOT NULL DEFAULT '0',
  `last_take_bonus_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_take_bonus_tag` tinyint(3) NOT NULL DEFAULT '0',
  `last_take_weekly_reward_time` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iggid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_player_map_building_data`
--

DROP TABLE IF EXISTS `tbl_player_map_building_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_player_map_building_data` (
  `iggid` bigint(20) NOT NULL,
  `region_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `selected_skin_id` int(11) NOT NULL DEFAULT '0',
  `building_state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`iggid`,`region_id`,`building_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_player_map_region_data`
--

DROP TABLE IF EXISTS `tbl_player_map_region_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_player_map_region_data` (
  `iggid` bigint(20) NOT NULL,
  `region_id` int(11) NOT NULL,
  `region_state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`iggid`,`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_player_map_skin_data`
--

DROP TABLE IF EXISTS `tbl_player_map_skin_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_player_map_skin_data` (
  `iggid` bigint(20) NOT NULL,
  `region_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `skin_id` int(11) NOT NULL,
  `skin_state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`iggid`,`region_id`,`building_id`,`skin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_player_quest_chapter_data`
--

DROP TABLE IF EXISTS `tbl_player_quest_chapter_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_player_quest_chapter_data` (
  `iggid` bigint(20) NOT NULL,
  `chapter_id` varchar(45) NOT NULL DEFAULT '0',
  `chapter_progress` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`iggid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_player_quest_completed_data`
--

DROP TABLE IF EXISTS `tbl_player_quest_completed_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_player_quest_completed_data` (
  `iggid` bigint(20) NOT NULL,
  `quest_id` varchar(45) NOT NULL DEFAULT '0',
  `quest_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `quest_state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`iggid`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `amc_social`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `amc_social` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `amc_social`;

--
-- Table structure for table `tbl_blacklist_data`
--

DROP TABLE IF EXISTS `tbl_blacklist_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_blacklist_data` (
  `iggid` bigint(20) NOT NULL,
  `target_iggid` bigint(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`iggid`,`target_iggid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_friend_data`
--

DROP TABLE IF EXISTS `tbl_friend_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_friend_data` (
  `iggid` bigint(20) NOT NULL,
  `target_iggid` bigint(20) NOT NULL,
  `create_time` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iggid`,`target_iggid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_global_mail_data`
--

DROP TABLE IF EXISTS `tbl_global_mail_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_global_mail_data` (
  `mail_id` int(10) unsigned NOT NULL,
  `sending_time` bigint(20) NOT NULL,
  `expired_time` bigint(20) NOT NULL,
  `message` varchar(100) NOT NULL,
  `attachment_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attachment_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attachment_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mail_id`),
  KEY `expired_time` (`expired_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_player_mail_data`
--

DROP TABLE IF EXISTS `tbl_player_mail_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_player_mail_data` (
  `iggid` bigint(20) NOT NULL,
  `mail_id` int(10) unsigned NOT NULL,
  `sending_time` bigint(20) NOT NULL,
  `expired_time` bigint(20) NOT NULL,
  `message` varchar(100) NOT NULL DEFAULT '',
  `attachment_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attachment_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attachment_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iggid`,`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_player_mail_info`
--

DROP TABLE IF EXISTS `tbl_player_mail_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_player_mail_info` (
  `iggid` bigint(20) NOT NULL,
  `taken_global_mail_id` varchar(1000) NOT NULL,
  PRIMARY KEY (`iggid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_search_player_data`
--

DROP TABLE IF EXISTS `tbl_search_player_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_search_player_data` (
  `seq` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iggid` bigint(20) NOT NULL,
  `hex_name` varchar(50) NOT NULL DEFAULT '',
  `accept_friend_flag` tinyint(4) NOT NULL DEFAULT '0',
  `is_online` tinyint(4) NOT NULL DEFAULT '0',
  `last_login_time` bigint(20) NOT NULL DEFAULT '0',
  `main_stage_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seq`),
  UNIQUE KEY `iggid` (`iggid`),
  KEY `hex_name` (`hex_name`),
  KEY `friend` (`is_online`,`main_stage_id`,`last_login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_social_player_data`
--

DROP TABLE IF EXISTS `tbl_social_player_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_social_player_data` (
  `iggid` bigint(20) NOT NULL,
  `taken_global_mail_id` varchar(1000) NOT NULL DEFAULT '',
  `last_used_post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `last_request_stamina_time` bigint(20) NOT NULL DEFAULT '0',
  `activity` int(11) NOT NULL DEFAULT '0',
  `last_week_activity` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iggid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_social_post_data`
--

DROP TABLE IF EXISTS `tbl_social_post_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_social_post_data` (
  `poster_iggid` bigint(20) NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `poster_name` varchar(30) NOT NULL DEFAULT '',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `create_time` bigint(20) NOT NULL DEFAULT '0',
  `last_update_time` bigint(20) NOT NULL DEFAULT '0',
  `i_param` bigint(20) NOT NULL DEFAULT '0',
  `s_param` varchar(200) NOT NULL DEFAULT '',
  `post_data` varchar(300) NOT NULL DEFAULT '',
  `like_num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`poster_iggid`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_social_post_like_data`
--

DROP TABLE IF EXISTS `tbl_social_post_like_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_social_post_like_data` (
  `poster_iggid` bigint(20) NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `iggid` bigint(20) NOT NULL,
  PRIMARY KEY (`poster_iggid`,`post_id`,`iggid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_social_posted_message_data`
--

DROP TABLE IF EXISTS `tbl_social_posted_message_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_social_posted_message_data` (
  `poster_iggid` bigint(20) NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `msg_index` tinyint(3) unsigned NOT NULL,
  `iggid` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `last_update_time` bigint(20) NOT NULL,
  `message` varchar(300) NOT NULL,
  PRIMARY KEY (`poster_iggid`,`post_id`,`msg_index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `amc_operation`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `amc_operation` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `amc_operation`;

--
-- Table structure for table `tbl_daily_login_bunus_info`
--

DROP TABLE IF EXISTS `tbl_daily_login_bunus_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_daily_login_bunus_info` (
  `item_key` smallint(5) unsigned NOT NULL,
  `item_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `item_num` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `modified_item_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modified_item_num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_update_time` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_key`),
  KEY `last_update_time` (`last_update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_item_shop`
--

DROP TABLE IF EXISTS `tbl_item_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_item_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `category` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `item1_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `item1_num` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `item2_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `item2_num` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `item3_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `item3_num` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `price_coin` int(11) NOT NULL DEFAULT '0',
  `price_diamond` int(11) NOT NULL DEFAULT '0',
  `start_time` bigint(20) NOT NULL DEFAULT '0',
  `end_time` bigint(20) NOT NULL DEFAULT '0',
  `image_path` varchar(200) NOT NULL DEFAULT '',
  `limitation` smallint(6) NOT NULL DEFAULT '0',
  `last_update_time` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `last_update_time` (`last_update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_match_game_bug_report`
--

DROP TABLE IF EXISTS `tbl_match_game_bug_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_match_game_bug_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iggid` bigint(20) NOT NULL,
  `create_unix_time` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_player_attr_data`
--

DROP TABLE IF EXISTS `tbl_player_attr_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_player_attr_data` (
  `iggid` bigint(20) NOT NULL,
  `attr` int(11) NOT NULL,
  `last_update_time` bigint(20) NOT NULL,
  PRIMARY KEY (`iggid`),
  KEY `last_update_time` (`last_update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_server_info`
--

DROP TABLE IF EXISTS `tbl_server_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_server_info` (
  `seq` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `required_version` varchar(20) NOT NULL DEFAULT '0.00.00',
  `news_url` varchar(255) NOT NULL DEFAULT '',
  `server_state` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_unhandled_mail_data`
--

DROP TABLE IF EXISTS `tbl_unhandled_mail_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_unhandled_mail_data` (
  `seq` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint(20) NOT NULL,
  `receiver_list` varchar(200) NOT NULL,
  `sending_time` bigint(20) NOT NULL DEFAULT '0',
  `expired_time` bigint(20) NOT NULL DEFAULT '0',
  `message` varchar(100) NOT NULL,
  `attachment_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attachment_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attachment_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `amc_log`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `amc_log` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `amc_log`;

--
-- Table structure for table `tbl_general_event_log`
--

DROP TABLE IF EXISTS `tbl_general_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_general_event_log` (
  `seq` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_time` bigint(20) NOT NULL,
  `log_type` tinyint(4) unsigned NOT NULL,
  `iggid` bigint(20) NOT NULL,
  `message` varchar(300) NOT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_login_event_log`
--

DROP TABLE IF EXISTS `tbl_login_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_login_event_log` (
  `seq` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_time` bigint(20) NOT NULL,
  `log_type` tinyint(4) unsigned NOT NULL,
  `iggid` bigint(20) NOT NULL,
  `logout_reason` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-12 15:40:20
