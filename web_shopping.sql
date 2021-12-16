/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : web_shopping

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 16/12/2021 10:57:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CustomerEmail` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CustomerPhoneNumber` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CustomerPassword` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (9, 'Phạm Đinh Quốc Hòa', 'hoadaknong101@gmail.com', '0388891635', '123');
INSERT INTO `customer` VALUES (10, 'Phạm Đinh Quốc Dương', 'quocduong0599@gmail.com', '0977753732', 'sda#442@');
INSERT INTO `customer` VALUES (15, 'Nguyễn Duy Mạnh', 'nhatphi1598753@gmail.com', '0388891635', 'jy');
INSERT INTO `customer` VALUES (16, 'Nguyễn Đức Mạnh', 'hoadaknong101@gmail.com', '0989978898', 'eqw##232^5');
INSERT INTO `customer` VALUES (26, 'Nguyễn Quang Xang', 'nhatphi1598753@gmail.com', '0388891635', '123');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `OrderID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `OrderDate` datetime NULL DEFAULT NULL,
  `OrderTotalPrice` float NULL DEFAULT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`OrderID`) USING BTREE,
  INDEX `FK_idx`(`CustomerID`) USING BTREE,
  CONSTRAINT `FK` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `OrderDetailsID` int NOT NULL AUTO_INCREMENT,
  `OrderProductName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OrderProductQuantity` int NULL DEFAULT NULL,
  `OrderProductPrice` float NULL DEFAULT NULL,
  `ProductID` int NULL DEFAULT NULL,
  `OrderID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`OrderDetailsID`) USING BTREE,
  INDEX `FK_OrderID_idx`(`OrderID`) USING BTREE,
  INDEX `F_ProductID_idx`(`ProductID`) USING BTREE,
  CONSTRAINT `F_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_details
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ProductPrice` float NULL DEFAULT NULL,
  `ProductImage` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ProductDescription` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ProductQuantity` int NULL DEFAULT NULL,
  `ProductCategory` int NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`) USING BTREE,
  INDEX `FK_ProductCategory_idx`(`ProductCategory`) USING BTREE,
  CONSTRAINT `FK_ProductCategory` FOREIGN KEY (`ProductCategory`) REFERENCES `product_category` (`ProductCategoryID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Bút bi Thiên Long', 3000, 'https://vanphongphamtmt.vn/wp-content/uploads/2019/09/tl-027-xanh.jpg', 'Mô tả bút bi Thiên Long', 2, 1);
INSERT INTO `product` VALUES (2, 'Bút Chì Kim Bấm 0.5 mm', 46000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/i/m/image_195509_1_42011.jpg', 'Bút Chì Kim Bấm 0.5 mm - Pentel A255 - Màu Đen Thích hợp cho giới văn phòng Sản phẩm chính hãng Pentel - Japan', 1, 1);
INSERT INTO `product` VALUES (5, 'Bút Chì Kim Tự Động 0.5 mm - Pentel P365S-V - Màu Tím', 129000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/i/m/image_195509_1_8622.jpg', 'Với thiết kế tinh tế, chất lượng vượt trội, bút chì bấm sẽ là người bạn đồng hành đáng tin cậy của bạn.', 1, 1);
INSERT INTO `product` VALUES (8, 'Viết Nước My-Gel Đông A - Mực Đỏ', 11000, 'https://cdn0.fahasa.com/media/catalog/product/i/m/image_195509_1_6921.jpg', 'Viết Nước My-Gel Đông A - Mực Đỏ được thiết kế với kiểu dáng đẹp và gọn nhẹ.\r\n\r\nBút với nét viết nhỏ giúp nét viết êm, mực xuống đều không bị nghẹt mực.', 1, 1);
INSERT INTO `product` VALUES (10, 'Bút Chì Kim Nắp Đậy 0.5 mm - Pentel A105C-K - Xanh Lá', 31500, 'https://cdn0.fahasa.com/media/catalog/product/1/9/1901011312986.jpg', 'Sản phẩm sở hữu kiểu dáng tròn, tuy đơn giản nhưng kết hợp hoàn hảo với màu đen cổ điển đã tạo thành một thiết kế rất sang trọng và tinh tế.', 1, 1);
INSERT INTO `product` VALUES (12, 'Vở gáy xoắn mềm SU-SV331BT-B - 50 Trang, Size A5, Màu Xanh', 63000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/1/9/19_11.jpg', 'Vở được làm từ chất liệu giấy cao cấp bề mặt trơn mịn bám mực tốt giúp bạn ghi chú nhanh chóng, dễ dàng, nét chữ không bị phai, nhòe, lem màu trong quá trình sử dụng.', 1, 2);
INSERT INTO `product` VALUES (13, 'Tập New Repete 4 Ly Ngang 96 Trang - Campus NB-ANRE96 (Mẫu Màu Giao Ngẫu Nhiên)', 12000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/8/9/8936038724101-mau1-_2_.jpg', 'Tập 4 Ô Ly Ngang 96 Trang - Campus New Repete 2017 - Màu Vàng - NB-ANRE96 là quyển tập 4 ô ly sở hữu kiểu dáng tinh tế, trang nhã với hoa văn trên bìa sổ độc đáo, ấn tượng màu sắc hài hòa kết hợp những cạnh bo mềm mại.', 1, 2);
INSERT INTO `product` VALUES (14, 'Vở Class Ami - 4 Ô Ly 96 Trang ĐL 100g/m2 - Hồng Hà 0371 (Mẫu Màu Giao Ngẫu Nhiên)', 13000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/i/m/image_195509_1_12392.jpg', 'Vở Hồng Hà Class Ami 4 Ôly 96 Trang 0371 được thiết kế với những hình ảnh bắt mắt, giúp bé hứng thú hơn với việc học.Bề mặt giấy láng mịn, viết êm tay, không nhoè, không bụi, tạo nét chữ đẹp. Rất phù hợp với học sinh cấp một.', 1, 2);
INSERT INTO `product` VALUES (15, 'Vở Học Sinh Class Monster - 4 Ô Ly 96 Trang ĐL 80g/m2 - Hồng Hà 0428 (Mẫu Màu Giao Ngẫu Nhiên)', 10000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/8/9/8935044504288-mau4-_2__1.jpg', 'Sản phẩm được thiết kế với những hình ảnh bắt mắt, giúp bé hứng thú hơn với việc học.\r\n\r\nBề mặt giấy láng mịn, viết êm tay, không nhoè, không bụi, tạo nét chữ đẹp.', 1, 2);
INSERT INTO `product` VALUES (16, 'Vở Class ABC - 4 Ô Ly 96 Trang ĐL 100g/m2 - Hồng Hà - Hình Chữ O', 12000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/8/9/8935044504011_1_.jpg', 'Bề mặt giấy láng mịn, viết êm tay, không nhoè, không bụi, tạo nét chữ đẹp. Rất phù hợp với học sinh cấp một.', 1, 2);
INSERT INTO `product` VALUES (17, 'Bìa Kẹp Giấy A4 ESPP 8806BK - Màu Đen', 6400, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/8/8/8888572761084.jpg', 'Làm từ chất liệu PP chắc chắn, chịu va đập cao.', 1, 3);
INSERT INTO `product` VALUES (18, 'Espp_Bìa Kẹp Giấy A4 8806 Hồng', 6400, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/i/m/image_195509_1_2238.jpg', 'Có kẹp giấy cứng cáp, giúp giữ giấy tờ luôn gọn gàng, thẳng nếp.', 1, 3);
INSERT INTO `product` VALUES (19, 'Bìa Còng A4 Espp 7 Phân - Màu Đỏ', 36000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/i/m/image_195509_1_10679.jpg', 'Bìa còng không chỉ giúp bạn lưu giữ, bảo quản tài liệu, hồ sơ mà còn mang lại không gian ngăn nắp, gọn gàng cho bàn làm việc của bạn.', 1, 3);
INSERT INTO `product` VALUES (20, 'Espp Bìa Còng BẬt 2 A4 Xanh Dương A4 5 Phân', 22500, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/i/m/image_133769_thanh_ly.jpg', 'Espp Bìa Còng BẬt 2 A4 Xanh Dương A4 5 Phân (2\'\')', 1, 3);
INSERT INTO `product` VALUES (35, 'Bìa Còng Bật 2 F4 Espp - Màu Xanh', 36000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/i/m/image_195509_1_10665.jpg', 'Còng được làm từ kim loại cứng, chắc, phủ lớp niken sáng bóng, chống gỉ sét, bạn có thể thoải mái tháo gỡ để thêm bớt tài liệu mà không lo bị lờn.', 1, 3);
INSERT INTO `product` VALUES (36, 'Bìa Còng Bật A4 ESPP - 7 Phân (3\'\') - Màu Xanh', 36000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/i/m/image_195509_1_2243.jpg', 'Espp Bìa Còng Bật A4 7 Phân (3\'\') Xanh là một trong những dụng cụ không thể thiếu của giới văn phòng. Sản phẩm không chỉ giúp bạn lưu giữ, bảo quản tài liệu, hồ sơ mà còn mang lại không gian ngăn nắp, gọn gàng cho bàn làm việc.', 1, 3);
INSERT INTO `product` VALUES (37, 'Máy Tính Văn Phòng Casio MS - 10F', 274500, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/600x600/9df78eab33525d08d6e5fb8d27136e95/4/5/4549526701306-2.jpg', 'Với các phép tính khó và dài bạn không thể nào tính toán bằng cách thủ công được. Do đó hãng Casio đã cho ra đời hàng loạt máy tính bỏ túi sẽ hỗ trợ công việc tính toán được nhanh chóng hơn.', 1, 10);
INSERT INTO `product` VALUES (38, 'Máy Tính Văn Phòng Casio DX - 120B - W-DC', 369900, 'https://cdn0.fahasa.com/media/catalog/product/4/9/4971850032267-1_1.jpg', 'Với các phép tính khó và dài bạn không thể nào tính toán bằng cách thủ công được. Do đó hãng Casio đã cho ra đời hàng loạt máy tính bỏ túi sẽ hỗ trợ công việc tính toán được nhanh chóng hơn.', 1, 10);
INSERT INTO `product` VALUES (39, 'Máy Tính Văn Phòng Casio DJ 120D Plus', 462600, 'https://cdn0.fahasa.com/media/catalog/product/i/m/image_195509_1_19948.jpg', 'Máy tính có màn hình to rõ, hiển thị tới 12 số, các chữ số đã được bản đại hóa phân tách 4 chữ số thuận tiện.', 1, 10);
INSERT INTO `product` VALUES (40, 'Máy Tính Văn Phòng Casio MS20UC-LB', 297900, 'https://cdn0.fahasa.com/media/catalog/product/4/5/4549526603679.jpg', 'Là một sản phẩm tiện ích, không thể thiếu trong việc tính toán hàng ngày. Máy tính có màn hình to rõ, hiển thị tới 12 số, các chữ số đã được bản đại hóa phân tách 4 chữ số thuận tiện.', 1, 10);
INSERT INTO `product` VALUES (41, 'Máy Tính Văn Phòng Casio SL310UC-RG', 176400, 'https://cdn0.fahasa.com/media/catalog/product/4/5/4549526603792.jpg', 'Vỏ máy được làm bằng chất liệu nhựa cao cấp, kháng vỡ, có độ bền cao. Máy tính có thiết kế dạng để bàn tiện lợi, kích thước nhỏ gọn dạng mini tiện lợi.', 1, 10);
INSERT INTO `product` VALUES (42, 'Giấy Photo Excel A4 80 Gsm (500 Tờ)', 80000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_195509_1_28485.jpg', '1', 1, 11);
INSERT INTO `product` VALUES (43, 'Giấy In A4 70 Gsm King100 Chenming', 68000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_244133.jpg', '1', 1, 11);
INSERT INTO `product` VALUES (44, 'Giấy In Ảnh ĐL 180', 90000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_195509_1_7904.jpg', '1', 1, 11);
INSERT INTO `product` VALUES (45, 'Giấy Photo Excel Max A4 70gsm (500 Tờ)', 69000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/8/9/8936063361043-_4_.jpg', '1', 1, 11);
INSERT INTO `product` VALUES (46, 'Giấy Photo Ik Plus A4/80', 102000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_195509_1_2733.jpg', '1', 1, 11);
INSERT INTO `product` VALUES (47, 'Giấy Photo Excel A5 70 Gsm (500 Tờ)', 36000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_243532.jpg', '1', 1, 11);
INSERT INTO `product` VALUES (48, 'Khay Cắm Bút Deli 9154 - Màu Xanh Nhạt', 133000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/6/9/6921734991546-mau2.jpg', '1', 1, 12);
INSERT INTO `product` VALUES (49, 'Khay Cắm Bút Đa Năng O-Life S118E - Mẫu 2 - Trắng Đen', 129000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_195509_1_40281.jpg', '1', 1, 12);
INSERT INTO `product` VALUES (50, 'Khay Cắm Bút 4 Ngăn Xoay (mica) Deli-0906', 75000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/6/9/6921734909060_1.jpg', '1', 1, 12);
INSERT INTO `product` VALUES (51, 'Khay Cắm Bút - Toppoint HY69058 - Màu Đen', 95000, 'https://cdn0.fahasa.com/media/catalog/product/6/9/6926532090583-_2__2.jpg', '1', 1, 12);
INSERT INTO `product` VALUES (52, 'Cắm Bút HX-1001', 93000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_195509_1_13900.jpg', '1', 1, 12);
INSERT INTO `product` VALUES (53, 'Khay Cắm Bút 4 Ngăn - Moshi Moshi 4N-013 - Màu Xám', 136000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_244718_1_4698.jpg', '1', 1, 12);
INSERT INTO `product` VALUES (54, 'Mực Bút Máy Quink Cao Cấp PARKER', 216000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_240886.jpg', '1', 1, 13);
INSERT INTO `product` VALUES (55, 'Mực Bút Lông Bảng Flexoffice FO-WBI02', 24500, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/8/9/8935001878469-do_2.jpg', '1', 1, 13);
INSERT INTO `product` VALUES (56, 'Mực Bút Lông Bảng FO-WBI02 ', 24500, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_133144.jpg', '1', 1, 13);
INSERT INTO `product` VALUES (57, 'Mực Viết Máy Queen - Mực Đen', 14000, 'https://cdn0.fahasa.com/media/catalog/product/cache/1/small_image/400x400/9df78eab33525d08d6e5fb8d27136e95/i/m/image_196196.jpg', '1', 1, 13);

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `ProductCategoryID` int NOT NULL AUTO_INCREMENT,
  `ProductCategoryName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ProductCategoryID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, 'Bút');
INSERT INTO `product_category` VALUES (2, 'T&#7853;p v&#7903; s&#7893;');
INSERT INTO `product_category` VALUES (3, 'Bìa k&#7865;p');
INSERT INTO `product_category` VALUES (10, 'Máy tính &#273;i&#7879;n t&#7917;');
INSERT INTO `product_category` VALUES (11, 'Gi&#7845;y in');
INSERT INTO `product_category` VALUES (12, 'Khay k&#7879; c&#7855;m bút');
INSERT INTO `product_category` VALUES (13, 'M&#7921;c');
INSERT INTO `product_category` VALUES (14, 'D&#7909;ng c&#7909; h&#7885;c t&#7853;p');
INSERT INTO `product_category` VALUES (15, 'Dao kéo bàn c&#7855;t gi&#7845;y');
INSERT INTO `product_category` VALUES (16, 'Hóa đơn');
INSERT INTO `product_category` VALUES (18, 'Sản phẩm khác');

SET FOREIGN_KEY_CHECKS = 1;
