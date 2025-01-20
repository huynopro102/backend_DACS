-- SQLINES DEMO *** ver ko phải của mysql
USE `dungchinh`;
 
/* SQLINES DEMO *** able [dbo].[Banner]    Script Date: 4/24/2024 6:55:29 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE `Banner`(
	`IdBanner` int AUTO_INCREMENT NOT NULL,
	`Horizontal` Double NOT NULL,
	`Vertical` Double NOT NULL,
	`IDImages` int NOT NULL,
 CONSTRAINT `PK_Banner` PRIMARY KEY 
(
	`IdBanner` ASC
) 
);
/* SQLINES DEMO *** able [dbo].[Customer]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Customer`(
	`IDCustomer` int AUTO_INCREMENT NOT NULL,
	`Username` nchar(20) NOT NULL,
	`CustomerName` nvarchar(35) NULL,
	`PhoneCustomer` nchar(10) NULL,
	`CustomerAddress` Longtext NULL,
	`CitizenIdentificationCode` nchar(12) NULL,
	`DateOfBirth` date NULL,
	`Sex` int NULL,
	`IdImages` int NULL,
 CONSTRAINT `PK_Customer` PRIMARY KEY 
(
	`IDCustomer` ASC
) 
) ;
/* SQLINES DEMO *** able [dbo].[DeliveryNotes]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `DeliveryNotes`(
	`IdDeliveryNotes` int AUTO_INCREMENT NOT NULL,
	`IDInvoice` int NOT NULL,
	`DateCreated` date NOT NULL,
	`DeliveryAddress` Longtext NOT NULL,
	`RecipientPhone` nchar(10) NOT NULL,
	`Status` int NOT NULL,
	`IDStaff` int NULL,
 CONSTRAINT `PK_DeliveryNotes` PRIMARY KEY 
(
	`IdDeliveryNotes` ASC
) 
) ;
/* SQLINES DEMO *** able [dbo].[Footer]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Footer`(
	`IDfooter` int AUTO_INCREMENT NOT NULL,
	`Content` Longtext NOT NULL,
 CONSTRAINT `PK_Footer` PRIMARY KEY 
(
	`IDfooter` ASC
) 
) ;
/* SQLINES DEMO *** able [dbo].[Images]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Images`(
	`IDImages` int AUTO_INCREMENT NOT NULL,
	`NameImages` nvarchar(50) NOT NULL,
	`UrlImages` nchar(120) NULL,
 CONSTRAINT `PK_Produc1Images` PRIMARY KEY 
(
	`IDImages` ASC
) 
);
/* SQLINES DEMO *** able [dbo].[Imported Products]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Imported Products`(
	`IDImportedProducts` int AUTO_INCREMENT NOT NULL,
	`IDStaff` int NOT NULL,
	`IDWarehouse` int NOT NULL,
	`DateCreated` date NOT NULL,
 CONSTRAINT `PK_Imported Products Detail` PRIMARY KEY 
(
	`IDImportedProducts` ASC
) 
);
/* SQLINES DEMO *** able [dbo].[ImportedProductsDetail]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `ImportedProductsDetail`(
	`IDImportedProducts` int NOT NULL,
	`IDProduct` int NOT NULL,
	`Quantity` int NOT NULL,
	`InputPrice` Double NOT NULL,
 CONSTRAINT `PK_ImportedProductsDetail` PRIMARY KEY 
(
	`IDImportedProducts` ASC,
	`IDProduct` ASC
) 
);
/* SQLINES DEMO *** able [dbo].[Invoice]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Invoice`(
	`IDInvoice` int AUTO_INCREMENT NOT NULL,
	`IDCustomer` int NOT NULL,
	`IDStaff` int NULL,
	`DateCreated` date NOT NULL,
	`Status` int NOT NULL,
 CONSTRAINT `PK_Bill` PRIMARY KEY 
(
	`IDInvoice` ASC
) 
);
/* SQLINES DEMO *** able [dbo].[Invoicedetails]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Invoicedetails`(
	`IDInvoice` int NOT NULL,
	`IDProduct` int NOT NULL,
	`TotalQuantity` int NOT NULL,
	`Price` decimal(18, 0) NOT NULL,
 CONSTRAINT `PK_Invoicedetails` PRIMARY KEY 
(
	`IDInvoice` ASC,
	`IDProduct` ASC
) 
);
/* SQLINES DEMO *** able [dbo].[Product]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Product`(
	`IDProduct` int AUTO_INCREMENT NOT NULL,
	`ProductName` nvarchar(50) NOT NULL,
	`ProductDescription` Longtext NULL,
	`IDProductType` int NOT NULL,
	`IDSupplier` int NOT NULL,
	`Price` decimal(18, 0) NOT NULL,
	`Sale` Double NULL,
 CONSTRAINT `PK_Product` PRIMARY KEY 
(
	`IDProduct` ASC
) 
) ;
/* SQLINES DEMO *** able [dbo].[ProductImagesDetails]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `ProductImagesDetails`(
	`IDImages` int NOT NULL,
	`IDProduct` int NOT NULL,
 CONSTRAINT `PK_ProductImagesDetails` PRIMARY KEY 
(
	`IDImages` ASC,
	`IDProduct` ASC
) 
);
/* SQLINES DEMO *** able [dbo].[ProductType]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `ProductType`(
	`IDProductType` int AUTO_INCREMENT NOT NULL,
	`ProductTypeName` nvarchar(50) NOT NULL,
 CONSTRAINT `PK_ProductType` PRIMARY KEY 
(
	`IDProductType` ASC
) 
);
/* SQLINES DEMO *** able [dbo].[Shopping cart]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Shopping cart`(
	`IDshoppingCart` int AUTO_INCREMENT NOT NULL,
	`IDCustomer` int NOT NULL,
 CONSTRAINT `PK_Shopping cart` PRIMARY KEY 
(
	`IDshoppingCart` ASC
) 
);
/* SQLINES DEMO *** able [dbo].[shoppingCartDeltails]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `shoppingCartDeltails`(
	`IDshoppingCart` int NOT NULL,
	`IDProduct` int NOT NULL,
	`Quantity` int NOT NULL,
 CONSTRAINT `PK_IDshoppingCartDeltails` PRIMARY KEY 
(
	`IDshoppingCart` ASC,
	`IDProduct` ASC
) 
);
/* SQLINES DEMO *** able [dbo].[Skill]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Skill`(
	`IdSkill` int AUTO_INCREMENT NOT NULL,
	`NameSkill` nvarchar(50) NOT NULL,
 CONSTRAINT `PK_Skill` PRIMARY KEY 
(
	`IdSkill` ASC
) 
);
/* SQLINES DEMO *** able [dbo].[SkillDetails]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `SkillDetails`(
	`IdSkill` int NOT NULL,
	`IDStaff` int NOT NULL,
	`updateDay` datetime(3) NOT NULL,
 CONSTRAINT `PK_SkillDetails` PRIMARY KEY 
(
	`IdSkill` ASC,
	`IDStaff` ASC
) 
);
/* SQLINES DEMO *** able [dbo].[Staff]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Staff`(
	`IDStaff` int AUTO_INCREMENT NOT NULL,
	`StaffName` nvarchar(35) NOT NULL,
	`Username` nchar(20) NOT NULL,
	`StaffAddress` Longtext NOT NULL,
	`PhoneStaff` nchar(10) NOT NULL,
	`CitizenIdentificationCode` nchar(12) NOT NULL,
	`IDStaffType` int NOT NULL,
	`DateOfBirth` date NOT NULL,
	`Sex` int NOT NULL,
	`IdImages` int NULL,
 CONSTRAINT `PK_Staff` PRIMARY KEY 
(
	`IDStaff` ASC
) 
) ;
/* SQLINES DEMO *** able [dbo].[StaffType]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `StaffType`(
	`IDStaffType` int AUTO_INCREMENT NOT NULL,
	`StaffTypeName` nvarchar(35) NOT NULL,
 CONSTRAINT `PK_StaffType` PRIMARY KEY 
(
	`IDStaffType` ASC
) 
);
/* SQLINES DEMO *** able [dbo].[Supplier]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Supplier`(
	`IDSupplier` int AUTO_INCREMENT NOT NULL,
	`SupplierName` nvarchar(35) NOT NULL,
	`PhoneSupplier` nchar(12) NOT NULL,
	`SupplierAddress` Longtext NOT NULL,
	`EmailSupplier` nchar(50) NULL,
 CONSTRAINT `PK_Supplier` PRIMARY KEY 
(
	`IDSupplier` ASC
) 
) ;
/* SQLINES DEMO *** able [dbo].[User]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `User`(
	`Username` nchar(20) NOT NULL,
	`Email` nchar(50) NOT NULL,
	`Password` varchar(255) NOT NULL,
	`Check` int NOT NULL,
 CONSTRAINT `PK_User_1` PRIMARY KEY 
(
	`Username` ASC
) 
);
/* SQLINES DEMO *** able [dbo].[Warehouse]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Warehouse`(
	`IDWarehouse` int AUTO_INCREMENT NOT NULL,
	`WarehouseName` nvarchar(50) NOT NULL,
	`WarehouseAddress` Longtext NOT NULL,
	`DateCreated` date NOT NULL,
 CONSTRAINT `PK_Warehouse` PRIMARY KEY 
(
	`IDWarehouse` ASC
) 
) ;
/* SQLINES DEMO *** able [dbo].[Warehousedetails]    Script Date: 4/24/2024 6:55:30 PM ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE `Warehousedetails`(
	`IDWarehouse` int NOT NULL,
	`IDProduct` int NOT NULL,
	`QuantityInStock` int NOT NULL,
 CONSTRAINT `PK_Warehousedetails` PRIMARY KEY 
(
	`IDWarehouse` ASC,
	`IDProduct` ASC
) 
);
/* SET IDENTITY_INSERT [dbo].[Banner] ON */ 

