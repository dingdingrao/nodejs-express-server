/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : xb2_node

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 29/11/2022 10:44:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `postId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `parentId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `postId`(`postId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `parentId`(`parentId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '字字珠玑 ~', 1, 4, NULL);
INSERT INTO `comment` VALUES (2, '精妙绝伦 ~', 3, 4, NULL);
INSERT INTO `comment` VALUES (3, '才华盖世 ~', 2, 5, NULL);
INSERT INTO `comment` VALUES (4, '谢谢 ~', 1, 5, 1);

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `originalname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mimetype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `postId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `width` smallint(6) NOT NULL,
  `height` smallint(6) NOT NULL,
  `metadata` json NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `postId`(`postId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (1, 'noah-dustin-von-weissenfluh-DJwpx9FpVQ4-unsplash.jpg', 'image/jpeg', 'da733d62840d7c5f3847c7910de5402a', 1420546, 3, 5, 0, 0, NULL);
INSERT INTO `file` VALUES (2, '风景1.jpg', 'image/jpeg', 'baa8f34cd870b591a6ad17d4ed85591a', 532083, 3, 5, 1920, 1080, '{}');
INSERT INTO `file` VALUES (3, '感通片.jpg', 'image/jpeg', '674bfda5a72d37ac1b7bba4ba9cd00ef', 3692770, 3, 5, 4640, 2608, '{\"ISO\": 5525, \"Flash\": 0, \"FNumber\": 1.89, \"Software\": \"MediaTek Camera Application\", \"ColorSpace\": 1, \"CreateDate\": 1667777663, \"ImageWidth\": 4640, \"SubSecTime\": \"305\", \"ExifVersion\": \"0220\", \"FocalLength\": 5.43, \"ImageHeight\": 2608, \"LightSource\": 255, \"Orientation\": 1, \"XResolution\": 72, \"YResolution\": 72, \"ExposureMode\": 0, \"ExposureTime\": 0.049994, \"InteropIndex\": \"R98\", \"MeteringMode\": 2, \"WhiteBalance\": 0, \"ExifImageWidth\": 4640, \"ResolutionUnit\": 2, \"BrightnessValue\": -2.5, \"ExifImageHeight\": 2608, \"ExposureProgram\": 2, \"DateTimeOriginal\": 1667777663, \"DigitalZoomRatio\": 1, \"ImageDescription\": \"\", \"SceneCaptureType\": 0, \"YCbCrPositioning\": 2, \"SubSecTimeOriginal\": \"305\", \"SubSecTimeDigitized\": \"305\", \"ExposureCompensation\": 0, \"FocalLengthIn35mmFormat\": 0}');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, '关山月', '明月出天山，苍茫云海间', 3);
INSERT INTO `post` VALUES (2, '望岳', '会当凌绝顶，一览众山小', 4);
INSERT INTO `post` VALUES (3, '暮江吟', '一道残阳铺水中，半江瑟瑟半江红', 5);
INSERT INTO `post` VALUES (4, '大雪', '寒冬落阔叶，疾风摧残枝', 7);

-- ----------------------------
-- Table structure for post_tag
-- ----------------------------
DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE `post_tag`  (
  `postId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  PRIMARY KEY (`postId`, `tagId`) USING BTREE,
  INDEX `tagId`(`tagId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of post_tag
-- ----------------------------
INSERT INTO `post_tag` VALUES (3, 1);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, '秋天');
INSERT INTO `tag` VALUES (2, '日落');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '王浩', '$2b$10$cqAEBbMqE4Qkex2SDN4OYOEk9y6eYvVd3Mwua/cBguXl1FO/Nr.ki');
INSERT INTO `user` VALUES (2, '小雪', '$2b$10$cqAEBbMqE4Qkex2SDN4OYOEk9y6eYvVd3Mwua/cBguXl1FO/Nr.ki');
INSERT INTO `user` VALUES (3, '李白', '$2b$10$cqAEBbMqE4Qkex2SDN4OYOEk9y6eYvVd3Mwua/cBguXl1FO/Nr.ki');
INSERT INTO `user` VALUES (4, '杜甫', '$2b$10$cqAEBbMqE4Qkex2SDN4OYOEk9y6eYvVd3Mwua/cBguXl1FO/Nr.ki');
INSERT INTO `user` VALUES (5, '白居易', '$2b$10$cqAEBbMqE4Qkex2SDN4OYOEk9y6eYvVd3Mwua/cBguXl1FO/Nr.ki');
INSERT INTO `user` VALUES (6, '李四', '$2b$10$cqAEBbMqE4Qkex2SDN4OYOEk9y6eYvVd3Mwua/cBguXl1FO/Nr.ki');
INSERT INTO `user` VALUES (7, '张三', '$2b$10$cqAEBbMqE4Qkex2SDN4OYOEk9y6eYvVd3Mwua/cBguXl1FO/Nr.ki');

SET FOREIGN_KEY_CHECKS = 1;
