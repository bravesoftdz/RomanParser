# Host: 127.0.0.1  (Version 5.7.18-log)
# Date: 2018-02-05 18:26:20
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

#
# Data for table "converted_links"
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
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;

#
# Data for table "output"
#

