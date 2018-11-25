-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 23 nov 2018 om 19:10
-- Serverversie: 10.1.28-MariaDB
-- PHP-versie: 7.1.11

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
-- Tabelstructuur voor tabel `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `created_at`, `updated_at`) VALUES
(7, 'michiels lynn', 'michiels89@hotmail.com', '2018-07-10 14:30:49', '2018-07-10 14:30:49');

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
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `orders_products`
--

INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(44, 35, 2, 1),
(45, 35, 3, 4),
(46, 35, 6, 3),
(47, 36, 2, 1),
(48, 37, 5, 1),
(49, 38, 2, 1),
(50, 38, 5, 1);

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
  `price` float NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `title`, `slug`, `description`, `stock`, `created_at`, `updated_at`) VALUES
(1, 'Micro usb Magneet Charger Voor xiaomi\r\n', 'Black1MForMicro.jpg', 199.99, 'Micro usb Magneet Charger', 'Micro usb Magneet Charger', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 0, '2018-10-28 16:14:21', '2018-07-10 13:47:14'),
(2, 'Micro Usb Plug for Magneet Charger ', 'PlugAppleNoCable.jpg', 156.56, 'Micro Usb Plug for Magneet Charger ', 'Micro Usb Plug for Magneet Charger ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 0, '2018-10-28 16:14:21', '2018-07-10 15:30:33'),
(3, 'Magneet Charger Voor iphone\r\n', 'Black1MForMicro.jpg', 169.45, 'Magneet Charger Voor iphone', 'Magneet Charger Voor iphone', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 5, '2018-10-28 16:14:21', '2018-07-10 14:30:51'),
(4, 'Plug for Magneet Charger Voor iphone', 'PlugAppleNoCable.jpg', 199.99, 'Plug for Magneet Charger Voor iphone', 'Plug for Magneet Charger Voor iphone', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 5, '2018-10-28 16:14:21', '2018-07-10 13:30:10'),
(5, 'Type-C Magneet Charger Voor Samsung \r\n', 'Black1MForMicro.jpg', 156.56, 'Type-C Magneet Charger Voor Samsung ', 'Type-C Magneet Charger Voor Samsung ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.', 7, '2018-10-28 16:14:21', '2018-07-10 15:30:33');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `customers`
--
ALTER TABLE `customers`
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
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
