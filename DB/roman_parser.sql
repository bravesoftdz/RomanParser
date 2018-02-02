# Host: 127.0.0.1  (Version 5.7.18-log)
# Date: 2018-02-02 08:17:31
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "converted_links"
#

DROP TABLE IF EXISTS `converted_links`;
CREATE TABLE `converted_links` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ext_link_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `ext_link_id` (`ext_link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "converted_links"
#

INSERT INTO `converted_links` VALUES (1,3),(2,4);

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
  `ua_title` varchar(255) DEFAULT NULL,
  `ru_country` varchar(255) DEFAULT NULL,
  `en_country` varchar(255) DEFAULT NULL,
  `ua_country` varchar(255) DEFAULT NULL,
  `ru_city` varchar(255) DEFAULT NULL,
  `en_city` varchar(255) DEFAULT NULL,
  `ua_city` varchar(255) DEFAULT NULL,
  `ru_address` varchar(255) DEFAULT NULL,
  `en_address` varchar(255) DEFAULT NULL,
  `ua_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `site_url` varchar(255) DEFAULT NULL,
  `ru_content` varchar(255) DEFAULT NULL,
  `en_content` varchar(255) DEFAULT NULL,
  `ua_content` varchar(255) DEFAULT NULL,
  `ru_contacts` varchar(255) DEFAULT NULL,
  `en_contacts` varchar(255) DEFAULT NULL,
  `ua_contacts` varchar(255) DEFAULT NULL,
  `ru_source` varchar(255) DEFAULT NULL,
  `en_source` varchar(255) DEFAULT NULL,
  `ua_source` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "output"
#

INSERT INTO `output` VALUES (1,'Actors','2017-09-20 00:39:26','50 Cent','50 Cent',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Actors','2017-09-20 00:39:33','Аав, Тыну','Tõnu Aav',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
