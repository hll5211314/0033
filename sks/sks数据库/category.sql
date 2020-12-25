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

 Date: 06/12/2020 16:47:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cgid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品分类编号',
  `cgname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品分类名',
  `cgstatus` int(11) DEFAULT NULL COMMENT '商品分类状态',
  `parentid` int(11) DEFAULT NULL COMMENT '商品分类父类',
  `cgcreatetime` datetime(0) DEFAULT NULL COMMENT '商品分类创建时间',
  `cgupdatetime` datetime(0) DEFAULT NULL COMMENT '商品分类修改时间',
  PRIMARY KEY (`cgid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '男子时尚运动鞋', 1, 10, '2020-12-06 15:26:12', '2020-12-06 15:26:39');
INSERT INTO `category` VALUES (2, '女子休闲鞋', 1, 20, '2020-12-06 15:26:17', '2020-12-06 15:26:42');
INSERT INTO `category` VALUES (3, '儿童', 1, 30, '2020-12-06 15:26:21', '2020-12-06 15:26:46');
INSERT INTO `category` VALUES (4, '系列', 1, 40, '2020-12-06 15:26:24', '2020-12-06 15:26:48');
INSERT INTO `category` VALUES (5, '新品', 1, 50, '2020-12-06 15:26:29', '2020-12-06 15:26:51');
INSERT INTO `category` VALUES (6, '联名款', 1, 60, '2020-12-06 15:26:33', '2020-12-06 15:26:55');
INSERT INTO `category` VALUES (7, '明星款', 1, 70, '2020-12-06 15:26:35', '2020-12-06 15:26:57');

SET FOREIGN_KEY_CHECKS = 1;
