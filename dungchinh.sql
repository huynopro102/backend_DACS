-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: db
-- Thời gian đã tạo: Th3 06, 2025 lúc 09:37 AM
-- Phiên bản máy phục vụ: 8.4.4
-- Phiên bản PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dungchinh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Banner`
--

CREATE TABLE `Banner` (
  `IdBanner` int NOT NULL,
  `Horizontal` double NOT NULL,
  `Vertical` double NOT NULL,
  `IDImages` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Customer`
--

CREATE TABLE `Customer` (
  `IDCustomer` int NOT NULL,
  `Username` char(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CustomerName` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PhoneCustomer` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CustomerAddress` longtext,
  `CitizenIdentificationCode` char(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Sex` int DEFAULT NULL,
  `IdImages` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `Customer`
--

INSERT INTO `Customer` (`IDCustomer`, `Username`, `CustomerName`, `PhoneCustomer`, `CustomerAddress`, `CitizenIdentificationCode`, `DateOfBirth`, `Sex`, `IdImages`) VALUES
(16, 'nguyen huy', 'nguyen tuan huy', '0344403943', 'QUẬN 9 , PHƯỜNG TẰNG NHƠN PHÚ A , 39/12 ĐƯỜNG 102', '0', NULL, 1, NULL),
(17, 'nguyentuan huy', '', '', '', '', '2003-12-09', 0, NULL),
(18, 'nguyen d', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `DeliveryNotes`
--

CREATE TABLE `DeliveryNotes` (
  `IdDeliveryNotes` int NOT NULL,
  `IDInvoice` int NOT NULL,
  `DateCreated` date NOT NULL,
  `DeliveryAddress` longtext NOT NULL,
  `RecipientPhone` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Status` int NOT NULL,
  `IDStaff` int DEFAULT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `DeliveryNotes`
--

INSERT INTO `DeliveryNotes` (`IdDeliveryNotes`, `IDInvoice`, `DateCreated`, `DeliveryAddress`, `RecipientPhone`, `Status`, `IDStaff`, `Name`) VALUES
(8, 30, '2025-03-05', 'hcm', '0344403943', 1, NULL, 'nguyen tuan huy'),
(9, 32, '2025-03-05', 'bac giang', '344403888', 3, 9, 'nguyen d');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Footer`
--

CREATE TABLE `Footer` (
  `IDfooter` int NOT NULL,
  `Content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Images`
--

CREATE TABLE `Images` (
  `IDImages` int NOT NULL,
  `NameImages` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `UrlImages` char(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `Images`
--

INSERT INTO `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES
(26, 'AirPods Pro 2.png', 'https://res.cloudinary.com/ducvyera2/image/upload/v1741146566/img_products/pni4r9h1fs7hphlxd3yn.png'),
(27, 'Sony WF-1000XM4.jpg', 'https://res.cloudinary.com/ducvyera2/image/upload/v1741146646/img_products/ylol3zamzbwqgoblu61e.jpg'),
(28, 'Samsung Galaxy Buds Pro.png', 'https://res.cloudinary.com/ducvyera2/image/upload/v1741146688/img_products/xoou80v3g7lphtexmbg4.png'),
(29, 'BEATS STUDIO PRO.png', 'https://res.cloudinary.com/ducvyera2/image/upload/v1741146725/img_products/ivjwozbw2bjh7xvnan2y.png'),
(30, 'AirPods Pro 2_image_2.jpg', 'https://res.cloudinary.com/ducvyera2/image/upload/v1741149047/img_products/jy22ymvg48wx4ntuo6xj.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ImportedProducts`
--

CREATE TABLE `ImportedProducts` (
  `IDImportedProducts` int NOT NULL,
  `IDStaff` int NOT NULL,
  `IDWarehouse` int NOT NULL,
  `DateCreated` date NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `ImportedProducts`
--

INSERT INTO `ImportedProducts` (`IDImportedProducts`, `IDStaff`, `IDWarehouse`, `DateCreated`, `Status`) VALUES
(5, 10, 4, '2025-03-05', 'Completed');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ImportedProductsDetail`
--

CREATE TABLE `ImportedProductsDetail` (
  `IDImportedProducts` int NOT NULL,
  `IDProduct` int NOT NULL,
  `Quantity` int NOT NULL,
  `InputPrice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `ImportedProductsDetail`
--

INSERT INTO `ImportedProductsDetail` (`IDImportedProducts`, `IDProduct`, `Quantity`, `InputPrice`) VALUES
(5, 2, 999, 200000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Invoice`
--

CREATE TABLE `Invoice` (
  `IDInvoice` int NOT NULL,
  `IDCustomer` int NOT NULL,
  `IDStaff` int DEFAULT NULL,
  `DateCreated` date NOT NULL,
  `Status` int NOT NULL,
  `PaymentMethods` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `Invoice`
--

INSERT INTO `Invoice` (`IDInvoice`, `IDCustomer`, `IDStaff`, `DateCreated`, `Status`, `PaymentMethods`) VALUES
(30, 17, NULL, '2025-03-05', 1, 'PaymentOnDelivery'),
(32, 18, 9, '2025-03-05', 3, 'onlinePayment');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Invoicedetails`
--

CREATE TABLE `Invoicedetails` (
  `IDInvoice` int NOT NULL,
  `IDProduct` int NOT NULL,
  `TotalQuantity` int NOT NULL,
  `Price` decimal(18,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `Invoicedetails`
--

INSERT INTO `Invoicedetails` (`IDInvoice`, `IDProduct`, `TotalQuantity`, `Price`) VALUES
(30, 5, 2, 222995),
(32, 2, 2, 179990),
(32, 4, 2, 191970),
(32, 5, 1, 222995);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Product`
--

CREATE TABLE `Product` (
  `IDProduct` int NOT NULL,
  `ProductName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ProductDescription` longtext,
  `IDProductType` int NOT NULL,
  `IDSupplier` int NOT NULL,
  `Price` decimal(18,0) NOT NULL,
  `Sale` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `Product`
--

INSERT INTO `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES
(2, 'AirPods Pro 2', 'Chủ Động Khử Tiếng Ồn lên đến 2 lần. Tính năng Chủ Động Khử Tiếng Ồn lên đến 2 lần. \r\nÂm Thanh Thích Ứng hoàn toàn mới điều chỉnh việc kiểm soát tiếng ồn theo môi trường của bạn một cách thông minh.\r\nChế độ Âm Thanh Không Gian nâng tầm trải nghiệm âm thanh sống động. Và một lần sạc mang lại thời lượng pin lên đến 6 giờ. --Hiệu năng âm thanh\r\nH2.\r\nThêm đắm chìm\r\ntrong thế giới\r\nâm thanh.\r\nChip H2 do Apple thiết kế là sức mạnh đằng sau AirPods Pro và hiệu năng âm thanh tiên tiến của sản phẩm này. \r\nChip hoạt động đồng thời với bộ khuếch đại và trình điều khiển tùy chỉnh giúp mang đến những nốt cao rõ ràng,\r\ntrong trẻo và âm trầm sâu lắng, đầy đặn đến bất ngờ. Vì thế mọi âm thanh đều ấn tượng hơn bao giờ hết.--\r\nChip H2 thực hiện được nhiều chức năng hơn bao giờ hết, bằng cách sử dụng các thuật toán để đồng thời mang đến khả năng khử tiếng ồn thông minh hơn\r\n, âm thanh ba chiều cao cấp cùng thời lượng pin hiệu suất cao hơn.', 5, 1, 180000, 10),
(3, 'Sony WF-1000XM4', 'Công nghệ chống ồn tiên tiến – nay còn xuất sắc hơn\r\nMọi chi tiết trong tai nghe WF-1000XM4 đều được thiết kế mới hoàn toàn. Chẳng hạn như Bộ xử lý tích hợp V1 mới được Sony phát \r\ntriển riêng với khả năng chống ồn tốt hơn bao giờ hết, củ loa mới với hiệu suất cao hơn, micro cảm biến tiếng ồn và Miếng đệm tai\r\nchống ồn cải tiến cho cảm giác vừa vặn hơn.', 5, 2, 132222, 3.4),
(4, 'Samsung Galaxy Buds Pro', 'Nâng tầm trải nghiệm âm với Chống Ồn Chủ Động\r\nChuẩn âm thanh studio với loa 2 chiều AKG mạnh mẽ\r\nÂm thanh vòm, chuẩn chất điện ảnh từ 360 Audio*\r\nĐàm thoại rõ ràng với hệ thống 3 mic cải tiến mới -- Tính năng Chống Ồn Chủ Động (Active Noise Canceling) trên Galaxy Buds Pro lọc \r\nấn tượng đến 99% tiếng ồn xung quanh. Mic bên trong và mic bên ngoài của tai nghe có khả năng kiểm soát hiệu quả tiếng ồn trong thời \r\ngian thực. Bằng một thuật toán thông minh giúp loại bỏ tiếng ồn, bạn có thể chọn các mức ANC để tăng hoặc giảm âm thanh phù hợp theo\r\ntừng không gian như sau: chuyển lên mức Cao với những không gian ồn hoặc chuyển xuống mức Thấp khi đang ở trong những không gian yên \r\ntĩnh như thư viện - tất cả đều diễn ra nhanh chóng, không cần phải thay đổi âm lượng. ', 5, 3, 192000, 30),
(5, 'BEATS STUDIO PRO', ' Bảo Hành 03 Tháng\r\n Trang bị công nghệ Chống ồn chủ động thích ứng Adaptive Active Noise Cancelling và Xuyên âm Transparency được nâng cấp đáng kể.\r\n Bluetooth 5.3 tiên tiến giúp kết nối mạnh và ổn định, có trang bị dây AUX 3.5mm đi kèm.\r\nThời lượng pin lên tới 24 giờ có bật chống ồn ANC, hỗ trợ sạc nhanh 10 phút mang lại 4 giờ hoạt động tiện lợi -- Thiết kế \r\ncủa tai nghe Beats Studio Pro (LIKE NEW) không có quá nhiều thay đổi so với thế hệ tiền nhiệm. Vẫn mang trên mình ngôn ngữ \r\nthiết kế đã quá huyền thoại của Beats, tuy nhiên độ bền bỉ của mẫu tai nghe này được nâng cấp hơn hẳn so với thế hệ trước\r\nnhờ sử dụng loạt vật liệu tốt hơn, giúp tai nghe chống lại xoắn gấp và va đập tốt hơn.', 7, 5, 223000, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ProductImagesDetails`
--

CREATE TABLE `ProductImagesDetails` (
  `IDImages` int NOT NULL,
  `IDProduct` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `ProductImagesDetails`
--

INSERT INTO `ProductImagesDetails` (`IDImages`, `IDProduct`) VALUES
(26, 2),
(30, 2),
(27, 3),
(28, 4),
(29, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ProductType`
--

CREATE TABLE `ProductType` (
  `IDProductType` int NOT NULL,
  `ProductTypeName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `ProductType`
--

INSERT INTO `ProductType` (`IDProductType`, `ProductTypeName`) VALUES
(1, 'Tai nghe True Wireless'),
(2, 'Tai nghe Gaming'),
(3, 'Tai nghe Bluetooth'),
(5, 'Tai nghe In-Ear'),
(6, 'Tai nghe On-Ear'),
(7, 'Tai nghe Over-Ear');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Shopping cart`
--

CREATE TABLE `Shopping cart` (
  `IDshoppingCart` int NOT NULL,
  `IDCustomer` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shoppingCartDeltails`
--

CREATE TABLE `shoppingCartDeltails` (
  `IDshoppingCart` int NOT NULL,
  `IDProduct` int NOT NULL,
  `Quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Skill`
--

CREATE TABLE `Skill` (
  `IdSkill` int NOT NULL,
  `NameSkill` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `Skill`
--

INSERT INTO `Skill` (`IdSkill`, `NameSkill`) VALUES
(1, 'Kỹ năng quản lí nhân viên'),
(2, 'Kỹ năng bán hàng'),
(3, 'Kỹ năng quản lí đơn hàng giao hàng'),
(4, 'Kỹ năng quản lí sản phẩm'),
(5, 'Kỹ năng quản lí kho'),
(7, 'Kỹ năng quản lí loại sản phẩm'),
(8, 'Kỹ năng quản lí khách hàng'),
(9, 'kỹ năng quản lí và tạo phiếu giao hàng'),
(10, 'Kỹ năng Quản lí hóa đơn của khách hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `SkillDetails`
--

CREATE TABLE `SkillDetails` (
  `IdSkill` int NOT NULL,
  `IDStaff` int NOT NULL,
  `updateDay` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `SkillDetails`
--

INSERT INTO `SkillDetails` (`IdSkill`, `IDStaff`, `updateDay`) VALUES
(3, 10, '2024-02-02 00:00:00.000'),
(8, 9, '2024-02-02 00:00:00.000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Staff`
--

CREATE TABLE `Staff` (
  `IDStaff` int NOT NULL,
  `StaffName` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Username` char(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `StaffAddress` longtext NOT NULL,
  `PhoneStaff` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `CitizenIdentificationCode` char(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `IDStaffType` int NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Sex` int NOT NULL,
  `IdImages` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `Staff`
--

INSERT INTO `Staff` (`IDStaff`, `StaffName`, `Username`, `StaffAddress`, `PhoneStaff`, `CitizenIdentificationCode`, `IDStaffType`, `DateOfBirth`, `Sex`, `IdImages`) VALUES
(9, 'Huy', 'User_NV1', 'HN', '0995248653', '766168163267', 3, '1990-03-07', 1, NULL),
(10, 'Ân', 'User_NV2', 'HCM', '0923418654', '43832453786', 6, '1997-06-08', 1, NULL),
(11, 'Ngao', 'User_NV3', 'HCM', '0942642482', '26784773652', 4, '1999-09-05', 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `StaffType`
--

CREATE TABLE `StaffType` (
  `IDStaffType` int NOT NULL,
  `StaffTypeName` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `StaffType`
--

INSERT INTO `StaffType` (`IDStaffType`, `StaffTypeName`) VALUES
(1, 'Admin'),
(2, 'Nhân viên quản lí'),
(3, 'Nhân viên bán hàng'),
(4, 'Nhân viên giao hàng'),
(5, 'Nhân viên kế toán'),
(6, 'Nhân viên quản lý kho'),
(8, 'sss');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Supplier`
--

CREATE TABLE `Supplier` (
  `IDSupplier` int NOT NULL,
  `SupplierName` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `PhoneSupplier` char(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `SupplierAddress` longtext NOT NULL,
  `EmailSupplier` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `Supplier`
--

INSERT INTO `Supplier` (`IDSupplier`, `SupplierName`, `PhoneSupplier`, `SupplierAddress`, `EmailSupplier`) VALUES
(1, 'Apple', '18001192', 'Phòng 901, Ngôi Nhà Đức Tại Tp. Hồ Chí Minh, số 33, đường Lê Duẩn, Phường Bến Nghé, Quận 1, thành phố Hồ Chí Minh, Việt Nam', 'Apple@gamil.com.vn'),
(2, 'Sony', '02838222227', 'TẦNG 6 VÀ 7, TÒA NHÀ PRESIDENT PLACE, 93 NGUYỄN DU, PHƯỜNG BẾN NGHÉ, QUẬN 1, TP. HỒ CHÍ MINH.', 'Sony@gamil.com.vn'),
(3, 'Samsung', '2839157310', ' Số 2, đường Hải Triều, Phường Bến Nghé, Quận 1, TP. Hồ Chí Minh', 'Samsung@gamil.com.vn'),
(4, 'JBL', '6299055253', 'JBL STORE CRESCENT MALL | 101 Đ Tôn Dật Tiên, Tân Phú, Quận 7, Thành phố Hồ Chí Minh', 'JBL@gamil.com.vn'),
(5, 'Beats', '0941144666', 'Cơ sở 3: 12 ngõ 860 phố Minh Khai, quận Hai Bà Trưng, Hà Nội.', 'Razer@gmail.com.vn'),
(6, 'sp n', '0909093333', 'address', 'adfda@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tamthoi`
--

CREATE TABLE `tamthoi` (
  `tenKhachHang` varchar(40) NOT NULL,
  `soDienThoai` int NOT NULL,
  `diaChi` varchar(200) NOT NULL,
  `totalPrice` int NOT NULL,
  `cartItems` text,
  `tongsoluong` int NOT NULL,
  `idUser` varchar(50) NOT NULL,
  `secretKey` varchar(200) NOT NULL,
  `transactionCode` int NOT NULL,
  `isProcessed` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `tamthoi`
--

INSERT INTO `tamthoi` (`tenKhachHang`, `soDienThoai`, `diaChi`, `totalPrice`, `cartItems`, `tongsoluong`, `idUser`, `secretKey`, `transactionCode`, `isProcessed`) VALUES
('nguyen tuan huyu', 344403943, 'lam dong', 191970, '\"[{\\\"IDProduct\\\":4,\\\"Price\\\":\\\"192000\\\",\\\"ProductName\\\":\\\"Samsung Galaxy Buds Pro\\\",\\\"Sale\\\":30,\\\"SupplierName\\\":\\\"Samsung\\\",\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146688/img_products/xoou80v3g7lphtexmbg4.png\\\",\\\"soluong\\\":1}]\"', 1, 'nguyentuan huy', 'WSAMGYWMSYBANCQFZCBIVQEUJMPDHWCA', 5130931, 0),
('nguyen tuan huy', 344403943, 'hcm', 191970, '\"[{\\\"IDProduct\\\":4,\\\"Price\\\":\\\"192000\\\",\\\"ProductName\\\":\\\"Samsung Galaxy Buds Pro\\\",\\\"Sale\\\":30,\\\"SupplierName\\\":\\\"Samsung\\\",\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146688/img_products/xoou80v3g7lphtexmbg4.png\\\",\\\"soluong\\\":1}]\"', 1, 'nguyentuan huy', 'WSAMGYWMSYBANCQFZCBIVQEUJMPDHWCA', 5131007, 0),
('nguyen tuan huy', 344403943, 'hcm', 191970, '\"[{\\\"IDProduct\\\":4,\\\"Price\\\":\\\"192000\\\",\\\"ProductName\\\":\\\"Samsung Galaxy Buds Pro\\\",\\\"Sale\\\":30,\\\"SupplierName\\\":\\\"Samsung\\\",\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146688/img_products/xoou80v3g7lphtexmbg4.png\\\",\\\"soluong\\\":1}]\"', 1, 'nguyentuan huy', 'WSAMGYWMSYBANCQFZCBIVQEUJMPDHWCA', 5131122, 0),
('nguyen tuan huy', 33, 'd', 191970, '\"[{\\\"IDProduct\\\":4,\\\"Price\\\":\\\"192000\\\",\\\"ProductName\\\":\\\"Samsung Galaxy Buds Pro\\\",\\\"Sale\\\":30,\\\"SupplierName\\\":\\\"Samsung\\\",\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146688/img_products/xoou80v3g7lphtexmbg4.png\\\",\\\"soluong\\\":1}]\"', 1, 'nguyentuan huy', 'WSAMGYWMSYBANCQFZCBIVQEUJMPDHWCA', 5132132, 0),
('nguyen tuan huy', 344403943, 'hcm', 191970, '\"[{\\\"IDProduct\\\":4,\\\"Price\\\":\\\"192000\\\",\\\"ProductName\\\":\\\"Samsung Galaxy Buds Pro\\\",\\\"Sale\\\":30,\\\"SupplierName\\\":\\\"Samsung\\\",\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146688/img_products/xoou80v3g7lphtexmbg4.png\\\",\\\"soluong\\\":1}]\"', 1, 'nguyentuan huy', 'HLFGCI52X7U4GQUO07F5K2L3EUKLRA9S', 5164656, 0),
('nguyen van d', 344498247, 'binh duong', 966915, '\"[{\\\"IDProduct\\\":4,\\\"Price\\\":\\\"192000\\\",\\\"ProductName\\\":\\\"Samsung Galaxy Buds Pro\\\",\\\"Sale\\\":30,\\\"SupplierName\\\":\\\"Samsung\\\",\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146688/img_products/xoou80v3g7lphtexmbg4.png\\\",\\\"soluong\\\":2},{\\\"IDProduct\\\":5,\\\"Price\\\":\\\"223000\\\",\\\"ProductName\\\":\\\"BEATS STUDIO PRO\\\",\\\"Sale\\\":5,\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146725/img_products/ivjwozbw2bjh7xvnan2y.png\\\",\\\"soluong\\\":1},{\\\"IDProduct\\\":2,\\\"Price\\\":\\\"180000\\\",\\\"ProductName\\\":\\\"AirPods Pro 2\\\",\\\"Sale\\\":10,\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146566/img_products/pni4r9h1fs7hphlxd3yn.png\\\",\\\"soluong\\\":2}]\"', 5, 'nguyen d', 'MMR1KGAL60DZX72L752EOUTNCBQZB6MJ', 5190655, 0),
('nguyen van d', 344403999, 'da nang', 966915, '\"[{\\\"IDProduct\\\":4,\\\"Price\\\":\\\"192000\\\",\\\"ProductName\\\":\\\"Samsung Galaxy Buds Pro\\\",\\\"Sale\\\":30,\\\"SupplierName\\\":\\\"Samsung\\\",\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146688/img_products/xoou80v3g7lphtexmbg4.png\\\",\\\"soluong\\\":2},{\\\"IDProduct\\\":5,\\\"Price\\\":\\\"223000\\\",\\\"ProductName\\\":\\\"BEATS STUDIO PRO\\\",\\\"Sale\\\":5,\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146725/img_products/ivjwozbw2bjh7xvnan2y.png\\\",\\\"soluong\\\":1},{\\\"IDProduct\\\":2,\\\"Price\\\":\\\"180000\\\",\\\"ProductName\\\":\\\"AirPods Pro 2\\\",\\\"Sale\\\":10,\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146566/img_products/pni4r9h1fs7hphlxd3yn.png\\\",\\\"soluong\\\":2}]\"', 5, 'nguyen d', 'MMR1KGAL60DZX72L752EOUTNCBQZB6MJ', 5194802, 0),
('nguyen van d', 344403888, 'bac giang', 966915, '\"[{\\\"IDProduct\\\":4,\\\"Price\\\":\\\"192000\\\",\\\"ProductName\\\":\\\"Samsung Galaxy Buds Pro\\\",\\\"Sale\\\":30,\\\"SupplierName\\\":\\\"Samsung\\\",\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146688/img_products/xoou80v3g7lphtexmbg4.png\\\",\\\"soluong\\\":2},{\\\"IDProduct\\\":5,\\\"Price\\\":\\\"223000\\\",\\\"ProductName\\\":\\\"BEATS STUDIO PRO\\\",\\\"Sale\\\":5,\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146725/img_products/ivjwozbw2bjh7xvnan2y.png\\\",\\\"soluong\\\":1},{\\\"IDProduct\\\":2,\\\"Price\\\":\\\"180000\\\",\\\"ProductName\\\":\\\"AirPods Pro 2\\\",\\\"Sale\\\":10,\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146566/img_products/pni4r9h1fs7hphlxd3yn.png\\\",\\\"soluong\\\":2}]\"', 5, 'nguyen d', 'MMR1KGAL60DZX72L752EOUTNCBQZB6MJ', 5195149, 0),
('nguyen van d', 344403888, 'bac giang', 966915, '\"[{\\\"IDProduct\\\":4,\\\"Price\\\":\\\"192000\\\",\\\"ProductName\\\":\\\"Samsung Galaxy Buds Pro\\\",\\\"Sale\\\":30,\\\"SupplierName\\\":\\\"Samsung\\\",\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146688/img_products/xoou80v3g7lphtexmbg4.png\\\",\\\"soluong\\\":2},{\\\"IDProduct\\\":5,\\\"Price\\\":\\\"223000\\\",\\\"ProductName\\\":\\\"BEATS STUDIO PRO\\\",\\\"Sale\\\":5,\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146725/img_products/ivjwozbw2bjh7xvnan2y.png\\\",\\\"soluong\\\":1},{\\\"IDProduct\\\":2,\\\"Price\\\":\\\"180000\\\",\\\"ProductName\\\":\\\"AirPods Pro 2\\\",\\\"Sale\\\":10,\\\"url\\\":\\\"https://res.cloudinary.com/ducvyera2/image/upload/v1741146566/img_products/pni4r9h1fs7hphlxd3yn.png\\\",\\\"soluong\\\":2}]\"', 5, 'nguyen d', 'MMR1KGAL60DZX72L752EOUTNCBQZB6MJ', 5195326, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `User`
--

CREATE TABLE `User` (
  `Username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Email` char(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Check` int NOT NULL,
  `google_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `User`
--

INSERT INTO `User` (`Username`, `Email`, `Password`, `Check`, `google_id`) VALUES
('Adminlor', 'Admin@gmail.com', '$2b$10$uRqj7VTd19BS9/rZpMTvEuEScybzXYizSc28G3WKQbdzYYUSDZiqu', 3, NULL),
('nguyen d', 'sodienthoai1230123@gmail.com', '$2b$10$jQXPGjwwkhx/I/uGFLEKNOYWipiCK2k8ZTd6iu/zLNL96wW7HtSRq', 1, NULL),
('nguyen huy', 'huynopro102@gmail.com', '$2b$10$jkQaLUe/9WXgIIJOWtThze/TI.gR.rP728so5HnIRKjIynjfB2uZS', 1, '116564034558518562722'),
('nguyentuan huy', 'tuanhuy16903@gmail.com', '$2b$10$RvFQHWV9ha7XyxIagxYeOO9gEqZpY0Q39Ff1q8XLl9/IaVvLLGIVa', 1, NULL),
('User_NV1', 'nhanvien1@gmail.com', '$2b$10$MSRxC5wfzDg9HhifoA0wfeCDVIfklzDMinJ6uXOEcls42pJVF/B/i', 1, NULL),
('User_NV2', 'nhanvien2@gmail.com', '$2b$10$FjRECFUTN9fEoM4rMM/Oi.s4iN1gljJAnie8gvmpNo.YCFr/HYztG', 1, NULL),
('User_NV3', 'nhanvien3@gmail.com', '$2b$10$9saP.UOSRX08XwKbVJDVKe6Y3iSc9obag.6iDCIxEKD0QUl7.2JKK', 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Warehouse`
--

CREATE TABLE `Warehouse` (
  `IDWarehouse` int NOT NULL,
  `WarehouseName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `WarehouseAddress` longtext NOT NULL,
  `DateCreated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `Warehouse`
--

INSERT INTO `Warehouse` (`IDWarehouse`, `WarehouseName`, `WarehouseAddress`, `DateCreated`) VALUES
(2, 'Kho-1', '39 đường Hùng Vương, xã Vĩnh Thanh, Nhơn Trạch, Đồng Nai', '2024-07-04'),
(4, 'Kho-2', 'Ấp Hòa Bình, xã Vĩnh Thanh, Nhơn Trạch, Đồng Nai', '2024-04-03'),
(6, 'aaa', 'aaaa', '2222-02-22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `Warehousedetails`
--

CREATE TABLE `Warehousedetails` (
  `IDWarehouse` int NOT NULL,
  `IDProduct` int NOT NULL,
  `QuantityInStock` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `Warehousedetails`
--

INSERT INTO `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES
(4, 2, 999);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `Banner`
--
ALTER TABLE `Banner`
  ADD PRIMARY KEY (`IdBanner`),
  ADD KEY `FK_Banner_Images` (`IDImages`);

--
-- Chỉ mục cho bảng `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`IDCustomer`),
  ADD KEY `FK_Customer_Images` (`IdImages`),
  ADD KEY `FK_Customer_User` (`Username`);

--
-- Chỉ mục cho bảng `DeliveryNotes`
--
ALTER TABLE `DeliveryNotes`
  ADD PRIMARY KEY (`IdDeliveryNotes`),
  ADD KEY `FK_DeliveryNotes_Invoice` (`IDInvoice`),
  ADD KEY `FK_DeliveryNotes_Staff` (`IDStaff`);

--
-- Chỉ mục cho bảng `Footer`
--
ALTER TABLE `Footer`
  ADD PRIMARY KEY (`IDfooter`);

--
-- Chỉ mục cho bảng `Images`
--
ALTER TABLE `Images`
  ADD PRIMARY KEY (`IDImages`);

--
-- Chỉ mục cho bảng `ImportedProducts`
--
ALTER TABLE `ImportedProducts`
  ADD PRIMARY KEY (`IDImportedProducts`),
  ADD KEY `FK_Imported Products Detail_Staff` (`IDStaff`),
  ADD KEY `FK_Imported Products Detail_Warehouse` (`IDWarehouse`);

--
-- Chỉ mục cho bảng `ImportedProductsDetail`
--
ALTER TABLE `ImportedProductsDetail`
  ADD PRIMARY KEY (`IDImportedProducts`,`IDProduct`),
  ADD KEY `FK_ImportedProductsDetail_Product` (`IDProduct`);

--
-- Chỉ mục cho bảng `Invoice`
--
ALTER TABLE `Invoice`
  ADD PRIMARY KEY (`IDInvoice`),
  ADD KEY `FK_Invoice_Customer` (`IDCustomer`),
  ADD KEY `FK_Invoice_Staff` (`IDStaff`);

--
-- Chỉ mục cho bảng `Invoicedetails`
--
ALTER TABLE `Invoicedetails`
  ADD PRIMARY KEY (`IDInvoice`,`IDProduct`),
  ADD KEY `FK_Invoicedetails_Product` (`IDProduct`);

--
-- Chỉ mục cho bảng `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`IDProduct`),
  ADD KEY `FK_Product_ProductType` (`IDProductType`),
  ADD KEY `FK_Product_Supplier` (`IDSupplier`);

--
-- Chỉ mục cho bảng `ProductImagesDetails`
--
ALTER TABLE `ProductImagesDetails`
  ADD PRIMARY KEY (`IDImages`,`IDProduct`),
  ADD KEY `FK_ProductImagesDetails_Product` (`IDProduct`);

--
-- Chỉ mục cho bảng `ProductType`
--
ALTER TABLE `ProductType`
  ADD PRIMARY KEY (`IDProductType`);

--
-- Chỉ mục cho bảng `Shopping cart`
--
ALTER TABLE `Shopping cart`
  ADD PRIMARY KEY (`IDshoppingCart`),
  ADD KEY `FK_Shopping cart_Customer` (`IDCustomer`);

--
-- Chỉ mục cho bảng `shoppingCartDeltails`
--
ALTER TABLE `shoppingCartDeltails`
  ADD PRIMARY KEY (`IDshoppingCart`,`IDProduct`),
  ADD KEY `FK_shoppingCartDeltails_Product` (`IDProduct`);

--
-- Chỉ mục cho bảng `Skill`
--
ALTER TABLE `Skill`
  ADD PRIMARY KEY (`IdSkill`);

--
-- Chỉ mục cho bảng `SkillDetails`
--
ALTER TABLE `SkillDetails`
  ADD PRIMARY KEY (`IdSkill`,`IDStaff`),
  ADD KEY `FK_SkillDetails_Staff` (`IDStaff`);

--
-- Chỉ mục cho bảng `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`IDStaff`),
  ADD KEY `FK_Staff_Images` (`IdImages`),
  ADD KEY `FK_Staff_StaffType` (`IDStaffType`),
  ADD KEY `FK_Staff_User` (`Username`);

--
-- Chỉ mục cho bảng `StaffType`
--
ALTER TABLE `StaffType`
  ADD PRIMARY KEY (`IDStaffType`);

--
-- Chỉ mục cho bảng `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`IDSupplier`);

--
-- Chỉ mục cho bảng `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`Username`);

--
-- Chỉ mục cho bảng `Warehouse`
--
ALTER TABLE `Warehouse`
  ADD PRIMARY KEY (`IDWarehouse`);

--
-- Chỉ mục cho bảng `Warehousedetails`
--
ALTER TABLE `Warehousedetails`
  ADD PRIMARY KEY (`IDWarehouse`,`IDProduct`),
  ADD KEY `FK_Warehousedetails_Product` (`IDProduct`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `Banner`
--
ALTER TABLE `Banner`
  MODIFY `IdBanner` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `Customer`
--
ALTER TABLE `Customer`
  MODIFY `IDCustomer` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `DeliveryNotes`
--
ALTER TABLE `DeliveryNotes`
  MODIFY `IdDeliveryNotes` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `Footer`
--
ALTER TABLE `Footer`
  MODIFY `IDfooter` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `Images`
--
ALTER TABLE `Images`
  MODIFY `IDImages` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `ImportedProducts`
--
ALTER TABLE `ImportedProducts`
  MODIFY `IDImportedProducts` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `Invoice`
--
ALTER TABLE `Invoice`
  MODIFY `IDInvoice` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `Product`
--
ALTER TABLE `Product`
  MODIFY `IDProduct` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1038;

--
-- AUTO_INCREMENT cho bảng `ProductType`
--
ALTER TABLE `ProductType`
  MODIFY `IDProductType` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `Shopping cart`
--
ALTER TABLE `Shopping cart`
  MODIFY `IDshoppingCart` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `Skill`
--
ALTER TABLE `Skill`
  MODIFY `IdSkill` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `Staff`
--
ALTER TABLE `Staff`
  MODIFY `IDStaff` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `StaffType`
--
ALTER TABLE `StaffType`
  MODIFY `IDStaffType` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `Supplier`
--
ALTER TABLE `Supplier`
  MODIFY `IDSupplier` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `Warehouse`
--
ALTER TABLE `Warehouse`
  MODIFY `IDWarehouse` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ràng buộc đối với các bảng kết xuất
--

--
-- Ràng buộc cho bảng `Banner`
--
ALTER TABLE `Banner`
  ADD CONSTRAINT `FK_Banner_Images` FOREIGN KEY (`IDImages`) REFERENCES `Images` (`IDImages`);

--
-- Ràng buộc cho bảng `Customer`
--
ALTER TABLE `Customer`
  ADD CONSTRAINT `FK_Customer_Images` FOREIGN KEY (`IdImages`) REFERENCES `Images` (`IDImages`),
  ADD CONSTRAINT `FK_Customer_User` FOREIGN KEY (`Username`) REFERENCES `User` (`Username`);

--
-- Ràng buộc cho bảng `DeliveryNotes`
--
ALTER TABLE `DeliveryNotes`
  ADD CONSTRAINT `FK_DeliveryNotes_Invoice` FOREIGN KEY (`IDInvoice`) REFERENCES `Invoice` (`IDInvoice`),
  ADD CONSTRAINT `FK_DeliveryNotes_Staff` FOREIGN KEY (`IDStaff`) REFERENCES `Staff` (`IDStaff`);

--
-- Ràng buộc cho bảng `ImportedProducts`
--
ALTER TABLE `ImportedProducts`
  ADD CONSTRAINT `FK_Imported Products Detail_Staff` FOREIGN KEY (`IDStaff`) REFERENCES `Staff` (`IDStaff`),
  ADD CONSTRAINT `FK_Imported Products Detail_Warehouse` FOREIGN KEY (`IDWarehouse`) REFERENCES `Warehouse` (`IDWarehouse`);

--
-- Ràng buộc cho bảng `ImportedProductsDetail`
--
ALTER TABLE `ImportedProductsDetail`
  ADD CONSTRAINT `FK_ImportedProductsDetail_Imported Products` FOREIGN KEY (`IDImportedProducts`) REFERENCES `ImportedProducts` (`IDImportedProducts`),
  ADD CONSTRAINT `FK_ImportedProductsDetail_Product` FOREIGN KEY (`IDProduct`) REFERENCES `Product` (`IDProduct`);

--
-- Ràng buộc cho bảng `Invoice`
--
ALTER TABLE `Invoice`
  ADD CONSTRAINT `FK_Invoice_Customer` FOREIGN KEY (`IDCustomer`) REFERENCES `Customer` (`IDCustomer`),
  ADD CONSTRAINT `FK_Invoice_Staff` FOREIGN KEY (`IDStaff`) REFERENCES `Staff` (`IDStaff`);

--
-- Ràng buộc cho bảng `Invoicedetails`
--
ALTER TABLE `Invoicedetails`
  ADD CONSTRAINT `FK_Invoicedetails_Invoice` FOREIGN KEY (`IDInvoice`) REFERENCES `Invoice` (`IDInvoice`),
  ADD CONSTRAINT `FK_Invoicedetails_Product` FOREIGN KEY (`IDProduct`) REFERENCES `Product` (`IDProduct`);

--
-- Ràng buộc cho bảng `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `FK_Product_ProductType` FOREIGN KEY (`IDProductType`) REFERENCES `ProductType` (`IDProductType`),
  ADD CONSTRAINT `FK_Product_Supplier` FOREIGN KEY (`IDSupplier`) REFERENCES `Supplier` (`IDSupplier`);

--
-- Ràng buộc cho bảng `ProductImagesDetails`
--
ALTER TABLE `ProductImagesDetails`
  ADD CONSTRAINT `FK_ProductImagesDetails_Images` FOREIGN KEY (`IDImages`) REFERENCES `Images` (`IDImages`),
  ADD CONSTRAINT `FK_ProductImagesDetails_Product` FOREIGN KEY (`IDProduct`) REFERENCES `Product` (`IDProduct`);

--
-- Ràng buộc cho bảng `Shopping cart`
--
ALTER TABLE `Shopping cart`
  ADD CONSTRAINT `FK_Shopping cart_Customer` FOREIGN KEY (`IDCustomer`) REFERENCES `Customer` (`IDCustomer`);

--
-- Ràng buộc cho bảng `shoppingCartDeltails`
--
ALTER TABLE `shoppingCartDeltails`
  ADD CONSTRAINT `FK_shoppingCartDeltails_Product` FOREIGN KEY (`IDProduct`) REFERENCES `Product` (`IDProduct`),
  ADD CONSTRAINT `FK_shoppingCartDeltails_Shopping cart` FOREIGN KEY (`IDshoppingCart`) REFERENCES `Shopping cart` (`IDshoppingCart`);

--
-- Ràng buộc cho bảng `SkillDetails`
--
ALTER TABLE `SkillDetails`
  ADD CONSTRAINT `FK_SkillDetails_Skill` FOREIGN KEY (`IdSkill`) REFERENCES `Skill` (`IdSkill`),
  ADD CONSTRAINT `FK_SkillDetails_Staff` FOREIGN KEY (`IDStaff`) REFERENCES `Staff` (`IDStaff`);

--
-- Ràng buộc cho bảng `Staff`
--
ALTER TABLE `Staff`
  ADD CONSTRAINT `FK_Staff_Images` FOREIGN KEY (`IdImages`) REFERENCES `Images` (`IDImages`),
  ADD CONSTRAINT `FK_Staff_StaffType` FOREIGN KEY (`IDStaffType`) REFERENCES `StaffType` (`IDStaffType`),
  ADD CONSTRAINT `FK_Staff_User` FOREIGN KEY (`Username`) REFERENCES `User` (`Username`);

--
-- Ràng buộc cho bảng `Warehousedetails`
--
ALTER TABLE `Warehousedetails`
  ADD CONSTRAINT `FK_Warehousedetails_Product` FOREIGN KEY (`IDProduct`) REFERENCES `Product` (`IDProduct`),
  ADD CONSTRAINT `FK_Warehousedetails_Warehouse` FOREIGN KEY (`IDWarehouse`) REFERENCES `Warehouse` (`IDWarehouse`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
