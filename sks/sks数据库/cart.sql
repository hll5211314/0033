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

 Date: 06/12/2020 16:44:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `ctid` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `ctuserid` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户的ID 8~12位',
  `ctproductid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品的ID',
  `ctquantity` int(99) NOT NULL COMMENT '产品数量 不能为空',
  `ctchecked` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否勾选 暂无功能',
  `ctcreatetime` datetime(0) DEFAULT NULL COMMENT '创建购物车时间 自动生成时间',
  `ctupdatetime` datetime(0) DEFAULT NULL COMMENT '购物车修改时间 自动生成时间',
  PRIMARY KEY (`ctid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (2, '1', '男士上衣', 32, '是', '2020-12-06 15:23:39', '2020-12-06 15:23:43');
INSERT INTO `cart` VALUES (3, '2', '男士上衣', 32, '是', '2020-12-06 15:23:45', '2020-12-06 15:23:51');
INSERT INTO `cart` VALUES (4, '3', '女士上衣', 60, '是', '2020-12-06 15:23:47', '2020-12-06 15:23:54');

SET FOREIGN_KEY_CHECKS = 1;