INSERT `Banner` (`IdBanner`, `Horizontal`, `Vertical`, `IDImages`) VALUES (2, 941, 901, 23);
INSERT `Banner` (`IdBanner`, `Horizontal`, `Vertical`, `IDImages`) VALUES (3, 1734, 740, 22);
/* SET IDENTITY_INSERT [dbo].[Banner] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Customer] ON */ 

INSERT `Customer` (`IDCustomer`, `Username`, `CustomerName`, `PhoneCustomer`, `CustomerAddress`, `CitizenIdentificationCode`, `DateOfBirth`, `Sex`, `IdImages`) VALUES (8, 'huy                 ', 'Nguyễn Văn Huy', '0924872656', 'HCM', '090909090909', CAST('1990-02-05' AS Date), 1, NULL);
INSERT `Customer` (`IDCustomer`, `Username`, `CustomerName`, `PhoneCustomer`, `CustomerAddress`, `CitizenIdentificationCode`, `DateOfBirth`, `Sex`, `IdImages`) VALUES (10, 'huy2                ', 'Phạm Đoạt ', '0902000853', 'HCM', '080808080808', CAST('1996-05-03' AS Date), 1, NULL);
INSERT `Customer` (`IDCustomer`, `Username`, `CustomerName`, `PhoneCustomer`, `CustomerAddress`, `CitizenIdentificationCode`, `DateOfBirth`, `Sex`, `IdImages`) VALUES (11, 'huy3                ', 'Nguyễn Khanh', '0945888373', 'HCM', '070707070707', CAST('1997-07-04' AS Date), 1, NULL);
INSERT `Customer` (`IDCustomer`, `Username`, `CustomerName`, `PhoneCustomer`, `CustomerAddress`, `CitizenIdentificationCode`, `DateOfBirth`, `Sex`, `IdImages`) VALUES (12, 'songa               ', NULL, NULL, NULL, NULL, CAST('0001-01-01' AS Date), 0, NULL);
INSERT `Customer` (`IDCustomer`, `Username`, `CustomerName`, `PhoneCustomer`, `CustomerAddress`, `CitizenIdentificationCode`, `DateOfBirth`, `Sex`, `IdImages`) VALUES (13, 'khanhngu            ', 'hồ chí khanhss', '0932606822', 'tphcm', '08275927212 ', CAST('2002-10-05' AS Date), 1, NULL);
INSERT `Customer` (`IDCustomer`, `Username`, `CustomerName`, `PhoneCustomer`, `CustomerAddress`, `CitizenIdentificationCode`, `DateOfBirth`, `Sex`, `IdImages`) VALUES (14, 'khanhga             ', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/* SET IDENTITY_INSERT [dbo].[Customer] OFF */
 
/* SET IDENTITY_INSERT [dbo].[DeliveryNotes] ON */ 

INSERT `DeliveryNotes` (`IdDeliveryNotes`, `IDInvoice`, `DateCreated`, `DeliveryAddress`, `RecipientPhone`, `Status`, `IDStaff`) VALUES (2, 4, CAST('2024-07-05' AS Date), 'HCM', '0909000999', 2, 10);
INSERT `DeliveryNotes` (`IdDeliveryNotes`, `IDInvoice`, `DateCreated`, `DeliveryAddress`, `RecipientPhone`, `Status`, `IDStaff`) VALUES (4, 24, CAST('2024-04-24' AS Date), 'asdasdxz', '9387363311', 1, NULL);
INSERT `DeliveryNotes` (`IdDeliveryNotes`, `IDInvoice`, `DateCreated`, `DeliveryAddress`, `RecipientPhone`, `Status`, `IDStaff`) VALUES (5, 25, CAST('2024-04-24' AS Date), 'quan 9 duong 920', '0987214547', 1, NULL);
INSERT `DeliveryNotes` (`IdDeliveryNotes`, `IDInvoice`, `DateCreated`, `DeliveryAddress`, `RecipientPhone`, `Status`, `IDStaff`) VALUES (6, 26, CAST('2024-04-24' AS Date), 'jggkj', '0987214547', 1, NULL);
INSERT `DeliveryNotes` (`IdDeliveryNotes`, `IDInvoice`, `DateCreated`, `DeliveryAddress`, `RecipientPhone`, `Status`, `IDStaff`) VALUES (7, 27, CAST('2024-04-24' AS Date), 'kkkk', '9387363311', 1, NULL);
/* SET IDENTITY_INSERT [dbo].[DeliveryNotes] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Images] ON */ 

INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (1, 'customer1', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (2, 'customer2', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (3, 'customer3', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (4, 'customer4', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (5, 'customer5', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (6, 'customer5', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (7, 'customer6', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (8, 'Product AirPods Pro 2-0', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (11, 'Product AirPods Pro 2-1', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (12, 'Product AirPods Pro 2-2', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (13, 'Product Sony WF-1000XM4-0', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (14, 'Product Sony WF-1000XM4-1', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (15, 'Product Sony WF-1000XM4-2', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (16, 'Product Samsung Galaxy Buds Pro-0', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (17, 'Product Samsung Galaxy Buds Pro-1', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (18, 'Product Samsung Galaxy Buds Pro-2', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (19, 'Product BEATS STUDIO PRO-0', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (20, 'Product BEATS STUDIO PRO-1', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (21, 'Product BEATS STUDIO PRO-3', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (22, 'Banner-1', NULL);
INSERT `Images` (`IDImages`, `NameImages`, `UrlImages`) VALUES (23, 'Banner-2', NULL);
/* SET IDENTITY_INSERT [dbo].[Images] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Imported Products] ON */ 

INSERT `Imported Products` (`IDImportedProducts`, `IDStaff`, `IDWarehouse`, `DateCreated`) VALUES (2, 7, 2, CAST('2022-07-07' AS Date));
INSERT `Imported Products` (`IDImportedProducts`, `IDStaff`, `IDWarehouse`, `DateCreated`) VALUES (3, 7, 2, CAST('2023-03-03' AS Date));
INSERT `Imported Products` (`IDImportedProducts`, `IDStaff`, `IDWarehouse`, `DateCreated`) VALUES (4, 7, 2, CAST('2023-09-09' AS Date));
/* SET IDENTITY_INSERT [dbo].[Imported Products] OFF */
 
INSERT `ImportedProductsDetail` (`IDImportedProducts`, `IDProduct`, `Quantity`, `InputPrice`) VALUES (2, 2, 100, 70);
INSERT `ImportedProductsDetail` (`IDImportedProducts`, `IDProduct`, `Quantity`, `InputPrice`) VALUES (2, 3, 70, 100);
INSERT `ImportedProductsDetail` (`IDImportedProducts`, `IDProduct`, `Quantity`, `InputPrice`) VALUES (3, 4, 100, 125);
INSERT `ImportedProductsDetail` (`IDImportedProducts`, `IDProduct`, `Quantity`, `InputPrice`) VALUES (4, 4, 70, 110);
INSERT `ImportedProductsDetail` (`IDImportedProducts`, `IDProduct`, `Quantity`, `InputPrice`) VALUES (4, 5, 120, 170);
 
/* SET IDENTITY_INSERT [dbo].[Invoice] ON */ 

INSERT `Invoice` (`IDInvoice`, `IDCustomer`, `IDStaff`, `DateCreated`, `Status`) VALUES (4, 8, 9, CAST('2024-07-04' AS Date), 2);
INSERT `Invoice` (`IDInvoice`, `IDCustomer`, `IDStaff`, `DateCreated`, `Status`) VALUES (6, 14, NULL, CAST('2024-04-24' AS Date), 1);
INSERT `Invoice` (`IDInvoice`, `IDCustomer`, `IDStaff`, `DateCreated`, `Status`) VALUES (10, 13, NULL, CAST('2024-04-24' AS Date), 1);
INSERT `Invoice` (`IDInvoice`, `IDCustomer`, `IDStaff`, `DateCreated`, `Status`) VALUES (24, 13, NULL, CAST('2024-04-24' AS Date), 1);
INSERT `Invoice` (`IDInvoice`, `IDCustomer`, `IDStaff`, `DateCreated`, `Status`) VALUES (25, 13, NULL, CAST('2024-04-24' AS Date), 1);
INSERT `Invoice` (`IDInvoice`, `IDCustomer`, `IDStaff`, `DateCreated`, `Status`) VALUES (26, 13, NULL, CAST('2024-04-24' AS Date), 1);
INSERT `Invoice` (`IDInvoice`, `IDCustomer`, `IDStaff`, `DateCreated`, `Status`) VALUES (27, 13, NULL, CAST('2024-04-24' AS Date), 1);
/* SET IDENTITY_INSERT [dbo].[Invoice] OFF */
 
INSERT `Invoicedetails` (`IDInvoice`, `IDProduct`, `TotalQuantity`, `Price`) VALUES (4, 2, 10, CAST(160 AS Decimal(18, 0)));
INSERT `Invoicedetails` (`IDInvoice`, `IDProduct`, `TotalQuantity`, `Price`) VALUES (4, 3, 15, CAST(180 AS Decimal(18, 0)));
INSERT `Invoicedetails` (`IDInvoice`, `IDProduct`, `TotalQuantity`, `Price`) VALUES (6, 2, 1, CAST(180000 AS Decimal(18, 0)));
INSERT `Invoicedetails` (`IDInvoice`, `IDProduct`, `TotalQuantity`, `Price`) VALUES (26, 2, 2, CAST(180000 AS Decimal(18, 0)));
INSERT `Invoicedetails` (`IDInvoice`, `IDProduct`, `TotalQuantity`, `Price`) VALUES (27, 3, 1, CAST(132222 AS Decimal(18, 0)));
 
/* SET IDENTITY_INSERT [dbo].[Product] ON */ 

INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (2, 'AirPods Pro 2', 'Chủ Động Khử Tiếng Ồn lên đến 2 lần. Tính năng Chủ Động Khử Tiếng Ồn lên đến 2 lần. 
Âm Thanh Thích Ứng hoàn toàn mới điều chỉnh việc kiểm soát tiếng ồn theo môi trường của bạn một cách thông minh.
Chế độ Âm Thanh Không Gian nâng tầm trải nghiệm âm thanh sống động. Và một lần sạc mang lại thời lượng pin lên đến 6 giờ. --Hiệu năng âm thanh
H2.
Thêm đắm chìm
trong thế giới
âm thanh.
Chip H2 do Apple thiết kế là sức mạnh đằng sau AirPods Pro và hiệu năng âm thanh tiên tiến của sản phẩm này. 
Chip hoạt động đồng thời với bộ khuếch đại và trình điều khiển tùy chỉnh giúp mang đến những nốt cao rõ ràng,
trong trẻo và âm trầm sâu lắng, đầy đặn đến bất ngờ. Vì thế mọi âm thanh đều ấn tượng hơn bao giờ hết.--
Chip H2 thực hiện được nhiều chức năng hơn bao giờ hết, bằng cách sử dụng các thuật toán để đồng thời mang đến khả năng khử tiếng ồn thông minh hơn
, âm thanh ba chiều cao cấp cùng thời lượng pin hiệu suất cao hơn.', 5, 1, CAST(180000 AS Decimal(18, 0)), 10);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (3, 'Sony WF-1000XM4', 'Công nghệ chống ồn tiên tiến – nay còn xuất sắc hơn
Mọi chi tiết trong tai nghe WF-1000XM4 đều được thiết kế mới hoàn toàn. Chẳng hạn như Bộ xử lý tích hợp V1 mới được Sony phát 
triển riêng với khả năng chống ồn tốt hơn bao giờ hết, củ loa mới với hiệu suất cao hơn, micro cảm biến tiếng ồn và Miếng đệm tai
chống ồn cải tiến cho cảm giác vừa vặn hơn.', 5, 2, CAST(132222 AS Decimal(18, 0)), 3.4);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (4, 'Samsung Galaxy Buds Pro', 'Nâng tầm trải nghiệm âm với Chống Ồn Chủ Động
Chuẩn âm thanh studio với loa 2 chiều AKG mạnh mẽ
Âm thanh vòm, chuẩn chất điện ảnh từ 360 Audio*
Đàm thoại rõ ràng với hệ thống 3 mic cải tiến mới -- Tính năng Chống Ồn Chủ Động (Active Noise Canceling) trên Galaxy Buds Pro lọc 
ấn tượng đến 99% tiếng ồn xung quanh. Mic bên trong và mic bên ngoài của tai nghe có khả năng kiểm soát hiệu quả tiếng ồn trong thời 
gian thực. Bằng một thuật toán thông minh giúp loại bỏ tiếng ồn, bạn có thể chọn các mức ANC để tăng hoặc giảm âm thanh phù hợp theo
từng không gian như sau: chuyển lên mức Cao với những không gian ồn hoặc chuyển xuống mức Thấp khi đang ở trong những không gian yên 
tĩnh như thư viện - tất cả đều diễn ra nhanh chóng, không cần phải thay đổi âm lượng. ', 5, 3, CAST(192000 AS Decimal(18, 0)), 30);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (5, 'BEATS STUDIO PRO', ' Bảo Hành 03 Tháng
 Trang bị công nghệ Chống ồn chủ động thích ứng Adaptive Active Noise Cancelling và Xuyên âm Transparency được nâng cấp đáng kể.
 Bluetooth 5.3 tiên tiến giúp kết nối mạnh và ổn định, có trang bị dây AUX 3.5mm đi kèm.
Thời lượng pin lên tới 24 giờ có bật chống ồn ANC, hỗ trợ sạc nhanh 10 phút mang lại 4 giờ hoạt động tiện lợi -- Thiết kế 
của tai nghe Beats Studio Pro (LIKE NEW) không có quá nhiều thay đổi so với thế hệ tiền nhiệm. Vẫn mang trên mình ngôn ngữ 
thiết kế đã quá huyền thoại của Beats, tuy nhiên độ bền bỉ của mẫu tai nghe này được nâng cấp hơn hẳn so với thế hệ trước
nhờ sử dụng loạt vật liệu tốt hơn, giúp tai nghe chống lại xoắn gấp và va đập tốt hơn.', 7, 5, CAST(223000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (16, 'BEATS STUDIO 252', 'Với thời lượng pin lên tới 40 giờ⁸, tai nghe Beats Studio Pro giúp bạn tận hưởng âm nhạc lâu hơn. Tận hưởng thời gian nghe lên tới 24 giờ khi bật chế độ ANC', 7, 5, CAST(200000 AS Decimal(18, 0)), 2);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (17, ' AirPods 3', 'Tai nghe Airpods 3 2022 sở hữu thiết kế nhỏ gọn cùng ngoại hình khá mới lạ do nút tai đã được lược bỏ. Sự tối giản trong thiết kế này mang tới cho người dùng cảm giác gọn gàng và vô cùng thoải mái. Từ đó giúp bạn sử dụng được lâu hơn cũng như phù hợp hơn với những ai đổ nhiều mồ hôi.', 5, 1, CAST(150000 AS Decimal(18, 0)), 50);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (19, 'BEATS SOLO PRO', 'Tai nghe Beats Solo Pro (Nobox) mang tới cho người dùng một mức giá cực kì dễ chịu, dễ dàng tiếp cận đến với sản phẩm hơn rất nhiều, Tai nghe Beats Solo Pro (Nobox) là dòng sản phẩm không có hộp, chỉ gồm tai nghe và dây sạc tặng kèm, hình thức Like-new ( có thể thay đổi theo từng sản phẩm khác nhau ) ', 7, 5, CAST(230000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (20, 'BEATS STUDIO 3 WIRELESS', 'Tai nghe Studio 3 mới nhất kế thừa thiết kế của Beats studio wireless huyền thoại sử dụng chip bluetooth Apple W1 mới nhất', 7, 5, CAST(200000 AS Decimal(18, 0)), 0);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (21, 'Gaming JBL Quantum One ', 'JBL QUANTUM ONE khoác lên mình một ngoại hình đậm chất gaming không thể lẫn vào đâu được. Hệ thống dải đèn RGB 3 vùng phát sáng thực sự thể hiện nét cá tính khác biệt mà không hề ‘làm màu’ chút nào. Chiếc tai nghe cũng được chế tác với từng đường nét cao cấp nhất của một sản phẩm flagship với những đường gân, rãnh đầy mạnh mẽ. Không chỉ vậy, cảm giác đeo vẫn là điểm được JBL chăm chút nhất cho dòng sản phẩm gaming và JBL QUANTUM ONE cũng được kế thừa phong cách thiết kế cộng thái học game thủ đỉnh cao.', 2, 4, CAST(400000 AS Decimal(18, 0)), 20);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (22, 'JBL T115BT', 'Tai nghe JBL T115BT sẽ là lựa chọn hết sức tuyệt vời với các bạn yêu thích các dòng tai nghe JBL có dây đeo cổ. Với dung lượng pin lên đến 8 tiếng, khả năng sạc nhanh trong 2h, công nghệ âm thanh độc quyền JBL Pure Bass Sound, driver 8.6mm dynamic cho âm thanh sống động.', 5, 4, CAST(150000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (23, ' Samsung Galaxy Buds 2 Pro R510N', 'Galaxy Buds 2 Pro được hãng ưu ái trang bị âm thanh chất lượng cao 24 bit cho ra những âm sắc chân thật, rõ ràng và sống động như khi nghe trực tiếp. Mọi nốt nhạc đều được thể hiện một cách hoàn hảo và trọn vẹn nhất, cho bạn những nguồn cảm hứng bất tận thông qua những giai điệu tuyệt vời.', 3, 3, CAST(500000 AS Decimal(18, 0)), 2);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1006, 'Sony WH-CH520', 'Tai nghe chụp tai Sony WH-CH520 sở hữu âm thanh kỹ thuật số DSEE giúp mang lại âm thanh chân thực cùng với đó là pin cho thời gian sử dụng tới 40 giờ. Bên cạnh đó, sản phẩm tai nghe Sony này sở hữu thiết kế khá gọn nhẹ cùng với thiết kế tích hợp micro vô cùng tiện lợi.', 3, 2, CAST(200000 AS Decimal(18, 0)), 3);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1007, ' Apple EarPods Lightning', 'Tai nghe Earpods với Lightning Connection được thiết kế với màu trắng trang nhã cho bạn thể hiện phong cách trẻ trung, năng động, sành điệu tạo cảm giác thời thượng cho chính người sử dụng. Hai đầu tai được thiết kế giống như hai hạt đậu, ôm gọn trong tai giúp tai nghe Apple cách âm tốt nhất cho bạn tận hưởng trọn vẹn từng khoảnh khắc âm nhạc.

Thiết kế hai đầu tai hình hạt đậu ôm trọn trong tai hiện đại

Khi sản phẩm điện thoại iphone 7/7 Plus ra mắt Apple đã loại bỏ jack tai nghe 3.5mm và dùng chính cổng lightningđể kết nối với tai nghe. Sản phẩm tai nghe có dây này được trang bị với khả năng chống nước và chống mồ hôi hiệu quả cho bạn sử dụng thoải mái nhất không tạo cảm giác khó chịu. Dây tai nghe được thiết kế dài 120 cm vừa vặn cho bạn thoải mái để điện thoại vào túi quần và đeo tai nghe tiện lợi, gọn nhẹ.

Trang bị phím remote và microphone tiện dụng trên tai nghe lightning Apple
Apple Earpods với thiết kế thông minh với phím remote tiện dụng cùng trang bị microphone khi bạn xem phim, nghe nhạc thì bạn có thể dễ dàng điều chỉnh âm lượng theo ý mình tùy thích mà không cần phải điều chỉnh trên chiếc điện thoại.

Trang bị phím remote và microphone tiện dụng 

Bên cạnh đó, trang bị cổng lightning chính hãng Apple hỗ trợ việc bạn có thể trả lời hoặc kết thúc cuộc gọi trực tiếp ngay khi bạn đang cắm tai nghe với điện thoại trên chiếc iPhone của mình cho bạn sử dụng được ở chế độ rảnh tay một cách thuận tiện.

Chất lượng âm thanh sống động với phần bass ấn tượng trên lighining Apple Earpods
Tai nghe lightning sử dụng đến hai màng loa độc đáo ở hai bên đầu tai nghe cho chất lượng âm thanh sống động, trung thực và cực kì ấn tượng. Khả năng cách âm hiệu quả không bị nhiễu trong quá trình bạn sử dụng cho chất lượng âm thanh tốt nhất.

Earpods sử dụng đến hai màng loa độc đáo ở hai bên đầu tai nghe

Loa bên trong được thiết kế cho âm bass cực tốt, giảm thiểu thoát âm và tối đa hóa âm thanh phát ra giúp chất lượng âm thanh phản hồi tốt hơn giúp cho bạn hòa mình vào âm nhạc để tận hưởng trọn vẹn âm thanh với những giai điệu âm nhạc sâu sắc.

Loa bên trong được thiết kế cho âm bass cực tốt, giảm thiểu thoát âm và tối đa hóa âm thanh phát ra

Mua tai nghe Lightning Apple Earpods MMTN2 chính hãng, giá tốt tại CellphoneS
CellphoneS nơi được nhiều khách hàng tin tưởng lựa chọn với các sản phẩm chính hãng, chi phí, hợp lý và hơn hết với đội ngũ nhân viên tận tâm sẽ khiến bạn hoàn toàn hài lòng khi trải nghiệm tại cửa hàng. Đến CellphoneS để sở hữu ngay một chiếc tai nghe Apple Earpods Lightning MMTN2 để tận hưởng âm nhạc trọn vẹn. Bạn sẽ nhận được nhiều ưu đãi khi mua sản phẩm cam kết bảo hành chính hãng 12 tháng tại Cares.vn - trung tâm bảo hành ủy quyền của Apple tại Việt Nam và được hỗ trợ trả góp 0% với thẻ tín dụng tại cửa hàng.

Với các bạn ở xa muốn mua sản phẩm có thể liên hệ qua hotline 1800.2097 để đặt hàng và có bất kỳ thắc mắc cần được tư vấn giải đáp, chúng tôi luôn sẵn sàng giúp đỡ bạn về thông tin tai nghe lightning Apple Earpods chính hãng!

', 5, 1, CAST(120000 AS Decimal(18, 0)), 3);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1008, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1015, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1016, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1017, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1018, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1019, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1020, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1021, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1022, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1023, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1024, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1025, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1026, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1027, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1028, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1029, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1030, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1031, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1032, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1033, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1034, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1035, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1036, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
INSERT `Product` (`IDProduct`, `ProductName`, `ProductDescription`, `IDProductType`, `IDSupplier`, `Price`, `Sale`) VALUES (1037, 'BEATS STUDIO BUDS', 'Tai nghe Beats Studio Buds sử dụng chip tùy biến riêng thế hệ mới cho Beats phát triển để tập chung phát triển về mặt âm thanh cho nên một số tính năng như "Tự động chuyển đổi giữa các thiết bị kết nối, Cảm biến tiện cận tự động dừng/phát nhạc, Sạc không dây" Đã Bị Loại Bỏ.', 1, 5, CAST(350000 AS Decimal(18, 0)), 5);
/* SET IDENTITY_INSERT [dbo].[Product] OFF */
 
INSERT `ProductImagesDetails` (`IDImages`, `IDProduct`) VALUES (8, 2);
INSERT `ProductImagesDetails` (`IDImages`, `IDProduct`) VALUES (11, 2);
INSERT `ProductImagesDetails` (`IDImages`, `IDProduct`) VALUES (12, 2);
INSERT `ProductImagesDetails` (`IDImages`, `IDProduct`) VALUES (13, 3);
INSERT `ProductImagesDetails` (`IDImages`, `IDProduct`) VALUES (14, 3);
INSERT `ProductImagesDetails` (`IDImages`, `IDProduct`) VALUES (15, 3);
INSERT `ProductImagesDetails` (`IDImages`, `IDProduct`) VALUES (16, 4);
INSERT `ProductImagesDetails` (`IDImages`, `IDProduct`) VALUES (17, 4);
INSERT `ProductImagesDetails` (`IDImages`, `IDProduct`) VALUES (18, 4);
INSERT `ProductImagesDetails` (`IDImages`, `IDProduct`) VALUES (19, 5);
INSERT `ProductImagesDetails` (`IDImages`, `IDProduct`) VALUES (20, 5);
INSERT `ProductImagesDetails` (`IDImages`, `IDProduct`) VALUES (21, 5);
 
/* SET IDENTITY_INSERT [dbo].[ProductType] ON */ 

INSERT `ProductType` (`IDProductType`, `ProductTypeName`) VALUES (1, 'Tai nghe True Wireless');
INSERT `ProductType` (`IDProductType`, `ProductTypeName`) VALUES (2, 'Tai nghe Gaming');
INSERT `ProductType` (`IDProductType`, `ProductTypeName`) VALUES (3, 'Tai nghe Bluetooth');
INSERT `ProductType` (`IDProductType`, `ProductTypeName`) VALUES (5, 'Tai nghe In-Ear');
INSERT `ProductType` (`IDProductType`, `ProductTypeName`) VALUES (6, 'Tai nghe On-Ear');
INSERT `ProductType` (`IDProductType`, `ProductTypeName`) VALUES (7, 'Tai nghe Over-Ear');
/* SET IDENTITY_INSERT [dbo].[ProductType] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Shopping cart] ON */ 

INSERT `Shopping cart` (`IDshoppingCart`, `IDCustomer`) VALUES (1, 13);
/* SET IDENTITY_INSERT [dbo].[Shopping cart] OFF */
 
INSERT `shoppingCartDeltails` (`IDshoppingCart`, `IDProduct`, `Quantity`) VALUES (1, 5, 1);
 
/* SET IDENTITY_INSERT [dbo].[Skill] ON */ 

INSERT `Skill` (`IdSkill`, `NameSkill`) VALUES (1, 'Kỹ năng quản lí nhân viên');
INSERT `Skill` (`IdSkill`, `NameSkill`) VALUES (2, 'Kỹ năng bán hàng');
INSERT `Skill` (`IdSkill`, `NameSkill`) VALUES (3, 'Kỹ năng quản lí đơn hàng giao hàng');
INSERT `Skill` (`IdSkill`, `NameSkill`) VALUES (4, 'Kỹ năng quản lí sản phẩm');
INSERT `Skill` (`IdSkill`, `NameSkill`) VALUES (5, 'Kỹ năng quản lí kho');
INSERT `Skill` (`IdSkill`, `NameSkill`) VALUES (7, 'Kỹ năng quản lí loại sản phẩm');
INSERT `Skill` (`IdSkill`, `NameSkill`) VALUES (8, 'Kỹ năng quản lí khách hàng');
INSERT `Skill` (`IdSkill`, `NameSkill`) VALUES (9, 'kỹ năng quản lí và tạo phiếu giao hàng');
INSERT `Skill` (`IdSkill`, `NameSkill`) VALUES (10, 'Kỹ năng Quản lí hóa đơn của khách hàng');
/* SET IDENTITY_INSERT [dbo].[Skill] OFF */
 
INSERT `SkillDetails` (`IdSkill`, `IDStaff`, `updateDay`) VALUES (3, 10, CAST('2024-02-02T00:00:00.000' AS DateTime(3)));
INSERT `SkillDetails` (`IdSkill`, `IDStaff`, `updateDay`) VALUES (8, 9, CAST('2024-02-02T00:00:00.000' AS DateTime(3)));
 
/* SET IDENTITY_INSERT [dbo].[Staff] ON */ 

INSERT `Staff` (`IDStaff`, `StaffName`, `Username`, `StaffAddress`, `PhoneStaff`, `CitizenIdentificationCode`, `IDStaffType`, `DateOfBirth`, `Sex`, `IdImages`) VALUES (7, 'Admin', 'Adminlor            ', 'HCM', '0858676767', '219449498497', 1, CAST('1992-05-02' AS Date), 1, NULL);
INSERT `Staff` (`IDStaff`, `StaffName`, `Username`, `StaffAddress`, `PhoneStaff`, `CitizenIdentificationCode`, `IDStaffType`, `DateOfBirth`, `Sex`, `IdImages`) VALUES (9, 'Huy', 'User_NV1            ', 'HN', '0995248653', '766168163267', 3, CAST('1990-03-07' AS Date), 1, NULL);
INSERT `Staff` (`IDStaff`, `StaffName`, `Username`, `StaffAddress`, `PhoneStaff`, `CitizenIdentificationCode`, `IDStaffType`, `DateOfBirth`, `Sex`, `IdImages`) VALUES (10, 'Ân', 'User_NV2            ', 'HCM', '0923418654', '43832453786 ', 6, CAST('1997-06-08' AS Date), 1, NULL);
INSERT `Staff` (`IDStaff`, `StaffName`, `Username`, `StaffAddress`, `PhoneStaff`, `CitizenIdentificationCode`, `IDStaffType`, `DateOfBirth`, `Sex`, `IdImages`) VALUES (11, 'Ngao', 'User_NV3            ', 'HCM', '0942642482', '26784773652 ', 4, CAST('1999-09-05' AS Date), 1, NULL);
/* SET IDENTITY_INSERT [dbo].[Staff] OFF */
 
/* SET IDENTITY_INSERT [dbo].[StaffType] ON */ 

INSERT `StaffType` (`IDStaffType`, `StaffTypeName`) VALUES (1, 'Admin');
INSERT `StaffType` (`IDStaffType`, `StaffTypeName`) VALUES (2, 'Nhân viên quản lí');
INSERT `StaffType` (`IDStaffType`, `StaffTypeName`) VALUES (3, 'Nhân viên bán hàng');
INSERT `StaffType` (`IDStaffType`, `StaffTypeName`) VALUES (4, 'Nhân viên giao hàng');
INSERT `StaffType` (`IDStaffType`, `StaffTypeName`) VALUES (5, 'Nhân viên kế toán');
INSERT `StaffType` (`IDStaffType`, `StaffTypeName`) VALUES (6, 'Nhân viên quản lý kho');
/* SET IDENTITY_INSERT [dbo].[StaffType] OFF */
 
/* SET IDENTITY_INSERT [dbo].[Supplier] ON */ 

INSERT `Supplier` (`IDSupplier`, `SupplierName`, `PhoneSupplier`, `SupplierAddress`, `EmailSupplier`) VALUES (1, 'Apple', '18001192    ', 'Phòng 901, Ngôi Nhà Đức Tại Tp. Hồ Chí Minh, số 33, đường Lê Duẩn, Phường Bến Nghé, Quận 1, thành phố Hồ Chí Minh, Việt Nam', 'Apple@gamil.com.vn                                ');
INSERT `Supplier` (`IDSupplier`, `SupplierName`, `PhoneSupplier`, `SupplierAddress`, `EmailSupplier`) VALUES (2, 'Sony', '02838222227 ', 'TẦNG 6 VÀ 7, TÒA NHÀ PRESIDENT PLACE, 93 NGUYỄN DU, PHƯỜNG BẾN NGHÉ, QUẬN 1, TP. HỒ CHÍ MINH.', 'Sony@gamil.com.vn                                 ');
INSERT `Supplier` (`IDSupplier`, `SupplierName`, `PhoneSupplier`, `SupplierAddress`, `EmailSupplier`) VALUES (3, 'Samsung', '2839157310  ', ' Số 2, đường Hải Triều, Phường Bến Nghé, Quận 1, TP. Hồ Chí Minh', 'Samsung@gamil.com.vn                              ');
INSERT `Supplier` (`IDSupplier`, `SupplierName`, `PhoneSupplier`, `SupplierAddress`, `EmailSupplier`) VALUES (4, 'JBL', '6299055253  ', 'JBL STORE CRESCENT MALL | 101 Đ Tôn Dật Tiên, Tân Phú, Quận 7, Thành phố Hồ Chí Minh', 'JBL@gamil.com.vn                                  ');
INSERT `Supplier` (`IDSupplier`, `SupplierName`, `PhoneSupplier`, `SupplierAddress`, `EmailSupplier`) VALUES (5, 'Beats', '0941144666  ', 'Cơ sở 3: 12 ngõ 860 phố Minh Khai, quận Hai Bà Trưng, Hà Nội.', 'Razer@gmail.com.vn                                ');
/* SET IDENTITY_INSERT [dbo].[Supplier] OFF */
 
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('Adminlor            ', 'Admin@gmail.com                                   ', 'Aa123                                                                                                                                                                                                                                                          ', 3);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('huy                 ', 'huy@gmail.com                                     ', '123                                                                                                                                                                                                                                                            ', 1);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('huy1                ', 'huy1@gmail.com                                    ', '123                                                                                                                                                                                                                                                            ', 1);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('huy2                ', 'huy2@gmail.com                                    ', '123                                                                                                                                                                                                                                                            ', 1);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('huy3                ', 'huy3@gmail.com                                    ', '123                                                                                                                                                                                                                                                            ', 1);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('huy4                ', 'huy4@gmail.com                                    ', '123                                                                                                                                                                                                                                                            ', 1);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('huy5                ', 'huy5@gmail.com                                    ', '123                                                                                                                                                                                                                                                            ', 1);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('huy6                ', 'huy6@gmail.com                                    ', '123                                                                                                                                                                                                                                                            ', 1);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('huyngu              ', 'huyngu@222gmail.com                               ', '$2a$11$GVEv6Y/6K6y/PfKEDCGaS.Zb1aA4QBoRPQs1IodO/sv/krqcO3GIi', 3);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('huyngu123           ', 'huyngu213@gmail.com                               ', '$2a$11$riEo32FDlvJGwxCcuVShi.HxUlIyTEOxB3gRZgRlNGDX0TVz1ABkm', 3);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('khanhchi            ', 'khanhchii741@gmail.com                            ', '$2a$11$wCf5FsUlbdEDMLLr7xRwZ.Q.1hGiNRFFtv1esqoujp0GCYwAZq69q                                                                                                                                                                                                   ', 3);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('khanhchua           ', 'khanhchua741@gmail.com                            ', '$2a$11$ZPlRjY0DxyhoT/plJpxZlOiQmPJUW.0FZZrDIIlpUFdl4VAWpaLs6                                                                                                                                                                                                   ', 3);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('khanhga             ', 'khanhga741@gmail.com                              ', '$2a$11$iCMAKo2ZqJtxSRyha4emlew8bPyaSs9cEpKSNZwMfkA6oNr.4r8ze', 3);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('khanhngu            ', 'khanhngu@gmail.com                                ', '$2a$11$XPGDoyPscA.ZEwENvTcv.ehcNy6bhrZJkSGNsl7J4cLv6oFfzR3ie', 3);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('sơn                 ', 'sonle123@gmail.com                                ', '$2a$11$w5zoEYX.5cnNJ5kw7.w4X.Ii8txIJYePCWwBnKH4QzLeLbwJ9XXYC                                                                                                                                                                                                   ', 3);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('songa               ', 'songa22@gmail.com                                 ', '$2a$11$1ZJgiF890tIPN5GmDBALLupeHeLowPrKMeYPbpkLna8DH10m5L0p6', 3);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('sonngu              ', 'sonngu123@gmail.com                               ', '$2a$11$aGGvJW774VfZkp/k6Oa/0.n1Wj9QaRWPX5YbERCZxZPvxaXE7JqVC', 3);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('User_NV1            ', 'NV1@gmail.com                                     ', '456                                                                                                                                                                                                                                                            ', 2);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('User_NV2            ', 'NV2@gmail.com                                     ', '456                                                                                                                                                                                                                                                            ', 2);
INSERT `User` (`Username`, `Email`, `Password`, `Check`) VALUES ('User_NV3            ', 'NV3@gmail.com                                     ', '789                                                                                                                                                                                                                                                            ', 2);
 
/* SET IDENTITY_INSERT [dbo].[Warehouse] ON */ 

INSERT `Warehouse` (`IDWarehouse`, `WarehouseName`, `WarehouseAddress`, `DateCreated`) VALUES (2, 'Kho-1', '39 đường Hùng Vương, xã Vĩnh Thanh, Nhơn Trạch, Đồng Nai', CAST('2024-07-04' AS Date));
INSERT `Warehouse` (`IDWarehouse`, `WarehouseName`, `WarehouseAddress`, `DateCreated`) VALUES (4, 'Kho-2', 'Ấp Hòa Bình, xã Vĩnh Thanh, Nhơn Trạch, Đồng Nai', CAST('2024-04-03' AS Date));
/* SET IDENTITY_INSERT [dbo].[Warehouse] OFF */
 
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 2, 90);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 3, 55);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 4, 170);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 5, 120);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 16, 250);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 17, 40);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 19, 50);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 20, 55);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 21, 70);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 22, 45);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 23, 55);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 1006, 33);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 1007, 52);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 1008, 100);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 1015, 100);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 1016, 100);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 1017, 100);
INSERT `Warehousedetails` (`IDWarehouse`, `IDProduct`, `QuantityInStock`) VALUES (2, 1018, 100);
 
ALTER TABLE `Banner` ADD  CONSTRAINT `FK_Banner_Images` FOREIGN KEY(`IDImages`)
REFERENCES `Images` (`IDImages`);
 
/* ALTER TABLE `Banner` CHECK CONSTRAINT `FK_Banner_Images`; */
 
ALTER TABLE `Customer` ADD  CONSTRAINT `FK_Customer_Images` FOREIGN KEY(`IdImages`)
REFERENCES `Images` (`IDImages`);
 
/* ALTER TABLE `Customer` CHECK CONSTRAINT `FK_Customer_Images`; */
 
ALTER TABLE `Customer` ADD  CONSTRAINT `FK_Customer_User` FOREIGN KEY(`Username`)
REFERENCES `User` (`Username`);
 
/* ALTER TABLE `Customer` CHECK CONSTRAINT `FK_Customer_User`; */
 
ALTER TABLE `DeliveryNotes` ADD  CONSTRAINT `FK_DeliveryNotes_Invoice` FOREIGN KEY(`IDInvoice`)
REFERENCES `Invoice` (`IDInvoice`);
 
/* ALTER TABLE `DeliveryNotes` CHECK CONSTRAINT `FK_DeliveryNotes_Invoice`; */
 
ALTER TABLE `DeliveryNotes` ADD  CONSTRAINT `FK_DeliveryNotes_Staff` FOREIGN KEY(`IDStaff`)
REFERENCES `Staff` (`IDStaff`);
 
/* ALTER TABLE `DeliveryNotes` CHECK CONSTRAINT `FK_DeliveryNotes_Staff`; */
 
ALTER TABLE `Imported Products` ADD  CONSTRAINT `FK_Imported Products Detail_Staff` FOREIGN KEY(`IDStaff`)
REFERENCES `Staff` (`IDStaff`);
 
/* ALTER TABLE `Imported Products` CHECK CONSTRAINT `FK_Imported Products Detail_Staff`; */
 
ALTER TABLE `Imported Products` ADD  CONSTRAINT `FK_Imported Products Detail_Warehouse` FOREIGN KEY(`IDWarehouse`)
REFERENCES `Warehouse` (`IDWarehouse`);
 
/* ALTER TABLE `Imported Products` CHECK CONSTRAINT `FK_Imported Products Detail_Warehouse`; */
 
ALTER TABLE `ImportedProductsDetail` ADD  CONSTRAINT `FK_ImportedProductsDetail_Imported Products` FOREIGN KEY(`IDImportedProducts`)
REFERENCES `Imported Products` (`IDImportedProducts`);
 
/* ALTER TABLE `ImportedProductsDetail` CHECK CONSTRAINT `FK_ImportedProductsDetail_Imported Products`; */
 
ALTER TABLE `ImportedProductsDetail` ADD  CONSTRAINT `FK_ImportedProductsDetail_Product` FOREIGN KEY(`IDProduct`)
REFERENCES `Product` (`IDProduct`);
 
/* ALTER TABLE `ImportedProductsDetail` CHECK CONSTRAINT `FK_ImportedProductsDetail_Product`; */
 
ALTER TABLE `Invoice` ADD  CONSTRAINT `FK_Invoice_Customer` FOREIGN KEY(`IDCustomer`)
REFERENCES `Customer` (`IDCustomer`);
 
/* ALTER TABLE `Invoice` CHECK CONSTRAINT `FK_Invoice_Customer`; */
 
ALTER TABLE `Invoice` ADD  CONSTRAINT `FK_Invoice_Staff` FOREIGN KEY(`IDStaff`)
REFERENCES `Staff` (`IDStaff`);
 
/* ALTER TABLE `Invoice` CHECK CONSTRAINT `FK_Invoice_Staff`; */
 
ALTER TABLE `Invoicedetails` ADD  CONSTRAINT `FK_Invoicedetails_Invoice` FOREIGN KEY(`IDInvoice`)
REFERENCES `Invoice` (`IDInvoice`);
 
/* ALTER TABLE `Invoicedetails` CHECK CONSTRAINT `FK_Invoicedetails_Invoice`; */
 
ALTER TABLE `Invoicedetails` ADD  CONSTRAINT `FK_Invoicedetails_Product` FOREIGN KEY(`IDProduct`)
REFERENCES `Product` (`IDProduct`);
 
/* ALTER TABLE `Invoicedetails` CHECK CONSTRAINT `FK_Invoicedetails_Product`; */
 
ALTER TABLE `Product` ADD  CONSTRAINT `FK_Product_ProductType` FOREIGN KEY(`IDProductType`)
REFERENCES `ProductType` (`IDProductType`);
 
/* ALTER TABLE `Product` CHECK CONSTRAINT `FK_Product_ProductType`; */
 
ALTER TABLE `Product` ADD  CONSTRAINT `FK_Product_Supplier` FOREIGN KEY(`IDSupplier`)
REFERENCES `Supplier` (`IDSupplier`);
 
/* ALTER TABLE `Product` CHECK CONSTRAINT `FK_Product_Supplier`; */
 
ALTER TABLE `ProductImagesDetails` ADD  CONSTRAINT `FK_ProductImagesDetails_Images` FOREIGN KEY(`IDImages`)
REFERENCES `Images` (`IDImages`);
 
/* ALTER TABLE `ProductImagesDetails` CHECK CONSTRAINT `FK_ProductImagesDetails_Images`; */
 
ALTER TABLE `ProductImagesDetails` ADD  CONSTRAINT `FK_ProductImagesDetails_Product` FOREIGN KEY(`IDProduct`)
REFERENCES `Product` (`IDProduct`);
 
/* ALTER TABLE `ProductImagesDetails` CHECK CONSTRAINT `FK_ProductImagesDetails_Product`; */
 
ALTER TABLE `Shopping cart` ADD  CONSTRAINT `FK_Shopping cart_Customer` FOREIGN KEY(`IDCustomer`)
REFERENCES `Customer` (`IDCustomer`);
 
/* ALTER TABLE `Shopping cart` CHECK CONSTRAINT `FK_Shopping cart_Customer`; */
 
ALTER TABLE `shoppingCartDeltails` ADD  CONSTRAINT `FK_shoppingCartDeltails_Product` FOREIGN KEY(`IDProduct`)
REFERENCES `Product` (`IDProduct`);
 
/* ALTER TABLE `shoppingCartDeltails` CHECK CONSTRAINT `FK_shoppingCartDeltails_Product`; */
 
ALTER TABLE `shoppingCartDeltails` ADD  CONSTRAINT `FK_shoppingCartDeltails_Shopping cart` FOREIGN KEY(`IDshoppingCart`)
REFERENCES `Shopping cart` (`IDshoppingCart`);
 
/* ALTER TABLE `shoppingCartDeltails` CHECK CONSTRAINT `FK_shoppingCartDeltails_Shopping cart`; */
 
ALTER TABLE `SkillDetails` ADD  CONSTRAINT `FK_SkillDetails_Skill` FOREIGN KEY(`IdSkill`)
REFERENCES `Skill` (`IdSkill`);
 
/* ALTER TABLE `SkillDetails` CHECK CONSTRAINT `FK_SkillDetails_Skill`; */
 
ALTER TABLE `SkillDetails` ADD  CONSTRAINT `FK_SkillDetails_Staff` FOREIGN KEY(`IDStaff`)
REFERENCES `Staff` (`IDStaff`);
 
/* ALTER TABLE `SkillDetails` CHECK CONSTRAINT `FK_SkillDetails_Staff`; */
 
ALTER TABLE `Staff` ADD  CONSTRAINT `FK_Staff_Images` FOREIGN KEY(`IdImages`)
REFERENCES `Images` (`IDImages`);
 
/* ALTER TABLE `Staff` CHECK CONSTRAINT `FK_Staff_Images`; */
 
ALTER TABLE `Staff` ADD  CONSTRAINT `FK_Staff_StaffType` FOREIGN KEY(`IDStaffType`)
REFERENCES `StaffType` (`IDStaffType`);
 
/* ALTER TABLE `Staff` CHECK CONSTRAINT `FK_Staff_StaffType`; */
 
ALTER TABLE `Staff` ADD  CONSTRAINT `FK_Staff_User` FOREIGN KEY(`Username`)
REFERENCES `User` (`Username`);
 
/* ALTER TABLE `Staff` CHECK CONSTRAINT `FK_Staff_User`; */
 
ALTER TABLE `Warehousedetails` ADD  CONSTRAINT `FK_Warehousedetails_Product` FOREIGN KEY(`IDProduct`)
REFERENCES `Product` (`IDProduct`);
 
/* ALTER TABLE `Warehousedetails` CHECK CONSTRAINT `FK_Warehousedetails_Product`; */
 
ALTER TABLE `Warehousedetails` ADD  CONSTRAINT `FK_Warehousedetails_Warehouse` FOREIGN KEY(`IDWarehouse`)
REFERENCES `Warehouse` (`IDWarehouse`);
 
/* ALTER TABLE `Warehousedetails` CHECK CONSTRAINT `FK_Warehousedetails_Warehouse`; */
 
