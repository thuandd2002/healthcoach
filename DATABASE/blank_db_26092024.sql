/*
 Navicat Premium Data Transfer

 Source Server         : LOCALHOST
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : dentium

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 26/09/2024 16:51:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album`  (
  `id_album` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ngay_dang` bigint(20) UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 1,
  `id_user` bigint(20) NULL DEFAULT 0,
  `hot` tinyint(4) NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_tacgia` int(11) NULL DEFAULT NULL,
  `image_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_album`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES (1, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', 1688010180, 1, 1, 8, 0, ':', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 55, '[{\"image_path\":\"\\/uploaded\\/tin-tuc\\/item1.png\",\"image_name\":\"\",\"image_desc\":\"\",\"image_thu_tu\":\"\"},{\"image_path\":\"\\/uploaded\\/tin-tuc\\/item6.png\",\"image_name\":\"\",\"image_desc\":\"\",\"image_thu_tu\":\"\"},{\"image_path\":\"\\/uploaded\\/tin-tuc\\/item3.png\",\"image_name\":\"\",\"image_desc\":\"\",\"image_thu_tu\":\"\"},{\"image_path\":\"\\/uploaded\\/tin-tuc\\/item7.png\",\"image_name\":\"\",\"image_desc\":\"\",\"image_thu_tu\":\"\"}]', 1688010227);

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id_article` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_service` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint(20) UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 1,
  `id_user` bigint(20) NULL DEFAULT 0,
  `file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hot` tinyint(4) NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_id` int(11) NULL DEFAULT NULL,
  `author_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_email` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_article`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for baohanh
-- ----------------------------
DROP TABLE IF EXISTS `baohanh`;
CREATE TABLE `baohanh`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ngay_nhap` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ma_hang` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `imei` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ngay_ban` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ngay_bh` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `thoigianbaohanh` int(11) NULL DEFAULT 12,
  `so_phieu_ban` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `makh` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tenkh` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dia_chi` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dien_thoai` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mobile` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `thong_tin_khac` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` bigint(20) NULL DEFAULT NULL,
  `id_user` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of baohanh
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id_category` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subname` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `title` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` bigint(20) UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 1,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vitri` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inpage` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `template_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `home_layout` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tags` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `header_tag` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `rss` int(11) NULL DEFAULT 0,
  `lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stypeshow` int(4) NULL DEFAULT NULL,
  `id_attr` bigint(20) NULL DEFAULT NULL,
  `shortinhome` tinyint(4) NULL DEFAULT NULL,
  `footercol` int(11) NULL DEFAULT NULL,
  `homescroll` int(11) NULL DEFAULT 0,
  `localnews` int(11) NULL DEFAULT 0,
  `col` int(11) NULL DEFAULT NULL,
  `vtcolsub` int(11) NULL DEFAULT 0,
  `iconmenu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menucolor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `home_zone` int(11) NULL DEFAULT 1,
  `imageadv` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `styleshow` int(11) NULL DEFAULT 0,
  `left_right_layout` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mega_menu` int(11) NULL DEFAULT 0,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_category`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Trang chủ', 'Trang chủ', 'Homepage - Your Company Name', 0, 1, 1, '', '', '', '', '', '', ':menubar:', 'home', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1651682080);
INSERT INTO `category` VALUES (2, 'Logo', 'Logo', 'Logo', 0, 2, 1, '', ' ', '', '', 'logo/', '', ':logosite:', 'logo', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, ' ', '', 1608698050);
INSERT INTO `category` VALUES (3, 'SlideHome', 'SlideHome', 'SlideHome', 0, 3, 1, '', '', '', '', 'slidehome/', '', ':slideshow:', 'logo', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1608698090);
INSERT INTO `category` VALUES (4, 'SlideHomeMobile', 'SlideHomeMobile', 'SlideHomeMobile', 0, 4, 1, '', '', '', '', 'slidehomemobile/', '', ':slidemobile:', 'logo', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1608698103);
INSERT INTO `category` VALUES (5, 'Giới thiệu', 'Giới thiệu', 'Giới thiệu', 0, 5, 1, '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', '', '', 'gioi-thieu/', '', ':menubar:', 'info', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', '', 1688007930);
INSERT INTO `category` VALUES (6, 'Tin tức', 'Tin tức', 'Tin tức', 0, 6, 1, '', '', '', '', 'tin-tuc/', '', ':menubar:', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1610560325);
INSERT INTO `category` VALUES (7, 'Liên hệ', 'Liên hệ', 'Liên hệ', 0, 7, 1, '', '', '', '', 'lien-he/', '', ':menubar:', 'contact', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1610560339);
INSERT INTO `category` VALUES (8, 'Tác giả', 'Tác giả', 'Tác giả', 0, 8, 1, '', '', '', '', 'tac-gia/', '', ':', 'tacgia', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1688008562);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id_comment` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdate` bigint(20) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `thu_tu` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` bigint(20) NULL DEFAULT NULL,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_item` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_like` bigint(20) NULL DEFAULT 0,
  `star_rate` int(11) NULL DEFAULT 3,
  `id_admin` bigint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_comment`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact`  (
  `id_contact` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `xem` tinyint(4) NULL DEFAULT 0,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdate` bigint(20) NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id_contact`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES (1, 'Thông tin liên hệ: Minh Nguyễn - Test', '\n<table width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n     <tr>\n               <td height=\"30\" colspan=\"2\" align=\"left\" valign=\"middle\"><strong> Thông tin liên hệ:  </strong></td>\n    </tr>\n             <tr>\n               <td height=\"30\" align=\"left\" style=\"width:200px;\" valign=\"middle\">Họ tên:</td>\n               <td height=\"30\" align=\"left\" valign=\"middle\"><strong>Minh Nguyễn - Test</strong></td>\n      </tr>\n        <tr>\n          <td height=\"30\" align=\"left\" valign=\"middle\">E-mail:</td>\n          <td height=\"30\" align=\"left\" valign=\"middle\"><strong>minhns@company.vn</strong></td>\n      </tr>\n      \n    <tr>\n          <td height=\"30\" align=\"left\" valign=\"middle\">Điện thoại:</td>\n          <td height=\"30\" align=\"left\" valign=\"middle\"><strong>0968675568</strong></td>\n      </tr>\n        <tr>\n          <td height=\"30\" align=\"left\" valign=\"middle\"> Địa chỉ:</td>\n          <td height=\"30\" align=\"left\" valign=\"middle\"><strong>Test chức nang</strong></td>\n      </tr>\n      <tr>\n               <td height=\"30\" align=\"left\" valign=\"middle\"><strong>Nội dung liên hệ</strong>: </td>\n               <td height=\"30\" align=\"left\" valign=\"middle\"><i>abc - </i></td>\n      </tr>\n</table>', 0, 'minhns@company.vn', NULL, NULL, 1681469105, NULL);

-- ----------------------------
-- Table structure for contactinfo
-- ----------------------------
DROP TABLE IF EXISTS `contactinfo`;
CREATE TABLE `contactinfo`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `id_catstatic` bigint(11) NOT NULL DEFAULT 0,
  `id_user` bigint(20) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `ngay_dang` bigint(20) NOT NULL DEFAULT 0,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inwhere` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contactinfo
-- ----------------------------
INSERT INTO `contactinfo` VALUES (1, 'Your company name here', '', 0, 0, 0, 1, 0, '', '', 'Your company name here', 'Lê Văn Lương, KĐT Trung Hòa Nhân Chính, Thanh Xuân, Hà Nội', '20.99204228956073', '105.79976062485356', ' ');
INSERT INTO `contactinfo` VALUES (2, 'Company info en', '<iframe allowfullscreen=\"\" frameborder=\"0\" height=\"450\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1862.4140140010604!2d105.80155335798705!3d20.99952959650355!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x6ed93396d4180e5b!2zMTA5IE5ndXnhu4VuIFR1w6JuLCBUaGFuaCBYdcOibg!5e0!3m2!1svi!2s!4v1535516982544\" style=\"border:0\" width=\"100%\"></iframe>', 0, 0, 0, 1, 0, '', '', '', '', '', '', 'en');
INSERT INTO `contactinfo` VALUES (3, 'Company info cn', '<iframe allowfullscreen=\"\" frameborder=\"0\" height=\"450\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1862.4140140010604!2d105.80155335798705!3d20.99952959650355!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x6ed93396d4180e5b!2zMTA5IE5ndXnhu4VuIFR1w6JuLCBUaGFuaCBYdcOibg!5e0!3m2!1svi!2s!4v1535516982544\" style=\"border:0\" width=\"100%\"></iframe>', 0, 0, 0, 1, 0, '', '', '', '', '21.042324102802453', '105.77579302215577', 'cn');
INSERT INTO `contactinfo` VALUES (4, 'Company info kr', '<iframe allowfullscreen=\"\" frameborder=\"0\" height=\"450\" src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1862.4140140010604!2d105.80155335798705!3d20.99952959650355!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x6ed93396d4180e5b!2zMTA5IE5ndXnhu4VuIFR1w6JuLCBUaGFuaCBYdcOibg!5e0!3m2!1svi!2s!4v1535516982544\" style=\"border:0\" width=\"100%\"></iframe>', 0, 0, 0, 1, 0, '', '', '', '', '', '', 'kr');

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country`  (
  `id_country` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currency` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_country`) USING BTREE,
  UNIQUE INDEX `countryID`(`id_country`) USING BTREE,
  INDEX `countryID_2`(`id_country`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 214 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of country
-- ----------------------------

-- ----------------------------
-- Table structure for daily
-- ----------------------------
DROP TABLE IF EXISTS `daily`;
CREATE TABLE `daily`  (
  `id_daily` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `id_category` bigint(20) NULL DEFAULT 0,
  `id_user` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 0,
  `ngay_dang` bigint(20) NULL DEFAULT 0,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fax` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkmap` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `maptitle` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `provinceid` int(11) NULL DEFAULT NULL,
  `districtid` int(11) NULL DEFAULT NULL,
  `phanphoi` int(11) NULL DEFAULT 1,
  `baohanh` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id_daily`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of daily
-- ----------------------------

-- ----------------------------
-- Table structure for direct
-- ----------------------------
DROP TABLE IF EXISTS `direct`;
CREATE TABLE `direct`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_old` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_new` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_user` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of direct
-- ----------------------------

-- ----------------------------
-- Table structure for download
-- ----------------------------
DROP TABLE IF EXISTS `download`;
CREATE TABLE `download`  (
  `id_download` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `id_user` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 0,
  `ngay_dang` bigint(20) NULL DEFAULT 0,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `files` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modify` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_download`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of download
-- ----------------------------

-- ----------------------------
-- Table structure for du_an
-- ----------------------------
DROP TABLE IF EXISTS `du_an`;
CREATE TABLE `du_an`  (
  `id_duan` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tienich` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imageadv` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint(20) UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT NULL,
  `id_user` bigint(20) NULL DEFAULT 0,
  `fileurl` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hot` tinyint(4) NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `provinceid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dientich` bigint(20) NULL DEFAULT NULL,
  `header_tag` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `related_product` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `videourl` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_duan`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of du_an
-- ----------------------------

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `id_event` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `event_location` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `event_duration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `event_date` bigint(20) NULL DEFAULT 0,
  `event_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ngay_dang` bigint(20) UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 1,
  `id_user` bigint(20) NULL DEFAULT 0,
  `file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hot` tinyint(4) NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_event`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of event
-- ----------------------------

-- ----------------------------
-- Table structure for faq
-- ----------------------------
DROP TABLE IF EXISTS `faq`;
CREATE TABLE `faq`  (
  `id_faq` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `id_category` bigint(20) NULL DEFAULT 0,
  `id_user` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 0,
  `ngay_dang` bigint(20) NULL DEFAULT 0,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `products` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_faq`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faq
-- ----------------------------

-- ----------------------------
-- Table structure for group_attr
-- ----------------------------
DROP TABLE IF EXISTS `group_attr`;
CREATE TABLE `group_attr`  (
  `id_group` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint(20) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `setdefault` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_group`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_attr
-- ----------------------------
INSERT INTO `group_attr` VALUES (21, 'Khác', 0, 1, 1);

-- ----------------------------
-- Table structure for group_attribute
-- ----------------------------
DROP TABLE IF EXISTS `group_attribute`;
CREATE TABLE `group_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_group` bigint(20) NOT NULL,
  `id_attr` bigint(20) NOT NULL,
  `thu_tu` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 418 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_attribute
-- ----------------------------
INSERT INTO `group_attribute` VALUES (415, 21, 46, 0);
INSERT INTO `group_attribute` VALUES (416, 21, 45, 0);
INSERT INTO `group_attribute` VALUES (417, 21, 43, 0);

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info`  (
  `id_info` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `id_category` bigint(20) NULL DEFAULT 0,
  `id_user` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 0,
  `ngay_dang` bigint(20) NULL DEFAULT 0,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `videourl` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `fileurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `show_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_info`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of info
-- ----------------------------

-- ----------------------------
-- Table structure for info_donvi
-- ----------------------------
DROP TABLE IF EXISTS `info_donvi`;
CREATE TABLE `info_donvi`  (
  `id_info` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `id_category` bigint(20) NULL DEFAULT 0,
  `id_user` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 0,
  `ngay_dang` bigint(20) NULL DEFAULT 0,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_info`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of info_donvi
-- ----------------------------

-- ----------------------------
-- Table structure for info_leader
-- ----------------------------
DROP TABLE IF EXISTS `info_leader`;
CREATE TABLE `info_leader`  (
  `id_info` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `id_category` bigint(20) NULL DEFAULT 0,
  `id_user` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 0,
  `ngay_dang` bigint(20) NULL DEFAULT 0,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(255) NULL DEFAULT 0,
  `position` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `branch` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dob` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_info`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of info_leader
-- ----------------------------

-- ----------------------------
-- Table structure for info_lichsu
-- ----------------------------
DROP TABLE IF EXISTS `info_lichsu`;
CREATE TABLE `info_lichsu`  (
  `id_info` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `id_category` bigint(20) NULL DEFAULT 0,
  `id_user` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 0,
  `ngay_dang` bigint(20) NULL DEFAULT 0,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_info`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of info_lichsu
-- ----------------------------

-- ----------------------------
-- Table structure for lang
-- ----------------------------
DROP TABLE IF EXISTS `lang`;
CREATE TABLE `lang`  (
  `id` int(11) NOT NULL DEFAULT 1,
  `lang` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lang
-- ----------------------------
INSERT INTO `lang` VALUES (1, '{\"_othernews\":{\"default\":\"C\\u00e1c tin kh\\u00e1c\",\"en\":\"Other articles\",\"cn\":\"a\",\"kr\":\"b\"},\"_home\":{\"default\":\"Trang ch\\u1ee7\",\"en\":\"Home\",\"cn\":\"\",\"kr\":\"\"},\"_detail\":{\"default\":\"Chi ti\\u1ebft\",\"en\":\"Detail\",\"cn\":\"\",\"kr\":\"\"},\"_page\":{\"default\":\"Trang\",\"en\":\"Pages\",\"cn\":\"\",\"kr\":\"\"},\"_fullname\":{\"default\":\"H\\u1ecd t\\u00ean\",\"en\":\"Full name\",\"cn\":\"\",\"kr\":\"\"},\"_email\":{\"default\":\"Email\",\"en\":\"E-Mail\",\"cn\":\"\",\"kr\":\"\"},\"_phone\":{\"default\":\"\\u0110i\\u1ec7n tho\\u1ea1i\",\"en\":\"Telephone\",\"cn\":\"\",\"kr\":\"\"},\"_address\":{\"default\":\"\\u0110\\u1ecba ch\\u1ec9\",\"en\":\"Address\",\"cn\":\"\",\"kr\":\"\"},\"_content\":{\"default\":\"N\\u1ed9i dung\",\"en\":\"Message\",\"cn\":\"\",\"kr\":\"\"},\"_send\":{\"default\":\"G\\u1eedi li\\u00ean h\\u1ec7\",\"en\":\"Send\",\"cn\":\"\",\"kr\":\"\"},\"_continue\":{\"default\":\"Ti\\u1ebfp t\\u1ee5c\",\"en\":\"Continue\",\"cn\":\"\",\"kr\":\"\"},\"_reset\":{\"default\":\"Nh\\u1eadp l\\u1ea1i\",\"en\":\"Reset\",\"cn\":\"\",\"kr\":\"\"},\"_searchsite\":{\"default\":\"T\\u00ecm ki\\u1ebfm\",\"en\":\"Search\",\"cn\":\"\",\"kr\":\"\"},\"_keywords\":{\"default\":\"T\\u00ecm ki\\u1ebfm \",\"en\":\"keywords\",\"cn\":\"\",\"kr\":\"\"},\"_viewall\":{\"default\":\"Xem t\\u1ea5t c\\u1ea3\",\"en\":\"View all\",\"cn\":\"\",\"kr\":\"\"},\"_search_enter_keyword\":{\"default\":\"Nh\\u1eadp n\\u1ed9i dung c\\u1ea7n t\\u00ecm, s\\u1ea3n ph\\u1ea9m, b\\u00e0i vi\\u1ebft...\",\"en\":\"Enter your keyword...\",\"cn\":\"\",\"kr\":\"\"},\"_viewmore\":{\"default\":\"Xem chi ti\\u1ebft\",\"en\":\"View more\",\"cn\":\"\",\"kr\":\"\"},\"_search_result\":{\"default\":\"K\\u1ebft qu\\u1ea3 t\\u00ecm ki\\u1ebfm\",\"en\":\"Search Result\",\"cn\":\"\",\"kr\":\"\"},\"_online_support\":{\"default\":\"H\\u1ed7 tr\\u1ee3 tr\\u1ef1c tuy\\u1ebfn\",\"en\":\"Online Support\",\"cn\":\"\",\"kr\":\"\"},\"_product_detail\":{\"default\":\"Chi ti\\u1ebft s\\u1ea3n ph\\u1ea9m\",\"en\":\"Product infomation\",\"cn\":\"\",\"kr\":\"\"},\"_comment_alert\":{\"default\":\"Nh\\u1eefng tr\\u01b0\\u1eddng c\\u00f3 d\\u1ea5u * l\\u00e0 tr\\u01b0\\u1eddng b\\u1eaft bu\\u1ed9c ph\\u1ea3i nh\\u1eadp th\\u00f4ng tin\",\"en\":\"You must enter all information in the (*) field\",\"cn\":\"\",\"kr\":\"\"},\"_your_email\":{\"default\":\"Nh\\u1eadp email c\\u1ee7a b\\u1ea1n\",\"en\":\"Your email\",\"cn\":\"\",\"kr\":\"\"},\"_captcha_code\":{\"default\":\"M\\u00e3 b\\u1ea3o m\\u1eadt\",\"en\":\"Captcha Code\",\"cn\":\"\",\"kr\":\"\"},\"_comment_send_msg\":{\"default\":\"B\\u00ecnh lu\\u1eadn c\\u1ee7a b\\u1ea1n \\u0111\\u00e3 g\\u1eedi th\\u00e0nh c\\u00f4ng\",\"en\":\"Your comment sent successfully\",\"cn\":\"\",\"kr\":\"\"},\"_captcha_invalid\":{\"default\":\"M\\u00e3 captcha kh\\u00f4ng \\u0111\\u00fang\",\"en\":\"Wrong captcha code\",\"cn\":\"\",\"kr\":\"\"},\"_customer_support\":{\"default\":\"H\\u1ed7 tr\\u1ee3 kh\\u00e1ch h\\u00e0ng\",\"en\":\"Customer support\",\"cn\":\"\",\"kr\":\"\"},\"_title\":{\"default\":\"Ti\\u00eau \\u0111\\u1ec1\",\"en\":\"Title\",\"cn\":\"\",\"kr\":\"\"},\"_view_more_about_home\":{\"default\":\"Xem ti\\u1ebfp\",\"en\":\"View more\",\"cn\":\"\",\"kr\":\"\"},\"_otherservice\":{\"default\":\"D\\u1ecbch v\\u1ee5 kh\\u00e1c\",\"en\":\"Other services\",\"cn\":\"\",\"kr\":\"\"},\"_tieudetecongty\":{\"default\":\"T\\u00ean c\\u00f4ng ty t\\u1ea1i \\u0111\\u00e2y\",\"en\":\"T\\u00ean c\\u00f4ng ty t\\u1ea1i \\u0111\\u00e2y\",\"cn\":\"\",\"kr\":\"\"},\"_hotrokhachhang\":{\"default\":\"H\\u1ed7 tr\\u1ee3 kh\\u00e1ch h\\u00e0ng\",\"en\":\"Customer care\",\"cn\":\"\",\"kr\":\"\"},\"_ngay\":{\"default\":\"Ng\\u00e0y\",\"en\":\"Date\",\"cn\":\"\",\"kr\":\"\"},\"_tentailieu\":{\"default\":\"T\\u00ean t\\u00e0i li\\u1ec7u\",\"en\":\"Document name\",\"cn\":\"\",\"kr\":\"\"},\"_taitailieu\":{\"default\":\"T\\u1ea3i t\\u00e0i li\\u1ec7u\",\"en\":\"Download document\",\"cn\":\"\",\"kr\":\"\"},\"_contactinfo\":{\"default\":\"\\u0110\\u1eb7t h\\u00e0ng\",\"en\":\"Contact info\",\"cn\":\"\",\"kr\":\"\"},\"_apply_your_cv\":{\"default\":\"\\u0110\\u0103ng k\\u00fd\",\"en\":\"Apply\",\"cn\":\"\",\"kr\":\"\"},\"_product_categories\":{\"default\":\"S\\u1ea3n ph\\u1ea9m c\\u00f9ng lo\\u1ea1i\",\"en\":\"Orther products\",\"cn\":\"\",\"kr\":\"\"},\"_giakm\":{\"default\":\"Gi\\u00e1 KM:\",\"en\":\"Seles off:\",\"cn\":\"\",\"kr\":\"\"},\"_giasp\":{\"default\":\"Gi\\u00e1:\",\"en\":\"Price:\",\"cn\":\"\",\"kr\":\"\"},\"_btnorder\":{\"default\":\"\\u0110\\u1eb7t h\\u00e0ng\",\"en\":\"Add to cart\",\"cn\":\"\",\"kr\":\"\"},\"_huongdanmuahang\":{\"default\":\"H\\u01b0\\u1edbng d\\u1eabn mua h\\u00e0ng\",\"en\":\"Shopping guide\",\"cn\":\"\",\"kr\":\"\"},\"_thanhtien\":{\"default\":\"Th\\u00e0nh ti\\u1ec1n\",\"en\":\"Total\",\"cn\":\"\",\"kr\":\"\"},\"_tongthanhtoan\":{\"default\":\"T\\u1ed5ng thanh to\\u00e1n\",\"en\":\"Total\",\"cn\":\"\",\"kr\":\"\"},\"_update_cart\":{\"default\":\"C\\u1eadp nh\\u1eadt s\\u1ed1 l\\u01b0\\u1ee3ng\",\"en\":\"Update\",\"cn\":\"\",\"kr\":\"\"},\"_order\":{\"default\":\"\\u0110\\u1eb7t h\\u00e0ng\",\"en\":\"Order\",\"cn\":\"\",\"kr\":\"\"},\"_send_order\":{\"default\":\"G\\u1eedi \\u0111\\u01a1n h\\u00e0ng\",\"en\":\"Send\",\"cn\":\"\",\"kr\":\"\"},\"_your_order_has_been_sent\":{\"default\":\"\\u0110\\u01a1n h\\u00e0ng \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c g\\u1eedi th\\u00e0nh c\\u00f4ng\",\"en\":\"Order success\",\"cn\":\"\",\"kr\":\"\"},\"_shoping_cart\":{\"default\":\"Gi\\u1ecf h\\u00e0ng\",\"en\":\"Cart\",\"cn\":\"\",\"kr\":\"\"},\"_codepr\":{\"default\":\"MSP\",\"en\":\"Code\",\"cn\":\"\",\"kr\":\"\"},\"_newsletter\":{\"default\":\"Nh\\u1eadn tin m\\u1edbi\",\"en\":\"News Letter\",\"cn\":\"\",\"kr\":\"\"},\"_enter_email\":{\"default\":\"Nh\\u1eadp E-mail\",\"en\":\"Enter E-mail\",\"cn\":\"\",\"kr\":\"\"},\"_addresscontact\":{\"default\":\"\\u0110\\u1ecba ch\\u1ec9\",\"en\":\"Address\",\"cn\":\"\",\"kr\":\"\"},\"_contact\":{\"default\":\"Li\\u00ean h\\u1ec7\",\"en\":\"Contact\",\"cn\":\"\",\"kr\":\"\"},\"_soluong\":{\"default\":\"S\\u1ed1 l\\u01b0\\u1ee3ng\",\"en\":\"Quantity\",\"cn\":\"\",\"kr\":\"\"},\"_huong_dan_su_dung\":{\"default\":\"H\\u01b0\\u1edbng d\\u1eabn s\\u1eed d\\u1ee5ng\",\"en\":\"User Guide\",\"cn\":\"\",\"kr\":\"\"},\"_relate_product\":{\"default\":\"S\\u1ea3n ph\\u1ea9m li\\u00ean quan\",\"en\":\"Relate Products\",\"cn\":\"\",\"kr\":\"\"},\"_hotline\":{\"default\":\"\\u0110\\u01b0\\u1eddng d\\u00e2y n\\u00f3ng\",\"en\":\"Hotline\",\"cn\":\"\",\"kr\":\"\"},\"_download_profile\":{\"default\":\"Download Profile\",\"en\":\"Download Profile\",\"cn\":\"\",\"kr\":\"\"},\"_regiter_successful\":{\"default\":\"\\u0110\\u0103ng k\\u00fd th\\u00e0nh c\\u00f4ng\",\"en\":\"\\u0110\\u0103ng k\\u00fd th\\u00e0nh c\\u00f4ng\",\"cn\":\"\",\"kr\":\"\"},\"_linh_vuc_hoat_dong\":{\"default\":\"L\\u0129nh v\\u1ef1c ho\\u1ea1t \\u0111\\u1ed9ng\",\"en\":\"Business\",\"cn\":\"\",\"kr\":\"\"},\"_othervideo\":{\"default\":\"C\\u00e1c video kh\\u00e1c\",\"en\":\"Other videos\",\"cn\":\"\",\"kr\":\"\"},\"_other_album\":{\"default\":\"C\\u00e1c album kh\\u00e1c\",\"en\":\"Other albums\",\"cn\":\"\",\"kr\":\"\"},\"_news\":{\"default\":\"Tin t\\u1ee9c\",\"en\":\"Hot news\",\"cn\":\"\",\"kr\":\"\"},\"_view_less\":{\"default\":\"\\u1ea8n b\\u1edbt\",\"en\":\"Hide\",\"cn\":\"\",\"kr\":\"\"},\"_frm_contact_title\":{\"default\":\"Form li\\u00ean h\\u1ec7\",\"en\":\"Conact Form\",\"cn\":\"\",\"kr\":\"\"},\"_ban_can_nhap_thong_tin\":{\"default\":\"B\\u1ea1n c\\u1ea7n nh\\u1eadp \\u0111\\u1ee7 th\\u00f4ng tin v\\u00e0o nh\\u1eefng tr\\u01b0\\u1eddng m\\u00e0u \\u0111\\u1ecf\",\"en\":\"B\\u1ea1n c\\u1ea7n nh\\u1eadp \\u0111\\u1ee7 th\\u00f4ng tin v\\u00e0o nh\\u1eefng tr\\u01b0\\u1eddng m\\u00e0u \\u0111\\u1ecf\",\"cn\":\"B\\u1ea1n c\\u1ea7n nh\\u1eadp \\u0111\\u1ee7 th\\u00f4ng tin v\\u00e0o nh\\u1eefng tr\\u01b0\\u1eddng m\\u00e0u \\u0111\\u1ecf\",\"kr\":\"B\\u1ea1n c\\u1ea7n nh\\u1eadp \\u0111\\u1ee7 th\\u00f4ng tin v\\u00e0o nh\\u1eefng tr\\u01b0\\u1eddng m\\u00e0u \\u0111\\u1ecf\"},\"_thong_tin_lien_he\":{\"default\":\"Th\\u00f4ng tin li\\u00ean h\\u1ec7 \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c g\\u1eedi th\\u00e0nh c\\u00f4ng !\",\"en\":\"Th\\u00f4ng tin li\\u00ean h\\u1ec7 \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c g\\u1eedi th\\u00e0nh c\\u00f4ng !\",\"cn\":\"Th\\u00f4ng tin li\\u00ean h\\u1ec7 \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c g\\u1eedi th\\u00e0nh c\\u00f4ng !\",\"kr\":\"Th\\u00f4ng tin li\\u00ean h\\u1ec7 \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c g\\u1eedi th\\u00e0nh c\\u00f4ng !\"},\"_ghi_chu\":{\"default\":\"Ghi ch\\u00fa\",\"en\":\"Ghi ch\\u00fa\",\"cn\":\"Ghi ch\\u00fa\",\"kr\":\"Ghi ch\\u00fa\"},\"_xem_chi_tiet\":{\"default\":\"Xem chi ti\\u1ebft \",\"en\":\"Xem chi ti\\u1ebft \",\"cn\":\"Xem chi ti\\u1ebft \",\"kr\":\"Xem chi ti\\u1ebft \"},\"_vui_long_dien_thong_tin\":{\"default\":\"Vui l\\u00f2ng \\u0111i\\u1ec1n v\\u00e0o th\\u00f4ng tin sau\",\"en\":\"Please enter field below\",\"cn\":\"Please enter field below\",\"kr\":\"Please enter field below\"},\"_we_will_contact_you_soon\":{\"default\":\"Nh\\u00e2n vi\\u00ean c\\u1ee7a ch\\u00fang t\\u00f4i s\\u1ebd li\\u00ean h\\u1ec7 v\\u1edbi b\\u1ea1n\",\"en\":\"We will contact you soon\",\"cn\":\"We will contact you soon\",\"kr\":\"We will contact you soon\"},\"_trong_thoi_gian_som\":{\"default\":\"trong th\\u1eddi gian s\\u1edbm nh\\u1ea5t\",\"en\":\"Thank you\",\"cn\":\"Thank you\",\"kr\":\"Thank you\"},\"_chon_dich_vu\":{\"default\":\"Ch\\u1ecdn d\\u1ecbch v\\u1ee5\",\"en\":\"Services\",\"cn\":\"Services\",\"kr\":\"Services\"},\"_our_partner\":{\"default\":\"Th\\u01b0\\u01a1ng hi\\u1ec7u \\u0111\\u1ed1i t\\u00e1c\",\"en\":\"Our partner\",\"cn\":\"Our partner\",\"kr\":\"Our partner\"},\"_check_field\":{\"default\":\"Vui l\\u00f2ng ki\\u1ec3m tra d\\u1eef li\\u1ec7u nh\\u1eadp v\\u00e0o\",\"en\":\"Please check input field\",\"cn\":\"Please check input field\",\"kr\":\"Please check input field\"},\"_form_title\":{\"default\":\"\\u0110\\u0102NG K\\u00dd T\\u01af V\\u1ea4N\",\"en\":\"Form name\",\"cn\":\"Form name\",\"kr\":\"Form name\"},\"_form_request\":{\"default\":\"N\\u1ed9i dung\",\"en\":\"Request\",\"cn\":\"Request\",\"kr\":\"Request\"},\"_newsletter_text\":{\"default\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus vero unde omnis obcaecati magni\",\"en\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus vero unde omnis obcaecati magni\",\"cn\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus vero unde omnis obcaecati magni\",\"kr\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus vero unde omnis obcaecati magni\"}}');

-- ----------------------------
-- Table structure for log_visited
-- ----------------------------
DROP TABLE IF EXISTS `log_visited`;
CREATE TABLE `log_visited`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdate` bigint(20) NULL DEFAULT 0,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_user` bigint(20) NULL DEFAULT 0,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7533 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_visited
-- ----------------------------
INSERT INTO `log_visited` VALUES (1, 1634813443, 'http://nhavietphongthuy.24h.co/manager/main.php?page=log_visited', 31, '118.70.118.178');

-- ----------------------------
-- Table structure for logo
-- ----------------------------
DROP TABLE IF EXISTS `logo`;
CREATE TABLE `logo`  (
  `id_logo` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ngay_dang` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `thu_tu` bigint(20) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `small_image` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `normal_image` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hit` bigint(20) NOT NULL DEFAULT 0,
  `ajaxload` int(11) NOT NULL DEFAULT 0,
  `id_user` bigint(20) NULL DEFAULT NULL,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_logo`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logo
-- ----------------------------
INSERT INTO `logo` VALUES (1, 2, 'LogoSite', '/uploaded/logo/logo.png', '', 1610585460, 1, 1, '', '', '', '', 0, 0, 8, ':');
INSERT INTO `logo` VALUES (2, 3, 'Lorem ipsum dolor sit amet', '/uploaded/slideshow/item1.jpg', '', 1610585460, 2, 1, '', '', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales.', 0, 0, 8, ':');
INSERT INTO `logo` VALUES (3, 4, 'SlideMobile01', '/uploaded/slideshow/item1.jpg', '', 1610585460, 3, 1, '', '', '', '', 0, 0, 8, ':');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id_member` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastvisit` bigint(20) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `super` tinyint(4) NOT NULL DEFAULT 0,
  `registtime` bigint(20) NOT NULL DEFAULT 0,
  `canhbao` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `yahoo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chucvu` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip` tinyint(4) NOT NULL DEFAULT 0,
  `otherinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quocgia` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_member`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member
-- ----------------------------

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module`  (
  `id_module` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gia_tri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `filefontend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_module`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 186 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES (5, 'Module manager', 'module.php', 0, 0, NULL);
INSERT INTO `module` VALUES (9, 'Cấu hình hệ thống', 'setting.php', 0, 1, '');
INSERT INTO `module` VALUES (26, 'Danh sách liên hệ', 'contact.php', 20, 1, '');
INSERT INTO `module` VALUES (74, 'Header', 'header.php', 20, 0, NULL);
INSERT INTO `module` VALUES (48, 'Trang Tin tức', 'news.php', 8, 1, '');
INSERT INTO `module` VALUES (53, 'Hỗ trợ trực tuyến', 'support.php', 20, 0, '');
INSERT INTO `module` VALUES (52, 'Trang Giới thiệu', 'info.php', 6, 1, '');
INSERT INTO `module` VALUES (43, 'Thông tin cá nhân', 'profile.php', 0, 1, '');
INSERT INTO `module` VALUES (89, 'Qu&#7843;n l&#253; link - logo', 'logo.php', 5, 1, NULL);
INSERT INTO `module` VALUES (77, 'Trang ch&#7911;', 'home.php', 2, 0, NULL);
INSERT INTO `module` VALUES (94, 'Quản lý người dùng', 'user.php', 0, 1, '');
INSERT INTO `module` VALUES (98, 'Nội dung tĩnh', 'static.php', 16, 1, '');
INSERT INTO `module` VALUES (154, 'Trang download', 'download.php', 12, 0, '');
INSERT INTO `module` VALUES (143, 'Chính sách mua hàng', 'static_text.php', 15, 0, '');
INSERT INTO `module` VALUES (119, 'Cấu hình hiển thị', 'settingshow.php', 0, 1, '');
INSERT INTO `module` VALUES (158, 'Danh mục hãng sản xuất', 'product_manufacture.php', 11, 1, '');
INSERT INTO `module` VALUES (124, 'Quản lý Chuyên mục - Category', 'category.php', 0, 1, '');
INSERT INTO `module` VALUES (132, 'Cấu hình ngôn ngữ', 'static_lang.php', 2, 0, '');
INSERT INTO `module` VALUES (135, 'Đối tác - Khách hàng', 'partner.php', 12, 1, '');
INSERT INTO `module` VALUES (144, 'Trang Videos', 'video.php', 12, 1, '');
INSERT INTO `module` VALUES (155, 'Trang Sản phẩm', 'product.php', 10, 1, '');
INSERT INTO `module` VALUES (150, 'Danh sách đơn hàng', 'order.php', 11, 1, '');
INSERT INTO `module` VALUES (153, 'System tools', 'tool_system_tools.php', 0, 1, '');
INSERT INTO `module` VALUES (156, 'Thuộc tính sản phẩm', 'attributePro.php', 11, 0, '');
INSERT INTO `module` VALUES (157, 'Liên hệ', 'contactinfo.php', 18, 1, '');
INSERT INTO `module` VALUES (159, 'Thông tin trên trang liên hệ', 'contactInfo.php', 18, 1, '');
INSERT INTO `module` VALUES (160, 'Trang Dự Án', 'du_an.php', 12, 1, '');
INSERT INTO `module` VALUES (161, 'Danh mục tỉnh thành', 'vn_province.php', 15, 0, '');
INSERT INTO `module` VALUES (162, 'Direct page', 'direct.php', 20, 1, '');
INSERT INTO `module` VALUES (163, 'Mức giá', 'price_range.php', 11, 1, '');
INSERT INTO `module` VALUES (164, 'Duyệt bình luận', 'comment.php', 20, 0, '');
INSERT INTO `module` VALUES (165, 'Ý kiến khách hàng', 'article.php', 12, 1, '');
INSERT INTO `module` VALUES (168, 'Trang Dịch vụ', 'service.php', 9, 1, '');
INSERT INTO `module` VALUES (169, 'Hỏi đáp', 'faq.php', 16, 0, '');
INSERT INTO `module` VALUES (170, 'Hệ thống đại lý', 'daily.php', 13, 0, '');
INSERT INTO `module` VALUES (171, 'Tuyển dụng', 'tuyendung.php', 12, 1, '');
INSERT INTO `module` VALUES (172, 'Xem thông tin ứng tuyển', 'tuyendung_request.php', 12, 1, '');
INSERT INTO `module` VALUES (174, 'Dịch vụ chi tiết', 'service_detail.php', 9, 0, '');
INSERT INTO `module` VALUES (176, 'Thư viện hình ảnh', 'album.php', 12, 1, '');
INSERT INTO `module` VALUES (177, 'Import danh sách bảo hành', 'import_list.php', 20, 0, '');
INSERT INTO `module` VALUES (179, 'News Letter', 'newsletter.php', 20, 1, '');
INSERT INTO `module` VALUES (180, 'Đội ngũ nhân sự', 'info_leader.php', 7, 1, '');
INSERT INTO `module` VALUES (181, 'Đơn vị thành viên', 'info_donvi.php', 7, 1, '');
INSERT INTO `module` VALUES (182, 'Lịch sự kiện - lịch khai giảng', 'event_calendar.php', 13, 0, '');
INSERT INTO `module` VALUES (183, 'Danh mục xuất xứ', 'product_material.php', 11, 1, '');
INSERT INTO `module` VALUES (184, 'Tác giả bài viết', 'tacgia.php', 8, 1, '');
INSERT INTO `module` VALUES (185, 'Lịch sử hình thành', 'info_lichsu.php', 7, 1, '');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id_news` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imageadv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint(20) UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 1,
  `id_user` bigint(20) NULL DEFAULT 0,
  `file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hit` int(11) NULL DEFAULT NULL,
  `hot` tinyint(4) NULL DEFAULT 0,
  `inhome` tinyint(4) NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `header_tag` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `form_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkto` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_tacgia` int(11) NULL DEFAULT NULL,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_news`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 1, 1, 14, 'null', NULL, 0, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', NULL, NULL, 1684728152);
INSERT INTO `news` VALUES (2, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 2, 1, 14, 'null', NULL, 0, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', NULL, NULL, 1684728153);
INSERT INTO `news` VALUES (3, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 3, 1, 14, 'null', NULL, 0, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', NULL, NULL, 1684728154);
INSERT INTO `news` VALUES (4, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 4, 1, 14, 'null', NULL, 0, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', NULL, NULL, 1684728154);
INSERT INTO `news` VALUES (5, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 5, 1, 14, 'null', NULL, 1, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', NULL, NULL, 1684728195);
INSERT INTO `news` VALUES (6, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 6, 1, 14, 'null', NULL, 1, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', NULL, NULL, 1684728198);
INSERT INTO `news` VALUES (7, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 7, 1, 14, 'null', NULL, 0, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', NULL, NULL, 1684728160);
INSERT INTO `news` VALUES (8, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 8, 1, 14, 'null', NULL, 1, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', NULL, NULL, 1684728199);
INSERT INTO `news` VALUES (9, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 9, 1, 14, 'null', NULL, 1, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', NULL, NULL, 1684728200);
INSERT INTO `news` VALUES (10, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit 001', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 10, 1, 8, 'null', NULL, 1, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-001.html', '0', 'googlenew--link', 55, 1688010512);

-- ----------------------------
-- Table structure for newsletter
-- ----------------------------
DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE `newsletter`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of newsletter
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id_order` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `session` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdate` bigint(20) UNSIGNED NULL DEFAULT 0,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `addinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `xem` tinyint(4) NULL DEFAULT 0,
  `code` bigint(20) NULL DEFAULT 0,
  `status` tinyint(4) NULL DEFAULT 0,
  `total` decimal(10, 0) NULL DEFAULT 0,
  `customer_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_loc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment_type` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transStatus` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TransactionNo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ResponseCode` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BankCode` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PayDate` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OrderInfo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_status` int(11) NULL DEFAULT 0,
  `last_update` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_order`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for partner
-- ----------------------------
DROP TABLE IF EXISTS `partner`;
CREATE TABLE `partner`  (
  `id_partner` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint(20) UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 1,
  `id_user` bigint(20) NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `header_tag` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_partner`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of partner
-- ----------------------------

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `id` bigint(9) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `createdate` bigint(20) UNSIGNED NULL DEFAULT 0,
  `transStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `merchantID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `merchTxnRef` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `orderInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` bigint(20) NULL DEFAULT NULL,
  `txnResponseCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `txnResponseText` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `transactionNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `status` tinyint(4) NULL DEFAULT 0,
  `last_update` bigint(20) NULL DEFAULT NULL,
  `client_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of payment
-- ----------------------------

-- ----------------------------
-- Table structure for price_range
-- ----------------------------
DROP TABLE IF EXISTS `price_range`;
CREATE TABLE `price_range`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `min_value` bigint(20) NULL DEFAULT 0,
  `max_value` bigint(20) NULL DEFAULT 0,
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `thu_tu` int(11) NULL DEFAULT 0,
  `lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `active` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of price_range
-- ----------------------------
INSERT INTO `price_range` VALUES (1, '< 1.000.000', 0, 1000000, NULL, 0, '', 1);
INSERT INTO `price_range` VALUES (2, '1.000.000 - 2.000.000', 1000000, 2000000, NULL, 0, '', 1);
INSERT INTO `price_range` VALUES (4, '2.000.000 - 3.000.000', 2000000, 3000000, NULL, 0, '', 1);
INSERT INTO `price_range` VALUES (5, '3.000.000 - 4.000.000', 3000000, 4000000, NULL, 0, '', 1);
INSERT INTO `price_range` VALUES (7, 'Trên 200', 4000000, 400000000, NULL, 0, '', 1);

-- ----------------------------
-- Table structure for pro_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pro_attribute`;
CREATE TABLE `pro_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `default_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `style` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alias_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pro_attribute
-- ----------------------------
INSERT INTO `pro_attribute` VALUES (43, 'Kích thước', '', '', '', 'kich-thuoc');
INSERT INTO `pro_attribute` VALUES (44, 'Trọng lượng', '', '', '', 'trong-luong');
INSERT INTO `pro_attribute` VALUES (45, 'Chất liệu', '', '', '', 'chat-lieu');
INSERT INTO `pro_attribute` VALUES (46, 'Thời gian ST', '', '', '', 'thoi-gian-st');
INSERT INTO `pro_attribute` VALUES (47, 'Cao', '', '', '', 'cao');
INSERT INTO `pro_attribute` VALUES (48, 'Dài', '', '', '', 'dai');
INSERT INTO `pro_attribute` VALUES (49, 'Rộng', '', '', '', 'rong');
INSERT INTO `pro_attribute` VALUES (50, 'Xuất Xứ', '', '', '', 'xuat-xu');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id_product` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `km` double NULL DEFAULT 0,
  `pricekm` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `giaphukien` bigint(20) NULL DEFAULT 0,
  `don_vi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ngay_dang` bigint(20) UNSIGNED NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 1,
  `id_user` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `thu_tu` int(4) NULL DEFAULT 0,
  `hit` bigint(20) NULL DEFAULT 0,
  `status` tinyint(4) NULL DEFAULT 1,
  `ma` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupcat` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fileurl` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `moi` int(11) NULL DEFAULT 0,
  `title` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `header_tag` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `size` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `color` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_ver` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ttkhuyenmai` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chatlieu` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kichthuoc` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `xuatxu` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `related_ids` varbinary(256) NULL DEFAULT NULL,
  `phukien` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `attr` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `icon` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'none',
  `videourl` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `texticon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contenttab0` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `contenttab1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `contenttab2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `spcungloai` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_manufacture` bigint(20) NULL DEFAULT NULL,
  `image_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  `id_material` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute`;
CREATE TABLE `product_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_product` bigint(20) NOT NULL,
  `id_attr` bigint(20) NOT NULL,
  `attr_value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for product_manufacture
-- ----------------------------
DROP TABLE IF EXISTS `product_manufacture`;
CREATE TABLE `product_manufacture`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_category` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `thu_tu` bigint(20) NULL DEFAULT NULL,
  `active` tinyint(4) NULL DEFAULT 1,
  `alias_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `hot` int(11) NULL DEFAULT 0,
  `url` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_manufacture
-- ----------------------------
INSERT INTO `product_manufacture` VALUES (2, 0, 'Tên hãng SX 03', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut malesuada malesuada nibh, nec dictum tortor posuere a. Nam dignissim, ante eu placerat interdum, lectus massa efficitur quam, et fermentum libero ligula vitae purus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla in risus et urna hendrerit tincidunt. Sed et nulla vitae metus fringilla lobortis ut nec massa. Donec posuere erat eget condimentum semper. Cras cursus augue id posuere ultricies. Integer vel lacinia lacus, sit amet lacinia turpis. In hac habitasse platea dictumst. In in velit magna. Donec ornare sapien id magna porttitor faucibus.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut malesuada malesuada nibh, nec dictum tortor posuere a. Nam dignissim, ante eu placerat interdum, lectus massa efficitur quam, et fermentum libero ligula vitae purus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla in risus et urna hendrerit tincidunt. Sed et nulla vitae metus fringilla lobortis ut nec massa. Donec posuere erat eget condimentum semper. Cras cursus augue id posuere ultricies. Integer vel lacinia lacus, sit amet lacinia turpis. In hac habitasse platea dictumst. In in velit magna. Donec ornare sapien id magna porttitor faucibus.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut malesuada malesuada nibh, nec dictum tortor posuere a. Nam dignissim, ante eu placerat interdum, lectus massa efficitur quam, et fermentum libero ligula vitae purus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla in risus et urna hendrerit tincidunt. Sed et nulla vitae metus fringilla lobortis ut nec massa. Donec posuere erat eget condimentum semper. Cras cursus augue id posuere ultricies. Integer vel lacinia lacus, sit amet lacinia turpis. In hac habitasse platea dictumst. In in velit magna. Donec ornare sapien id magna porttitor faucibus.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut malesuada malesuada nibh, nec dictum tortor posuere a. Nam dignissim, ante eu placerat interdum, lectus massa efficitur quam', '', 1, 1, 'ten-hang-sx-03/', 0, 'ten-hang-sx-03.html');
INSERT INTO `product_manufacture` VALUES (3, 0, 'Tên hãng SX 02', '/uploaded/y-kien-khach-hang/man.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut malesuada malesuada nibh, nec dictum tortor posuere a. Nam dignissim, ante eu placerat interdum, lectus massa efficitur quam, et fermentum libero ligula vitae purus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla in risus et urna hendrerit tincidunt. Sed et nulla vitae metus fringilla lobortis ut nec massa. Donec posuere erat eget condimentum semper. Cras cursus augue id posuere ultricies. Integer vel lacinia lacus, sit amet lacinia turpis. In hac habitasse platea dictumst. In in velit magna. Donec ornare sapien id magna porttitor faucibus.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut malesuada malesuada nibh, nec dictum tortor posuere a. Nam dignissim, ante eu placerat interdum, lectus massa efficitur quam, et fermentum libero ligula vitae purus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla in risus et urna hendrerit tincidunt. Sed et nulla vitae metus fringilla lobortis ut nec massa. Donec posuere erat eget condimentum semper. Cras cursus augue id posuere ultricies. Integer vel lacinia lacus, sit amet lacinia turpis. In hac habitasse platea dictumst. In in velit magna. Donec ornare sapien id magna porttitor faucibus.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut malesuada malesuada nibh, nec dictum tortor posuere a. Nam dignissim, ante eu placerat interdum, lectus massa efficitur quam, et fermentum libero ligula vitae purus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla in risus et urna hendrerit tincidunt. Sed et nulla vitae metus fringilla lobortis ut nec massa. Donec posuere erat eget condimentum semper. Cras cursus augue id posuere ultricies. Integer vel lacinia lacus, sit amet lacinia turpis. In hac habitasse platea dictumst. In in velit magna. Donec ornare sapien id magna porttitor faucibus.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut malesuada malesuada nibh, nec dictum tortor posuere a. Nam dignissim, ante eu placerat interdum, lectus massa efficitur quam', '', 1, 1, 'ten-hang-sx-02/', 0, 'ten-hang-sx-02.html');

-- ----------------------------
-- Table structure for product_material
-- ----------------------------
DROP TABLE IF EXISTS `product_material`;
CREATE TABLE `product_material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_category` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `thu_tu` bigint(20) NULL DEFAULT NULL,
  `active` tinyint(4) NULL DEFAULT 1,
  `alias_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `hot` int(11) NULL DEFAULT 0,
  `url` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_material
-- ----------------------------
INSERT INTO `product_material` VALUES (6, 0, 'Hàn quốc', '', '', '', '', 1, 1, 'han-quoc/', 0, 'han-quoc.html');
INSERT INTO `product_material` VALUES (7, 0, 'Thailand', '', '', '', '', 1, 1, 'thailand/', 0, 'thailand.html');
INSERT INTO `product_material` VALUES (5, 0, 'Nhật Bản', '', '', '', '', 1, 1, 'nhat-ban/', 0, 'nhat-ban.html');

-- ----------------------------
-- Table structure for rating
-- ----------------------------
DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_table` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_value` bigint(20) NULL DEFAULT NULL,
  `rate` int(11) NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdate` bigint(20) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rating
-- ----------------------------

-- ----------------------------
-- Table structure for search_content
-- ----------------------------
DROP TABLE IF EXISTS `search_content`;
CREATE TABLE `search_content`  (
  `id_search` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_unsign` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `intro` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `intro_unsign` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content_unsign` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint(20) UNSIGNED NULL DEFAULT 0,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `lang` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `active` tinyint(4) NULL DEFAULT 1,
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `search_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_category` int(11) NULL DEFAULT 0,
  `id_item` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_item_value` bigint(20) NULL DEFAULT NULL,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_search`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of search_content
-- ----------------------------
INSERT INTO `search_content` VALUES (1, 'Giới thiệu', 'gioi thieu', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n??', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n??', 1688007930, NULL, '', 1, '', NULL, 'gioi-thieu/', NULL, 'id_category', 5, 'category', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg');
INSERT INTO `search_content` VALUES (2, 'Tác giả', 'tac gia', '', '', '', '', 1688008562, NULL, '', 1, '', NULL, 'tac-gia/', NULL, 'id_category', 8, 'category', '');
INSERT INTO `search_content` VALUES (3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '', '', 1688009638, NULL, '', 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 8, 'id_tacgia', 55, 'tacgia', '');
INSERT INTO `search_content` VALUES (4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit 001', 'lorem ipsum dolor sit amet, consectetur adipiscing elit 001', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n??', 1688009889, NULL, '', 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 6, 'id_news', 10, 'news', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg');
INSERT INTO `search_content` VALUES (6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.', 1688010227, NULL, '', 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 0, 'id_album', 1, 'album', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg');

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service`  (
  `id_service` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imageadv` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint(20) UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 1,
  `id_user` bigint(20) NULL DEFAULT 0,
  `fileurl` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tieubieu` int(4) NULL DEFAULT 0,
  `image_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `inhome` tinyint(4) NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_tacgia` int(11) NULL DEFAULT NULL,
  `last_modify` bigint(20) NULL DEFAULT 0,
  PRIMARY KEY (`id_service`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of service
-- ----------------------------

-- ----------------------------
-- Table structure for service_detail
-- ----------------------------
DROP TABLE IF EXISTS `service_detail`;
CREATE TABLE `service_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_service` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `imageadv` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint(20) UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 1,
  `id_user` bigint(20) NULL DEFAULT 0,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `item_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint(20) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of service_detail
-- ----------------------------

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `setting_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `setting_value` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`setting_name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('site_name', 'Your Company Name');
INSERT INTO `settings` VALUES ('dir_path', '');
INSERT INTO `settings` VALUES ('site_email', 'nguyensyminh@gmail.com');
INSERT INTO `settings` VALUES ('use_smtp', '0');
INSERT INTO `settings` VALUES ('smtp_host', '');
INSERT INTO `settings` VALUES ('smtp_username', '');
INSERT INTO `settings` VALUES ('smtp_password', '');
INSERT INTO `settings` VALUES ('template_dir', 'templates');
INSERT INTO `settings` VALUES ('language_dir', 'english');
INSERT INTO `settings` VALUES ('date_format', 'd/m/Y');
INSERT INTO `settings` VALUES ('time_format', 'H:i');
INSERT INTO `settings` VALUES ('convert_tool', 'gd');
INSERT INTO `settings` VALUES ('convert_tool_path', '');
INSERT INTO `settings` VALUES ('gz_compress', '0');
INSERT INTO `settings` VALUES ('gz_compress_level', '1');
INSERT INTO `settings` VALUES ('upload_mode', '1');
INSERT INTO `settings` VALUES ('allowed_mediatypes', 'jpg,gif,png,bmp,aif,au,avi,mid,mov,mp3,mpg,swf,wav,rar,ra,rm,zip,pdf,txt,xls,doc,swf');
INSERT INTO `settings` VALUES ('max_thumb_width', '400');
INSERT INTO `settings` VALUES ('max_thumb_height', '300');
INSERT INTO `settings` VALUES ('max_image_height', '1024');
INSERT INTO `settings` VALUES ('max_media_size', '5000');
INSERT INTO `settings` VALUES ('upload_notify', '0');
INSERT INTO `settings` VALUES ('upload_emails', '');
INSERT INTO `settings` VALUES ('auto_thumbnail', '1');
INSERT INTO `settings` VALUES ('auto_thumbnail_dimension', '180');
INSERT INTO `settings` VALUES ('auto_thumbnail_resize_type', '1');
INSERT INTO `settings` VALUES ('auto_thumbnail_quality', '100');
INSERT INTO `settings` VALUES ('id_country', '207');
INSERT INTO `settings` VALUES ('paging_range', '5');
INSERT INTO `settings` VALUES ('watermark_text', '');
INSERT INTO `settings` VALUES ('upload_media_path', 'uploaded/files/');
INSERT INTO `settings` VALUES ('upload_image_path', 'uploaded/images/');
INSERT INTO `settings` VALUES ('session_timeout', '15');
INSERT INTO `settings` VALUES ('max_image_width', '400');
INSERT INTO `settings` VALUES ('time_offset', '0');
INSERT INTO `settings` VALUES ('http_host', '');
INSERT INTO `settings` VALUES ('document_root', 'D:/xampp/htdocs/dentium');
INSERT INTO `settings` VALUES ('site_keywords', '');
INSERT INTO `settings` VALUES ('site_description', '');
INSERT INTO `settings` VALUES ('category_item', '8');
INSERT INTO `settings` VALUES ('diachi_cty', '');
INSERT INTO `settings` VALUES ('guid', 'c346b01b0fa4d68a37874bfb1f30da42188498c8;c62e17bc72060a86a6ee62a09578d1d5e165ad56');
INSERT INTO `settings` VALUES ('bgimage', '');
INSERT INTO `settings` VALUES ('active_site', '1');
INSERT INTO `settings` VALUES ('content_active_site', '');
INSERT INTO `settings` VALUES ('acticle_item', '8');
INSERT INTO `settings` VALUES ('watermark_image', '');
INSERT INTO `settings` VALUES ('tigia', '20880');
INSERT INTO `settings` VALUES ('dir_autoupload', 'uploaded/images/');
INSERT INTO `settings` VALUES ('toppage', '');
INSERT INTO `settings` VALUES ('mailer', 'SMTP');
INSERT INTO `settings` VALUES ('bodypage', '');
INSERT INTO `settings` VALUES ('bottompage', '');

-- ----------------------------
-- Table structure for settingshow
-- ----------------------------
DROP TABLE IF EXISTS `settingshow`;
CREATE TABLE `settingshow`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `id_user` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of settingshow
-- ----------------------------
INSERT INTO `settingshow` VALUES (1, '1', '{\"newsinpage\":\"9\",\"producthome\":\"3\",\"albumpage\":\"3\",\"productinpage\":\"9\",\"photopage\":\"3\",\"hotline\":\"1900 2021\",\"companyname\":\"Your company name or slogan here\",\"companyaddress\":\"K\\u0110T Trung H\\u00f2a Nh\\u00e2n Ch\\u00ednh, Thanh Xu\\u00e2n, H\\u00e0 N\\u1ed9i\",\"companyphone\":\"0968675568 \",\"companyemail\":\"nguyensyminh@gmail.com\",\"companywebsite\":\"http:\\/\\/yourdomainname.com\",\"facebook\":\"https:\\/\\/www.facebook.com\\/yourfanpage\\/\",\"youtube\":\"#\",\"twitter\":\"#\",\"pinterest\":\"#\",\"fanpage\":\"#\",\"apikey\":\"\"}', 0);

-- ----------------------------
-- Table structure for setups
-- ----------------------------
DROP TABLE IF EXISTS `setups`;
CREATE TABLE `setups`  (
  `setup_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `setup_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of setups
-- ----------------------------

-- ----------------------------
-- Table structure for static
-- ----------------------------
DROP TABLE IF EXISTS `static`;
CREATE TABLE `static`  (
  `id_static` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `id_catstatic` bigint(11) NOT NULL DEFAULT 0,
  `id_user` bigint(20) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `ngay_dang` bigint(20) NOT NULL DEFAULT 0,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inwhere` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lang` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_static`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of static
-- ----------------------------
INSERT INTO `static` VALUES (25, 'TRỤ SỞ CHÍNH ', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;width:90%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"width: 26px;\"><img src=\"/uploaded/ico/ico-loc.png\" /></td>\r\n			<td style=\"font-family: \'Muli-B\';\">Địa chỉ</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">KĐT Trung H&ograve;a Nh&acirc;n Ch&iacute;nh, Thanh Xu&acirc;n, H&agrave; Nội</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td><img src=\"/uploaded/ico/ico-phone.png\" /></td>\r\n			<td style=\"font-family: \'Muli-B\';\">Điện thoại</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">0968 675 568</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td><img src=\"/uploaded/ico/ico-mail.png\" /></td>\r\n			<td style=\"font-family: \'Muli-B\';\">Email</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">nguyensyminh@gmail.com</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 0, 1, 0, '', 'footer', '');
INSERT INTO `static` VALUES (26, 'Company Name', '<strong>Address: </strong>Tầng 5, Khu văn ph&ograve;ng A, T&ograve;a nh&agrave; Imperia Garden, Số 203 Phố Nguyễn Huy Tưởng, Thanh Xu&acirc;n, H&agrave; Nội<br />\r\n<strong>Tel:</strong> 0966.877.869 - 0934.877.869<br />\r\n<strong>Email:</strong> thangmayplc@gmail.com', 0, 0, 0, 1, 0, '', 'footer', 'en');
INSERT INTO `static` VALUES (30, 'Copyright', '&copy; Copyright by&nbsp;', 0, 0, 0, 1, 0, '', 'copyright', 'en');
INSERT INTO `static` VALUES (31, 'Trang Liên hệ', '- Adress: 16th FLoor - PV Oil Holding, 148 Hoang Quoc Viet, Cau Giay, Ha Noi<br />\r\n- Tel: (04).37634666 / 37634777 / 38374999<br />\r\n- Email: info@anphatgroup.com.vn<br />\r\n- www.anphatgroup.com.vn', 0, 0, 0, 1, 0, '', '', 'en');
INSERT INTO `static` VALUES (32, 'Footer cn', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table-list\" style=\"border-collapse:collapse;width:100%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td height=\"25\" width=\"23\"><img alt=\"\" src=\"/uploaded/no-img/footer-icon%20(1).png\" style=\"float: left;\" /></td>\r\n			<td>Địa chỉ: Số 109 Nguyễn Tu&acirc;n, P.Nh&acirc;n Ch&iacute;nh, Thanh Xu&acirc;n, HN</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"25\"><img alt=\"\" src=\"/uploaded/no-img/footer-icon%20(2).png\" style=\"float: left;\" /></td>\r\n			<td>Tel: 094.8866.109 - 088.884.5050</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"25\"><img alt=\"\" src=\"/uploaded/no-img/footer-icon%20(3).png\" style=\"float: left;\" /></td>\r\n			<td>Email: thelegend@daiviet.vn</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"25\"><img alt=\"\" src=\"/uploaded/no-img/footer-icon%20(4).png\" style=\"float: left;\" /></td>\r\n			<td>Website: www.thelegenddaiviet.vn&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 0, 1, 0, '', 'footer', 'cn');
INSERT INTO `static` VALUES (33, 'Footer kr', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"table-list\" style=\"border-collapse:collapse;width:100%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td height=\"25\" width=\"23\"><img alt=\"\" src=\"/uploaded/no-img/footer-icon%20(1).png\" style=\"float: left;\" /></td>\r\n			<td>Địa chỉ: Số 109 Nguyễn Tu&acirc;n, P.Nh&acirc;n Ch&iacute;nh, Thanh Xu&acirc;n, HN</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"25\"><img alt=\"\" src=\"/uploaded/no-img/footer-icon%20(2).png\" style=\"float: left;\" /></td>\r\n			<td>Tel: 094.8866.109 - 088.884.5050</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"25\"><img alt=\"\" src=\"/uploaded/no-img/footer-icon%20(3).png\" style=\"float: left;\" /></td>\r\n			<td>Email: thelegend@daiviet.vn</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"25\"><img alt=\"\" src=\"/uploaded/no-img/footer-icon%20(4).png\" style=\"float: left;\" /></td>\r\n			<td>Website: www.thelegenddaiviet.vn&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 0, 1, 0, '', 'footer', 'kr');
INSERT INTO `static` VALUES (34, 'Điều khoản thanh toán trực tuyến', '', 0, 0, 0, 1, 0, '', 'dieukhoan', '');

-- ----------------------------
-- Table structure for static_text
-- ----------------------------
DROP TABLE IF EXISTS `static_text`;
CREATE TABLE `static_text`  (
  `id_static` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `id_user` bigint(20) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `ngay_dang` bigint(20) NOT NULL DEFAULT 0,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lang` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_static`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of static_text
-- ----------------------------

-- ----------------------------
-- Table structure for sys_image
-- ----------------------------
DROP TABLE IF EXISTS `sys_image`;
CREATE TABLE `sys_image`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_category` bigint(20) NULL DEFAULT NULL,
  `table_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_item` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_value` bigint(20) NULL DEFAULT NULL,
  `type_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_image
-- ----------------------------

-- ----------------------------
-- Table structure for tacgia
-- ----------------------------
DROP TABLE IF EXISTS `tacgia`;
CREATE TABLE `tacgia`  (
  `id_tacgia` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `chucdanh` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imageadv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `intro` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `thongtinkhac` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ngay_dang` bigint(20) UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 1,
  `id_user` bigint(20) NULL DEFAULT 0,
  `header_tag` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tacgia`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tacgia
-- ----------------------------
INSERT INTO `tacgia` VALUES (54, 58, 'Hà Nguyễn', 'Hà Nguyễn', 'Founder / CEO', '', '', '/uploaded/gioi-thieu/founder.jpg', '0', '<div style=\"text-align: justify;\"><span style=\"line-height:2;\">T&ocirc;i l&agrave; Founder ki&ecirc;m CEO&nbsp;của c&ocirc;ng ty thiết kế thi c&ocirc;ng nội thất Best Design. T&ocirc;i kh&ocirc;ng ngừng cố gắng để t&igrave;m ra c&aacute;c giải ph&aacute;p thiết kế nội thất, thi c&ocirc;ng nội thất đẹp, độc đ&aacute;o với nhiều phong c&aacute;ch nội thất, gi&uacute;p gia chủ tối ưu chi ph&iacute; nhất. Mỗi dự &aacute;n d&ugrave; lớn hay nhỏ th&igrave; t&ocirc;i lu&ocirc;n tập trung cao độ để mang đến cho qu&yacute; kh&aacute;ch h&agrave;ng những bản vẽ thiết kế, phương &aacute;n thi c&ocirc;ng nội thất ho&agrave;n mỹ nhất! Q&uacute;y kh&aacute;ch h&agrave;ng cần được tư vấn hỗ trợ c&oacute; thể li&ecirc;n hệ trực tiếp với t&ocirc;i nh&eacute;! Rất h&acirc;n hạnh được phục vụ v&agrave; đồng h&agrave;nh c&ugrave;ng qu&yacute; kh&aacute;ch trong h&agrave;nh tr&igrave;nh kiến tạo kh&ocirc;ng gian sống!</span></div>\r\n', '<div style=\"text-align: justify;\"><span style=\"line-height:2;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.&nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.&nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.&nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.&nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.</span><br />\r\n&nbsp;</div>\r\n', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td width=\"55\"><a href=\"https://www.facebook.com/hanguyenbestdesign.vn\" target=\"_blank\"><img alt=\"\" src=\"/uploaded/ico/icon-face.png\" style=\"width: 50px; height: 50px;\" /></a></td>\r\n			<td width=\"55\"><a href=\"https://twitter.com/HaNguyendhv\" target=\"_blank\"><img alt=\"\" src=\"/uploaded/ico/icon-tweet.png\" style=\"width: 50px; height: 50px;\" /></a></td>\r\n			<td width=\"55\"><a href=\"https://www.instagram.com/ha_nguyen37/\" target=\"_blank\"><img alt=\"\" src=\"/uploaded/ico/icon-insta.png\" style=\"width: 50px; height: 50px;\" /></a></td>\r\n			<td width=\"55\"><a href=\"https://www.linkedin.com/in/h%C3%A0-nguy%E1%BB%85n-a7072025b/\" target=\"_blank\"><img alt=\"\" src=\"/uploaded/ico/icon-linkin.png\" style=\"width: 50px; height: 50px;\" /></a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 1687509540, 1, 1, 32, NULL, 'tac-gia/ha-nguyen.html', 1687512364);
INSERT INTO `tacgia` VALUES (55, 8, 'Minh Nguyễn', 'Minh Nguyễn', 'Tư vấn thiết kế website', '', '', '/uploaded/y-kien-khach-hang/man.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.<br />\r\n&nbsp;', '', 1688009580, 2, 1, 8, NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 1688009692);

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gia_tri` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tags
-- ----------------------------

-- ----------------------------
-- Table structure for tuyendung
-- ----------------------------
DROP TABLE IF EXISTS `tuyendung`;
CREATE TABLE `tuyendung`  (
  `id_tuyendung` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `short_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint(20) UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 1,
  `id_user` bigint(20) NULL DEFAULT 0,
  `file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hot` tinyint(4) NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `soluong` bigint(20) NULL DEFAULT NULL,
  `diadiem` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thoihan` bigint(20) NULL DEFAULT NULL,
  `congviec` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tuyendung`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tuyendung
-- ----------------------------

-- ----------------------------
-- Table structure for tuyendung_request
-- ----------------------------
DROP TABLE IF EXISTS `tuyendung_request`;
CREATE TABLE `tuyendung_request`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `subject` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdate` bigint(20) NULL DEFAULT NULL,
  `xem` int(11) NULL DEFAULT NULL,
  `url` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `file` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tuyendung_request
-- ----------------------------

-- ----------------------------
-- Table structure for url
-- ----------------------------
DROP TABLE IF EXISTS `url`;
CREATE TABLE `url`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dt_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_item` bigint(20) NULL DEFAULT 0,
  `data_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alias_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_category` bigint(20) NULL DEFAULT 0,
  `page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of url
-- ----------------------------

-- ----------------------------
-- Table structure for user_module
-- ----------------------------
DROP TABLE IF EXISTS `user_module`;
CREATE TABLE `user_module`  (
  `id_user_module` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `id_module` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_user_module`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 150 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of user_module
-- ----------------------------
INSERT INTO `user_module` VALUES (27, 11, 53);
INSERT INTO `user_module` VALUES (29, 11, 48);
INSERT INTO `user_module` VALUES (30, 11, 43);
INSERT INTO `user_module` VALUES (45, 12, 98);
INSERT INTO `user_module` VALUES (46, 12, 119);
INSERT INTO `user_module` VALUES (49, 12, 89);
INSERT INTO `user_module` VALUES (50, 12, 9);
INSERT INTO `user_module` VALUES (52, 12, 94);
INSERT INTO `user_module` VALUES (54, 12, 53);
INSERT INTO `user_module` VALUES (55, 12, 52);
INSERT INTO `user_module` VALUES (56, 12, 48);
INSERT INTO `user_module` VALUES (57, 12, 43);
INSERT INTO `user_module` VALUES (58, 12, 26);
INSERT INTO `user_module` VALUES (59, 12, 5);
INSERT INTO `user_module` VALUES (63, 11, 26);
INSERT INTO `user_module` VALUES (64, 11, 124);
INSERT INTO `user_module` VALUES (65, 12, 124);
INSERT INTO `user_module` VALUES (66, 13, 119);
INSERT INTO `user_module` VALUES (67, 13, 89);
INSERT INTO `user_module` VALUES (70, 16, 98);
INSERT INTO `user_module` VALUES (71, 16, 119);
INSERT INTO `user_module` VALUES (72, 16, 89);
INSERT INTO `user_module` VALUES (73, 16, 159);
INSERT INTO `user_module` VALUES (74, 16, 157);
INSERT INTO `user_module` VALUES (75, 16, 156);
INSERT INTO `user_module` VALUES (76, 16, 155);
INSERT INTO `user_module` VALUES (77, 16, 153);
INSERT INTO `user_module` VALUES (78, 16, 150);
INSERT INTO `user_module` VALUES (79, 16, 144);
INSERT INTO `user_module` VALUES (80, 16, 124);
INSERT INTO `user_module` VALUES (81, 16, 52);
INSERT INTO `user_module` VALUES (82, 16, 48);
INSERT INTO `user_module` VALUES (83, 16, 43);
INSERT INTO `user_module` VALUES (84, 16, 26);
INSERT INTO `user_module` VALUES (85, 18, 98);
INSERT INTO `user_module` VALUES (86, 18, 89);
INSERT INTO `user_module` VALUES (87, 18, 9);
INSERT INTO `user_module` VALUES (88, 18, 179);
INSERT INTO `user_module` VALUES (90, 18, 177);
INSERT INTO `user_module` VALUES (91, 18, 176);
INSERT INTO `user_module` VALUES (93, 18, 174);
INSERT INTO `user_module` VALUES (94, 18, 172);
INSERT INTO `user_module` VALUES (95, 18, 171);
INSERT INTO `user_module` VALUES (96, 18, 170);
INSERT INTO `user_module` VALUES (97, 18, 169);
INSERT INTO `user_module` VALUES (99, 18, 165);
INSERT INTO `user_module` VALUES (100, 18, 161);
INSERT INTO `user_module` VALUES (101, 18, 159);
INSERT INTO `user_module` VALUES (102, 18, 157);
INSERT INTO `user_module` VALUES (103, 18, 156);
INSERT INTO `user_module` VALUES (104, 18, 155);
INSERT INTO `user_module` VALUES (105, 18, 144);
INSERT INTO `user_module` VALUES (106, 18, 52);
INSERT INTO `user_module` VALUES (107, 18, 48);
INSERT INTO `user_module` VALUES (108, 18, 26);
INSERT INTO `user_module` VALUES (139, 20, 124);
INSERT INTO `user_module` VALUES (138, 20, 171);
INSERT INTO `user_module` VALUES (137, 20, 172);
INSERT INTO `user_module` VALUES (136, 20, 9);
INSERT INTO `user_module` VALUES (135, 20, 98);
INSERT INTO `user_module` VALUES (140, 21, 172);
INSERT INTO `user_module` VALUES (141, 21, 171);
INSERT INTO `user_module` VALUES (142, 21, 52);
INSERT INTO `user_module` VALUES (144, 25, 179);
INSERT INTO `user_module` VALUES (149, 30, 179);
INSERT INTO `user_module` VALUES (148, 29, 170);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id_users` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastvisit` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `super` tinyint(4) NOT NULL DEFAULT 0,
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yahoo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `showed` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_users`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (8, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '', 1584705747, 1, 1, 'HÃ  Ná»™i', NULL, '', 1);
INSERT INTO `users` VALUES (14, 'BM', 'bm', '6f86eebff01efaa4a89597d46708f1a2', '', '', 1586489145, 1, 1, NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `id_video` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thu_tu` bigint(20) NULL DEFAULT 0,
  `id_category` bigint(20) NULL DEFAULT 0,
  `id_user` bigint(20) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 0,
  `ngay_dang` bigint(20) NULL DEFAULT 0,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `showinfooter` int(11) NULL DEFAULT 0,
  `last_modify` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_video`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of video
-- ----------------------------

-- ----------------------------
-- Table structure for vn_district
-- ----------------------------
DROP TABLE IF EXISTS `vn_district`;
CREATE TABLE `vn_district`  (
  `districtid` int(5) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `provinceid` int(5) NOT NULL,
  `other_info` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`districtid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of vn_district
-- ----------------------------

-- ----------------------------
-- Table structure for vn_province
-- ----------------------------
DROP TABLE IF EXISTS `vn_province`;
CREATE TABLE `vn_province`  (
  `provinceid` int(5) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`provinceid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of vn_province
-- ----------------------------
INSERT INTO `vn_province` VALUES (1, 'Thành phố Hà Nội', 'Thành phố Trung ương', 0);
INSERT INTO `vn_province` VALUES (2, 'Hà Giang', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (4, 'Cao Bằng', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (6, 'Bắc Kạn', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (8, 'Tuyên Quang', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (10, 'Lào Cai', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (11, 'Điện Biên', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (12, 'Lai Châu', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (14, 'Sơn La', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (15, 'Yên Bái', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (17, 'Hoà Bình', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (19, 'Thái Nguyên', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (20, 'Lạng Sơn', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (22, 'Quảng Ninh', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (24, 'Bắc Giang', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (25, 'Phú Thọ', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (26, 'Vĩnh Phúc', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (27, 'Bắc Ninh', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (30, 'Hải Dương', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (31, 'Thành phố Hải Phòng', 'Thành phố Trung ương', 0);
INSERT INTO `vn_province` VALUES (33, 'Hưng Yên', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (34, 'Thái Bình', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (35, 'Hà Nam', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (36, 'Nam Định', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (37, 'Ninh Bình', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (38, 'Thanh Hóa', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (40, 'Nghệ An', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (42, 'Hà Tĩnh', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (44, 'Quảng Bình', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (45, 'Quảng Trị', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (46, 'Thừa Thiên Huế', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (48, 'Thành phố Đà Nẵng', 'Thành phố Trung ương', 0);
INSERT INTO `vn_province` VALUES (49, 'Quảng Nam', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (51, 'Quảng Ngãi', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (52, 'Bình Định', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (54, 'Phú Yên', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (56, 'Khánh Hòa', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (58, 'Ninh Thuận', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (60, 'Bình Thuận', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (62, 'Kon Tum', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (64, 'Gia Lai', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (66, 'Đắk Lắk', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (67, 'Đắk Nông', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (68, 'Lâm Đồng', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (70, 'Bình Phước', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (72, 'Tây Ninh', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (74, 'Bình Dương', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (75, 'Đồng Nai', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (77, 'Bà Rịa - Vũng Tàu', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (79, 'Thành phố Hồ Chí Minh', 'Thành phố Trung ương', 0);
INSERT INTO `vn_province` VALUES (80, 'Long An', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (82, 'Tiền Giang', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (83, 'Bến Tre', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (84, 'Trà Vinh', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (86, 'Vĩnh Long', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (87, 'Đồng Tháp', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (89, 'An Giang', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (91, 'Kiên Giang', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (92, 'Thành phố Cần Thơ', 'Thành phố Trung ương', 0);
INSERT INTO `vn_province` VALUES (93, 'Hậu Giang', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (94, 'Sóc Trăng', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (95, 'Bạc Liêu', 'Tỉnh', 0);
INSERT INTO `vn_province` VALUES (96, 'Cà Mau', 'Tỉnh', 0);

-- ----------------------------
-- Table structure for yahoo
-- ----------------------------
DROP TABLE IF EXISTS `yahoo`;
CREATE TABLE `yahoo`  (
  `id_yahoo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `id_category` int(11) NULL DEFAULT NULL,
  `image` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nick` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thu_tu` tinyint(4) NULL DEFAULT 0,
  `active` tinyint(4) NULL DEFAULT 0,
  `sky` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zalo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lang` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id_yahoo`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yahoo
-- ----------------------------
INSERT INTO `yahoo` VALUES (19, 23, '/uploaded/y-kien-khach-hang/man.png', '#NickNick', 'Tên nhân viên hỗ trợ', 2, 1, 'skype:0912652259?chat', 'https://zalo.me/0968675568', '', 'abc bac', '0968123456', '');
INSERT INTO `yahoo` VALUES (20, 23, '/uploaded/khachhang/Layer%2024.png', '#NickNick', 'Tiêu đề bài viết hiển thị tại đây', 1, 1, 'skype:0912652259?chat', 'za', '', 'abc bac', '0968123456', '');

-- ----------------------------
-- Table structure for ykien
-- ----------------------------
DROP TABLE IF EXISTS `ykien`;
CREATE TABLE `ykien`  (
  `id_ykien` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ngay_dang` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `thu_tu` bigint(20) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `small_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `normal_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_user` bigint(20) NOT NULL DEFAULT 0,
  `file` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tieubieu` int(4) NULL DEFAULT 0,
  `hit` int(11) NULL DEFAULT NULL,
  `imgshowdetail` tinyint(4) NOT NULL DEFAULT 0,
  `hot` tinyint(4) NOT NULL DEFAULT 0,
  `inhome` tinyint(4) NOT NULL DEFAULT 0,
  `showdate` tinyint(4) NOT NULL DEFAULT 1,
  `showcomment` tinyint(4) NOT NULL DEFAULT 0,
  `postcomment` tinyint(4) NOT NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `soure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author_id` int(11) NULL DEFAULT NULL,
  `author_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_email` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `id_service` bigint(20) NULL DEFAULT 0,
  PRIMARY KEY (`id_ykien`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ykien
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
