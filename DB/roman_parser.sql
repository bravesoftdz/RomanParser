# Host: 127.0.0.1  (Version 5.7.18-log)
# Date: 2018-02-25 14:08:12
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
) ENGINE=InnoDB AUTO_INCREMENT=886 DEFAULT CHARSET=utf8;

#
# Data for table "core_groups"
#

INSERT INTO `core_groups` VALUES (886,NULL,NULL),(887,886,'886'),(888,886,'886'),(889,886,'886'),(890,886,'886'),(891,886,'886'),(892,886,'886'),(893,886,'886'),(894,886,'886'),(895,886,'886'),(896,886,'886'),(897,886,'886'),(898,886,'886'),(899,886,'886'),(900,886,'886'),(901,886,'886'),(902,886,'886'),(903,886,'886'),(904,886,'886'),(905,886,'886'),(906,886,'886'),(907,886,'886'),(908,886,'886'),(909,886,'886'),(910,886,'886'),(911,886,'886'),(912,886,'886'),(913,886,'886'),(914,886,'886'),(915,886,'886'),(916,886,'886'),(917,886,'886'),(918,886,'886'),(919,886,'886'),(920,886,'886'),(921,886,'886'),(922,886,'886'),(923,886,'886'),(924,886,'886'),(925,886,'886'),(926,886,'886'),(927,886,'886'),(928,886,'886'),(929,886,'886'),(930,886,'886'),(931,886,'886'),(932,886,'886'),(933,886,'886'),(934,886,'886'),(935,886,'886'),(936,886,'886'),(937,886,'886'),(938,886,'886'),(939,886,'886'),(940,886,'886'),(941,886,'886'),(942,886,'886'),(943,886,'886'),(944,886,'886'),(945,886,'886'),(946,886,'886'),(947,886,'886'),(948,886,'886'),(949,886,'886'),(950,886,'886'),(951,886,'886'),(952,886,'886'),(953,886,'886'),(954,886,'886'),(955,886,'886'),(956,886,'886'),(957,886,'886'),(958,886,'886'),(959,886,'886'),(960,886,'886'),(961,886,'886'),(962,886,'886'),(963,886,'886'),(964,886,'886'),(965,886,'886'),(966,886,'886'),(967,886,'886'),(968,886,'886'),(969,886,'886'),(970,886,'886'),(971,886,'886'),(972,886,'886'),(973,886,'886'),(974,886,'886'),(975,886,'886'),(976,886,'886'),(977,886,'886'),(978,886,'886'),(979,886,'886'),(980,886,'886'),(981,886,'886'),(982,886,'886'),(983,886,'886'),(984,886,'886'),(985,886,'886'),(986,886,'886'),(987,886,'886'),(988,886,'886'),(989,886,'886'),(990,886,'886'),(991,886,'886'),(992,886,'886'),(993,886,'886'),(994,886,'886'),(995,886,'886'),(996,886,'886'),(997,886,'886'),(998,886,'886'),(999,886,'886'),(1000,886,'886'),(1001,886,'886'),(1002,886,'886'),(1003,886,'886'),(1004,886,'886'),(1005,886,'886'),(1006,886,'886'),(1007,886,'886'),(1008,886,'886'),(1009,886,'886'),(1010,886,'886'),(1011,886,'886'),(1012,886,'886'),(1013,886,'886'),(1014,886,'886'),(1015,886,'886'),(1016,886,'886'),(1017,886,'886'),(1018,886,'886'),(1019,886,'886'),(1020,886,'886'),(1021,886,'886'),(1022,886,'886'),(1023,886,'886'),(1024,886,'886'),(1025,886,'886'),(1026,886,'886'),(1027,886,'886'),(1028,886,'886'),(1029,886,'886'),(1030,886,'886'),(1031,886,'886'),(1032,886,'886'),(1033,886,'886'),(1034,886,'886'),(1035,886,'886'),(1036,886,'886'),(1037,886,'886'),(1038,886,'886'),(1039,886,'886'),(1040,886,'886'),(1041,886,'886'),(1042,886,'886'),(1043,886,'886'),(1044,886,'886'),(1045,886,'886'),(1046,886,'886'),(1047,886,'886'),(1048,886,'886'),(1049,886,'886'),(1050,886,'886'),(1051,886,'886'),(1052,886,'886'),(1053,886,'886'),(1054,886,'886'),(1055,886,'886'),(1056,886,'886'),(1057,886,'886'),(1058,886,'886'),(1059,886,'886'),(1060,886,'886'),(1061,886,'886'),(1062,886,'886'),(1063,886,'886'),(1064,886,'886'),(1065,886,'886'),(1066,886,'886'),(1067,886,'886'),(1068,886,'886'),(1069,886,'886'),(1070,886,'886'),(1071,886,'886'),(1072,886,'886'),(1073,886,'886'),(1074,886,'886'),(1075,886,'886'),(1076,886,'886'),(1077,886,'886'),(1078,886,'886'),(1079,886,'886'),(1080,886,'886'),(1081,886,'886'),(1082,886,'886'),(1083,886,'886'),(1084,886,'886'),(1085,886,'886'),(1086,886,'886'),(1087,886,'886'),(1088,886,'886'),(1089,886,'886'),(1090,886,'886'),(1091,886,'886'),(1092,886,'886'),(1093,886,'886'),(1094,886,'886'),(1095,886,'886'),(1096,886,'886'),(1097,886,'886'),(1098,886,'886'),(1099,886,'886'),(1100,886,'886'),(1101,886,'886'),(1102,886,'886'),(1103,886,'886'),(1104,886,'886'),(1105,886,'886'),(1106,886,'886'),(1107,886,'886'),(1108,886,'886'),(1109,886,'886'),(1110,886,'886'),(1111,886,'886'),(1112,886,'886'),(1113,886,'886'),(1114,886,'886'),(1115,886,'886'),(1116,886,'886'),(1117,886,'886'),(1118,886,'886'),(1119,888,'886;888'),(1120,1119,'886;888;1119');

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
  `hash` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `hash_job_id` (`job_id`,`hash`),
  KEY `handle_type_id` (`handled_type_id`),
  KEY `body_group_id` (`body_group_id`),
  KEY `owner_group_id` (`owner_group_id`),
  KEY `level_job_id` (`job_id`,`level`),
  CONSTRAINT `core_links_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `core_jobs` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `core_links_ibfk_2` FOREIGN KEY (`handled_type_id`) REFERENCES `core_link_handled_types` (`Id`),
  CONSTRAINT `core_links_ibfk_3` FOREIGN KEY (`owner_group_id`) REFERENCES `core_groups` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `core_links_ibfk_4` FOREIGN KEY (`body_group_id`) REFERENCES `core_groups` (`Id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=721 DEFAULT CHARSET=utf8;

