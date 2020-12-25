/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 100119
 Source Host           : localhost:3306
 Source Schema         : sks

 Target Server Type    : MySQL
 Target Server Version : 100119
 File Encoding         : 65001

 Date: 06/12/2020 16:48:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `oiid` int(11) NOT NULL AUTO_INCREMENT,
  `oiordersid` int(11) DEFAULT NULL,
  `oiuserid` bigint(20) DEFAULT NULL,
  `oiproductid` bigint(20) DEFAULT NULL,
  `oiproductname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `oiproductimage` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `oiprice` decimal(20, 2) DEFAULT NULL,
  `oicount` int(11) DEFAULT NULL,
  `oicreatetime` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `oiupdatetime` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`oiid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (1, 1, 1, 1, '耐克', 'images/1.jpg', 20.00, 4, '2020-10-10 10:10:10', '2020-10-10 10:10:15');
INSERT INTO `orderitem` VALUES (2, 2, 2, 2, '耐克', 'images/1.jpg', 20.00, 4, '2020-10-10 10:10:10', '2020-10-10 10:10:14');
INSERT INTO `orderitem` VALUES (3, 3, 3, 3, '耐克', 'images/1.jpg', 20.00, 4, '2020-10-10 10:10:10', '2020-10-10 10:10:13');
INSERT INTO `orderitem` VALUES (4, 4, 4, 4, '耐克', 'images/1.jpg', 20.00, 4, '2020-10-10 10:10:10', '2020-10-10 10:10:12');

SET FOREIGN_KEY_CHECKS = 1;
