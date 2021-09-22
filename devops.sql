/*
 Navicat Premium Data Transfer

 Source Server         : 10.0.1.254
 Source Server Type    : MySQL
 Source Server Version : 50568
 Source Host           : 10.0.1.254:3306
 Source Schema         : devops

 Target Server Type    : MySQL
 Target Server Version : 50568
 File Encoding         : 65001

 Date: 22/09/2021 16:22:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for assets_asset
-- ----------------------------
DROP TABLE IF EXISTS `assets_asset`;
CREATE TABLE `assets_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_type` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `sn` varchar(128) NOT NULL,
  `status` smallint(6) NOT NULL,
  `manage_ip` char(39) DEFAULT NULL,
  `purchase_day` date DEFAULT NULL,
  `expire_day` date DEFAULT NULL,
  `price` double DEFAULT NULL,
  `memo` longtext,
  `c_time` datetime(6) NOT NULL,
  `m_time` datetime(6) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `approved_by_id` int(11) DEFAULT NULL,
  `business_unit_id` int(11) DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  `idc_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `sn` (`sn`),
  KEY `assets_asset_admin_id_db237f4a_fk_auth_user_id` (`admin_id`),
  KEY `assets_asset_approved_by_id_05329a6a_fk_auth_user_id` (`approved_by_id`),
  KEY `assets_asset_business_unit_id_24df8681_fk_assets_businessunit_id` (`business_unit_id`),
  KEY `assets_asset_contract_id_2b07c3cb_fk_assets_contract_id` (`contract_id`),
  KEY `assets_asset_idc_id_4e92fc57_fk_assets_idc_id` (`idc_id`),
  KEY `assets_asset_manufacturer_id_30ff9133_fk_assets_manufacturer_id` (`manufacturer_id`),
  CONSTRAINT `assets_asset_admin_id_db237f4a_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `assets_asset_approved_by_id_05329a6a_fk_auth_user_id` FOREIGN KEY (`approved_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `assets_asset_business_unit_id_24df8681_fk_assets_businessunit_id` FOREIGN KEY (`business_unit_id`) REFERENCES `assets_businessunit` (`id`),
  CONSTRAINT `assets_asset_contract_id_2b07c3cb_fk_assets_contract_id` FOREIGN KEY (`contract_id`) REFERENCES `assets_contract` (`id`),
  CONSTRAINT `assets_asset_idc_id_4e92fc57_fk_assets_idc_id` FOREIGN KEY (`idc_id`) REFERENCES `assets_idc` (`id`),
  CONSTRAINT `assets_asset_manufacturer_id_30ff9133_fk_assets_manufacturer_id` FOREIGN KEY (`manufacturer_id`) REFERENCES `assets_manufacturer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of assets_asset
-- ----------------------------
BEGIN;
INSERT INTO `assets_asset` VALUES (9, 'server', 'server: 998fccfb-df72-432d-a5df-109da566edfe', '998fccfb-df72-432d-a5df-109da566edfe', 0, '192.168.0.125', '2019-11-11', '2020-11-11', 5395.8, '', '2020-06-09 10:30:50.078628', '2020-06-09 10:41:33.832101', 3, 3, 1, NULL, 1, 4);
INSERT INTO `assets_asset` VALUES (10, 'server', 'server: 6WZY7C2', '6WZY7C2', 0, '202.75.221.10', '2020-04-13', '2021-04-13', 7000, '???IP?????', '2020-06-09 15:28:40.825702', '2020-06-09 15:33:00.542516', 3, 3, 2, NULL, 2, 5);
INSERT INTO `assets_asset` VALUES (11, 'server', 'server: C4V3BC2', 'C4V3BC2', 0, '192.168.55.25', '2020-04-13', '2021-04-13', 5000, '????IP?????', '2020-06-09 16:27:45.298500', '2020-06-09 16:28:46.545647', 3, 3, 2, NULL, 2, 5);
INSERT INTO `assets_asset` VALUES (12, 'server', 'server: 6YX6GD2', '6YX6GD2', 0, '192.168.55.26', '2020-04-13', '2021-04-13', 5000, '???????????IP', '2020-06-09 16:30:24.844320', '2020-06-09 16:31:44.463329', 3, 3, 2, NULL, 2, 5);
COMMIT;

-- ----------------------------
-- Table structure for assets_asset_tags
-- ----------------------------
DROP TABLE IF EXISTS `assets_asset_tags`;
CREATE TABLE `assets_asset_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_asset_tags_asset_id_tag_id_ff789690_uniq` (`asset_id`,`tag_id`),
  KEY `assets_asset_tags_tag_id_04269c11_fk_assets_tag_id` (`tag_id`),
  CONSTRAINT `assets_asset_tags_asset_id_85d69be9_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`),
  CONSTRAINT `assets_asset_tags_tag_id_04269c11_fk_assets_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `assets_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of assets_asset_tags
-- ----------------------------
BEGIN;
INSERT INTO `assets_asset_tags` VALUES (1, 9, 1);
INSERT INTO `assets_asset_tags` VALUES (2, 9, 2);
INSERT INTO `assets_asset_tags` VALUES (3, 9, 3);
INSERT INTO `assets_asset_tags` VALUES (4, 10, 4);
INSERT INTO `assets_asset_tags` VALUES (5, 11, 4);
INSERT INTO `assets_asset_tags` VALUES (6, 12, 4);
COMMIT;

-- ----------------------------
-- Table structure for assets_businessunit
-- ----------------------------
DROP TABLE IF EXISTS `assets_businessunit`;
CREATE TABLE `assets_businessunit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `memo` varchar(64) DEFAULT NULL,
  `parent_unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `assets_businessunit_parent_unit_id_b9c536a6_fk_assets_bu` (`parent_unit_id`),
  CONSTRAINT `assets_businessunit_parent_unit_id_b9c536a6_fk_assets_bu` FOREIGN KEY (`parent_unit_id`) REFERENCES `assets_businessunit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of assets_businessunit
-- ----------------------------
BEGIN;
INSERT INTO `assets_businessunit` VALUES (1, 'morebit', 'morebit', NULL);
INSERT INTO `assets_businessunit` VALUES (2, 'morebit-test', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for assets_contract
-- ----------------------------
DROP TABLE IF EXISTS `assets_contract`;
CREATE TABLE `assets_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(128) NOT NULL,
  `name` varchar(64) NOT NULL,
  `memo` longtext,
  `price` int(11) NOT NULL,
  `detail` longtext,
  `start_day` date DEFAULT NULL,
  `end_day` date DEFAULT NULL,
  `license_num` int(11) DEFAULT NULL,
  `c_day` date NOT NULL,
  `m_day` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for assets_cpu
-- ----------------------------
DROP TABLE IF EXISTS `assets_cpu`;
CREATE TABLE `assets_cpu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu_model` varchar(128) DEFAULT NULL,
  `cpu_count` smallint(5) unsigned NOT NULL,
  `cpu_core_count` smallint(5) unsigned NOT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_id` (`asset_id`),
  CONSTRAINT `assets_cpu_asset_id_6ead6ace_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of assets_cpu
-- ----------------------------
BEGIN;
INSERT INTO `assets_cpu` VALUES (9, 'Intel(R) Xeon(R) Platinum 8269CY CPU @ 2.50GHz', 4, 8, 9);
INSERT INTO `assets_cpu` VALUES (10, 'Intel(R) Xeon(R) CPU E5-2690 v3 @ 2.60GHz', 48, 48, 10);
INSERT INTO `assets_cpu` VALUES (11, 'Intel(R) Xeon(R) CPU E5-2690 v3 @ 2.60GHz', 48, 48, 11);
INSERT INTO `assets_cpu` VALUES (12, 'Intel(R) Xeon(R) CPU E5-2690 v3 @ 2.60GHz', 48, 48, 12);
COMMIT;

-- ----------------------------
-- Table structure for assets_disk
-- ----------------------------
DROP TABLE IF EXISTS `assets_disk`;
CREATE TABLE `assets_disk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(128) NOT NULL,
  `slot` varchar(64) DEFAULT NULL,
  `model` varchar(128) DEFAULT NULL,
  `manufacturer` varchar(128) DEFAULT NULL,
  `capacity` double DEFAULT NULL,
  `interface_type` varchar(16) NOT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_disk_asset_id_sn_5ee64e1c_uniq` (`asset_id`,`sn`),
  CONSTRAINT `assets_disk_asset_id_b8cd1d73_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for assets_eventlog
-- ----------------------------
DROP TABLE IF EXISTS `assets_eventlog`;
CREATE TABLE `assets_eventlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `event_type` smallint(6) NOT NULL,
  `component` varchar(256) DEFAULT NULL,
  `detail` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `memo` longtext,
  `asset_id` int(11) DEFAULT NULL,
  `new_asset_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assets_eventlog_asset_id_150968b8_fk_assets_asset_id` (`asset_id`),
  KEY `assets_eventlog_new_asset_id_8ddfaaf8_fk_assets_ne` (`new_asset_id`),
  KEY `assets_eventlog_user_id_3e5400a8_fk_auth_user_id` (`user_id`),
  CONSTRAINT `assets_eventlog_asset_id_150968b8_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`),
  CONSTRAINT `assets_eventlog_new_asset_id_8ddfaaf8_fk_assets_ne` FOREIGN KEY (`new_asset_id`) REFERENCES `assets_newassetapprovalzone` (`id`),
  CONSTRAINT `assets_eventlog_user_id_3e5400a8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of assets_eventlog
-- ----------------------------
BEGIN;
INSERT INTO `assets_eventlog` VALUES (7, 'server: 00001 <00001> ?  ??', 4, NULL, '???????', '2020-06-06 17:39:43.673787', NULL, NULL, NULL, NULL);
INSERT INTO `assets_eventlog` VALUES (8, 'server: 00426-OEM-8992662-111111 <00426-OEM-8992662-111111> ?  ??', 4, NULL, '???????', '2020-06-08 11:38:36.235546', NULL, NULL, NULL, NULL);
INSERT INTO `assets_eventlog` VALUES (9, 'server: 998fccfb-df72-432d-a5df-109da566edfe <998fccfb-df72-432d-a5df-109da566edfe> ?  ??', 4, NULL, '???????', '2020-06-09 10:30:50.104695', NULL, 9, NULL, 3);
INSERT INTO `assets_eventlog` VALUES (10, 'server: 6WZY7C2 <6WZY7C2> ?  ??', 4, NULL, '???????', '2020-06-09 15:28:40.852316', NULL, 10, NULL, 3);
INSERT INTO `assets_eventlog` VALUES (11, 'server: C4V3BC2 <C4V3BC2> ?  ??', 4, NULL, '???????', '2020-06-09 16:27:45.323244', NULL, 11, NULL, 3);
INSERT INTO `assets_eventlog` VALUES (12, 'server: 6YX6GD2 <6YX6GD2> ?  ??', 4, NULL, '???????', '2020-06-09 16:30:24.866734', NULL, 12, NULL, 3);
COMMIT;

-- ----------------------------
-- Table structure for assets_idc
-- ----------------------------
DROP TABLE IF EXISTS `assets_idc`;
CREATE TABLE `assets_idc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `memo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of assets_idc
-- ----------------------------
BEGIN;
INSERT INTO `assets_idc` VALUES (1, '?????', NULL);
INSERT INTO `assets_idc` VALUES (2, '??????', NULL);
COMMIT;

-- ----------------------------
-- Table structure for assets_manufacturer
-- ----------------------------
DROP TABLE IF EXISTS `assets_manufacturer`;
CREATE TABLE `assets_manufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `telephone` varchar(30) DEFAULT NULL,
  `memo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of assets_manufacturer
-- ----------------------------
BEGIN;
INSERT INTO `assets_manufacturer` VALUES (2, 'innotek GmbH', NULL, NULL);
INSERT INTO `assets_manufacturer` VALUES (3, 'Intel', NULL, NULL);
INSERT INTO `assets_manufacturer` VALUES (4, 'Alibaba Cloud', NULL, NULL);
INSERT INTO `assets_manufacturer` VALUES (5, 'Dell Inc.', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for assets_networkdevice
-- ----------------------------
DROP TABLE IF EXISTS `assets_networkdevice`;
CREATE TABLE `assets_networkdevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_asset_type` smallint(6) NOT NULL,
  `vlan_ip` char(39) DEFAULT NULL,
  `intranet_ip` char(39) DEFAULT NULL,
  `model` varchar(128) NOT NULL,
  `firmware` varchar(128) DEFAULT NULL,
  `port_num` smallint(6) DEFAULT NULL,
  `device_detail` longtext,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_id` (`asset_id`),
  CONSTRAINT `assets_networkdevice_asset_id_23e1a954_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for assets_newassetapprovalzone
-- ----------------------------
DROP TABLE IF EXISTS `assets_newassetapprovalzone`;
CREATE TABLE `assets_newassetapprovalzone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(128) NOT NULL,
  `asset_type` varchar(64) DEFAULT NULL,
  `manufacturer` varchar(64) DEFAULT NULL,
  `model` varchar(128) DEFAULT NULL,
  `ram_size` int(10) unsigned DEFAULT NULL,
  `cpu_model` varchar(128) DEFAULT NULL,
  `cpu_count` smallint(5) unsigned DEFAULT NULL,
  `cpu_core_count` smallint(5) unsigned DEFAULT NULL,
  `os_distribution` varchar(64) DEFAULT NULL,
  `os_type` varchar(64) DEFAULT NULL,
  `os_release` varchar(64) DEFAULT NULL,
  `data` longtext NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `m_time` datetime(6) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for assets_nic
-- ----------------------------
DROP TABLE IF EXISTS `assets_nic`;
CREATE TABLE `assets_nic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `model` varchar(128) NOT NULL,
  `mac` varchar(64) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `net_mask` varchar(64) DEFAULT NULL,
  `bonding` varchar(64) DEFAULT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_nic_asset_id_model_mac_b2a6701b_uniq` (`asset_id`,`model`,`mac`),
  CONSTRAINT `assets_nic_asset_id_de9d6d3a_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for assets_ram
-- ----------------------------
DROP TABLE IF EXISTS `assets_ram`;
CREATE TABLE `assets_ram` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(128) DEFAULT NULL,
  `model` varchar(128) DEFAULT NULL,
  `manufacturer` varchar(128) DEFAULT NULL,
  `slot` varchar(64) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_ram_asset_id_slot_0336f41b_uniq` (`asset_id`,`slot`),
  CONSTRAINT `assets_ram_asset_id_e5b50d00_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of assets_ram
-- ----------------------------
BEGIN;
INSERT INTO `assets_ram` VALUES (3, '998fccfb-df72-432d-a5df-109da566edfe', NULL, NULL, '1', 16, 9);
INSERT INTO `assets_ram` VALUES (4, NULL, NULL, NULL, '1', 128, 12);
INSERT INTO `assets_ram` VALUES (5, NULL, NULL, NULL, '1', 128, 11);
INSERT INTO `assets_ram` VALUES (6, NULL, NULL, NULL, '1', 128, 10);
COMMIT;

-- ----------------------------
-- Table structure for assets_securitydevice
-- ----------------------------
DROP TABLE IF EXISTS `assets_securitydevice`;
CREATE TABLE `assets_securitydevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_asset_type` smallint(6) NOT NULL,
  `model` varchar(128) NOT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_id` (`asset_id`),
  CONSTRAINT `assets_securitydevice_asset_id_6ac19ad5_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for assets_server
-- ----------------------------
DROP TABLE IF EXISTS `assets_server`;
CREATE TABLE `assets_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_asset_type` smallint(6) NOT NULL,
  `created_by` varchar(32) NOT NULL,
  `model` varchar(128) DEFAULT NULL,
  `raid_type` varchar(512) DEFAULT NULL,
  `os_type` varchar(64) DEFAULT NULL,
  `os_distribution` varchar(64) DEFAULT NULL,
  `os_release` varchar(64) DEFAULT NULL,
  `asset_id` int(11) NOT NULL,
  `hosted_on_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_id` (`asset_id`),
  KEY `assets_server_hosted_on_id_1f2367ea_fk_assets_server_id` (`hosted_on_id`),
  CONSTRAINT `assets_server_asset_id_e68204e6_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`),
  CONSTRAINT `assets_server_hosted_on_id_1f2367ea_fk_assets_server_id` FOREIGN KEY (`hosted_on_id`) REFERENCES `assets_server` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of assets_server
-- ----------------------------
BEGIN;
INSERT INTO `assets_server` VALUES (9, 0, 'auto', 'Alibaba Cloud ECS', NULL, 'Linux', 'CentOS', 'CentOS Linux release 7.7.1908 (Core)', 9, NULL);
INSERT INTO `assets_server` VALUES (10, 0, 'auto', 'PowerEdge R730xd', NULL, 'Linux', NULL, NULL, 10, NULL);
INSERT INTO `assets_server` VALUES (11, 0, 'auto', 'PowerEdge R730xd', NULL, 'Linux', NULL, NULL, 11, NULL);
INSERT INTO `assets_server` VALUES (12, 0, 'auto', 'PowerEdge R730xd', NULL, 'Linux', '', '', 12, NULL);
COMMIT;

-- ----------------------------
-- Table structure for assets_software
-- ----------------------------
DROP TABLE IF EXISTS `assets_software`;
CREATE TABLE `assets_software` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_asset_type` smallint(6) NOT NULL,
  `license_num` int(11) NOT NULL,
  `version` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for assets_storagedevice
-- ----------------------------
DROP TABLE IF EXISTS `assets_storagedevice`;
CREATE TABLE `assets_storagedevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_asset_type` smallint(6) NOT NULL,
  `model` varchar(128) NOT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_id` (`asset_id`),
  CONSTRAINT `assets_storagedevice_asset_id_f64aafdf_fk_assets_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `assets_asset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for assets_tag
-- ----------------------------
DROP TABLE IF EXISTS `assets_tag`;
CREATE TABLE `assets_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `c_day` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of assets_tag
-- ----------------------------
BEGIN;
INSERT INTO `assets_tag` VALUES (1, '??????', '2020-06-09');
INSERT INTO `assets_tag` VALUES (2, 'nginx', '2020-06-09');
INSERT INTO `assets_tag` VALUES (3, 'jenkins_img???', '2020-06-09');
INSERT INTO `assets_tag` VALUES (4, '?????', '2020-06-09');
COMMIT;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add ????', 7, 'add_asset');
INSERT INTO `auth_permission` VALUES (26, 'Can change ????', 7, 'change_asset');
INSERT INTO `auth_permission` VALUES (27, 'Can delete ????', 7, 'delete_asset');
INSERT INTO `auth_permission` VALUES (28, 'Can view ????', 7, 'view_asset');
INSERT INTO `auth_permission` VALUES (29, 'Can add ??', 8, 'add_contract');
INSERT INTO `auth_permission` VALUES (30, 'Can change ??', 8, 'change_contract');
INSERT INTO `auth_permission` VALUES (31, 'Can delete ??', 8, 'delete_contract');
INSERT INTO `auth_permission` VALUES (32, 'Can view ??', 8, 'view_contract');
INSERT INTO `auth_permission` VALUES (33, 'Can add ??', 9, 'add_idc');
INSERT INTO `auth_permission` VALUES (34, 'Can change ??', 9, 'change_idc');
INSERT INTO `auth_permission` VALUES (35, 'Can delete ??', 9, 'delete_idc');
INSERT INTO `auth_permission` VALUES (36, 'Can view ??', 9, 'view_idc');
INSERT INTO `auth_permission` VALUES (37, 'Can add ??', 10, 'add_manufacturer');
INSERT INTO `auth_permission` VALUES (38, 'Can change ??', 10, 'change_manufacturer');
INSERT INTO `auth_permission` VALUES (39, 'Can delete ??', 10, 'delete_manufacturer');
INSERT INTO `auth_permission` VALUES (40, 'Can view ??', 10, 'view_manufacturer');
INSERT INTO `auth_permission` VALUES (41, 'Can add ????????', 11, 'add_newassetapprovalzone');
INSERT INTO `auth_permission` VALUES (42, 'Can change ????????', 11, 'change_newassetapprovalzone');
INSERT INTO `auth_permission` VALUES (43, 'Can delete ????????', 11, 'delete_newassetapprovalzone');
INSERT INTO `auth_permission` VALUES (44, 'Can view ????????', 11, 'view_newassetapprovalzone');
INSERT INTO `auth_permission` VALUES (45, 'Can add ??/??', 12, 'add_software');
INSERT INTO `auth_permission` VALUES (46, 'Can change ??/??', 12, 'change_software');
INSERT INTO `auth_permission` VALUES (47, 'Can delete ??/??', 12, 'delete_software');
INSERT INTO `auth_permission` VALUES (48, 'Can view ??/??', 12, 'view_software');
INSERT INTO `auth_permission` VALUES (49, 'Can add ??', 13, 'add_tag');
INSERT INTO `auth_permission` VALUES (50, 'Can change ??', 13, 'change_tag');
INSERT INTO `auth_permission` VALUES (51, 'Can delete ??', 13, 'delete_tag');
INSERT INTO `auth_permission` VALUES (52, 'Can view ??', 13, 'view_tag');
INSERT INTO `auth_permission` VALUES (53, 'Can add ????', 14, 'add_storagedevice');
INSERT INTO `auth_permission` VALUES (54, 'Can change ????', 14, 'change_storagedevice');
INSERT INTO `auth_permission` VALUES (55, 'Can delete ????', 14, 'delete_storagedevice');
INSERT INTO `auth_permission` VALUES (56, 'Can view ????', 14, 'view_storagedevice');
INSERT INTO `auth_permission` VALUES (57, 'Can add ???', 15, 'add_server');
INSERT INTO `auth_permission` VALUES (58, 'Can change ???', 15, 'change_server');
INSERT INTO `auth_permission` VALUES (59, 'Can delete ???', 15, 'delete_server');
INSERT INTO `auth_permission` VALUES (60, 'Can view ???', 15, 'view_server');
INSERT INTO `auth_permission` VALUES (61, 'Can add ????', 16, 'add_securitydevice');
INSERT INTO `auth_permission` VALUES (62, 'Can change ????', 16, 'change_securitydevice');
INSERT INTO `auth_permission` VALUES (63, 'Can delete ????', 16, 'delete_securitydevice');
INSERT INTO `auth_permission` VALUES (64, 'Can view ????', 16, 'view_securitydevice');
INSERT INTO `auth_permission` VALUES (65, 'Can add ????', 17, 'add_networkdevice');
INSERT INTO `auth_permission` VALUES (66, 'Can change ????', 17, 'change_networkdevice');
INSERT INTO `auth_permission` VALUES (67, 'Can delete ????', 17, 'delete_networkdevice');
INSERT INTO `auth_permission` VALUES (68, 'Can view ????', 17, 'view_networkdevice');
INSERT INTO `auth_permission` VALUES (69, 'Can add ????', 18, 'add_eventlog');
INSERT INTO `auth_permission` VALUES (70, 'Can change ????', 18, 'change_eventlog');
INSERT INTO `auth_permission` VALUES (71, 'Can delete ????', 18, 'delete_eventlog');
INSERT INTO `auth_permission` VALUES (72, 'Can view ????', 18, 'view_eventlog');
INSERT INTO `auth_permission` VALUES (73, 'Can add CPU', 19, 'add_cpu');
INSERT INTO `auth_permission` VALUES (74, 'Can change CPU', 19, 'change_cpu');
INSERT INTO `auth_permission` VALUES (75, 'Can delete CPU', 19, 'delete_cpu');
INSERT INTO `auth_permission` VALUES (76, 'Can view CPU', 19, 'view_cpu');
INSERT INTO `auth_permission` VALUES (77, 'Can add ???', 20, 'add_businessunit');
INSERT INTO `auth_permission` VALUES (78, 'Can change ???', 20, 'change_businessunit');
INSERT INTO `auth_permission` VALUES (79, 'Can delete ???', 20, 'delete_businessunit');
INSERT INTO `auth_permission` VALUES (80, 'Can view ???', 20, 'view_businessunit');
INSERT INTO `auth_permission` VALUES (81, 'Can add ??', 21, 'add_ram');
INSERT INTO `auth_permission` VALUES (82, 'Can change ??', 21, 'change_ram');
INSERT INTO `auth_permission` VALUES (83, 'Can delete ??', 21, 'delete_ram');
INSERT INTO `auth_permission` VALUES (84, 'Can view ??', 21, 'view_ram');
INSERT INTO `auth_permission` VALUES (85, 'Can add ??', 22, 'add_nic');
INSERT INTO `auth_permission` VALUES (86, 'Can change ??', 22, 'change_nic');
INSERT INTO `auth_permission` VALUES (87, 'Can delete ??', 22, 'delete_nic');
INSERT INTO `auth_permission` VALUES (88, 'Can view ??', 22, 'view_nic');
INSERT INTO `auth_permission` VALUES (89, 'Can add ??', 23, 'add_disk');
INSERT INTO `auth_permission` VALUES (90, 'Can change ??', 23, 'change_disk');
INSERT INTO `auth_permission` VALUES (91, 'Can delete ??', 23, 'delete_disk');
INSERT INTO `auth_permission` VALUES (92, 'Can view ??', 23, 'view_disk');
INSERT INTO `auth_permission` VALUES (93, 'Can add ??', 24, 'add_user');
INSERT INTO `auth_permission` VALUES (94, 'Can change ??', 24, 'change_user');
INSERT INTO `auth_permission` VALUES (95, 'Can delete ??', 24, 'delete_user');
INSERT INTO `auth_permission` VALUES (96, 'Can view ??', 24, 'view_user');
INSERT INTO `auth_permission` VALUES (97, 'Can add captcha store', 25, 'add_captchastore');
INSERT INTO `auth_permission` VALUES (98, 'Can change captcha store', 25, 'change_captchastore');
INSERT INTO `auth_permission` VALUES (99, 'Can delete captcha store', 25, 'delete_captchastore');
INSERT INTO `auth_permission` VALUES (100, 'Can view captcha store', 25, 'view_captchastore');
INSERT INTO `auth_permission` VALUES (101, 'Can add cicd_status', 26, 'add_cicd_status');
INSERT INTO `auth_permission` VALUES (102, 'Can change cicd_status', 26, 'change_cicd_status');
INSERT INTO `auth_permission` VALUES (103, 'Can delete cicd_status', 26, 'delete_cicd_status');
INSERT INTO `auth_permission` VALUES (104, 'Can view cicd_status', 26, 'view_cicd_status');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$150000$R8NxcTpvoyHb$pjSvaGZpF/KDEPiPlTWFAeUIsB9b0Jfb48UcV6HZwls=', '2020-06-11 16:05:39.032773', 1, 'caibaofei', 'baofei', 'caibaofei@qq.com', '1', 1, 127, '0000-00-00 00:00:00.000000');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$150000$ZSvK3E0zW3VY$pJoujmebdgVOGyYnB/58gh2V6SUY35RY0YzOKOBzxNc=', '2021-09-14 17:20:04.503686', 1, 'cainiao', '', '', '1542288246@qq.com', 1, 1, '2021-09-14 17:18:10.077503');
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
BEGIN;
INSERT INTO `auth_user_user_permissions` VALUES (93, 3, 1);
INSERT INTO `auth_user_user_permissions` VALUES (94, 3, 2);
INSERT INTO `auth_user_user_permissions` VALUES (95, 3, 3);
INSERT INTO `auth_user_user_permissions` VALUES (96, 3, 4);
INSERT INTO `auth_user_user_permissions` VALUES (97, 3, 5);
INSERT INTO `auth_user_user_permissions` VALUES (98, 3, 6);
INSERT INTO `auth_user_user_permissions` VALUES (99, 3, 7);
INSERT INTO `auth_user_user_permissions` VALUES (100, 3, 8);
INSERT INTO `auth_user_user_permissions` VALUES (101, 3, 9);
INSERT INTO `auth_user_user_permissions` VALUES (102, 3, 10);
INSERT INTO `auth_user_user_permissions` VALUES (103, 3, 11);
INSERT INTO `auth_user_user_permissions` VALUES (104, 3, 12);
INSERT INTO `auth_user_user_permissions` VALUES (105, 3, 13);
INSERT INTO `auth_user_user_permissions` VALUES (106, 3, 14);
INSERT INTO `auth_user_user_permissions` VALUES (107, 3, 15);
INSERT INTO `auth_user_user_permissions` VALUES (108, 3, 16);
INSERT INTO `auth_user_user_permissions` VALUES (109, 3, 17);
INSERT INTO `auth_user_user_permissions` VALUES (110, 3, 18);
INSERT INTO `auth_user_user_permissions` VALUES (111, 3, 19);
INSERT INTO `auth_user_user_permissions` VALUES (112, 3, 20);
INSERT INTO `auth_user_user_permissions` VALUES (113, 3, 21);
INSERT INTO `auth_user_user_permissions` VALUES (114, 3, 22);
INSERT INTO `auth_user_user_permissions` VALUES (115, 3, 23);
INSERT INTO `auth_user_user_permissions` VALUES (116, 3, 24);
INSERT INTO `auth_user_user_permissions` VALUES (117, 3, 25);
INSERT INTO `auth_user_user_permissions` VALUES (118, 3, 26);
INSERT INTO `auth_user_user_permissions` VALUES (119, 3, 27);
INSERT INTO `auth_user_user_permissions` VALUES (120, 3, 28);
INSERT INTO `auth_user_user_permissions` VALUES (121, 3, 29);
INSERT INTO `auth_user_user_permissions` VALUES (122, 3, 30);
INSERT INTO `auth_user_user_permissions` VALUES (123, 3, 31);
INSERT INTO `auth_user_user_permissions` VALUES (124, 3, 32);
INSERT INTO `auth_user_user_permissions` VALUES (125, 3, 33);
INSERT INTO `auth_user_user_permissions` VALUES (126, 3, 34);
INSERT INTO `auth_user_user_permissions` VALUES (127, 3, 35);
INSERT INTO `auth_user_user_permissions` VALUES (128, 3, 36);
INSERT INTO `auth_user_user_permissions` VALUES (129, 3, 37);
INSERT INTO `auth_user_user_permissions` VALUES (130, 3, 38);
INSERT INTO `auth_user_user_permissions` VALUES (131, 3, 39);
INSERT INTO `auth_user_user_permissions` VALUES (132, 3, 40);
INSERT INTO `auth_user_user_permissions` VALUES (133, 3, 41);
INSERT INTO `auth_user_user_permissions` VALUES (134, 3, 42);
INSERT INTO `auth_user_user_permissions` VALUES (135, 3, 43);
INSERT INTO `auth_user_user_permissions` VALUES (136, 3, 44);
INSERT INTO `auth_user_user_permissions` VALUES (137, 3, 45);
INSERT INTO `auth_user_user_permissions` VALUES (138, 3, 46);
INSERT INTO `auth_user_user_permissions` VALUES (139, 3, 47);
INSERT INTO `auth_user_user_permissions` VALUES (140, 3, 48);
INSERT INTO `auth_user_user_permissions` VALUES (141, 3, 49);
INSERT INTO `auth_user_user_permissions` VALUES (142, 3, 50);
INSERT INTO `auth_user_user_permissions` VALUES (143, 3, 51);
INSERT INTO `auth_user_user_permissions` VALUES (144, 3, 52);
INSERT INTO `auth_user_user_permissions` VALUES (145, 3, 53);
INSERT INTO `auth_user_user_permissions` VALUES (146, 3, 54);
INSERT INTO `auth_user_user_permissions` VALUES (147, 3, 55);
INSERT INTO `auth_user_user_permissions` VALUES (148, 3, 56);
INSERT INTO `auth_user_user_permissions` VALUES (149, 3, 57);
INSERT INTO `auth_user_user_permissions` VALUES (150, 3, 58);
INSERT INTO `auth_user_user_permissions` VALUES (151, 3, 59);
INSERT INTO `auth_user_user_permissions` VALUES (152, 3, 60);
INSERT INTO `auth_user_user_permissions` VALUES (153, 3, 61);
INSERT INTO `auth_user_user_permissions` VALUES (154, 3, 62);
INSERT INTO `auth_user_user_permissions` VALUES (155, 3, 63);
INSERT INTO `auth_user_user_permissions` VALUES (156, 3, 64);
INSERT INTO `auth_user_user_permissions` VALUES (157, 3, 65);
INSERT INTO `auth_user_user_permissions` VALUES (158, 3, 66);
INSERT INTO `auth_user_user_permissions` VALUES (159, 3, 67);
INSERT INTO `auth_user_user_permissions` VALUES (160, 3, 68);
INSERT INTO `auth_user_user_permissions` VALUES (161, 3, 69);
INSERT INTO `auth_user_user_permissions` VALUES (162, 3, 70);
INSERT INTO `auth_user_user_permissions` VALUES (163, 3, 71);
INSERT INTO `auth_user_user_permissions` VALUES (164, 3, 72);
INSERT INTO `auth_user_user_permissions` VALUES (165, 3, 73);
INSERT INTO `auth_user_user_permissions` VALUES (166, 3, 74);
INSERT INTO `auth_user_user_permissions` VALUES (167, 3, 75);
INSERT INTO `auth_user_user_permissions` VALUES (168, 3, 76);
INSERT INTO `auth_user_user_permissions` VALUES (169, 3, 77);
INSERT INTO `auth_user_user_permissions` VALUES (170, 3, 78);
INSERT INTO `auth_user_user_permissions` VALUES (171, 3, 79);
INSERT INTO `auth_user_user_permissions` VALUES (172, 3, 80);
INSERT INTO `auth_user_user_permissions` VALUES (173, 3, 81);
INSERT INTO `auth_user_user_permissions` VALUES (174, 3, 82);
INSERT INTO `auth_user_user_permissions` VALUES (175, 3, 83);
INSERT INTO `auth_user_user_permissions` VALUES (176, 3, 84);
INSERT INTO `auth_user_user_permissions` VALUES (177, 3, 85);
INSERT INTO `auth_user_user_permissions` VALUES (178, 3, 86);
INSERT INTO `auth_user_user_permissions` VALUES (179, 3, 87);
INSERT INTO `auth_user_user_permissions` VALUES (180, 3, 88);
INSERT INTO `auth_user_user_permissions` VALUES (181, 3, 89);
INSERT INTO `auth_user_user_permissions` VALUES (182, 3, 90);
INSERT INTO `auth_user_user_permissions` VALUES (183, 3, 91);
INSERT INTO `auth_user_user_permissions` VALUES (184, 3, 92);
COMMIT;

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
BEGIN;
INSERT INTO `captcha_captchastore` VALUES (3, 'DENP', 'denp', '1aee158099a60e468278515cb13b70fadb93e22d', '2021-09-15 18:26:21.229300');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `django_admin_log` VALUES (3, '2020-06-06 17:40:17.458846', '1', '1', 0, '11', 1, 3);
INSERT INTO `django_admin_log` VALUES (4, '2020-06-06 17:41:16.796639', '6', 'server <1> ?  ????', 0, '18', 1, 3);
INSERT INTO `django_admin_log` VALUES (5, '2020-06-06 17:41:16.798903', '5', 'server <1> ?  ????', 0, '18', 1, 3);
INSERT INTO `django_admin_log` VALUES (6, '2020-06-06 17:41:16.800115', '4', 'server <1> ?  ????', 0, '18', 1, 3);
INSERT INTO `django_admin_log` VALUES (7, '2020-06-06 17:41:16.801279', '3', 'server <1> ?  ????', 0, '18', 1, 3);
INSERT INTO `django_admin_log` VALUES (8, '2020-06-06 17:41:16.802477', '2', 'server <1> ?  ????', 0, '18', 1, 3);
INSERT INTO `django_admin_log` VALUES (9, '2020-06-06 17:41:16.803592', '1', 'server <1> ?  ????', 0, '18', 1, 3);
INSERT INTO `django_admin_log` VALUES (11, '2021-09-14 17:20:31.788822', '1', 'admin', 3, '', 4, 4);
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (7, 'assets', 'asset');
INSERT INTO `django_content_type` VALUES (20, 'assets', 'businessunit');
INSERT INTO `django_content_type` VALUES (8, 'assets', 'contract');
INSERT INTO `django_content_type` VALUES (19, 'assets', 'cpu');
INSERT INTO `django_content_type` VALUES (23, 'assets', 'disk');
INSERT INTO `django_content_type` VALUES (18, 'assets', 'eventlog');
INSERT INTO `django_content_type` VALUES (9, 'assets', 'idc');
INSERT INTO `django_content_type` VALUES (10, 'assets', 'manufacturer');
INSERT INTO `django_content_type` VALUES (17, 'assets', 'networkdevice');
INSERT INTO `django_content_type` VALUES (11, 'assets', 'newassetapprovalzone');
INSERT INTO `django_content_type` VALUES (22, 'assets', 'nic');
INSERT INTO `django_content_type` VALUES (21, 'assets', 'ram');
INSERT INTO `django_content_type` VALUES (16, 'assets', 'securitydevice');
INSERT INTO `django_content_type` VALUES (15, 'assets', 'server');
INSERT INTO `django_content_type` VALUES (12, 'assets', 'software');
INSERT INTO `django_content_type` VALUES (14, 'assets', 'storagedevice');
INSERT INTO `django_content_type` VALUES (13, 'assets', 'tag');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (25, 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (24, 'login', 'user');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (26, 'statis', 'cicd_status');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2021-09-14 14:37:38.088620');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2021-09-14 14:37:38.288747');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2021-09-14 14:37:38.442174');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2021-09-14 14:37:38.473137');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2021-09-14 14:37:38.493016');
INSERT INTO `django_migrations` VALUES (6, 'assets', '0001_initial', '2021-09-14 14:37:39.916445');
INSERT INTO `django_migrations` VALUES (7, 'contenttypes', '0002_remove_content_type_name', '2021-09-14 14:37:40.188051');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0002_alter_permission_name_max_length', '2021-09-14 14:37:40.218832');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0003_alter_user_email_max_length', '2021-09-14 14:37:40.261298');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0004_alter_user_username_opts', '2021-09-14 14:37:40.289338');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0005_alter_user_last_login_null', '2021-09-14 14:37:40.321376');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0006_require_contenttypes_0002', '2021-09-14 14:37:40.332188');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0007_alter_validators_add_error_messages', '2021-09-14 14:37:40.357299');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0008_alter_user_username_max_length', '2021-09-14 14:37:40.385227');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0009_alter_user_last_name_max_length', '2021-09-14 14:37:40.422536');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0010_alter_group_name_max_length', '2021-09-14 14:37:40.459179');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0011_update_proxy_permissions', '2021-09-14 14:37:40.505779');
INSERT INTO `django_migrations` VALUES (18, 'captcha', '0001_initial', '2021-09-14 14:37:40.558616');
INSERT INTO `django_migrations` VALUES (19, 'login', '0001_initial', '2021-09-14 14:37:40.615527');
INSERT INTO `django_migrations` VALUES (20, 'sessions', '0001_initial', '2021-09-14 14:37:40.653286');
INSERT INTO `django_migrations` VALUES (39, 'statis', '0001_initial', '2021-09-16 16:15:09.823639');
INSERT INTO `django_migrations` VALUES (40, 'statis', '0002_auto_20210916_1616', '2021-09-16 16:16:06.743829');
INSERT INTO `django_migrations` VALUES (41, 'statis', '0003_auto_20210916_1617', '2021-09-16 16:17:50.682966');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('1nck4bswdyx4cg6ln0h9jh0ig2liyqjv', 'ZGNmNjA2N2ZkNTFhNDJkMzYwYzM4OTMzNTM2MTEyMTE1NjdiNDY2MDp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJjYWliYW9mZWkiLCJzaWduX3RpbWUiOiIyMDIwLTA3LTA4IDE2OjQ1OjU1In0=', '2020-07-22 16:45:55.264960');
INSERT INTO `django_session` VALUES ('22ez4ivbdk914vw4x433didkkif93xwn', 'ZDEzMzcxNTJiYTJjYTNmNWY3ZTJlZWJiZjkxMjkwMzJjMWU2NjkwZDp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJjYWliYW9mZWkiLCJzaWduX3RpbWUiOiIyMDIxLTA5LTE1IDE4OjE3OjQ1In0=', '2021-09-29 18:17:45.264379');
INSERT INTO `django_session` VALUES ('5whmr05rvvn48imt9cknmqszv8ro82nr', 'MDQ1MGQ3NjNlNzQxZDY3YWI1ZjdhNDVhOWM1MGQwNzA3YTY1MGM0Njp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJjYWliYW9mZWkiLCJzaWduX3RpbWUiOiIyMDIwLTA2LTA4IDE3OjM3OjEwIiwiX2F1dGhfdXNlcl9pZCI6IjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjZiOGRlYTY5MTA5OWQ1NDA2N2FmOTYzMzA2YzRlZDk5ZTUxNzhmNDUifQ==', '2020-06-23 10:26:47.372744');
INSERT INTO `django_session` VALUES ('cpef1sj2p24sf1el5tbn3gg68lf34caz', 'ODJkODBmZjBhYmE5NmQ4ZjI2MGM4MDBkMjU4MjM2ZjgxNjliMTQ0ODp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJjYWliYW9mZWkiLCJzaWduX3RpbWUiOiIyMDIxLTA3LTMwIDE3OjMyOjExIn0=', '2021-08-13 17:32:11.475473');
INSERT INTO `django_session` VALUES ('g8payz3tvjwnjns9rh7pbbu3e2rciycw', 'MjdhMTlkYjNlMWZlYmZiMjBiY2IwZTVkYWY0ZjhmY2UwOGNiNDIyMzp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJjYWliYW9mZWkiLCJzaWduX3RpbWUiOiIyMDIwLTA2LTE1IDE1OjAzOjEzIn0=', '2020-06-29 15:03:13.667309');
INSERT INTO `django_session` VALUES ('j7qd6n0sayyiurz0zmgbmcqg5mxm17fu', 'OTQxYmMyMzU3ZTNkODQyNmIyYTAwNWIxYzgxZjU1NGE2NWNhNGFlMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMWFiMTRhOWZkZGNjOTk4MTc0ODBkYWMwMTU5YWY0N2RmYWE4NThjIn0=', '2020-06-15 15:03:48.301499');
INSERT INTO `django_session` VALUES ('jfiyxjj22ea6ig1vyc82bq7t1akkpro4', 'YmVlNmFkMmQwZTA1ZGM1Y2QxNTJlODg0MGUzMjAzODQ5NWJlYWI4NDp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJjYWliYW9mZWkiLCJzaWduX3RpbWUiOiIyMDIwLTA2LTE3IDEwOjI5OjU3In0=', '2020-07-01 10:29:58.001361');
INSERT INTO `django_session` VALUES ('l6wua395r89bj6e3scb0wbg9ngilf1we', 'NGQ0MjI5NTY5NWQyYWY4NDE1MmYyM2Y2MTBkZjhhZWRkZTk2N2YwOTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjZkYmQ1MjY1MGQ0NTQ5ZTUxOWZjOGUxZWE5YmNhZjk5MWVmZDkyIiwiaXNfbG9naW4iOnRydWUsInVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImNhaWJhb2ZlaSIsInNpZ25fdGltZSI6IjIwMjEtMDktMTUgMTA6MDA6MjIifQ==', '2021-09-29 10:00:22.926299');
INSERT INTO `django_session` VALUES ('n3gsf006o7hvlrkxo4ws1ljqct8gi1ax', 'MWYyMmU5MmFmMDdmZTlmMDRiZWEzYTFkMTA5NzIyMmMwZjMxM2Y2Njp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZGRjMTNjOTM0MjIwNmRkNDRlNDdjZGQ1MGY5NTNlYjhiOWE4YTEzIiwiaXNfbG9naW4iOnRydWUsInVzZXJfaWQiOjIsInVzZXJfbmFtZSI6ImNhaWJhb2ZlaSIsInNpZ25fdGltZSI6IjIwMjAtMDYtMDggMTc6MzQ6NTAifQ==', '2020-06-22 17:34:50.220056');
INSERT INTO `django_session` VALUES ('p2ac74zjfydt0fte8lrn2rct40dokyor', 'ZTZiYWViZjU1MDlkZDgzNWYwZWJmMjYzZDMyMWFmYTMzNGFkYWU4Yzp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJjYWliYW9mZWkiLCJzaWduX3RpbWUiOiIyMDIwLTA2LTA4IDE5OjAyOjI4In0=', '2020-06-22 19:02:28.348270');
INSERT INTO `django_session` VALUES ('qqlvr9n0cu1us221g2v6s8zi5j1611os', 'NzViMDMxNDgxYTIxNzdkYTA5MTI5NTA2MDA3M2ZiZmViZDNjYWJhNTp7InNpZ25fdGltZSI6IjIwMjAtMDYtMTcgMTE6NTU6NTYiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmI4ZGVhNjkxMDk5ZDU0MDY3YWY5NjMzMDZjNGVkOTllNTE3OGY0NSIsImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJjYWliYW9mZWkifQ==', '2020-07-01 11:55:56.380706');
INSERT INTO `django_session` VALUES ('w9e03c0mh16agzo5dgrw4ji9tgexuz9q', 'NzVlMmZlMTU2MjEyNjg1NTMzZTUyODE1NmI1MWY0ZDQ5YzVhY2M4NDp7InNpZ25fdGltZSI6IjIwMjAtMDctMDcgMTQ6MzU6MDIiLCJpc19sb2dpbiI6dHJ1ZSwidXNlcl9pZCI6MiwidXNlcl9uYW1lIjoiY2FpYmFvZmVpIn0=', '2020-07-21 14:35:02.803373');
INSERT INTO `django_session` VALUES ('wn09lxmsw30lg3f77ml53s3nlczdeztq', 'MDkwM2MxOGFjOGZiODViYjQ0ZjZlYjU3ZTYwNTM3ZmUwOWJhMWVkMDp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJjYWliYW9mZWkifQ==', '2020-06-22 16:57:42.186127');
INSERT INTO `django_session` VALUES ('zul9mimjuj2yvpjm5kun9yxdv8mn6vow', 'NWU3MjE5Mzc4MDJlN2E3OGZmOWQ1NzgzZjM4MWVlNmE4MzA5OGEyMzp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJjYWliYW9mZWkiLCJzaWduX3RpbWUiOiIyMDIwLTA2LTEyIDE0OjIxOjI2In0=', '2020-06-26 14:21:26.676039');
COMMIT;

-- ----------------------------
-- Table structure for login_user
-- ----------------------------
DROP TABLE IF EXISTS `login_user`;
CREATE TABLE `login_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(254) NOT NULL,
  `sex` varchar(32) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of login_user
-- ----------------------------
BEGIN;
INSERT INTO `login_user` VALUES (2, 'caibaofei', '8efe41962f5375c3dd12f4fe845302883280a8894d66f42f92bfa066daafb970', 'caibaofei@morebit.com.cn', 'male', '2020-06-08 15:04:50.006228');
COMMIT;

-- ----------------------------
-- Table structure for statis_cicd_status
-- ----------------------------
DROP TABLE IF EXISTS `statis_cicd_status`;
CREATE TABLE `statis_cicd_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `env` varchar(10) COLLATE utf8_bin NOT NULL,
  `version` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `version_old` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_bin NOT NULL,
  `active_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of statis_cicd_status
-- ----------------------------
BEGIN;
INSERT INTO `statis_cicd_status` VALUES (1, 'adfw', 'dev', 'adfw', 'awfe', 'end', '2021-09-16 16:18:59.000000');
INSERT INTO `statis_cicd_status` VALUES (2, 'afwww', 'dev', 'afwewf', 'awefew', 'end', '2021-09-22 15:02:45.000000');
INSERT INTO `statis_cicd_status` VALUES (3, 'goods', 'dev', 'good', 'afwe', 'end', '2021-09-22 15:19:22.000000');
INSERT INTO `statis_cicd_status` VALUES (4, 'statis', 'dev', 'statis', 'a', 'end', '2021-09-22 15:19:43.000000');
INSERT INTO `statis_cicd_status` VALUES (5, 'system', 'dev', 'system', 'systemdfawe', 'end', '2021-09-22 15:19:43.000000');
INSERT INTO `statis_cicd_status` VALUES (6, 'finance', 'dev', 'finance', 'financesdfa', 'end', '2021-09-22 15:19:43.000000');
INSERT INTO `statis_cicd_status` VALUES (7, 'stock', 'dev', 'stock', 'stockds', 'end', '2021-09-22 15:19:43.000000');
INSERT INTO `statis_cicd_status` VALUES (8, 'ocr', 'dev', 'ocr', 'ocrsdaf', 'end', '2021-09-22 15:19:43.000000');
INSERT INTO `statis_cicd_status` VALUES (9, 'oms', 'dev', 'oms', 'oms', 'end', '2021-09-22 15:19:43.000000');
INSERT INTO `statis_cicd_status` VALUES (10, 'logs', 'dev', 'logsasd', 'logs', 'end', '2021-09-22 15:19:43.000000');
INSERT INTO `statis_cicd_status` VALUES (11, 'user', 'dev', 'user', 'userdsfa', 'ongoing', '2021-09-22 15:19:43.000000');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