#
# Data for table "core_links"
#

INSERT INTO `core_links` VALUES (487,1,NULL,NULL,886,'https://www.tripadvisor.ru/SiteIndex',3,'259e648a0b263a265c02b31b0d9afa4b'),(488,1,1,887,NULL,'https://www.tripadvisor.ru/SiteIndex-g1778095-Aboa.html',2,'eced66c97d52e7f8c3c4d0dd16a46a58'),(489,1,1,888,1119,'https://www.tripadvisor.ru/SiteIndex-g1023749-South_Georgia_and_the_South_Sandwich_Islands.html',3,'6b685a2db7a6f512ae3ab44172a6fad9'),(490,1,1,889,NULL,'https://www.tripadvisor.ru/SiteIndex-g255055-Australia.html',1,'97a8cc44b1a63e752d0b38b38e5e33f0'),(491,1,1,890,NULL,'https://www.tripadvisor.ru/SiteIndex-g190410-Austria.html',1,'d20f9ed058b087b0fc73a20994a5accb'),(492,1,1,891,NULL,'https://www.tripadvisor.ru/SiteIndex-g293933-Azerbaijan.html',1,'00ce9a7e6909431310fcdfa50e129068'),(493,1,1,892,NULL,'https://www.tripadvisor.ru/SiteIndex-g2-Asia.html',1,'6369966f8d469d71a6de82d5da82ac21'),(494,1,1,893,NULL,'https://www.tripadvisor.ru/SiteIndex-g294445-Albania.html',1,'5c5810ba92114a6ec89dc0827537fc85'),(495,1,1,894,NULL,'https://www.tripadvisor.ru/SiteIndex-g293717-Algeria.html',1,'c73fbfa382924631ff0aade0db4f2215'),(496,1,1,895,NULL,'https://www.tripadvisor.ru/SiteIndex-g60665-American_Samoa.html',1,'d005abeccb2c045f87caee57a7a9eee6'),(497,1,1,896,NULL,'https://www.tripadvisor.ru/SiteIndex-g293762-Angola.html',1,'764ddea38e002487c0691b4dfbb4a1b2'),(498,1,1,897,NULL,'https://www.tripadvisor.ru/SiteIndex-g190391-Andorra.html',1,'15e975c90ec8e6cef4010d3d3671c2bb'),(499,1,1,898,NULL,'https://www.tripadvisor.ru/SiteIndex-g12-Antarctica.html',1,'4e66b9a62157548ba049b1d582d4bb44'),(500,1,1,899,NULL,'https://www.tripadvisor.ru/SiteIndex-g660183-Antarctic_Peninsula.html',1,'be44ad2c80f7f80ccbda5ab07119a761'),(501,1,1,900,NULL,'https://www.tripadvisor.ru/SiteIndex-g294266-Argentina.html',1,'be6a642ab5a248db1773115537c75e09'),(502,1,1,901,NULL,'https://www.tripadvisor.ru/SiteIndex-g293931-Armenia.html',1,'388525cdd2e6646369c7e586da5ca2ba'),(503,1,1,902,NULL,'https://www.tripadvisor.ru/SiteIndex-g60666-Johnston_Atoll.html',1,'ccd46052f13d51ebf5485d81e2f32b2e'),(504,1,1,903,NULL,'https://www.tripadvisor.ru/SiteIndex-g659499-Afghanistan.html',1,'309428cef726b04ac2415f748ab06d8c'),(505,1,1,904,NULL,'https://www.tripadvisor.ru/SiteIndex-g6-Africa.html',1,'7be1ef063b73fd1b5befebd15fe7337f'),(506,1,1,905,NULL,'https://www.tripadvisor.ru/SiteIndex-g293935-Bangladesh.html',1,'a3d66b76a84f99c2627e0f187a53b96c'),(507,1,1,906,NULL,'https://www.tripadvisor.ru/SiteIndex-g293996-Bahrain.html',1,'1d02d8e4270619a3ac525ffddc7b3c16'),(508,1,1,907,NULL,'https://www.tripadvisor.ru/SiteIndex-g294447-Belarus.html',1,'c5ac82bd1f92345a1b0ca0cb821e4875'),(509,1,1,908,NULL,'https://www.tripadvisor.ru/SiteIndex-g291959-Belize.html',1,'c1981fffe1f4684bcc541487281ea371'),(510,1,1,909,NULL,'https://www.tripadvisor.ru/SiteIndex-g188634-Belgium.html',1,'09dda4858ba6fbea5612bd7bd3a03fac'),(511,1,1,910,NULL,'https://www.tripadvisor.ru/SiteIndex-g293764-Benin.html',1,'1a81778912be516dae5134a7617c66d3'),(512,1,1,911,NULL,'https://www.tripadvisor.ru/SiteIndex-g21-Middle_East.html',1,'50bdf90ef69214a8e9b5d3f19c0b3abb'),(513,1,1,912,NULL,'https://www.tripadvisor.ru/SiteIndex-g294451-Bulgaria.html',1,'e46d8ee503f675181ea9f4e600d00d73'),(514,1,1,913,NULL,'https://www.tripadvisor.ru/SiteIndex-g294071-Bolivia.html',1,'29476a557a6bd350127724817a8a723a'),(515,1,1,914,NULL,'https://www.tripadvisor.ru/SiteIndex-g294449-Bosnia_and_Herzegovina.html',1,'39d05e4b370281e9e4c1fbbf46cbd516'),(516,1,1,915,NULL,'https://www.tripadvisor.ru/SiteIndex-g293766-Botswana.html',1,'dd23663806c52d2f55ee8549d88b876b'),(517,1,1,916,NULL,'https://www.tripadvisor.ru/SiteIndex-g294280-Brazil.html',1,'ec0af71a8f4c0407fc731f263ae45e2c'),(518,1,1,917,NULL,'https://www.tripadvisor.ru/SiteIndex-g670819-Indian_Ocean.html',1,'57c3846d67c4f51bf5f3c91658a11b7f'),(519,1,1,918,NULL,'https://www.tripadvisor.ru/SiteIndex-g293937-Brunei_Darussalam.html',1,'20ee35007c2c8b3461a7de9c75de99fb'),(520,1,1,919,NULL,'https://www.tripadvisor.ru/SiteIndex-g293768-Burkina_Faso.html',1,'9821845bd4cc55d887fa63005c6efd42'),(521,1,1,920,NULL,'https://www.tripadvisor.ru/SiteIndex-g293770-Burundi.html',1,'f37f4a1c8399a36b044203cc526b86d2'),(522,1,1,921,NULL,'https://www.tripadvisor.ru/SiteIndex-g293844-Bhutan.html',1,'adeed2bc34406036c4f8702011d1ccdc'),(523,1,1,922,NULL,'https://www.tripadvisor.ru/SiteIndex-g294143-Vanuatu.html',1,'9d09531184ac6cc669b640bdb21f5931'),(524,1,1,923,NULL,'https://www.tripadvisor.ru/SiteIndex-g186216-United_Kingdom.html',1,'cb27eb134c8f1b036d324c3c6293bc97'),(525,1,1,924,NULL,'https://www.tripadvisor.ru/SiteIndex-g274881-Hungary.html',1,'8b1e34138355ae05092491ddf7649aba'),(526,1,1,925,NULL,'https://www.tripadvisor.ru/SiteIndex-g294324-Venezuela.html',1,'a0e8e3470143665c2cc3c87181be73cc'),(527,1,1,926,NULL,'https://www.tripadvisor.ru/SiteIndex-g295117-East_Timor.html',1,'300b5d15c88bcebb93e767f297bbb74f'),(528,1,1,927,NULL,'https://www.tripadvisor.ru/SiteIndex-g293921-Vietnam.html',1,'72e60eba565f551ab1aaa811191c3897'),(529,1,1,928,NULL,'https://www.tripadvisor.ru/SiteIndex-g293792-Gabon.html',1,'c9967737922e412343a0a21ba847d150'),(530,1,1,929,NULL,'https://www.tripadvisor.ru/SiteIndex-g294077-Guyana.html',1,'4bcfd8a4c924d3e8d0bd17718160548e'),(531,1,1,930,NULL,'https://www.tripadvisor.ru/SiteIndex-g293794-Gambia.html',1,'0a9f83e924a00b7506cf9090eacefe78'),(532,1,1,931,NULL,'https://www.tripadvisor.ru/SiteIndex-g293796-Ghana.html',1,'87eab84caad5fa802e85d3e57a9cf41e'),(533,1,1,932,NULL,'https://www.tripadvisor.ru/SiteIndex-g292002-Guatemala.html',1,'30251c8c531fad08bc47409bf2674654'),(534,1,1,933,NULL,'https://www.tripadvisor.ru/SiteIndex-g293798-Guinea.html',1,'b03bdb4ad8183d2365afa8dc1260c77f'),(535,1,1,934,NULL,'https://www.tripadvisor.ru/SiteIndex-g293800-Guinea_Bissau.html',1,'5f8ae628b680c7fa2e7b95958d17e8e1'),(536,1,1,935,NULL,'https://www.tripadvisor.ru/SiteIndex-g187275-Germany.html',1,'3fe4317471aac073d16cde93b11bd3e0'),(537,1,1,936,NULL,'https://www.tripadvisor.ru/SiteIndex-g187510-Gibraltar.html',1,'cf42a7c2d280609869be2a92dc28b4c5'),(538,1,1,937,NULL,'https://www.tripadvisor.ru/SiteIndex-g1389503-Golan_Heights.html',1,'d9dac1b59bfc7addeaa7594b91df7a86'),(539,1,1,938,NULL,'https://www.tripadvisor.ru/SiteIndex-g292016-Honduras.html',1,'5de6826f4836150db6f394caca735445'),(540,1,1,939,NULL,'https://www.tripadvisor.ru/SiteIndex-g295111-Greenland.html',1,'7600ffd0d304cecb34c2140a79924a23'),(541,1,1,940,NULL,'https://www.tripadvisor.ru/SiteIndex-g189398-Greece.html',1,'ecaf1e6b2cb60ce72bb11031ac5d2bc2'),(542,1,1,941,NULL,'https://www.tripadvisor.ru/SiteIndex-g294194-Georgia.html',1,'0d9b6c3ab88b383c387a68821cb4d29f'),(543,1,1,942,NULL,'https://www.tripadvisor.ru/SiteIndex-g189512-Denmark.html',1,'d7794ff20ca3c02e9325f47bd028fbc3'),(544,1,1,943,NULL,'https://www.tripadvisor.ru/SiteIndex-g294186-Democratic_Republic_of_the_Congo.html',1,'29948b6bc8cb0d5de1235e8d93e4cab6'),(545,1,1,944,NULL,'https://www.tripadvisor.ru/SiteIndex-g294441-Sao_Tome_and_Principe.html',1,'304d8aeae9b3c1064e7760d76dcf27f4'),(546,1,1,945,NULL,'https://www.tripadvisor.ru/SiteIndex-g293786-Djibouti.html',1,'b1670601f44779379d8fcff01d0cec69'),(547,1,1,946,NULL,'https://www.tripadvisor.ru/SiteIndex-g4-Europe.html',1,'7e37b6da2fcd3f1bbfd45ee9971a24b9'),(548,1,1,947,NULL,'https://www.tripadvisor.ru/SiteIndex-g294200-Egypt.html',1,'f2c4c8e29eea2c6fcd3ebbc7d696cee8'),(549,1,1,948,NULL,'https://www.tripadvisor.ru/SiteIndex-g293842-Zambia.html',1,'ed45ccceb567cbc9d6c9058410807d91'),(550,1,1,949,NULL,'https://www.tripadvisor.ru/SiteIndex-g295118-Western_Sahara.html',1,'787e3bc5e77dcaa3b983220e29eb24bd'),(551,1,1,950,NULL,'https://www.tripadvisor.ru/SiteIndex-g1808587-Princess_Elizabeth_Land.html',1,'09e1bf136c865bad3cd6e61db3e71d58'),(552,1,1,951,NULL,'https://www.tripadvisor.ru/SiteIndex-g293759-Zimbabwe.html',1,'e4985df7adc1042a7fbbd3c491438e27'),(553,1,1,952,NULL,'https://www.tripadvisor.ru/SiteIndex-g293977-Israel.html',1,'6734c614804407777ef8a97ce74d23f8'),(554,1,1,953,NULL,'https://www.tripadvisor.ru/SiteIndex-g1207796-Ile_Juan_da_Nova.html',1,'1bbce25e8ca0fe7e974a3e7f1e44844b'),(555,1,1,954,NULL,'https://www.tripadvisor.ru/SiteIndex-g1207794-Ile_Europa.html',1,'fde26c1924ad117ec91a6017552b8447'),(556,1,1,955,NULL,'https://www.tripadvisor.ru/SiteIndex-g293860-India.html',1,'cc5f4bd9d503fb75f60c5f7303446b72'),(557,1,1,956,NULL,'https://www.tripadvisor.ru/SiteIndex-g294225-Indonesia.html',1,'a36274376e4a06ad0e08c8c74fa451c0'),(558,1,1,957,NULL,'https://www.tripadvisor.ru/SiteIndex-g293985-Jordan.html',1,'01395ca21d94bb834afe8496cf3ea948'),(559,1,1,958,NULL,'https://www.tripadvisor.ru/SiteIndex-g294000-Iraq.html',1,'80ba493995205fe2090cdf8a70e560cb'),(560,1,1,959,NULL,'https://www.tripadvisor.ru/SiteIndex-g293998-Iran.html',1,'1fd5b3398494187f9da9909177a623ac'),(561,1,1,960,NULL,'https://www.tripadvisor.ru/SiteIndex-g186591-Ireland.html',1,'4c7eacdfc1392088b26e00931764a8dc'),(562,1,1,961,NULL,'https://www.tripadvisor.ru/SiteIndex-g189952-Iceland.html',1,'2ee7aabb1608968ca621f460db5bd94c'),(563,1,1,962,NULL,'https://www.tripadvisor.ru/SiteIndex-g187427-Spain.html',1,'ba844c8886c7f965f7015261e58e9062'),(564,1,1,963,NULL,'https://www.tripadvisor.ru/SiteIndex-g187768-Italy.html',1,'ed99bfc9486699568f62e017a449e130'),(565,1,1,964,NULL,'https://www.tripadvisor.ru/SiteIndex-g294014-Yemen.html',1,'919f6196d8a4a0f0b9c7f81e142f4d87'),(566,1,1,965,NULL,'https://www.tripadvisor.ru/SiteIndex-g293774-Cape_Verde.html',1,'d28800b33d25a053df624cceb04c156c'),(567,1,1,966,NULL,'https://www.tripadvisor.ru/SiteIndex-g293943-Kazakhstan.html',1,'314ea233fd2894ceda792b53a456eeae'),(568,1,1,967,NULL,'https://www.tripadvisor.ru/SiteIndex-g293939-Cambodia.html',1,'250f56fd944c4e77c026e01dffd5d443'),(569,1,1,968,NULL,'https://www.tripadvisor.ru/SiteIndex-g293772-Cameroon.html',1,'43ef5da028ed4e397ec9cb9bf2988594'),(570,1,1,969,NULL,'https://www.tripadvisor.ru/SiteIndex-g153339-Canada.html',1,'b1bbdfa8ee144abb9f39acb9de66771c'),(571,1,1,970,NULL,'https://www.tripadvisor.ru/SiteIndex-g147237-Caribbean.html',1,'f337073e43bf965d229c19b946470c31'),(572,1,1,971,NULL,'https://www.tripadvisor.ru/SiteIndex-g294008-Qatar.html',1,'cf2b1338be55839600e24cd427a12092'),(573,1,1,972,NULL,'https://www.tripadvisor.ru/SiteIndex-g294206-Kenya.html',1,'5b33d18d5cd68c7c8544844662d8e346'),(574,1,1,973,NULL,'https://www.tripadvisor.ru/SiteIndex-g190372-Cyprus.html',1,'0e627d9a4f3f29d28f639c9b751db807'),(575,1,1,974,NULL,'https://www.tripadvisor.ru/SiteIndex-g293947-Kyrgyzstan.html',1,'d46bc0113f611509e0f33475429fe825'),(576,1,1,975,NULL,'https://www.tripadvisor.ru/SiteIndex-g294211-China.html',1,'2d28a9ea2bb4a74bab98750622faced8'),(577,1,1,976,NULL,'https://www.tripadvisor.ru/SiteIndex-g294073-Colombia.html',1,'3e0a0c7f3ce25f923cae24f6c79bc4b3'),(578,1,1,977,NULL,'https://www.tripadvisor.ru/SiteIndex-g294435-Comoros.html',1,'317c42315d5c0e95ffad3ca021c21fe5'),(579,1,1,978,NULL,'https://www.tripadvisor.ru/SiteIndex-g304082-Kosovo.html',1,'86575b232d3e551a0b784d3a7f28a0ad'),(580,1,1,979,NULL,'https://www.tripadvisor.ru/SiteIndex-g291982-Costa_Rica.html',1,'2f48a4df39dcc9738831192967aa35f0'),(581,1,1,980,NULL,'https://www.tripadvisor.ru/SiteIndex-g294192-Cote_d_Ivoire.html',1,'e6bfc16028c19c51b4761fdf67f8d122'),(582,1,1,981,NULL,'https://www.tripadvisor.ru/SiteIndex-g313972-Crimea.html',1,'21e6722e5423fa72894cda1c866439fa'),(583,1,1,982,NULL,'https://www.tripadvisor.ru/SiteIndex-g294002-Kuwait.html',1,'eb3085f54381a12b2e201f2e20dacebb'),(584,1,1,983,NULL,'https://www.tripadvisor.ru/SiteIndex-g293949-Laos.html',1,'b8887ffaeb785312c2503e3f6b2c9076'),(585,1,1,984,NULL,'https://www.tripadvisor.ru/SiteIndex-g274960-Latvia.html',1,'8705b898b9c9142281ccc5aadcd8e54f'),(586,1,1,985,NULL,'https://www.tripadvisor.ru/SiteIndex-g293802-Lesotho.html',1,'1744aa272d6014365ee22010f16d08ce'),(587,1,1,986,NULL,'https://www.tripadvisor.ru/SiteIndex-g293804-Liberia.html',1,'8debe578d3fa51be2fc70dfb993bc5ec'),(588,1,1,987,NULL,'https://www.tripadvisor.ru/SiteIndex-g294004-Lebanon.html',1,'2b1de8f7f24d7a9455141afb9ed07e8e'),(589,1,1,988,NULL,'https://www.tripadvisor.ru/SiteIndex-g293806-Libya.html',1,'4eadf7ea253be89308d283c077830e46'),(590,1,1,989,NULL,'https://www.tripadvisor.ru/SiteIndex-g274947-Lithuania.html',1,'279fadb05c1180ef68edd947e89da7c6'),(591,1,1,990,NULL,'https://www.tripadvisor.ru/SiteIndex-g190357-Liechtenstein.html',1,'0d00c842e6cab2862ed5ebba6265a3c5'),(592,1,1,991,NULL,'https://www.tripadvisor.ru/SiteIndex-g190340-Luxembourg.html',1,'38ce9f0630a6b67c1a62f40b796fbaf2'),(593,1,1,992,NULL,'https://www.tripadvisor.ru/SiteIndex-g293816-Mauritius.html',1,'1dd2ecfcd278591379b92c68186d42f0'),(594,1,1,993,NULL,'https://www.tripadvisor.ru/SiteIndex-g293814-Mauritania.html',1,'fa4adb71782c49bd725b863d5ce7ccd7'),(595,1,1,994,NULL,'https://www.tripadvisor.ru/SiteIndex-g293808-Madagascar.html',1,'cb5281849d5ff64857b435cf4b3d6a21'),(596,1,1,995,NULL,'https://www.tripadvisor.ru/SiteIndex-g295116-Mayotte.html',1,'b836f5b588c58ee35f210a16a4b4c878'),(597,1,1,996,NULL,'https://www.tripadvisor.ru/SiteIndex-g293810-Malawi.html',1,'700115fe2e11115bd6d8e2cebedb870a'),(598,1,1,997,NULL,'https://www.tripadvisor.ru/SiteIndex-g293951-Malaysia.html',1,'db2b03b9d357cce0881506011cbdb106'),(599,1,1,998,NULL,'https://www.tripadvisor.ru/SiteIndex-g293812-Mali.html',1,'ff8646e39b755fd90986d7a5a149e1bb'),(600,1,1,999,NULL,'https://www.tripadvisor.ru/SiteIndex-g293953-Maldives.html',1,'d53c3d65424c6dfcde283eb79972a6a3'),(601,1,1,1000,NULL,'https://www.tripadvisor.ru/SiteIndex-g190311-Malta.html',1,'62f13a7373a70d36d36a622ef795c740'),(602,1,1,1001,NULL,'https://www.tripadvisor.ru/SiteIndex-g1487275-Mariana_Islands.html',1,'31a52750a695ba9137d76fb724a77ea2'),(603,1,1,1002,NULL,'https://www.tripadvisor.ru/SiteIndex-g293730-Morocco.html',1,'c74d084ff97c9d4d1e2253e96daa1271'),(604,1,1,1003,NULL,'https://www.tripadvisor.ru/SiteIndex-g301392-Marshall_Islands.html',1,'9b443195b693a722b870116b88ecd11f'),(605,1,1,1004,NULL,'https://www.tripadvisor.ru/SiteIndex-g150768-Mexico.html',1,'a7a8c4b34023fc4c18f2ba4af1ac7cc3'),(606,1,1,1005,NULL,'https://www.tripadvisor.ru/SiteIndex-g1-World.html',1,'5dc441bf0edddb733b49c08d4c2ffa05'),(607,1,1,1006,NULL,'https://www.tripadvisor.ru/SiteIndex-g293818-Mozambique.html',1,'4385cb0d560866c00b96128461bdb601'),(608,1,1,1007,NULL,'https://www.tripadvisor.ru/SiteIndex-g294455-Moldova.html',1,'d0419691ef5381d04b21a38e418cfb96'),(609,1,1,1008,NULL,'https://www.tripadvisor.ru/SiteIndex-g190405-Monaco.html',1,'245b924fa055b7025fa46818e62d1dbb'),(610,1,1,1009,NULL,'https://www.tripadvisor.ru/SiteIndex-g293955-Mongolia.html',1,'d2dba4d049a1448e23f0fc6e2cb5f52c'),(611,1,1,1010,NULL,'https://www.tripadvisor.ru/SiteIndex-g294190-Myanmar.html',1,'0bf1d4eb2560c96f1214250f6d54e125'),(612,1,1,1011,NULL,'https://www.tripadvisor.ru/SiteIndex-g293820-Namibia.html',1,'cfe208103b7d7d3bd538b1e783ab8e6e'),(613,1,1,1012,NULL,'https://www.tripadvisor.ru/SiteIndex-g294127-Nauru.html',1,'2ea70019809cad49ef5bf0eaaa5aa7cc'),(614,1,1,1013,NULL,'https://www.tripadvisor.ru/SiteIndex-g293889-Nepal.html',1,'e693768965f1320893c610e14589d229'),(615,1,1,1014,NULL,'https://www.tripadvisor.ru/SiteIndex-g293822-Niger.html',1,'229add17b2f61d1da9717003a7a79149'),(616,1,1,1015,NULL,'https://www.tripadvisor.ru/SiteIndex-g293824-Nigeria.html',1,'3d7fc3e3d5231978b22cc07ff432691b'),(617,1,1,1016,NULL,'https://www.tripadvisor.ru/SiteIndex-g188553-The_Netherlands.html',1,'cbe019b0de73bf0c289918d427fdfe50'),(618,1,1,1017,NULL,'https://www.tripadvisor.ru/SiteIndex-g294477-Nicaragua.html',1,'e20a98ea3cf60d8004c7ac2c900f7a6f'),(619,1,1,1018,NULL,'https://www.tripadvisor.ru/SiteIndex-g294131-Niue.html',1,'7bc6cafbf03a4dad9338e868eef5c9e2'),(620,1,1,1019,NULL,'https://www.tripadvisor.ru/SiteIndex-g255104-New_Zealand.html',1,'0fe70b270462af937697a95391de6d46'),(621,1,1,1020,NULL,'https://www.tripadvisor.ru/SiteIndex-g294129-New_Caledonia.html',1,'2bb84535e0103469f7f4752c5571344f'),(622,1,1,1021,NULL,'https://www.tripadvisor.ru/SiteIndex-g190455-Norway.html',1,'fb42b739bbf25f6c5f803a122a4fe4c1'),(623,1,1,1022,NULL,'https://www.tripadvisor.ru/SiteIndex-g294012-United_Arab_Emirates.html',1,'5075d117e5fad97ec0485994e865a50d'),(624,1,1,1023,NULL,'https://www.tripadvisor.ru/SiteIndex-g294006-Oman.html',1,'116cc30992cd302235027854f977e2a4'),(625,1,1,1024,NULL,'https://www.tripadvisor.ru/SiteIndex-g662273-Cuverville_Island.html',1,'de1ef9dca770628a00e98d0b079163f1'),(626,1,1,1025,NULL,'https://www.tripadvisor.ru/SiteIndex-g293826-Reunion_Island.html',1,'604f78cbaa6abe8fc0bd1929a1c07ea8'),(627,1,1,1026,NULL,'https://www.tripadvisor.ru/SiteIndex-g660186-Ross_Island.html',1,'69283cef7cbe08b98304ebd73d15f1f6'),(628,1,1,1027,NULL,'https://www.tripadvisor.ru/SiteIndex-g295105-St_Helena_Ascension_and_Tristan_da_Cunha.html',1,'c79b460c1caf0874c4334e5214e45dc0'),(629,1,1,1028,NULL,'https://www.tripadvisor.ru/SiteIndex-g60667-Wake_Island.html',1,'64b9e5e7acbf0aeb805802f46e312b6a'),(630,1,1,1029,NULL,'https://www.tripadvisor.ru/SiteIndex-g294328-Cook_Islands.html',1,'f4be65fb60644b6db2c1dc1f9e901003'),(631,1,1,1030,NULL,'https://www.tripadvisor.ru/SiteIndex-g673774-Pitcairn_Islands.html',1,'6d1274b32aa95ca98944c2690fe0ab19'),(632,1,1,1031,NULL,'https://www.tripadvisor.ru/SiteIndex-g1504597-Windmill_Islands.html',1,'32fbc14ca51943d6d2131785b4ee8180'),(633,1,1,1032,NULL,'https://www.tripadvisor.ru/SiteIndex-g293959-Pakistan.html',1,'969e4386d42bfd0d9d7dae88bb5e63fd'),(634,1,1,1033,NULL,'https://www.tripadvisor.ru/SiteIndex-g294135-Palau.html',1,'b9693e4d9527bcba6f2878679153842c'),(635,1,1,1034,NULL,'https://www.tripadvisor.ru/SiteIndex-g660378-Palestinian_Territories.html',1,'5dde2cbb1d8ee0d2140f33b90d065f80'),(636,1,1,1035,NULL,'https://www.tripadvisor.ru/SiteIndex-g294479-Panama.html',1,'2abea133a7a7c02925e3717eaa166ea9'),(637,1,1,1036,NULL,'https://www.tripadvisor.ru/SiteIndex-g294115-Papua_New_Guinea.html',1,'d098487f12c653a059a111233c52a15c'),(638,1,1,1037,NULL,'https://www.tripadvisor.ru/SiteIndex-g294079-Paraguay.html',1,'f8fa4b52b97a141efbdcef7e29e67f55'),(639,1,1,1038,NULL,'https://www.tripadvisor.ru/SiteIndex-g294311-Peru.html',1,'7105fa21555b21f58c0083f854162cec'),(640,1,1,1039,NULL,'https://www.tripadvisor.ru/SiteIndex-g274723-Poland.html',1,'26ef7736f5f0f0ec48b8f026d903d32b'),(641,1,1,1040,NULL,'https://www.tripadvisor.ru/SiteIndex-g189100-Portugal.html',1,'691dc8b2aca00365180a121baa9a7c1c'),(642,1,1,1041,NULL,'https://www.tripadvisor.ru/SiteIndex-g294121-Republic_of_Kiribati.html',1,'b41cb1ccbaabd0343988ab969d77ed0c'),(643,1,1,1042,NULL,'https://www.tripadvisor.ru/SiteIndex-g294188-Republic_of_the_Congo.html',1,'116c5bf17cac32de7651825de8350222'),(644,1,1,1043,NULL,'https://www.tripadvisor.ru/SiteIndex-g295109-Republic_of_Macedonia.html',1,'41352b521e37c2a989cab9bcbaccd3ce'),(645,1,1,1044,NULL,'https://www.tripadvisor.ru/SiteIndex-g294459-Russia.html',1,'5305c9b2f569a1433a25b51a73e49a84'),(646,1,1,1045,NULL,'https://www.tripadvisor.ru/SiteIndex-g293828-Rwanda.html',1,'93c075fc965104d566634bbd9ed9411a'),(647,1,1,1046,NULL,'https://www.tripadvisor.ru/SiteIndex-g294457-Romania.html',1,'2880050c3891ba067ee8aa04a93a6d58'),(648,1,1,1047,NULL,'https://www.tripadvisor.ru/SiteIndex-g191-United_States.html',1,'7d5d6ec356611103d646f64b17ea26e5'),(649,1,1,1048,NULL,'https://www.tripadvisor.ru/SiteIndex-g294475-El_Salvador.html',1,'bd12339038b947ae9336912a799212a0'),(650,1,1,1049,NULL,'https://www.tripadvisor.ru/SiteIndex-g294137-Samoa.html',1,'98c285c73562c5917428dfa3726110d2'),(651,1,1,1050,NULL,'https://www.tripadvisor.ru/SiteIndex-g187808-San_Marino.html',1,'64e880462b048fb7520f2a1e8bd2bcbf'),(652,1,1,1051,NULL,'https://www.tripadvisor.ru/SiteIndex-g293991-Saudi_Arabia.html',1,'47a7966be5911598ee78a43945625a46'),(653,1,1,1052,NULL,'https://www.tripadvisor.ru/SiteIndex-g293836-Swaziland.html',1,'f4a5e78b6a21a37254754fe974c1f24f'),(654,1,1,1053,NULL,'https://www.tripadvisor.ru/SiteIndex-g19-North_America.html',1,'ff534918979ace053f5fd2c53904f9aa'),(655,1,1,1054,NULL,'https://www.tripadvisor.ru/SiteIndex-g294443-North_Korea.html',1,'bb645cc19ace8aac2f0eafb7626b5b39'),(656,1,1,1055,NULL,'https://www.tripadvisor.ru/SiteIndex-g293738-Seychelles.html',1,'14399bf37f0af8533c3fe1f0b2c4d6b2'),(657,1,1,1056,NULL,'https://www.tripadvisor.ru/SiteIndex-g183815-Saint_Pierre_and_Miquelon.html',1,'c33fbca69b47c97bd55b79f59a9f2f73'),(658,1,1,1057,NULL,'https://www.tripadvisor.ru/SiteIndex-g293830-Senegal.html',1,'66b5b9eb4198fb379fb46657f2bc020a'),(659,1,1,1058,NULL,'https://www.tripadvisor.ru/SiteIndex-g294471-Serbia.html',1,'b0f2a16a4220c247fc94b66d23ce3664'),(660,1,1,1059,NULL,'https://www.tripadvisor.ru/SiteIndex-g294262-Singapore.html',1,'907caf3eec24d6b2ebf0e186acf4e1c3'),(661,1,1,1060,NULL,'https://www.tripadvisor.ru/SiteIndex-g294010-Syria.html',1,'8084426140215feecd24dd957ad6a5f4'),(662,1,1,1061,NULL,'https://www.tripadvisor.ru/SiteIndex-g274922-Slovakia.html',1,'5c4d2fc78f4e89c263f92535d53093a5'),(663,1,1,1062,NULL,'https://www.tripadvisor.ru/SiteIndex-g274862-Slovenia.html',1,'d027011294e265d103486d8523147b09'),(664,1,1,1063,NULL,'https://www.tripadvisor.ru/SiteIndex-g294139-Solomon_Islands.html',1,'e259791ec8745aa1bb9357fa343c8211'),(665,1,1,1064,NULL,'https://www.tripadvisor.ru/SiteIndex-g294439-Somalia.html',1,'a578b2a83918ecd714569b5a89a4ca30'),(666,1,1,1065,NULL,'https://www.tripadvisor.ru/SiteIndex-g293834-Sudan.html',1,'6e707c165258db6f4ffff5645c9675a3'),(667,1,1,1066,NULL,'https://www.tripadvisor.ru/SiteIndex-g294081-Suriname.html',1,'acc399d7d139b3f370979c0f8babc902'),(668,1,1,1067,NULL,'https://www.tripadvisor.ru/SiteIndex-g293832-Sierra_Leone.html',1,'38ce6399676f66794bfd0db71277b9a9'),(669,1,1,1068,NULL,'https://www.tripadvisor.ru/SiteIndex-g293963-Tajikistan.html',1,'a0e00b3bba404d9d9524a9757c9e1053'),(670,1,1,1069,NULL,'https://www.tripadvisor.ru/SiteIndex-g293915-Thailand.html',1,'0af54502bb6f6eef4ee2e25aa6b2e2e0'),(671,1,1,1070,NULL,'https://www.tripadvisor.ru/SiteIndex-g293910-Taiwan.html',1,'537706a1ec3e14503858452c416e69d7'),(672,1,1,1071,NULL,'https://www.tripadvisor.ru/SiteIndex-g293747-Tanzania.html',1,'728701f1791fbd759ebe72f5ef896363'),(673,1,1,1072,NULL,'https://www.tripadvisor.ru/SiteIndex-g293838-Togo.html',1,'5044df3d061982e222d5b0952524950c'),(674,1,1,1073,NULL,'https://www.tripadvisor.ru/SiteIndex-g295114-Tokelau.html',1,'889fc9d9f4e81f849682573415f05c6f'),(675,1,1,1074,NULL,'https://www.tripadvisor.ru/SiteIndex-g294141-Tonga.html',1,'376c920e5c8e7b0c38273a5d1b81c1d7'),(676,1,1,1075,NULL,'https://www.tripadvisor.ru/SiteIndex-g1207792-Ile_Tromelin.html',1,'edf30ef0715e13e23a16c9fa0115399e'),(677,1,1,1076,NULL,'https://www.tripadvisor.ru/SiteIndex-g294481-Tuvalu.html',1,'c993d9c05267501cd0e52414178a13b3'),(678,1,1,1077,NULL,'https://www.tripadvisor.ru/SiteIndex-g293753-Tunisia.html',1,'c4d44561ec9b2551a7eaa8370f4f1b01'),(679,1,1,1078,NULL,'https://www.tripadvisor.ru/SiteIndex-g293965-Turkmenistan.html',1,'62645fd6bf0b1b1ce63476d018f79638'),(680,1,1,1079,NULL,'https://www.tripadvisor.ru/SiteIndex-g293969-Turkey.html',1,'6c782fb2d8776d205dce34ab7269b3ca'),(681,1,1,1080,NULL,'https://www.tripadvisor.ru/SiteIndex-g293840-Uganda.html',1,'ca7a4f6741888894f6ee8136c58fbc15'),(682,1,1,1081,NULL,'https://www.tripadvisor.ru/SiteIndex-g293967-Uzbekistan.html',1,'3e1a79cf45e86ed338f70ad307c1c171'),(683,1,1,1082,NULL,'https://www.tripadvisor.ru/SiteIndex-g294473-Ukraine.html',1,'cc5c980c7c96198d77ee103ae2cb2d14'),(684,1,1,1083,NULL,'https://www.tripadvisor.ru/SiteIndex-g1746897-Wallis_and_Futuna.html',1,'7c2b1e8ba89ce59ba97861aecb2afb14'),(685,1,1,1084,NULL,'https://www.tripadvisor.ru/SiteIndex-g294064-Uruguay.html',1,'587879c9b415505fc8d33eb9ad6dc8ec'),(686,1,1,1085,NULL,'https://www.tripadvisor.ru/SiteIndex-g190329-Faroe_Islands.html',1,'88b5122607883dc3ad0dfe9ea6810eee'),(687,1,1,1086,NULL,'https://www.tripadvisor.ru/SiteIndex-g294198-Federated_States_of_Micronesia.html',1,'f7a1de40c0a9cbf1a1d03d1472f9027c'),(688,1,1,1087,NULL,'https://www.tripadvisor.ru/SiteIndex-g294331-Fiji.html',1,'e9803505ea0626ff970683ed5c822e87'),(689,1,1,1088,NULL,'https://www.tripadvisor.ru/SiteIndex-g294245-Philippines.html',1,'382093648bba9e4ea1593fdc8f12936a'),(690,1,1,1089,NULL,'https://www.tripadvisor.ru/SiteIndex-g189896-Finland.html',1,'78a036f0f10da66369848104e6d0fcfd'),(691,1,1,1090,NULL,'https://www.tripadvisor.ru/SiteIndex-g294270-Falkland_Islands.html',1,'5b7d8cefa8a4e8094bdb7513586b1755'),(692,1,1,1091,NULL,'https://www.tripadvisor.ru/SiteIndex-g187070-France.html',1,'02b152c4b7fcf28d8506e70d969381e4'),(693,1,1,1092,NULL,'https://www.tripadvisor.ru/SiteIndex-g294075-French_Guiana.html',1,'a61e05afb2e1fbee790829fb2fc2feb7'),(694,1,1,1093,NULL,'https://www.tripadvisor.ru/SiteIndex-g294338-French_Polynesia.html',1,'8f86b16c67a0db56bf719bbf91c24c1c'),(695,1,1,1094,NULL,'https://www.tripadvisor.ru/SiteIndex-g294453-Croatia.html',1,'a4674da1ecff996d3b3955d404880ea2'),(696,1,1,1095,NULL,'https://www.tripadvisor.ru/SiteIndex-g291958-Central_America.html',1,'52e7641e8be67065648ecdb716e5927c'),(697,1,1,1096,NULL,'https://www.tripadvisor.ru/SiteIndex-g293776-Central_African_Republic.html',1,'5d3dbee1520f2f0ff9033fdaede25261'),(698,1,1,1097,NULL,'https://www.tripadvisor.ru/SiteIndex-g293778-Chad.html',1,'e305a7ece6957427ca69ddb33c256f18'),(699,1,1,1098,NULL,'https://www.tripadvisor.ru/SiteIndex-g635648-Montenegro.html',1,'5d804234eff85872793328b4be273b88'),(700,1,1,1099,NULL,'https://www.tripadvisor.ru/SiteIndex-g274684-Czech_Republic.html',1,'42f8986c8a6a4fe040b50c4d92fa5388'),(701,1,1,1100,NULL,'https://www.tripadvisor.ru/SiteIndex-g294291-Chile.html',1,'9ba08f8e6b7b2aa58122cdec50cc7fa6'),(702,1,1,1101,NULL,'https://www.tripadvisor.ru/SiteIndex-g188045-Switzerland.html',1,'5d8c1a1b18e9b6595ec99b76fb59f4cd'),(703,1,1,1102,NULL,'https://www.tripadvisor.ru/SiteIndex-g189806-Sweden.html',1,'03f5aed5ba97125401a518c5ae032e25'),(704,1,1,1103,NULL,'https://www.tripadvisor.ru/SiteIndex-g293961-Sri_Lanka.html',1,'7ca2f1c45544a83c6497a48611f13116'),(705,1,1,1104,NULL,'https://www.tripadvisor.ru/SiteIndex-g294307-Ecuador.html',1,'6d9f586d233ed08beae19a4bdaf677a8'),(706,1,1,1105,NULL,'https://www.tripadvisor.ru/SiteIndex-g294437-Equatorial_Guinea.html',1,'c245e9931ea5e9fad8e05b3c272eda4e'),(707,1,1,1106,NULL,'https://www.tripadvisor.ru/SiteIndex-g293788-Eritrea.html',1,'3dde3ec89face4da4a22c79e1428036f'),(708,1,1,1107,NULL,'https://www.tripadvisor.ru/SiteIndex-g274952-Estonia.html',1,'fe67b45a649948e809904adc7662044b'),(709,1,1,1108,NULL,'https://www.tripadvisor.ru/SiteIndex-g293790-Ethiopia.html',1,'0265868ba7ee2558b16a52b7867baf7d'),(710,1,1,1109,NULL,'https://www.tripadvisor.ru/SiteIndex-g13-South_America.html',1,'71e4a5e53c0ccede5a1d3df4bfd10099'),(711,1,1,1110,NULL,'https://www.tripadvisor.ru/SiteIndex-g293740-South_Africa.html',1,'5fbcf968dc6a500c386aeafc6fa30a59'),(712,1,1,1111,NULL,'https://www.tripadvisor.ru/SiteIndex-g1593026-South_Georgia.html',1,'75b0dd643d49804b7c290f71df4efbba'),(713,1,1,1112,NULL,'https://www.tripadvisor.ru/SiteIndex-g294196-South_Korea.html',1,'499d606501b1c255e7b466a9ebe6c923'),(714,1,1,1113,NULL,'https://www.tripadvisor.ru/SiteIndex-g8-South_Pacific.html',1,'2aef87a4f344f58970f0ab2cdfc73e02'),(715,1,1,1114,NULL,'https://www.tripadvisor.ru/SiteIndex-g660185-South_Orkney_Islands.html',1,'baf8d06d26b11d73b888d215235ab5ff'),(716,1,1,1115,NULL,'https://www.tripadvisor.ru/SiteIndex-g660184-South_Shetland_Islands.html',1,'f8ea27aa26a5a9af44429baddfc0b562'),(717,1,1,1116,NULL,'https://www.tripadvisor.ru/SiteIndex-g2201790-South_Sudan.html',1,'e61e9b4d0ee8151ef58e8811a15feb88'),(718,1,1,1117,NULL,'https://www.tripadvisor.ru/SiteIndex-g669046-South_Pole.html',1,'5645f50f1487d297f4c9cb2e4502e675'),(719,1,1,1118,NULL,'https://www.tripadvisor.ru/SiteIndex-g294232-Japan.html',1,'787fa0ba67c1d42f0ea5024e06be5f9e'),(720,1,2,1120,NULL,'https://www.tripadvisor.ru/Hotels-g1023749-South_Georgia_and_the_South_Sandwich_Islands-Hotels.html',2,'ea123a6f5f59b802de0fdd3afb04b6aa');

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
  CONSTRAINT `core_records_ibfk_1` FOREIGN KEY (`owner_group_id`) REFERENCES `core_groups` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "core_records"
#

INSERT INTO `core_records` VALUES (1,1120,'category_identifier','Hotels');

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
