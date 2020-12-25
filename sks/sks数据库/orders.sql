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

 Date: 06/12/2020 16:48:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `odid` int(11) NOT NULL AUTO_INCREMENT,
  `oduserid` bigint(20) DEFAULT NULL,
  `odshoppingid` int(11) DEFAULT NULL,
  `payment` decimal(20, 2) DEFAULT NULL,
  `paymenttype` int(11) DEFAULT NULL,
  `postage` int(11) DEFAULT NULL,
  `odstatus` int(11) DEFAULT NULL,
  `paymenttime` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `sendtime` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `endtime` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `closetime` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `odcreatetime` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `odupdatetime` datetime(0) DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`odid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, 1, 50.00, 0, 45, 0, '2020-10-10 10:10:10', '2020-10-10 11:10:10', '2020-10-11 10:10:10', '2020-10-10 10:10:09', '2020-10-10 10:10:10', '2020-10-12 10:10:10');
INSERT INTO `orders` VALUES (2, 2, 2, 50.00, 0, 45, 0, '2020-10-10 10:10:10', '2020-10-10 11:10:10', '2020-10-11 10:10:10', '2020-10-10 10:10:09', '2020-10-10 10:10:10', '2020-10-12 10:10:10');
INSERT INTO `orders` VALUES (3, 3, 2, 50.00, 0, 45, 0, '2020-10-10 10:10:10', '2020-10-10 11:10:10', '2020-10-11 10:10:10', '2020-10-10 10:10:09', '2020-10-10 10:10:10', '2020-10-12 10:10:10');
INSERT INTO `orders` VALUES (4, 3, 4, 50.00, 0, 45, 0, '2020-10-10 10:10:10', '2020-10-10 11:10:10', '2020-10-11 10:10:10', '2020-10-10 10:10:09', '2020-10-10 10:10:10', '2020-10-12 10:10:10');

SET FOREIGN_KEY_CHECKS = 1;
