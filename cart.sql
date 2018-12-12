-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 12 dec 2018 om 18:00
-- Serverversie: 10.1.36-MariaDB
-- PHP-versie: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cart`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `addresses`
--

INSERT INTO `addresses` (`id`, `address1`, `address2`, `city`, `postal_code`, `created_at`, `updated_at`) VALUES
(5, 'mereldreef 1', '', 'holsbeek', '3220', '2018-07-10 14:30:49', '2018-07-10 14:30:49');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `colors`
--

CREATE TABLE `colors` (
  `id` int(10) NOT NULL,
  `color` varchar(20) NOT NULL,
  `hexa` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `colors`
--

INSERT INTO `colors` (`id`, `color`, `hexa`) VALUES
(1, 'black', '#000000'),
(2, 'army green', '#4B5320'),
(3, 'green', '#10CC10'),
(4, 'red', '#FF0000'),
(5, 'blue', '#0000FF'),
(6, 'yellow', '#FFFF00'),
(7, 'orange', '#FFA500'),
(8, 'fuschia', '#ff77ff '),
(9, 'carbon', '#625d5d'),
(10, 'grey', '#808080'),
(11, 'white', '#FFFFFF'),
(12, 'black/red', '#f80000');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `created_at`, `updated_at`, `password`) VALUES
(7, 'michiels lynn', 'michiels89@hotmail.com', '2018-07-10 14:30:49', '2018-07-10 14:30:49', '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `total` float NOT NULL,
  `address_id` int(11) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `orders`
--

INSERT INTO `orders` (`id`, `hash`, `total`, `address_id`, `paid`, `customer_id`, `created_at`, `updated_at`) VALUES
(35, '731bcd7f709fd9580e8200d9dbfd09397218d14980af079c348a7c923b80ac99', 1605.35, 5, 1, 7, '2018-07-10 14:30:50', '2018-07-10 14:30:50'),
(36, '21a645b7a599ad2d2b5ee1a54e5a697cc023ae25275ae73565350207fc3461c7', 161.56, 5, 1, 7, '2018-07-10 15:09:14', '2018-07-10 15:09:14'),
(37, '5687d10cdb48f8a623c804879d1860a3d0c4eba71a906d185bb8b5aceb22a2f5', 161.56, 5, 1, 7, '2018-07-10 15:21:22', '2018-07-10 15:21:22'),
(38, '63d1c98370b4fd27248f98e500cc9d667ebec6146b90742837d64d4b2426d095', 318.12, 5, 1, 7, '2018-07-10 15:30:33', '2018-07-10 15:30:33');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `orders_products`
--

CREATE TABLE `orders_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `color` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `orders_products`
--

INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `quantity`, `color`) VALUES
(44, 35, 2, 1, ''),
(45, 35, 3, 4, ''),
(46, 35, 6, 3, ''),
(47, 36, 2, 1, ''),
(48, 37, 5, 1, ''),
(49, 38, 2, 1, ''),
(50, 38, 5, 1, '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `failed` tinyint(1) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `failed`, `transaction_id`, `created_at`, `updated_at`) VALUES
(9, 35, 0, '2e96hvhk', '2018-07-10 14:30:51', '2018-07-10 14:30:51'),
(10, 36, 0, '9afccrht', '2018-07-10 15:09:14', '2018-07-10 15:09:14'),
(11, 37, 0, 'a904w4ty', '2018-07-10 15:21:22', '2018-07-10 15:21:22'),
(12, 38, 0, '61ed07dt', '2018-07-10 15:30:33', '2018-07-10 15:30:33');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `image2` varchar(50) NOT NULL,
  `image3` varchar(50) NOT NULL,
  `image4` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `category` varchar(50) NOT NULL,
  `Colors` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `image2`, `image3`, `image4`, `price`, `title`, `slug`, `description`, `stock`, `created_at`, `updated_at`, `category`, `Colors`) VALUES
