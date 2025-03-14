/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : healthcoach_backup

 Target Server Type    : MySQL
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 13/03/2025 17:48:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album`  (
  `id_album` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ngay_dang` bigint UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 1,
  `id_user` bigint NULL DEFAULT 0,
  `hot` tinyint NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_tacgia` int NULL DEFAULT NULL,
  `image_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint NULL DEFAULT NULL,
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
  `id_article` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_service` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 1,
  `id_user` bigint NULL DEFAULT 0,
  `file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hot` tinyint NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_id` int NULL DEFAULT NULL,
  `author_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_email` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint NULL DEFAULT NULL,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngay_nhap` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ma_hang` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `imei` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ngay_ban` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ngay_bh` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `thoigianbaohanh` int NULL DEFAULT 12,
  `so_phieu_ban` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `makh` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tenkh` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dia_chi` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dien_thoai` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mobile` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `thong_tin_khac` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` bigint NULL DEFAULT NULL,
  `id_user` int NULL DEFAULT NULL,
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
  `id_category` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subname` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `title` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` bigint UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 1,
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
  `rss` int NULL DEFAULT 0,
  `lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stypeshow` int NULL DEFAULT NULL,
  `id_attr` bigint NULL DEFAULT NULL,
  `shortinhome` tinyint NULL DEFAULT NULL,
  `footercol` int NULL DEFAULT NULL,
  `homescroll` int NULL DEFAULT 0,
  `localnews` int NULL DEFAULT 0,
  `col` int NULL DEFAULT NULL,
  `vtcolsub` int NULL DEFAULT 0,
  `iconmenu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menucolor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `home_zone` int NULL DEFAULT 1,
  `imageadv` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `styleshow` int NULL DEFAULT 0,
  `left_right_layout` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mega_menu` int NULL DEFAULT 0,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id_category`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Trang chủ', 'Trang chủ', 'Homepage - Your Company Name', 0, 1, 1, '', '', '', '', '', '', ':menubar:', 'home', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1651682080);
