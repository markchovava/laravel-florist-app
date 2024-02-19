-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 12:12 PM
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
-- Database: `laravel_river_range`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `name`, `description`, `price`, `image`, `thumbnail`, `created_at`, `updated_at`) VALUES
(51, 1, 'White Roses', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 1500, 'storage/img/products/image_2024021910218.jpg', 'storage/img/products/thumbnail_202402191098.jpg', '2023-12-15 15:07:22', '2024-02-19 08:38:06'),
(52, 1, 'Yellow Flowers', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 2000, 'storage/img/products/image_2024021910943.jpg', 'storage/img/products/thumbnail_2024021910967.jpg', '2023-12-15 15:09:17', '2024-02-19 08:24:45'),
(53, 1, 'Flower in Gift Jar', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 4000, 'storage/img/products/image_2024021910250.jpg', 'storage/img/products/thumbnail_2024021910950.jpg', '2023-12-15 15:10:25', '2024-02-19 08:34:48'),
(54, 1, 'Yellow Rose', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 1500, 'storage/img/products/image_2024021910834.jpg', 'storage/img/products/thumbnail_202402191094.jpg', '2023-12-15 15:15:57', '2024-02-19 08:31:17'),
(55, 1, 'Pin Cushion', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \r\n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \r\n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 2500, 'storage/img/products/image_2024021910822.jpg', 'storage/img/products/thumbnail_2024021910320.jpg', '2023-12-15 15:23:20', '2024-02-19 08:25:57'),
(56, 1, 'PinCushion Basket', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 4000, 'storage/img/products/image_2024021910845.jpg', 'storage/img/products/thumbnail_2024021910404.jpg', '2023-12-15 15:24:19', '2024-02-19 08:27:15'),
(57, 1, 'PinCushion Bundle', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 1999, 'storage/img/products/image_2024021910747.jpg', 'storage/img/products/thumbnail_2024021910465.jpg', '2023-12-15 15:26:24', '2024-02-19 08:28:23'),
(58, 1, 'Pink Rose', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum   minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 1500, 'storage/img/products/image_2024021910416.jpg', 'storage/img/products/thumbnail_2024021910245.jpg', '2023-12-15 15:28:09', '2024-02-19 08:29:18'),
(60, 1, 'Pink Flower Basket', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 3000, 'storage/img/products/image_2024021910116.jpg', 'storage/img/products/thumbnail_2024021910834.jpg', '2023-12-15 15:33:06', '2024-02-19 08:30:24'),
(61, 1, 'Pink Flower Bundle', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \r\n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \r\n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 2000, 'storage/img/products/image_2024021910857.jpg', 'storage/img/products/thumbnail_2024021910106.jpg', '2023-12-15 18:01:44', '2024-02-19 08:40:18'),
(63, 1, 'Red Roses Bundle', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 4000, 'storage/img/products/image_2024021910623.jpg', 'storage/img/products/thumbnail_2024021910248.jpg', '2023-12-15 18:16:39', '2024-02-19 08:32:51'),
(64, 1, 'Pink Roses', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 3000, 'storage/img/products/image_2024021910591.jpg', 'storage/img/products/thumbnail_2024021910238.jpg', '2023-12-15 18:21:18', '2024-02-19 08:33:41'),
(65, 1, 'Pink Flower', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \r\n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \r\n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 1500, 'storage/img/products/image_2024021910244.jpg', 'storage/img/products/thumbnail_2024021910137.jpg', '2023-12-15 18:23:30', '2024-02-19 08:41:24'),
(66, 1, 'Yellow Roses', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 3000, 'storage/img/products/image_2024021910148.jpg', 'storage/img/products/thumbnail_2024021910213.jpg', '2023-12-16 08:35:33', '2024-02-19 08:37:09'),
(67, 1, 'Red Roses', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \r\n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \r\n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 1500, 'storage/img/products/image_2024021910490.jpg', 'storage/img/products/thumbnail_2024021910833.jpg', '2024-01-15 07:57:17', '2024-02-19 08:39:01'),
(68, 1, 'Flower Basket', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 4000, 'storage/img/products/image_2024021910124.jpg', 'storage/img/products/thumbnail_2024021910273.jpg', '2024-01-16 11:20:04', '2024-02-19 08:35:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