(1, 'WEST BIKING® 20 L Bike Panniers Bag ', 'BicycleBag1.jpg', 'BicycleBag2.jpg', 'BicycleBag3.jpg', 'BicycleBag4.jpg', 89.35, 'WEST BIKING® 20 L Bike Panniers Bag ', 'WEST BIKING® 20 L Bike Panniers Bag ', 'Bike Rack Bag Waterproof, Adjustable, Large Capacity Bike Bag Nylon Bicycle Bag Cycle Bag Cycling \r\n', 10, '2018-12-07 11:43:44', '2018-07-10 13:47:14', 'bicycle', 'black'),
(2, 'Rosewheel 13 L Bike Rack Bag Waterproof', 'RoswhellBicycleBag1.jpg', 'RoswhellBicycleBag2.jpg', 'RoswhellBicycleBag3.jpg', 'RoswhellBicycleBag4.jpg', 72.45, 'Rosewheel 13 L Bike Rack Bag Waterproof', 'Rosewheel 13 L Bike Rack Bag Waterproof', 'Waterproof, Reflective, Water Bottle Pocket Bike Bag Polyester Bicycle Bag Cycle Bag Cycling', 10, '2018-12-12 14:48:36', '2018-07-10 15:30:33', 'bicycle', 'black or blue\r\n'),
(3, 'ROSWHEEL 35 L Bike Panniers Bag 3 In 1, Waterproof\r\n', 'RosBicycleBag1.jpg', 'RosBicycleBag2.jpg', 'RosBicycleBag3.jpg', 'RosBicycleBag4.jpg', 224.86, 'ROSWHEEL 35 L Bike Panniers Bag 3 In 1, Waterproof', 'ROSWHEEL 35 L Bike Panniers Bag 3 In 1, Waterproof', 'Bike Panniers Bag 3 In 1, Waterproof, Adjustable Bike Bag PU Leather / 600D Polyester Bicycle Bag Cycle Bag Cycling / Bike / Large Capacity / Waterproof Zipper', 15, '2018-12-07 11:43:44', '2018-07-10 14:30:51', 'bicycle', 'army green or black'),
(4, 'FJQXZ Bike Rack Bag Waterproof', 'FJQXZBicycleBag1.jpg', 'FJQXZBicycleBag2.jpg', 'FJQXZBicycleBag2.jpg', 'FJQXZBicycleBag2.jpg', 142.34, 'FJQXZ Bike Rack Bag Waterproof', 'FJQXZ Bike Rack Bag Waterproof', 'Bike Rack Bag Waterproof, Reflective, Wearable Bike Bag EVA Bicycle Bag Cycle Bag Cycling', 10, '2018-12-07 11:43:44', '2018-07-10 13:30:10', 'bicycle', 'black fluo yellow only'),
(5, 'First Aid Kit Travel\r\n', 'ehbo1.jpg', 'ehbo2.jpg', 'ehbo3.jpg', 'ehbo4.jpg', 19.95, 'First Aid Kit Travel', 'First Aid Kit Travel', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 10, '2018-12-07 11:43:44', '2018-07-10 15:30:33', 'bicycle', ''),
(6, 'Skate Helmet Children\'s Helmet', 'dinoHelmet1.jpg', 'dinoHelmet2.jpg', 'dinoHelmet3.jpg', 'dinoHelmet4.jpg', 49.95, 'Skate Helmet Children\'s Helmet', 'Skate Helmet Children\'s Helmet', 'Skate Helmet Children\'s Helmet CE EN1078 Certification Adjustable Mountain Urban Breathable Protective Ultra Light (UL) for Skating', 10, '2018-12-07 12:39:18', '0000-00-00 00:00:00', 'bicycle', 'green only'),
(7, 'Skate Helmet Children\'s Helmet', 'sharkHelmet1.jpg', 'sharkHelmet2.jpg', 'sharkHelmet3.jpg', 'sharkHelmet4.jpg', 54.95, 'Skate Helmet Children\'s Helmet', 'Skate Helmet Children\'s Helmet', 'Skate Helmet Children\'s Helmet CE Certification Adjustable Mountain Urban Ultra Light (UL) for Cycling / Bike Ice Skate Skateboarding', 10, '2018-12-07 12:39:18', '0000-00-00 00:00:00', 'bicycle', 'Blue only'),
(8, 'Scohiro-Work Adults Bike Helmet', 'adultHelmet1.jpg', 'adultHelmet2.jpg', 'adultHelmet3.jpg', 'adultHelmet4.jpg', 84.76, 'Scohiro-Work Adults Bike Helmet', 'Scohiro-Work Adults Bike Helmet', 'Scohiro-Work Adults Bike Helmet 34 Vents CE / CE EN 1077 Impact Resistant, Light Weight, \r\nAdjustable Fit EPS, PC Sports Road Cycling / Recreational Cycling / Cycling / Bike ', 10, '2018-12-07 12:39:18', '0000-00-00 00:00:00', 'bicycle', 'Green , Blue , Black/Red, White, Fushsia, Black'),
(9, 'Smoke & Gas Detectors', 'detector1.jpg', 'detector2.jpg', 'detector3.jpg', 'detector4.jpg', 34.65, 'Smoke & Gas Detectors', 'Smoke & Gas Detectors', 'Smoke & Gas Detectors co Carbon Monoxide Detector Fire Smoke Sensor Alarm Combination 2 in 1', 10, '2018-12-07 12:39:18', '0000-00-00 00:00:00', 'atHome', ''),
(10, '1pcs PP Goggles welding', 'weldingMask1.jpg', 'weldingMask2.jpg', 'weldingMask3.jpg', 'weldingMask4.jpg', 59.95, '1pcs PP Goggles welding', '1pcs PP Goggles welding', '1pcs PP Goggles welding / Automatic dimming / Safety & Protective Gear Full Face Mask (3x extra screens)', 10, '2018-12-07 12:39:18', '0000-00-00 00:00:00', 'work', 'carbon look'),
(11, '1pc Rubber Filter Mask', 'mask1.jpg', 'mask2.jpg', 'mask3.jpg', '', 49.35, '1pc Rubber Filter Mask', '1pc Rubber Filter Mask', '1pc Rubber Filter Mask Protection Safety & Protective Gear Gas Protection Dustproof Breathable', 10, '2018-12-07 12:39:18', '0000-00-00 00:00:00', 'work', ''),
(12, 'Gas Mask (full face)', 'maskFullFace1.jpg', 'maskFullFace2.jpg', 'maskFullFace3.jpg', 'maskFullFace4.jpg', 39.95, 'Gas Mask (full face)', 'Gas Mask (full face)', 'Provide Anti Industrial Pesticide Active Carbon For Gas Mask (full face)', 10, '2018-12-07 12:39:18', '0000-00-00 00:00:00', 'work', ''),
(13, 'First Aid Kit Travel', 'ehbo1.jpg', 'ehbo2.jpg', 'ehbo3.jpg', 'ehbo4.jpg', 19.95, 'First Aid Kit Travel', 'First Aid Kit Travel', '', 10, '2018-12-07 12:39:18', '0000-00-00 00:00:00', 'work', ''),
(14, 'First Aid Kit Travel', 'ehbo1.jpg', 'ehbo2.jpg', 'ehbo3.jpg', 'ehbo4.jpg', 19.95, 'First Aid Kit Travel', 'First Aid Kit Travel', '', 10, '2018-12-07 12:39:18', '0000-00-00 00:00:00', 'car', ''),
(15, 'Full HD 1920 x 1080 HD Dashcam', 'dashcam1.jpg', 'dashcam2.jpg', 'dashcam3.jpg', 'dashcam4.jpg', 49.95, 'Full HD 1920 x 1080 HD Dashcam', 'Full HD 1920 x 1080 HD Dashcam', 'Full HD 1920 x 1080 HD Car DVR Car DVR Camera Dashcam Night Vision Video Registrator Recorder G-sensor Dash Cam', 10, '2018-12-07 12:39:18', '0000-00-00 00:00:00', 'car', 'blue or black'),
(16, 'magnetische usb oplaadkabel met kopje naar keuze(usb type-c, micro-usb, iphone)', 'magneticCharger1.jpg', 'magneticCharger2.jpg', 'magneticCharger3.jpg', 'magneticCharger4.jpg', 17.95, 'magnetische usb oplaadkabel (usb type-c, micro-usb, iphone)', 'magnetische usb oplaadkabel (usb type-c, micro-usb, iphone)', '-Ondersteund ios, usb-c en micro-usb toestellen. \r\n(smartphones, tablets, controllers voor xbox one en PS4, BT speakers, etc.)\r\n-Vervaardigd uit hoogwaardig materiaal.\r\n-Voorkom stof en slijtage aan je oplaadpoort.\r\n-Ondersteund snel opladen en data transfer.\r\n-Zeer sterke magneet voor een goede en snelle connectie.\r\n-Elimineer gevaar in de auto dankzij deze kabel die snel met 1 hand aan te sluiten is.\r\n-Extra kopstukjes zijn apart verkrijgbaar.', 30, '2018-12-07 12:39:18', '0000-00-00 00:00:00', 'car', 'zilver'),
(17, 'kopjes magnetische usb oplaadkabel (usb type-c, micro-usb, iphone)', 'magneticCharger2.jpg', 'magneticCharger1.jpg', 'magneticCharger3.jpg', 'magneticCharger4.jpg', 6.95, 'kopjes magnetische usb oplaadkabel (usb type-c, micro-usb, iphone)', 'kopjes magnetische usb oplaadkabel (usb type-c, micro-usb, iphone)', '-Ondersteund ios, usb-c en micro-usb toestellen. \r\n(smartphones, tablets, controllers voor xbox one en PS4, BT speakers, etc.)\r\n-Vervaardigd uit hoogwaardig materiaal.\r\n-Voorkom stof en slijtage aan je oplaadpoort.\r\n-Ondersteund snel opladen en data transfer.\r\n-Zeer sterke magneet voor een goede en snelle connectie.\r\n-Elimineer gevaar in de auto dankzij deze kabel die snel met 1 hand aan te sluiten is.\r\n-Extra kopstukjes zijn apart verkrijgbaar.', 20, '2018-12-07 13:11:52', '0000-00-00 00:00:00', 'car', ''),
(18, '2pcs Car Snow Chains', 'snowChain1.jpg', 'snowChain2.jpg', 'snowChain3.jpg', 'snowChain4.jpg', 115, '2pcs Car Snow Chains', '2pcs Car Snow Chains', '2pcs Car Snow Chains Common Buckle Type For Car Wheel For universal All Models All years', 10, '2018-12-07 13:27:44', '0000-00-00 00:00:00', 'car', 'black or yellow');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `products_color`
--

