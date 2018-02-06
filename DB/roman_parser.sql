# Host: 127.0.0.1  (Version 5.7.18-log)
# Date: 2018-02-06 18:30:59
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "converted_links"
#

DROP TABLE IF EXISTS `converted_links`;
CREATE TABLE `converted_links` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ext_link_id` int(11) NOT NULL DEFAULT '0',
  `error` tinyint(3) DEFAULT NULL,
  `error_msg` text,
  PRIMARY KEY (`Id`),
  KEY `ext_link_id` (`ext_link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;

#
# Data for table "converted_links"
#


#
# Structure for table "jobs"
#

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `caption` varchar(255) NOT NULL DEFAULT '',
  `zero_link` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "jobs"
#

INSERT INTO `jobs` VALUES (1,'TripAdvisor.com','https://www.tripadvisor.ru/SiteIndex');

#
# Structure for table "link_handled_types"
#

DROP TABLE IF EXISTS `link_handled_types`;
CREATE TABLE `link_handled_types` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `handled_type` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "link_handled_types"
#

INSERT INTO `link_handled_types` VALUES (1,'new link'),(2,'in handling'),(3,'success handled'),(4,'error handled');

#
# Structure for table "links"
#

DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) DEFAULT NULL,
  `link` text NOT NULL,
  `handled_type_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `handle_type_id` (`handled_type_id`),
  KEY `job_id` (`job_id`,`handled_type_id`),
  KEY `level` (`level`),
  CONSTRAINT `links_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `links_ibfk_2` FOREIGN KEY (`handled_type_id`) REFERENCES `link_handled_types` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=471 DEFAULT CHARSET=utf8;

#
# Data for table "links"
#


#
# Structure for table "groups"
#

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `link_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `link_id` (`link_id`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`link_id`) REFERENCES `links` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8;

#
# Data for table "groups"
#


#
# Structure for table "output"
#

DROP TABLE IF EXISTS `output`;
CREATE TABLE `output` (
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
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

#
# Data for table "output"
#


#
# Structure for table "records"
#

DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `records_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=utf8;

#
# Data for table "records"
#

