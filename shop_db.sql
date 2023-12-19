-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 19, 2023 at 05:05 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--
CREATE DATABASE IF NOT EXISTS `shop_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop_db`;

-- --------------------------------------------------------

--
-- Table structure for table `DanhMuc`
--

CREATE TABLE `DanhMuc` (
  `ma` int(11) NOT NULL,
  `ten` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DanhMuc`
--

INSERT INTO `DanhMuc` (`ma`, `ten`) VALUES
(1, 'Cafe'),
(2, 'Trà'),
(3, 'Sách');

-- --------------------------------------------------------

--
-- Table structure for table `NguoiDung`
--

CREATE TABLE `NguoiDung` (
  `tenDangNhap` varchar(50) NOT NULL,
  `matKhau` varchar(200) NOT NULL,
  `quyen` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `NguoiDung`
--

INSERT INTO `NguoiDung` (`tenDangNhap`, `matKhau`, `quyen`) VALUES
('admin', '1', 1),
('tan', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `SanPham`
--

CREATE TABLE `SanPham` (
  `ma` int(11) NOT NULL,
  `ten` varchar(200) NOT NULL,
  `hinh` text DEFAULT NULL,
  `xuatXu` varchar(50) DEFAULT NULL,
  `gia` int(11) NOT NULL DEFAULT 0,
  `moTa` text DEFAULT NULL,
  `maDanhMuc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SanPham`
--

INSERT INTO `SanPham` (`ma`, `ten`, `hinh`, `xuatXu`, `gia`, `moTa`, `maDanhMuc`) VALUES
(7, 'Cà Phê Chế Phin 1', 'G7-hoa-tan-den-15-goi.jpg', 'vn', 123456, '<p>San pham tot</p>\r\n', 1),
(8, 'Cà Phê Chế Phin 2', 'HinhRetail-15-600x600.jpg', 'vn', 123456, '<p>L&agrave; những sản phẩm được phối trộn từ những hạt c&agrave; ph&ecirc; ngon nhất theo b&iacute; quyết ri&ecirc;ng kh&ocirc;ng thể sao ch&eacute;p của Trung Nguy&ecirc;n. Mỗi tuyệt phẩm c&agrave; ph&ecirc; CHẾ PHIN sở hữu hương thơm v&agrave; vị đặc trưng, l&agrave;m rung động c&aacute;c gi&aacute;c quan của những người s&agrave;nh c&agrave; ph&ecirc; v&agrave; đặc biệt tạo gu ri&ecirc;ng biệt cho mỗi qu&aacute;n c&agrave; ph&ecirc; t&ugrave;y theo mỗi sản phẩm m&agrave; họ lựa chọn.</p>\r\n', 1),
(9, 'Cà Phê Chế Phin 3', 'Lon-thiec-scaled.jpg', 'vn', 123456, '<p>L&agrave; những sản phẩm được phối trộn từ những hạt c&agrave; ph&ecirc; ngon nhất theo b&iacute; quyết ri&ecirc;ng kh&ocirc;ng thể sao ch&eacute;p của Trung Nguy&ecirc;n. Mỗi tuyệt phẩm c&agrave; ph&ecirc; CHẾ PHIN sở hữu hương thơm v&agrave; vị đặc trưng, l&agrave;m rung động c&aacute;c gi&aacute;c quan của những người s&agrave;nh c&agrave; ph&ecirc; v&agrave; đặc biệt tạo gu ri&ecirc;ng biệt cho mỗi qu&aacute;n c&agrave; ph&ecirc; t&ugrave;y theo mỗi sản phẩm m&agrave; họ lựa chọn</p>\r\n', 1),
(10, 'Cà Phê Chế Phin 4', 'Hop-Qua-ABCD.jpg', 'vn', 123456, '<p>L&agrave; những sản phẩm được phối trộn từ những hạt c&agrave; ph&ecirc; ngon nhất theo b&iacute; quyết ri&ecirc;ng kh&ocirc;ng thể sao ch&eacute;p của Trung Nguy&ecirc;n. Mỗi tuyệt phẩm c&agrave; ph&ecirc; CHẾ PHIN sở hữu hương thơm v&agrave; vị đặc trưng, l&agrave;m rung động c&aacute;c gi&aacute;c quan của những người s&agrave;nh c&agrave; ph&ecirc; v&agrave; đặc biệt tạo gu ri&ecirc;ng biệt cho mỗi qu&aacute;n c&agrave; ph&ecirc; t&ugrave;y theo mỗi sản phẩm m&agrave; họ lựa chọn.</p>\r\n', 1),
(11, 'Quyền Lực Của Địa Lý - The Power Of Geography', 'db72a8050a15d86d8102cd21ab1d8b11.jpg.webp', 'vn', 100000, '<p style=\"text-align:justify\">Tim Marshall đ&atilde; nhận x&eacute;t rất x&aacute;c đ&aacute;ng rằng: &quot;C&aacute;c đế chế nổi l&ecirc;n rồi suy t&agrave;n. C&aacute;c li&ecirc;n minh h&igrave;nh th&agrave;nh rồi tan r&atilde;. Thời kỳ h&ograve;a b&igrave;nh ở ch&acirc;u &Acirc;u sau c&aacute;c cuộc chiến của Napoleon k&eacute;o d&agrave;i khoảng s&aacute;u mươi năm; ảo vọng &#39;B&aacute; chủ ngh&igrave;n năm&#39; của Đức quốc x&atilde; cũng chỉ tồn tại hơn một thập ni&ecirc;n. Cho n&ecirc;n kh&ocirc;ng thể biết được ch&iacute;nh x&aacute;c c&aacute;n c&acirc;n quyền lực sẽ thay đổi như thế n&agrave;o trong những năm tớ&quot;</p>\r\n\r\n<p style=\"text-align:justify\">V&agrave; &quot;những nền kinh tế v&agrave; địa ch&iacute;nh trị khổng lồ sẽ tiếp tục c&oacute; sức ảnh hưởng lớn đến c&aacute;c vấn đề to&agrave;n cầu&quot;, v&igrave; vậy m&agrave; trong cuốn s&aacute;ch b&aacute;n chạy Những t&ugrave; nh&acirc;n địa l&yacute; của m&igrave;nh, Tim Marshall đ&atilde; đề cập đến c&aacute;c cường quốc c&oacute; ảnh hưởng đến ch&iacute;nh trị to&agrave;n cầu như Mỹ, Nga, Trung Quốc, EU, Ấn Độ</p>\r\n\r\n<p style=\"text-align:justify\">Tuy thế, c&aacute;c quốc gia nhỏ hơn cũng đ&oacute;ng một vai tr&ograve; quan trọng, v&igrave; địa ch&iacute;nh trị li&ecirc;n quan đến c&aacute;c đồng minh, v&agrave; với trật tự thế giới đang thay đổi kh&ocirc;ng ngừng, c&aacute;c cường quốc lớn cần l&ocirc;i k&eacute;o c&aacute;c nước nhỏ về phe m&igrave;nh v&agrave; ngược lại. Quyền lực của địa l&yacute; sẽ đề cập đến vai tr&ograve;, vị thế của quốc gia v&agrave; v&ugrave;ng l&atilde;nh thổ nhỏ hơn đ&oacute;.</p>\r\n\r\n<p style=\"text-align:justify\">Ch&uacute;ng ta sẽ thấy, liệu Thổ Nhĩ Kỳ, Ả Rập Saudi v&agrave; Anh c&oacute; cơ hội n&agrave;o để gi&agrave;nh lấy quyền lực trong tương lai hay kh&ocirc;ng?</p>\r\n\r\n<p style=\"text-align:justify\">C&oacute; c&aacute;ch g&igrave; h&oacute;a giải được những rắc rối ở v&ugrave;ng Sahel để ngăn chặn cuộc khủng hoảng tị nạn tiếp theo cho ch&acirc;u &Acirc;u kh&ocirc;ng?</p>\r\n\r\n<p style=\"text-align:justify\">V&agrave; kh&ocirc;ng chỉ giới hạn ở &quot;l&atilde;nh địa trần gian&quot;, cuộc đua ch&iacute;nh trị trong kỷ nguy&ecirc;n n&agrave;y sẽ c&ograve;n vượt cả v&agrave;o vũ trụ, khi nhiều quốc gia tuy&ecirc;n bố chủ quyền kh&ocirc;ng gian ở ngo&agrave;i h&agrave;nh tinh. V&agrave; liệu bầu kh&ocirc;ng gian của Tr&aacute;i Đất c&oacute; trở th&agrave;nh chiến trường tiếp theo của thế giới?</p>\r\n\r\n<p style=\"text-align:justify\">TIM MARSAHALL</p>\r\n\r\n<p style=\"text-align:justify\">l&agrave; k&yacute; giả người Anh c&oacute; hơn 25 năm kinh nghiệm về tin tức đối ngoại. Ngo&agrave;i vai tr&ograve; k&yacute; giả v&agrave; bi&ecirc;n tập vi&ecirc;n, Marsall c&ograve;n l&agrave; nh&agrave; b&igrave;nh luận kh&aacute;ch mời về c&aacute;c sự kiện thế giới cho BBC, Sky News. &Ocirc;ng l&agrave; t&aacute;c giả của nhiều cuốn s&aacute;ch b&aacute;n chạy, trong đ&oacute; nổi tiếng nhất l&agrave; Những t&ugrave; nh&acirc;n của địa l&yacute;, được xếp v&agrave;o danh s&aacute;ch b&aacute;n chạy của The New York Times v&agrave; xuất bản ở nhiều quốc gia tr&ecirc;n thế giới; Chia rẽ, đ&atilde; được Nh&atilde; Nam xuất bản v&agrave;o năm 2021.</p>\r\n\r\n<p style=\"text-align:justify\">&ldquo;Địa l&yacute; l&agrave; một yếu tố chủ chốt quyết định giới hạn những g&igrave; nh&acirc;n loại c&oacute; thể v&agrave; kh&ocirc;ng thể l&agrave;m. Đ&uacute;ng l&agrave; c&aacute;c ch&iacute;nh trị gia rất quan trong những địa l&yacute; c&ograve;n quan trong hơn. Những lựa chọn của con người đang v&agrave; sẽ kh&ocirc;ng bao giờ c&oacute; thể t&aacute;ch rời bối cảnh tự nhi&ecirc;n. Xuất ph&aacute;t điểm trong c&acirc;u chuyện của bất kỳ quốc gia n&agrave;o lu&ocirc;n l&agrave; vị tr&iacute; của quốc gia đ&oacute; trong mối quan hệ với c&aacute;c nước l&aacute;ng giềng, c&aacute;c tuyến đường biển v&agrave; t&agrave;i nguy&ecirc;n thi&ecirc;n nhi&ecirc;n. Nếu sống tr&ecirc;n một h&ograve;n đảo lộng gi&oacute; b&ecirc;n ngo&agrave;i Đại T&acirc;y Dương ư? Vậy l&agrave; bạn đ&atilde; ở v&agrave;o vị tr&iacute; tốt để khai th&aacute;c sức mạnh của s&oacute;ng v&agrave; gi&oacute;. Nếu sống ở một đất nước nơi mặt trời chiếu rọi quanh năm? C&aacute;c tấm pin năng lượng mặt trời sẽ l&agrave; con đường tương lai. Nếu sống ở một khu vực c&oacute; mỏ coban? Đ&oacute; c&oacute; thể l&agrave; một phước l&agrave;nh lẫn lời nguyền d&agrave;nh cho bạn.&rdquo;</p>\r\n\r\n<p style=\"text-align:justify\">Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>\r\n', 3),
(12, 'Kiếm Lời Từ Một Trật Tự Thế Giới Mới', 'd29f7122b86c85bf00bec1e1b498623e.jpg.webp', 'vn', 1400000, '<p><span style=\"color:rgb(36, 36, 36); font-family:inter,helvetica,arial,sans-serif; font-size:14px\">&ldquo;Được đ&uacute;c r&uacute;t từ hơn 15 năm kinh nghiệm kinh doanh th&agrave;nh c&ocirc;ng tại Thượng Hải, cuốn s&aacute;ch mới n&agrave;y của Shaun Rein cung cấp một g&oacute;c nh&igrave;n của người trong cuộc về c&aacute;ch sử dụng c&acirc;y gậy v&agrave; củ c&agrave; rốt hết sức tinh vi của Trung Quốc để đạt c&aacute;c mục ti&ecirc;u ch&iacute;nh trị. Cuộc chiến gi&agrave;nh chiếc v&iacute; Trung Quốc cho biết nhiều điều về chiến lược tổng thể của Trung Quốc cũng như c&aacute;c t&aacute;c động của n&oacute; với đời sống người d&acirc;n. Đ&acirc;y l&agrave; một cuốn s&aacute;ch gi&agrave;u th&ocirc;ng tin s&acirc;u sắc, th&uacute; vị v&agrave; đ&aacute;ng đọc đối với cả c&aacute;c chuy&ecirc;n gia về Trung Quốc cũng như c&ocirc;ng ch&uacute;ng n&oacute;i chung.&rdquo; --- Elizabeth Perry, Gi&aacute;o sư Henry Rosovsky ng&agrave;nh Ch&iacute;nh phủ, Đại học Harvard.</span><br />\r\n<br />\r\n<span style=\"color:rgb(36, 36, 36); font-family:inter,helvetica,arial,sans-serif; font-size:14px\">GIỚI THIỆU S&Aacute;CH:</span><br />\r\n<span style=\"color:rgb(36, 36, 36); font-family:inter,helvetica,arial,sans-serif; font-size:14px\">Sau khủng hoảng t&agrave;i ch&iacute;nh 2008, Trung Quốc nổi l&ecirc;n l&agrave; đối t&aacute;c thương mại lớn nhất, hoặc lớn thứ hai, của hầu hết c&aacute;c nước; trở th&agrave;nh thị trường lớn thứ hai cho c&aacute;c c&ocirc;ng ty trong danh s&aacute;ch Fortune 500 như Starbucks, Apple, Nike; v&agrave; li&ecirc;n tục ảnh hưởng đến sự ph&aacute;t triển của c&aacute;c ng&agrave;nh sản xuất v&agrave; dịch vụ to&agrave;n cầu.</span><br />\r\n<br />\r\n<span style=\"color:rgb(36, 36, 36); font-family:inter,helvetica,arial,sans-serif; font-size:14px\">Thế nhưng lợi nhuận lu&ocirc;n đi k&egrave;m theo một c&aacute;i gi&aacute; phải trả: hoặc đi theo những mục ti&ecirc;u ch&iacute;nh trị của Bắc Kinh, hoặc đối mặt với những trừng phạt kinh tế nghi&ecirc;m trọng v&agrave;/hoặc bị cấm bước ch&acirc;n v&agrave;o Trung Quốc. Việc sử dụng c&aacute;c c&ocirc;ng cụ kinh tế để đạt được c&aacute;c mục ti&ecirc;u ch&iacute;nh trị đối ngoại l&agrave; một kh&aacute;i niệm quen thuộc nhưng c&aacute;ch Trung Quốc &aacute;p dụng n&oacute; lại chưa từng c&oacute; tiền lệ tr&ecirc;n thế giới. Vậy l&agrave;m thế n&agrave;o để mở chiếc v&iacute; Trung Hoa v&agrave; thu về lợi nhuận m&agrave; kh&ocirc;ng phải g&aacute;nh chịu đ&ograve;n trừng phạt của nước n&agrave;y hay bị người ti&ecirc;u d&ugrave;ng Trung Quốc quay lưng?</span><br />\r\n<br />\r\n<span style=\"color:rgb(36, 36, 36); font-family:inter,helvetica,arial,sans-serif; font-size:14px\">&ldquo;Đ&acirc;y l&agrave; cuốn s&aacute;ch thứ ba của nh&agrave; quan s&aacute;t sắc sảo Shaun Rein b&agrave;n về nền kinh tế ph&aacute;t triển nhanh ch&oacute;ng của Trung Quốc. Ti&ecirc;u điểm của n&oacute; l&agrave; c&aacute;ch Trung Quốc sử dụng c&aacute;c ch&iacute;nh s&aacute;ch kinh tế đối ngoại, trải d&agrave;i từ hạn chế thương mại đến tẩy chay đến nỗ lực ph&aacute;t triển cơ sở hạ tầng của thế giới trong s&aacute;ng kiến &lsquo;Một v&agrave;nh đai, một con đường&rsquo;, cho tới c&aacute;c mục ti&ecirc;u quốc tế rộng hơn. Đ&acirc;y l&agrave; một cuốn s&aacute;ch sống động về một chủ đề quan trọng vốn chỉ được b&aacute;o ch&iacute; v&agrave; cộng đồng học thuật đề cập một c&aacute;ch sơ lược.&rdquo; --- Dwight H. Perkins, Gi&aacute;o sư danh dự ng&agrave;nh Kinh tế, Đại học Harvard</span></p>\r\n', 3),
(13, 'Economix - Các Nền Kinh Tế Vận Hành (Và Không Vận Hành) Thế Nào Và Tại Sao?', 'c807a27bc03b4f8176c4f7fd89b94ff9.jpg.webp', 'vn', 1234567, '<p style=\"text-align:justify\">Economix - C&aacute;c Nền Kinh Tế Vận H&agrave;nh (V&agrave; Kh&ocirc;ng Vận H&agrave;nh) Thế N&agrave;o V&agrave; Tại Sao?<br />\r\nNếu c&aacute;c bạn từng t&igrave;m c&aacute;ch hiểu những kh&aacute;i niệm kinh tế qua việc đọc v&ocirc; số gi&aacute;o tr&igrave;nh kinh tế học, nhưng vẫn thấy thật kh&oacute; h&igrave;nh dung được bức tranh to&agrave;n cảnh về bộ m&ocirc;n n&agrave;y, th&igrave; cuốn s&aacute;ch sẽ cung cấp cho c&aacute;c bạnmột mảnh gh&eacute;p ho&agrave;n chỉnh cho những mảnh nho nhỏ m&agrave; c&aacute;c bạn đ&atilde; đọc qua.<br />\r\nCh&uacute;ng ta sẽ hiểu r&otilde; hơn về những kh&aacute;i niệm kinh tế cơ bản c&ugrave;ng những học thuyết kinh tế lớn c&ograve;n ảnh hưởng tới ng&agrave;y nay, qua tư tưởng của c&aacute;c nh&agrave; kinh tế học lớn như: Adam Smith, John K<br />\r\nC&oacute; thể coi đ&acirc;y l&agrave; một cuốn sử về lịch sử kinh tế thế giới kể từ khi nền kinh tế h&agrave;ng h&oacute;a ra đời. Ch&uacute;ng ta sẽ lướt qua v&agrave;i thế kỷ với v&ocirc; số học thuyết về kinh tế học c&ugrave;ng những vụ khủng hoảng kinh tế lớn như thể đang đọc một cuốn truyện tranh, cả bi lẫn h&agrave;i, căng thẳng m&agrave; kh&ocirc;ng k&eacute;m phần sảng kho&aacute;i.<br />\r\n&ldquo;Cuốn s&aacute;ch h&oacute;m hỉnh v&agrave; th&uacute; vị n&agrave;y động chạm đến v&ocirc; số vấn đề phức tạp &ndash; kinh tế học, lịch sử v&agrave; t&agrave;i ch&iacute;nh &ndash; v&agrave; khiến những vấn đề ấy trở n&ecirc;n dễ hiểu với cả những người dốt nhất.&rdquo;<br />\r\n&ndash; Miami Herald<br />\r\n&ldquo;Economix đem lại một cảm gi&aacute;c sống động về chủ đề v&ocirc; c&ugrave;ng kh&oacute; hiểu n&agrave;y m&agrave; kh&ocirc;ng phải đơn giản h&oacute;a n&oacute; hoặc khiến độc giả khiếp h&atilde;i.&rdquo;<br />\r\n&ndash; MotherJ</p>\r\n\r\n<p style=\"text-align:justify\">Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>\r\n', 3),
(14, 'Trà Oolong Kim Tuyên Cầu Đất - Hộp 220Gr - Dalat Farm ', 'a21b6248e8be72948787f37ec5ca1839.jpg.webp', 'vn', 123456, '<p><span style=\"color:rgb(36, 36, 36); font-family:inter,helvetica,arial,sans-serif; font-size:14px\">Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</span></p>\r\n', 2),
(15, 'Trà Hoa Cúc Vàng DalatFarm - Hộp 50 g', '83f7757e6f0990f57beb1666996056cb.jpg.webp', 'vn', 123456, '<p style=\"text-align:justify\">TH&Ocirc;NG TIN CHI TIẾT SẢN PHẨM :</p>\r\n\r\n<p style=\"text-align:justify\">&bull; Th&agrave;nh phần: 100% hoa c&uacute;c tự nhi&ecirc;n.</p>\r\n\r\n<p style=\"text-align:justify\">&bull; Hương vị: tr&agrave; c&oacute; nước pha trong, thơm thảo mộc.</p>\r\n\r\n<p style=\"text-align:justify\">&bull; Hướng dẫn bảo quản: Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp mặt trời. Lu&ocirc;n đ&oacute;ng k&iacute;n bao tr&agrave; sau khi sử dụng.</p>\r\n\r\n<p style=\"text-align:justify\">&bull; Th&ocirc;ng tin cảnh b&aacute;o an to&agrave;n, vệ sinh: kh&ocirc;ng sử dụng khi sản phẩm c&oacute; hiện tượng nấm mốc, m&ugrave;i lạ</p>\r\n', 2),
(16, 'Lốc 6 Chai Trà Ô Long Tea+ Plus (450ml/Chai)', 'aad6762eb72b74ece1661e4f3e69bb43.JPG.webp', 'vn', 600000, '<p style=\"text-align:justify\">Tr&agrave; &Ocirc; Long TEA+ Plus&nbsp;l&agrave; sản phẩm mang thương hiệu Suntory đầu ti&ecirc;n được ra mắt tại thị trường Vi&ecirc;̣t Nam từ th&aacute;ng 8 năm 2013. Được sản xuất tr&ecirc;n quy tr&igrave;nh c&ocirc;ng nghệ hiện đại, th&ocirc;ng qua quy tr&igrave;nh kiểm duyệt chặt chẽ, kh&ocirc;ng c&oacute; đường h&oacute;a học, kh&ocirc;ng chứa h&oacute;a chất độc hại, đảm bảo an to&agrave;n cho người sử dụng.</p>\r\n\r\n<p style=\"text-align:justify\">Hương vị thanh m&aacute;t, hậu vị nhẹ của những l&aacute; tr&agrave; &ocirc; long tự nhi&ecirc;n hảo hạng được sơ chế sẵn h&ograve;a quyện mang đến cho bạn một cơ thể khỏe mạnh, tinh thần sảng kho&aacute;i suốt ng&agrave;y d&agrave;i, cho bạn hiệu quả c&ocirc;ng việc cao hơn.Đặc biệt sản phẩm chứa OTTP (Oolong Tea Polymerized Polyphenols) - một th&agrave;nh phần tự nhi&ecirc;n chiết xuất từ l&aacute; tr&agrave; &Ocirc; long gi&uacute;p hạn chế hấp thu chất b&eacute;o, người nhẹ nh&agrave;ng, d&aacute;ng thanh tao.</p>\r\n\r\n<ul>\r\n	<li>Thiết kế: Chai 450ml</li>\r\n	<li>Số lượng: 24 Chai/ th&ugrave;ng</li>\r\n	<li>HSD: 12 th&aacute;ng kể từ ng&agrave;y sản xuất</li>\r\n	<li>Bảo quản nơi sạch sẽ, kh&ocirc; r&aacute;o tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng mặt trời.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">Tr&agrave; &Ocirc; Long TEA+ Plus - Uống Cho Ng&agrave;y Th&ecirc;m Nhẹ.</p>\r\n\r\n<p style=\"text-align:justify\">#Tr&agrave;&Ocirc;LongTEA+ #NgườiNhẹNh&agrave;ng #D&aacute;ngThanhTao</p>\r\n\r\n<p style=\"text-align:justify\">Gi&aacute; sản phẩm tr&ecirc;n Tiki đ&atilde; bao gồm thuế theo luật hiện h&agrave;nh. B&ecirc;n cạnh đ&oacute;, tuỳ v&agrave;o loại sản phẩm, h&igrave;nh thức v&agrave; địa chỉ giao h&agrave;ng m&agrave; c&oacute; thể ph&aacute;t sinh th&ecirc;m chi ph&iacute; kh&aacute;c như ph&iacute; vận chuyển, phụ ph&iacute; h&agrave;ng cồng kềnh, thuế nhập khẩu (đối với đơn h&agrave;ng giao từ nước ngo&agrave;i c&oacute; gi&aacute; trị tr&ecirc;n 1 triệu đồng).....</p>\r\n', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `DanhMuc`
--
ALTER TABLE `DanhMuc`
  ADD PRIMARY KEY (`ma`);

--
-- Indexes for table `NguoiDung`
--
ALTER TABLE `NguoiDung`
  ADD PRIMARY KEY (`tenDangNhap`);

--
-- Indexes for table `SanPham`
--
ALTER TABLE `SanPham`
  ADD PRIMARY KEY (`ma`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `DanhMuc`
--
ALTER TABLE `DanhMuc`
  MODIFY `ma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `SanPham`
--
ALTER TABLE `SanPham`
  MODIFY `ma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