CREATE TABLE `products_color` (
  `id` int(10) NOT NULL,
  `colorId` int(10) NOT NULL,
  `productId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `products_color`
--

INSERT INTO `products_color` (`id`, `colorId`, `productId`) VALUES
(1, 1, 2),
(2, 5, 2),
(3, 1, 3),
(4, 2, 3),
(5, 3, 8),
(6, 5, 8),
(7, 12, 8),
(8, 11, 8),
(9, 8, 8),
(10, 1, 8),
(11, 1, 15),
(12, 5, 15),
(13, 1, 18),
(14, 6, 18);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product_colors`
--

CREATE TABLE `product_colors` (
  `id` int(10) NOT NULL,
  `colorId` int(10) NOT NULL,
  `productId` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `product_colors`
--

INSERT INTO `product_colors` (`id`, `colorId`, `productId`) VALUES
(1, 1, 2),
(2, 5, 2),
(3, 1, 3),
(4, 2, 3),
(5, 3, 8),
(6, 5, 8),
(7, 12, 8),
(8, 11, 8),
(9, 8, 8),
(10, 1, 8),
(11, 1, 15),
(12, 5, 15),
(13, 1, 18),
(14, 6, 18);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `products_color`
--
ALTER TABLE `products_color`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `product_colors`
--
ALTER TABLE `product_colors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT voor een tabel `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT voor een tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT voor een tabel `products_color`
--
ALTER TABLE `products_color`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT voor een tabel `product_colors`
--
ALTER TABLE `product_colors`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
