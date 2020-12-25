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

 Date: 06/12/2020 16:48:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品ID，不能为空，自增，且惟一',
  `pdcategoryid` bigint(20) DEFAULT NULL COMMENT 'category的主键ID',
  `pdmainimage` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品主图',
  `pdsubimage` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品图片',
  `pdname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `pdprice` decimal(10, 2) DEFAULT NULL COMMENT '商品单价',
  `pdcolor` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品颜色图片',
  `pdsize` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品的尺码',
  `pdstock` int(11) DEFAULT NULL COMMENT '商品数量',
  `pddetail` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品详情描述',
  `pdstatus` int(11) DEFAULT NULL COMMENT '商品销售状态',
  `pdcreatetime` datetime(0) DEFAULT NULL COMMENT '商品创建时间',
  `pdupdatetime` datetime(0) DEFAULT NULL COMMENT '商品修改时间',
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 0, '', '', '', 0.00, '', '', 0, '男子运动鞋', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (2, 10, '', '', 'D\'LITES 2.0', 569.00, '', 'M/L/XL/XXL', 1000, '男女同款时尚运动鞋', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (3, 20, '', '', 'D\'LITES 1.0', 649.00, '', 'M/L/XL/XXL', 1000, '女子运动鞋', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (4, 20, '', '', '', 0.00, '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (5, 30, '', '', 'MEGA-CRAFT', 299.00, '', '27.5/30/32/33.5', 1000, '男童魔术贴运动鞋', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (6, 30, '', '', 'HEART LIGHTS', 399.00, '', '27.5/30/32/33.5', 1000, '女童运动鞋', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (7, 40, '', '', 'V\'LITES 2.0', 399.00, '', 'M/L/XL/XXL', 1000, 'V\'LITES系列', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (8, 50, '', '', 'STREET BLOX', 719.00, '', 'M/L/XL/XXL', 1000, '新品', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (9, 60, '', '', 'ENERGY', 569.00, '', '27.5/30/32/33.5', 1000, '女童休闲鞋 HelloKitty联名款', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (10, 70, '', '', 'VERRADO', 559.00, '', 'M/L/XL/XXL', 1000, '男子运动鞋吴尊同款', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

SET FOREIGN_KEY_CHECKS = 1;
