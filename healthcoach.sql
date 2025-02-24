/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100427
 Source Host           : localhost:3306
 Source Schema         : healthcoach

 Target Server Type    : MySQL
 Target Server Version : 100427
 File Encoding         : 65001

 Date: 24/02/2025 16:58:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_social
-- ----------------------------
DROP TABLE IF EXISTS `account_social`;
CREATE TABLE `account_social`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `provider_user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_social_provider_user_id_index`(`provider_user_id`) USING BTREE,
  INDEX `account_social_provider_index`(`provider`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of account_social
-- ----------------------------

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `age` tinyint NULL DEFAULT 0,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint NULL DEFAULT 1,
  `hard_salary` int NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admins_email_unique`(`email`) USING BTREE,
  INDEX `admins_active_index`(`active`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'Admin', 'doantotnghiep@gmail.com', '0377523200', 'Tòa nhà FPT Polytechnic, P. Trịnh Văn Bô, Xuân Phư', 20, NULL, '$2y$10$diDOgZLBCVc0h562OXkQ/uvLl2o0nYz4TRcSn0uKuNMbXD8Jj8/j.', 1, 7000000, '6Dnl8e8jTVZZG1pdCoYpYS5Id29xRcztZvtgUX0PkpbbyONcvXktQaW7NbWo', NULL, '2022-12-12 10:44:49');
INSERT INTO `admins` VALUES (49, 'Vũ Minh Hoàng', 'hoangvmph13792@fpt.edu.vn', '0372482834', '118B Lê Quang Đạo', 20, NULL, '$2y$10$oyvtBG9B/tnPu3fg4m1C7uImqEONs7MeqDS9lNQhLo4NhBbDjVn/a', 1, 20000000, '3KmgzMOHhW7h8QxviQjwFL8ZtskDBmloV5gw0SgnjxmAGULaVF9d6gjazs1z', '2022-12-24 10:55:25', '2022-12-24 10:55:25');
INSERT INTO `admins` VALUES (50, 'Nguyễn Văn Sơn', 'sonnnph13838@fpt.edu.vn', '0377523200', 'Hà Nội', 20, NULL, '$2y$10$fW0qgpojha6Cqr89JgsOoOecZh3MA0ECe8qDLALLItgiEwbikHKXC', 1, 20000000, 'shUHNVJGVxLzNymf5RLf4LO25QbLPT6dQW6egFJVievpRDHfa1IlXKV072EO', '2022-12-24 10:56:28', '2022-12-24 10:56:28');
INSERT INTO `admins` VALUES (51, 'Đinh Đức Thuận', 'thuanddph13844@fpt.edu.vn', '0327292046', 'Hà Nội', 20, NULL, '$2y$10$RAY2iKnDZi32YlsxB.kD5O7f9EVv1DSqnZbTbU7qhMQd.d1/822LG', 1, 20000000, 'pnTI89KEra7v2UeWj7VQ8lc2yqIaVfUe2SEsX9EpuxJYMjbXzRrIZKGAiPcl', '2022-12-24 11:00:03', '2022-12-24 11:00:03');
INSERT INTO `admins` VALUES (52, 'Đỗ Thành Tuấn', 'tuandtph13846@fpt.edu.vn', '0702022234', 'Hà Nội', 20, NULL, '$2y$10$DLtNkEg6wgreMXXgJJuEXOAK3zmyqJT/uZUftnja4jSTlSA2bClGy', 1, 20000000, 'cbeUaDe2LeyV9x5ZVdWtkCIZeWm0bZZKmPXwajG9s1GgQgGIROdir93diHNA', '2022-12-24 11:02:00', '2022-12-24 11:02:00');
INSERT INTO `admins` VALUES (53, 'Kiều Anh Đức', 'duckaph09551@fpt.edu.vn', '0964864347', 'Hà Nội', 22, NULL, '$2y$10$FgwnIuF1oSZXNzCYVwUqbeRc5WpqnLvcaHw/RDpj6KJO0QOjsEYYK', 1, 30000000, 'UgRxuDM5ZMTKc0HQgJGMrZnqwO3ZrUPxnHnNSdm9bSe9awkO9Q5BP6yCvTVZ', '2022-12-24 11:03:51', '2022-12-24 11:03:51');

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
-- Table structure for article_keywords
-- ----------------------------
DROP TABLE IF EXISTS `article_keywords`;
CREATE TABLE `article_keywords`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ak_article_id` int NOT NULL,
  `ak_keyword_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `article_keywords_ak_article_id_ak_keyword_id_unique`(`ak_article_id`, `ak_keyword_id`) USING BTREE,
  INDEX `article_keywords_ak_article_id_index`(`ak_article_id`) USING BTREE,
  INDEX `article_keywords_ak_keyword_id_index`(`ak_keyword_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_keywords
-- ----------------------------

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `a_title` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `a_slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `a_menu_id` int NULL DEFAULT 0,
  `a_description` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `a_avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `a_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `a_admin_id` int NULL DEFAULT 0,
  `a_auth_id` int NULL DEFAULT 0,
  `a_view` int NULL DEFAULT 0,
  `a_active` tinyint NULL DEFAULT 1,
  `a_hot` tinyint NULL DEFAULT 0,
  `a_point_rating` int NULL DEFAULT 0,
  `a_total_ratings` int NULL DEFAULT 0,
  `a_title_seo` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `a_keyword_seo` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `a_description_seo` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `articles_a_menu_id_index`(`a_menu_id`) USING BTREE,
  INDEX `articles_a_admin_id_index`(`a_admin_id`) USING BTREE,
  INDEX `articles_a_auth_id_index`(`a_auth_id`) USING BTREE,
  INDEX `articles_a_active_index`(`a_active`) USING BTREE,
  INDEX `articles_a_hot_index`(`a_hot`) USING BTREE,
  INDEX `articles_a_point_rating_index`(`a_point_rating`) USING BTREE,
  INDEX `articles_a_total_ratings_index`(`a_total_ratings`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES (7, 'Advertisement Lịch sử và nguồn gốc ô tô Honda của nước nào?', 'advertisement-lich-su-va-nguon-goc-o-to-honda-cua-nuoc-nao', 23, 'Advertisement Lịch sử và nguồn gốc ô tô Honda của nước nào?', '2022-12-19__1ewqwe.jpg', '<h2>Honda của nước n&agrave;o v&agrave; thương hiệu đ&atilde; trải qua bao nhi&ecirc;u cột mốc lịch sử từ ng&agrave;y mới th&agrave;nh lập đến nay c&oacute; thể l&agrave; c&acirc;u hỏi đ&atilde; từng xuất hiện trong t&acirc;m tr&iacute; của người h&acirc;m mộ. Theo đ&oacute;, bảng thống k&ecirc; tổng quan sau c&oacute; thể phần n&agrave;o giải đ&aacute;p được c&aacute;c thắc mắc của c&aacute;c tay l&aacute;i đam m&ecirc; xe Honda.</h2>\r\n\r\n<p><img alt=\"Lịch sử và nguồn gốc ô tô Honda của nước nào ?\" src=\"https://img1.oto.com.vn/2020/04/29/8RgE0bMU/lich-su-va-nguon-goc-o-to-honda-cua-nuoc-nao-oto-c-13c1.jpg\" title=\"Lịch sử và nguồn gốc ô tô Honda của nước nào?\" /></p>\r\n\r\n<p><em>Lịch sử v&agrave; nguồn gốc &ocirc; t&ocirc; Honda của nước n&agrave;o?</em></p>\r\n\r\n<h2><strong>1937</strong></h2>\r\n\r\n<p><img alt=\"Lịch sử và nguồn gốc ô tô Honda Nhật bắt đầu từ 1937.\" src=\"https://img1.oto.com.vn/2020/04/29/8RgE0bMU/lich-su-va-nguon-goc-o-to-honda-cua-nuoc-nao-oto-c-3199.jpg\" title=\"Lịch sử và nguồn gốc ô tô Honda Nhật bắt đầu từ 1937\" /></p>\r\n\r\n<p>Lịch sử v&agrave; nguồn gốc &ocirc; t&ocirc; Honda Nhật bắt đầu từ 1937.</p>\r\n\r\n<p>H&atilde;ng xe Honda của Nhật được th&agrave;nh lập bởi Soichiro Honda v&agrave;o năm 1937. Soichiro Honda l&agrave; một người rất đam m&ecirc; &ocirc; t&ocirc;. &Ocirc;ng l&agrave;m việc như một thợ cơ kh&iacute; tại garage Art Show KY v&agrave; tham gia v&agrave;o c&aacute;c cuộc đua với sự t&agrave;i trợ từ người bạn Cathodes. Honda th&agrave;nh lập Tokai CK để chế tạo v&ograve;ng piston. Sau những thất bại ban đầu, Tokai CK đ&atilde; gi&agrave;nh được hợp đồng cung cấp v&ograve;ng piston cho Toyota nhưng mất hợp đồng do chất lượng sản phẩm k&eacute;m. Honda đ&atilde; theo học tại một trường kỹ thuật nhưng kh&ocirc;ng tốt nghiệp do đến thăm c&aacute;c nh&agrave; m&aacute;y tr&ecirc;n khắp Nhật Bản để hiểu r&otilde; hơn về quy tr&igrave;nh kiểm so&aacute;t chất lượng của Toyota.</p>\r\n\r\n<h2><strong>1941</strong></h2>\r\n\r\n<p><img alt=\"Thương hiệu ô tô Honda vào 1941 tập trung vào sản xuất mô-tơ rồi xe đạp cơ giới.\" src=\"https://img1.oto.com.vn/2020/04/29/8RgE0bMU/lich-su-va-nguon-goc-o-to-honda-cua-nuoc-nao-oto-c-f8c4.jpg\" title=\"Thương hiệu ô tô Honda vào 1941 tập trung vào sản xuất mô-tơ rồi xe đạp cơ giới\" /></p>\r\n\r\n<p><em>Thương hiệu &ocirc; t&ocirc; Honda v&agrave;o 1941 tập trung v&agrave;o sản xuất m&ocirc;-tơ rồi xe đạp cơ giới.</em></p>\r\n\r\n<p>Đến năm 1941, Honda đ&atilde; c&oacute; thể sản xuất h&agrave;ng loạt v&ograve;ng piston được Toyota chấp nhận bằng c&aacute;ch sử dụng quy tr&igrave;nh tự động. Tokai nằm dưới sự kiểm so&aacute;t của Bộ Thương mại v&agrave; C&ocirc;ng nghiệp khi bắt đầu Thế chiến thứ hai. Soichiro Honda đ&atilde; bị gi&aacute;ng chức từ chủ tịch th&agrave;nh gi&aacute;m đốc điều h&agrave;nh cấp cao sau khi Toyota chiếm 40% cổ phần của c&ocirc;ng ty.</p>\r\n\r\n<p>Do chiến tranh t&agrave;n ph&aacute; nh&agrave; m&aacute;y, Soichiro Honda đ&atilde; phải b&aacute;n hết phần c&ograve;n lại của c&ocirc;ng ty cho Toyota với gi&aacute; 450.000 y&ecirc;n (98 triệu đồng) v&agrave; sử dụng số tiền thu được để th&agrave;nh lập Viện nghi&ecirc;n cứu kỹ thuật Honda với một đội ngũ ban đầu chỉ 12 người. Họ chế tạo v&agrave; b&aacute;n ra xe đạp cơ giới với nguồn cung cấp l&agrave; 500 động cơ Tohatsu 50cc 2 th&igrave; hoặc m&aacute;y ph&aacute;t điện hướng t&acirc;m. Khi hết động cơ, Honda bắt đầu chế tạo bản sao động cơ Tohatsu của ri&ecirc;ng m&igrave;nh.</p>\r\n\r\n<h2><strong>1949</strong></h2>\r\n\r\n<p><img alt=\"Thương hiệu ô tô Honda Motor chập chững ra đời.\" src=\"https://img1.oto.com.vn/2020/04/29/8RgE0bMU/lich-su-va-nguon-goc-o-to-honda-cua-nuoc-nao-oto-c-0845.jpg\" title=\"Thương hiệu ô tô Honda Motor chập chững ra đời\" /></p>\r\n\r\n<p><em>Thương hiệu &ocirc; t&ocirc; Honda Motor chập chững ra đời.</em></p>\r\n\r\n<p>Năm 1949, Viện nghi&ecirc;n cứu kỹ thuật của Honda đ&atilde; c&oacute; đủ tiền để trở th&agrave;nh Honda Motor. Gần như c&ugrave;ng l&uacute;c đ&oacute;, Honda thu&ecirc; kỹ sư Kihachiro Kawashima v&agrave; Takeo Fujisawa để hỗ trợ mặt kinh doanh v&agrave; tiếp thị. Sự hợp t&aacute;c chặt chẽ n&agrave;y đ&atilde; gi&uacute;p c&ocirc;ng ty ph&aacute;t triển mạnh. Mẫu xe m&aacute;y ho&agrave;n chỉnh đầu ti&ecirc;n c&oacute; cả khung v&agrave; động cơ do Honda sản xuất l&agrave; 1949 D type.</p>\r\n\r\n<h2><strong>1964</strong></h2>\r\n\r\n<p><img alt=\"Thương hiệu ô tô Honda tiến đến thị trường 4 bánh.\" src=\"https://img1.oto.com.vn/2020/04/29/8RgE0bMU/lich-su-va-nguon-goc-o-to-honda-cua-nuoc-nao-oto-c-bafc.jpg\" title=\"Thương hiệu ô tô Honda tiến đến thị trường 4 bánh\" /></p>\r\n\r\n<p><em>Thương hiệu &ocirc; t&ocirc; Honda tiến đến thị trường 4 b&aacute;nh.</em></p>\r\n\r\n<p>Honda Motor ph&aacute;t triển trong một thời gian ngắn để trở th&agrave;nh nh&agrave; sản xuất xe m&aacute;y lớn nhất thế giới v&agrave;o năm 1964. Mẫu xe &ocirc; t&ocirc; phi&ecirc;n bản sản xuất đầu ti&ecirc;n của Honda l&agrave; b&aacute;n tải mini chạy bằng động cơ xăng cỡ nhỏ 356 cc. Trong những năm 70, Honda tiếp tục ph&aacute;t triển c&aacute;c d&ograve;ng xe mới v&agrave; mở rộng tầm nh&igrave;n. Honda đ&atilde; xuất khẩu được Civic sang Mỹ. Mẫu xe tiết kiệm nhi&ecirc;n liệu n&agrave;y đ&uacute;ng l&agrave; những g&igrave; kh&aacute;ch h&agrave;ng Mỹ cần khi diễn ra cuộc khủng hoảng năng lượng v&agrave; gi&aacute; xăng tăng vọt.</p>\r\n\r\n<h2><strong>1979 - 1984</strong></h2>\r\n\r\n<p><img alt=\"Thương hiệu ô tô Honda đa dạng hóa dòng sản phẩm.\" src=\"https://img1.oto.com.vn/2020/04/29/8RgE0bMU/lich-su-va-nguon-goc-o-to-honda-cua-nuoc-nao-oto-c-887b.jpg\" title=\"Thương hiệu ô tô Honda đa dạng hóa dòng sản phẩm\" /></p>\r\n\r\n<p>QUẢNG C&Aacute;O<iframe height=\"600\" id=\"iframe-camp-rectanglemiddetail\" src=\"https://oto.com.vn/campaign-bn-iframe?pageID=21&amp;localtionID=33&amp;makeID=28&amp;modelId=&amp;width=360&amp;height=600&amp;bannerTemplate=RectangleMidDetail&amp;bannerTemplateType=0&amp;classProperty=&amp;platform=0&amp;isLargestContentPaint=0&amp;classProperty=&amp;initVideo=1&amp;\" width=\"360\"></iframe></p>\r\n\r\n<p><em>Thương hiệu &ocirc; t&ocirc; Honda đa dạng h&oacute;a d&ograve;ng sản phẩm.</em></p>\r\n\r\n<p>Một giai đoạn mới trong lịch sử của Honda đ&atilde; mở ra khi trở th&agrave;nh nh&agrave; sản xuất &ocirc; t&ocirc; Nhật Bản đầu ti&ecirc;n mở cơ sở sản xuất tại Mỹ v&agrave;o năm 1979. Năm 1984, Honda CRX HF l&agrave; mẫu xe đầu ti&ecirc;n tr&ecirc;n thế giới đạt được đ&aacute;nh gi&aacute; tiết kiệm nhi&ecirc;n liệu 4,7 l&iacute;t/100km từ EPA. Honda đ&atilde; l&agrave;m việc để mở rộng d&ograve;ng sản phẩm của m&igrave;nh v&agrave; xuất khẩu xe sang nhiều nước tr&ecirc;n thế giới. Honda đ&atilde; giới thiệu thương hiệu Acura trong nỗ lực gi&agrave;nh chỗ đứng tr&ecirc;n thị trường xe hạng sang. Sau khi người s&aacute;ng lập Soichiro Honda qua đời trong những năm đầu 90, gi&aacute;m đốc điều h&agrave;nh mới Kawamoto đ&atilde; h&agrave;nh động nhanh ch&oacute;ng để thay đổi văn h&oacute;a doanh nghiệp của Honda. Kế hoạch ph&aacute;t triển sản phẩm định hướng thị trường dẫn đến sự ra mắt của Odyssey v&agrave; CR-V thế hệ đầu ti&ecirc;n.</p>\r\n\r\n<ul>\r\n	<li><strong><a href=\"https://oto.com.vn/bang-gia-xe-o-to-honda-moi-nhat\" title=\"Bảng giá xe Honda\">Bảng gi&aacute; xe Honda</a></strong></li>\r\n</ul>\r\n\r\n<h2><strong>1992</strong></h2>\r\n\r\n<p>Từ năm 1992, Honda đ&atilde; trở th&agrave;nh một c&aacute;i t&ecirc;n quen thuộc trong ng&agrave;nh c&ocirc;ng nghiệp &ocirc; t&ocirc;. H&atilde;ng trở th&agrave;nh &ldquo;người đi đầu&rdquo; trong việc sản xuất &ocirc; t&ocirc; chất lượng m&agrave; người ti&ecirc;u d&ugrave;ng y&ecirc;u th&iacute;ch. Honda thậm ch&iacute; c&ograve;n ở vị tr&iacute; thứ 24 trong danh s&aacute;ch c&aacute;c thương hiệu gi&aacute; trị nhất của Forbes.</p>\r\n\r\n<h2><strong>1995</strong></h2>\r\n\r\n<p>L&agrave; một phần trong tầm nh&igrave;n của n&oacute; để tạo ra một tương lai di chuyển bền vững hơn, Honda đ&atilde; giới thiệu mẫu xe pin nhi&ecirc;n liệu Clarity đại diện cho c&ocirc;ng nghệ xe kh&ocirc;ng ph&aacute;t thải h&agrave;ng đầu. Honda Clarity chạy bằng hydro c&oacute; thể di chuyển l&ecirc;n đến 589km chỉ bằng một b&igrave;nh nhi&ecirc;n liệu duy nhất v&agrave; ph&aacute;t ra chỉ hơi nước.</p>\r\n\r\n<p><img alt=\"Thương hiệu ô tô Honda đạt được nhiều thành công cho đến nay.\" src=\"https://img1.oto.com.vn/2020/04/29/8RgE0bMU/lich-su-va-nguon-goc-o-to-honda-cua-nuoc-nao-oto-c-374a.jpg\" title=\"Thương hiệu ô tô Honda đạt được nhiều thành công cho đến nay\" /></p>\r\n\r\n<p>Thương hiệu &ocirc; t&ocirc; Honda đạt được nhiều th&agrave;nh c&ocirc;ng cho đến nay.</p>\r\n\r\n<h2><strong>2018</strong></h2>\r\n\r\n<p>Honda Accord thế hệ thứ mười l&agrave; một trong những mẫu xe phổ biến nhất tại Mỹ v&agrave; đ&atilde; gi&agrave;nh được giải thưởng xe hơi Bắc Mỹ của năm. Accord cũng l&agrave; mẫu xe đầu ti&ecirc;n của một nh&agrave; sản xuất &ocirc; t&ocirc; Nhật Bản được sản xuất tại Mỹ với sản lượng vượt qu&aacute; 11 triệu xe. Trong hơn 35 năm, Honda hiện đang hướng tới một mục ti&ecirc;u quan trọng l&agrave; giảm 30% lượng kh&iacute; thải CO2.</p>', 1, 0, 7, 1, 0, 0, 0, 'Advertisement\r\nLịch sử và nguồn gốc ô tô Honda', 'Advertisement\r\nLịch sử và nguồn gốc ô tô Honda', 'Advertisement\r\nLịch sử và nguồn gốc ô tô Honda', '2022-12-19 16:11:15', '2022-12-22 10:32:26');
INSERT INTO `articles` VALUES (8, 'Muốn rước Honda CR-V chơi Tết khách hàng phải bỏ thêm trăm triệu', 'muon-ruoc-honda-cr-v-choi-tet-khach-hang-phai-bo-them-tram-trieu', 23, 'Muốn rước Honda CR-V chơi Tết khách hàng phải bỏ thêm trăm triệu', '2022-12-19__honda-crv-2017-1.jpg', '<h1>Muốn rước Honda CR-V chơi Tết kh&aacute;ch h&agrave;ng phải bỏ th&ecirc;m trăm triệu</h1>\r\n\r\n<p>&nbsp;Thứ tư, 03/01/2018 | 16:02</p>\r\n\r\n<p><a href=\"https://autoexpress.vn/upload/autoexpress_news/2018/01/xe-doi-song/03-01/honda-crv-2017-1.jpg\" id=\"post-img-0\" rel=\"view_image_post_5348\" title=\"Muốn rước Honda CR-V chơi Tết khách hàng phải bỏ thêm trăm triệu\"><img alt=\"Muốn rước Honda CR-V chơi Tết khách hàng phải bỏ thêm trăm triệu\" src=\"https://autoexpress.vn/upload/autoexpress_news/2018/01/xe-doi-song/03-01/honda-crv-2017-1.jpg\" style=\"width:100%\" /></a></p>\r\n\r\n<p><em>Với số lượng c&oacute; hạn gần 700 chiếc Honda CR-V thế hệ mới đ&atilde; được th&ocirc;ng quan trong những ng&agrave;y cuối c&ugrave;ng của năm 2017 v&agrave; được b&aacute;n trước Tết. Đ&acirc;y cũng l&agrave; l&uacute;c kh&aacute;ch &quot;h&acirc;m mộ&quot; thương hiệu n&agrave;y lại được thưởng thức chi&ecirc;u b&aacute;n h&agrave;ng kh&ocirc;ng c&ograve;n xưa cũ.</em></p>\r\n\r\n<p>Ngay khi những h&igrave;nh ảnh đầu ti&ecirc;n về chiếc CR-V thế hệ mới ch&iacute;nh thức xuất hiện, t&ocirc;i đ&atilde; mong chờ được trải nghiệm kh&ocirc;ng gian tr&ecirc;n chiếc xe 5+2 n&agrave;y. Nhưng kh&ocirc;ng v&igrave; thế m&agrave; t&ocirc;i c&oacute; thể bỏ ra số tiền lớn cao hơn gi&aacute; b&aacute;n đề xuất để rước vợ 2 về sớm được v&igrave; t&ocirc;i ch&uacute;a gh&eacute;t kiểu &quot;con bu&ocirc;n chộp giật&quot; khi h&agrave;ng h&oacute;a khan hiếm.</p>\r\n\r\n<p>Vẫn biết phi&ecirc;n bản nhập khẩu được Honda mang về Việt Nam với ngoại thất bắt mắt hơn v&agrave; t&acirc;m l&yacute; chuộng xe nhập của kh&aacute;ch Việt nhưng cứ mỗi độ &quot;tết đến xu&acirc;n về&quot; th&igrave; b&agrave;i ca tăng gi&aacute;, &eacute;p gi&aacute; lại được diễn lại. Với khoảng gần 700 chiếc Honda CR-V mới đ&atilde; được th&ocirc;ng quan trong những ng&agrave;y cuối c&ugrave;ng của năm 2017 th&igrave; nhiều khả năng kh&aacute;ch h&agrave;ng c&oacute; thể sở hữu những chiếc CR-V ngay trước Tết Mậu Tuất 2018. Tuy nhi&ecirc;n nếu muốn lấy xe chơi Tết sẽ phải chịu mức gi&aacute; cao hơn so với thời điểm sau Tết khi m&agrave; lượng cung c&oacute; thể sẽ dồi d&agrave;o.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://autoexpress.vn/upload/autoexpress_news/2018/01/xe-doi-song/03-01/honda-crv-2017-2.jpg\" id=\"post-img-1\" rel=\"highlight5348\" title=\"Honda CR-V thế hệ mới bị ép giá khi khan hàng\"><img alt=\"Honda CR-V thế hệ mới bị ép giá khi khan hàng\" src=\"https://autoexpress.vn/upload/autoexpress_news/2018/01/xe-doi-song/03-01/honda-crv-2017-2.jpg\" title=\"Honda CR-V thế hệ mới bị ép giá khi khan hàng\" /></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Chả thế m&agrave; anh bạn t&ocirc;i ở Nam Từ Li&ecirc;m - H&agrave; Nội vừa cho hay: &quot;Anh c&oacute; đặt mua chiếc CR-V mới bản cao cấp nhất v&agrave; dự kiến sẽ được giao xe v&agrave;o th&aacute;ng 3/2018. Tuy nhi&ecirc;n mới đ&acirc;y nh&acirc;n vi&ecirc;n b&aacute;n h&agrave;ng tại Honda Mỹ Đ&igrave;nh đ&atilde; gọi điện v&agrave; th&ocirc;ng b&aacute;o đ&atilde; c&oacute; một lượng hạn chế Honda CR-V được nhập về nhưng nếu muốn lấy xe ngay gi&aacute; th&igrave; gi&aacute; b&aacute;n của xe l&agrave; 1,25 tỷ đồng thay v&igrave; mức gi&aacute; 1,1 tỷ đồng theo hợp đồng&quot;. C&aacute;i c&acirc;u chuyện mua xe tiền tỷ sao m&agrave; gian nan, vất vả đến vậy. Muốn lấy xe chơi tết kh&aacute;ch h&agrave;ng phải bỏ th&ecirc;m số tiền kh&ocirc;ng hề nhỏ v&igrave; l&yacute; do khan h&agrave;ng đồng nghĩa với việc kh&aacute;ch &quot;h&acirc;m mộ&quot; thương hiệu n&agrave;y lại được thưởng thức b&agrave;i ca&nbsp;&quot;&eacute;p gi&aacute;&quot;.</p>\r\n\r\n<p>T&acirc;m l&yacute; của đa số kh&aacute;ch h&agrave;ng muốn nhận xe sớm v&agrave; phần lớn trong số họ&nbsp;sẵn s&agrave;ng m&oacute;c hầu bao chi th&ecirc;m tiền để rước được &quot;vợ 2&quot; sớm về dinh. Đ&acirc;y cũng l&agrave; cơ hội để c&aacute;c đại l&yacute; v&agrave; nh&acirc;n vi&ecirc;n tha hồ mặc cả, l&agrave;m gi&aacute;. Với c&aacute; nh&acirc;n t&ocirc;i việc mua một chiếc xe &ocirc; t&ocirc; l&agrave; việc trọng đại, một t&agrave;i sản lớn vượt qua hẳn định nghĩa về phương tiện. Nhưng sẽ kh&ocirc;ng mua bằng mọi gi&aacute; v&agrave; thỏa hiệp với chi&ecirc;u thức b&aacute;n h&agrave;ng &quot;chộp giật&quot;. Tr&ecirc;n thị trường c&ograve;n rất nhiều lựa chọn kh&aacute;c c&ugrave;ng ph&acirc;n kh&uacute;c CUV 5 chỗ, h&atilde;y th&ocirc;ng th&aacute;i với việc xuống tiền của m&igrave;nh.</p>', 1, 0, 2, 1, 0, 0, 0, 'Muốn rước Honda CR-V chơi Tết khách hàng phải bỏ thêm trăm triệu', 'Muốn rước Honda CR-V chơi Tết khách hàng phải bỏ thêm trăm triệu', 'Muốn rước Honda CR-V chơi Tết khách hàng phải bỏ thêm trăm triệu', '2022-12-19 16:51:44', '2022-12-19 22:51:19');
INSERT INTO `articles` VALUES (9, 'TƯ VẤN - ĐÁNH GIÁ XE', 'tu-van---danh-gia-xe', 23, 'TƯ VẤN - ĐÁNH GIÁ XE', '2022-12-19__khu-vuc-trai-nghiem-phong-cach-song.jpg', '<h1>Toyota mang 7 mẫu xe mới đến Triển l&atilde;m &Ocirc; t&ocirc; Việt Nam 2022</h1>\r\n\r\n<p>&nbsp;Thứ tư, 26/10/2022 | 19:40</p>\r\n\r\n<p><a href=\"https://autoexpress.vn/upload/autoexpress_news/2022/26/toyota-lexus/khu-vuc-trai-nghiem-phong-cach-song.jpg\" id=\"post-img-0\" rel=\"view_image_post_6302\" title=\"Toyota mang 7 mẫu xe mới đến Triển lãm Ô tô Việt Nam 2022\"><img alt=\"Toyota mang 7 mẫu xe mới đến Triển lãm Ô tô Việt Nam 2022\" src=\"https://autoexpress.vn/upload/autoexpress_news/2022/26/toyota-lexus/khu-vuc-trai-nghiem-phong-cach-song.jpg\" style=\"width:100%\" /></a></p>\r\n\r\n<p><em>Tại Triển l&atilde;m &Ocirc; t&ocirc; Việt Nam 2022, Toyota Việt Nam chuyển m&igrave;nh đầy mới mẻ với c&aacute;c sản phẩm mới bao gồm c&aacute;c mẫu xe điện h&oacute;a, đại diện cho tầm nh&igrave;n Trung h&ograve;a Carbon v&agrave; mục ti&ecirc;u Ph&aacute;t triển bền vững to&agrave;n cầu.</em></p>\r\n\r\n<p>Tại Triển l&atilde;m năm nay, Toyota muốn khẳng định cam kết &ldquo;Move Your World&rdquo; bằng những trải nghiệm tuyệt vời trong từng g&oacute;c trưng b&agrave;y được thiết kế tinh tế với dải sản phẩm thế hệ mới v&agrave; c&aacute;c hoạt động tương t&aacute;c đầy th&uacute; vị:</p>\r\n\r\n<p>Khu vực trải nghiệm sản phẩm điện h&oacute;a: Nơi trưng b&agrave;y c&aacute;c mẫu xe điện h&oacute;a giảm ph&aacute;t thải kh&iacute; Carbon, thể hiện định hướng chuyển đổi của Toyota sang những d&ograve;ng xe xanh, th&acirc;n thiện với m&ocirc;i trường. Xe thuần điện sẽ l&agrave; tương lai kh&ocirc;ng xa, nhưng Hybrid vẫn l&agrave; giải ph&aacute;p thực tiễn trong điều kiện hiện tại.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://autoexpress.vn/upload/autoexpress_news/2022/26/toyota-lexus/ong-hiroyuki-ueda-va-ong-yoshiki-konishi-tai-gian-hang-toyota.jpg?1666824130922\" id=\"post-img-1\" rel=\"highlight6302\" title=\"ong-hiroyuki-ueda-va-ong-yoshiki-konishi-tai-gian-hang-toyota\"><img alt=\"ong-hiroyuki-ueda-va-ong-yoshiki-konishi-tai-gian-hang-toyota\" src=\"https://autoexpress.vn/upload/autoexpress_news/2022/26/toyota-lexus/ong-hiroyuki-ueda-va-ong-yoshiki-konishi-tai-gian-hang-toyota.jpg?1666824130922\" title=\"ong-hiroyuki-ueda-va-ong-yoshiki-konishi-tai-gian-hang-toyota\" /></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Khu vực trải nghiệm sản phẩm: Khẳng định sức s&aacute;ng tạo kh&ocirc;ng giới hạn với mẫu xe Vios được kho&aacute;c l&ecirc;n m&igrave;nh một diện mạo trẻ trung v&agrave; năng động, trong khi Avanza Premio được thiết kế như một tiệm c&agrave; ph&ecirc; di động, chắc chắn sẽ lưu lại ấn tượng kh&oacute; qu&ecirc;n cho kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p>Khu vực trải nghiệm phong c&aacute;ch sống: Trưng b&agrave;y mẫu xe SUV v&agrave; B-MPV gồm Veloz Cross, Corolla Cross v&agrave; Fortuner Legender - &ldquo;người bạn&rdquo; đồng h&agrave;nh ho&agrave;n hảo, đa sắc m&agrave;u cho h&agrave;nh tr&igrave;nh của mỗi c&aacute; nh&acirc;n v&agrave; gia đ&igrave;nh.</p>\r\n\r\n<p>Tại thị trường Việt Nam, d&ograve;ng xe Toyota Hybrid hiện được xem l&agrave; giải ph&aacute;p thiết thực nhất trong điều kiện hiện tại nhờ kết hợp 2 động cơ xăng v&agrave; điện mang đến khả năng tiết kiệm nhi&ecirc;n liệu, th&acirc;n thiện m&ocirc;i trường, vận h&agrave;nh mạnh mẽ v&agrave; y&ecirc;n tĩnh.</p>\r\n\r\n<p>Tại Triển l&atilde;m lần n&agrave;y, Toyota trưng b&agrave;y c&aacute;c mẫu xe điện h&oacute;a, minh chứng cho những nỗ lực của Toyota trong việc giảm thiểu ph&aacute;t thải kh&iacute; Carbon, qua đ&oacute; tạo ra tương lai ph&aacute;t triển bền vững bằng nguồn năng lượng xanh. bZ4X &ndash; mẫu xe SUV thuần điện tương lai với khả năng vận h&agrave;nh &ecirc;m &aacute;i, động cơ mạnh mẽ v&agrave; cảm gi&aacute;c l&aacute;i tuyệt vời. bZ4X được xem l&agrave; bước đi đầu ti&ecirc;n trong chiến lược ph&aacute;t triển th&ecirc;m c&aacute;c t&ugrave;y chọn xe thuần điện của Toyota to&agrave;n cầu hướng tới tương lai.</p>\r\n\r\n<p>Toyota cũng h&eacute; lộ việc sản xuất v&agrave; lắp r&aacute;p mẫu xe Veloz Cross v&agrave; Avanza Premio tại Việt Nam từ th&aacute;ng 12/2022 với mức gi&aacute; kh&ocirc;ng đổi. Tại triển l&atilde;m lần n&agrave;y, Toyota mang tới cho kh&aacute;ch h&agrave;ng cơ hội chi&ecirc;m ngưỡng mẫu xe Veloz Cross được sản xuất v&agrave; lắp r&aacute;p ho&agrave;n to&agrave;n tại Việt Nam. Với việc chuyển đổi nguồn cung sang sản xuất, lắp r&aacute;p trong nước, Toyota tin rằng sẽ chủ động hơn trong việc cải thiện nguồn cung để đ&aacute;p ứng nhu cầu của kh&aacute;ch h&agrave;ng. C&ugrave;ng với đ&oacute;, Toyota cũng sẽ d&agrave;nh tặng g&oacute;i khuyến m&atilde;i &ldquo;gia hạn bảo h&agrave;nh 2 năm hoặc 50.000km (t&ugrave;y thuộc điều kiện n&agrave;o đến trước)&rdquo; cho những kh&aacute;ch h&agrave;ng mua mẫu xe Veloz Cross v&agrave; Avanza Premio sản xuất lắp r&aacute;p trong nước từ th&aacute;ng 12/2022 đến hết ng&agrave;y 31/12/2023 như một th&ocirc;ng điệp v&agrave; cam kết chất lượng mạnh mẽ từ Toyota với kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://autoexpress.vn/upload/autoexpress_news/2022/26/toyota-lexus/ong-hiroyuki-ueda---tong-giam-doc-cong-ty-toyota-viet-nam-phat-bieu-tai-trien-lam-o-to-viet-nam.jpg?1666824158130\" id=\"post-img-2\" rel=\"highlight6302\" title=\"ong-hiroyuki-ueda---tong-giam-doc-cong-ty-toyota-viet-nam-phat-bieu-tai-trien-lam-o-to-viet-nam\"><img alt=\"ong-hiroyuki-ueda---tong-giam-doc-cong-ty-toyota-viet-nam-phat-bieu-tai-trien-lam-o-to-viet-nam\" src=\"https://autoexpress.vn/upload/autoexpress_news/2022/26/toyota-lexus/ong-hiroyuki-ueda---tong-giam-doc-cong-ty-toyota-viet-nam-phat-bieu-tai-trien-lam-o-to-viet-nam.jpg?1666824158130\" title=\"ong-hiroyuki-ueda---tong-giam-doc-cong-ty-toyota-viet-nam-phat-bieu-tai-trien-lam-o-to-viet-nam\" /></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Với việc ra mắt th&ecirc;m một mẫu xe lắp r&aacute;p trong nước, số lượng nh&agrave; cung cấp linh, phụ kiện của Toyota đ&atilde; tăng th&ecirc;m 11 nh&agrave; cung cấp l&ecirc;n con số 57 (trong đ&oacute;, số lượng nh&agrave; cung cấp thuần Việt tăng từ 6 l&ecirc;n 12) v&agrave; tổng số linh kiện nội địa h&oacute;a đạt 740 sản phẩm c&aacute;c loại (tăng 16 sản phẩm).</p>\r\n\r\n<p>Với mong muốn n&acirc;ng tầm trải nghiệm kh&aacute;ch h&agrave;ng trong từng điểm chạm cảm x&uacute;c, Toyota đang v&agrave; sẽ cung cấp cho kh&aacute;ch h&agrave;ng những g&oacute;i giải ph&aacute;p dịch vụ v&agrave; chuỗi gi&aacute; trị gia tăng tổng thể, to&agrave;n diện trong suốt qu&aacute; tr&igrave;nh sử dụng xe như Phụ kiện ch&iacute;nh h&atilde;ng Toyota, Bảo hiểm Toyota, g&oacute;i hỗ trợ T&agrave;i ch&iacute;nh Toyota (TFS), kinh doanh xe đ&atilde; qua sử dụng (Toyota Sure) &hellip; qua đ&oacute; hỗ trợ qu&aacute; tr&igrave;nh di chuyển, sở hữu xe của kh&aacute;ch h&agrave;ng, mang đến sự an t&acirc;m khi sử dụng sản phẩm v&agrave; dịch vụ của Toyota. Tại gian h&agrave;ng Toyota, kh&aacute;ch h&agrave;ng c&oacute; thể t&igrave;m hiểu, kh&aacute;m ph&aacute; những giải ph&aacute;p tổng thể n&agrave;y tại Khu vực xanh d&agrave;nh cho Kh&aacute;ch h&agrave;ng.</p>', 1, 0, 2, 1, 0, 0, 0, 'TƯ VẤN - ĐÁNH GIÁ XE', 'TƯ VẤN - ĐÁNH GIÁ XE', 'TƯ VẤN - ĐÁNH GIÁ XE', '2022-12-19 16:53:26', '2022-12-19 16:55:05');
INSERT INTO `articles` VALUES (10, 'Lịch sử của Hyundai', 'lich-su-cua-hyundai', 23, 'Lịch sử của Hyundai', '2022-12-25__z3987910706891-08f7a809582b54b12c34d6d56de13d7f.jpg', '<h1>Lịch sử của Hyundai v&agrave; d&ograve;ng xe tải huyền Thoại.</h1>\r\n\r\n<p>Tập đo&agrave;n &ocirc; t&ocirc; Hyundai hay c&ograve;n c&oacute; t&ecirc;n tr&ecirc;n trường quốc tế l&agrave; Hyundai Motor Company, đ&acirc;y l&agrave; h&atilde;ng xe &ocirc; t&ocirc; c&oacute; doanh số b&aacute;n h&agrave;ng cao thứ 5 tr&ecirc;n thế giới v&agrave; h&atilde;ng xe lớn nhất H&agrave;n Quốc v&agrave; c&oacute; trụ sở đặt tại Seoul, H&agrave;n Quốc.&nbsp;<a href=\"https://xetaihyundai.vn/\">Hyundai</a>&nbsp;được th&agrave;nh lập v&agrave;o năm 1967 bởi &ocirc;ng Chung Ju-Yung sau đ&oacute; c&ocirc;ng ty nhanh ch&oacute;ng được x&acirc;y dựng với sự hợp t&aacute;c c&ugrave;ng một trong những nh&agrave; sản xuất &ocirc; t&ocirc; l&acirc;u đời nhất trong ng&agrave;nh c&ocirc;ng nghiệp &ocirc; t&ocirc; ch&iacute;nh l&agrave; Ford, v&agrave;o năm 1968 hai b&ecirc;n đ&atilde; k&yacute; hợp đồng li&ecirc;n doanh trong hai năm để chia sẻ c&ocirc;ng nghệ lắp r&aacute;p v&agrave; cho ra đời mẫu xe đầu ti&ecirc;n mang t&ecirc;n Cortina.</p>\r\n\r\n<p><img alt=\"\" src=\"http://xetaihyundai.vn/Editor/assets/dt12.jpg\" title=\"\" /></p>\r\n\r\n<p><br />\r\nNăm 1975, với sự hỗ trợ về mặt c&ocirc;ng nghệ của c&ocirc;ng ty Mitsubishi đến từ Nhật Bản kết hợp với sự thiết kế của Giorgio Giugiaro theo phong c&aacute;ch &Yacute;, Hyundai đ&atilde; tự thiết kế v&agrave; chế tạo th&agrave;nh c&ocirc;ng tại H&agrave;n Quốc c&oacute; t&ecirc;n l&agrave; Pony v&agrave; năm sau đ&oacute; Pony được xuất khẩu ra thị trường nước ngo&agrave;i.</p>\r\n\r\n<p><img alt=\"\" src=\"http://xetaihyundai.vn/Editor/assets/dt13.jpg\" title=\"\" /></p>\r\n\r\n<p><br />\r\nHyundai th&acirc;m nhập v&agrave;o thị trường Mỹ v&agrave;o năm 1986 bằng việc tung ra d&ograve;ng xe Excel hạng nhỏ v&agrave; kết quả kh&ocirc;ng ngờ l&agrave; d&ograve;ng xe n&agrave;y đ&atilde; đưa doanh số của Hyundai l&ecirc;n đến 100,000 chiếc được ti&ecirc;u thụ tại Mỹ trong bảy th&aacute;ng đầu ti&ecirc;n kể từ ng&agrave;y ra mắt kh&ocirc;ng những vậy, Excel được xếp v&agrave;o top &quot;10 xe được ưa chuộng nhất&rdquo; do tạp ch&iacute; Fortune b&igrave;nh chọn.</p>\r\n\r\n<p><img alt=\"\" src=\"http://xetaihyundai.vn/Editor/assets/dt14.jpg\" title=\"\" /></p>\r\n\r\n<p>Mẫu Excel m&agrave; Hyundai đ&atilde; đưa ra thị trường Mĩ năm 1986</p>\r\n\r\n<p><br />\r\nNăm 1985, Hyundai bắt đầu sản xuất c&aacute;c loại xe sử dụng c&ocirc;ng nghệ ch&iacute;nh h&atilde;ng v&agrave; d&ograve;ng xe hạng trung mang t&ecirc;n Sonata l&agrave; th&agrave;nh quả đầu ti&ecirc;n của sự nỗ lực n&agrave;y.<br />\r\n<br />\r\n<img alt=\"\" src=\"http://xetaihyundai.vn/Editor/assets/dt15.jpg\" title=\"\" /><img alt=\"\" src=\"http://xetaihyundai.vn/Editor/assets/dt16.jpg\" title=\"\" /><br />\r\nSonata ng&agrave;y ấy 1985 Sonata b&acirc;y giờ 2015<br />\r\n<br />\r\nNăm 1991, Hyundai đ&atilde; mở đường độc quyền c&ocirc;ng nghệ cho m&igrave;nh khi ph&aacute;t triển th&agrave;nh c&ocirc;ng động cơ xăng, I4 Alpha v&agrave; c&oacute; hộp truyền động.<br />\r\n<br />\r\nNăm 1996, Hyundai Motors India Limited được th&agrave;nh lập, đặt xưởng sản xuất tại Irrungattukatoi gần Chennai, Ấn Độ.<br />\r\n<br />\r\nNăm 1998 Huyndai đ&atilde; mua lại nh&atilde;n hiệu &ocirc; t&ocirc; Kia, nhờ đ&oacute; m&agrave; h&atilde;ng xe n&agrave;y đ&atilde; chiếm được thị phần lớn, trong khi số lượng sản phẩm của Hyudai &iacute;t hơn so với c&aacute;c nh&agrave; sản xuất &ocirc; t&ocirc; kh&aacute;c, từ đ&oacute; Hyundai được biết đến nhờ sản xuất những loại xe c&oacute; gi&aacute; trị cao nhưng gi&aacute; cả hợp l&yacute;.<br />\r\n<br />\r\nMột năm sau, 1999, Chung Ju Yung quyết định trao quyền l&atilde;nh đạo Hyndai Motor cho con trai m&igrave;nh l&agrave; Chung Mong Koo. Hyndai Motor Group, c&ocirc;ng ty mẹ của Hyundai đ&atilde; đầu tư rất nhiều v&agrave;o việc ph&aacute;t triển chất lượng, mẫu m&atilde;, tăng cường sản xuất v&agrave; nghi&ecirc;n cứu d&agrave;i hạn cho ng&agrave;nh &ocirc;t&ocirc; n&oacute;i ri&ecirc;ng. Tập đo&agrave;n đ&atilde; tăng thời gian bảo h&agrave;nh l&ecirc;n tới 10 năm hay 160.000 km đối với xe b&aacute;n tại Mỹ, đồng thời ph&aacute;t động chiến dịch marketing quy m&ocirc; lớn.<br />\r\n<br />\r\nTừ năm 2002 Hyndai cũng l&agrave; một trong những nh&agrave; t&agrave;i trợ ch&iacute;nh thức cho giải World Cup của FIFA.<br />\r\n<br />\r\nTrong cuộc khảo s&aacute;t về chất lượng xe hơi của tổ chức J.D. Power and Associates năm 2004, Hyundai đ&atilde; vượt qua nhiều đối thủ tiếng tăm v&agrave; giữ vị tr&iacute; thứ 2 v&agrave; hiện nay Hyndai nằm trong top 100 thương hiệu &ocirc;t&ocirc; lớn nhất thế giới.<br />\r\n<br />\r\nNăm 2006 &ocirc;ng Chung Mong Koo bị văn ph&ograve;ng c&ocirc;ng tố tối cao Seoul khởi tố v&igrave; tội tham &ocirc; 100 tỉ Won (106 triệu đ&ocirc; la Mĩ) từ Hyundai để lập quỹ đen. &Ocirc;ng bị bắt v&agrave;o ng&agrave;y 28 th&aacute;ng<br />\r\n<br />\r\n4 năm 2006 v&agrave; bị kết tội tham &ocirc; v&agrave; c&oacute; h&agrave;nh vi tham nhũng kh&aacute;c v&agrave; bị kết &aacute;n 3 năm t&ugrave; v&agrave;o ng&agrave;y 5 th&aacute;ng 2 năm 2007. V&agrave; sau vụ việc đ&oacute;, &ocirc;ng Kim Dong-jin được bổ nhiệm giữ chức Chủ tịch ki&ecirc;m Gi&aacute;m đốc điều h&agrave;nh c&ocirc;ng ty.</p>\r\n\r\n<p><img alt=\"\" src=\"http://xetaihyundai.vn/Editor/assets/dt17.jpg\" title=\"\" /></p>\r\n\r\n<p>&Ocirc;ng Chung Mong Koo l&atilde;nh đạo một thời của Hyundai</p>\r\n\r\n<p><br />\r\nSau scandal của &ocirc;ng Chung Mong Koo, Hyundai vẫn kh&ocirc;ng bị ch&ugrave;ng bước v&agrave; vẫn hoạt động để ph&aacute;t triển c&ocirc;ng ty kh&ocirc;ng ngừng v&agrave; theo khảo s&aacute;t của Interbrand and BusinessWeek, Hyundai đứng thứ 72 trong danh s&aacute;ch C&aacute;c thương hiệu tốt nhất thế giới năm 2007 với trị gi&aacute; thương hiệu ước t&iacute;nh l&agrave; 4,5 tỉ USD, Sự xuất hiện của d&ograve;ng SUV cỡ trung mang t&ecirc;n Santa Fe năm 2007 đ&atilde; đem đến cho Hyundai th&agrave;nh c&ocirc;ng vang dội v&agrave; gi&agrave;nh giải thưởng &quot;2007 Top Safety Pick&rdquo; của<br />\r\n<br />\r\nIIHS.<br />\r\n<br />\r\nTại triển l&atilde;m &ocirc;t&ocirc; quốc tế Bắc Mỹ 2008, Hyundai đ&atilde; tr&igrave;nh l&agrave;ng model Hyundai Genesis Coupe chủ động cầu sau v&agrave; được b&aacute;n tại c&aacute;c đai l&yacute; tr&ecirc;n H&agrave;n Quốc, cho đến khoảng 1 năm sau th&igrave; xe đ&atilde; c&oacute; mặt tại c&aacute;i đại l&yacute; Hyundai tr&ecirc;n đất nước Cờ Hoa.</p>\r\n\r\n<p><img alt=\"\" src=\"http://xetaihyundai.vn/Editor/assets/dt18.jpg\" title=\"\" /></p>\r\n\r\n<p>Genesis Coupe mẫu xe thể thao hai cửa của Huyndai</p>\r\n\r\n<p><br />\r\nNăm 2009 Hyundai ra mắt sản phẩm mang t&ecirc;n Avante tại Việt Nam để cạnh tranh c&aacute;c ph&acirc;n kh&uacute;c ngang tầm của h&atilde;ng kh&aacute;c m&agrave; khi ấy Toyota Vios được xem l&agrave; đối thủ cạnh tranh lớn nhất tại thị trường nước ta nhưng kết quả kh&ocirc;ng ngờ khi xe Avante đến tay người d&ugrave;ng v&agrave; nhận được sự đ&aacute;nh gi&aacute; cao c&oacute; thể so s&aacute;nh với mẫu Corolla Altis của h&atilde;ng Toyota.</p>\r\n\r\n<p><img alt=\"\" src=\"http://xetaihyundai.vn/Editor/assets/dt19.jpg\" title=\"\" /></p>\r\n\r\n<p>Avante 2009 l&agrave; đối thủ cạnh tranh với những h&atilde;ng xe kh&aacute;c</p>\r\n\r\n<p><br />\r\nĐến năm 2011, Hyundai được biết đến l&agrave; nh&agrave; sản xuất &ocirc; t&ocirc; lớn nhất H&agrave;n Quốc, đứng thứ hai tại Ch&acirc;u &Aacute; (sau Toyota) v&agrave; đứng thứ tư tr&ecirc;n thế giới (sau GM, Volkswagen v&agrave; Toyota).<br />\r\n<br />\r\nNăm 2014 với thiết kế theo xu hướng to&agrave;n cầu l&uacute;c bấy giờ l&agrave; d&ograve;ng xe cỡ nhỏ, Hyudai dựa tr&ecirc;n đ&oacute; đ&atilde; giới thiệu th&ecirc;m mẫu i20 tại thị trường Ch&acirc;u &Aacute;, thể hiện h&atilde;ng xe n&agrave;y lu&ocirc;n nắm bắt được xu thế thị trường to&agrave;n cầu.<br />\r\n<br />\r\nT&iacute;nh đến thời điểm hiện tại, Hyudai trong nước đ&atilde; c&oacute; gần h&agrave;ng chục d&ograve;ng xe &ocirc; t&ocirc; du lịch như: I10, I20, Accent, Avante, Tucson, Santa Fe, Sonata, Genesis,&hellip; v&agrave; những d&ograve;ng xe tải như: H100, HD65, HD72, HD78, HD120,... Đi c&ugrave;ng đ&oacute; l&agrave; những phi&ecirc;n bản v&agrave; option kh&aacute;c nhau để kh&aacute;c h&agrave;ng c&oacute; nhiều lựa chọn hơn, mang đến cho h&atilde;ng Hyundai c&oacute; nhiều cơ hội để cạnh tranh với c&aacute;c &quot;&ocirc;ng lớn&rdquo; trong c&ocirc;ng nghiệp &ocirc; t&ocirc; kh&aacute;c.<br />\r\n<br />\r\nKhu vực kinh doanh của Hyundai cũng rộng khắp thế giới như:<br />\r\n<br />\r\nBắc Mĩ: Hoa K&igrave;, Canada, Mexico, Panama v&agrave; Cộng h&ograve;a Dominica.<br />\r\n<br />\r\nNam Mĩ: Brazil.<br />\r\n<br />\r\nCh&acirc;u &Aacute;: Trung Hoa, Ấn Độ, Nhật, Philippine.<br />\r\n<br />\r\nCh&acirc;u &Acirc;u: Đức, Cộng H&ograve;a Czech, Nga, Thổ Nhĩ Kỳ.<br />\r\n<br />\r\nCh&acirc;u Phi: Nam Phi, Ai Cập, Libya.<br />\r\n<br />\r\nCh&acirc;u Đại Dương: &Uacute;c, New Zealand.<br />\r\n<br />\r\nNhững chiếc xe mang thương hiệu Hyundai được b&aacute;n tại 193 quốc gia th&ocirc;ng qua 5.000 đại l&yacute; v&agrave; showroom. Theo nghi&ecirc;n cứu của Automotive News về doanh số to&agrave;n cầu của c&aacute;c h&atilde;ng th&igrave; Hyundai xếp thứ 5, vượt qua cả Nissan, Honda v&agrave; nhiều thương hiệu nổi tiếng kh&aacute;c với 3.715.096 xe trong năm 2005. Sức mạnh thương hiệu của Hyundai ng&agrave;y c&agrave;ng lớn nhưng để được người ti&ecirc;u d&ugrave;ng ưa chuộng, Hyundai đ&atilde; phải nỗ lực kh&ocirc;ng ngừng trong việc nghi&ecirc;n cứu cải tiến chất lượng sản phẩm v&agrave; th&agrave;nh c&ocirc;ng đạt được l&agrave; kết quả tất yếu của sự nỗ lực n&agrave;y.</p>', 1, 0, 2, 1, 0, 0, 0, 'Lịch sử của Hyundai', 'Lịch sử của Hyundai', 'Lịch sử của Hyundai', '2022-12-24 11:21:25', '2022-12-25 20:24:16');

-- ----------------------------
-- Table structure for attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE `attribute_values`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `av_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `av_slug` char(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `av_attribute_id` int NULL DEFAULT 0,
  `av_price` int NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attribute_values
-- ----------------------------

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `atr_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `atr_type` tinyint NULL DEFAULT 1,
  `atr_menu_id` int NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of attributes
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
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  UNIQUE INDEX `cache_key_unique`(`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cache
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
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Trang chủ', 'Trang chủ', 'Homepage - Your Company Name', 0, 1, 1, '', '', '', '', '', '', ':menubar:', 'home', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1651682080);
INSERT INTO `category` VALUES (2, 'Logo', 'Logo', 'Logo', 0, 2, 1, '', ' ', '', '', 'logo/', '', ':logosite:', 'logo', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, ' ', '', 1608698050);
INSERT INTO `category` VALUES (3, 'SlideHome', 'SlideHome', 'SlideHome', 0, 3, 1, '', '', '', '', 'slidehome/', '', ':slideshow:', 'logo', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1608698090);
INSERT INTO `category` VALUES (4, 'SlideHomeMobile', 'SlideHomeMobile', 'SlideHomeMobile', 0, 4, 1, '', '', '', '', 'slidehomemobile/', '', ':slidemobile:', 'logo', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1608698103);
INSERT INTO `category` VALUES (5, 'Giới thiệu', 'Giới thiệu', 'Giới thiệu', 0, 5, 1, '/uploaded/gioi-thieu/23-Foods-That-Help-L.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', '', '', 'gioi-thieu/', '', ':menubar:hothome:', 'info', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', '', 1740390602);
INSERT INTO `category` VALUES (6, 'Tin tức ', 'Tin tức sự kiện', 'Tin tức', 0, 6, 1, '', '', '', '', 'tin-tuc/', '', ':menubar:', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Blanditiis animi autem consequuntur natus porro. Veritatis nisi iusto vitae sed, quae dolorum culpa vel quo officia esse necessitatibus distinctio quidem ipsa?', '', 1739508072);
INSERT INTO `category` VALUES (7, 'Liên hệ', 'Liên hệ', 'Liên hệ', 0, 7, 1, '', '', '', '', 'lien-he/', '', ':menubar:', 'contact', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1610560339);
INSERT INTO `category` VALUES (8, 'Tác giả', 'Tác giả', 'Tác giả', 0, 8, 1, '', '', '', '', 'tac-gia/', '', ':', 'tacgia', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1688008562);
INSERT INTO `category` VALUES (10, 'Dịch vụ ', 'service ', 'Dịch vụ', 0, 9, 1, '/uploaded/gioi-thieu/20201209_thuc-don-an-chay-giam-can-1.jpg', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '', '', 'dich-vu/', '', ':menubar:cathome:', 'service', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '', 1740390701);
INSERT INTO `category` VALUES (11, 'Sự kiện', 'event', 'Sự kiện', 0, 10, 1, '', '', '', '', 'su-kien/', '', ':menubar:', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739335725);
INSERT INTO `category` VALUES (21, 'Tư vấn', 'Tư vấn', 'Tư vấn', 10, 17, 1, '', '', '', '', 'tu-van/', '', ':', 'service', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739447728);
INSERT INTO `category` VALUES (13, 'Sản Phẩm', 'Product', 'Sản Phẩm', 0, 2, 1, '/uploaded/san-pham/img-2.jpg', 'stias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officii', '', '', 'san-pham/', '', ':menubar:cathome:', 'product', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739851460);
INSERT INTO `category` VALUES (15, 'Healthy meals tips', 'Healthy meals tips', 'Healthy meals tips', 0, 14, 1, '/uploaded/san-pham/12_grande.jpg', '', '', '', 'healthy-meals-tips/', '', ':inhome:', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739414690);
INSERT INTO `category` VALUES (16, 'Recipes Idea', 'Recipes Idea', 'Recipes Idea', 0, 15, 1, '/uploaded/san-pham/12_grande.jpg', '', '', '', 'recipes-idea/', '', ':inhome:', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739415004);
INSERT INTO `category` VALUES (17, 'HealThy excersire', 'HealThy excersire', 'HealThy excersire', 0, 16, 1, '/uploaded/san-pham/img-2.jpg', '', '', '', 'healthy-excersire/', '', ':inhome:', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739414742);
INSERT INTO `category` VALUES (23, 'Đội ngũ ', 'chuyên gia', 'Đội ngũ chuyên gia', 0, 18, 1, '', '', '', '', 'doi-ngu-chuyen-gia/', '', ':cathome:', 'info_leader', '0', '', '', NULL, '', 0, '', NULL, 21, 1, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '&aacute;dasdasdsadasd', '', 1739503571);
INSERT INTO `category` VALUES (24, 'Tin nổi bật', 'Tin nổi bật', 'Tin nổi bật', 0, 19, 1, '', '', '', '', 'tin-noi-bat/', '', ':hothome:', 'news', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, 'ters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsu', '', 1739507625);
INSERT INTO `category` VALUES (25, 'FAQ', 'Faq', 'FAQ', 0, 20, 1, '', '', '', '', 'faq/', '', ':cathome:', 'faq', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739510008);
INSERT INTO `category` VALUES (26, 'Danh mục sản phẩm 1', 'Danh mục sản phẩm 1', 'Danh mục sản phẩm 1', 13, 21, 1, '', '', '', '', 'danh-muc-san-pham-1/', '', ':inright:', 'product', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739851502);
INSERT INTO `category` VALUES (27, 'Danh mục sản phẩm 2', 'Danh mục sản phẩm 2', 'Danh mục sản phẩm 2', 13, 22, 1, '', '', '', '', 'danh-muc-san-pham-2/', '', ':', 'product', '0', '', '', NULL, '', 0, '', NULL, 21, 0, 0, 0, 0, 0, 0, '', NULL, 0, '', 0, '', 0, '', '', 1739851554);

-- ----------------------------
-- Table structure for commens
-- ----------------------------
DROP TABLE IF EXISTS `commens`;
CREATE TABLE `commens`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cm_content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cm_user_id` int NULL DEFAULT NULL,
  `cm_admin_id` int NULL DEFAULT NULL,
  `cm_parent_id` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of commens
-- ----------------------------

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `com_user_id` int NOT NULL,
  `com_user_type` tinyint NOT NULL DEFAULT 0,
  `com_source_id` int NOT NULL,
  `com_type` tinyint NOT NULL DEFAULT 0,
  `com_parent_id` int NOT NULL DEFAULT 0,
  `com_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comments_com_user_id_index`(`com_user_id`) USING BTREE,
  INDEX `comments_com_source_id_index`(`com_source_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (62, 23, 0, 123, 1, 0, 'Ô tô đẹp', '2022-12-25 12:35:22', '2022-12-25 12:35:30');
INSERT INTO `comments` VALUES (63, 23, 0, 118, 1, 0, 'Ô tô đẹp , nhân viên tư vấn nhiệt tình', '2022-12-25 12:47:16', '2022-12-25 12:47:27');
INSERT INTO `comments` VALUES (64, 23, 0, 123, 1, 0, 'Nhân viên thân thiện', '2022-12-25 14:38:23', '2022-12-25 14:38:35');
INSERT INTO `comments` VALUES (65, 23, 0, 122, 1, 0, 'Nhân viên tư vấn nhiệt tình', '2022-12-25 15:41:12', '2022-12-25 15:41:38');
INSERT INTO `comments` VALUES (66, 23, 0, 119, 1, 0, 'Nhân viên tư vấn nhiệt tình', '2022-12-26 08:57:39', '2022-12-26 08:57:50');
INSERT INTO `comments` VALUES (67, 23, 0, 119, 0, 0, 'Ô tô k đẹp', '2022-12-26 08:58:33', '2022-12-26 08:58:33');

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
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO `contact` VALUES (1, 'Thông tin liên hệ: Minh Nguyễn - Test', '\n<table width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">\n     <tr>\n               <td height=\"30\" colspan=\"2\" align=\"left\" valign=\"middle\"><strong> Thông tin liên hệ:  </strong></td>\n    </tr>\n             <tr>\n               <td height=\"30\" align=\"left\" style=\"width:200px;\" valign=\"middle\">Họ tên:</td>\n               <td height=\"30\" align=\"left\" valign=\"middle\"><strong>Minh Nguyễn - Test</strong></td>\n      </tr>\n        <tr>\n          <td height=\"30\" align=\"left\" valign=\"middle\">E-mail:</td>\n          <td height=\"30\" align=\"left\" valign=\"middle\"><strong>minhns@company.vn</strong></td>\n      </tr>\n      \n    <tr>\n          <td height=\"30\" align=\"left\" valign=\"middle\">Điện thoại:</td>\n          <td height=\"30\" align=\"left\" valign=\"middle\"><strong>0968675568</strong></td>\n      </tr>\n        <tr>\n          <td height=\"30\" align=\"left\" valign=\"middle\"> Địa chỉ:</td>\n          <td height=\"30\" align=\"left\" valign=\"middle\"><strong>Test chức nang</strong></td>\n      </tr>\n      <tr>\n               <td height=\"30\" align=\"left\" valign=\"middle\"><strong>Nội dung liên hệ</strong>: </td>\n               <td height=\"30\" align=\"left\" valign=\"middle\"><i>abc - </i></td>\n      </tr>\n</table>', 1, 'minhns@company.vn', NULL, NULL, 1681469105, NULL);

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
-- Table structure for guests
-- ----------------------------
DROP TABLE IF EXISTS `guests`;
CREATE TABLE `guests`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `g_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `g_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `g_phone` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `g_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `g_avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `g_status` tinyint NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `guests_g_email_unique`(`g_email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of guests
-- ----------------------------

-- ----------------------------
-- Table structure for image_products
-- ----------------------------
DROP TABLE IF EXISTS `image_products`;
CREATE TABLE `image_products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_product_id` int NOT NULL,
  `ip_image_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `image_products_ip_product_id_ip_image_id_unique`(`ip_product_id`, `ip_image_id`) USING BTREE,
  INDEX `image_products_ip_product_id_index`(`ip_product_id`) USING BTREE,
  INDEX `image_products_ip_image_id_index`(`ip_image_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of image_products
-- ----------------------------

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `im_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `im_slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `im_type` tinyint NULL DEFAULT 0,
  `im_active` tinyint NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `images_im_slug_index`(`im_slug`) USING BTREE,
  INDEX `images_im_type_index`(`im_type`) USING BTREE,
  INDEX `images_im_active_index`(`im_active`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of images
-- ----------------------------

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
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES (1, 'Plans Loriem 3 ', '', 3, 5, 8, 1, 1739419860, '/uploaded/gioi-thieu/ico1.png', '', '', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dolore aut neque eaque sit!', 'nutrition-plans.html', '', '', ' Nutrition Plans', ':', '[]', '', 1739505374);
INSERT INTO `info` VALUES (2, ' Nutrition Plans', '', 2, 5, 8, 1, 1739419860, '/uploaded/ico/info-icon3.png', '', '', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dolore aut neque eaque sit!', 'nutrition-plans.html', '', '', ' Nutrition Plans', ':', '[]', '', 1739505206);
INSERT INTO `info` VALUES (3, ' Nutrition Plans', '', 1, 5, 8, 1, 1739419860, '/uploaded/ico/info-icon2.png', '', '', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; eveniet iste quas qui dolor voluptate expedita natus officia minima, illum ducimus aliquam<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dolore aut neque eaque sit!', 'nutrition-plansasdas.html', '', '', ' Nutrition Plans', ':', '[]', '', 1739505331);
INSERT INTO `info` VALUES (5, 'Healthy Trainings', '', 6, 5, 8, 1, 1739505360, '/uploaded/gioi-thieu/ico3.png', '', '', 'Demo loriem palse case saec this is your Descriprion bla&nbsp;&nbsp;Veritatis nisi iusto vitae sed, quae dolorum culpa vel quo officia esse necessitatibus distinctio quidem ipsa?', 'healthy-trainings.html', '', '', 'fa-solid fa-heart', ':', '[]', '', 1739505575);
INSERT INTO `info` VALUES (6, 'Recipes Idea', '', 5, 5, 8, 1, 1739505360, '/uploaded/gioi-thieu/ico3.png', '', '', 'Demo loriem palse case saec this is your Descriprion bla&nbsp;&nbsp;Veritatis nisi iusto vitae sed, quae dolorum culpa vel quo officia esse necessitatibus distinctio quidem ipsa?', 'healthy-trainings.html', '', '', 'fa-solid fa-heart', ':', '[]', '', 1739505585);
INSERT INTO `info` VALUES (7, 'Description plastsce', '', 4, 5, 8, 1, 1739505360, '/uploaded/gioi-thieu/ico3.png', '', '', 'Demo loriem palse case saec this is your Descriprion bla&nbsp;&nbsp;Veritatis nisi iusto vitae sed, quae dolorum culpa vel quo officia esse necessitatibus distinctio quidem ipsa?', 'healthy-trainings.html', '', '', 'fa-solid fa-heart', ':', '[]', '', 1739505600);
INSERT INTO `info` VALUES (8, 'This is the page of infor', '', 7, 0, 8, 1, 1740111720, '/uploaded/gioi-thieu/23-Foods-That-Help-L.jpg', '', '', 'Donec iaculis lacus eget ligula tincidunt, vitae imperdiet enim cursus. Vivamus cursus odio eu consequat sollicitudin. Pellentesque ultrices leo eget justo luctus, sit amet fringilla nisi commodo. Suspendisse sagittis finibus accumsan. Maecenas sed felis nisl. Fusce et eros sapien. Ut eu tortor eget mauris pulvinar sollicitudin. Pellentesque metus augue, gravida sed venenatis quis, dapibus ac nisi. Sed blandit, lacus eu faucibus pellentesque, massa magna condimentum quam', 'this-is-the-page-of-infor.html', '', '', 'This is the page of infor', ':', '[{\"image_path\":\"\\/uploaded\\/gioi-thieu\\/23-Foods-That-Help-L.jpg\",\"image_name\":\"\",\"image_desc\":\"\",\"image_thu_tu\":\"\"},{\"image_path\":\"\\/uploaded\\/gioi-thieu\\/20201209_thuc-don-an-chay-giam-can-1.jpg\",\"image_name\":\"\",\"image_desc\":\"\",\"image_thu_tu\":\"\"}]', '', 1740112009);
INSERT INTO `info` VALUES (9, 'uet sagittis ipsum. Maecenas ultricies ', '', 8, 0, 8, 1, 1740112080, '/uploaded/gioi-thieu/20201209_thuc-don-an-chay-giam-can-1.jpg', '', '', 'uet sagittis ipsum. Maecenas ultricies&nbsp;uet sagittis ipsum. Maecenas ultricies&nbsp;uet sagittis ipsum. Maecenas ultricies&nbsp;', 'uet-sagittis-ipsum-maecenas-ultricies.html', '', '', 'uet sagittis ipsum. Maecenas ultricies ', ':', '[]', '', 1740112110);

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
-- Table structure for informations
-- ----------------------------
DROP TABLE IF EXISTS `informations`;
CREATE TABLE `informations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `if_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_phone` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_fax` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_email_drive` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'smtp',
  `if_email_host` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'smtp.gmail.com',
  `if_email_port` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '587',
  `if_email_encryption` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'tls',
  `if_time_job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_seo` tinyint NULL DEFAULT 0,
  `if_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_google` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_youtobe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_target` int NOT NULL,
  `if_email_send` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_email_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `if_google_map` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `informations_if_seo_index`(`if_seo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of informations
-- ----------------------------
INSERT INTO `informations` VALUES (1, 'Việt Phú Luxury', '0327292046', '0327292046', 'Tòa nhà FPT Polytechnic, P. Trịnh Văn Bô, Xuân Phương, Nam Từ Liêm, Hà Nội', 'thuanddph13844@fpt.edu.vn', 'smtp', 'smtp.gmail.com', '587', 'tls', '0-24', 0, '2022-12-12__310446850-682789546527023-461738096662946535-n-1.png', NULL, NULL, NULL, 120000000, 'thuanddph13844@fpt.edu.vn', '09072002', NULL, 'Website bán xe ô tô', NULL, NULL, NULL, '2022-12-12 10:50:04');

-- ----------------------------
-- Table structure for keyword_librarys
-- ----------------------------
DROP TABLE IF EXISTS `keyword_librarys`;
CREATE TABLE `keyword_librarys`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `kwl_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kwl_slug` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kwl_hit` int NULL DEFAULT 0,
  `kwl_admin_id` int NULL DEFAULT 0,
  `kwl_count_word` tinyint NULL DEFAULT 0,
  `kwl_active` tinyint NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `keyword_librarys_kwl_slug_unique`(`kwl_slug`) USING BTREE,
  INDEX `keyword_librarys_kwl_hit_index`(`kwl_hit`) USING BTREE,
  INDEX `keyword_librarys_kwl_active_index`(`kwl_active`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of keyword_librarys
-- ----------------------------

-- ----------------------------
-- Table structure for keyword_temps
-- ----------------------------
DROP TABLE IF EXISTS `keyword_temps`;
CREATE TABLE `keyword_temps`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `kt_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kt_slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `kt_active` tinyint NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `keyword_temps_kt_slug_unique`(`kt_slug`) USING BTREE,
  INDEX `keyword_temps_kt_active_index`(`kt_active`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of keyword_temps
-- ----------------------------

-- ----------------------------
-- Table structure for keywords
-- ----------------------------
DROP TABLE IF EXISTS `keywords`;
CREATE TABLE `keywords`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `k_name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `k_name_slug` char(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `k_hit` int NULL DEFAULT 0,
  `k_active` tinyint NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `keywords_k_name_slug_unique`(`k_name_slug`) USING BTREE,
  INDEX `keywords_k_active_index`(`k_active`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of keywords
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
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logo
-- ----------------------------
INSERT INTO `logo` VALUES (1, 2, 'LogoSite', '/uploaded/logo/logo.png', '', 1610585460, 1, 1, '', '', '', '', 0, 0, 8, ':');
INSERT INTO `logo` VALUES (2, 3, 'Lorem ipsum dolor sit amet', '/uploaded/slideshow/item1.jpg', '', 1610585460, 2, 1, '', '', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales.', 0, 0, 8, ':');
INSERT INTO `logo` VALUES (3, 4, 'SlideMobile01', '/uploaded/slideshow/item1.jpg', '', 1610585460, 3, 1, '', '', '', '', 0, 0, 8, ':');
INSERT INTO `logo` VALUES (4, 0, 'slide2', '/uploaded/slideshow/item4.jpg', '', 1739334060, 4, 1, '', '', '', '', 0, 0, 8, ':3:');
INSERT INTO `logo` VALUES (5, 0, 'slide3', '/uploaded/slideshow/item5.png', '', 1739334120, 5, 1, '', '', '', '', 0, 0, 8, ':3:');

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
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `m_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `m_slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `m_parent_id` tinyint NULL DEFAULT 0,
  `m_type` tinyint NULL DEFAULT 0,
  `m_active` tinyint NULL DEFAULT 1,
  `m_hot` tinyint NULL DEFAULT 0,
  `m_sort` tinyint NULL DEFAULT 0,
  `m_type_count` tinyint NULL DEFAULT 0,
  `m_type_seo` tinyint NULL DEFAULT 1,
  `m_avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `m_banner` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `m_title_seo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `m_keyword_seo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `m_description_seo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `m_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menus_m_parent_id_index`(`m_parent_id`) USING BTREE,
  INDEX `menus_m_type_index`(`m_type`) USING BTREE,
  INDEX `menus_m_active_index`(`m_active`) USING BTREE,
  INDEX `menus_m_type_seo_index`(`m_type_seo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (2, 'Hyundai Elantra', 'hyundai-elantra', 3, 2, 1, 1, NULL, 0, 0, NULL, NULL, 'Hyundai Elantra', 'Hyundai Elantra', 'Hyundai Elantra', '<p>Hyundai Elantra</p>', NULL, '2021-12-13 23:43:51');
INSERT INTO `menus` VALUES (6, 'Xe hundai', 'xe-hundai', 1, 2, 1, 0, 1, 0, 1, '2021-12-05__20210122144140-b378-wm.jpg', NULL, 'Xe hundai', 'Xe hundai', 'Xe hundai', '<p>Xe hundai</p>', NULL, NULL);
INSERT INTO `menus` VALUES (17, 'Ô TÔ', 'o-to', 0, 2, 1, 0, 4, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menus` VALUES (18, 'FORD', 'ford', 17, 2, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-19 13:43:50');
INSERT INTO `menus` VALUES (19, 'TOYOTA', 'toyota', 17, 2, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menus` VALUES (20, 'HYUNDAI', 'hyundai', 17, 2, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menus` VALUES (21, 'VINFAST', 'vinfast', 17, 2, 1, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `menus` VALUES (23, 'Tin tức', 'tin-tuc', 0, 1, 1, 0, 3, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-19 16:54:44');
INSERT INTO `menus` VALUES (24, 'Liên Hệ', 'lien-he', 0, 5, 1, 0, 2, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-21 22:30:59');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2018_09_11_202016_create_admins_table', 1);
INSERT INTO `migrations` VALUES (4, '2018_09_13_171852_create_menus_table', 1);
INSERT INTO `migrations` VALUES (5, '2018_09_16_013655_create_articles_table', 1);
INSERT INTO `migrations` VALUES (6, '2018_09_16_014311_create_keywords_table', 1);
INSERT INTO `migrations` VALUES (7, '2018_09_16_014537_create_article_keywords_table', 1);
INSERT INTO `migrations` VALUES (8, '2018_09_21_050809_create_keyword_temps_table', 1);
INSERT INTO `migrations` VALUES (9, '2018_09_21_163200_entrust_setup_tables', 1);
INSERT INTO `migrations` VALUES (10, '2018_09_22_063710_create_keyword_librarys_table', 1);
INSERT INTO `migrations` VALUES (11, '2018_09_23_120817_create_images_table', 1);
INSERT INTO `migrations` VALUES (12, '2018_09_24_233909_create_products_table', 1);
INSERT INTO `migrations` VALUES (13, '2018_09_27_115033_create_cache_table', 1);
INSERT INTO `migrations` VALUES (14, '2018_09_27_152401_create_image_products_table', 1);
INSERT INTO `migrations` VALUES (15, '2018_09_28_154858_create_informations_table', 1);
INSERT INTO `migrations` VALUES (16, '2018_09_29_162032_create_slides_table', 1);
INSERT INTO `migrations` VALUES (17, '2018_09_30_231403_create_guests_table', 1);
INSERT INTO `migrations` VALUES (18, '2018_10_01_212941_create_orders_table', 1);
INSERT INTO `migrations` VALUES (19, '2018_10_07_223034_create_attributes_table', 1);
INSERT INTO `migrations` VALUES (20, '2018_10_07_223337_create_attribute_values_table', 1);
INSERT INTO `migrations` VALUES (21, '2018_10_08_002330_create_product_value_table', 1);
INSERT INTO `migrations` VALUES (22, '2018_10_09_232232_create_commens_table', 1);
INSERT INTO `migrations` VALUES (23, '2018_10_13_000845_create_comments_table', 1);
INSERT INTO `migrations` VALUES (24, '2018_10_14_075933_create_account_social_table', 1);
INSERT INTO `migrations` VALUES (25, '2018_10_18_165441_create_store_table', 1);
INSERT INTO `migrations` VALUES (26, '2018_10_25_203614_create_product_images_table', 1);
INSERT INTO `migrations` VALUES (27, '2022_11_17_125500_create_notifications_table', 2);

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
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (16, 24, 'or sit amet, consectetur adipiscing elit', 'or sit amet, consectetur adipiscing elit', '', '', '/uploaded/slideshow/item4.jpg', '0', 'or sit amet, consectetur adipiscing elit', 'readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum&nbsp;', 1739508060, 1, 1, 8, 'null', NULL, 0, 0, ':6:', '', '', 'or-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1739769626);
INSERT INTO `news` VALUES (17, 11, 'SỰ KIỆN ĐẶC BIỆT CÙNG HEALTHCOCH – CHĂM SÓC SỨC KHỎE TOÀN DIỆN', 'SỰ KIỆN ĐẶC BIỆT CÙNG HEALTHCOCH – CHĂM SÓC SỨC KHỎE TOÀN DIỆN', '', '', '/uploaded/gioi-thieu/du-an2.png', '0', '<h2 data-end=\"318\" data-start=\"284\"><strong data-end=\"316\" data-start=\"287\">✨ Sự kiện c&oacute; g&igrave; đặc biệt?</strong></h2>\r\n\r\n<p data-end=\"433\" data-start=\"319\">HealthCoch mang đến một sự kiện đầy &yacute; nghĩa, gi&uacute;p bạn n&acirc;ng cao sức khỏe thể chất v&agrave; tinh thần. C&ugrave;ng tham gia để:</p>\r\n\r\n<p data-end=\"781\" data-start=\"435\">✅ <strong data-end=\"463\" data-start=\"437\">Kh&aacute;m sức khỏe miễn ph&iacute;</strong> &ndash; Nhận tư vấn từ đội ngũ chuy&ecirc;n gia h&agrave;ng đầu.<br data-end=\"512\" data-start=\"509\" />\r\n✅ <strong data-end=\"558\" data-start=\"514\">Workshop dinh dưỡng &amp; lối sống l&agrave;nh mạnh</strong> &ndash; Tối ưu chế độ ăn uống, sinh hoạt khoa học.<br data-end=\"606\" data-start=\"603\" />\r\n✅ <strong data-end=\"644\" data-start=\"608\">Trải nghiệm c&aacute;c b&agrave;i tập thể chất</strong> &ndash; Yoga, thiền định, fitness gi&uacute;p cải thiện sức khỏe.<br data-end=\"700\" data-start=\"697\" />\r\n✅ <strong data-end=\"727\" data-start=\"702\">Bốc thăm tr&uacute;ng thưởng</strong> &ndash; Cơ hội nhận nhiều phần qu&agrave; hấp dẫn từ HealthCoch.</p>\r\n\r\n<h2 data-end=\"808\" data-start=\"783\"><strong data-end=\"806\" data-start=\"786\">Ai n&ecirc;n tham gia?</strong></h2>\r\n\r\n<ul data-end=\"975\" data-start=\"809\">\r\n	<li data-end=\"855\" data-start=\"809\">Người muốn cải thiện sức khỏe v&agrave; lối sống.</li>\r\n	<li data-end=\"908\" data-start=\"856\">C&aacute;c gia đ&igrave;nh mong muốn chế độ dinh dưỡng hợp l&yacute;.</li>\r\n	<li data-end=\"975\" data-start=\"909\">Người quan t&acirc;m đến c&aacute;c phương ph&aacute;p chăm s&oacute;c sức khỏe tự nhi&ecirc;n.</li>\r\n</ul>\r\n\r\n<p data-end=\"1075\" data-start=\"977\">???? <strong data-end=\"996\" data-start=\"980\">Đăng k&yacute; ngay</strong> để kh&ocirc;ng bỏ lỡ cơ hội chăm s&oacute;c bản th&acirc;n v&agrave; tận hưởng những hoạt động bổ &iacute;ch!</p>\r\n\r\n<p data-end=\"1101\" data-start=\"1077\">???? [Điền link đăng k&yacute;]</p>\r\n\r\n<p data-end=\"1133\" data-start=\"1103\">Hẹn gặp bạn tại sự kiện! ????✨</p>\r\n', '', 1740023100, 15, 1, 8, 'null', NULL, 0, 0, ':', '', '', 'su-kien-dac-biet-cung-healthcoch-cham-soc-suc-khoe-toan-dien.html', '0', '', 0, 1740023303);
INSERT INTO `news` VALUES (4, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 4, 1, 14, 'null', NULL, 0, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', NULL, NULL, 1684728154);
INSERT INTO `news` VALUES (5, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 5, 1, 14, 'null', NULL, 0, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', NULL, NULL, 1684728195);
INSERT INTO `news` VALUES (6, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 6, 1, 8, 'null', NULL, 0, 0, ':24:', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1739506818);
INSERT INTO `news` VALUES (7, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/item4.png', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 7, 1, 8, 'null', NULL, 0, 0, ':24:', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1739506821);
INSERT INTO `news` VALUES (8, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/winter_28.jpg', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 8, 1, 8, 'null', NULL, 0, 0, ':', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1739505686);
INSERT INTO `news` VALUES (9, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/item5.png', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 9, 1, 8, 'null', NULL, 0, 0, ':24:', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', '0', '', 0, 1739506823);
INSERT INTO `news` VALUES (10, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit 001', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/tin-tuc/item7.png', '0', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod ut nisl id sodales. Etiam consectetur nulla vel ornare aliquam. Phasellus non velit eget massa consectetur lobortis. Integer tempus consequat augue, vitae rutrum sem tempor id. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent ornare tellus non ornare molestie. Maecenas convallis leo justo, eget lobortis dui fringilla vitae. Proin ac volutpat leo. Aliquam id fermentum tortor.<br />\r\n&nbsp;', 1684728120, 10, 1, 8, 'null', NULL, 1, 0, ':24:', '', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-001.html', '0', 'googlenew--link', 55, 1739851829);
INSERT INTO `news` VALUES (12, 14, 'Healthy meals tips', 'Healthy meals tips', '', '', '/uploaded/san-pham/12_grande.jpg', '0', '', '', 1739413980, 11, 1, 8, 'null', NULL, 0, 0, ':14:', '', '', 'healthy-meals-tips.html', '0', '', 0, 1739414065);
INSERT INTO `news` VALUES (13, 14, 'Recipes Idea', 'Recipes Idea', '', '', '/uploaded/san-pham/Screenshot_2.png', '0', '', '', 1739414040, 12, 1, 8, 'null', NULL, 0, 0, ':0:', '', '', 'recipes-idea.html', '0', '', 0, 1739414100);
INSERT INTO `news` VALUES (14, 14, 'HealThy excersire', 'HealThy excersire', '', '', '/uploaded/tin-tuc/item1.png', '0', '', '', 1739414100, 13, 1, 8, 'null', NULL, 0, 0, ':', '', '', 'healthy-excersire.html', '0', '', 0, 1739414155);
INSERT INTO `news` VALUES (15, 6, 'ENERGETIC PANT', 'ENERGETIC PANT', '', '', '/uploaded/tin-tuc/item1.png', '0', 'ENERGETIC PANT', '', 1739440500, 14, 1, 8, 'null', NULL, 1, 0, ':', '', '', 'demo.html', '0', '', 0, 1739505715);

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
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `notifications_notifiable_type_notifiable_id_index`(`notifiable_type`, `notifiable_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notifications
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `o_guest_id` int NULL DEFAULT NULL,
  `o_product_id` int NOT NULL DEFAULT 0,
  `o_submit` tinyint NULL DEFAULT 0,
  `o_status` tinyint NULL DEFAULT 0,
  `o_messages` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `car_viewing_day` date NULL DEFAULT NULL,
  `o_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `o_menu_id` int NULL DEFAULT NULL,
  `admin_id` int NOT NULL,
  `unified_price` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cancel_appointment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `o_deposit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rose_money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `get_money` int NOT NULL DEFAULT 0,
  `export_car_customer` int NOT NULL DEFAULT 0,
  `o_pick_up_schedule` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orders_o_guest_id_index`(`o_guest_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (64, 22, 126, 0, 5, NULL, '2022-12-24', '127.0.0.1', NULL, 0, NULL, '', '2022-12-24 10:53:40', '2022-12-25 12:30:39', NULL, NULL, 1, 1, NULL);
INSERT INTO `orders` VALUES (65, 23, 118, 0, 2, NULL, '2022-12-25', '127.0.0.1', NULL, 53, NULL, '', '2022-12-25 12:49:12', '2022-12-25 13:21:06', '80000000', NULL, 0, 0, NULL);
INSERT INTO `orders` VALUES (66, 23, 121, 0, 5, NULL, '2022-12-25', '127.0.0.1', NULL, 53, '800000000', '', '2022-12-25 12:50:40', '2022-12-25 21:24:25', NULL, '24000000', 1, 1, NULL);
INSERT INTO `orders` VALUES (67, 23, 123, 0, 5, NULL, '2022-12-26', '127.0.0.1', NULL, 53, '3800000000', '', '2022-12-25 14:39:18', '2022-12-25 14:44:17', '380000000', '76000000', 1, 1, '2022-12-26');
INSERT INTO `orders` VALUES (68, 23, 122, 0, 5, NULL, '2022-12-25', '127.0.0.1', NULL, 53, '600000000', '', '2022-12-25 15:42:14', '2022-12-25 15:46:43', '120000000', '12000000', 1, 1, '2022-12-26');
INSERT INTO `orders` VALUES (70, 23, 119, 0, 5, NULL, '2022-12-27', '127.0.0.1', NULL, 53, '600000000', '', '2022-12-26 08:59:59', '2022-12-26 09:03:35', '150000000', '12000000', 1, 1, '2022-12-27');
INSERT INTO `orders` VALUES (71, 23, 128, 0, 6, NULL, '2022-12-27', '127.0.0.1', NULL, 53, NULL, 'đổi xe khác', '2022-12-26 09:06:46', '2022-12-26 09:12:00', '375000000', NULL, 0, 0, '2022-12-27');
INSERT INTO `orders` VALUES (72, 23, 128, 0, 0, NULL, '2022-12-27', '127.0.0.1', NULL, 49, NULL, '', '2022-12-26 09:23:45', '2022-12-26 09:24:01', NULL, NULL, 0, 0, NULL);
INSERT INTO `orders` VALUES (73, 23, 123, 0, 0, 'dang co tien', '2022-12-27', '127.0.0.1', NULL, 0, NULL, '', '2022-12-26 09:33:06', '2022-12-26 09:33:06', NULL, NULL, 0, 0, NULL);
INSERT INTO `orders` VALUES (74, 23, 123, 0, 0, NULL, '2022-12-28', '127.0.0.1', NULL, 0, NULL, '', '2022-12-26 09:34:26', '2022-12-26 09:34:26', NULL, NULL, 0, 0, NULL);
INSERT INTO `orders` VALUES (75, 23, 123, 0, 5, NULL, '2022-12-28', '127.0.0.1', NULL, 53, '3800000000', '', '2022-12-26 09:36:32', '2022-12-26 09:38:56', NULL, '76000000', 0, 0, NULL);

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
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_resets
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
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `permission_role_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES (1, 1);
INSERT INTO `permission_role` VALUES (1, 2);
INSERT INTO `permission_role` VALUES (2, 2);
INSERT INTO `permission_role` VALUES (3, 2);
INSERT INTO `permission_role` VALUES (4, 2);
INSERT INTO `permission_role` VALUES (5, 2);
INSERT INTO `permission_role` VALUES (6, 2);
INSERT INTO `permission_role` VALUES (7, 2);
INSERT INTO `permission_role` VALUES (8, 2);
INSERT INTO `permission_role` VALUES (9, 2);
INSERT INTO `permission_role` VALUES (10, 2);
INSERT INTO `permission_role` VALUES (11, 2);
INSERT INTO `permission_role` VALUES (12, 2);
INSERT INTO `permission_role` VALUES (13, 2);
INSERT INTO `permission_role` VALUES (14, 2);
INSERT INTO `permission_role` VALUES (15, 2);
INSERT INTO `permission_role` VALUES (16, 2);
INSERT INTO `permission_role` VALUES (17, 2);
INSERT INTO `permission_role` VALUES (18, 2);
INSERT INTO `permission_role` VALUES (19, 2);
INSERT INTO `permission_role` VALUES (20, 2);
INSERT INTO `permission_role` VALUES (21, 2);
INSERT INTO `permission_role` VALUES (21, 3);
INSERT INTO `permission_role` VALUES (22, 2);
INSERT INTO `permission_role` VALUES (23, 2);
INSERT INTO `permission_role` VALUES (24, 2);
INSERT INTO `permission_role` VALUES (25, 2);
INSERT INTO `permission_role` VALUES (26, 2);
INSERT INTO `permission_role` VALUES (27, 2);
INSERT INTO `permission_role` VALUES (28, 2);
INSERT INTO `permission_role` VALUES (29, 1);
INSERT INTO `permission_role` VALUES (29, 2);
INSERT INTO `permission_role` VALUES (30, 1);
INSERT INTO `permission_role` VALUES (30, 2);
INSERT INTO `permission_role` VALUES (31, 1);
INSERT INTO `permission_role` VALUES (31, 2);
INSERT INTO `permission_role` VALUES (32, 1);
INSERT INTO `permission_role` VALUES (32, 2);
INSERT INTO `permission_role` VALUES (33, 1);
INSERT INTO `permission_role` VALUES (33, 2);
INSERT INTO `permission_role` VALUES (34, 1);
INSERT INTO `permission_role` VALUES (34, 2);
INSERT INTO `permission_role` VALUES (35, 1);
INSERT INTO `permission_role` VALUES (35, 2);
INSERT INTO `permission_role` VALUES (36, 1);
INSERT INTO `permission_role` VALUES (36, 2);
INSERT INTO `permission_role` VALUES (37, 3);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_permission` tinyint NULL DEFAULT 0,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'quan-tri-website', 0, 'Quản trị website', 'Quản lý toàn bộ website không bị hạn chế bất cứ quyền gì', '2022-11-12 07:08:01', '2022-11-12 07:08:01');
INSERT INTO `permissions` VALUES (2, 'truy-cap-website', 1, 'Truy cập website', 'Chỉ có quyền truy cập vào trang giới thiệu', '2022-11-12 07:08:29', '2022-11-12 07:14:47');
INSERT INTO `permissions` VALUES (3, 'quan-ly-menu', 5, 'Quản lý menu', 'Quản lý menu', '2022-11-12 07:09:16', '2022-11-12 07:09:16');
INSERT INTO `permissions` VALUES (4, 'them-moi-menu', 5, 'Thêm mới menu', 'Thêm mới menu', '2022-11-12 07:09:26', '2022-11-12 07:09:26');
INSERT INTO `permissions` VALUES (5, 'chinh-sua-menu', 5, 'Chỉnh sửa menu', 'Chỉnh sửa menu', '2022-11-12 07:09:36', '2022-11-12 07:09:36');
INSERT INTO `permissions` VALUES (6, 'xoa-menu', 5, 'Xóa menu', 'Xóa menu', '2022-11-12 07:09:48', '2022-11-12 07:09:48');
INSERT INTO `permissions` VALUES (7, 'quan-ly-san-pham', 7, 'Quản lý sản phẩm', 'Quản lý sản phẩm', '2022-11-12 07:15:26', '2022-11-12 07:15:26');
INSERT INTO `permissions` VALUES (8, 'them-moi-san-pham', 7, 'Thêm mới sản phẩm', 'Thêm mới sản phẩm', '2022-11-12 07:15:38', '2022-11-12 07:15:38');
INSERT INTO `permissions` VALUES (9, 'chinh-sua-san-pham', 7, 'Chỉnh sửa sản phẩm', 'Chỉnh sửa sản phẩm', '2022-11-12 07:15:51', '2022-11-12 07:15:51');
INSERT INTO `permissions` VALUES (10, 'xoa-san-pham', 7, 'Xóa sản phẩm', 'Xóa sản phẩm', '2022-11-12 07:16:03', '2022-11-12 07:16:03');
INSERT INTO `permissions` VALUES (11, 'quan-ly-bai-viet', 8, 'Quản lý bài viết', 'Quản lý bài viết', '2022-11-12 07:21:29', '2022-11-12 07:21:29');
INSERT INTO `permissions` VALUES (12, 'them-moi-bai-viet', 8, 'Thêm mới bài viết', 'Thêm mới bài viết', '2022-11-12 07:21:39', '2022-11-12 07:21:39');
INSERT INTO `permissions` VALUES (13, 'chinh-sua-bai-viet', 8, 'Chỉnh sửa bài viết', 'Chỉnh sửa bài viết', '2022-11-12 07:21:49', '2022-11-12 07:21:49');
INSERT INTO `permissions` VALUES (14, 'xoa-bai-viet', 8, 'Xóa bài viết', 'Xóa bài viết', '2022-11-12 07:21:59', '2022-11-12 07:21:59');
INSERT INTO `permissions` VALUES (15, 'danh-sach-khach-hang', 2, 'Danh sách khách hàng', 'Danh sách khách hàng', '2022-11-12 07:22:59', '2022-11-12 07:22:59');
INSERT INTO `permissions` VALUES (16, 'them-moi-khach-hang', 2, 'Thêm mới khách hàng', 'Thêm mới khách hàng', '2022-11-12 07:23:32', '2022-11-12 07:23:32');
INSERT INTO `permissions` VALUES (17, 'chinh-sua-khach-hang', 2, 'Chỉnh sửa khách hàng', 'Chỉnh sửa khách hàng', '2022-11-12 07:23:44', '2022-11-12 07:23:44');
INSERT INTO `permissions` VALUES (18, 'xoa-khach-hang', 2, 'Xóa khách hàng', 'Xóa khách hàng', '2022-11-12 07:23:54', '2022-11-12 07:23:54');
INSERT INTO `permissions` VALUES (19, 'quan-ly-binh-luan', 2, 'Quản lý bình luận', 'Quản lý bình luận', '2022-11-12 07:24:51', '2022-11-12 07:24:51');
INSERT INTO `permissions` VALUES (20, 'xoa-binh-luan', 2, 'Xóa bình luận', 'Xóa bình luận', '2022-11-12 07:25:09', '2022-11-12 07:25:09');
INSERT INTO `permissions` VALUES (21, 'danh-sach-lich-xem-xe', 2, 'Danh sách lịch xem xe', 'Danh sách lịch xem xe', '2022-11-12 07:25:24', '2022-11-12 07:25:24');
INSERT INTO `permissions` VALUES (22, 'xoa-lich-xem-xe', 2, 'Xóa lịch xem xe', 'Xóa lịch xem xe', '2022-11-12 07:25:43', '2022-11-12 07:25:43');
INSERT INTO `permissions` VALUES (23, 'quan-ly-hinh-anh', 9, 'Quản lý hình ảnh', 'Quản lý hình ảnh', '2022-11-12 07:29:30', '2022-11-12 07:29:30');
INSERT INTO `permissions` VALUES (24, 'quan-ly-thong-tin-website', 10, 'Quản lý thông tin website', 'Quản lý thông tin website', '2022-11-12 07:30:00', '2022-11-12 07:30:00');
INSERT INTO `permissions` VALUES (25, 'quan-ly-slide', 10, 'Quản lý slide', 'Quản lý slide', '2022-11-12 07:30:53', '2022-11-12 07:30:53');
INSERT INTO `permissions` VALUES (26, 'them-moi-slide', 10, 'Thêm mới slide', 'Thêm mới slide', '2022-11-12 07:31:08', '2022-11-12 07:31:08');
INSERT INTO `permissions` VALUES (27, 'chinh-sua-slide', 10, 'Chỉnh sửa slide', 'Chỉnh sửa slide', '2022-11-12 07:31:23', '2022-11-12 07:31:23');
INSERT INTO `permissions` VALUES (28, 'xoa-slide', 10, 'Xóa slide', 'Xóa slide', '2022-11-12 07:31:41', '2022-11-12 07:31:41');
INSERT INTO `permissions` VALUES (29, 'quan-ly-vai-tro', 3, 'Quản lý vai trò', 'Quản lý vai trò', '2022-11-12 07:41:09', '2022-11-12 07:41:09');
INSERT INTO `permissions` VALUES (30, 'them-moi-vai-tro', 3, 'Thêm mới vai trò', 'Thêm mới vai trò', '2022-11-12 07:41:21', '2022-11-12 07:41:21');
INSERT INTO `permissions` VALUES (31, 'chinh-sua-vai-tro', 3, 'Chỉnh sửa vai trò', 'Chỉnh sửa vai trò', '2022-11-12 07:41:34', '2022-11-12 07:41:34');
INSERT INTO `permissions` VALUES (32, 'xoa-vai-tro', 3, 'Xóa vai trò', 'Xóa vai trò', '2022-11-12 07:41:45', '2022-11-12 07:41:45');
INSERT INTO `permissions` VALUES (33, 'quan-ly-admin', 4, 'Quản lý admin', 'Quản lý admin', '2022-11-12 07:42:33', '2022-11-12 07:44:38');
INSERT INTO `permissions` VALUES (34, 'them-moi-admin', 4, 'Thêm mới admin', 'Thêm mới admin', '2022-11-12 07:44:00', '2022-11-12 07:44:00');
INSERT INTO `permissions` VALUES (35, 'chinh-sua-admin', 4, 'Chỉnh sửa admin', 'Chỉnh sửa admin', '2022-11-12 07:44:12', '2022-11-12 07:44:12');
INSERT INTO `permissions` VALUES (36, 'xoa-admin', 4, 'Xóa admin', 'Xóa admin', '2022-11-12 07:44:23', '2022-11-12 07:44:23');
INSERT INTO `permissions` VALUES (37, 'thong-ke-cua-toi', 1, 'Thống kê của tôi', 'Thống kê của tôi', NULL, NULL);

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
INSERT INTO `product` VALUES (1, 13, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '/uploaded/san-pham/img-2.jpg', '450000', 0, '600000', 0, NULL, '', '', 1739337300, 1, 8, 1, 0, 1, 'NSX31', ':13:', '', 0, 'onsectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit2.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739337356, 0);
INSERT INTO `product` VALUES (2, 13, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '/uploaded/san-pham/12_grande.jpg', '20000', 0, '10000', 0, NULL, '', '', 1739337660, 1, 8, 2, 0, 1, 'NSX31', ':', '', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit3.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739505928, 0);
INSERT INTO `product` VALUES (3, 13, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '/uploaded/du-an/du-an12.png', '450000', 0, '600000', 0, NULL, '', '', 1739337660, 1, 8, 5, 0, 1, 'NSX31', ':', '', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipisci12312ng-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739505859, 0);
INSERT INTO `product` VALUES (4, 13, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '/uploaded/san-pham/12_grande.jpg', '800000', 0, '500000', 0, NULL, 'Đ&acirc;y l&agrave; th&ocirc;ng tin khuyến mại', 'Many desktop publishing packages', 1739337660, 1, 8, 6, 0, 1, 'NSX31', ':', '/uploaded/san-pham/product3.jpg', 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', 'loriem', '', '', '', '', NULL, 'Many desktop publishing packages', 'lorem-ipsum-dolor-sit-amet-consectetur-23123eli123t.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"Plants\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>X<sup>e</sup>-core</td>\r\n			<td>56</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Đơn vị d&ograve; tia</td>\r\n			<td>34</td>\r\n		</tr>\r\n		<tr>\r\n			<td>C&ocirc;ng cụ Intel&reg; X<sup>e</sup>&nbsp;Matrix Extensions (Intel&reg; XMX)</td>\r\n			<td>1235</td>\r\n		</tr>\r\n		<tr>\r\n			<td>C&ocirc;ng cụ vector X<sup>e</sup></td>\r\n			<td>123</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Tần số động tối đa đ&ocirc;̀ họa</td>\r\n			<td>3423</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '', NULL, '', 2, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739939552, 6);
INSERT INTO `product` VALUES (5, 13, 'Where can I get some thing about that not here with you?', '/uploaded/tin-tuc/hinh-nen-thien-nhien-cho-may-tinh-1.jpg', '4500000', 0, '4000000', 0, NULL, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected', '', 1739444640, 1, 8, 3, 0, 1, 'NSX31', ':', '', 0, 'Where can I get some', '', '', '', '', '', '', NULL, '', 'where-can-i-123123get-some.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739505897, 0);
INSERT INTO `product` VALUES (6, 13, 'Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from', '/uploaded/tin-tuc/item1.png', '4500000', 0, '4000000', 0, NULL, 'he Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, ma', 'he Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, ma', 1739445480, 1, 8, 4, 0, 1, 'NSX31', ':', '', 0, 'Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from', '', '', '', '', '', '', NULL, '', 'sydney-college-in-virginia-looked-up-one-of-the-more-obscure-latin-words-consectetur-from.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739445578, 0);
INSERT INTO `product` VALUES (7, 26, 'onsectetur adipiscing elit', '/uploaded/san-pham/img-2.jpg', '450000', 0, '600000', 0, NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 1739765760, 1, 8, 7, 0, 1, 'NSX31', ':', '', 0, 'onsectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'onsectetur-adipisci1231ng-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739765837, 0);
INSERT INTO `product` VALUES (8, 26, 'onsectetur adipiscing elit', '/uploaded/san-pham/img-2.jpg', '450000', 0, '600000', 0, NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 1739765760, 1, 8, 8, 0, 1, 'NSX31', ':', '', 0, 'onsectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'onsectetur-adipisc3123ing-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739765839, 0);
INSERT INTO `product` VALUES (9, 26, 'onsectetur adipiscing elit', '/uploaded/san-pham/img-2.jpg', '450000', 0, '600000', 0, NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 1739765760, 1, 8, 9, 0, 1, 'NSX31', ':', '', 0, 'onsectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'onsectetur-eweqelit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739765840, 0);
INSERT INTO `product` VALUES (10, 26, 'onsectetur adipiscing elit', '/uploaded/san-pham/img-2.jpg', '450000', 0, '600000', 0, NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 1739765760, 1, 8, 10, 0, 1, 'NSX31', ':', '', 0, 'onsectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'onsectetur-adipiscing-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739765841, 0);
INSERT INTO `product` VALUES (11, 26, 'onsectetur adipiscing elit', '/uploaded/san-pham/img-2.jpg', '450000', 0, '600000', 0, NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 1739765760, 1, 8, 11, 0, 1, 'NSX31', ':', '', 0, 'onsectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'onsectetur-eqwelit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739765843, 0);
INSERT INTO `product` VALUES (12, 26, 'onsectetur adipiscing elit', '/uploaded/san-pham/img-2.jpg', '60', 0, '50', 0, NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', 1739765760, 1, 8, 12, 0, 1, 'NSX31', ':', '', 0, 'onsectetur adipiscing elit', '', '', '', '', '', '', NULL, '', 'onsectetur-adipiscing-elit.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, 'm is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Con', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739768029, 0);
INSERT INTO `product` VALUES (13, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 13, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-popular-belie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739766065, 0);
INSERT INTO `product` VALUES (14, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 13, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-popular-belie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739766067, 0);
INSERT INTO `product` VALUES (15, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 13, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-wewepopular-belie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739766068, 0);
INSERT INTO `product` VALUES (16, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 13, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-eweqfdbelie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739766069, 0);
INSERT INTO `product` VALUES (17, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 13, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-popular-belie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739766069, 0);
INSERT INTO `product` VALUES (18, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 13, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-eqwebelie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739766070, 0);
INSERT INTO `product` VALUES (19, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 13, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-ebelie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739766070, 0);
INSERT INTO `product` VALUES (20, 27, 'Contrary to popular belie', '/uploaded/san-pham/12_grande.jpg', '4500', 0, '60', 0, NULL, '', '', 1739766000, 1, 8, 13, 0, 1, 'NSX3123', ':0:', '', 0, 'Contrary to popular belie', '', '', '', '', '', '', NULL, '', 'contrary-to-webelie.html', NULL, NULL, NULL, 0x302C30, '0', '{\"45\":\"\",\"43\":\"\",\"46\":\"\"}', '', '', NULL, '', '', NULL, '', 0, '[{\"image_path\":\"uploaded\\/san-pham\\/product3.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/chon-rau-cu-qua-sach-tam-quan-trong.jpeg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"},{\"image_path\":\"uploaded\\/san-pham\\/product4.jpg\",\"image_name\":\"loriem\",\"image_desc\":\"loriem\",\"image_thu_tu\":\"\"}]', 1739766071, 0);

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
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pi_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pi_slug` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pi_product_id` int NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_images_pi_product_id_index`(`pi_product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES (1, '2021-11-24__sp-1.png', '2021-11-24-sp-1png', 1, '2021-11-24 12:51:37', '2021-11-24 12:51:37');
INSERT INTO `product_images` VALUES (2, '2021-12-05__20210122144140-a7bd-wm.jpg', '2021-12-05-20210122144140-a7bd-wmjpg', 2, '2021-12-05 15:54:47', '2021-12-05 15:54:47');
INSERT INTO `product_images` VALUES (3, '2021-12-05__20210122144140-b378-wm.jpg', '2021-12-05-20210122144140-b378-wmjpg', 2, '2021-12-05 15:54:47', '2021-12-05 15:54:47');
INSERT INTO `product_images` VALUES (4, '2021-12-05__20210122144139-8f78-wm.jpg', '2021-12-05-20210122144139-8f78-wmjpg', 2, '2021-12-05 15:54:47', '2021-12-05 15:54:47');
INSERT INTO `product_images` VALUES (5, '2021-12-05__20211126154725-475b-wm.jpg', '2021-12-05-20211126154725-475b-wmjpg', 3, '2021-12-05 16:00:11', '2021-12-05 16:00:11');
INSERT INTO `product_images` VALUES (6, '2021-12-05__20211126154725-d351-wm.jpg', '2021-12-05-20211126154725-d351-wmjpg', 3, '2021-12-05 16:00:11', '2021-12-05 16:00:11');
INSERT INTO `product_images` VALUES (7, '2021-12-05__20211126154725-3373-wm.jpg', '2021-12-05-20211126154725-3373-wmjpg', 3, '2021-12-05 16:00:11', '2021-12-05 16:00:11');
INSERT INTO `product_images` VALUES (8, '2021-12-05__20211126154725-6456-wm.jpg', '2021-12-05-20211126154725-6456-wmjpg', 3, '2021-12-05 16:00:11', '2021-12-05 16:00:11');
INSERT INTO `product_images` VALUES (9, '2022-11-14__2032f1d6cce1db6c5520ffa64bed47f8.jpg', '2022-11-14-2032f1d6cce1db6c5520ffa64bed47f8jpg', 55, '2022-11-14 23:04:57', '2022-11-14 23:04:57');
INSERT INTO `product_images` VALUES (10, '2022-11-15__anh-nen-minions-2k-341845.jpg', '2022-11-15-anh-nen-minions-2k-341845jpg', 56, '2022-11-15 09:48:14', '2022-11-15 09:48:14');
INSERT INTO `product_images` VALUES (11, '2022-11-21__2164741-2166006j32127.jpg', '2022-11-21-2164741-2166006j32127jpg', 69, '2022-11-21 15:56:27', '2022-11-21 15:56:27');
INSERT INTO `product_images` VALUES (12, '2022-11-21__2164742-2166007j32127.jpg', '2022-11-21-2164742-2166007j32127jpg', 69, '2022-11-21 15:56:27', '2022-11-21 15:56:27');
INSERT INTO `product_images` VALUES (13, '2022-11-21__2164745-2166010j32127.jpg', '2022-11-21-2164745-2166010j32127jpg', 69, '2022-11-21 15:56:27', '2022-11-21 15:56:27');
INSERT INTO `product_images` VALUES (14, '2022-11-21__2164746-2166011j32127.jpg', '2022-11-21-2164746-2166011j32127jpg', 69, '2022-11-21 15:56:27', '2022-11-21 15:56:27');
INSERT INTO `product_images` VALUES (15, '2022-11-21__2164747-2166012j32127.jpg', '2022-11-21-2164747-2166012j32127jpg', 69, '2022-11-21 15:56:27', '2022-11-21 15:56:27');
INSERT INTO `product_images` VALUES (16, '2022-11-26__2164741-2166006j32127.jpg', '2022-11-26-2164741-2166006j32127jpg', 87, '2022-11-26 18:09:12', '2022-11-26 18:09:12');
INSERT INTO `product_images` VALUES (17, '2022-11-26__2164742-2166007j32127.jpg', '2022-11-26-2164742-2166007j32127jpg', 87, '2022-11-26 18:09:12', '2022-11-26 18:09:12');
INSERT INTO `product_images` VALUES (18, '2022-11-26__2164745-2166010j32127.jpg', '2022-11-26-2164745-2166010j32127jpg', 87, '2022-11-26 18:09:12', '2022-11-26 18:09:12');
INSERT INTO `product_images` VALUES (19, '2022-11-26__2164746-2166011j32127.jpg', '2022-11-26-2164746-2166011j32127jpg', 87, '2022-11-26 18:09:12', '2022-11-26 18:09:12');
INSERT INTO `product_images` VALUES (20, '2022-11-26__2164747-2166012j32127.jpg', '2022-11-26-2164747-2166012j32127jpg', 87, '2022-11-26 18:09:12', '2022-11-26 18:09:12');
INSERT INTO `product_images` VALUES (21, '2022-12-12__1.jpg', '2022-12-12-1jpg', 113, '2022-12-12 10:53:51', '2022-12-12 10:53:51');
INSERT INTO `product_images` VALUES (22, '2022-12-18__screenshot-2022-12-18-104252.png', '2022-12-18-screenshot-2022-12-18-104252png', 117, '2022-12-18 10:43:09', '2022-12-18 10:43:09');
INSERT INTO `product_images` VALUES (23, '2022-12-18__screenshot-2022-12-18-104220.png', '2022-12-18-screenshot-2022-12-18-104220png', 117, '2022-12-18 10:43:09', '2022-12-18 10:43:09');
INSERT INTO `product_images` VALUES (24, '2022-12-19__6.jpg', '2022-12-19-6jpg', 118, '2022-12-19 14:15:14', '2022-12-19 14:15:14');
INSERT INTO `product_images` VALUES (25, '2022-12-19__5.jpg', '2022-12-19-5jpg', 118, '2022-12-19 14:15:14', '2022-12-19 14:15:14');
INSERT INTO `product_images` VALUES (26, '2022-12-19__4.jpg', '2022-12-19-4jpg', 118, '2022-12-19 14:15:14', '2022-12-19 14:15:14');
INSERT INTO `product_images` VALUES (29, '2022-12-19__1.jpg', '2022-12-19-1jpg', 118, '2022-12-19 14:15:14', '2022-12-19 14:15:14');
INSERT INTO `product_images` VALUES (34, '2022-12-19__21.jpg', '2022-12-19-21jpg', 119, '2022-12-19 14:24:32', '2022-12-19 14:24:32');
INSERT INTO `product_images` VALUES (35, '2022-12-19__36.png', '2022-12-19-36png', 120, '2022-12-19 14:34:10', '2022-12-19 14:34:10');
INSERT INTO `product_images` VALUES (36, '2022-12-19__35.png', '2022-12-19-35png', 120, '2022-12-19 14:34:10', '2022-12-19 14:34:10');
INSERT INTO `product_images` VALUES (37, '2022-12-19__34.png', '2022-12-19-34png', 120, '2022-12-19 14:34:10', '2022-12-19 14:34:10');
INSERT INTO `product_images` VALUES (38, '2022-12-19__33.png', '2022-12-19-33png', 120, '2022-12-19 14:34:10', '2022-12-19 14:34:10');
INSERT INTO `product_images` VALUES (39, '2022-12-19__32.png', '2022-12-19-32png', 120, '2022-12-19 14:34:10', '2022-12-19 14:34:10');
INSERT INTO `product_images` VALUES (40, '2022-12-19__31.jpg', '2022-12-19-31jpg', 120, '2022-12-19 14:34:10', '2022-12-19 14:34:10');
INSERT INTO `product_images` VALUES (41, '2022-12-19__14.png', '2022-12-19-14png', 121, '2022-12-19 14:43:19', '2022-12-19 14:43:19');
INSERT INTO `product_images` VALUES (42, '2022-12-19__13.png', '2022-12-19-13png', 121, '2022-12-19 14:43:19', '2022-12-19 14:43:19');
INSERT INTO `product_images` VALUES (43, '2022-12-19__12.png', '2022-12-19-12png', 121, '2022-12-19 14:43:19', '2022-12-19 14:43:19');
INSERT INTO `product_images` VALUES (44, '2022-12-19__11.png', '2022-12-19-11png', 121, '2022-12-19 14:43:19', '2022-12-19 14:43:19');
INSERT INTO `product_images` VALUES (45, '2022-12-19__1.jpg', '2022-12-19-1jpg', 121, '2022-12-19 14:43:19', '2022-12-19 14:43:19');
INSERT INTO `product_images` VALUES (46, '2022-12-19__24.png', '2022-12-19-24png', 122, '2022-12-19 14:47:58', '2022-12-19 14:47:58');
INSERT INTO `product_images` VALUES (47, '2022-12-19__23.png', '2022-12-19-23png', 122, '2022-12-19 14:47:58', '2022-12-19 14:47:58');
INSERT INTO `product_images` VALUES (48, '2022-12-19__22.png', '2022-12-19-22png', 122, '2022-12-19 14:47:58', '2022-12-19 14:47:58');
INSERT INTO `product_images` VALUES (49, '2022-12-19__21.png', '2022-12-19-21png', 122, '2022-12-19 14:47:58', '2022-12-19 14:47:58');
INSERT INTO `product_images` VALUES (50, '2022-12-19__2.jpg', '2022-12-19-2jpg', 122, '2022-12-19 14:47:58', '2022-12-19 14:47:58');
INSERT INTO `product_images` VALUES (51, '2022-12-19__34.png', '2022-12-19-34png', 123, '2022-12-19 14:54:30', '2022-12-19 14:54:30');
INSERT INTO `product_images` VALUES (52, '2022-12-19__33.png', '2022-12-19-33png', 123, '2022-12-19 14:54:30', '2022-12-19 14:54:30');
INSERT INTO `product_images` VALUES (53, '2022-12-19__32.png', '2022-12-19-32png', 123, '2022-12-19 14:54:30', '2022-12-19 14:54:30');
INSERT INTO `product_images` VALUES (54, '2022-12-19__31.png', '2022-12-19-31png', 123, '2022-12-19 14:54:30', '2022-12-19 14:54:30');
INSERT INTO `product_images` VALUES (55, '2022-12-19__3.jpg', '2022-12-19-3jpg', 123, '2022-12-19 14:54:30', '2022-12-19 14:54:30');
INSERT INTO `product_images` VALUES (56, '2022-12-19__73.png', '2022-12-19-73png', 119, '2022-12-19 15:02:16', '2022-12-19 15:02:16');
INSERT INTO `product_images` VALUES (57, '2022-12-19__72.png', '2022-12-19-72png', 119, '2022-12-19 15:02:16', '2022-12-19 15:02:16');
INSERT INTO `product_images` VALUES (58, '2022-12-19__71.png', '2022-12-19-71png', 119, '2022-12-19 15:02:16', '2022-12-19 15:02:16');
INSERT INTO `product_images` VALUES (59, '2022-12-19__7.jpg', '2022-12-19-7jpg', 119, '2022-12-19 15:02:16', '2022-12-19 15:02:16');
INSERT INTO `product_images` VALUES (60, '2022-12-19__15.png', '2022-12-19-15png', 124, '2022-12-19 15:12:11', '2022-12-19 15:12:11');
INSERT INTO `product_images` VALUES (61, '2022-12-19__14.png', '2022-12-19-14png', 124, '2022-12-19 15:12:11', '2022-12-19 15:12:11');
INSERT INTO `product_images` VALUES (62, '2022-12-19__13.png', '2022-12-19-13png', 124, '2022-12-19 15:12:11', '2022-12-19 15:12:11');
INSERT INTO `product_images` VALUES (63, '2022-12-19__12.png', '2022-12-19-12png', 124, '2022-12-19 15:12:11', '2022-12-19 15:12:11');
INSERT INTO `product_images` VALUES (64, '2022-12-19__11.png', '2022-12-19-11png', 124, '2022-12-19 15:12:11', '2022-12-19 15:12:11');
INSERT INTO `product_images` VALUES (65, '2022-12-19__1.jpg', '2022-12-19-1jpg', 124, '2022-12-19 15:12:11', '2022-12-19 15:12:11');
INSERT INTO `product_images` VALUES (66, '2022-12-19__44.png', '2022-12-19-44png', 126, '2022-12-19 15:26:59', '2022-12-19 15:26:59');
INSERT INTO `product_images` VALUES (67, '2022-12-19__43.png', '2022-12-19-43png', 126, '2022-12-19 15:26:59', '2022-12-19 15:26:59');
INSERT INTO `product_images` VALUES (68, '2022-12-19__42.png', '2022-12-19-42png', 126, '2022-12-19 15:26:59', '2022-12-19 15:26:59');
INSERT INTO `product_images` VALUES (69, '2022-12-19__41.png', '2022-12-19-41png', 126, '2022-12-19 15:26:59', '2022-12-19 15:26:59');
INSERT INTO `product_images` VALUES (70, '2022-12-19__4.jpg', '2022-12-19-4jpg', 126, '2022-12-19 15:26:59', '2022-12-19 15:26:59');
INSERT INTO `product_images` VALUES (71, '2022-12-19__16.png', '2022-12-19-16png', 127, '2022-12-19 15:46:43', '2022-12-19 15:46:43');
INSERT INTO `product_images` VALUES (72, '2022-12-19__15.png', '2022-12-19-15png', 127, '2022-12-19 15:46:43', '2022-12-19 15:46:43');
INSERT INTO `product_images` VALUES (73, '2022-12-19__14.png', '2022-12-19-14png', 127, '2022-12-19 15:46:43', '2022-12-19 15:46:43');
INSERT INTO `product_images` VALUES (74, '2022-12-19__13.png', '2022-12-19-13png', 127, '2022-12-19 15:46:43', '2022-12-19 15:46:43');
INSERT INTO `product_images` VALUES (75, '2022-12-19__12.png', '2022-12-19-12png', 127, '2022-12-19 15:46:43', '2022-12-19 15:46:43');
INSERT INTO `product_images` VALUES (76, '2022-12-19__11.png', '2022-12-19-11png', 127, '2022-12-19 15:46:43', '2022-12-19 15:46:43');
INSERT INTO `product_images` VALUES (77, '2022-12-19__1.jpg', '2022-12-19-1jpg', 127, '2022-12-19 15:46:43', '2022-12-19 15:46:43');

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
-- Table structure for product_value
-- ----------------------------
DROP TABLE IF EXISTS `product_value`;
CREATE TABLE `product_value`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pv_product_id` int NOT NULL DEFAULT 0,
  `pv_value_id` int NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_value_pv_product_id_pv_value_id_unique`(`pv_product_id`, `pv_value_id`) USING BTREE,
  INDEX `product_value_pv_product_id_index`(`pv_product_id`) USING BTREE,
  INDEX `product_value_pv_value_id_index`(`pv_value_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_value
-- ----------------------------

-- ----------------------------
-- Table structure for product_values
-- ----------------------------
DROP TABLE IF EXISTS `product_values`;
CREATE TABLE `product_values`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `designs` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `interior_color` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `engine_capacity` float NULL DEFAULT NULL,
  `origin` tinyint NULL DEFAULT 0,
  `fuel` tinyint NULL DEFAULT 0,
  `year_of_manufacturing` int NULL DEFAULT NULL,
  `gear` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `number_of_seats` int NULL DEFAULT NULL,
  `went` int NULL DEFAULT NULL,
  `drive` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `car_color` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `door_number` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product_values
-- ----------------------------
INSERT INTO `product_values` VALUES (1, 'aaaa', 'bbbb', 1, 1, 1, 2022, '1', 1, 1, '1', '1', 1, 56, NULL, '2022-11-17 00:45:25');
INSERT INTO `product_values` VALUES (2, 'aaaaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, NULL, NULL);
INSERT INTO `product_values` VALUES (3, '111aaaaaaa', '1', 1, 1, 1, 2022, '1', 1, 1, '1', '1', 5, 58, NULL, '2022-11-17 09:43:26');
INSERT INTO `product_values` VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL);
INSERT INTO `product_values` VALUES (5, '11111', '1111', 111, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL);
INSERT INTO `product_values` VALUES (6, '1111', '1111', 111, 127, 127, 111, '111', 11, 111, '111', '111', 111, 66, NULL, NULL);
INSERT INTO `product_values` VALUES (7, '1111', '111', 11, 1, 1, 2022, '1', 1, 1, '1', '1', 1, 74, NULL, '2022-11-25 09:40:01');
INSERT INTO `product_values` VALUES (8, 'Den xan', 'Trang', 1, 4, 2, 2022, '1KAX', 1, 10000, 'MAXIMY', 'Đen', 6, 68, NULL, '2022-11-16 00:39:37');
INSERT INTO `product_values` VALUES (9, 'aa', 'aa', 11, 2, 1, 2022, '1', 1, 2, '1', '2dwadsd', 1, 69, NULL, '2022-11-21 15:56:43');
INSERT INTO `product_values` VALUES (10, 'aaa', 'aaaaaaaa', 1, 1, 1, 2022, '1KAX', 1, 111, 'ă', 'ă', 1, 58, NULL, NULL);
INSERT INTO `product_values` VALUES (11, 'aaaaaaaaa', 'aaaaaa', 1, 1, 1, 2022, '1', 1, 111, 'aaaaa', 'aaaaaaa', 1, 63, NULL, NULL);
INSERT INTO `product_values` VALUES (12, '111', '111', 11, 2, 2, 2004, '1', 2, 1, '1', '1', 1, 69, NULL, NULL);
INSERT INTO `product_values` VALUES (13, 'Kia', 'Kia', 1.2, 2, 1, 2022, 'Kia', 2, 111, 'Kia', 'Kia', 1, 76, NULL, '2022-11-25 10:02:09');
INSERT INTO `product_values` VALUES (14, 'Seden', 'Xanh', 5, 4, 2, 2022, 'Auto', 4, 2147483647, 'AWD', 'Zanh', 2, 87, NULL, '2022-11-26 18:09:27');
INSERT INTO `product_values` VALUES (15, 'sedan', 'Xanh', 1, 2, 1, 2022, '1', 5, 100000, '111', 'xanh', 1, 97, NULL, '2022-11-30 14:52:56');
INSERT INTO `product_values` VALUES (16, 'Seden11', 'Xanh11', 111, 1, 1, 2022, '11', 11, 11, 'AWD11', 'Zanh11', 1, 107, NULL, '2022-12-06 16:58:30');
INSERT INTO `product_values` VALUES (17, 'Seden', 'Xanh', 12, 1, 1, 2022, 'Auto', 1, 1, '1', 'Zanh', 1, 108, NULL, NULL);
INSERT INTO `product_values` VALUES (18, 'Seden', 'Xanh', 11, 1, 2, 2022, '100000000', 1, 1, 'AWD', 'Zanh', 5, 109, NULL, NULL);
INSERT INTO `product_values` VALUES (19, 'Seden', 'Xanh', 4, 1, 1, 2022, '100000000', 5, 1, '01000000000', 'Zanh', 1, 111, NULL, NULL);
INSERT INTO `product_values` VALUES (20, 'Seden', 'Xanh', 11, 1, 1, 2022, 'Auto', 1, 1, '10', 'Zanh', 1, 112, NULL, NULL);
INSERT INTO `product_values` VALUES (21, 'Sedan', 'Kem', 18, 3, 1, 2022, 'Số tay', 5, 14000, 'FWD - Dẫn động cầu trước', 'Xanh', 4, 113, NULL, '2022-12-12 10:54:10');
INSERT INTO `product_values` VALUES (22, 'Sedan', 'Đen', 1.5, 3, 1, 2022, 'Số tự động', 7, 1000, 'FWD - Dẫn động cầu trước', 'Đen', 5, 114, NULL, NULL);
INSERT INTO `product_values` VALUES (23, 'SUV / Cross over', 'Xanh', 3.5, 4, 1, 2022, 'Hộp số tự động', 4, 1111, 'FWD - Dẫn động cầu trước', 'update', 2, 115, NULL, '2022-12-18 10:44:11');
INSERT INTO `product_values` VALUES (24, '222', 'ádasd', 22, 1, 2, 2022, 'đâs', 2, 22, 'adasdasdas', '0001', 5, 116, NULL, NULL);
INSERT INTO `product_values` VALUES (25, 'Sedan', 'Đen', 0.1, 4, 1, 2022, 'Số tự động', 7, 6000, 'FWD - Dẫn động cầu trước', 'Đỏ', 5, 117, NULL, NULL);
INSERT INTO `product_values` VALUES (26, 'SUV/Crossover', 'Nhiều màu', 2.2, 4, 1, 2022, 'Số tự động', 5, 103000, 'FWD - Dẫn động cầu trước', 'Cát', 4, 118, NULL, NULL);
INSERT INTO `product_values` VALUES (27, 'SUV', 'Kem', 2.5, 3, 2, 2022, 'Số tay', 7, 67000, 'RFD - Dẫn động cầu sau', 'Hồng', 5, 119, NULL, '2022-12-19 14:35:13');
INSERT INTO `product_values` VALUES (28, 'Truck', 'Nhiều màu', 3.2, 4, 2, 2022, 'Số tự động', 5, 95000, '4WD - Dẫn động 4 bánh', 'Đỏ', 5, 120, NULL, '2022-12-19 14:34:40');
INSERT INTO `product_values` VALUES (29, 'SUV', 'ĐEN', 2.7, 3, 1, 2022, 'Số tự động', 7, 62000, '4WD - DẪN ĐỘNG 4 BÁNH', 'Trắng', 4, 121, NULL, NULL);
INSERT INTO `product_values` VALUES (30, 'Sedan', 'Kem', 1.8, 3, 1, 2022, 'Số tự động', 5, 86000, 'FWD - Dẫn động cầu trước', 'Đen', 5, 122, NULL, '2022-12-19 14:52:10');
INSERT INTO `product_values` VALUES (31, 'SUV', 'NÂU', 4.6, 4, 1, 2022, 'Số tự động', 8, 175000, 'AWD - 4 bánh toàn thời gian', 'Đen', 5, 123, NULL, '2022-12-19 14:52:33');
INSERT INTO `product_values` VALUES (32, 'SUV', 'Ghi', 2, 4, 1, 2022, 'Số tự động', 5, 133000, 'FWD - Dẫn động cầu trước', 'Bạc', 5, 124, NULL, '2022-12-19 15:29:50');
INSERT INTO `product_values` VALUES (33, 'Crossover', 'ĐEN', 2, 4, 1, 2022, 'Số tự động', 7, 135322, 'FWD - Dẫn động cầu trước', 'Bạc', 5, 125, NULL, '2022-12-19 15:30:12');
INSERT INTO `product_values` VALUES (34, 'Sedan', 'Nhiều màu', 1.6, 3, 1, 2022, 'Số tay', 5, 150000, 'FWD - Dẫn động cầu trước', 'Trắng', 5, 126, NULL, '2022-12-19 15:33:30');
INSERT INTO `product_values` VALUES (35, 'Hatchback', 'ĐEN', 1.4, 3, 1, 2022, 'Số tự động', 5, 37000, 'FWD - Dẫn động cầu trước', 'Đỏ', 5, 127, NULL, '2022-12-19 15:51:16');
INSERT INTO `product_values` VALUES (36, 'SUV', 'ĐEN', 2, 3, 1, 2022, 'Số tự động', 7, 35000, 'FWD - Dẫn động cầu trước', 'Đỏ', 5, 128, NULL, '2022-12-19 15:51:52');
INSERT INTO `product_values` VALUES (37, 'wer', 'wrwer', 4, 1, 1, 2022, 'sfsdfds', 5, 31, 'wrew', 'wrwer', 4, 129, NULL, NULL);
INSERT INTO `product_values` VALUES (38, 'wrwer', 'werwe', 4, 1, 1, 2022, 'sfs', 4, 42, 'fds', 'fsd', 3, 133, NULL, NULL);
INSERT INTO `product_values` VALUES (39, 'gdg', 'dfgdfg', 3, 1, 1, 2022, 'dgdfg', 5, 55, 'gdfgd', 'gdf', 4, 134, NULL, NULL);
INSERT INTO `product_values` VALUES (40, 'sdfsd', 'sdfdsf', 3, 1, 1, 2022, 'sdsfsd', 5, 100000, 'fsdfdsf', 'dsfsdf', 3, 135, NULL, '2022-12-25 15:02:29');
INSERT INTO `product_values` VALUES (41, 'sdfdsf', 'sdfds', 3, 1, 1, 2022, 'sdfds', 4, 324324, 'fdsfs', 'sdfsd', 3, 136, NULL, NULL);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pro_slug` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pro_price` bigint NULL DEFAULT 0,
  `pro_menu_id` int NULL DEFAULT 0,
  `pro_type` tinyint NULL DEFAULT 0,
  `pro_active` tinyint NULL DEFAULT 0,
  `pro_position` tinyint NULL DEFAULT 0,
  `pro_description` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pro_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `pro_specifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `pro_title_seo` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pro_keyword_seo` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pro_description_seo` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pro_avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pro_view` int NULL DEFAULT 0,
  `pro_admin_id` int NULL DEFAULT 0,
  `pro_point_rating` int NULL DEFAULT 0,
  `pro_import` tinyint NULL DEFAULT 0,
  `pro_total_ratings` int NULL DEFAULT 0,
  `pro_price_import` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pro_price_repair` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `rose` int NULL DEFAULT NULL,
  `maximum_deposit` int NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `numbers_of_cars_left` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_pro_name_unique`(`pro_name`) USING BTREE,
  INDEX `products_pro_menu_id_index`(`pro_menu_id`) USING BTREE,
  INDEX `products_pro_type_index`(`pro_type`) USING BTREE,
  INDEX `products_pro_active_index`(`pro_active`) USING BTREE,
  INDEX `products_pro_admin_id_index`(`pro_admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (118, 'Ford Ranger XLS 2.2AT - 2017 Xe cũ Nhập khẩu', 'ford-ranger-xls-22at---2017-xe-cu-nhap-khau', 800000000, 18, 1, 1, 0, 'Siêu Thị ô tô Ánh Lý bán xe Ford Ranger XLS 2.2AT, sản xuất năm 2017, máy dầu, nhập khẩu, biển tỉnh hồ sơ rút nhanh gọn. Xe màu vàng cát cực đẹp, trang bị: Cabin kép, lazăng đúc, đèn gầm, bệ bước,... Nội thất ghế da cao cấp, ga tự động Cruise Control, đầu đài giả trí CD/DVD nguyên bản theo xe, điều', '<p>Si&ecirc;u Thị &ocirc; t&ocirc; &Aacute;nh L&yacute; b&aacute;n xe Ford Ranger XLS 2.2AT, sản xuất năm 2017, m&aacute;y dầu, nhập khẩu, biển tỉnh hồ sơ r&uacute;t nhanh gọn. Xe m&agrave;u v&agrave;ng c&aacute;t cực đẹp, trang bị: Cabin k&eacute;p, lazăng đ&uacute;c, đ&egrave;n gầm, bệ bước,... Nội thất ghế da cao cấp, ga tự động Cruise Control, đầu đ&agrave;i giả tr&iacute; CD/DVD nguy&ecirc;n bản theo xe, điều h&ograve;a hai chiều m&aacute;t s&acirc;u, v&ocirc; lăng t&iacute;ch hợp đa chức năng, gương k&iacute;nh chỉnh điện cụp điện, tẩu sạc, kết nối USB/Bluetooth, trải s&agrave;n da,... Cam kết xe kh&ocirc;ng tai nạn, kh&ocirc;ng ngập nước, m&aacute;y nguy&ecirc;n bản của nh&agrave; sản xuất. Hỗ trợ ng&acirc;n h&agrave;ng 70% gi&aacute; trị xe l&atilde;i xuất ưu đ&atilde;i, thủ tục nhanh gọn</p>', '<h2>Th&ocirc;ng số cơ bản</h2>\r\n\r\n<ul>\r\n	<li>D&agrave;i x Rộng x Cao:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(mm)</li>\r\n	<li>Chiều d&agrave;i cơ sở:&nbsp; &nbsp; 0&nbsp; &nbsp; &nbsp; (mm)</li>\r\n	<li>Chiều rộng cơ sở trước/sau:&nbsp; &nbsp; &nbsp;(mm)</li>\r\n	<li>Trọng lượng kh&ocirc;ng tải:&nbsp; &nbsp; 0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(kg)</li>\r\n	<li>Dung t&iacute;ch b&igrave;nh nhi&ecirc;n liệu:&nbsp; 0&nbsp; &nbsp; &nbsp; &nbsp; (l&iacute;t)</li>\r\n</ul>\r\n\r\n<h2>Động cơ</h2>\r\n\r\n<ul>\r\n	<li>Động cơ:</li>\r\n	<li>Kiểu động cơ:</li>\r\n	<li>Dung t&iacute;ch xi lanh:&nbsp; &nbsp; 0 (cc)</li>\r\n</ul>\r\n\r\n<h2>Phanh - Giảm x&oacute;c - Lốp</h2>\r\n\r\n<ul>\r\n	<li>Phanh:</li>\r\n	<li>Giảm s&oacute;c:</li>\r\n	<li>Lốp xe:</li>\r\n	<li>V&agrave;nh m&acirc;m xe:</li>\r\n</ul>\r\n\r\n<h2>Th&ocirc;ng số kỹ thuật kh&aacute;c</h2>', 'Ford Ranger', 'Ford Ranger', 'Ford Ranger', '2022-12-19__1.jpg', 44, 1, 0, 1, 0, '575000000', '5000000', 1, 10, '2022-12-20 14:15:14', '2022-12-26 08:57:56', 2);
INSERT INTO `products` VALUES (119, 'Ford Everest 2.5MT - 2013 Xe cũ Trong nước', 'ford-everest-25mt---2013-xe-cu-trong-nuoc', 600000000, 18, 1, 1, 0, 'Gia đình cần bán Ford Everest 2013 số sàn máy dầu, màu hồng phấn, odo 67.000 Km, gia đình đi cẩn thận còn mới, dô nhiều phụ kiện, ghế da, màn hình android, camera de, loa sub, dán kính, vô lăng bọc da, gầm bệ máy móc nguyên bản, côn số êm, máy khỏe đi rất bốc, ít hao dầu, xe chính chủ bán trực tiếp,', '<p>Gia đ&igrave;nh cần b&aacute;n Ford Everest 2013 số s&agrave;n m&aacute;y dầu, m&agrave;u hồng phấn, odo 67.000 Km, gia đ&igrave;nh đi cẩn thận c&ograve;n mới, d&ocirc; nhiều phụ kiện, ghế da, m&agrave;n h&igrave;nh android, camera de, loa sub, d&aacute;n k&iacute;nh, v&ocirc; lăng bọc da, gầm bệ m&aacute;y m&oacute;c nguy&ecirc;n bản, c&ocirc;n số &ecirc;m, m&aacute;y khỏe đi rất bốc, &iacute;t hao dầu, xe ch&iacute;nh chủ b&aacute;n trực tiếp,</p>', '<p>Th&ocirc;ng số cơ bản<br />\r\nD&agrave;i x Rộng x Cao:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều d&agrave;i cơ sở:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều rộng cơ sở trước/sau:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nTrọng lượng kh&ocirc;ng tải:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(kg)<br />\r\nDung t&iacute;ch b&igrave;nh nhi&ecirc;n liệu:&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(l&iacute;t)<br />\r\nĐộng cơ<br />\r\nĐộng cơ:<br />\r\nKiểu động cơ:<br />\r\nDung t&iacute;ch xi lanh:&nbsp;&nbsp;&nbsp;&nbsp;0 (cc)<br />\r\nPhanh - Giảm x&oacute;c - Lốp<br />\r\nPhanh:<br />\r\nGiảm s&oacute;c:<br />\r\nLốp xe:<br />\r\nV&agrave;nh m&acirc;m xe:<br />\r\nTh&ocirc;ng số kỹ thuật kh&aacute;c</p>', 'Ford Everest', 'Ford Everest', 'Ford Everest', '2022-12-19__7.jpg', 7, 1, 0, 1, 0, '498000000', '1000000', 2, 25, '2022-12-19 14:24:32', '2022-12-26 09:03:13', 1);
INSERT INTO `products` VALUES (120, 'Ford Ranger 3.2AT - 2016 Xe cũ Nhập khẩu', 'ford-ranger-32at---2016-xe-cu-nhap-khau', 900000000, 18, 1, 1, 0, 'Siêu Thị Ô tô Ánh Lý bán xe Ford Ranger Wildtrak 3.2AT sản xuất 2016 nhập khẩu, máy dầu, hai cầu, biển tỉnh hồ sơ rút nhanh gọn. - Ngoại thất lazzang đúc, đèn gầm, cảnh báo rẽ tích hợp trên gương, bệ bước,… - Nội thất ghế da pha nỉ cao cấp, màn hình DVD kết hợp camera lùi, Ga tự động Cruise Control,', '<p>Si&ecirc;u Thị &Ocirc; t&ocirc; &Aacute;nh L&yacute; b&aacute;n xe Ford Ranger Wildtrak 3.2AT sản xuất 2016 nhập khẩu, m&aacute;y dầu, hai cầu, biển tỉnh hồ sơ r&uacute;t nhanh gọn. - Ngoại thất lazzang đ&uacute;c, đ&egrave;n gầm, cảnh b&aacute;o rẽ t&iacute;ch hợp tr&ecirc;n gương, bệ bước,&hellip; - Nội thất ghế da pha nỉ cao cấp, m&agrave;n h&igrave;nh DVD kết hợp camera l&ugrave;i, Ga tự động Cruise Control, &acirc;m thanh AM/FM, kết nối Bluetooth/MP3, điều h&ograve;a m&aacute;t s&acirc;u, v&ocirc; lăng t&iacute;ch hợp n&uacute;t bấm bọc da, Ghế điện, gương k&iacute;nh chỉnh điện cụp điện,&hellip; - M&aacute;y nổ &ecirc;m gầm bệ chắc chắn, kiểu d&aacute;ng thể thao,... v&agrave; nhiều tiện nghi kh&aacute;c. - Cam kết xe:Kh&ocirc;ng đ&acirc;m đụng, kh&ocirc;ng ngập nước, m&aacute;y nguy&ecirc;n bản nh&agrave; sản xuất Hỗ trợ bank l&ecirc;n đến 70%, thủ tục nhanh gọn. Vui l&ograve;ng li&ecirc;n hệ để biết th&ecirc;m chi tiết !</p>', '<p>Th&ocirc;ng số cơ bản<br />\r\nD&agrave;i x Rộng x Cao:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều d&agrave;i cơ sở:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều rộng cơ sở trước/sau:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nTrọng lượng kh&ocirc;ng tải:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(kg)<br />\r\nDung t&iacute;ch b&igrave;nh nhi&ecirc;n liệu:&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(l&iacute;t)<br />\r\nĐộng cơ<br />\r\nĐộng cơ:<br />\r\nKiểu động cơ:<br />\r\nDung t&iacute;ch xi lanh:&nbsp;&nbsp;&nbsp;&nbsp;0 (cc)<br />\r\nPhanh - Giảm x&oacute;c - Lốp<br />\r\nPhanh:<br />\r\nGiảm s&oacute;c:<br />\r\nLốp xe:<br />\r\nV&agrave;nh m&acirc;m xe:<br />\r\nTh&ocirc;ng số kỹ thuật kh&aacute;c</p>', 'Ford Ranger', 'Ford Ranger', 'Ford Ranger', '2022-12-19__31.jpg', 3, 1, 0, 1, 0, '725000000', '2000000', 3, 15, '2022-12-19 14:34:10', '2022-12-24 10:50:29', 2);
INSERT INTO `products` VALUES (121, 'Toyota Fortuner 2.7AT - 2015 Xe cũ Trong nước', 'toyota-fortuner-27at---2015-xe-cu-trong-nuoc', 800000000, 19, 1, 1, 0, 'Siêu thị ô tô Ánh Lý bán xe Toyota Fortuner 2.7 AT sản xuất 2015, hai cầu, máy xăng, biển tỉnh hồ sơ rút nhanh gọn. -Xe trang bị full option: Lazăng đúc, đèn gầm, cảnh báo rẽ,bệ bước,... Nội thất da cao cấp, màn hình hiện thị Android kết hợp camera lùi, túi khí an toàn, ghế điện, vô lăng tích hợp nú', '<p>Si&ecirc;u thị &ocirc; t&ocirc; &Aacute;nh L&yacute; b&aacute;n xe Toyota Fortuner 2.7 AT sản xuất 2015, hai cầu, m&aacute;y xăng, biển tỉnh hồ sơ r&uacute;t nhanh gọn. -Xe trang bị full option: Lazăng đ&uacute;c, đ&egrave;n gầm, cảnh b&aacute;o rẽ,bệ bước,... Nội thất da cao cấp, m&agrave;n h&igrave;nh hiện thị Android kết hợp camera l&ugrave;i, t&uacute;i kh&iacute; an to&agrave;n, ghế điện, v&ocirc; lăng t&iacute;ch hợp n&uacute;t bấm, điều h&ograve;a hai chiều, phanh ABS an to&agrave;n, tẩu sạc, jack cắm USB, gương k&iacute;nh chỉnh điện+ cụp điện Auto,... Cam kết xe kh&ocirc;ng đ&acirc;m đụng, ngập nước, m&aacute;y nguy&ecirc;n bản nh&agrave; sản xuất Hỗ trợ bank l&ecirc;n đến 50% gi&aacute; trị xe. ​L&atilde;i xuất ưu đ&atilde;i thủ tục nhanh gọn Vui l&ograve;ng li&ecirc;n hệ để biết th&ecirc;m th&ocirc;ng tin chi tiết!</p>', '<p>Th&ocirc;ng số cơ bản<br />\r\nD&agrave;i x Rộng x Cao:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều d&agrave;i cơ sở:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều rộng cơ sở trước/sau:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nTrọng lượng kh&ocirc;ng tải:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(kg)<br />\r\nDung t&iacute;ch b&igrave;nh nhi&ecirc;n liệu:&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(l&iacute;t)<br />\r\nĐộng cơ<br />\r\nĐộng cơ:<br />\r\nKiểu động cơ:<br />\r\nDung t&iacute;ch xi lanh:&nbsp;&nbsp;&nbsp;&nbsp;0 (cc)<br />\r\nPhanh - Giảm x&oacute;c - Lốp<br />\r\nPhanh:<br />\r\nGiảm s&oacute;c:<br />\r\nLốp xe:<br />\r\nV&agrave;nh m&acirc;m xe:<br />\r\nTh&ocirc;ng số kỹ thuật kh&aacute;c</p>', 'Toyota Fortuner', 'Toyota Fortuner', 'Toyota Fortuner', '2022-12-19__1.jpg', 26, 1, 0, 1, 0, '635000000', '3000000', 3, 30, '2022-12-19 14:43:19', '2022-12-26 09:42:19', 2);
INSERT INTO `products` VALUES (122, 'Toyota Corolla Altis 1.8AT - 2013 Xe cũ Trong nước', 'toyota-corolla-altis-18at---2013-xe-cu-trong-nuoc', 600000000, 19, 1, 1, 0, 'Siêu thị Ô tô Ánh Lý bán xe Toyota Corolla Altis 1.8AT sản xuất năm 2013, biển tỉnh hồ sơ rút cầm tay. Xe được thiết kế hiện đại, không gian rộng thoáng, vận hành êm ái, đẳng cấp thương hiệu. Trang bị lazang đúc, đèn gầm, cảnh báo rẽ tích hợp trên gương, … Nội thất ghế da cao cấp, ghế lái chỉnh điện', '<p>Si&ecirc;u thị &Ocirc; t&ocirc; &Aacute;nh L&yacute; b&aacute;n xe Toyota Corolla Altis 1.8AT sản xuất năm 2013, biển tỉnh hồ sơ r&uacute;t cầm tay. Xe được thiết kế hiện đại, kh&ocirc;ng gian rộng tho&aacute;ng, vận h&agrave;nh &ecirc;m &aacute;i, đẳng cấp thương hiệu. Trang bị lazang đ&uacute;c, đ&egrave;n gầm, cảnh b&aacute;o rẽ t&iacute;ch hợp tr&ecirc;n gương, &hellip; Nội thất ghế da cao cấp, ghế l&aacute;i chỉnh điện, điều h&ograve;a auto, v&ocirc; lăng t&iacute;ch hợp n&uacute;t bấm, đầu DVD/CD, &acirc;m thanh AM/FM, gương k&iacute;nh chỉnh điện, cụp điện, cảm biến l&ugrave;i,&hellip; Hệ thống phanh ABS, t&uacute;i kh&iacute; an to&agrave;n. Cam kết xe kh&ocirc;ng tai nạn, kh&ocirc;ng ngập nước, m&aacute;y nguy&ecirc;n bản của nh&agrave; sản xuất. Hỗ trợ bank 50% gi&aacute; trị xe l&atilde;i xuất ưu đ&atilde;i</p>', '<p>Th&ocirc;ng số cơ bản<br />\r\nD&agrave;i x Rộng x Cao:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều d&agrave;i cơ sở:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều rộng cơ sở trước/sau:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nTrọng lượng kh&ocirc;ng tải:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(kg)<br />\r\nDung t&iacute;ch b&igrave;nh nhi&ecirc;n liệu:&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(l&iacute;t)<br />\r\nĐộng cơ<br />\r\nĐộng cơ:<br />\r\nKiểu động cơ:<br />\r\nDung t&iacute;ch xi lanh:&nbsp;&nbsp;&nbsp;&nbsp;0 (cc)<br />\r\nPhanh - Giảm x&oacute;c - Lốp<br />\r\nPhanh:<br />\r\nGiảm s&oacute;c:<br />\r\nLốp xe:<br />\r\nV&agrave;nh m&acirc;m xe:<br />\r\nTh&ocirc;ng số kỹ thuật kh&aacute;c</p>', 'Toyota Corolla Altis', 'Toyota Corolla Altis', 'Toyota Corolla Altis', '2022-12-19__2.jpg', 8, 1, 0, 1, 0, '465000000', '2000000', 2, 20, '2022-12-19 14:47:58', '2022-12-26 09:42:16', 1);
INSERT INTO `products` VALUES (123, 'Toyota Land Cruiser VX - 2016 Xe cũ Nhập khẩu', 'toyota-land-cruiser-vx---2016-xe-cu-nhap-khau', 3800000000, 19, 1, 1, 0, 'Siêu Thị ô tô Ánh Lý chính chủ bán xe Toyota Land Cruiser VX 4.6 V8 sản xuất năm 2016,xe nhập khẩu nguyên chiếc,đẳng cấp vượt trội. Xe trang bị ngoại thất nổi bật với mặt ca lăng hình lục giác gồm 3 thanh mạ crôm cỡ lớn,liên kết với dàn đèn pha dạng LED gương cầu ở hai bên,động cơ xăng mạnh mẽ V8. N', '<p>Si&ecirc;u Thị &ocirc; t&ocirc; &Aacute;nh L&yacute; ch&iacute;nh chủ b&aacute;n xe Toyota Land Cruiser VX 4.6 V8 sản xuất năm 2016,xe nhập khẩu nguy&ecirc;n chiếc,đẳng cấp vượt trội. Xe trang bị ngoại thất nổi bật với mặt ca lăng h&igrave;nh lục gi&aacute;c gồm 3 thanh mạ cr&ocirc;m cỡ lớn,li&ecirc;n kết với d&agrave;n đ&egrave;n pha dạng LED gương cầu ở hai b&ecirc;n,động cơ xăng mạnh mẽ V8. Nội thất ghế l&aacute;i chỉnh điện 10 hướng,ghế h&agrave;nh kh&aacute;ch chỉnh điện 8 hướng,rửa đ&egrave;n pha,hệ thống c&acirc;n bằng g&oacute;c chiếu,hệ thống điều h&ograve;a tự động 2 v&ugrave;ng độc lập,ch&igrave;a kh&oacute;a th&ocirc;ng minh &amp; khởi động bằng n&uacute;t bấm,Hệ thống điều khiển h&agrave;nh tr&igrave;nh,Hệ thống chống b&oacute; cứng phanh ABS,Hệ thống hỗ trợ lực phanh khẩn cấp BA,Hệ thống ph&acirc;n phối lực phanh điện tử EBS,Hệ thống kiểm so&aacute;t lực k&eacute;o TCS,Hệ thống hỗ trợ khởi h&agrave;nh ngang dốc HAC,.. Cam kết xe kh&ocirc;ng tai nạn,kh&ocirc;ng ngập nước,m&aacute;y số zin nguy&ecirc;n bản. Hỗ trợ bank 70% gi&aacute; trị xe l&atilde;i xuất ưu đ&atilde;i, thủ tục nhanh gọn. Mọi th&ocirc;ng tin xin li&ecirc;n hệ để được tư vấn v&agrave; trải nghiệm !</p>', '<p>Th&ocirc;ng số cơ bản<br />\r\nD&agrave;i x Rộng x Cao:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều d&agrave;i cơ sở:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều rộng cơ sở trước/sau:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nTrọng lượng kh&ocirc;ng tải:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(kg)<br />\r\nDung t&iacute;ch b&igrave;nh nhi&ecirc;n liệu:&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(l&iacute;t)<br />\r\nĐộng cơ<br />\r\nĐộng cơ:<br />\r\nKiểu động cơ:<br />\r\nDung t&iacute;ch xi lanh:&nbsp;&nbsp;&nbsp;&nbsp;0 (cc)<br />\r\nPhanh - Giảm x&oacute;c - Lốp<br />\r\nPhanh:<br />\r\nGiảm s&oacute;c:<br />\r\nLốp xe:<br />\r\nV&agrave;nh m&acirc;m xe:<br />\r\nTh&ocirc;ng số kỹ thuật kh&aacute;c</p>', 'Toyota Land Cruiser', 'Toyota Land Cruiser', 'Toyota Land Cruiser', '2022-12-19__3.jpg', 14, 1, 0, 1, 0, '3450000000', '10000000', 2, 10, '2022-12-19 14:51:29', '2022-12-26 09:40:35', 0);
INSERT INTO `products` VALUES (124, 'Huyndai Tucson 2.0AT - 2009 Xe cũ Nhập khẩu', 'huyndai-tucson-20at---2009-xe-cu-nhap-khau', 400000000, 20, 1, 1, 0, 'Siêu thị ô tô Ánh Lý bán xe Hyundai Tucson 2.0AT sản xuất năm 2009, nhập khẩu Hàn Quốc, biển tỉnh hồ sơ rút cầm tay. Xe trang bị ngoại thất: Phanh đĩa, lazzang đúc,đèn gầm,cảnh báo rẽ tích hợp trên gương,… Nội thất ghế da cao cấp, cửa sổ trời, gương kính chỉnh điện+ cụp điện, vô lăng bọc da, màn hìn', '<p>Si&ecirc;u thị &ocirc; t&ocirc; &Aacute;nh L&yacute; b&aacute;n xe Hyundai Tucson 2.0AT sản xuất năm 2009, nhập khẩu H&agrave;n Quốc, biển tỉnh hồ sơ r&uacute;t cầm tay. Xe trang bị ngoại thất: Phanh đĩa, lazzang đ&uacute;c,đ&egrave;n gầm,cảnh b&aacute;o rẽ t&iacute;ch hợp tr&ecirc;n gương,&hellip; Nội thất ghế da cao cấp, cửa sổ trời, gương k&iacute;nh chỉnh điện+ cụp điện, v&ocirc; lăng bọc da, m&agrave;n h&igrave;nh giải tr&iacute; DVD, đầu CD, &acirc;m thanh AM/FM, điều h&ograve;a 2 chiều, l&oacute;t s&agrave;n v&agrave; nhiều tiện &iacute;ch kh&aacute;c,... Cam kết xe:Kh&ocirc;ng đ&acirc;m đụng, kh&ocirc;ng ngập nước, m&aacute;y nguy&ecirc;n bản nh&agrave; sản xuất Hỗ trợ ng&acirc;n h&agrave;ng 50% gi&aacute; trị xe l&atilde;i suất ưu đ&atilde;i Li&ecirc;n hệ để biết th&ecirc;m chi tiết!</p>', '<p>Th&ocirc;ng số cơ bản<br />\r\nD&agrave;i x Rộng x Cao:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều d&agrave;i cơ sở:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều rộng cơ sở trước/sau:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nTrọng lượng kh&ocirc;ng tải:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(kg)<br />\r\nDung t&iacute;ch b&igrave;nh nhi&ecirc;n liệu:&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(l&iacute;t)<br />\r\nĐộng cơ<br />\r\nĐộng cơ:<br />\r\nKiểu động cơ:<br />\r\nDung t&iacute;ch xi lanh:&nbsp;&nbsp;&nbsp;&nbsp;0 (cc)<br />\r\nPhanh - Giảm x&oacute;c - Lốp<br />\r\nPhanh:<br />\r\nGiảm s&oacute;c:<br />\r\nLốp xe:<br />\r\nV&agrave;nh m&acirc;m xe:<br />\r\nTh&ocirc;ng số kỹ thuật kh&aacute;c</p>', 'Huyndai Tucson', 'Huyndai Tucson', 'Huyndai Tucson', '2022-12-19__1.jpg', 16, 1, 0, 1, 0, '295000000', '3000000', 2, 25, '2022-12-19 15:12:11', '2022-12-25 20:28:52', 2);
INSERT INTO `products` VALUES (125, 'Huyndai Santafe SLX - 2009 Xe cũ Nhập khẩu', 'huyndai-santafe-slx---2009-xe-cu-nhap-khau', 750000000, 20, 1, 1, 0, 'Siêu thị ô tô Ánh Lý bán xe Santafe SLX sản xuất 2009 nhập khẩu nội địa Hàn Quốc biển Hà Nội hồ sơ rút nhanh gọn. - Xe phiên bản đủ trang bị: Nội thất ghế da, lót sàn, đầu CD nguyên bản, 2 ghế điện, sấy sưởi 4 ghế,cửa sổ trời, rửa đèn pha, gương kính điện, vô lăng tích hợp, điều hòa Auto và nhiều ti', '<p>Si&ecirc;u thị &ocirc; t&ocirc; &Aacute;nh L&yacute; b&aacute;n xe Santafe SLX sản xuất 2009 nhập khẩu nội địa H&agrave;n Quốc biển H&agrave; Nội hồ sơ r&uacute;t nhanh gọn. - Xe phi&ecirc;n bản đủ trang bị: Nội thất ghế da, l&oacute;t s&agrave;n, đầu CD nguy&ecirc;n bản, 2 ghế điện, sấy sưởi 4 ghế,cửa sổ trời, rửa đ&egrave;n pha, gương k&iacute;nh điện, v&ocirc; lăng t&iacute;ch hợp, điều h&ograve;a Auto v&agrave; nhiều tiện &iacute;ch kh&aacute;c..... Để c&oacute; th&ocirc;ng tin chi tiết vui l&ograve;ng li&ecirc;n hệ Hotline hoặc Inbox trực tiếp. Hỗ trợ trả g&oacute;p 50% gi&aacute; trị xe l&atilde;i xuất ưu đ&atilde;i thủ tục nhanh gọn.</p>', '<p>Th&ocirc;ng số cơ bản<br />\r\nD&agrave;i x Rộng x Cao:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều d&agrave;i cơ sở:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều rộng cơ sở trước/sau:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nTrọng lượng kh&ocirc;ng tải:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(kg)<br />\r\nDung t&iacute;ch b&igrave;nh nhi&ecirc;n liệu:&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(l&iacute;t)<br />\r\nĐộng cơ<br />\r\nĐộng cơ:<br />\r\nKiểu động cơ:<br />\r\nDung t&iacute;ch xi lanh:&nbsp;&nbsp;&nbsp;&nbsp;0 (cc)<br />\r\nPhanh - Giảm x&oacute;c - Lốp<br />\r\nPhanh:<br />\r\nGiảm s&oacute;c:<br />\r\nLốp xe:<br />\r\nV&agrave;nh m&acirc;m xe:<br />\r\nTh&ocirc;ng số kỹ thuật kh&aacute;c</p>', 'Huyndai Santafe SLX', 'Huyndai Santafe SLX', 'Huyndai Santafe SLX', '2022-12-19__2.jpg', 0, 1, 0, 1, 0, '535000000', '3000000', 3, 20, '2022-12-19 15:19:52', '2022-12-19 15:52:14', 2);
INSERT INTO `products` VALUES (126, 'Huyndai Avante 1.6MT - 2012 Xe cũ Trong nước', 'huyndai-avante-16mt---2012-xe-cu-trong-nuoc', 510000000, 20, 1, 1, 0, 'Siêu thị ô tô Ánh Lý bán xe Hyundai Avante 1.6 MT 2012 rất đẹp biển tỉnh hồ sơ rút cầm tay. Xe trang bị: ghế da cao cấp, túi khí an toàn, vô lăng tích hợp, gương kính chỉnh điện,.... Xe còn rất mới, nội ngoại thất đẹp, máy móc, thân vỏ nguyên bản, lốp sử dụng tốt không phải thay thế, đầy đủ phụ kiện', '<p>Si&ecirc;u thị &ocirc; t&ocirc; &Aacute;nh L&yacute; b&aacute;n xe Hyundai Avante 1.6 MT 2012 rất đẹp biển tỉnh hồ sơ r&uacute;t cầm tay. Xe trang bị: ghế da cao cấp, t&uacute;i kh&iacute; an to&agrave;n, v&ocirc; lăng t&iacute;ch hợp, gương k&iacute;nh chỉnh điện,.... Xe c&ograve;n rất mới, nội ngoại thất đẹp, m&aacute;y m&oacute;c, th&acirc;n vỏ nguy&ecirc;n bản, lốp sử dụng tốt kh&ocirc;ng phải thay thế, đầy đủ phụ kiện theo xe như m&agrave;n h&igrave;nh camera l&ugrave;i...... Xe kh&ocirc;ng đ&acirc;m đụng kh&ocirc;ng ngập nước, m&aacute;y nguy&ecirc;n bản của nh&agrave; sản xuất. Hỗ trợ sang t&ecirc;n ch&iacute;nh chủ, hỗ trợ trả g&oacute;p l&atilde;i xuất ưu đ&atilde;i thủ tục nhanh gọn. Vui l&ograve;ng li&ecirc;n hệ để biết th&ecirc;m th&ocirc;ng tin chi tiết!</p>', '<p>Th&ocirc;ng số cơ bản<br />\r\nD&agrave;i x Rộng x Cao:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều d&agrave;i cơ sở:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều rộng cơ sở trước/sau:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nTrọng lượng kh&ocirc;ng tải:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(kg)<br />\r\nDung t&iacute;ch b&igrave;nh nhi&ecirc;n liệu:&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(l&iacute;t)<br />\r\nĐộng cơ<br />\r\nĐộng cơ:<br />\r\nKiểu động cơ:<br />\r\nDung t&iacute;ch xi lanh:&nbsp;&nbsp;&nbsp;&nbsp;0 (cc)<br />\r\nPhanh - Giảm x&oacute;c - Lốp<br />\r\nPhanh:<br />\r\nGiảm s&oacute;c:<br />\r\nLốp xe:<br />\r\nV&agrave;nh m&acirc;m xe:<br />\r\nTh&ocirc;ng số kỹ thuật kh&aacute;c</p>', 'Huyndai Avante', 'Huyndai Avante', 'Huyndai Avante', '2022-12-19__4.jpg', 13, 1, 0, 1, 0, '310000000', '2000000', 2, 10, '2022-12-19 15:26:59', '2022-12-25 20:28:45', 2);
INSERT INTO `products` VALUES (127, 'Vinfast Fadil 1.4AT - 2020 Xe cũ Trong nước', 'vinfast-fadil-14at---2020-xe-cu-trong-nuoc', 510000000, 21, 1, 1, 0, 'Siêu thị ô tô Ánh Lý bán xe VinFast Fadil 1.4AT sản xuất 2020 cực đẹp, biển tỉnh hồ sơ rút nhanh gọn. Thiết kế khung xe nguyên khối chắc chắn, kiểu dáng nhỏ gọn, hộp số vô cấp CVT hoạt động mượt mà tiết kiệm nhiên liệu, Sơn si bóng đẹp. Nội thất ghế da cao cấp, màn hình DVD kết hợp camera lùi, dàn â', '<p>Si&ecirc;u thị &ocirc; t&ocirc; &Aacute;nh L&yacute; b&aacute;n xe VinFast Fadil 1.4AT sản xuất 2020 cực đẹp, biển tỉnh hồ sơ r&uacute;t nhanh gọn. Thiết kế khung xe nguy&ecirc;n khối chắc chắn, kiểu d&aacute;ng nhỏ gọn, hộp số v&ocirc; cấp CVT hoạt động mượt m&agrave; tiết kiệm nhi&ecirc;n liệu, Sơn si b&oacute;ng đẹp. Nội thất ghế da cao cấp, m&agrave;n h&igrave;nh DVD kết hợp camera l&ugrave;i, d&agrave;n &acirc;m thanh 6 loa, v&ocirc; lăng t&iacute;ch hợp n&uacute;t bấm+ điều khiển bằng giọng n&oacute;i, điều h&ograve;a 2 chiều m&aacute;t s&acirc;u, gương k&iacute;nh chỉnh điện gập điện,... Hệ thống an to&agrave;n c&acirc;n bằng điện tử ESC, chức năng kiểm so&aacute;t lực k&eacute;o TCS, hỗ trợ khởi h&agrave;ng ngang dốc HSA,hệ thống 2 t&uacute;i kh&iacute;,... Hỗ trợ trả g&oacute;p 70% gi&aacute; trị xe l&atilde;i suất ưu đ&atilde;i</p>', '<p>Th&ocirc;ng số cơ bản<br />\r\nD&agrave;i x Rộng x Cao:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều d&agrave;i cơ sở:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều rộng cơ sở trước/sau:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nTrọng lượng kh&ocirc;ng tải:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(kg)<br />\r\nDung t&iacute;ch b&igrave;nh nhi&ecirc;n liệu:&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(l&iacute;t)<br />\r\nĐộng cơ<br />\r\nĐộng cơ:<br />\r\nKiểu động cơ:<br />\r\nDung t&iacute;ch xi lanh:&nbsp;&nbsp;&nbsp;&nbsp;0 (cc)<br />\r\nPhanh - Giảm x&oacute;c - Lốp<br />\r\nPhanh:<br />\r\nGiảm s&oacute;c:<br />\r\nLốp xe:<br />\r\nV&agrave;nh m&acirc;m xe:<br />\r\nTh&ocirc;ng số kỹ thuật kh&aacute;c</p>', 'Vinfast Fadil', 'Vinfast Fadil', 'Vinfast Fadil', '2022-12-19__1.jpg', 28, 1, 0, 1, 0, '355000000', '3000000', 2, 10, '2022-12-19 15:46:43', '2022-12-26 09:06:41', 2);
INSERT INTO `products` VALUES (128, 'Vinfast Lux SA 2.0AT - 2021 Xe cũ Trong nước', 'vinfast-lux-sa-20at---2021-xe-cu-trong-nuoc', 1250000000, 21, 1, 1, 1, 'Siêu thị Ô tô Ánh Lý bán xe Vinfast LUX SA 2.0 AT Turbo sản xuất năm 2021, xe trang bị Full Options cực đẹp, biển tỉnh hồ sơ rút nhanh gọn. Xe thiết kế ngoại thất sang trọng, màu sắc tinh tế, trang bị Lazang đúc, đèn định vị ban ngày, phanh đĩa 4 bánh,… Nội thất ghế da cao cấp, phanh tay điện tử, Ga', '<p>Si&ecirc;u thị &Ocirc; t&ocirc; &Aacute;nh L&yacute; b&aacute;n xe Vinfast LUX SA 2.0 AT Turbo sản xuất năm 2021, xe trang bị Full Options cực đẹp, biển tỉnh hồ sơ r&uacute;t nhanh gọn. Xe thiết kế ngoại thất sang trọng, m&agrave;u sắc tinh tế, trang bị Lazang đ&uacute;c, đ&egrave;n định vị ban ng&agrave;y, phanh đĩa 4 b&aacute;nh,&hellip; Nội thất ghế da cao cấp, phanh tay điện tử, Ga tự động Cruise Control, m&agrave;n h&igrave;nh cảm ứng 10,4 Inch, đề nổ Start/Stop, điều h&ograve;a 2 chiều, ghế điện, gương k&iacute;nh chỉnh điện, v&ocirc; lăng t&iacute;ch hợp, camera l&ugrave;i, cảm biến quanh xe, t&uacute;i kh&iacute; an to&agrave;n... v&ocirc; v&agrave;n t&iacute;nh năng cao cấp kh&aacute;c - Cam kết xe b&aacute;n ra nguy&ecirc;n bản, kh&ocirc;ng đ&acirc;m đụng, kh&ocirc;ng ngập nước, sơn zin cả xe. - Hỗ trợ trả g&oacute;p l&ecirc;n đến 70 % gi&aacute; trị xe l&atilde;i suất ưu đ&atilde;i thủ tục nhanh gọn!</p>', '<p>Th&ocirc;ng số cơ bản<br />\r\nD&agrave;i x Rộng x Cao:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều d&agrave;i cơ sở:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nChiều rộng cơ sở trước/sau:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)<br />\r\nTrọng lượng kh&ocirc;ng tải:&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(kg)<br />\r\nDung t&iacute;ch b&igrave;nh nhi&ecirc;n liệu:&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(l&iacute;t)<br />\r\nĐộng cơ<br />\r\nĐộng cơ:<br />\r\nKiểu động cơ:<br />\r\nDung t&iacute;ch xi lanh:&nbsp;&nbsp;&nbsp;&nbsp;0 (cc)<br />\r\nPhanh - Giảm x&oacute;c - Lốp<br />\r\nPhanh:<br />\r\nGiảm s&oacute;c:<br />\r\nLốp xe:<br />\r\nV&agrave;nh m&acirc;m xe:<br />\r\nTh&ocirc;ng số kỹ thuật kh&aacute;c</p>', 'Vinfast Lux', 'Vinfast Lux', 'Vinfast Lux', '2022-12-19__2.jpg', 13, 1, 0, 1, 0, '1065000000', '10000000', 1, 30, '2022-12-19 15:50:55', '2022-12-26 09:06:38', 2);

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
) ENGINE = MyISAM AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `search_content` VALUES (78, 'SỰ KIỆN ĐẶC BIỆT CÙNG HEALTHCOCH – CHĂM SÓC SỨC KHỎE TOÀN DIỆN', 'su kien dac biet cung healthcoch – cham soc suc khoe toan dien', '<h2 data-end=\"318\" data-start=\"284\"><strong data-end=\"316\" data-start=\"287\">✨ Sự kiện c&oacute; g&igrave; đặc biệt?</strong></h2>\r\n\r\n<p data-end=\"433\" data-start=\"319\">HealthCoch mang đến một sự kiện đầy &yacute; nghĩa, gi&uacute;p bạn n&acirc;ng cao sức khỏe thể chất v&agrave; tinh thần. C&ugrave;ng tham gia để:</p>\r\n\r\n<p data-end=\"781\" data-start=\"435\">✅ <strong data-end=\"463\" data-start=\"437\">Kh&aacute;m sức khỏe miễn ph&iacute;</strong> &ndash; Nhận tư vấn từ đội ngũ chuy&ecirc;n gia h&agrave;ng đầu.<br data-end=\"512\" data-start=\"509\" />\r\n✅ <strong data-end=\"558\" data-start=\"514\">Workshop dinh dưỡng &amp; lối sống l&agrave;nh mạnh</strong> &ndash; Tối ưu chế độ ăn uống, sinh hoạt khoa học.<br data-end=\"606\" data-start=\"603\" />\r\n✅ <strong data-end=\"644\" data-start=\"608\">Trải nghiệm c&aacute;c b&agrave;i tập thể chất</strong> &ndash; Yoga, thiền định, fitness gi&uacute;p cải thiện sức khỏe.<br data-end=\"700\" data-start=\"697\" />\r\n✅ <strong data-end=\"727\" data-start=\"702\">Bốc thăm tr&uacute;ng thưởng</strong> &ndash; Cơ hội nhận nhiều phần qu&agrave; hấp dẫn từ HealthCoch.</p>\r\n\r\n<h2 data-end=\"808\" data-start=\"783\"><strong data-end=\"806\" data-start=\"786\">Ai n&ecirc;n tham gia?</strong></h2>\r\n\r\n<ul data-end=\"975\" data-start=\"809\">\r\n	<li data-end=\"855\" data-start=\"809\">Người muốn cải thiện sức khỏe v&agrave; lối sống.</li>\r\n	<li data-end=\"908\" data-start=\"856\">C&aacute;c gia đ&igrave;nh mong muốn chế độ dinh dưỡng hợp l&yacute;.</li>\r\n	<li data-end=\"975\" data-start=\"909\">Người quan t&acirc;m đến c&aacute;c phương ph&aacute;p chăm s&oacute;c sức khỏe tự nhi&ecirc;n.</li>\r\n</ul>\r\n\r\n<p data-end=\"1075\" data-start=\"977\">???? <strong data-end=\"996\" data-start=\"980\">Đăng k&yacute; ngay</strong> để kh&ocirc;ng bỏ lỡ cơ hội chăm s&oacute;c bản th&acirc;n v&agrave; tận hưởng những hoạt động bổ &iacute;ch!</p>\r\n\r\n<p data-end=\"1101\" data-start=\"1077\">???? [Điền link đăng k&yacute;]</p>\r\n\r\n<p data-end=\"1133\" data-start=\"1103\">Hẹn gặp bạn tại sự kiện! ????✨</p>\r\n', '✨ su kien co gi dac biet?\r\n\r\nhealthcoch mang den mot su kien day y nghia, giup ban nang cao suc khoe the chat va tinh than. cung tham gia de:\r\n\r\n✅ kham suc khoe mien phi – nhan tu van tu doi ngu chuyen gia hang dau.\r\n✅ workshop dinh duong & loi song lanh manh – toi uu che do an uong, sinh hoat khoa hoc.\r\n✅ trai nghiem cac bai tap the chat – yoga, thien dinh, fitness giup cai thien suc khoe.\r\n✅ boc tham trung thuong – co hoi nhan nhieu phan qua hap dan tu healthcoch.\r\n\r\nai nen tham gia?\r\n\r\n\r\n	nguoi muon cai thien suc khoe va loi song.\r\n	cac gia dinh mong muon che do dinh duong hop ly.\r\n	nguoi quan tam den cac phuong phap cham soc suc khoe tu nhien.\r\n\r\n\r\n???? dang ky ngay de khong bo lo co hoi cham soc ban than va tan huong nhung hoat dong bo ich!\r\n\r\n???? [dien link dang ky]\r\n\r\nhen gap ban tai su kien! ????✨\r\n', '', '', 1740023283, NULL, NULL, 1, '', NULL, 'su-kien-dac-biet-cung-healthcoch-cham-soc-suc-khoe-toan-dien.html', 11, 'id_news', 17, 'news', '');
INSERT INTO `search_content` VALUES (79, 'This is the page of infor', 'this is the page of infor', 'Donec iaculis lacus eget ligula tincidunt, vitae imperdiet enim cursus. Vivamus cursus odio eu consequat sollicitudin. Pellentesque ultrices leo eget justo luctus, sit amet fringilla nisi commodo. Suspendisse sagittis finibus accumsan. Maecenas sed felis nisl. Fusce et eros sapien. Ut eu tortor eget mauris pulvinar sollicitudin. Pellentesque metus augue, gravida sed venenatis quis, dapibus ac nisi. Sed blandit, lacus eu faucibus pellentesque, massa magna condimentum quam', 'donec iaculis lacus eget ligula tincidunt, vitae imperdiet enim cursus. vivamus cursus odio eu consequat sollicitudin. pellentesque ultrices leo eget justo luctus, sit amet fringilla nisi commodo. suspendisse sagittis finibus accumsan. maecenas sed felis nisl. fusce et eros sapien. ut eu tortor eget mauris pulvinar sollicitudin. pellentesque metus augue, gravida sed venenatis quis, dapibus ac nisi. sed blandit, lacus eu faucibus pellentesque, massa magna condimentum quam', '', '', 1740112009, NULL, NULL, 1, '', NULL, 'this-is-the-page-of-infor.html', 0, 'id_info', 8, 'info', '/uploaded/gioi-thieu/23-Foods-That-Help-L.jpg');
INSERT INTO `search_content` VALUES (80, 'uet sagittis ipsum. Maecenas ultricies ', 'uet sagittis ipsum. maecenas ultricies ', 'uet sagittis ipsum. Maecenas ultricies&nbsp;uet sagittis ipsum. Maecenas ultricies&nbsp;uet sagittis ipsum. Maecenas ultricies&nbsp;', 'uet sagittis ipsum. maecenas ultricies uet sagittis ipsum. maecenas ultricies uet sagittis ipsum. maecenas ultricies ', '', '', 1740112110, NULL, NULL, 1, '', NULL, 'uet-sagittis-ipsum-maecenas-ultricies.html', 0, 'id_info', 9, 'info', '/uploaded/gioi-thieu/20201209_thuc-don-an-chay-giam-can-1.jpg');

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
INSERT INTO `service` VALUES (19, 10, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '', '', '/uploaded/ico/icon-insta.png', '', '&nbsp; &nbsp;Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nesciunt placeat voluptatem hic veniet iste quas qui dolor voluptate expedita natu', '', 1739418900, 4, 1, 8, '', 0, '[]', 0, ':', NULL, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit.html', NULL, 1739418984);
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
INSERT INTO `settings` VALUES ('site_name', 'Healcoach');
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
INSERT INTO `settings` VALUES ('document_root', 'C:/xampp/htdocs/healthcoach');
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
INSERT INTO `settingshow` VALUES (1, '1', '{\"newsinpage\":\"9\",\"producthome\":\"3\",\"albumpage\":\"3\",\"productinpage\":\"9\",\"photopage\":\"3\",\"hotline\":\"1900 2021\",\"companyname\":\"Welcome to HealthCoach Theme!!!\",\"companyaddress\":\"K\\u0110T Trung H\\u00f2a Nh\\u00e2n Ch\\u00ednh, Thanh Xu\\u00e2n, H\\u00e0 N\\u1ed9i\",\"companyphone\":\"0968675568 \",\"companyemail\":\"nguyensyminh@gmail.com\",\"companywebsite\":\"http:\\/\\/yourdomainname.com\",\"facebook\":\"https:\\/\\/www.facebook.com\\/yourfanpage\\/\",\"youtube\":\"#\",\"twitter\":\"#\",\"pinterest\":\"#\",\"fanpage\":\"#\",\"apikey\":\"\"}', 0);

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
