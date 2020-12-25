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

 Date: 06/12/2020 16:48:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '俞怡贤', '123456', '14782034088', '女', '上海', '2020-12-06 15:21:57', '2020-12-06 15:21:57');
INSERT INTO `user` VALUES (2, '韩龙龙', '123456', '13233440271', '男', '上海', '2020-12-06 15:21:32', '2020-12-06 15:21:39');
INSERT INTO `user` VALUES (3, '李珑翔', '123456', '13362359851', '男', '上海', '2020-12-06 15:22:23', '2020-12-06 15:22:25');
INSERT INTO `user` VALUES (4, '赵宇', '123456', '18369327774', '男', '上海', '2020-12-06 15:23:15', '2020-12-06 15:23:17');

SET FOREIGN_KEY_CHECKS = 1;