INSERT INTO `category` VALUES (2, 'Logo', 'Logo', 'Logo', 0, 2, 1, '', ' ', '', '', 'logo/', '', ':logosite:', 'logo', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, ' ', '', 1608698050);
INSERT INTO `category` VALUES (3, 'SlideHome', 'SlideHome', 'SlideHome', 0, 3, 1, '', '', '', '', 'slidehome/', '', ':slideshow:', 'logo', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1608698090);
INSERT INTO `category` VALUES (4, 'SlideHomeMobile', 'SlideHomeMobile', 'SlideHomeMobile', 0, 4, 1, '', '', '', '', 'slidehomemobile/', '', ':slidemobile:', 'logo', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1608698103);
INSERT INTO `category` VALUES (5, 'Giới thiệu', 'Giới thiệu', 'Giới thiệu', 0, 5, 1, '', 'Green20s l&agrave; m&ocirc; h&igrave;nh kinh doanh ti&ecirc;n phong kết hợp dịch vụ chăm s&oacute;c sức khoẻ &amp; l&agrave;m đẹp nhanh theo chuẩn y khoa, ứng dụng phương ph&aacute;p Dưỡng sinh ph&acirc;n tử độc đ&aacute;o. Chuỗi Green20s hướng đến phục vụ kh&aacute;ch h&agrave;ng hiện đại với trải nghiệm nhanh ch&oacute;ng, tiện lợi nhưng vẫn đảm bảo hiệu quả chăm s&oacute;c sức khoẻ chuy&ecirc;n s&acirc;u. Green20s lấy cảm hứng từ lối sống xanh, l&agrave;nh mạnh v&agrave; tinh thần tươi trẻ của tuổi 20, thể hiện kh&aacute;t vọng gi&uacute;p kh&aacute;ch h&agrave;ng trẻ ho&aacute; sức khoẻ v&agrave; sắc đẹp một c&aacute;ch tự nhi&ecirc;n.\r\n<div style=\"text-align: center;\"><img alt=\"\" src=\"/uploaded/123/d5b5bf0b31c43d17f255cac588b1e6b6.png\" style=\"width: 1024px; height: 1024px;\" /></div>\r\n<br />\r\n<br />\r\nGreen20s hướng tới trở th&agrave;nh hệ thống chăm s&oacute;c sức khoẻ &amp; sắc đẹp h&agrave;ng đầu Việt Nam, ti&ecirc;n phong ứng dụng phương ph&aacute;p Dưỡng sinh ph&acirc;n tử trong dịch vụ. Ch&uacute;ng t&ocirc;i phấn đấu x&acirc;y dựng một thương hiệu uy t&iacute;n, dẫn dắt xu hướng sống xanh v&agrave; chăm s&oacute;c sức khoẻ chủ động tại Việt Nam. Đồng thời ch&uacute;ng t&ocirc;i mong muốn lan toả lối sống xanh v&agrave; th&oacute;i quen chăm s&oacute;c sức khoẻ chủ động đến cộng đồng, gi&uacute;p mọi người n&acirc;ng cao chất lượng cuộc sống.<br />\r\n<br />\r\n<br />\r\n&nbsp;', '', '', 'gioi-thieu/', '', ':menubar:hothome:', 'info', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '<br />\r\n&nbsp;', '', 1741703529);
INSERT INTO `category` VALUES (28, 'Chăm sóc da chuyên sâu ', 'Chăm sóc da chuyên sâu ', 'Chăm sóc da chuyên sâu ', 10, 23, 1, '/uploaded/gioi-thieu/face.jpg', '', '', '', 'cham-soc-da-chuyen-sau/', '', ':', 'service', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741853376);
INSERT INTO `category` VALUES (29, 'Gội đầu dưỡng sinh phân tử ', 'Gội đầu dưỡng sinh phân tử ', 'Gội đầu dưỡng sinh phân tử ', 10, 24, 1, '/uploaded/gioi-thieu/goi-dau-duong-sinh.jpg', '', '', '', 'goi-dau-duong-sinh-phan-tu/', '', ':', 'service', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741853534);
INSERT INTO `category` VALUES (6, 'Tin tức ', 'Tin tức sự kiện', 'Tin tức', 0, 6, 1, '', '', '', '', 'tin-tuc/', '', ':menubar:', 'news', '0', 'news_col', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Blanditiis animi autem consequuntur natus porro. Veritatis nisi iusto vitae sed, quae dolorum culpa vel quo officia esse necessitatibus distinctio quidem ipsa?', '', 1741852541);
INSERT INTO `category` VALUES (7, 'Liên hệ', 'Liên hệ', 'Liên hệ', 0, 7, 0, '', '', '', '', 'lien-he/', '', ':menubar:', 'contact', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1610560339);
INSERT INTO `category` VALUES (8, 'Tác giả', 'Tác giả', 'Tác giả', 0, 8, 0, '', '', '', '', 'tac-gia/', '', ':', 'tacgia', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1688008562);
INSERT INTO `category` VALUES (10, 'Dịch Vụ Làm Đẹp ', 'Dịch Vụ Làm Đẹp ', 'Dịch Vụ Làm Đẹp ', 0, 9, 1, '', '', '', '', 'dich-vu/', '', ':menubar:inhome:', 'service', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741850805);
INSERT INTO `category` VALUES (11, 'Chăm Sóc Toàn Diện ', 'event', 'Sự kiện', 0, 10, 1, '', '', '', '', 'su-kien/', '', ':menubar:', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741706889);
INSERT INTO `category` VALUES (21, 'Tư vấn', 'Tư vấn', 'Tư vấn', 10, 17, 1, '/uploaded/gioi-thieu/tu-van.jpg', '', '', '', 'tu-van/', '', ':', 'service', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741853722);
INSERT INTO `category` VALUES (13, 'Sản Phẩm', 'Product', 'Sản Phẩm', 0, 12, 1, '/uploaded/san-pham/img-2.jpg', 'stias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officii', '', '', 'san-pham/', '', ':menubar:cathome:', 'product', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739767108);
INSERT INTO `category` VALUES (15, 'Healthy meals tips', 'Healthy meals tips', 'Healthy meals tips', 0, 14, 0, '/uploaded/san-pham/12_grande.jpg', '', '', '', 'healthy-meals-tips/', '', ':inhome:', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739414690);
INSERT INTO `category` VALUES (16, 'Recipes Idea', 'Recipes Idea', 'Recipes Idea', 0, 15, 0, '/uploaded/san-pham/12_grande.jpg', '', '', '', 'recipes-idea/', '', ':inhome:', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739415004);
INSERT INTO `category` VALUES (17, 'HealThy excersire', 'HealThy excersire', 'HealThy excersire', 0, 16, 0, '/uploaded/san-pham/img-2.jpg', '', '', '', 'healthy-excersire/', '', ':inhome:', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739414742);
INSERT INTO `category` VALUES (23, 'Đội ngũ ', 'chuyên gia', 'Đội ngũ chuyên gia', 0, 18, 0, '', '', '', '', 'doi-ngu-chuyen-gia/', '', ':cathome:', 'info_leader', '0', '', '', NULL, '', 0, '', NULL, 21, 1, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '&aacute;dasdasdsadasd', '', 1739503571);
INSERT INTO `category` VALUES (24, 'Tin nổi bật', 'Tin nổi bật', 'Tin nổi bật', 0, 19, 1, '', '', '', '', 'tin-noi-bat/', '', ':hothome:', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, 'ters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsu', '', 1739507625);
INSERT INTO `category` VALUES (25, 'FAQ', 'Faq', 'FAQ', 0, 20, 1, '', '', '', '', 'faq/', '', ':cathome:', 'faq', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739510008);
INSERT INTO `category` VALUES (26, 'Danh mục sản phẩm 1', 'Danh mục sản phẩm 1', 'Danh mục sản phẩm 1', 13, 21, 1, '', '', '', '', 'danh-muc-san-pham-1/', '', ':', 'product', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739765751);
INSERT INTO `category` VALUES (27, 'Danh mục sản phẩm 2', 'Danh mục sản phẩm 2', 'Danh mục sản phẩm 2', 13, 22, 1, '', '', '', '', 'danh-muc-san-pham-2/', '', ':', 'product', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739766005);
INSERT INTO `category` VALUES (30, 'TRẺ HOÁ VÙNG KÍN ', 'TRẺ HOÁ VÙNG KÍN ', 'TRẺ HOÁ VÙNG KÍN ', 10, 25, 1, '/uploaded/gioi-thieu/tre-hoa-vung-kin.jpg', '', '', '', 'tre-hoa-vung-kin/', '', ':', 'service', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741853798);
INSERT INTO `category` VALUES (31, 'Giảm Béo Chuẩn Y Khoa ', 'Giảm Béo Chuẩn Y Khoa ', 'Giảm Béo Chuẩn Y Khoa ', 10, 26, 1, '/uploaded/gioi-thieu/giam-beo-chuan-y-khoa.jpg', '', '', '', 'giam-beo-chuan-y-khoa/', '', ':', 'service', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741853655);
INSERT INTO `category` VALUES (32, 'Kiểm Tra &amp; Đánh Giá Sức Khoẻ', 'Kiểm Tra &amp; Đánh Giá Sức Khoẻ', 'Kiểm Tra &amp; Đánh Giá Sức Khoẻ', 11, 27, 1, '', '', '', '', 'kiem-tra-amp-danh-gia-suc-khoe/', '', ':', 'info', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741707881);
INSERT INTO `category` VALUES (33, 'Thư giãn &amp; Dưỡng sinh ', 'Thư giãn &amp; Dưỡng sinh ', 'Thư giãn &amp; Dưỡng sinh ', 11, 28, 1, '', '', '', '', 'thu-gian-amp-duong-sinh/', '', ':', 'service', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741708089);
INSERT INTO `category` VALUES (34, 'Thư giãn &amp; Dưỡng sinh ', 'Thư giãn &amp; Dưỡng sinh ', 'Thư giãn &amp; Dưỡng sinh ', 0, 29, 1, '', '', '', '', 'thu-gian-amp-duong-sinh/', '', ':', 'service', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741708084);
INSERT INTO `category` VALUES (35, 'Trị liệu sức khoẻ ', 'Trị liệu sức khoẻ ', 'Trị liệu sức khoẻ ', 11, 30, 1, '', '', '', '', 'tri-lieu-suc-khoe/', '', ':', 'service', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741708301);
INSERT INTO `category` VALUES (36, 'Khóa học', 'Khóa học', 'Khóa học', 0, 31, 1, '', '', '', '', 'khoa-hoc/', '', ':menubar:menuleft:', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741773001);
INSERT INTO `category` VALUES (37, 'Khóa học chốt Sale', 'Khóa học chốt Sale', 'Khóa học chốt Sale', 36, 32, 1, '', '', '', '', 'khoa-hoc-chot-sale/', '', ':', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741771946);
INSERT INTO `category` VALUES (38, 'Khóa học điều trị rạn', 'Khóa học điều trị rạn', 'Khóa học điều trị rạn', 36, 33, 1, '', '', '', '', 'khoa-hoc-dieu-tri-ran/', '', ':', '', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741772050);
INSERT INTO `category` VALUES (39, 'Khóa học tắm bé sơ sinh', 'Khóa học tắm bé sơ sinh', 'Khóa học tắm bé sơ sinh', 36, 34, 1, '', '', '', '', 'khoa-hoc-tam-be-so-sinh/', '', ':', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741772079);
INSERT INTO `category` VALUES (40, 'khóa đào tạo nghề chăm sóc sau sinh', 'khóa đào tạo nghề chăm sóc sau sinh', 'khóa đào tạo nghề chăm sóc sau sinh', 36, 359, 1, '', '', '', '', 'khoa-dao-tao-nghe-cham-soc-sau-sinh/', '', ':', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741772111);
INSERT INTO `category` VALUES (41, 'khóa đào tạo nghề chăm sóc sau sinh', 'khóa đào tạo nghề chăm sóc sau sinh', 'khóa đào tạo nghề chăm sóc sau sinh', 36, 357, 1, '', '', '', '', 'khoa-dao-tao-nghe-cham-soc-sau-sinh/', '', ':', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741772113);
INSERT INTO `category` VALUES (42, 'khóa đào tạo nghề chăm sóc sau sinh', 'khóa đào tạo nghề chăm sóc sau sinh', 'khóa đào tạo nghề chăm sóc sau sinh', 36, 735, 1, '', '', '', '', 'khoa-dao-tao-nghe-cham-soc-sau-sinh/', '', ':', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741772115);
INSERT INTO `category` VALUES (43, 'Dịch vụ mẹ và bé', 'Dịch vụ mẹ và bé', 'Dịch vụ mẹ và bé', 0, 50, 1, '', 'lorime', '', '', 'dich-vu-me-va-be/', '', ':cathome:', 'service', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, 'lorime', '', 1741839789);
INSERT INTO `category` VALUES (44, 'Jacuzzz, Sauna&amp;Steam', 'Jacuzzz, Sauna&amp;Steam', 'Jacuzzz, Sauna&amp;Steam', 10, 736, 1, '/uploaded/gioi-thieu/jacuzzi.jpg', '', '', '', 'jacuzzz-saunaampsteam/', '', ':', 'service', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741856581);
INSERT INTO `category` VALUES (45, 'Báo chí nói gì về chúng tôi', 'Báo chí nói gì về chúng tôi', 'Báo chí nói gì về chúng tôi', 6, 737, 1, '', '', '', '', 'bao-chi-noi-gi-ve-chung-toi/', '', ':cathome:', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1741858467);
INSERT INTO `category` VALUES (46, 'Giới Thiệu CatHome', 'Green20S Viện chăm sóc sức khỏe số 1 Việt Nam', 'Giới Thiệu CatHome', 0, 738, 1, '/uploaded/tin-tuc/item6.png', 'Green Field l&agrave; Viện Chăm s&oacute;c Mẹ bầu, Mẹ sau sinh v&agrave; Trẻ sơ sinh h&agrave;ng đầu Việt Nam. Thương hiệu nhận được sự ủng hộ v&agrave; l&ograve;ng tin của h&agrave;ng ngh&igrave;n kh&aacute;ch h&agrave;ng bởi t&iacute;nh chuy&ecirc;n nghiệp - sự tận t&acirc;m - tinh thần tr&aacute;ch nhiệm.', '', '', 'gioi-thieu-cathome/', '', ':cathome:', 'info', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, 'Green Field l&agrave; Viện Chăm s&oacute;c Mẹ bầu, Mẹ sau sinh v&agrave; Trẻ sơ sinh h&agrave;ng đầu Việt Nam. Thương hiệu nhận được sự ủng hộ v&agrave; l&ograve;ng tin của h&agrave;ng ngh&igrave;n kh&aacute;ch h&agrave;ng bởi t&iacute;nh chuy&ecirc;n nghiệp - sự tận t&acirc;m - tinh thần tr&aacute;ch nhiệm.', '', 1741862249);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id_comment` bigint NOT NULL AUTO_INCREMENT,
  `comment` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdate` bigint NOT NULL,
  `active` tinyint NOT NULL DEFAULT 0,
  `thu_tu` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentid` bigint NULL DEFAULT NULL,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_item` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_like` bigint NULL DEFAULT 0,
  `star_rate` int NULL DEFAULT 3,
  `id_admin` bigint NULL DEFAULT NULL,
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
  `id_contact` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `xem` tinyint NULL DEFAULT 0,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdate` bigint NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id_contact`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES (1, 'Thông tin liên hệ: Minh Nguyễn - Test', '\n<table width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n     <tr>\n               <td height=\"30\" colspan=\"2\" align=\"left\" valign=\"middle\"><strong> Thông tin liên hệ:  </strong></td>\n    </tr>\n             <tr>\n               <td height=\"30\" align=\"left\" style=\"width:200px;\" valign=\"middle\">Họ tên:</td>\n               <td height=\"30\" align=\"left\" valign=\"middle\"><strong>Minh Nguyễn - Test</strong></td>\n      </tr>\n        <tr>\n          <td height=\"30\" align=\"left\" valign=\"middle\">E-mail:</td>\n          <td height=\"30\" align=\"left\" valign=\"middle\"><strong>minhns@company.vn</strong></td>\n      </tr>\n      \n    <tr>\n          <td height=\"30\" align=\"left\" valign=\"middle\">Điện thoại:</td>\n          <td height=\"30\" align=\"left\" valign=\"middle\"><strong>0968675568</strong></td>\n      </tr>\n        <tr>\n          <td height=\"30\" align=\"left\" valign=\"middle\"> Địa chỉ:</td>\n          <td height=\"30\" align=\"left\" valign=\"middle\"><strong>Test chức nang</strong></td>\n      </tr>\n      <tr>\n               <td height=\"30\" align=\"left\" valign=\"middle\"><strong>Nội dung liên hệ</strong>: </td>\n               <td height=\"30\" align=\"left\" valign=\"middle\"><i>abc - </i></td>\n      </tr>\n</table>', 1, 'minhns@company.vn', NULL, NULL, 1681469105, NULL);
INSERT INTO `contact` VALUES (2, 'Thông tin liên hệ: Đinh Đức Thuận', '\r\n<table width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\r\n     <tr>\r\n               <td height=\"30\" colspan=\"2\" align=\"left\" valign=\"middle\"><strong> Thông tin liên hệ:  </strong></td>\r\n    </tr>\r\n    \r\n             <tr>\r\n               <td height=\"30\" align=\"left\" style=\"width:200px;\" valign=\"middle\">Họ tên:</td>\r\n               <td height=\"30\" align=\"left\" valign=\"middle\"><strong>Đinh Đức Thuận</strong></td>\r\n      </tr>\r\n        <tr>\r\n          <td height=\"30\" align=\"left\" valign=\"middle\">E-mail:</td>\r\n          <td height=\"30\" align=\"left\" valign=\"middle\"><strong>dinhducthuan2002@gmail.com</strong></td>\r\n      </tr>\r\n      \r\n    <tr>\r\n          <td height=\"30\" align=\"left\" valign=\"middle\">Điện thoại:</td>\r\n          <td height=\"30\" align=\"left\" valign=\"middle\"><strong>0327292046</strong></td>\r\n      </tr>\r\n        <tr>\r\n          <td height=\"30\" align=\"left\" valign=\"middle\"> Địa chỉ:</td>\r\n          <td height=\"30\" align=\"left\" valign=\"middle\"><strong>Mai Dịch</strong></td>\r\n      </tr>\r\n      <tr>\r\n               <td height=\"30\" align=\"left\" valign=\"middle\"><strong>Nội dung liên hệ</strong>: </td>\r\n               <td height=\"30\" align=\"left\" valign=\"middle\"><i>Demo Chuc Nang  - </i></td>\r\n      </tr>\r\n</table>', 1, 'dinhducthuan2002@gmail.com', '0327292046', NULL, 1740629812, '{\"fullname\":\"\\u0110inh \\u0110\\u1ee9c Thu\\u1eadn\",\"email\":\"dinhducthuan2002@gmail.com\",\"phone\":\"0327292046\",\"address\":\"Mai D\\u1ecbch\",\"service\":\"consultation\",\"other_request\":\"Demo Chuc Nang \",\"createdate\":1740629812}');

-- ----------------------------
-- Table structure for contactinfo
-- ----------------------------
DROP TABLE IF EXISTS `contactinfo`;
CREATE TABLE `contactinfo`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint NULL DEFAULT 0,
  `id_catstatic` bigint NOT NULL DEFAULT 0,
  `id_user` bigint NOT NULL DEFAULT 0,
  `active` tinyint NOT NULL DEFAULT 0,
  `ngay_dang` bigint NOT NULL DEFAULT 0,
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
  `id_country` int NOT NULL AUTO_INCREMENT,
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
  `id_daily` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thu_tu` bigint NULL DEFAULT 0,
  `id_category` bigint NULL DEFAULT 0,
  `id_user` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 0,
  `ngay_dang` bigint NULL DEFAULT 0,
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
  `provinceid` int NULL DEFAULT NULL,
  `districtid` int NULL DEFAULT NULL,
  `phanphoi` int NULL DEFAULT 1,
  `baohanh` int NULL DEFAULT 0,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `url_old` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_new` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_user` bigint NULL DEFAULT NULL,
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
  `id_download` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thu_tu` bigint NULL DEFAULT 0,
  `id_user` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 0,
  `ngay_dang` bigint NULL DEFAULT 0,
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
  `id_duan` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint UNSIGNED NOT NULL DEFAULT 0,
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
  `ngay_dang` bigint UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT NULL,
  `id_user` bigint NULL DEFAULT 0,
  `fileurl` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hot` tinyint NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `provinceid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dientich` bigint NULL DEFAULT NULL,
  `header_tag` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `related_product` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `videourl` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint NULL DEFAULT NULL,
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
  `id_event` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `event_location` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `event_duration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `event_date` bigint NULL DEFAULT 0,
  `event_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ngay_dang` bigint UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 1,
  `id_user` bigint NULL DEFAULT 0,
  `file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hot` tinyint NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modify` bigint NULL DEFAULT NULL,
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
  `id_faq` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thu_tu` bigint NULL DEFAULT 0,
  `id_category` bigint NULL DEFAULT 0,
  `id_user` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 0,
  `ngay_dang` bigint NULL DEFAULT 0,
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
  `last_modify` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id_faq`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faq
-- ----------------------------
INSERT INTO `faq` VALUES (1, 'Create Your Healthier Lives.', 'Create Your Healthier Lives.', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 1, 25, 8, 1, 1739508660, '', 'create-your-healthier-lives.html', '', '', ':0:', '', '', '', '', '0,6', 1739508940);
INSERT INTO `faq` VALUES (2, 'Healthy and Delicious Foods.', 'Healthy and Delicious Foods.', NULL, 'Discover the benefits of nutritious meals.', 2, 25, 8, 1, 1739508780, '', 'healthy-and-delicious-foods.html', '', '', ':0:', '', '', '', '', '0', 1739508935);
INSERT INTO `faq` VALUES (3, 'A Natural Way of Improving Your Healthy Life.', 'A Natural Way of Improving Your Healthy Life.', NULL, 'Learn how to live a healthier lifestyle naturally.', 3, 25, 8, 1, 1739508780, '', 'a-natural-way-of-improving-your-healthy-life.html', '', '', ':0:', '', '', '', '', '0', 1739508925);
INSERT INTO `faq` VALUES (4, 'Health Revolution as a Health Coach.', 'Health Revolution as a Health Coach.', NULL, 'Understand the role of a health coach in your journey.', 4, 25, 8, 1, 1739508780, '', 'health-revolution-as-a-health-coach.html', '', '', ':0:', '', '', '', '', '0', 1739508920);
INSERT INTO `faq` VALUES (5, 'Tips on balancing life, self-care, and work.', 'Ready to Do Life, Self Care &amp; Business.', NULL, 'Tips on balancing life, self-care, and work.', 5, 25, 8, 1, 1739508840, '', 'ready-to-do-life-self-care-amp-business.html', '', '', ':', '', '', '', '', '0', 1739510327);
INSERT INTO `faq` VALUES (7, 'Health Revolution as a Health Coach.', 'Health Revolution as a Health Coach.', NULL, 'Understand the role of a health coach in your journey.', 4, 25, 8, 1, 1739508780, '', 'health-revolution-as-a-health-coach.html', '', '', ':0:', '', '', '', '', '0', 1739508920);

-- ----------------------------
-- Table structure for group_attr
-- ----------------------------
DROP TABLE IF EXISTS `group_attr`;
CREATE TABLE `group_attr`  (
  `id_group` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint NOT NULL DEFAULT 0,
  `active` tinyint NOT NULL DEFAULT 1,
  `setdefault` tinyint NOT NULL DEFAULT 0,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_group` bigint NOT NULL,
  `id_attr` bigint NOT NULL,
  `thu_tu` bigint NOT NULL,
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
  `id_info` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint NULL DEFAULT 0,
  `id_category` bigint NULL DEFAULT 0,
  `id_user` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 0,
  `ngay_dang` bigint NULL DEFAULT 0,
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
  `last_modify` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id_info`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES (1, 'Plans Loriem 3 ', '', 3, 5, 8, 1, 1739419860, '/uploaded/gioi-thieu/ico1.png', '', '', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dolore aut neque eaque sit!', 'nutrition-plans.html', '', '', ' Nutrition Plans', ':', '[]', '', 1739505374);
INSERT INTO `info` VALUES (2, ' Nutrition Plans', '', 2, 5, 8, 1, 1739419860, '/uploaded/ico/info-icon3.png', '', '', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dolore aut neque eaque sit!', 'nutrition-plans.html', '', '', ' Nutrition Plans', ':', '[]', '', 1739505206);
INSERT INTO `info` VALUES (3, ' Nutrition Plans', '', 1, 5, 8, 1, 1739419860, '/uploaded/ico/info-icon2.png', '', '', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dolore aut neque eaque sit!', 'nutrition-plansasdas.html', '', '', ' Nutrition Plans', ':', '[]', '', 1739505331);
INSERT INTO `info` VALUES (5, 'Healthy Trainings', '', 6, 5, 8, 1, 1739505360, '/uploaded/gioi-thieu/ico3.png', '', '', 'Demo loriem palse case saec this is your Descriprion bla&nbsp;&nbsp;Veritatis nisi iusto vitae sed, quae dolorum culpa vel quo officia esse necessitatibus distinctio quidem ipsa?', 'healthy-trainings.html', '', '', 'fa-solid fa-heart', ':', '[]', '', 1739505575);
INSERT INTO `info` VALUES (6, 'Recipes Idea', '', 5, 5, 8, 1, 1739505360, '/uploaded/gioi-thieu/ico3.png', '', '', 'Demo loriem palse case saec this is your Descriprion bla&nbsp;&nbsp;Veritatis nisi iusto vitae sed, quae dolorum culpa vel quo officia esse necessitatibus distinctio quidem ipsa?', 'healthy-trainings.html', '', '', 'fa-solid fa-heart', ':', '[]', '', 1739505585);
INSERT INTO `info` VALUES (7, 'Description plastsce', '', 4, 5, 8, 1, 1739505360, '/uploaded/gioi-thieu/ico3.png', '', '', 'Demo loriem palse case saec this is your Descriprion bla&nbsp;&nbsp;Veritatis nisi iusto vitae sed, quae dolorum culpa vel quo officia esse necessitatibus distinctio quidem ipsa?', 'healthy-trainings.html', '', '', 'fa-solid fa-heart', ':', '[]', '', 1739505600);

-- ----------------------------
-- Table structure for info_donvi
-- ----------------------------
DROP TABLE IF EXISTS `info_donvi`;
CREATE TABLE `info_donvi`  (
  `id_info` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint NULL DEFAULT 0,
  `id_category` bigint NULL DEFAULT 0,
  `id_user` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 0,
  `ngay_dang` bigint NULL DEFAULT 0,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint NULL DEFAULT NULL,
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
  `id_info` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint NULL DEFAULT 0,
  `id_category` bigint NULL DEFAULT 0,
  `id_user` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 0,
  `ngay_dang` bigint NULL DEFAULT 0,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int NULL DEFAULT 0,
  `position` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `branch` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dob` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modify` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id_info`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of info_leader
-- ----------------------------
INSERT INTO `info_leader` VALUES (1, 'Lorem ipsum dolor sit amet', '', 1, 23, 8, 1, 1739500440, '/uploaded/lanh-dao/item1.jpeg', 'Lorem ipsum dolor sit am', 'lorem-ipsum-dolor-sit-amet-consectetu.html', '', '', 'Lorem ipsum dolor sit amet, consectetu', ':', 0, '', '', '', NULL);
INSERT INTO `info_leader` VALUES (2, 'David ', '', 2, 23, 8, 1, 1739506260, '/uploaded/y-kien-khach-hang/man.jpg', 'Specialist', 'david.html', '', '', 'David ', ':', 0, '', '', '', NULL);
INSERT INTO `info_leader` VALUES (3, 'JhonWeeh', '', 3, 23, 8, 1, 1739506320, '/uploaded/y-kien-khach-hang/man.png', 'Speacialist', 'jhonweeh.html', '', '', 'JhonWeeh', ':', 0, '', '', '', NULL);
INSERT INTO `info_leader` VALUES (4, 'May Cozdy', '', 4, 23, 8, 1, 1739506320, '/uploaded/lanh-dao/item2.jpg', 'Lead', 'may-cozdy.html', '', '', 'May Cozdy', ':', 0, '', '', '', NULL);

-- ----------------------------
-- Table structure for info_lichsu
-- ----------------------------
DROP TABLE IF EXISTS `info_lichsu`;
CREATE TABLE `info_lichsu`  (
  `id_info` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint NULL DEFAULT 0,
  `id_category` bigint NULL DEFAULT 0,
  `id_user` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 0,
  `ngay_dang` bigint NULL DEFAULT 0,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modify` bigint NULL DEFAULT NULL,
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
  `id` int NOT NULL DEFAULT 1,
  `lang` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lang
-- ----------------------------
INSERT INTO `lang` VALUES (1, '{\"_othernews\":{\"default\":\"C\\u00e1c tin kh\\u00e1c\",\"en\":\"Other articles\",\"cn\":\"a\",\"kr\":\"b\"},\"_home\":{\"default\":\"Trang ch\\u1ee7\",\"en\":\"Home\",\"cn\":\"\",\"kr\":\"\"},\"_detail\":{\"default\":\"Chi ti\\u1ebft\",\"en\":\"Detail\",\"cn\":\"\",\"kr\":\"\"},\"_page\":{\"default\":\"Trang\",\"en\":\"Pages\",\"cn\":\"\",\"kr\":\"\"},\"_fullname\":{\"default\":\"H\\u1ecd t\\u00ean\",\"en\":\"Full name\",\"cn\":\"\",\"kr\":\"\"},\"_email\":{\"default\":\"Email\",\"en\":\"E-Mail\",\"cn\":\"\",\"kr\":\"\"},\"_phone\":{\"default\":\"\\u0110i\\u1ec7n tho\\u1ea1i\",\"en\":\"Telephone\",\"cn\":\"\",\"kr\":\"\"},\"_address\":{\"default\":\"\\u0110\\u1ecba ch\\u1ec9\",\"en\":\"Address\",\"cn\":\"\",\"kr\":\"\"},\"_content\":{\"default\":\"N\\u1ed9i dung\",\"en\":\"Message\",\"cn\":\"\",\"kr\":\"\"},\"_send\":{\"default\":\"G\\u1eedi li\\u00ean h\\u1ec7\",\"en\":\"Send\",\"cn\":\"\",\"kr\":\"\"},\"_continue\":{\"default\":\"Ti\\u1ebfp t\\u1ee5c\",\"en\":\"Continue\",\"cn\":\"\",\"kr\":\"\"},\"_reset\":{\"default\":\"Nh\\u1eadp l\\u1ea1i\",\"en\":\"Reset\",\"cn\":\"\",\"kr\":\"\"},\"_searchsite\":{\"default\":\"T\\u00ecm ki\\u1ebfm\",\"en\":\"Search\",\"cn\":\"\",\"kr\":\"\"},\"_keywords\":{\"default\":\"T\\u00ecm ki\\u1ebfm \",\"en\":\"keywords\",\"cn\":\"\",\"kr\":\"\"},\"_viewall\":{\"default\":\"Xem t\\u1ea5t c\\u1ea3\",\"en\":\"View all\",\"cn\":\"\",\"kr\":\"\"},\"_search_enter_keyword\":{\"default\":\"Nh\\u1eadp n\\u1ed9i dung c\\u1ea7n t\\u00ecm, s\\u1ea3n ph\\u1ea9m, b\\u00e0i vi\\u1ebft...\",\"en\":\"Enter your keyword...\",\"cn\":\"\",\"kr\":\"\"},\"_viewmore\":{\"default\":\"Xem chi ti\\u1ebft\",\"en\":\"View more\",\"cn\":\"\",\"kr\":\"\"},\"_search_result\":{\"default\":\"K\\u1ebft qu\\u1ea3 t\\u00ecm ki\\u1ebfm\",\"en\":\"Search Result\",\"cn\":\"\",\"kr\":\"\"},\"_online_support\":{\"default\":\"H\\u1ed7 tr\\u1ee3 tr\\u1ef1c tuy\\u1ebfn\",\"en\":\"Online Support\",\"cn\":\"\",\"kr\":\"\"},\"_product_detail\":{\"default\":\"Chi ti\\u1ebft s\\u1ea3n ph\\u1ea9m\",\"en\":\"Product infomation\",\"cn\":\"\",\"kr\":\"\"},\"_comment_alert\":{\"default\":\"Nh\\u1eefng tr\\u01b0\\u1eddng c\\u00f3 d\\u1ea5u * l\\u00e0 tr\\u01b0\\u1eddng b\\u1eaft bu\\u1ed9c ph\\u1ea3i nh\\u1eadp th\\u00f4ng tin\",\"en\":\"You must enter all information in the (*) field\",\"cn\":\"\",\"kr\":\"\"},\"_your_email\":{\"default\":\"Nh\\u1eadp email c\\u1ee7a b\\u1ea1n\",\"en\":\"Your email\",\"cn\":\"\",\"kr\":\"\"},\"_captcha_code\":{\"default\":\"M\\u00e3 b\\u1ea3o m\\u1eadt\",\"en\":\"Captcha Code\",\"cn\":\"\",\"kr\":\"\"},\"_comment_send_msg\":{\"default\":\"B\\u00ecnh lu\\u1eadn c\\u1ee7a b\\u1ea1n \\u0111\\u00e3 g\\u1eedi th\\u00e0nh c\\u00f4ng\",\"en\":\"Your comment sent successfully\",\"cn\":\"\",\"kr\":\"\"},\"_captcha_invalid\":{\"default\":\"M\\u00e3 captcha kh\\u00f4ng \\u0111\\u00fang\",\"en\":\"Wrong captcha code\",\"cn\":\"\",\"kr\":\"\"},\"_customer_support\":{\"default\":\"H\\u1ed7 tr\\u1ee3 kh\\u00e1ch h\\u00e0ng\",\"en\":\"Customer support\",\"cn\":\"\",\"kr\":\"\"},\"_title\":{\"default\":\"Ti\\u00eau \\u0111\\u1ec1\",\"en\":\"Title\",\"cn\":\"\",\"kr\":\"\"},\"_view_more_about_home\":{\"default\":\"Xem ti\\u1ebfp\",\"en\":\"View more\",\"cn\":\"\",\"kr\":\"\"},\"_otherservice\":{\"default\":\"D\\u1ecbch v\\u1ee5 kh\\u00e1c\",\"en\":\"Other services\",\"cn\":\"\",\"kr\":\"\"},\"_tieudetecongty\":{\"default\":\"T\\u00ean c\\u00f4ng ty t\\u1ea1i \\u0111\\u00e2y\",\"en\":\"T\\u00ean c\\u00f4ng ty t\\u1ea1i \\u0111\\u00e2y\",\"cn\":\"\",\"kr\":\"\"},\"_hotrokhachhang\":{\"default\":\"H\\u1ed7 tr\\u1ee3 kh\\u00e1ch h\\u00e0ng\",\"en\":\"Customer care\",\"cn\":\"\",\"kr\":\"\"},\"_ngay\":{\"default\":\"Ng\\u00e0y\",\"en\":\"Date\",\"cn\":\"\",\"kr\":\"\"},\"_tentailieu\":{\"default\":\"T\\u00ean t\\u00e0i li\\u1ec7u\",\"en\":\"Document name\",\"cn\":\"\",\"kr\":\"\"},\"_taitailieu\":{\"default\":\"T\\u1ea3i t\\u00e0i li\\u1ec7u\",\"en\":\"Download document\",\"cn\":\"\",\"kr\":\"\"},\"_contactinfo\":{\"default\":\"\\u0110\\u1eb7t h\\u00e0ng\",\"en\":\"Contact info\",\"cn\":\"\",\"kr\":\"\"},\"_apply_your_cv\":{\"default\":\"\\u0110\\u0103ng k\\u00fd\",\"en\":\"Apply\",\"cn\":\"\",\"kr\":\"\"},\"_product_categories\":{\"default\":\"S\\u1ea3n ph\\u1ea9m c\\u00f9ng lo\\u1ea1i\",\"en\":\"Orther products\",\"cn\":\"\",\"kr\":\"\"},\"_giakm\":{\"default\":\"Gi\\u00e1 KM:\",\"en\":\"Seles off:\",\"cn\":\"\",\"kr\":\"\"},\"_giasp\":{\"default\":\"Gi\\u00e1:\",\"en\":\"Price:\",\"cn\":\"\",\"kr\":\"\"},\"_btnorder\":{\"default\":\"\\u0110\\u1eb7t h\\u00e0ng\",\"en\":\"Add to cart\",\"cn\":\"\",\"kr\":\"\"},\"_huongdanmuahang\":{\"default\":\"H\\u01b0\\u1edbng d\\u1eabn mua h\\u00e0ng\",\"en\":\"Shopping guide\",\"cn\":\"\",\"kr\":\"\"},\"_thanhtien\":{\"default\":\"Th\\u00e0nh ti\\u1ec1n\",\"en\":\"Total\",\"cn\":\"\",\"kr\":\"\"},\"_tongthanhtoan\":{\"default\":\"T\\u1ed5ng thanh to\\u00e1n\",\"en\":\"Total\",\"cn\":\"\",\"kr\":\"\"},\"_update_cart\":{\"default\":\"C\\u1eadp nh\\u1eadt s\\u1ed1 l\\u01b0\\u1ee3ng\",\"en\":\"Update\",\"cn\":\"\",\"kr\":\"\"},\"_order\":{\"default\":\"\\u0110\\u1eb7t h\\u00e0ng\",\"en\":\"Order\",\"cn\":\"\",\"kr\":\"\"},\"_send_order\":{\"default\":\"G\\u1eedi \\u0111\\u01a1n h\\u00e0ng\",\"en\":\"Send\",\"cn\":\"\",\"kr\":\"\"},\"_your_order_has_been_sent\":{\"default\":\"\\u0110\\u01a1n h\\u00e0ng \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c g\\u1eedi th\\u00e0nh c\\u00f4ng\",\"en\":\"Order success\",\"cn\":\"\",\"kr\":\"\"},\"_shoping_cart\":{\"default\":\"Gi\\u1ecf h\\u00e0ng\",\"en\":\"Cart\",\"cn\":\"\",\"kr\":\"\"},\"_codepr\":{\"default\":\"MSP\",\"en\":\"Code\",\"cn\":\"\",\"kr\":\"\"},\"_newsletter\":{\"default\":\"Nh\\u1eadn tin m\\u1edbi\",\"en\":\"News Letter\",\"cn\":\"\",\"kr\":\"\"},\"_enter_email\":{\"default\":\"Nh\\u1eadp E-mail\",\"en\":\"Enter E-mail\",\"cn\":\"\",\"kr\":\"\"},\"_addresscontact\":{\"default\":\"\\u0110\\u1ecba ch\\u1ec9\",\"en\":\"Address\",\"cn\":\"\",\"kr\":\"\"},\"_contact\":{\"default\":\"Li\\u00ean h\\u1ec7\",\"en\":\"Contact\",\"cn\":\"\",\"kr\":\"\"},\"_soluong\":{\"default\":\"S\\u1ed1 l\\u01b0\\u1ee3ng\",\"en\":\"Quantity\",\"cn\":\"\",\"kr\":\"\"},\"_huong_dan_su_dung\":{\"default\":\"H\\u01b0\\u1edbng d\\u1eabn s\\u1eed d\\u1ee5ng\",\"en\":\"User Guide\",\"cn\":\"\",\"kr\":\"\"},\"_relate_product\":{\"default\":\"S\\u1ea3n ph\\u1ea9m li\\u00ean quan\",\"en\":\"Relate Products\",\"cn\":\"\",\"kr\":\"\"},\"_hotline\":{\"default\":\"\\u0110\\u01b0\\u1eddng d\\u00e2y n\\u00f3ng\",\"en\":\"Hotline\",\"cn\":\"\",\"kr\":\"\"},\"_download_profile\":{\"default\":\"Download Profile\",\"en\":\"Download Profile\",\"cn\":\"\",\"kr\":\"\"},\"_regiter_successful\":{\"default\":\"\\u0110\\u0103ng k\\u00fd th\\u00e0nh c\\u00f4ng\",\"en\":\"\\u0110\\u0103ng k\\u00fd th\\u00e0nh c\\u00f4ng\",\"cn\":\"\",\"kr\":\"\"},\"_linh_vuc_hoat_dong\":{\"default\":\"L\\u0129nh v\\u1ef1c ho\\u1ea1t \\u0111\\u1ed9ng\",\"en\":\"Business\",\"cn\":\"\",\"kr\":\"\"},\"_othervideo\":{\"default\":\"C\\u00e1c video kh\\u00e1c\",\"en\":\"Other videos\",\"cn\":\"\",\"kr\":\"\"},\"_other_album\":{\"default\":\"C\\u00e1c album kh\\u00e1c\",\"en\":\"Other albums\",\"cn\":\"\",\"kr\":\"\"},\"_news\":{\"default\":\"Tin t\\u1ee9c\",\"en\":\"Hot news\",\"cn\":\"\",\"kr\":\"\"},\"_view_less\":{\"default\":\"\\u1ea8n b\\u1edbt\",\"en\":\"Hide\",\"cn\":\"\",\"kr\":\"\"},\"_frm_contact_title\":{\"default\":\"Form li\\u00ean h\\u1ec7\",\"en\":\"Conact Form\",\"cn\":\"\",\"kr\":\"\"},\"_ban_can_nhap_thong_tin\":{\"default\":\"B\\u1ea1n c\\u1ea7n nh\\u1eadp \\u0111\\u1ee7 th\\u00f4ng tin v\\u00e0o nh\\u1eefng tr\\u01b0\\u1eddng m\\u00e0u \\u0111\\u1ecf\",\"en\":\"B\\u1ea1n c\\u1ea7n nh\\u1eadp \\u0111\\u1ee7 th\\u00f4ng tin v\\u00e0o nh\\u1eefng tr\\u01b0\\u1eddng m\\u00e0u \\u0111\\u1ecf\",\"cn\":\"B\\u1ea1n c\\u1ea7n nh\\u1eadp \\u0111\\u1ee7 th\\u00f4ng tin v\\u00e0o nh\\u1eefng tr\\u01b0\\u1eddng m\\u00e0u \\u0111\\u1ecf\",\"kr\":\"B\\u1ea1n c\\u1ea7n nh\\u1eadp \\u0111\\u1ee7 th\\u00f4ng tin v\\u00e0o nh\\u1eefng tr\\u01b0\\u1eddng m\\u00e0u \\u0111\\u1ecf\"},\"_thong_tin_lien_he\":{\"default\":\"Th\\u00f4ng tin li\\u00ean h\\u1ec7 \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c g\\u1eedi th\\u00e0nh c\\u00f4ng !\",\"en\":\"Th\\u00f4ng tin li\\u00ean h\\u1ec7 \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c g\\u1eedi th\\u00e0nh c\\u00f4ng !\",\"cn\":\"Th\\u00f4ng tin li\\u00ean h\\u1ec7 \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c g\\u1eedi th\\u00e0nh c\\u00f4ng !\",\"kr\":\"Th\\u00f4ng tin li\\u00ean h\\u1ec7 \\u0111\\u00e3 \\u0111\\u01b0\\u1ee3c g\\u1eedi th\\u00e0nh c\\u00f4ng !\"},\"_ghi_chu\":{\"default\":\"Ghi ch\\u00fa\",\"en\":\"Ghi ch\\u00fa\",\"cn\":\"Ghi ch\\u00fa\",\"kr\":\"Ghi ch\\u00fa\"},\"_xem_chi_tiet\":{\"default\":\"Xem chi ti\\u1ebft \",\"en\":\"Xem chi ti\\u1ebft \",\"cn\":\"Xem chi ti\\u1ebft \",\"kr\":\"Xem chi ti\\u1ebft \"},\"_vui_long_dien_thong_tin\":{\"default\":\"Vui l\\u00f2ng \\u0111i\\u1ec1n v\\u00e0o th\\u00f4ng tin sau\",\"en\":\"Please enter field below\",\"cn\":\"Please enter field below\",\"kr\":\"Please enter field below\"},\"_we_will_contact_you_soon\":{\"default\":\"Nh\\u00e2n vi\\u00ean c\\u1ee7a ch\\u00fang t\\u00f4i s\\u1ebd li\\u00ean h\\u1ec7 v\\u1edbi b\\u1ea1n\",\"en\":\"We will contact you soon\",\"cn\":\"We will contact you soon\",\"kr\":\"We will contact you soon\"},\"_trong_thoi_gian_som\":{\"default\":\"trong th\\u1eddi gian s\\u1edbm nh\\u1ea5t\",\"en\":\"Thank you\",\"cn\":\"Thank you\",\"kr\":\"Thank you\"},\"_chon_dich_vu\":{\"default\":\"Ch\\u1ecdn d\\u1ecbch v\\u1ee5\",\"en\":\"Services\",\"cn\":\"Services\",\"kr\":\"Services\"},\"_our_partner\":{\"default\":\"Th\\u01b0\\u01a1ng hi\\u1ec7u \\u0111\\u1ed1i t\\u00e1c\",\"en\":\"Our partner\",\"cn\":\"Our partner\",\"kr\":\"Our partner\"},\"_check_field\":{\"default\":\"Vui l\\u00f2ng ki\\u1ec3m tra d\\u1eef li\\u1ec7u nh\\u1eadp v\\u00e0o\",\"en\":\"Please check input field\",\"cn\":\"Please check input field\",\"kr\":\"Please check input field\"},\"_form_title\":{\"default\":\"\\u0110\\u0102NG K\\u00dd T\\u01af V\\u1ea4N\",\"en\":\"Form name\",\"cn\":\"Form name\",\"kr\":\"Form name\"},\"_form_request\":{\"default\":\"N\\u1ed9i dung\",\"en\":\"Request\",\"cn\":\"Request\",\"kr\":\"Request\"},\"_newsletter_text\":{\"default\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus vero unde omnis obcaecati magni\",\"en\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus vero unde omnis obcaecati magni\",\"cn\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus vero unde omnis obcaecati magni\",\"kr\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatibus vero unde omnis obcaecati magni\"}}');

-- ----------------------------
-- Table structure for logo
-- ----------------------------
DROP TABLE IF EXISTS `logo`;
CREATE TABLE `logo`  (
  `id_logo` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `ngay_dang` bigint UNSIGNED NOT NULL DEFAULT 0,
  `thu_tu` bigint NOT NULL DEFAULT 0,
  `active` tinyint NOT NULL DEFAULT 1,
  `small_image` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `normal_image` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hit` bigint NOT NULL DEFAULT 0,
  `ajaxload` int NOT NULL DEFAULT 0,
  `id_user` bigint NULL DEFAULT NULL,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_logo`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logo
-- ----------------------------
INSERT INTO `logo` VALUES (1, 2, 'LogoSite', '/uploaded/logo/logo.png', '', 1610585460, 1, 0, '', '', '', '', 0, 0, 8, ':');
INSERT INTO `logo` VALUES (2, 3, 'Lorem ipsum dolor sit amet', '/uploaded/slideshow/item1.jpg', '', 1610585460, 2, 0, '', '', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales.', 0, 0, 8, ':');
INSERT INTO `logo` VALUES (3, 4, 'SlideMobile01', '/uploaded/slideshow/item1.jpg', '', 1610585460, 3, 0, '', '', '', '', 0, 0, 8, ':');
INSERT INTO `logo` VALUES (4, 0, 'slide2', '/uploaded/slideshow/item4.jpg', '', 1739334060, 4, 0, '', '', '', '', 0, 0, 8, ':3:');
INSERT INTO `logo` VALUES (5, 0, 'slide3', '/uploaded/pic-cat/www_green20s_com.jpg', '', 1739334120, 5, 1, '', '', '', '', 0, 0, 8, ':3:');
INSERT INTO `logo` VALUES (6, 2, 'Logo', '/uploaded/logo/logo-duongsinh.jpg', '', 1741703640, 6, 1, '', '', '', '', 0, 0, 8, ':2:');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id_member` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastvisit` bigint NOT NULL DEFAULT 0,
  `active` tinyint NOT NULL DEFAULT 0,
  `super` tinyint NOT NULL DEFAULT 0,
  `registtime` bigint NOT NULL DEFAULT 0,
  `canhbao` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `yahoo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chucvu` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip` tinyint NOT NULL DEFAULT 0,
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
  `id_module` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gia_tri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint NOT NULL DEFAULT 0,
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
  `id_news` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imageadv` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 1,
  `id_user` bigint NULL DEFAULT 0,
  `file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hit` int NULL DEFAULT NULL,
  `hot` tinyint NULL DEFAULT 0,
  `inhome` tinyint NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `header_tag` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `form_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkto` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_tacgia` int NULL DEFAULT NULL,
  `last_modify` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id_news`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (16, 24, 'or sit amet, consectetur adipiscing elit', 'or sit amet, consectetur adipiscing elit', '', '', '/uploaded/slideshow/item4.jpg', '0', 'or sit amet, consectetur adipiscing elit', 'readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum&nbsp;', 1739508060, 1, 1, 8, 'null', NULL, 0, 0, ':6:', '', '', 'or-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1739769626);
INSERT INTO `news` VALUES (4, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 4, 1, 8, 'null', NULL, 0, 0, ':24:', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1741850391);
INSERT INTO `news` VALUES (5, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 5, 1, 8, 'null', NULL, 0, 0, ':24:', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1741850426);
INSERT INTO `news` VALUES (6, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 6, 1, 8, 'null', NULL, 0, 0, '6', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1739506818);
INSERT INTO `news` VALUES (7, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/item4.png', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 7, 1, 8, 'null', NULL, 0, 0, ':24:', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1739506821);
INSERT INTO `news` VALUES (8, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/winter_28.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 8, 1, 8, 'null', NULL, 0, 0, ':24:', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1741850419);
INSERT INTO `news` VALUES (9, 36, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/item5.png', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 9, 1, 8, 'null', NULL, 0, 0, ':37:', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1741774445);
INSERT INTO `news` VALUES (10, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit 001', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/item7.png', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 10, 1, 8, 'null', NULL, 0, 0, ':36:', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-001.html', '0', 'googlenew--link', 55, 1741774422);
INSERT INTO `news` VALUES (12, 14, 'Healthy meals tips', 'Healthy meals tips', '', '', '/uploaded/san-pham/12_grande.jpg', '0', '', '', 1739413980, 11, 1, 8, 'null', NULL, 0, 0, ':14:', '', '', 'healthy-meals-tips.html', '0', '', 0, 1739414065);
INSERT INTO `news` VALUES (13, 14, 'Recipes Idea', 'Recipes Idea', '', '', '/uploaded/san-pham/Screenshot_2.png', '0', '', '', 1739414040, 12, 1, 8, 'null', NULL, 0, 0, ':0:', '', '', 'recipes-idea.html', '0', '', 0, 1739414100);
INSERT INTO `news` VALUES (14, 14, 'HealThy excersire', 'HealThy excersire', '', '', '/uploaded/tin-tuc/item1.png', '0', '', '', 1739414100, 13, 1, 8, 'null', NULL, 0, 0, ':', '', '', 'healthy-excersire.html', '0', '', 0, 1739414155);
INSERT INTO `news` VALUES (15, 6, 'ENERGETIC PANT', 'ENERGETIC PANT', '', '', '/uploaded/tin-tuc/item1.png', '0', 'ENERGETIC PANT', '', 1739440500, 14, 1, 8, 'null', NULL, 1, 0, ':', '', '', 'demo.html', '0', '', 0, 1739505715);
INSERT INTO `news` VALUES (17, 11, 'Kiểm Tra &amp; Đánh Giá Sức Khoẻ ', 'Kiểm Tra &amp; Đánh Giá Sức Khoẻ ', '', '', '', '0', '', '', 1741707540, 15, 1, 8, 'null', NULL, 0, 0, ':0:', '', '', 'kiem-tra-amp-danh-gia-suc-khoe.html', '0', '', 0, 1741707846);
INSERT INTO `news` VALUES (18, 37, 'Đây là demo title klhoa hoc chốt sale', 'Đây là demo title klhoa hoc chốt sale', '', '', '/uploaded/tin-tuc/item3.png', '0', 'Đ&acirc;y l&agrave; demo title klhoa hoc chốt saleĐ&acirc;y l&agrave; demo title klhoa hoc chốt saleĐ&acirc;y l&agrave; demo title klhoa hoc chốt saleĐ&acirc;y l&agrave; demo title klhoa hoc chốt saleĐ&acirc;y l&agrave; demo title klhoa hoc chốt saleĐ&acirc;y l&agrave; demo title klhoa hoc chốt sale', 'Đ&acirc;y l&agrave; demo title klhoa hoc chốt saleĐ&acirc;y l&agrave; demo title klhoa hoc chốt saleĐ&acirc;y l&agrave; demo title klhoa hoc chốt sale', 1741773960, 16, 1, 8, 'null', NULL, 0, 0, ':', '', '', 'sdasdsd.html', '0', '', 0, 1741774904);
INSERT INTO `news` VALUES (20, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 6, 1, 8, 'null', NULL, 0, 0, ':24:', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1741850412);
INSERT INTO `news` VALUES (21, 45, 'Ngoisao nói về chúng tôi', 'Ngoisao nói về chúng tôi', '', '', '/uploaded/gioi-thieu/rau-xanh-1351.jpg', '0', 'Lamchame k&ecirc;nh cung cấp th&ocirc;ng tin kiến thức uy t&iacute;n d&agrave;nh cho c&aacute;c bậc cha mẹ học hỏi, kiến thức, kinh nghiệm chăm s&oacute;c, nu&ocirc;i dạy con c&aacute;i khoa học v&agrave;&nbsp;...', '', 1741858140, 17, 1, 8, 'null', NULL, 0, 0, ':', '', '', 'ngoisao-noi-ve-chung-toi.html', '0', '', 0, 1741858278);
INSERT INTO `news` VALUES (22, 45, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/logo-chan-trang-24h.png', '0', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 1741858860, 18, 1, 8, 'null', NULL, 0, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1741859044);
INSERT INTO `news` VALUES (23, 45, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/logo-chan-trang-24h.png', '0', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 1741858860, 18, 1, 8, 'null', NULL, 0, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1741859046);
INSERT INTO `news` VALUES (24, 45, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/logo-chan-trang-24h.png', '0', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 1741858860, 18, 1, 8, 'null', NULL, 0, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1741859047);
INSERT INTO `news` VALUES (25, 45, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/logo-chan-trang-24h.png', '0', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 1741858860, 18, 1, 8, 'null', NULL, 0, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1741859048);
INSERT INTO `news` VALUES (26, 45, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/logo-chan-trang-24h.png', '0', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 1741858860, 18, 1, 8, 'null', NULL, 0, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1741859048);
INSERT INTO `news` VALUES (27, 45, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/logo-chan-trang-24h.png', '0', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 1741858860, 18, 1, 8, 'null', NULL, 0, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1741859049);

-- ----------------------------
-- Table structure for newsletter
-- ----------------------------
DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE `newsletter`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint NOT NULL DEFAULT 0,
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
  `id_order` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `session` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createdate` bigint UNSIGNED NULL DEFAULT 0,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `addinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `xem` tinyint NULL DEFAULT 0,
  `code` bigint NULL DEFAULT 0,
  `status` tinyint NULL DEFAULT 0,
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
  `pay_status` int NULL DEFAULT 0,
  `last_update` bigint NULL DEFAULT NULL,
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
  `id_partner` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 1,
  `id_user` bigint NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `header_tag` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modify` bigint NULL DEFAULT NULL,
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
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `createdate` bigint UNSIGNED NULL DEFAULT 0,
  `transStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `merchantID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `merchTxnRef` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `orderInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` bigint NULL DEFAULT NULL,
  `txnResponseCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `txnResponseText` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `transactionNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `status` tinyint NULL DEFAULT 0,
  `last_update` bigint NULL DEFAULT NULL,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `min_value` bigint NULL DEFAULT 0,
  `max_value` bigint NULL DEFAULT 0,
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `thu_tu` int NULL DEFAULT 0,
  `lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `active` int NULL DEFAULT NULL,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `id_product` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `km` double NULL DEFAULT 0,
  `pricekm` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `giaphukien` bigint NULL DEFAULT 0,
  `don_vi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ngay_dang` bigint UNSIGNED NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 1,
  `id_user` tinyint UNSIGNED NULL DEFAULT 0,
  `thu_tu` int NULL DEFAULT 0,
  `hit` bigint NULL DEFAULT 0,
  `status` tinyint NULL DEFAULT 1,
  `ma` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupcat` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fileurl` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `moi` int NULL DEFAULT 0,
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
  `id_manufacture` bigint NULL DEFAULT NULL,
  `image_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint NULL DEFAULT NULL,
  `id_material` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 13, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '/uploaded/san-pham/img-2.jpg', '450000', 0, '600000', 0, NULL, '', '', 1739337300, 1, 8, 1, 0, 1, 'NSX31', ':13:', '', 0, 'onsectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[]', 1739337356, 0);
INSERT INTO `product` VALUES (2, 13, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '/uploaded/san-pham/12_grande.jpg', '20000', 0, '10000', 0, NULL, '', '', 1739337660, 1, 8, 2, 0, 1, 'NSX31', ':', '', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[]', 1739505928, 0);
INSERT INTO `product` VALUES (3, 13, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '/uploaded/du-an/du-an12.png', '450000', 0, '600000', 0, NULL, '', '', 1739337660, 1, 8, 5, 0, 1, 'NSX31', ':', '', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[]', 1739505859, 0);
INSERT INTO `product` VALUES (4, 13, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '/uploaded/san-pham/12_grande.jpg', '800000', 0, '500000', 0, NULL, '', '', 1739337660, 1, 8, 6, 0, 1, 'NSX31', ':', '', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[]', 1739505808, 0);
INSERT INTO `product` VALUES (5, 13, 'Where can I get some thing about that not here with you?', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '4500000', 0, '4000000', 0, NULL, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected', '', 1739444640, 1, 8, 3, 0, 1, 'NSX31', ':', '', 0, 'Where can I get some', '', '', '', '', '', '', NULL, '', 'where-can-i-get-some.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[]', 1739505897, 0);
INSERT INTO `product` VALUES (6, 13, 'Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from', '/uploaded/tin-tuc/item1.png', '4500000', 0, '4000000', 0, NULL, 'he Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, ma', 'he Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, ma', 1739445480, 1, 8, 4, 0, 1, 'NSX31', ':', '', 0, 'Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from', '', '', '', '', '', '', NULL, '', 'sydney-college-in-virginia-looked-up-one-of-the-more-obscure-latin-words-consectetur-from.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[]', 1739445578, 0);
INSERT INTO `product` VALUES (7, 26, 'onsectetur adipiscing elit', '/uploaded/san-pham/img-2.jpg', '450000', 0, '600000', 0, NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 1739765760, 1, 8, 7, 0, 1, 'NSX31', ':', '', 0, 'onsectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'onsectetur-adipiscing-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', '', NULL, '', 0, '[]', 1739765837, 0);
INSERT INTO `product` VALUES (8, 26, 'onsectetur adipiscing elit', '/uploaded/san-pham/img-2.jpg', '450000', 0, '600000', 0, NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 1739765760, 1, 8, 8, 0, 1, 'NSX31', ':', '', 0, 'onsectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'onsectetur-adipiscing-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', '', NULL, '', 0, '[]', 1739765839, 0);
INSERT INTO `product` VALUES (9, 26, 'onsectetur adipiscing elit', '/uploaded/san-pham/img-2.jpg', '450000', 0, '600000', 0, NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 1739765760, 1, 8, 9, 0, 1, 'NSX31', ':', '', 0, 'onsectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'onsectetur-adipiscing-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', '', NULL, '', 0, '[]', 1739765840, 0);
INSERT INTO `product` VALUES (10, 26, 'onsectetur adipiscing elit', '/uploaded/san-pham/img-2.jpg', '450000', 0, '600000', 0, NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 1739765760, 1, 8, 10, 0, 1, 'NSX31', ':', '', 0, 'onsectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'onsectetur-adipiscing-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', '', NULL, '', 0, '[]', 1739765841, 0);
INSERT INTO `product` VALUES (11, 26, 'onsectetur adipiscing elit', '/uploaded/san-pham/img-2.jpg', '450000', 0, '600000', 0, NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 1739765760, 1, 8, 26, 0, 1, 'NSX31', ':', '', 0, 'onsectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'onsectetur-adipiscing-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', '', NULL, '', 0, '[]', 1739765843, 0);
INSERT INTO `product` VALUES (12, 26, 'onsectetur adipiscing elit', '/uploaded/san-pham/img-2.jpg', '60', 0, '50', 0, NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 1739765760, 1, 8, 42, 0, 1, 'NSX31', ':', '', 0, 'onsectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'onsectetur-adipiscing-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', '', NULL, '', 0, '[]', 1739768029, 0);
INSERT INTO `product` VALUES (13, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 33, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-popular-belie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[]', 1739766065, 0);
INSERT INTO `product` VALUES (14, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 23, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-popular-belie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[]', 1739766067, 0);
INSERT INTO `product` VALUES (15, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 21, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-popular-belie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[]', 1739766068, 0);
INSERT INTO `product` VALUES (16, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 19, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-popular-belie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[]', 1739766069, 0);
INSERT INTO `product` VALUES (17, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 15, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-popular-belie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[]', 1739766069, 0);
INSERT INTO `product` VALUES (18, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 11, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-popular-belie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[]', 1739766070, 0);
INSERT INTO `product` VALUES (19, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 12, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-popular-belie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[]', 1739766070, 0);
INSERT INTO `product` VALUES (20, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 13, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-popular-belie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[]', 1739766071, 0);

-- ----------------------------
-- Table structure for product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute`;
CREATE TABLE `product_attribute`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_product` bigint NOT NULL,
  `id_attr` bigint NOT NULL,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `thu_tu` bigint NULL DEFAULT NULL,
  `active` tinyint NULL DEFAULT 1,
  `alias_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `hot` int NULL DEFAULT 0,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `thu_tu` bigint NULL DEFAULT NULL,
  `active` tinyint NULL DEFAULT 1,
  `alias_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `hot` int NULL DEFAULT 0,
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
-- Table structure for search_content
-- ----------------------------
DROP TABLE IF EXISTS `search_content`;
CREATE TABLE `search_content`  (
  `id_search` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_unsign` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `intro` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `intro_unsign` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content_unsign` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint UNSIGNED NULL DEFAULT 0,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `lang` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `active` tinyint NULL DEFAULT 1,
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `search_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_category` int NULL DEFAULT 0,
  `id_item` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_item_value` bigint NULL DEFAULT NULL,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_search`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of search_content
-- ----------------------------
INSERT INTO `search_content` VALUES (1, 'Giới thiệu', 'gioi thieu', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n??', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n??', 1688007930, NULL, '', 1, '', NULL, 'gioi-thieu/', NULL, 'id_category', 5, 'category', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg');
INSERT INTO `search_content` VALUES (2, 'Tác giả', 'tac gia', '', '', '', '', 1688008562, NULL, '', 1, '', NULL, 'tac-gia/', NULL, 'id_category', 8, 'category', '');
INSERT INTO `search_content` VALUES (3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '', '', 1688009638, NULL, '', 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 8, 'id_tacgia', 55, 'tacgia', '');
INSERT INTO `search_content` VALUES (4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit 001', 'lorem ipsum dolor sit amet, consectetur adipiscing elit 001', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n??', 1688009889, NULL, '', 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 6, 'id_news', 10, 'news', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg');
INSERT INTO `search_content` VALUES (6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.', 1688010227, NULL, '', 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 0, 'id_album', 1, 'album', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg');
INSERT INTO `search_content` VALUES (7, 'Trang chủ', 'trang chu', '', '', '', '', 1739333654, NULL, '', 1, '', NULL, '', NULL, 'id_category', 9, 'category', '');
INSERT INTO `search_content` VALUES (8, 'Dịch vụ', 'dich vu', '', '', '', '', 1739335641, NULL, '', 1, '', NULL, 'dich-vu/', NULL, 'id_category', 10, 'category', '');
INSERT INTO `search_content` VALUES (9, 'Sự kiện', 'su kien', '', '', '', '', 1739335725, NULL, '', 1, '', NULL, 'su-kien/', NULL, 'id_category', 11, 'category', '');
INSERT INTO `search_content` VALUES (10, 'Danh Mục', 'danh muc', '', '', '', '', 1739336892, NULL, '', 1, '', NULL, 'danh-muc/', NULL, 'id_category', 12, 'category', '');
INSERT INTO `search_content` VALUES (11, 'Sản Phẩm', 'san pham', '', '', '', '', 1739337298, NULL, '', 1, '', NULL, 'san-pham/', NULL, 'id_category', 13, 'category', '');
INSERT INTO `search_content` VALUES (12, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '', '', 1739337356, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 13, 'id_product', 1, 'product', '/uploaded/san-pham/img-2.jpg');
INSERT INTO `search_content` VALUES (13, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '', '', 1739337706, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 13, 'id_product', 2, 'product', '/uploaded/san-pham/12_grande.jpg');
INSERT INTO `search_content` VALUES (14, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '', '', 1739337709, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 13, 'id_product', 3, 'product', '/uploaded/san-pham/12_grande.jpg');
INSERT INTO `search_content` VALUES (15, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '', '', 1739337711, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 13, 'id_product', 4, 'product', '/uploaded/san-pham/12_grande.jpg');
INSERT INTO `search_content` VALUES (16, 'Danh mục', 'danh muc', '', '', '', '', 1739414010, NULL, '', 1, '', NULL, 'danh-muc/', NULL, 'id_category', 14, 'category', '');
INSERT INTO `search_content` VALUES (17, 'Healthy meals tips', 'healthy meals tips', '', '', '', '', 1739414065, NULL, NULL, 1, '', NULL, 'healthy-meals-tips.html', 14, 'id_news', 12, 'news', '/uploaded/san-pham/12_grande.jpg');
INSERT INTO `search_content` VALUES (18, 'Recipes Idea', 'recipes idea', '', '', '', '', 1739414100, NULL, NULL, 1, '', NULL, 'recipes-idea.html', 14, 'id_news', 13, 'news', '/uploaded/san-pham/Screenshot_2.png');
INSERT INTO `search_content` VALUES (19, 'HealThy excersire', 'healthy excersire', '', '', '', '', 1739414155, NULL, NULL, 1, '', NULL, 'healthy-excersire.html', 14, 'id_news', 14, 'news', '/uploaded/tin-tuc/item1.png');
INSERT INTO `search_content` VALUES (20, 'Healthy meals tips', 'healthy meals tips', '', '', '', '', 1739414690, NULL, '', 1, '', NULL, 'healthy-meals-tips/', NULL, 'id_category', 15, 'category', '/uploaded/san-pham/12_grande.jpg');
INSERT INTO `search_content` VALUES (21, 'Recipes Idea', 'recipes idea', '', '', '', '', 1739414717, NULL, '', 1, '', NULL, 'recipes-idea/', NULL, 'id_category', 16, 'category', '/uploaded/san-pham/12_grande.jpg');
INSERT INTO `search_content` VALUES (22, 'HealThy excersire', 'healthy excersire', '', '', '', '', 1739414742, NULL, '', 1, '', NULL, 'healthy-excersire/', NULL, 'id_category', 17, 'category', '/uploaded/san-pham/img-2.jpg');
INSERT INTO `search_content` VALUES (23, 'Danh muc', 'danh muc', '', '', '', '', 1739416710, NULL, '', 1, '', NULL, 'danh-muc/', NULL, 'id_category', 18, 'category', '');
INSERT INTO `search_content` VALUES (24, 'demo', 'demo', '', '', '', '', 1739416748, NULL, '', 1, '', NULL, 'demo/', NULL, 'id_category', 19, 'category', '');
INSERT INTO `search_content` VALUES (25, 'Nutrition plans', 'nutrition plans', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia', 'contrary to popular belief, lorem ipsum is not simply random text. it has roots in a piece of classical latin literature from 45 bc, making it over 2000 years old. richard mcclintock, a latin professor at hampden-sydney college in virginia', '', '', 1739417937, NULL, NULL, 1, '', NULL, 'nutrition-plans.html', 10, 'id_service', 14, 'service', '/uploaded/ico/info-icon1.png');
INSERT INTO `search_content` VALUES (26, 'Healthy Trainings', 'healthy trainings', '&nbsp;Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dolore aut neque eaque sit!', ' lorem, ipsum dolor sit amet consectetur adipisicing elit. nesciunt placeat voluptatem hic\r\n                        eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam\r\n                        dolore aut neque eaque sit!', '', '', 1739418903, NULL, NULL, 1, '', NULL, 'healthy-trainings.html', 10, 'id_service', 15, 'service', '/uploaded/ico/ico-youtube.png');
INSERT INTO `search_content` VALUES (27, 'Nutrition Plans', 'nutrition plans', '&nbsp; &nbsp;Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic veniet iste quas qui dolor voluptate expedita natu', '   lorem, ipsum dolor sit amet consectetur adipisicing elit. nesciunt placeat voluptatem hic veniet iste quas qui dolor voluptate expedita natu', '', '', 1739418935, NULL, NULL, 1, '', NULL, 'nutrition-plans.html', 10, 'id_service', 16, 'service', '/uploaded/ico/icon-linkin.png');
INSERT INTO `search_content` VALUES (28, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', '&nbsp; &nbsp;Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic veniet iste quas qui dolor voluptate expedita natu', '   lorem, ipsum dolor sit amet consectetur adipisicing elit. nesciunt placeat voluptatem hic veniet iste quas qui dolor voluptate expedita natu', '', '', 1739418979, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 10, 'id_service', 17, 'service', '/uploaded/ico/icon-insta.png');
INSERT INTO `search_content` VALUES (29, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', '&nbsp; &nbsp;Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic veniet iste quas qui dolor voluptate expedita natu', '   lorem, ipsum dolor sit amet consectetur adipisicing elit. nesciunt placeat voluptatem hic veniet iste quas qui dolor voluptate expedita natu', '', '', 1739418982, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 10, 'id_service', 18, 'service', '/uploaded/ico/icon-insta.png');
INSERT INTO `search_content` VALUES (30, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', '&nbsp; &nbsp;Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic veniet iste quas qui dolor voluptate expedita natu', '   lorem, ipsum dolor sit amet consectetur adipisicing elit. nesciunt placeat voluptatem hic veniet iste quas qui dolor voluptate expedita natu', '', '', 1739418984, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 10, 'id_service', 19, 'service', '/uploaded/ico/icon-insta.png');
INSERT INTO `search_content` VALUES (31, ' Nutrition Plans', ' nutrition plans', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dolore aut neque eaque sit!', 'lorem, ipsum dolor sit amet consectetur adipisicing elit. nesciunt placeat voluptatem hic\r\n                        eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam\r\n                        dolore aut neque eaque sit!', '', '', 1739419933, NULL, NULL, 1, '', NULL, 'nutrition-plans.html', 5, 'id_info', 1, 'info', '/uploaded/ico/icon-insta.png');
INSERT INTO `search_content` VALUES (32, ' Nutrition Plans', ' nutrition plans', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dolore aut neque eaque sit!', 'lorem, ipsum dolor sit amet consectetur adipisicing elit. nesciunt placeat voluptatem hic\r\n                        eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam\r\n                        dolore aut neque eaque sit!', '', '', 1739419935, NULL, NULL, 1, '', NULL, 'nutrition-plans.html', 5, 'id_info', 2, 'info', '/uploaded/ico/icon-insta.png');
INSERT INTO `search_content` VALUES (33, ' Nutrition Plans', ' nutrition plans', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dolore aut neque eaque sit!', 'lorem, ipsum dolor sit amet consectetur adipisicing elit. nesciunt placeat voluptatem hic\r\n                        eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam\r\n                        dolore aut neque eaque sit!', '', '', 1739419938, NULL, NULL, 1, '', NULL, 'nutrition-plans.html', 5, 'id_info', 3, 'info', '/uploaded/ico/icon-insta.png');
INSERT INTO `search_content` VALUES (34, 'Tin tức sự kiện', 'tin tuc su kien', '', '', '', '', 1739423129, NULL, '', 1, '', NULL, 'tin-tuc/', NULL, 'id_category', 6, 'category', '');
INSERT INTO `search_content` VALUES (35, 'demo', 'demo', 'adasdasdasd', 'adasdasdasd', '', '', 1739440531, NULL, NULL, 1, '', NULL, 'demo.html', 6, 'id_news', 15, 'news', '/uploaded/tin-tuc/item1.png');
INSERT INTO `search_content` VALUES (36, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Blanditiis animi autem consequuntur natus porro. Veritatis nisi iusto vitae sed, quae dolorum culpa vel quo officia esse necessitatibus distinctio quidem ipsa?', 'lorem ipsum dolor sit amet consectetur adipisicing elit. blanditiis animi autem consequuntur natus porro. veritatis nisi iusto vitae sed, quae dolorum culpa vel quo officia esse necessitatibus distinctio quidem ipsa?', '', '', 1739444347, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 5, 'id_info', 4, 'info', '');
INSERT INTO `search_content` VALUES (37, 'Where can I get some', 'where can i get some', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected', 'there are many variations of passages of lorem ipsum available, but the majority have suffered alteration in some form, by injected', '', '', 1739444756, NULL, NULL, 1, '', NULL, 'where-can-i-get-some.html', 0, 'id_product', 5, 'product', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg');
INSERT INTO `search_content` VALUES (38, 'Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from', 'sydney college in virginia, looked up one of the more obscure latin words, consectetur, from', 'he Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, ma', 'he lorem ipsum generators on the internet tend to repeat predefined chunks as necessary, ma', 'he Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, ma', 'he lorem ipsum generators on the internet tend to repeat predefined chunks as necessary, ma', 1739445578, NULL, NULL, 1, '', NULL, 'sydney-college-in-virginia-looked-up-one-of-the-more-obscure-latin-words-consectetur-from.html', 13, 'id_product', 6, 'product', '/uploaded/tin-tuc/item1.png');
INSERT INTO `search_content` VALUES (39, 'Tư vấn', 'tu van', '', '', '', '', 1739446968, NULL, '', 1, '', NULL, 'tu-van/', NULL, 'id_category', 20, 'category', '');
INSERT INTO `search_content` VALUES (40, 'Tư vấn', 'tu van', '', '', '', '', 1739447728, NULL, '', 1, '', NULL, 'tu-van/', NULL, 'id_category', 21, 'category', '');
INSERT INTO `search_content` VALUES (41, 'Demo', 'demo', '', '', '', '', 1739447949, NULL, '', 1, '', NULL, 'demo/', NULL, 'id_category', 22, 'category', '');
INSERT INTO `search_content` VALUES (42, 'demo123', 'demo123', '', '', '', '', 1739449050, NULL, NULL, 1, '', NULL, 'demo123.html', 21, 'id_service', 20, 'service', '');
INSERT INTO `search_content` VALUES (43, 'asdadasdsads', 'asdadasdsads', 'asdasdsadsadsa', 'asdasdsadsadsa', '', '', 1739449114, NULL, NULL, 1, '', NULL, 'asdadasdsads.html', 21, 'id_service', 21, 'service', '');
INSERT INTO `search_content` VALUES (44, 'asdadasdsads', 'asdadasdsads', 'asdasdsadsadsa', 'asdasdsadsadsa', '', '', 1739449116, NULL, NULL, 1, '', NULL, 'asdadasdsads.html', 21, 'id_service', 22, 'service', '');
INSERT INTO `search_content` VALUES (45, 'asdadasdsads', 'asdadasdsads', 'asdasdsadsadsa', 'asdasdsadsadsa', '', '', 1739449117, NULL, NULL, 1, '', NULL, 'asdadasdsads.html', 21, 'id_service', 23, 'service', '');
INSERT INTO `search_content` VALUES (46, 'asdadasdsads', 'asdadasdsads', 'asdasdsadsadsa', 'asdasdsadsadsa', '', '', 1739449118, NULL, NULL, 1, '', NULL, 'asdadasdsads.html', 21, 'id_service', 24, 'service', '');
INSERT INTO `search_content` VALUES (47, 'Đội ngũ chuyên gia', 'doi ngu chuyen gia', '', '', '', '', 1739500411, NULL, '', 1, '', NULL, 'doi-ngu-chuyen-gia/', NULL, 'id_category', 23, 'category', '');
INSERT INTO `search_content` VALUES (48, 'Lorem ipsum dolor sit amet, consectetu', 'lorem ipsum dolor sit amet, consectetu', 'Lorem ipsum dolor sit amet, consectetu', 'lorem ipsum dolor sit amet, consectetu', '', '', 1739500475, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetu.html', 23, 'id_info', 1, 'info_leader', '/uploaded/lanh-dao/item1.jpeg');
INSERT INTO `search_content` VALUES (49, 'Healthy Trainings', 'healthy trainings', '', '', '', '', 1739505485, NULL, NULL, 1, '', NULL, 'healthy-trainings.html', 5, 'id_info', 5, 'info', '/uploaded/gioi-thieu/ico3.png');
INSERT INTO `search_content` VALUES (50, 'Healthy Trainings', 'healthy trainings', '', '', '', '', 1739505488, NULL, NULL, 1, '', NULL, 'healthy-trainings.html', 5, 'id_info', 6, 'info', '/uploaded/gioi-thieu/ico3.png');
INSERT INTO `search_content` VALUES (51, 'Healthy Trainings', 'healthy trainings', '', '', '', '', 1739505489, NULL, NULL, 1, '', NULL, 'healthy-trainings.html', 5, 'id_info', 7, 'info', '/uploaded/gioi-thieu/ico3.png');
INSERT INTO `search_content` VALUES (52, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n ', 1739505668, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 6, 'id_news', 9, 'news', '/uploaded/tin-tuc/item5.png');
INSERT INTO `search_content` VALUES (53, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n ', 1739505686, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 6, 'id_news', 8, 'news', '/uploaded/tin-tuc/winter_28.jpg');
INSERT INTO `search_content` VALUES (54, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n ', 1739505739, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 6, 'id_news', 7, 'news', '/uploaded/tin-tuc/item4.png');
INSERT INTO `search_content` VALUES (55, 'David ', 'david ', 'Specialist', 'specialist', '', '', 1739506336, NULL, NULL, 1, '', NULL, 'david.html', 23, 'id_info', 2, 'info_leader', '/uploaded/y-kien-khach-hang/man.jpg');
INSERT INTO `search_content` VALUES (56, 'JhonWeeh', 'jhonweeh', 'Speacialist', 'speacialist', '', '', 1739506371, NULL, NULL, 1, '', NULL, 'jhonweeh.html', 23, 'id_info', 3, 'info_leader', '/uploaded/y-kien-khach-hang/man.png');
INSERT INTO `search_content` VALUES (57, 'May Cozdy', 'may cozdy', 'Lead', 'lead', '', '', 1739506395, NULL, NULL, 1, '', NULL, 'may-cozdy.html', 23, 'id_info', 4, 'info_leader', '/uploaded/lanh-dao/item2.jpg');
INSERT INTO `search_content` VALUES (58, 'Tin nổi bật', 'tin noi bat', '', '', '', '', 1739506798, NULL, '', 1, '', NULL, 'tin-noi-bat/', NULL, 'id_category', 24, 'category', '');
INSERT INTO `search_content` VALUES (59, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n ', 1739506818, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 6, 'id_news', 6, 'news', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg');
INSERT INTO `search_content` VALUES (60, 'or sit amet, consectetur adipiscing elit', 'or sit amet, consectetur adipiscing elit', 'or sit amet, consectetur adipiscing elit', 'or sit amet, consectetur adipiscing elit', 'readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum&nbsp;', 'readable english. many desktop publishing packages and web page editors now use lorem ipsum ', 1739508147, NULL, NULL, 1, '', NULL, 'or-sit-amet-consectetur-adipiscing-elit.html', 24, 'id_news', 16, 'news', '/uploaded/slideshow/item4.jpg');
INSERT INTO `search_content` VALUES (61, 'FAQ', 'faq', '', '', '', '', 1739508500, NULL, '', 1, '', NULL, 'faq/', NULL, 'id_category', 25, 'category', '');
INSERT INTO `search_content` VALUES (62, 'Danh mục sản phẩm 1', 'danh muc san pham 1', '', '', '', '', 1739765751, NULL, '', 1, '', NULL, 'danh-muc-san-pham-1/', NULL, 'id_category', 26, 'category', '');
INSERT INTO `search_content` VALUES (63, 'onsectetur adipiscing elit', 'onsectetur adipiscing elit', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;con', 1739765837, NULL, NULL, 1, '', NULL, 'onsectetur-adipiscing-elit.html', 26, 'id_product', 7, 'product', '/uploaded/san-pham/img-2.jpg');
INSERT INTO `search_content` VALUES (64, 'onsectetur adipiscing elit', 'onsectetur adipiscing elit', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;con', 1739765839, NULL, NULL, 1, '', NULL, 'onsectetur-adipiscing-elit.html', 26, 'id_product', 8, 'product', '/uploaded/san-pham/img-2.jpg');
INSERT INTO `search_content` VALUES (65, 'onsectetur adipiscing elit', 'onsectetur adipiscing elit', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;con', 1739765840, NULL, NULL, 1, '', NULL, 'onsectetur-adipiscing-elit.html', 26, 'id_product', 9, 'product', '/uploaded/san-pham/img-2.jpg');
INSERT INTO `search_content` VALUES (66, 'onsectetur adipiscing elit', 'onsectetur adipiscing elit', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;con', 1739765841, NULL, NULL, 1, '', NULL, 'onsectetur-adipiscing-elit.html', 26, 'id_product', 10, 'product', '/uploaded/san-pham/img-2.jpg');
INSERT INTO `search_content` VALUES (67, 'onsectetur adipiscing elit', 'onsectetur adipiscing elit', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;con', 1739765843, NULL, NULL, 1, '', NULL, 'onsectetur-adipiscing-elit.html', 26, 'id_product', 11, 'product', '/uploaded/san-pham/img-2.jpg');
INSERT INTO `search_content` VALUES (68, 'onsectetur adipiscing elit', 'onsectetur adipiscing elit', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;con', 1739765843, NULL, NULL, 1, '', NULL, 'onsectetur-adipiscing-elit.html', 26, 'id_product', 12, 'product', '/uploaded/san-pham/img-2.jpg');
INSERT INTO `search_content` VALUES (69, 'Danh mục sản phẩm 2', 'danh muc san pham 2', '', '', '', '', 1739766005, NULL, '', 1, '', NULL, 'danh-muc-san-pham-2/', NULL, 'id_category', 27, 'category', '');
INSERT INTO `search_content` VALUES (70, 'Contrary to popular belie', 'contrary to popular belie', '', '', '', '', 1739766065, NULL, NULL, 1, '', NULL, 'contrary-to-popular-belie.html', 27, 'id_product', 13, 'product', '/uploaded/san-pham/12_grande.jpg');
INSERT INTO `search_content` VALUES (71, 'Contrary to popular belie', 'contrary to popular belie', '', '', '', '', 1739766067, NULL, NULL, 1, '', NULL, 'contrary-to-popular-belie.html', 27, 'id_product', 14, 'product', '/uploaded/san-pham/12_grande.jpg');
INSERT INTO `search_content` VALUES (72, 'Contrary to popular belie', 'contrary to popular belie', '', '', '', '', 1739766068, NULL, NULL, 1, '', NULL, 'contrary-to-popular-belie.html', 27, 'id_product', 15, 'product', '/uploaded/san-pham/12_grande.jpg');
INSERT INTO `search_content` VALUES (73, 'Contrary to popular belie', 'contrary to popular belie', '', '', '', '', 1739766069, NULL, NULL, 1, '', NULL, 'contrary-to-popular-belie.html', 27, 'id_product', 16, 'product', '/uploaded/san-pham/12_grande.jpg');
INSERT INTO `search_content` VALUES (74, 'Contrary to popular belie', 'contrary to popular belie', '', '', '', '', 1739766069, NULL, NULL, 1, '', NULL, 'contrary-to-popular-belie.html', 27, 'id_product', 17, 'product', '/uploaded/san-pham/12_grande.jpg');
INSERT INTO `search_content` VALUES (75, 'Contrary to popular belie', 'contrary to popular belie', '', '', '', '', 1739766070, NULL, NULL, 1, '', NULL, 'contrary-to-popular-belie.html', 27, 'id_product', 18, 'product', '/uploaded/san-pham/12_grande.jpg');
INSERT INTO `search_content` VALUES (76, 'Contrary to popular belie', 'contrary to popular belie', '', '', '', '', 1739766070, NULL, NULL, 1, '', NULL, 'contrary-to-popular-belie.html', 27, 'id_product', 19, 'product', '/uploaded/san-pham/12_grande.jpg');
INSERT INTO `search_content` VALUES (77, 'Contrary to popular belie', 'contrary to popular belie', '', '', '', '', 1739766071, NULL, NULL, 1, '', NULL, 'contrary-to-popular-belie.html', 27, 'id_product', 20, 'product', '/uploaded/san-pham/12_grande.jpg');
INSERT INTO `search_content` VALUES (78, 'Chăm sóc da chuyên sâu ', 'cham soc da chuyen sau ', '', '', '', '', 1741706985, NULL, '', 1, '', NULL, 'cham-soc-da-chuyen-sau/', NULL, 'id_category', 28, 'category', '');
INSERT INTO `search_content` VALUES (79, 'Gội đầu dưỡng sinh phân tử ', 'goi dau duong sinh phan tu ', '', '', '', '', 1741707043, NULL, '', 1, '', NULL, 'goi-dau-duong-sinh-phan-tu/', NULL, 'id_category', 29, 'category', '');
INSERT INTO `search_content` VALUES (80, 'TRẺ HOÁ VÙNG KÍN ', 'tre hoa vung kin ', '', '', '', '', 1741707292, NULL, '', 1, '', NULL, 'tre-hoa-vung-kin/', NULL, 'id_category', 30, 'category', '');
INSERT INTO `search_content` VALUES (81, 'Giảm Béo Chuẩn Y Khoa ', 'giam beo chuan y khoa ', '', '', '', '', 1741707393, NULL, '', 1, '', NULL, 'giam-beo-chuan-y-khoa/', NULL, 'id_category', 31, 'category', '');
INSERT INTO `search_content` VALUES (82, 'Kiểm Tra &amp; Đánh Giá Sức Khoẻ ', 'kiem tra &amp; danh gia suc khoe ', '', '', '', '', 1741707634, NULL, NULL, 1, '', NULL, 'kiem-tra-amp-danh-gia-suc-khoe.html', 11, 'id_news', 17, 'news', '');
INSERT INTO `search_content` VALUES (83, 'Kiểm Tra &amp; Đánh Giá Sức Khoẻ', 'kiem tra &amp; danh gia suc khoe', '', '', '', '', 1741707881, NULL, '', 1, '', NULL, 'kiem-tra-amp-danh-gia-suc-khoe/', NULL, 'id_category', 32, 'category', '');
INSERT INTO `search_content` VALUES (84, 'Thư giãn &amp; Dưỡng sinh ', 'thu gian &amp; duong sinh ', '', '', '', '', 1741708018, NULL, '', 1, '', NULL, 'thu-gian-amp-duong-sinh/', NULL, 'id_category', 33, 'category', '');
INSERT INTO `search_content` VALUES (85, 'Thư giãn &amp; Dưỡng sinh ', 'thu gian &amp; duong sinh ', '', '', '', '', 1741708084, NULL, '', 1, '', NULL, 'thu-gian-amp-duong-sinh/', NULL, 'id_category', 34, 'category', '');
INSERT INTO `search_content` VALUES (86, 'Trị liệu sức khoẻ ', 'tri lieu suc khoe ', '', '', '', '', 1741708301, NULL, '', 1, '', NULL, 'tri-lieu-suc-khoe/', NULL, 'id_category', 35, 'category', '');
INSERT INTO `search_content` VALUES (87, 'Khóa học', 'khoa hoc', '', '', '', '', 1741771885, NULL, '', 1, '', NULL, 'khoa-hoc/', NULL, 'id_category', 36, 'category', '');
INSERT INTO `search_content` VALUES (88, 'Khóa học chốt Sale', 'khoa hoc chot sale', '', '', '', '', 1741771946, NULL, '', 1, '', NULL, 'khoa-hoc-chot-sale/', NULL, 'id_category', 37, 'category', '');
INSERT INTO `search_content` VALUES (89, 'Khóa học điều trị rạn', 'khoa hoc dieu tri ran', '', '', '', '', 1741772037, NULL, '', 1, '', NULL, 'khoa-hoc-dieu-tri-ran/', NULL, 'id_category', 38, 'category', '');
INSERT INTO `search_content` VALUES (90, 'Khóa học tắm bé sơ sinh', 'khoa hoc tam be so sinh', '', '', '', '', 1741772079, NULL, '', 1, '', NULL, 'khoa-hoc-tam-be-so-sinh/', NULL, 'id_category', 39, 'category', '');
INSERT INTO `search_content` VALUES (91, 'khóa đào tạo nghề chăm sóc sau sinh', 'khoa dao tao nghe cham soc sau sinh', '', '', '', '', 1741772111, NULL, '', 1, '', NULL, 'khoa-dao-tao-nghe-cham-soc-sau-sinh/', NULL, 'id_category', 40, 'category', '');
INSERT INTO `search_content` VALUES (92, 'khóa đào tạo nghề chăm sóc sau sinh', 'khoa dao tao nghe cham soc sau sinh', '', '', '', '', 1741772113, NULL, '', 1, '', NULL, 'khoa-dao-tao-nghe-cham-soc-sau-sinh/', NULL, 'id_category', 41, 'category', '');
INSERT INTO `search_content` VALUES (93, 'khóa đào tạo nghề chăm sóc sau sinh', 'khoa dao tao nghe cham soc sau sinh', '', '', '', '', 1741772115, NULL, '', 1, '', NULL, 'khoa-dao-tao-nghe-cham-soc-sau-sinh/', NULL, 'id_category', 42, 'category', '');
INSERT INTO `search_content` VALUES (94, 'sdasdsd', 'sdasdsd', 'sddsadsad', 'sddsadsad', '', '', 1741774023, NULL, NULL, 1, '', NULL, 'sdasdsd.html', 37, 'id_news', 18, 'news', '');
INSERT INTO `search_content` VALUES (95, 'Dịch vụ mẹ và bé', 'dich vu me va be', '', '', '', '', 1741839704, NULL, '', 1, '', NULL, 'dich-vu-me-va-be/', NULL, 'id_category', 43, 'category', '');
INSERT INTO `search_content` VALUES (96, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n ', 1741850391, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 6, 'id_news', 4, 'news', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg');
INSERT INTO `search_content` VALUES (97, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n ', 1741850412, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 6, 'id_news', 20, 'news', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg');
INSERT INTO `search_content` VALUES (98, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 'lorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n\r\n\r\nlorem ipsum dolor sit amet, consectetur adipiscing elit. duis euismod ut nisl id sodales. etiam consectetur nulla vel ornare aliquam. phasellus non velit eget massa consectetur lobortis. integer tempus consequat augue, vitae rutrum sem tempor id. class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. praesent ornare tellus non ornare molestie. maecenas convallis leo justo, eget lobortis dui fringilla vitae. proin ac volutpat leo. aliquam id fermentum tortor.\r\n ', 1741850426, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 6, 'id_news', 5, 'news', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg');
INSERT INTO `search_content` VALUES (99, 'Jacuzzz, Sauna&amp;Steam', 'jacuzzz, sauna&amp;steam', '', '', '', '', 1741856581, NULL, '', 1, '', NULL, 'jacuzzz-saunaampsteam/', NULL, 'id_category', 44, 'category', '/uploaded/gioi-thieu/jacuzzi.jpg');
INSERT INTO `search_content` VALUES (100, 'Báo chí nói gì về chúng tôi', 'bao chi noi gi ve chung toi', '', '', '', '', 1741857518, NULL, '', 1, '', NULL, 'bao-chi-noi-gi-ve-chung-toi/', NULL, 'id_category', 45, 'category', '');
INSERT INTO `search_content` VALUES (101, 'Ngoisao nói về chúng tôi', 'ngoisao noi ve chung toi', 'Lamchame k&ecirc;nh cung cấp th&ocirc;ng tin kiến thức uy t&iacute;n d&agrave;nh cho c&aacute;c bậc cha mẹ học hỏi, kiến thức, kinh nghiệm chăm s&oacute;c, nu&ocirc;i dạy con c&aacute;i khoa học v&agrave;&nbsp;...', 'lamchame kenh cung cap thong tin kien thuc uy tin danh cho cac bac cha me hoc hoi, kien thuc, kinh nghiem cham soc, nuoi day con cai khoa hoc va ...', '', '', 1741858242, NULL, NULL, 1, '', NULL, 'ngoisao-noi-ve-chung-toi.html', 45, 'id_news', 21, 'news', '');
INSERT INTO `search_content` VALUES (102, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. the point of using lorem ipsum ', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. the point of using lorem ipsum ', 1741859044, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 45, 'id_news', 22, 'news', '/uploaded/tin-tuc/logo-chan-trang-24h.png');
INSERT INTO `search_content` VALUES (103, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. the point of using lorem ipsum ', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. the point of using lorem ipsum ', 1741859046, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 45, 'id_news', 23, 'news', '/uploaded/tin-tuc/logo-chan-trang-24h.png');
INSERT INTO `search_content` VALUES (104, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. the point of using lorem ipsum ', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. the point of using lorem ipsum ', 1741859047, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 45, 'id_news', 24, 'news', '/uploaded/tin-tuc/logo-chan-trang-24h.png');
INSERT INTO `search_content` VALUES (105, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. the point of using lorem ipsum ', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. the point of using lorem ipsum ', 1741859048, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 45, 'id_news', 25, 'news', '/uploaded/tin-tuc/logo-chan-trang-24h.png');
INSERT INTO `search_content` VALUES (106, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. the point of using lorem ipsum ', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. the point of using lorem ipsum ', 1741859048, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 45, 'id_news', 26, 'news', '/uploaded/tin-tuc/logo-chan-trang-24h.png');
INSERT INTO `search_content` VALUES (107, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem ipsum dolor sit amet, consectetur adipiscing elit', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. the point of using lorem ipsum ', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum&nbsp;', 'it is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. the point of using lorem ipsum ', 1741859049, NULL, NULL, 1, '', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', 45, 'id_news', 27, 'news', '/uploaded/tin-tuc/logo-chan-trang-24h.png');
INSERT INTO `search_content` VALUES (108, 'Giới Thiệu CatHome', 'gioi thieu cathome', 'Green Field l&agrave; Viện Chăm s&oacute;c Mẹ bầu, Mẹ sau sinh v&agrave; Trẻ sơ sinh h&agrave;ng đầu Việt Nam. Thương hiệu nhận được sự ủng hộ v&agrave; l&ograve;ng tin của h&agrave;ng ngh&igrave;n kh&aacute;ch h&agrave;ng bởi t&iacute;nh chuy&ecirc;n nghiệp - sự tận t&acirc;m - tinh thần tr&aacute;ch nhiệm.', 'green field la vien cham soc me bau, me sau sinh va tre so sinh hang dau viet nam. thuong hieu nhan duoc su ung ho va long tin cua hang nghin khach hang boi tinh chuyen nghiep - su tan tam - tinh than trach nhiem.', 'Green Field l&agrave; Viện Chăm s&oacute;c Mẹ bầu, Mẹ sau sinh v&agrave; Trẻ sơ sinh h&agrave;ng đầu Việt Nam. Thương hiệu nhận được sự ủng hộ v&agrave; l&ograve;ng tin của h&agrave;ng ngh&igrave;n kh&aacute;ch h&agrave;ng bởi t&iacute;nh chuy&ecirc;n nghiệp - sự tận t&acirc;m - tinh thần tr&aacute;ch nhiệm.', 'green field la vien cham soc me bau, me sau sinh va tre so sinh hang dau viet nam. thuong hieu nhan duoc su ung ho va long tin cua hang nghin khach hang boi tinh chuyen nghiep - su tan tam - tinh than trach nhiem.', 1741861176, NULL, '', 1, '', NULL, 'gioi-thieu-cathome/', NULL, 'id_category', 46, 'category', '');

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service`  (
  `id_service` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imageadv` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 1,
  `id_user` bigint NULL DEFAULT 0,
  `fileurl` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tieubieu` int NULL DEFAULT 0,
  `image_list` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `inhome` tinyint NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_tacgia` int NULL DEFAULT NULL,
  `last_modify` bigint NULL DEFAULT 0,
  PRIMARY KEY (`id_service`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of service
-- ----------------------------
INSERT INTO `service` VALUES (14, 10, 'Nutrition plans', 'Nutrition plans', '', '', '/uploaded/ico/info-icon1.png', '', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia', '', 1739417760, 1, 1, 8, '', 0, '[]', 0, ':0:', NULL, 'nutrition-plans.html', NULL, 1739418945);
INSERT INTO `service` VALUES (15, 10, 'Healthy Trainings', 'Healthy Trainings', '', '', '/uploaded/ico/ico-youtube.png', '', '&nbsp;Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dolore aut neque eaque sit!', '', 1739418840, 2, 1, 8, '', 0, '[]', 0, ':0:', NULL, 'healthy-trainings.html', NULL, 1739418903);
INSERT INTO `service` VALUES (16, 10, 'Nutrition Plans', 'Nutrition Plans', '', '', '/uploaded/ico/icon-linkin.png', '', '&nbsp; &nbsp;Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic veniet iste quas qui dolor voluptate expedita natu', '', 1739418900, 3, 1, 8, '', 0, '[]', 0, ':', NULL, 'nutrition-plans.html', NULL, 1739418935);
INSERT INTO `service` VALUES (17, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/ico/icon-insta.png', '', '&nbsp; &nbsp;Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic veniet iste quas qui dolor voluptate expedita natu', '', 1739418900, 4, 1, 8, '', 0, '[]', 0, ':', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', NULL, 1739418979);
INSERT INTO `service` VALUES (18, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/ico/icon-insta.png', '', '&nbsp; &nbsp;Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic veniet iste quas qui dolor voluptate expedita natu', '', 1739418900, 4, 1, 8, '', 0, '[]', 0, ':', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', NULL, 1739418982);
INSERT INTO `service` VALUES (19, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/ico/icon-insta.png', '', '&nbsp; &nbsp;Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic veniet iste quas qui dolor voluptate expedita natu', '', 1739418900, 4, 1, 8, '', 0, '[]', 0, ':21:', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', NULL, 1741850455);
INSERT INTO `service` VALUES (20, 21, 's opposed to using &amp;#39;Content h', 's opposed to using &amp;#39;Content here, content here&amp;#39;, making it ', '', '', '/uploaded/san-pham/img-2.jpg', '', 's opposed to using &#39;Content here, content here&#39;, making it look like readabl', '', 1739449020, 5, 1, 8, '', 0, '[]', 0, ':', NULL, 'demo123.html', NULL, 1739506653);
INSERT INTO `service` VALUES (21, 21, 'desktop publishing packages and web p', 'desktop publishing packages and web page editors', '', '', '/uploaded/tin-tuc/item5.png', '', 's opposed to using &#39;Content here, content here&#39;, making it look like', '', 1739449080, 6, 1, 8, '', 0, '[]', 0, ':', NULL, 'asdadasdsads.html', NULL, 1739506644);
INSERT INTO `service` VALUES (22, 21, ' It is a long established fact that a reader wil', ' It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The', '', '', '/uploaded/san-pham/Screenshot_2.png', '', 'en looking at its layout. The', '', 1739449080, 7, 1, 8, '', 0, '[]', 0, ':', NULL, 'asdadasdsads.html', NULL, 1739506230);
INSERT INTO `service` VALUES (23, 21, 'andard dummy text ever since the 1500s, when an ', ' of the printing and typesetting industry. Lorem Ipsum has been the industry&amp;#', '', '', '/uploaded/album/hinh-anh-thien-nhien-dep-nhat-th-gioi.jpg', '', '&nbsp;of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s&nbsp;', '', 1739449080, 8, 1, 8, '', 0, '[]', 0, ':', NULL, 'asdadasdsads.html', NULL, 1739506618);
INSERT INTO `service` VALUES (24, 21, 'm Ipsum has been the industry', ' of the printing and typesetting industry. Lorem Ipsum has been the industry&amp;#39;s standard dummrinter too', '', '', '/uploaded/album/dc_150826_Sapa.jpg', '', '&nbsp;of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard d', '', 1739449080, 9, 1, 8, '', 0, '[]', 0, ':', NULL, 'asdadasdsads.html', NULL, 1739506636);

-- ----------------------------
-- Table structure for service_detail
-- ----------------------------
DROP TABLE IF EXISTS `service_detail`;
CREATE TABLE `service_detail`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_service` bigint UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `imageadv` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 1,
  `id_user` bigint NULL DEFAULT 0,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `item_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint NULL DEFAULT 0,
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
INSERT INTO `settings` VALUES ('guid', 'bccf942dbc1d96b95558d48bd499f46edc1713b4;5da5322c52e7b5702678a72b2837dcfc8d867080');
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
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `id_user` bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of settingshow
-- ----------------------------
INSERT INTO `settingshow` VALUES (1, '1', '{\"newsinpage\":\"9\",\"producthome\":\"3\",\"albumpage\":\"3\",\"productinpage\":\"9\",\"photopage\":\"3\",\"hotline\":\"1900 2021\",\"companyname\":\"\",\"companyaddress\":\"K\\u0110T Trung H\\u00f2a Nh\\u00e2n Ch\\u00ednh, Thanh Xu\\u00e2n, H\\u00e0 N\\u1ed9i\",\"companyphone\":\"\",\"companyemail\":\"\",\"companywebsite\":\"\",\"facebook\":\"\",\"youtube\":\"#\",\"twitter\":\"#\",\"pinterest\":\"#\",\"fanpage\":\"#\",\"apikey\":\"\"}', 0);

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
  `id_static` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint NULL DEFAULT 0,
  `id_catstatic` bigint NOT NULL DEFAULT 0,
  `id_user` bigint NOT NULL DEFAULT 0,
  `active` tinyint NOT NULL DEFAULT 0,
  `ngay_dang` bigint NOT NULL DEFAULT 0,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inwhere` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lang` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id_static`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of static
-- ----------------------------
INSERT INTO `static` VALUES (25, 'TRỤ SỞ CHÍNH ', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;width:90%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"width: 26px;\"><img src=\"/uploaded/ico/ico-loc.png\" /></td>\r\n			<td style=\"font-family: \'Muli-B\';\">Địa chỉ</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">KĐT Trung H&ograve;a Nh&acirc;n Ch&iacute;nh, Thanh Xu&acirc;n, H&agrave; Nội</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td><img src=\"/uploaded/ico/ico-phone.png\" /></td>\r\n			<td style=\"font-family: \'Muli-B\';\">Điện thoại</td>\r\n		</tr>\r\n		<tr>\r\n			<td><img src=\"/uploaded/ico/ico-mail.png\" /></td>\r\n			<td style=\"font-family: \'Muli-B\';\">Email</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 0, 0, 0, 1, 0, '', 'footer', '');
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
  `id_static` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` bigint NULL DEFAULT 0,
  `id_user` bigint NOT NULL DEFAULT 0,
  `active` tinyint NOT NULL DEFAULT 0,
  `ngay_dang` bigint NOT NULL DEFAULT 0,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thu_tu` bigint NULL DEFAULT 0,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_category` bigint NULL DEFAULT NULL,
  `table_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_item` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_value` bigint NULL DEFAULT NULL,
  `type_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `active` int NULL DEFAULT 1,
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
  `id_tacgia` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint UNSIGNED NOT NULL DEFAULT 0,
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
  `ngay_dang` bigint UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 1,
  `id_user` bigint NULL DEFAULT 0,
  `header_tag` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_modify` bigint NULL DEFAULT NULL,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `id_tuyendung` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `short_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ngay_dang` bigint UNSIGNED NULL DEFAULT 0,
  `thu_tu` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 1,
  `id_user` bigint NULL DEFAULT 0,
  `file` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `hot` tinyint NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `soluong` bigint NULL DEFAULT NULL,
  `diadiem` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thoihan` bigint NULL DEFAULT NULL,
  `congviec` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_modify` bigint NULL DEFAULT NULL,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `subject` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdate` bigint NULL DEFAULT NULL,
  `xem` int NULL DEFAULT NULL,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dt_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_item` bigint NULL DEFAULT 0,
  `data_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alias_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_category` bigint NULL DEFAULT 0,
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
  `id_user_module` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` bigint UNSIGNED NOT NULL DEFAULT 0,
  `id_module` bigint UNSIGNED NOT NULL DEFAULT 0,
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
  `id_users` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastvisit` bigint UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint NOT NULL DEFAULT 0,
  `super` tinyint NOT NULL DEFAULT 0,
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yahoo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `showed` tinyint NOT NULL DEFAULT 1,
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
  `id_video` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thu_tu` bigint NULL DEFAULT 0,
  `id_category` bigint NULL DEFAULT 0,
  `id_user` bigint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 0,
  `ngay_dang` bigint NULL DEFAULT 0,
  `image` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `showinfooter` int NULL DEFAULT 0,
  `last_modify` bigint NULL DEFAULT NULL,
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
  `districtid` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `provinceid` int NOT NULL,
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
  `provinceid` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thu_tu` int NULL DEFAULT 0,
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
  `id_yahoo` tinyint NOT NULL AUTO_INCREMENT,
  `id_category` int NULL DEFAULT NULL,
  `image` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nick` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thu_tu` tinyint NULL DEFAULT 0,
  `active` tinyint NULL DEFAULT 0,
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
  `id_ykien` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `intro` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ngay_dang` bigint UNSIGNED NOT NULL DEFAULT 0,
  `thu_tu` bigint NOT NULL DEFAULT 0,
  `active` tinyint NOT NULL DEFAULT 1,
  `small_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `normal_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_user` bigint NOT NULL DEFAULT 0,
  `file` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tieubieu` int NULL DEFAULT 0,
  `hit` int NULL DEFAULT NULL,
  `imgshowdetail` tinyint NOT NULL DEFAULT 0,
  `hot` tinyint NOT NULL DEFAULT 0,
  `inhome` tinyint NOT NULL DEFAULT 0,
  `showdate` tinyint NOT NULL DEFAULT 1,
  `showcomment` tinyint NOT NULL DEFAULT 0,
  `postcomment` tinyint NOT NULL DEFAULT 0,
  `groupcat` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `tags` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `soure` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author_id` int NULL DEFAULT NULL,
  `author_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_email` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `id_service` bigint NULL DEFAULT 0,
  PRIMARY KEY (`id_ykien`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ykien
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
