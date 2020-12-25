/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 100119
 Source Host           : localhost:3306
 Source Schema         : sks

 Target Server Type    : MySQL
 Target Server Version : 100119
 File Encoding         : 65001

 Date: 07/12/2020 10:02:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
-- Table structure for cart
-- ----------------------------
CREATE DATABASE sks;
USE sks
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
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (3, '儿童', 1, 30, '2020-12-06 15:26:21', '2020-12-06 15:26:46');
INSERT INTO `category` VALUES (4, '系列', 1, 40, '2020-12-06 15:26:24', '2020-12-06 15:26:48');
INSERT INTO `category` VALUES (5, '新品', 1, 50, '2020-12-06 15:26:29', '2020-12-06 15:26:51');
INSERT INTO `category` VALUES (6, '联名款', 1, 60, '2020-12-06 15:26:33', '2020-12-06 15:26:55');
INSERT INTO `category` VALUES (7, '明星款', 1, 70, '2020-12-06 15:26:35', '2020-12-06 15:26:57');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (1, 1, 1, 0, 'wewe', 'wer', 100.00, 1, '2020-12-07 00:00:00', '2020-12-07 00:00:00');
INSERT INTO `orderitem` VALUES (2, 2, 2, 2, '耐克', 'images/1.jpg', 20.00, 4, '2020-10-10 10:10:10', '2020-10-10 10:10:14');
INSERT INTO `orderitem` VALUES (3, 3, 3, 3, '耐克', 'images/1.jpg', 20.00, 4, '2020-10-10 10:10:10', '2020-10-10 10:10:13');
INSERT INTO `orderitem` VALUES (4, 4, 4, 4, '耐克', 'images/1.jpg', 20.00, 4, '2020-10-10 10:10:10', '2020-10-10 10:10:12');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, 1, 50.00, 0, 45, 0, '2020-10-10 10:10:10', '2020-10-10 11:10:10', '2020-10-11 10:10:10', '2020-10-10 10:10:09', '2020-10-10 10:10:10', '2020-10-12 10:10:10');
INSERT INTO `orders` VALUES (2, 2, 2, 50.00, 0, 45, 0, '2020-10-10 10:10:10', '2020-10-10 11:10:10', '2020-10-11 10:10:10', '2020-10-10 10:10:09', '2020-10-10 10:10:10', '2020-10-12 10:10:10');
INSERT INTO `orders` VALUES (3, 3, 2, 50.00, 0, 45, 0, '2020-10-10 10:10:10', '2020-10-10 11:10:10', '2020-10-11 10:10:10', '2020-10-10 10:10:09', '2020-10-10 10:10:10', '2020-10-12 10:10:10');
INSERT INTO `orders` VALUES (4, 1, 1, 1000.00, 0, 10, 0, '2020-12-07 00:00:00', '2020-12-07 00:00:00', '2020-12-07 00:00:00', '2020-12-07 00:00:00', '2020-12-07 00:00:00', '2020-12-07 00:00:00');

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

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户登陆名称',
  `upwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户电话',
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户性别',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户地址',
  `ucreatetime` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '用户创建时间',
  `uupdatetime` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '用户修改时间',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '俞怡贤', '123456', '14782034088', '女', '上海', '2020-12-06 15:21:57', '2020-12-06 15:21:57');
INSERT INTO `user` VALUES (2, '韩龙龙', '123456', '13233440271', '男', '上海', '2020-12-06 15:21:32', '2020-12-06 15:21:39');
INSERT INTO `user` VALUES (3, '李珑翔', '123456', '13362359851', '男', '上海', '2020-12-06 15:22:23', '2020-12-06 15:22:25');
INSERT INTO `user` VALUES (4, '赵宇', '123456', '18369327774', '男', '上海', '2020-12-06 15:23:15', '2020-12-06 15:23:17');
INSERT INTO `user` VALUES (5, 'ran', '123456', '18112345678', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `user` VALUES (6, 'abc', '123456', '18112345678', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `user` VALUES (7, 'root', '123456', '18112345678', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

SET FOREIGN_KEY_CHECKS = 1;
