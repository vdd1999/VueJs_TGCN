-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:8889
-- Thời gian đã tạo: Th10 18, 2020 lúc 05:01 PM
-- Phiên bản máy phục vụ: 5.7.26
-- Phiên bản PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Cơ sở dữ liệu: `tgcn`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activated` bit(1) DEFAULT b'0',
  `activate_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`username`, `firstname`, `lastname`, `email`, `password`, `activated`, `activate_token`) VALUES
('dinhdat', 'Dat', 'Vu', 'dinhdat6699@gmail.com', '$2y$10$olB/S3G/WGsFnHUsTi40M.2JmMwXo8hgZ0NBfv6tXAHH./LYgpBuW', b'1', '1b6207847bfa9b5a3ebb02b53a9ff5fb'),
('mvmanh', 'Mai', 'Văn Mạnh', 'mvmanh@gmail.com', '$2y$10$UA6d8dqFhh5T1WWWNZGeDetmVrMw8rGwndxxQijdKfBdte8z4l9wm', b'1', '123456'),
('tdt', 'Tôn', 'Đức Thắng', 'mvmanh@it.tdt.edu.vn', '$2y$10$UA6d8dqFhh5T1WWWNZGeDetmVrMw8rGwndxxQijdKfBdte8z4l9wm', b'1', '123456');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `Id` int(10) NOT NULL,
  `is_Deleted` bit(2) NOT NULL,
  `Staff_Code` varchar(20) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Sdt` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `Id` int(10) NOT NULL,
  `Brand_Name` varchar(20) NOT NULL,
  `Logo` varchar(100) NOT NULL,
  `Category_Code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`Id`, `Brand_Name`, `Logo`, `Category_Code`) VALUES
