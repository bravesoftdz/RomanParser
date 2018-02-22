# Host: 127.0.0.1  (Version 5.7.18-log)
# Date: 2018-02-22 19:03:55
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "core_groups"
#

DROP TABLE IF EXISTS `core_groups`;
CREATE TABLE `core_groups` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_group_id` int(11) DEFAULT NULL,
  `root_chain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `parent_group_id` (`parent_group_id`),
  CONSTRAINT `core_groups_ibfk_2` FOREIGN KEY (`parent_group_id`) REFERENCES `core_groups` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8;

#
# Data for table "core_groups"
#


#
# Structure for table "core_jobs"
#

DROP TABLE IF EXISTS `core_jobs`;
CREATE TABLE `core_jobs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) NOT NULL DEFAULT '',
  `zero_link` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "core_jobs"
#

INSERT INTO `core_jobs` VALUES (1,'TripAdvisor.com','https://www.tripadvisor.ru/SiteIndex');

#
# Structure for table "core_link_handled_types"
#

DROP TABLE IF EXISTS `core_link_handled_types`;
CREATE TABLE `core_link_handled_types` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `handled_type` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "core_link_handled_types"
#

INSERT INTO `core_link_handled_types` VALUES (1,'new link'),(2,'in handling'),(3,'success handled'),(4,'error handled');

#
# Structure for table "core_links"
#

DROP TABLE IF EXISTS `core_links`;
CREATE TABLE `core_links` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) DEFAULT '0',
  `owner_group_id` int(11) DEFAULT NULL,
  `body_group_id` int(11) DEFAULT NULL,
  `url` text NOT NULL,
  `handled_type_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `handle_type_id` (`handled_type_id`),
  KEY `body_group_id` (`body_group_id`),
  KEY `owner_group_id` (`owner_group_id`),
  KEY `job_id` (`job_id`,`handled_type_id`,`level`),
  CONSTRAINT `core_links_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `core_jobs` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `core_links_ibfk_2` FOREIGN KEY (`handled_type_id`) REFERENCES `core_link_handled_types` (`Id`),
  CONSTRAINT `core_links_ibfk_3` FOREIGN KEY (`owner_group_id`) REFERENCES `core_groups` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `core_links_ibfk_4` FOREIGN KEY (`body_group_id`) REFERENCES `core_groups` (`Id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;

#
# Data for table "core_links"
#


#
# Structure for table "core_records"
#

DROP TABLE IF EXISTS `core_records`;
CREATE TABLE `core_records` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_group_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `group_id` (`owner_group_id`),
  CONSTRAINT `core_records_ibfk_1` FOREIGN KEY (`owner_group_id`) REFERENCES `groups` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;

#
# Data for table "core_records"
#


#
# Structure for table "cstm_converted_links"
#

DROP TABLE IF EXISTS `cstm_converted_links`;
CREATE TABLE `cstm_converted_links` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ext_link_id` int(11) NOT NULL DEFAULT '0',
  `error` tinyint(3) DEFAULT NULL,
  `error_msg` text,
  PRIMARY KEY (`Id`),
  KEY `ext_link_id` (`ext_link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "cstm_converted_links"
#


#
# Structure for table "cstm_output"
#

DROP TABLE IF EXISTS `cstm_output`;
CREATE TABLE `cstm_output` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `category_identifier` varchar(50) NOT NULL DEFAULT '',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ru_title` varchar(255) NOT NULL DEFAULT '',
  `en_title` varchar(255) NOT NULL DEFAULT '',
  `ua_title` varchar(255) NOT NULL DEFAULT '',
  `ru_country` varchar(100) DEFAULT NULL,
  `en_country` varchar(100) DEFAULT NULL,
  `ua_country` varchar(100) DEFAULT NULL,
  `ru_city` varchar(255) DEFAULT NULL,
  `en_city` varchar(255) DEFAULT NULL,
  `ua_city` varchar(255) DEFAULT NULL,
  `ru_address` varchar(255) DEFAULT NULL,
  `en_address` varchar(255) DEFAULT NULL,
  `ua_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `site_url` text,
  `ru_content` longtext,
  `en_content` longtext,
  `ua_content` longtext,
  `ru_contacts` varchar(255) DEFAULT NULL,
  `en_contacts` varchar(255) DEFAULT NULL,
  `ua_contacts` varchar(255) DEFAULT NULL,
  `ru_source` text NOT NULL,
  `en_source` text NOT NULL,
  `ua_source` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "cstm_output"
#


#
# Structure for table "rqst_iternal_requests"
#

DROP TABLE IF EXISTS `rqst_iternal_requests`;
CREATE TABLE `rqst_iternal_requests` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` int(11) NOT NULL DEFAULT '0',
  `url` text NOT NULL,
  `post_data` text,
  `headers` text,
  PRIMARY KEY (`Id`),
  KEY `link_id` (`link_id`),
  CONSTRAINT `rqst_iternal_requests_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `core_links` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "rqst_iternal_requests"
#


#
# Trigger "delete_body_group"
#

DROP TRIGGER IF EXISTS `delete_body_group`;
roman_parser

#
# Trigger "write_root_chain"
#

DROP TRIGGER IF EXISTS `write_root_chain`;
roman_parser
