/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : xb2-node

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 10/02/2023 16:51:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for avatar
-- ----------------------------
DROP TABLE IF EXISTS `avatar`;
CREATE TABLE `avatar`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mimetype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of avatar
-- ----------------------------
INSERT INTO `avatar` VALUES (1, 'image/png', 'b037b45f8d52dd41c2c2e7e68614fc78', 1435417, 3);
INSERT INTO `avatar` VALUES (2, 'image/png', 'dbcf36cf554821294ee885a7fffeaee1', 3552, 3);
INSERT INTO `avatar` VALUES (4, 'image/png', '3b3a492e02665024fa89536655866f8a', 7798, 4);
INSERT INTO `avatar` VALUES (5, 'image/png', '606d4c29bfca01f95af484cda0580f5b', 2049091, 4);
INSERT INTO `avatar` VALUES (6, 'image/png', 'f78d5120f7788c38775bd1a9d8608eb8', 479405, 3);
INSERT INTO `avatar` VALUES (7, 'image/png', 'a70bbd390a50087f742ada6226ad618c', 479405, 3);
INSERT INTO `avatar` VALUES (8, 'image/png', '458efa80cb6209b3f771336ea887a2aa', 479405, 3);
INSERT INTO `avatar` VALUES (9, 'image/png', '8a29283f7a92ae650c230cd60b0c7123', 479405, 3);
INSERT INTO `avatar` VALUES (10, 'image/png', 'e4abba039466a2621a3c968696788765', 2049091, 4);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `postId` int NOT NULL,
  `userId` int NOT NULL,
  `parentId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `postId`(`postId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `parentId`(`parentId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '李白： 杜兄，真是字字珠玑 ~', 1, 3, NULL);
INSERT INTO `comment` VALUES (2, '杜甫：哈哈，老白，我这是精妙绝伦 ~', 3, 4, 1);
INSERT INTO `comment` VALUES (3, '杜甫兄，才华盖世啊 ~', 2, 5, 1);
INSERT INTO `comment` VALUES (4, 'OK，谢谢 ~', 1, 1, 3);
INSERT INTO `comment` VALUES (31, '谢谢啦，白兄 ~', 2, 4, 3);
INSERT INTO `comment` VALUES (32, '杜兄，写的真不错 ~', 2, 5, NULL);
INSERT INTO `comment` VALUES (33, '谢啦，白兄 ~', 2, 4, 32);
INSERT INTO `comment` VALUES (5, '太厉害了，真棒~', 2, 3, NULL);
INSERT INTO `comment` VALUES (6, '杜甫兄，真个很不错滴~', 3, 2, 4);

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `originalname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mimetype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `postId` int NOT NULL,
  `userId` int NOT NULL,
  `width` smallint NOT NULL,
  `height` smallint NOT NULL,
  `metadata` json NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `postId`(`postId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (1, 'noah-dustin-von-weissenfluh-DJwpx9FpVQ4-unsplash.jpg', 'image/jpeg', 'da733d62840d7c5f3847c7910de5402a', 1420546, 3, 5, 0, 0, NULL);
INSERT INTO `file` VALUES (2, '风景1.jpg', 'image/jpeg', 'baa8f34cd870b591a6ad17d4ed85591a', 532083, 3, 5, 1920, 1080, '{}');
INSERT INTO `file` VALUES (3, '感通片.jpg', 'image/jpeg', '674bfda5a72d37ac1b7bba4ba9cd00ef', 3692770, 3, 5, 4640, 2608, '{\"ISO\": 5525, \"Flash\": 0, \"FNumber\": 1.89, \"Software\": \"MediaTek Camera Application\", \"ColorSpace\": 1, \"CreateDate\": 1667777663, \"ImageWidth\": 4640, \"SubSecTime\": \"305\", \"ExifVersion\": \"0220\", \"FocalLength\": 5.43, \"ImageHeight\": 2608, \"LightSource\": 255, \"Orientation\": 1, \"XResolution\": 72, \"YResolution\": 72, \"ExposureMode\": 0, \"ExposureTime\": 0.049994, \"InteropIndex\": \"R98\", \"MeteringMode\": 2, \"WhiteBalance\": 0, \"ExifImageWidth\": 4640, \"ResolutionUnit\": 2, \"BrightnessValue\": -2.5, \"ExifImageHeight\": 2608, \"ExposureProgram\": 2, \"DateTimeOriginal\": 1667777663, \"DigitalZoomRatio\": 1, \"ImageDescription\": \"\", \"SceneCaptureType\": 0, \"YCbCrPositioning\": 2, \"SubSecTimeOriginal\": \"305\", \"SubSecTimeDigitized\": \"305\", \"ExposureCompensation\": 0, \"FocalLengthIn35mmFormat\": 0}');
INSERT INTO `file` VALUES (10, '风景1.jpg', 'image/jpeg', '2871270705d8d9da55215e7cf61e2873', 532083, 3, 5, 1920, 1080, '{}');
INSERT INTO `file` VALUES (11, '风景1.jpg', 'image/jpeg', '81ca8961dd168ab1ed1387982a1cbd5c', 532083, 3, 5, 1920, 1080, '{}');
INSERT INTO `file` VALUES (12, '感通片.jpg', 'image/jpeg', '08e64bb4d0416ca27e4f3bea6af2a7bb', 3692770, 3, 5, 4640, 2608, '{\"ISO\": 5525, \"Flash\": 0, \"FNumber\": 1.89, \"Software\": \"MediaTek Camera Application\", \"ColorSpace\": 1, \"CreateDate\": 1667777663, \"ImageWidth\": 4640, \"SubSecTime\": \"305\", \"ExifVersion\": \"0220\", \"FocalLength\": 5.43, \"ImageHeight\": 2608, \"LightSource\": 255, \"Orientation\": 1, \"XResolution\": 72, \"YResolution\": 72, \"ExposureMode\": 0, \"ExposureTime\": 0.049994, \"InteropIndex\": \"R98\", \"MeteringMode\": 2, \"WhiteBalance\": 0, \"ExifImageWidth\": 4640, \"ResolutionUnit\": 2, \"BrightnessValue\": -2.5, \"ExifImageHeight\": 2608, \"ExposureProgram\": 2, \"DateTimeOriginal\": 1667777663, \"DigitalZoomRatio\": 1, \"ImageDescription\": \"\", \"SceneCaptureType\": 0, \"YCbCrPositioning\": 2, \"SubSecTimeOriginal\": \"305\", \"SubSecTimeDigitized\": \"305\", \"ExposureCompensation\": 0, \"FocalLengthIn35mmFormat\": 0}');
INSERT INTO `file` VALUES (13, '风景1.jpg', 'image/jpeg', 'dbf4f4f4ea23ac5f999083fb05a385db', 532083, 3, 5, 1920, 1080, '{}');
INSERT INTO `file` VALUES (14, '风景1.jpg', 'image/jpeg', '654c55109071f58483f1c6e127bd12b2', 532083, 3, 5, 1920, 1080, '{}');
INSERT INTO `file` VALUES (15, '感通片.jpg', 'image/jpeg', '61faf48875c155a2d35263e50232c62a', 3692770, 3, 5, 4640, 2608, '{\"ISO\": 5525, \"Flash\": 0, \"FNumber\": 1.89, \"Software\": \"MediaTek Camera Application\", \"ColorSpace\": 1, \"CreateDate\": 1667777663, \"ImageWidth\": 4640, \"SubSecTime\": \"305\", \"ExifVersion\": \"0220\", \"FocalLength\": 5.43, \"ImageHeight\": 2608, \"LightSource\": 255, \"Orientation\": 1, \"XResolution\": 72, \"YResolution\": 72, \"ExposureMode\": 0, \"ExposureTime\": 0.049994, \"InteropIndex\": \"R98\", \"MeteringMode\": 2, \"WhiteBalance\": 0, \"ExifImageWidth\": 4640, \"ResolutionUnit\": 2, \"BrightnessValue\": -2.5, \"ExifImageHeight\": 2608, \"ExposureProgram\": 2, \"DateTimeOriginal\": 1667777663, \"DigitalZoomRatio\": 1, \"ImageDescription\": \"\", \"SceneCaptureType\": 0, \"YCbCrPositioning\": 2, \"SubSecTimeOriginal\": \"305\", \"SubSecTimeDigitized\": \"305\", \"ExposureCompensation\": 0, \"FocalLengthIn35mmFormat\": 0}');
INSERT INTO `file` VALUES (16, '感通片.jpg', 'image/jpeg', 'acc0d27596e9c4e8b337d602681cb762', 3692770, 3, 5, 4640, 2608, '{\"ISO\": 5525, \"Flash\": 0, \"FNumber\": 1.89, \"Software\": \"MediaTek Camera Application\", \"ColorSpace\": 1, \"CreateDate\": 1667777663, \"ImageWidth\": 4640, \"SubSecTime\": \"305\", \"ExifVersion\": \"0220\", \"FocalLength\": 5.43, \"ImageHeight\": 2608, \"LightSource\": 255, \"Orientation\": 1, \"XResolution\": 72, \"YResolution\": 72, \"ExposureMode\": 0, \"ExposureTime\": 0.049994, \"InteropIndex\": \"R98\", \"MeteringMode\": 2, \"WhiteBalance\": 0, \"ExifImageWidth\": 4640, \"ResolutionUnit\": 2, \"BrightnessValue\": -2.5, \"ExifImageHeight\": 2608, \"ExposureProgram\": 2, \"DateTimeOriginal\": 1667777663, \"DigitalZoomRatio\": 1, \"ImageDescription\": \"\", \"SceneCaptureType\": 0, \"YCbCrPositioning\": 2, \"SubSecTimeOriginal\": \"305\", \"SubSecTimeDigitized\": \"305\", \"ExposureCompensation\": 0, \"FocalLengthIn35mmFormat\": 0}');
INSERT INTO `file` VALUES (17, '感通片.jpg', 'image/jpeg', '9c8a7a2239c34cf1acf174a4ff999b31', 3692770, 3, 5, 4640, 2608, '{\"ISO\": 5525, \"Flash\": 0, \"FNumber\": 1.89, \"Software\": \"MediaTek Camera Application\", \"ColorSpace\": 1, \"CreateDate\": 1667777663, \"ImageWidth\": 4640, \"SubSecTime\": \"305\", \"ExifVersion\": \"0220\", \"FocalLength\": 5.43, \"ImageHeight\": 2608, \"LightSource\": 255, \"Orientation\": 1, \"XResolution\": 72, \"YResolution\": 72, \"ExposureMode\": 0, \"ExposureTime\": 0.049994, \"InteropIndex\": \"R98\", \"MeteringMode\": 2, \"WhiteBalance\": 0, \"ExifImageWidth\": 4640, \"ResolutionUnit\": 2, \"BrightnessValue\": -2.5, \"ExifImageHeight\": 2608, \"ExposureProgram\": 2, \"DateTimeOriginal\": 1667777663, \"DigitalZoomRatio\": 1, \"ImageDescription\": \"\", \"SceneCaptureType\": 0, \"YCbCrPositioning\": 2, \"SubSecTimeOriginal\": \"305\", \"SubSecTimeDigitized\": \"305\", \"ExposureCompensation\": 0, \"FocalLengthIn35mmFormat\": 0}');
INSERT INTO `file` VALUES (18, '感通片.jpg', 'image/jpeg', '7ab08f69730b166224558577cea8d0a3', 3692770, 3, 5, 4640, 2608, '{\"ISO\": 5525, \"Flash\": 0, \"FNumber\": 1.89, \"Software\": \"MediaTek Camera Application\", \"ColorSpace\": 1, \"CreateDate\": 1667777663, \"ImageWidth\": 4640, \"SubSecTime\": \"305\", \"ExifVersion\": \"0220\", \"FocalLength\": 5.43, \"ImageHeight\": 2608, \"LightSource\": 255, \"Orientation\": 1, \"XResolution\": 72, \"YResolution\": 72, \"ExposureMode\": 0, \"ExposureTime\": 0.049994, \"InteropIndex\": \"R98\", \"MeteringMode\": 2, \"WhiteBalance\": 0, \"ExifImageWidth\": 4640, \"ResolutionUnit\": 2, \"BrightnessValue\": -2.5, \"ExifImageHeight\": 2608, \"ExposureProgram\": 2, \"DateTimeOriginal\": 1667777663, \"DigitalZoomRatio\": 1, \"ImageDescription\": \"\", \"SceneCaptureType\": 0, \"YCbCrPositioning\": 2, \"SubSecTimeOriginal\": \"305\", \"SubSecTimeDigitized\": \"305\", \"ExposureCompensation\": 0, \"FocalLengthIn35mmFormat\": 0}');
INSERT INTO `file` VALUES (19, '感通片.jpg', 'image/jpeg', 'a26c4a6c6ac20f71279076e897cf0d8f', 3692770, 3, 5, 4640, 2608, '{\"ISO\": 5525, \"Flash\": 0, \"FNumber\": 1.89, \"Software\": \"MediaTek Camera Application\", \"ColorSpace\": 1, \"CreateDate\": 1667777663, \"ImageWidth\": 4640, \"SubSecTime\": \"305\", \"ExifVersion\": \"0220\", \"FocalLength\": 5.43, \"ImageHeight\": 2608, \"LightSource\": 255, \"Orientation\": 1, \"XResolution\": 72, \"YResolution\": 72, \"ExposureMode\": 0, \"ExposureTime\": 0.049994, \"InteropIndex\": \"R98\", \"MeteringMode\": 2, \"WhiteBalance\": 0, \"ExifImageWidth\": 4640, \"ResolutionUnit\": 2, \"BrightnessValue\": -2.5, \"ExifImageHeight\": 2608, \"ExposureProgram\": 2, \"DateTimeOriginal\": 1667777663, \"DigitalZoomRatio\": 1, \"ImageDescription\": \"\", \"SceneCaptureType\": 0, \"YCbCrPositioning\": 2, \"SubSecTimeOriginal\": \"305\", \"SubSecTimeDigitized\": \"305\", \"ExposureCompensation\": 0, \"FocalLengthIn35mmFormat\": 0}');
INSERT INTO `file` VALUES (20, '感通片.jpg', 'image/jpeg', 'abf8c34e323bcf503eff3626cedd3ce6', 3692770, 3, 5, 4640, 2608, '{\"ISO\": 5525, \"Flash\": 0, \"FNumber\": 1.89, \"Software\": \"MediaTek Camera Application\", \"ColorSpace\": 1, \"CreateDate\": 1667777663, \"ImageWidth\": 4640, \"SubSecTime\": \"305\", \"ExifVersion\": \"0220\", \"FocalLength\": 5.43, \"ImageHeight\": 2608, \"LightSource\": 255, \"Orientation\": 1, \"XResolution\": 72, \"YResolution\": 72, \"ExposureMode\": 0, \"ExposureTime\": 0.049994, \"InteropIndex\": \"R98\", \"MeteringMode\": 2, \"WhiteBalance\": 0, \"ExifImageWidth\": 4640, \"ResolutionUnit\": 2, \"BrightnessValue\": -2.5, \"ExifImageHeight\": 2608, \"ExposureProgram\": 2, \"DateTimeOriginal\": 1667777663, \"DigitalZoomRatio\": 1, \"ImageDescription\": \"\", \"SceneCaptureType\": 0, \"YCbCrPositioning\": 2, \"SubSecTimeOriginal\": \"305\", \"SubSecTimeDigitized\": \"305\", \"ExposureCompensation\": 0, \"FocalLengthIn35mmFormat\": 0}');
INSERT INTO `file` VALUES (21, '感通片.jpg', 'image/jpeg', 'a4bba6d2c9c32b507a2ef64fdd669e55', 3692770, 3, 5, 4640, 2608, '{\"ISO\": 5525, \"Flash\": 0, \"FNumber\": 1.89, \"Software\": \"MediaTek Camera Application\", \"ColorSpace\": 1, \"CreateDate\": 1667777663, \"ImageWidth\": 4640, \"SubSecTime\": \"305\", \"ExifVersion\": \"0220\", \"FocalLength\": 5.43, \"ImageHeight\": 2608, \"LightSource\": 255, \"Orientation\": 1, \"XResolution\": 72, \"YResolution\": 72, \"ExposureMode\": 0, \"ExposureTime\": 0.049994, \"InteropIndex\": \"R98\", \"MeteringMode\": 2, \"WhiteBalance\": 0, \"ExifImageWidth\": 4640, \"ResolutionUnit\": 2, \"BrightnessValue\": -2.5, \"ExifImageHeight\": 2608, \"ExposureProgram\": 2, \"DateTimeOriginal\": 1667777663, \"DigitalZoomRatio\": 1, \"ImageDescription\": \"\", \"SceneCaptureType\": 0, \"YCbCrPositioning\": 2, \"SubSecTimeOriginal\": \"305\", \"SubSecTimeDigitized\": \"305\", \"ExposureCompensation\": 0, \"FocalLengthIn35mmFormat\": 0}');
INSERT INTO `file` VALUES (22, '感通片.jpg', 'image/jpeg', '003e7dd6688b262ce3268a1ce579a8e6', 3692770, 3, 5, 4640, 2608, '{\"ISO\": 5525, \"Flash\": 0, \"FNumber\": 1.89, \"Software\": \"MediaTek Camera Application\", \"ColorSpace\": 1, \"CreateDate\": 1667777663, \"ImageWidth\": 4640, \"SubSecTime\": \"305\", \"ExifVersion\": \"0220\", \"FocalLength\": 5.43, \"ImageHeight\": 2608, \"LightSource\": 255, \"Orientation\": 1, \"XResolution\": 72, \"YResolution\": 72, \"ExposureMode\": 0, \"ExposureTime\": 0.049994, \"InteropIndex\": \"R98\", \"MeteringMode\": 2, \"WhiteBalance\": 0, \"ExifImageWidth\": 4640, \"ResolutionUnit\": 2, \"BrightnessValue\": -2.5, \"ExifImageHeight\": 2608, \"ExposureProgram\": 2, \"DateTimeOriginal\": 1667777663, \"DigitalZoomRatio\": 1, \"ImageDescription\": \"\", \"SceneCaptureType\": 0, \"YCbCrPositioning\": 2, \"SubSecTimeOriginal\": \"305\", \"SubSecTimeDigitized\": \"305\", \"ExposureCompensation\": 0, \"FocalLengthIn35mmFormat\": 0}');
INSERT INTO `file` VALUES (23, '01.png', 'image/png', '26b36939e5ce70762da7394d79e021fa', 1435417, 3, 5, 1004, 986, NULL);
INSERT INTO `file` VALUES (24, '01.png', 'image/png', 'f2bbc851d1ca0b0ac77a23b32e075417', 1435417, 3, 5, 1004, 986, '{}');
INSERT INTO `file` VALUES (25, '01.png', 'image/png', '529e886e34242b2fd01cd74576c8182d', 1435417, 3, 5, 1004, 986, '{}');
INSERT INTO `file` VALUES (26, '01.png', 'image/png', '55bbd72737d33f8b511b7e152c8209ca', 1435417, 3, 5, 1004, 986, '{}');
INSERT INTO `file` VALUES (27, '01.png', 'image/png', '69d1c474598d7c2e7939ad7cf083ea5b', 1435417, 3, 5, 1004, 986, '{}');
INSERT INTO `file` VALUES (28, '01.png', 'image/png', 'd3955648ae336e5e07feaee3f4b0783d', 1435417, 3, 5, 1004, 986, '{}');
INSERT INTO `file` VALUES (29, 'campfire (1).png', 'image/png', '2ff80f331903f4be4f93926d56428786', 7144, 3, 5, 200, 200, '{}');
INSERT INTO `file` VALUES (30, '01.png', 'image/png', 'd0f90af1e4ccdb83a122102b123d9c46', 1435417, 3, 5, 1004, 986, '{}');
INSERT INTO `file` VALUES (31, '01.png', 'image/png', '91f5ff7bea0730cc56d328f000778d6b', 1435417, 3, 5, 1004, 986, '{}');
INSERT INTO `file` VALUES (32, '01.png', 'image/png', '422aec3cd81a5ed64ec4fa5417a17f1b', 1435417, 3, 5, 1004, 986, '{}');
INSERT INTO `file` VALUES (33, '01.png', 'image/png', '136428447fda3cf47d2078775cc33581', 1435417, 3, 5, 1004, 986, '{}');
INSERT INTO `file` VALUES (34, '01.png', 'image/png', 'c5ce89905ca99fa2a7ba6c8a623d5b6a', 1435417, 3, 5, 1004, 986, 'null');
INSERT INTO `file` VALUES (35, '01.png', 'image/png', '534fccda42b2fea18c3738d46e56193d', 1435417, 3, 5, 1004, 986, '{\"tag\": {}}');
INSERT INTO `file` VALUES (36, '01.png', 'image/png', 'b54666802520ab5d00f966990e006554', 1435417, 3, 5, 1004, 986, '{\"tag\": {}}');
INSERT INTO `file` VALUES (37, '01.png', 'image/png', 'c0762cd079c93aec36e62b0302ad9be1', 1435417, 3, 5, 1004, 986, '{\"tag\": {}}');
INSERT INTO `file` VALUES (38, '01.png', 'image/png', 'bd0e38e3edc18e431df512c3fab86ed6', 1435417, 3, 5, 1004, 986, '{\"tag\": {}}');
INSERT INTO `file` VALUES (39, '01.png', 'image/png', '0a2016df139bbd38ba722492ff4c21ff', 1435417, 3, 5, 1004, 986, '{\"tag\": {}}');
INSERT INTO `file` VALUES (40, '01.png', 'image/png', 'f5a2eba6805c36f97aa54a70f36c4703', 1435417, 3, 5, 1004, 986, '{\"tag\": {}}');
INSERT INTO `file` VALUES (41, '01.png', 'image/png', '0ad68bc5ce64325349753c59031580fe', 1435417, 3, 5, 1004, 986, '{\"tag\": {}}');
INSERT INTO `file` VALUES (42, '01.png', 'image/png', '1a0eef521a7d1b9c5981b7d8204febdb', 1435417, 3, 5, 1004, 986, '{\"tag\": {}}');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, '关山月', '明月出天山，苍茫云海间。长风几万里，吹度玉门关。汉下白登道，胡窥青海湾。由来征战地，不见有人还。戍客望边色，思归多苦颜。高楼当此夜，叹息未应闲。', 3);
INSERT INTO `post` VALUES (2, '望岳', '岱宗夫如何？齐鲁青未了。造化钟神秀，阴阳割昏晓。荡胸生曾云，决眦入归鸟。会当凌绝顶，一览众山小。', 4);
INSERT INTO `post` VALUES (3, '暮江吟', '一道残阳铺水中，半江瑟瑟半江红', 5);
INSERT INTO `post` VALUES (4, '大雪', '寒冬落阔叶，疾风摧残枝', 7);
INSERT INTO `post` VALUES (5, '将进酒·君不见', '君不见，黄河之水天上来，奔流到海不复回。君不见，高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。岑夫子，丹丘生，将进酒，杯莫停。与君歌一曲，请君为我倾耳听。钟鼓馔玉不足贵，但愿长醉不愿醒。古来圣贤皆寂寞，惟有饮者留其名。陈王昔时宴平乐，斗酒十千恣欢谑。主人何为言少钱，径须沽取对君酌。五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。', 3);

-- ----------------------------
-- Table structure for post_tag
-- ----------------------------
DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE `post_tag`  (
  `postId` int NOT NULL,
  `tagId` int NOT NULL,
  PRIMARY KEY (`postId`, `tagId`) USING BTREE,
  INDEX `tagId`(`tagId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of post_tag
-- ----------------------------
INSERT INTO `post_tag` VALUES (2, 2);
INSERT INTO `post_tag` VALUES (2, 3);
INSERT INTO `post_tag` VALUES (3, 1);
INSERT INTO `post_tag` VALUES (4, 2);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, '秋天');
INSERT INTO `tag` VALUES (2, '日落');
INSERT INTO `tag` VALUES (3, '寒冬');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '王浩', '$2b$10$cqAEBbMqE4Qkex2SDN4OYOEk9y6eYvVd3Mwua/cBguXl1FO/Nr.ki');
INSERT INTO `user` VALUES (2, '小雪', '$2b$10$cqAEBbMqE4Qkex2SDN4OYOEk9y6eYvVd3Mwua/cBguXl1FO/Nr.ki');
INSERT INTO `user` VALUES (3, '李白', '$2b$10$cqAEBbMqE4Qkex2SDN4OYOEk9y6eYvVd3Mwua/cBguXl1FO/Nr.ki');
INSERT INTO `user` VALUES (4, '杜甫', '$2b$10$cqAEBbMqE4Qkex2SDN4OYOEk9y6eYvVd3Mwua/cBguXl1FO/Nr.ki');
INSERT INTO `user` VALUES (5, '白居易', '$2b$10$cqAEBbMqE4Qkex2SDN4OYOEk9y6eYvVd3Mwua/cBguXl1FO/Nr.ki');
INSERT INTO `user` VALUES (6, '李四', '$2b$10$cqAEBbMqE4Qkex2SDN4OYOEk9y6eYvVd3Mwua/cBguXl1FO/Nr.ki');
INSERT INTO `user` VALUES (7, '张三', '$2b$10$9fYpG469umcPmcuI50k45eFt9G2PxYq4PR0x9tb1onaeibHcrdune');

-- ----------------------------
-- Table structure for user_like_post
-- ----------------------------
DROP TABLE IF EXISTS `user_like_post`;
CREATE TABLE `user_like_post`  (
  `userId` int NOT NULL,
  `postId` int NOT NULL,
  PRIMARY KEY (`userId`, `postId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_like_post
-- ----------------------------
INSERT INTO `user_like_post` VALUES (3, 1);
INSERT INTO `user_like_post` VALUES (3, 2);
INSERT INTO `user_like_post` VALUES (3, 5);
INSERT INTO `user_like_post` VALUES (4, 5);

SET FOREIGN_KEY_CHECKS = 1;