(1, 'iPhone', 'https://cdn.tgdd.vn/Brand/1/iPhone-(Apple)42-b_16.jpg', 'Mobile'),
(2, 'Samsung', 'https://cdn.tgdd.vn/Brand/1/Samsung42-b_25.jpg', 'Mobile'),
(3, 'Oppo', 'https://cdn.tgdd.vn/Brand/1/OPPO42-b_27.png', 'Mobile'),
(4, 'Xiaomi', 'https://cdn.tgdd.vn/Brand/1/Xiaomi42-b_45.jpg', 'Mobile'),
(5, 'ViVo', 'https://cdn.tgdd.vn/Brand/1/Vivo42-b_50.jpg', 'Mobile'),
(6, 'VSmart', 'https://cdn.tgdd.vn/Brand/1/Vsmart42-b_40.png', 'Mobile'),
(7, 'realme', 'https://cdn.tgdd.vn/Brand/1/Realme42-b_37.png', 'Mobile'),
(8, 'NOKIA', 'https://cdn.tgdd.vn/Brand/1/Nokia42-b_21.jpg', 'Mobile'),
(9, 'HUAWEI', 'https://cdn.tgdd.vn/Brand/1/Huawei42-b_30.jpg', 'Mobile'),
(10, 'Mobell', 'https://cdn.tgdd.vn/Brand/1/Mobell42-b_19.jpg', 'Mobile'),
(11, 'Itel', 'https://cdn.tgdd.vn/Brand/1/Itel42-b_54.jpg', 'Mobile'),
(12, 'Masstel', 'https://cdn.tgdd.vn/Brand/1/Masstel42-b_0.png', 'Mobile'),
(13, 'BlackBerry', 'https://cdn.tgdd.vn/Brand/1/BlackBerry42-b_38.png', 'Mobile'),
(14, 'Macbook', 'https://cdn.tgdd.vn/Brand/1/Macbook44-b_41.png', 'Laptop'),
(15, 'Asus', 'https://cdn.tgdd.vn/Brand/1/Asus44-b_35.jpg', 'Laptop'),
(16, 'HP', 'https://cdn.tgdd.vn/Brand/1/HP-Compaq44-b_36.jpg', 'Laptop'),
(17, 'Lenovo', 'https://cdn.tgdd.vn/Brand/1/Lenovo44-b_50.jpg', 'Laptop'),
(18, 'Acer', 'https://cdn.tgdd.vn/Brand/1/Acer44-b_37.jpg', 'Laptop'),
(19, 'Dell', 'https://cdn.tgdd.vn/Brand/1/Dell44-b_2.jpg', 'Laptop'),
(20, 'LG', 'https://cdn.tgdd.vn/Brand/1/LG44-b_32.jpg', 'Laptop'),
(21, 'MSI', 'https://cdn.tgdd.vn/Brand/1/MSI44-b_17.png', 'Laptop');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `Id` int(50) NOT NULL,
  `Category_Code` varchar(50) NOT NULL,
  `Brand_Code` varchar(50) NOT NULL,
  `Tendanhmuc` varchar(150) NOT NULL,
  `is_Deleted` bit(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inbound`
--

CREATE TABLE `inbound` (
  `Id` int(10) NOT NULL,
  `Inbound_Code` int(20) NOT NULL,
  `Product_Code` varchar(20) NOT NULL,
  `Quantity` int(10) NOT NULL,
  `is_Deleted` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inbounddetail`
--

CREATE TABLE `inbounddetail` (
  `Id` int(10) NOT NULL,
  `Inbound_Code` varchar(20) NOT NULL,
  `Product_Code` varchar(20) NOT NULL,
  `Quantity` int(10) NOT NULL,
  `price_Inbound` int(20) NOT NULL,
  `price_Ounboud` int(20) NOT NULL,
  `is_Deleted` bit(2) NOT NULL,
  `Description` varchar(20000) NOT NULL,
  `Color` varchar(10) NOT NULL,
  `Product_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice`
--

CREATE TABLE `invoice` (
  `Id` int(10) NOT NULL,
  `Invoice_Code` varchar(20) NOT NULL,
  `Product_Code` varchar(20) NOT NULL,
  `Product_Quantity` int(10) NOT NULL,
  `Payment` int(40) NOT NULL,
  `Pay_Method` varchar(20) NOT NULL,
  `Created_Date` date NOT NULL,
  `User_Code` varchar(20) NOT NULL,
  `is_Deleted` bit(2) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoicedetail`
--

CREATE TABLE `invoicedetail` (
  `Id` int(10) NOT NULL,
  `Invoice_Code` varchar(20) NOT NULL,
  `Product_Name` varchar(20) NOT NULL,
  `Quantity` int(10) NOT NULL,
  `Price` int(10) NOT NULL,
  `Color` varchar(10) NOT NULL,
  `Discount` varchar(10) NOT NULL,
  `TotalPayment` int(40) NOT NULL,
  `Pay_Method` varchar(20) NOT NULL,
  `Created_Date` date NOT NULL,
  `User_Name` varchar(30) NOT NULL,
  `is_Deleted` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `ID` int(10) NOT NULL,
  `IsDeleted` bit(2) NOT NULL,
  `Staff_Code` varchar(20) NOT NULL,
  `Hoten` varchar(150) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Sdt` varchar(15) NOT NULL,
  `Diachi` varchar(200) NOT NULL,
  `CreateDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `Id` int(10) NOT NULL,
  `Category_Code` varchar(20) NOT NULL,
  `Brand_Code` varchar(20) NOT NULL,
  `Product_Code` varchar(20) DEFAULT NULL,
  `Product_Name` varchar(150) NOT NULL,
  `Price` varchar(20) NOT NULL,
  `Highlights` bit(1) NOT NULL DEFAULT b'0',
  `is_Deleted` bit(1) NOT NULL DEFAULT b'0',
  `Create_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Img` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`Id`, `Category_Code`, `Brand_Code`, `Product_Code`, `Product_Name`, `Price`, `Highlights`, `is_Deleted`, `Create_Date`, `Img`) VALUES
(9, 'Laptop', 'Asus', 'SP00009', 'Asus VivoBook X509M', '889392893829382938', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/225951/asus-vivobook-x509m-n5000-ej255t-600x600.jpg'),
(10, 'Laptop', 'Asus', 'SP00010', 'Asus VivoBook A412FA(EK342T)', '12.190.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/203670/asus-vivobook-s412f-i3-8145u-4gb-512gb-ek342t-203670-600x600.jpg'),
(11, 'Laptop', 'Asus', 'SP00011', 'Asus VivoBook A512FA(EJ1734T)', '16.590.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/217510/asus-vivobook-a512fa-i5-ej1734t-9-217510-600x600.jpg'),
(12, 'Laptop', 'Asus', 'SP00012', 'Asus VivoBook A512FL(EJ569T)', '18.190.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/217320/asus-vivobook-a512fl-i5-10210u-8gb-512gb-2gb-mx250-9-217320-600x600.jpg'),
(13, 'Laptop', 'Asus', 'SP00013', 'Asus VivoBook A412FA(EK1179T)', '13.290.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/223980/asus-vivobook-a412fa-i3-ek1179t-223980-1-600x600.jpg'),
(14, 'Laptop', 'Asus', 'SP00014', 'Asus VivoBook Gaming F571GT(AL858T)', '21.790.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/226255/asus-vivobook-gaming-f571gt-i5-al851t-226255-600x600.jpg'),
(15, 'Laptop', 'Asus', 'SP00015', 'Asus Gaming Rog Strix G512(IAL001T)', '28.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/225687/asus-gaming-rog-strix-g512-i7-ial001t-225687-600x600.jpg'),
(16, 'Laptop', 'Asus', 'SP00016', 'Asus VivoBook S530FN(BQ550T)', '21.790.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/203137/asus-s530f-i7-8565u-8gb-16gb-1tb-mx150-bq550t-7-1-600x600.jpg'),
(17, 'Laptop', 'Asus', 'SP00017', 'Asus VivoBook S14 S431(EB131T)', '21.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/214711/asus-vivobook-s14-s431-i7-8565u-8gb-512gb-win10-e-214711-600x600.jpg'),
(18, 'Laptop', 'Asus', 'SP00018', 'Asus Zenbook UX333FA(A4017T)', '20.490.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/203201/asus-ux333fa-i5-8265u-8gb-256gb-133f-win10-a4017t-21-600x600.jpg'),
(19, 'Laptop', 'HP', 'SP00019', 'HP 348 G7(9PG83PA)', '11.390.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/221511/hp-348-g7-i3-9pg83pa-221511-600x600.jpg'),
(20, 'Laptop', 'HP', 'SP00020', 'HP 15s fq1111TU(193R0PA)', '11.390.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/224012/hp-15s-fq1111tu-i3-193r0pa-224012-224012-600x600.jpg'),
(21, 'Laptop', 'HP', 'SP00021', 'HP 15s du2050TX(1M8W2PA)', '12.390.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/224065/hp-15s-du2050tx-i3-1m8w2pa-usb-224065-600x600.jpg'),
(22, 'Laptop', 'HP', 'SP00022', 'HP Pavilion 15 cs3014TU', '15.590.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/216085/hp-pavilion-15-cs3014tu-i5-8qp20pa-8-216085-600x600.jpg'),
(23, 'Laptop', 'HP', 'SP00023', 'HP Pavilion x360 14 dw0060TU(195M8PA)', '14.190.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/225695/hp-pavilion-x360-dw0060tu-i3-195m8pa-225695-600x600.jpg'),
(25, 'Laptop', 'HP', 'SP00025', 'HP Envy 13 ba0045TU(171M2PA)', '21.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/225690/hp-envy-13-ba0045tu-i5-171m2pa-225690-600x600.jpg'),
(26, 'Laptop', 'HP', 'SP00026', 'HP Pavilion x360 dh0103TU(6ZF24PA)', '14.690.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/204053/hp-15s-du0063tu-i5-8265u-4gb-1tb-win10-6zf63pa-204053-600x600.jpg'),
(27, 'Laptop', 'HP', 'SP00027', 'HP EliteBook X360 1030(5AS44PA)', '43.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/204853/hp-elitebook-x360-1030-g3-i7-8550u-8gb-256gb-133f-204853-600x600.jpg'),
(28, 'Laptop', 'HP', 'SP00028', 'HP Probook 430 G6(6UX78PA)', '17.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/203458/hp-probook-430-g6-i5-8265u-4gb-256gb-win10-6ux78p-203458-600x600.jpg'),
(29, 'Laptop', 'HP', 'SP00029', 'HP Probook 13(5YM98PA)', '17.490.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/204857/hp-probook-430-g6-i5-8265u-4gb-1tb-133-win10-5ym9-204857-600x600.jpg'),
(30, 'Laptop', 'Lenovo', 'SP00030', 'Lenovo IdeaPad Slim 5 15IIL05(81YK004TVN)', '14.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/223534/lenovo-ideapad-3-15iil05-i3-81we003rvn-211520-101539-450x300.jpg'),
(31, 'Laptop', 'Lenovo', 'SP00031', 'Lenovo IdeaPad Slim 3 15IIL05(81WE003RVN)', '12.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/223534/lenovo-ideapad-3-15iil05-i3-81we003rvn-211520-101539-450x300.jpg'),
(32, 'Laptop', 'Lenovo', 'SP00032', 'Lenovo IdeaPad S340 14IIL(81VV003SVN)', '15.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/214708/lenovo-ideapad-s340-14iil-i5-1035g1-8gb-512gb-win1-8-214708-2-600x600.jpg'),
(33, 'Laptop', 'Lenovo', 'SP00033', 'Lenovo Ideapad S145 15IWL(81MV00TAVN)', '11.490.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/216292/lenovo-ideapad-s145-81w8001xvn-a4-216292-600x600.jpg'),
(34, 'Laptop', 'Acer', 'SP00034', 'Acer Aspire 3 A315 54K 37B0(NX.HEESV.00D)', '10.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/221251/acer-aspire-3-a315-nx-heesv-00d-221251-1-600x600.jpg'),
(35, 'Laptop', 'Acer', 'SP00035', 'Acer Aspire 3 A315 34 P26U(NX.HE3SV.00H)', '7.490.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/224582/acer-aspire-3-a315-n5030-nxhe3sv00h-224582-1-600x600.jpg'),
(36, 'Laptop', 'Acer', 'SP00036', 'Acer Aspire A315 34 C38Y(NX.HE3SV.00G)', '7.290.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/224120/acer-aspire-a315-n4020-nxhe3sv00g-224120-2-600x600.jpg'),
(37, 'Laptop', 'Acer', 'SP00037', 'Acer Aspire A315 56 308N(NX.HS5SV.00C)', '11.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/223654/acer-aspire-a315-56-308n-i3-nxhs5sv00c-15-223654-600x600.jpg'),
(38, 'Laptop', 'Acer', 'SP00038', 'Acer Nitro AN515 43 R9FD(NH.Q6ZSV.003)', '19.490.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/221409/acer-nitro-an515-43-r5-nhq6zsv003-221409-600x600.jpg'),
(39, 'Laptop', 'Acer', 'SP00039', 'Acer Nitro 5 AN515 55 58A7(NH.Q7RSV.002)', '22.490.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/223539/acer-nitro-5-an515-55-58a7-i5-nhq7rsv002-100020-120051-600x600.jpg'),
(40, 'Laptop', 'Acer', 'SP00040', 'Acer Aspire 3 A315 56 58EB(NX.HS5SV.00B)', '13.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/224584/acer-aspire-3-a315-56-i5-nxhs5sv00b-usb-224584-600x600.jpg'),
(41, 'Laptop', 'Dell', 'SP00041', 'Dell Vostro 3590(GRMGK3)', '15.590.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/225808/dell-vostro-3590-i5-grmgk3-225520-055537-600x600.jpg'),
(42, 'Laptop', 'Dell', '', ' Dell Inspiron 349315(N4I5122WA)\r\n', '15.290.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/222088/dell-inspiron-3493-i5-n4i5122w-222088-600x600.jpg'),
(43, 'Laptop', 'Dell', 'SP00043', 'Dell Inspiron 5593(N5I5513W)', '17.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/213570/dell-inspiron-5593-i5-1035g1-8gb-256gb-2gb-mx230-w-213570-600x600.jpg'),
(44, 'Laptop', 'Dell', 'SP00044', 'Dell Vostro 5490(V4I5106W)', '17.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/213861/dell-vostro-5490-i5-10210u-8gb-256gb-win10-v4i510-9-213861-600x600.jpg'),
(45, 'Laptop', 'Dell', 'SP00045', 'Dell Inspiron 3580(70184569)', '13.490.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/44/204047/dell-inspiron-3580-i5-8265u-4gb-1tb-radeon-2gb-70-15-1-600x600.jpg'),
(46, 'Mobile', 'Apple', 'SP00046', 'iPhone 11 Pro Max 512GB', '41.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/210654/iphone-11-pro-max-512gb-gold-400x460.png'),
(47, 'Mobile', 'Apple', 'SP00047', 'iPhone 11 Pro Max 256GB', '37.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-400x460.png'),
(48, 'Mobile', 'Apple', 'SP00048', 'iPhone 11 Pro 256GB', '34.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/210655/iphone-11-pro-256gb-black-400x460.png'),
(49, 'Mobile', 'Apple', 'SP00049', 'iPhone 11 Pro Max 64GB', '33.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-black-400x460.png'),
(50, 'Mobile', 'Samsung', 'SP00050', 'Samsung Galaxy A21s (6GB/64GB)', '4.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/219314/samsung-galaxy-a21s-055620-045627-400x460.png'),
(51, 'Mobile', 'Samsung', 'SP00051', 'Samsung Galaxy S10 Lite', '14.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/194251/samsung-galaxy-s10-lite-blue-chi-tiet-400x460.png'),
(52, 'Mobile', 'Samsung', 'SP00052', 'Samsung Galaxy S20 Ultra', '19.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/217937/samsung-galaxy-s20-ultra-400x460-1-400x460.png'),
(53, 'Mobile', 'Samsung', 'SP00053', 'Samsung Galaxy Z Flip', '36.000.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/213022/samsung-galaxy-z-flip-chitiet-2-788x544.png'),
(54, 'Mobile', 'Samsung', 'SP00054', 'Samsung Galaxy Note 10+', '17.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/206176/samsung-galaxy-note-10-plus-171020-101012-400x460.png'),
(55, 'Mobile', 'Oppo', 'SP00055', 'OPPO Reno3', '7.490.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/213591/oppo-reno3-trang-400x460-400x460.png'),
(56, 'Mobile', 'Oppo', 'SP00056', 'OPPO Find X2', '23.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/198150/oppo-find-x2-xanh-400x460-1-400x460.png'),
(57, 'Mobile', 'Oppo', 'SP00057', 'OPPO A92', '6.490.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/220654/oppo-a92-tim-400x460-400x460.png'),
(58, 'Mobile', 'Oppo', 'SP00058', 'OPPO Reno3 Pro', '14.290.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/216172/oppo-reno3-pro-den-400x460-400x460.png'),
(59, 'Mobile', 'Xiaomi', 'SP00059', 'Xiaomi Redmi 9C (3GB/64GB)', '2.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/226321/xiaomi-redmi-9c-3gb-234920-034925-400x460.png'),
(60, 'Mobile', 'Xiaomi', 'SP00060', 'Xiaomi Redmi 9A', '1.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/218734/xiaomi-redmi-9a-grey-400x460-400x460.png'),
(61, 'Mobile', 'Xiaomi', 'SP00061', 'Xiaomi Redmi 9 (4GB/64GB)', '3.790.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/217308/xiaomi-redmi-9-114620-094649-400x460.png'),
(62, 'Mobile', 'Xiaomi', 'SP00062', 'Xiaomi Redmi Note 9', '4.790.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/214925/xiaomi-redmi-note-9-xanh-dam-400x460-400x460.png'),
(63, 'Mobile', 'Xiaomi', 'SP00063', 'Xiaomi Mi Note 10 Pro', '13.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/213590/xiaomi-mi-note-10-pro-black-400x460.png'),
(64, 'Mobile', 'ViVo', 'SP00064', 'Vivo X50 Pro', '19.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/223290/vivo-x50-pro-155920-035924-400x460.png'),
(65, 'Mobile', 'ViVo', 'SP00065', 'Vivo Y1s', '2.690.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/225851/vivo-y1s-154520-014531-400x460.png'),
(66, 'Mobile', 'ViVo', 'SP00066', 'Vivo V19 Neo', '6.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/220977/vivo-v19-neo-den-400x460-1-400x460.png'),
(67, 'Mobile', 'ViVo', 'SP00067', 'Vivo U10', '3.790.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/211156/vivo-u10-400x460.png'),
(68, 'Mobile', 'ViVo', 'SP00068', 'Vivo S1 Pro', '5.990.000', b'1', b'0', '2020-08-22 17:00:00', 'https://cdn.tgdd.vn/Products/Images/42/202862/vivo-s1-pro-white-400x460.png'),
(93, 'Mobile', 'SamSung', 'SP00069', 'Nokia', '1000000', b'0', b'0', '2020-11-06 04:21:37', 'iphone-11-pro-max-green-400x400.jpg'),
(94, 'Mobile', 'Apple', 'SP00070', 'SAMSUNG 10', '100000000', b'0', b'0', '2020-11-07 05:56:43', 'vivo-v20-600-xanh-hong-200x200.jpg'),
(95, 'Mobile', 'SamSung', 'SP00071', 'NOKIDA ĐÂP ĐÁ', '1111110', b'0', b'0', '2020-11-17 03:16:32', 'xiaomi-redmi-9-114620-094644-400x400.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productdetail`
--

CREATE TABLE `productdetail` (
  `Id` int(10) NOT NULL,
  `Product_Code` varchar(20) NOT NULL,
  `Product_Name` varchar(50) NOT NULL,
  `Price` varchar(30) NOT NULL,
  `Quantity` int(50) NOT NULL,
  `Description` varchar(20000) NOT NULL,
  `View` int(10) NOT NULL,
  `Img` varchar(150) NOT NULL,
  `Color` varchar(20) NOT NULL,
  `is_Deleted` bit(1) NOT NULL,
  `Highlights` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `productdetail`
--

INSERT INTO `productdetail` (`Id`, `Product_Code`, `Product_Name`, `Price`, `Quantity`, `Description`, `View`, `Img`, `Color`, `is_Deleted`, `Highlights`) VALUES
(1, 'SP00001', 'Macbook Air 2017', '19,990,000', 10, 'MacBook Air 2017 i5 128GB là mẫu laptop văn phòng, có thiết kế siêu mỏng và nhẹ, vỏ nhôm nguyên khối sang trọng. Máy có hiệu năng ổn định, thời lượng pin cực lâu 12 giờ, phù hợp cho hầu hết các nhu cầu làm việc và giải trí. ', 0, 'https://cdn.tgdd.vn/Products/Images/44/106875/apple-macbook-air-mqd32sa-a-i5-5350u-600x600.jpg', 'BẠC', b'0', b'1'),
(2, 'SP00002', 'MacBook Air 2020', '31,990,000', 10, 'MacBook Air 2020 là phiên bản có nhiều nâng cấp vượt trội về cấu hình và thiết kế bàn phím, hứa hẹn đem tới trải nghiệm mượt mà, thoải mái hơn tới người dùng. Chiếc máy vẫn là lựa chọn số 1 dành cho các anh em văn phòng muốn sở hữu chiếc laptop mỏng nhẹ, mượt mà và pin lâu.', 0, 'https://cdn.tgdd.vn/Products/Images/44/106875/apple-macbook-air-mqd32sa-a-i5-5350u-600x600.jpg', 'VÀNG', b'0', b'0'),
(3, 'SP00003', 'Laptop Asus VivoBook', '6,990,000', 14, '', 0, 'https://cdn.tgdd.vn/Products/Images/44/106875/apple-macbook-air-mqd32sa-a-i5-5350u-600x600.jpg', 'Trắng', b'0', b'1'),
(4, 'SP00004', 'Laptop Acer VivoBook', '7,990,000', 14, '', 0, 'https://cdn.tgdd.vn/Products/Images/42/210246/Feature/samsung-galaxy-a71-spec-17-720x333.jpg', 'Trắng', b'0', b'1'),
(5, 'SP00005', 'Iphone 11', '21,990,000', 14, '', 0, 'https://cdn.tgdd.vn/Products/Images/42/200533/iphone-11-pro-max-green-400x400.jpg', 'ĐEN', b'0', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `Id` int(10) NOT NULL,
  `User_Code` varchar(20) NOT NULL,
  `User_Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `Created_Date` date NOT NULL,
  `Invoice_Code` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `is_Deleted` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `inbound`
--
ALTER TABLE `inbound`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `inbounddetail`
--
ALTER TABLE `inbounddetail`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `invoicedetail`
--
ALTER TABLE `invoicedetail`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `productdetail`
--
ALTER TABLE `productdetail`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `Id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `inbound`
--
ALTER TABLE `inbound`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `inbounddetail`
--
ALTER TABLE `inbounddetail`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `invoice`
--
ALTER TABLE `invoice`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `invoicedetail`
--
ALTER TABLE `invoicedetail`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT cho bảng `productdetail`
--
ALTER TABLE `productdetail`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT;
