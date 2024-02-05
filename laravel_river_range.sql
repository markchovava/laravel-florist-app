-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2024 at 04:28 PM
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
-- Table structure for table `app_infos`
--

CREATE TABLE `app_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_infos`
--

INSERT INTO `app_infos` (`id`, `user_id`, `name`, `description`, `address`, `phone`, `email`, `website`, `whatsapp`, `facebook`, `twitter`, `instagram`, `created_at`, `updated_at`) VALUES
(1, 3, 'Test', 'Hu5454', 'u4554', 'ui5454', 'u55g5', 'u5h555', 'u455', 'u45t3445', 'ue34t54', 'urthrt', '2024-01-27 18:00:00', '2024-01-29 05:43:05');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `shopping_session` longtext DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `product_option_quantity` int(11) DEFAULT NULL,
  `product_option_total` bigint(20) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_total` int(11) DEFAULT NULL,
  `grandtotal` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `shopping_session`, `ip_address`, `product_option_quantity`, `product_option_total`, `product_quantity`, `product_total`, `grandtotal`, `created_at`, `updated_at`) VALUES
(25, NULL, '0xb4t17a', '127.0.0.1', 1, 120, 2, 400, 520, '2024-01-30 06:42:17', '2024-01-30 06:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `grandtotal` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `cart_id`, `product_id`, `name`, `image`, `quantity`, `price`, `total`, `grandtotal`, `created_at`, `updated_at`) VALUES
(52, NULL, 25, 51, 'Flower 10', 'storage/img/products/image_2024011809706.png', 2, 200, 400, 520, '2024-01-30 06:42:38', '2024-01-30 06:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `cart_item_options`
--

CREATE TABLE `cart_item_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `cart_item_id` bigint(20) DEFAULT NULL,
  `product_option_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_item_options`
--

INSERT INTO `cart_item_options` (`id`, `user_id`, `cart_id`, `cart_item_id`, `product_option_id`, `name`, `price`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(46, NULL, 25, 52, 45, 'Perfume', 120, 1, 120, '2024-01-30 06:42:38', '2024-01-30 06:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `name`, `priority`, `description`, `created_at`, `updated_at`) VALUES
(2, 1, 'New', 3, 'Praise', '2024-01-12 14:12:46', '2024-01-17 15:20:41'),
(3, 1, 'Top Selling Flowers', 1, 'qwe', '2024-01-15 09:57:36', '2024-01-17 15:27:10'),
(4, 1, 'Featured Products', 2, 'hjgh', '2024-01-17 15:17:36', '2024-01-17 15:17:36');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`id`, `user_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'Harare CBD', 1000, '2024-01-24 14:12:16', '2024-01-24 14:23:31'),
(2, 1, '15km around Harare', 1500, '2024-01-24 14:23:57', '2024-01-24 14:23:57'),
(3, 1, 'In-person Collection', 0, '2024-01-25 07:42:48', '2024-01-26 07:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_15_071414_create_products_table', 1),
(29, '2023_12_15_071750_create_roles_table', 1),
(30, '2023_12_15_071803_create_categories_table', 1),
(32, '2023_12_15_071458_create_product_categories_table', 1),
(33, '2023_12_15_071433_create_product_options_table', 1),
(34, '2014_10_12_000000_create_users_table', 1),
(37, '2023_12_15_071734_create_permissions_table', 1),
(43, '2023_12_15_071510_create_carts_table', 1),
(44, '2023_12_15_071532_create_cart_items_table', 1),
(46, '2023_12_15_071557_create_cart_item_options_table', 1),
(47, '2024_01_24_154034_create_deliveries_table', 1),
(49, '2023_12_15_071651_create_order_item_options_table', 2),
(50, '2023_12_15_071658_create_order_items_table', 2),
(52, '2024_01_17_101222_create_order_users_table', 2),
(53, '2023_12_15_071703_create_orders_table', 2),
(54, '2023_12_15_071916_create_app_infos_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `is_agree` int(11) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_total` int(11) DEFAULT NULL,
  `product_option_quantity` int(11) DEFAULT NULL,
  `product_option_total` int(11) DEFAULT NULL,
  `grandtotal` int(11) DEFAULT NULL,
  `delivery_status` varchar(255) DEFAULT NULL,
  `delivery_name` varchar(255) DEFAULT NULL,
  `delivery_price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_no`, `is_agree`, `message`, `product_quantity`, `product_total`, `product_option_quantity`, `product_option_total`, `grandtotal`, `delivery_status`, `delivery_name`, `delivery_price`, `created_at`, `updated_at`) VALUES
(1, 1, 'REF2024012672156', 1, 'Test it.', 5, 28000, 6, 1480, 30480, 'Processing', 'Harare CBD', 1000, '2024-01-26 10:25:04', '2024-01-26 10:25:04'),
(2, 2, 'REF2024012693623', 1, NULL, 5, 510, 4, 2000, 3510, 'Processing', 'Harare CBD', 1000, '2024-01-26 11:23:04', '2024-01-26 11:23:04'),
(3, 2, 'REF2024012644909', 1, NULL, 3, 16800, 2, 860, 19160, 'Processing', '15km around Harare', 1500, '2024-01-26 11:31:40', '2024-01-26 11:31:40'),
(4, 3, 'REF2024012656584', 1, NULL, 2, 1080, 1, 430, 3010, 'Processing', '15km around Harare', 1500, '2024-01-26 11:33:39', '2024-01-26 11:33:39'),
(5, 3, 'REF202401293933', 1, NULL, 4, 8784, 4, 1410, 11194, 'Processing', 'Harare CBD', 1000, '2024-01-29 09:21:52', '2024-01-29 09:21:52');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `grandtotal` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `user_id`, `order_id`, `product_id`, `name`, `image`, `price`, `quantity`, `total`, `grandtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 24, 'Flower 1', 'storage/img/products/image_2024011613233.png', 5600, 3, 16800, 17800, '2024-01-26 06:54:40', '2024-01-26 06:54:40'),
(2, 1, 1, 25, 'Flower 1', 'storage/img/products/image_2024011613233.png', 5600, 2, 11200, 11680, '2024-01-26 06:54:40', '2024-01-26 06:54:40'),
(3, 3, 2, 29, 'Flower 1', 'storage/img/products/image_2024011613233.png', 5600, 3, 16800, 17800, '2024-01-26 08:49:04', '2024-01-26 08:49:04'),
(4, 3, 2, 30, 'Flower 1', 'storage/img/products/image_2024011613233.png', 5600, 2, 11200, 11680, '2024-01-26 08:49:04', '2024-01-26 08:49:04'),
(5, 3, 1, 29, 'Flower 1', 'storage/img/products/image_2024011613233.png', 5600, 3, 16800, 17800, '2024-01-26 10:25:04', '2024-01-26 10:25:04'),
(6, 3, 1, 30, 'Flower 1', 'storage/img/products/image_2024011613233.png', 5600, 2, 11200, 11680, '2024-01-26 10:25:04', '2024-01-26 10:25:04'),
(7, 3, 2, 33, 'Apple', 'storage/img/products/image_2024011512415.png', 102, 5, 510, 2510, '2024-01-26 11:23:04', '2024-01-26 11:23:04'),
(8, 3, 3, 36, 'Flower 1', 'storage/img/products/image_2024011613233.png', 5600, 3, 16800, 17660, '2024-01-26 11:31:40', '2024-01-26 11:31:40'),
(9, 3, 4, 38, 'gfuf', 'storage/img/products/image_2024011511628.png', 540, 2, 1080, 1510, '2024-01-26 11:33:39', '2024-01-26 11:33:39'),
(10, 3, 5, 40, 'Apple', 'storage/img/products/image_2024011512415.png', 102, 2, 204, 1494, '2024-01-29 09:21:52', '2024-01-29 09:21:52'),
(11, 3, 5, 41, 'Floer 12', 'storage/img/products/image_2024011809885.png', 4290, 2, 8580, 8700, '2024-01-29 09:21:52', '2024-01-29 09:21:52');

-- --------------------------------------------------------

--
-- Table structure for table `order_item_options`
--

CREATE TABLE `order_item_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `order_item_id` bigint(20) DEFAULT NULL,
  `product_option_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_item_options`
--

INSERT INTO `order_item_options` (`id`, `user_id`, `order_id`, `order_item_id`, `product_option_id`, `name`, `price`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 18, 'qwerty', 500, 2, 1000, '2024-01-26 06:54:40', '2024-01-26 06:54:40'),
(2, 1, 1, 2, 19, 'Perfume', 120, 4, 480, '2024-01-26 06:54:40', '2024-01-26 06:54:40'),
(3, 3, 2, 3, 23, 'qwerty', 500, 2, 1000, '2024-01-26 08:49:04', '2024-01-26 08:49:04'),
(4, 3, 2, 4, 24, 'Perfume', 120, 4, 480, '2024-01-26 08:49:04', '2024-01-26 08:49:04'),
(5, 3, 1, 5, 23, 'qwerty', 500, 2, 1000, '2024-01-26 10:25:04', '2024-01-26 10:25:04'),
(6, 3, 1, 6, 24, 'Perfume', 120, 4, 480, '2024-01-26 10:25:04', '2024-01-26 10:25:04'),
(7, 3, 2, 7, 27, 'qwerty', 500, 4, 2000, '2024-01-26 11:23:04', '2024-01-26 11:23:04'),
(8, 3, 3, 8, 30, 'Hyper Combo', 430, 2, 860, '2024-01-26 11:31:40', '2024-01-26 11:31:40'),
(9, 3, 4, 9, 32, 'Hyper Combo', 430, 1, 430, '2024-01-26 11:33:39', '2024-01-26 11:33:39'),
(10, 3, 5, 10, 34, 'Hyper Combo', 430, 3, 1290, '2024-01-29 09:21:52', '2024-01-29 09:21:52'),
(11, 3, 5, 11, 5, 'Perfume', 120, 1, 120, '2024-01-29 09:21:52', '2024-01-29 09:21:52');

-- --------------------------------------------------------

--
-- Table structure for table `order_users`
--

CREATE TABLE `order_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_users`
--

INSERT INTO `order_users` (`id`, `order_id`, `user_id`, `name`, `first_name`, `last_name`, `address`, `city`, `country`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Mark Chovava', 'Mark', 'Chovava', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'mark@email.com', '+263782210021', '2024-01-26 06:54:40', '2024-01-26 06:54:40'),
(2, 2, 3, 'Reb Cho', 'Reb', 'Cho', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'reb@email.com', '12343221', '2024-01-26 08:49:04', '2024-01-26 08:49:04'),
(3, 1, 3, 'Reb Cho', 'Reb', 'Cho', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'reb@email.com', '12343221', '2024-01-26 10:25:04', '2024-01-26 10:25:04'),
(4, 2, 3, 'Reb Cho', 'Reb', 'Cho', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'reb@email.com', '12343221', '2024-01-26 11:23:04', '2024-01-26 11:23:04'),
(5, 3, 3, 'Reb Cho', 'Reb', 'Cho', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'reb@email.com', '12343221', '2024-01-26 11:31:40', '2024-01-26 11:31:40'),
(6, 4, 3, 'Reb Cho', 'Reb', 'Cho', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'reb@email.com', '12343221', '2024-01-26 11:33:39', '2024-01-26 11:33:39'),
(7, 5, 3, 'Reb Cho', 'Reb', 'Cho', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'reb@email.com', '12343221', '2024-01-29 09:21:52', '2024-01-29 09:21:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(11, 'App\\Models\\User', 4, 'mark@email.com', '0e743a0f10440d62ed4fb75b691717c854056fd6ebc4e0264ee39d74fd92d366', '[\"*\"]', '2024-01-13 05:30:38', NULL, '2024-01-12 10:33:40', '2024-01-13 05:30:38'),
(12, 'App\\Models\\User', 4, 'mark@email.com', '8566fb6f496c4fc77074b60db90adb301c291e7aaaa40f193224f8e8d3a5e63a', '[\"*\"]', '2024-01-15 14:47:33', NULL, '2024-01-15 07:56:36', '2024-01-15 14:47:33'),
(13, 'App\\Models\\User', 5, 'markchovava@gmail.com', '9d90301b9f936815c61be2ff47d131dfd304d07fa91803d373a623726c18ea72', '[\"*\"]', '2024-01-17 09:32:33', NULL, '2024-01-15 14:55:31', '2024-01-17 09:32:33'),
(16, 'App\\Models\\User', 3, 'reb@email.com', 'c56bb243565c960fb22e5d4b4593e66c267be004ebb6f5800551079bf8614acc', '[\"*\"]', NULL, NULL, '2024-01-26 08:29:40', '2024-01-26 08:29:40'),
(18, 'App\\Models\\User', 1, 'mark@email.com', '1a1aeb927eadfc035c1a977afc42153298eeace648478578c45d2caa8477a03d', '[\"*\"]', NULL, NULL, '2024-01-26 08:33:59', '2024-01-26 08:33:59'),
(19, 'App\\Models\\User', 1, 'mark@email.com', '44a8a93f0c399d8ed6595f3d0e705b77682eadb74d22be4d071901d10a7fe329', '[\"*\"]', NULL, NULL, '2024-01-26 08:34:20', '2024-01-26 08:34:20'),
(21, 'App\\Models\\User', 2, 'joe@email.com', 'fc419a5f6f6abf5d7265c5c5db8882290245d8582cb5b4a44735f7cdfca69a43', '[\"*\"]', NULL, NULL, '2024-01-26 08:37:25', '2024-01-26 08:37:25'),
(22, 'App\\Models\\User', 2, 'joe@email.com', '5d5054181fd94b426635bd6a4ab24820aef115c3a9814ef01d2decbfdc4cac64', '[\"*\"]', NULL, NULL, '2024-01-26 08:37:42', '2024-01-26 08:37:42'),
(26, 'App\\Models\\User', 1, 'mark@email.com', 'd89ea4fe205b025a1387b18e0579604731328fe20da31e8a15a9747dbdf9ef0f', '[\"*\"]', '2024-01-30 08:37:20', NULL, '2024-01-29 09:30:16', '2024-01-30 08:37:20');

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
(51, 4, 'gfuf', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 540, 'storage/img/products/image_2024011511628.png', 'storage/img/products/thumbnail_2024011511536.png', '2023-12-15 15:07:22', '2024-01-15 09:05:58'),
(52, 1, 'Floer 12', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 4290, 'storage/img/products/image_2024011809885.png', 'storage/img/products/thumbnail_202401180990.png', '2023-12-15 15:09:17', '2024-01-18 07:26:50'),
(53, 1, 'Flower 2', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 300, 'storage/img/products/image_2024011809636.png', 'storage/img/products/thumbnail_2024011809675.png', '2023-12-15 15:10:25', '2024-01-18 07:15:54'),
(54, 1, 'Flower 5', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 230, 'storage/img/products/image_2024011809501.png', 'storage/img/products/thumbnail_2024011809854.png', '2023-12-15 15:15:57', '2024-01-18 07:18:10'),
(55, 1, 'Flower 10', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 200, 'storage/img/products/image_2024011809706.png', 'storage/img/products/thumbnail_2024011809333.png', '2023-12-15 15:23:20', '2024-01-18 07:24:46'),
(56, 1, 'Flower 8', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 480, 'storage/img/products/image_2024011809221.png', 'storage/img/products/thumbnail_202401180994.png', '2023-12-15 15:24:19', '2024-01-18 07:21:45'),
(57, 1, 'Flower 7', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 540, 'storage/img/products/image_202401180938.png', 'storage/img/products/thumbnail_2024011809532.png', '2023-12-15 15:26:24', '2024-01-18 07:21:15'),
(58, 1, 'Flower 8', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 4400, 'storage/img/products/image_2024011809875.png', 'storage/img/products/thumbnail_2024011809156.png', '2023-12-15 15:28:09', '2024-01-18 07:20:29'),
(60, 1, 'Flower 6', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 400, 'storage/img/products/image_2024011809403.png', 'storage/img/products/thumbnail_2024011809626.png', '2023-12-15 15:33:06', '2024-01-18 07:19:39'),
(61, NULL, 'sss', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 40, NULL, 'storage/img/products/thumbnail/202312161613.jpg', '2023-12-15 18:01:44', '2023-12-16 14:13:44'),
(63, 1, 'Flower 4', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 500, 'storage/img/products/image_2024011809850.png', 'storage/img/products/thumbnail_2024011809811.png', '2023-12-15 18:16:39', '2024-01-18 07:16:56'),
(64, 1, 'Flower 3', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 220, 'storage/img/products/image_2024011809783.png', 'storage/img/products/thumbnail/202312152021.jpg', '2023-12-15 18:21:18', '2024-01-18 07:16:17'),
(65, NULL, 'aabc', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 201, 'storage/img/products/202312152023.jpg', 'storage/img/products/thumbnail/202312152023.jpg', '2023-12-15 18:23:30', '2023-12-15 18:23:30'),
(66, 4, 'Apple', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 102, 'storage/img/products/image_2024011512415.png', 'storage/img/products/thumbnail/202312161035.jpg', '2023-12-16 08:35:33', '2024-01-15 10:19:39'),
(67, 4, 'Try it', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 500, 'storage/img/products/image_2024011509315.png', 'storage/img/products/thumbnail_20240109336.png', '2024-01-15 07:57:17', '2024-01-15 09:04:22'),
(68, 1, 'Flower 1', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quo illum \n                  minima cumque incidunt vitae aspernatur tempore minus maiores. Esse provident \n                  quos dolorum fugit? Nemo praesentium quis, cumque doloribus alias asperiores.', 5600, 'storage/img/products/image_2024011613233.png', 'storage/img/products/thumbnail_20240113703.png', '2024-01-16 11:20:04', '2024-01-18 07:10:14');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `user_id`, `product_id`, `category_id`, `created_at`, `updated_at`) VALUES
(2, 4, 66, 3, '2024-01-15 10:09:35', '2024-01-15 10:09:35'),
(3, 4, 66, 2, '2024-01-15 11:18:13', '2024-01-15 11:18:13'),
(4, 1, 68, 3, '2024-01-18 07:11:23', '2024-01-18 07:11:23'),
(5, 1, 68, 4, '2024-01-18 07:11:23', '2024-01-18 07:11:23'),
(6, 1, 51, 3, '2024-01-18 07:11:47', '2024-01-18 07:11:47'),
(7, 1, 51, 4, '2024-01-18 07:11:47', '2024-01-18 07:11:47'),
(8, 1, 67, 3, '2024-01-18 07:12:39', '2024-01-18 07:12:39'),
(9, 1, 67, 4, '2024-01-18 07:12:39', '2024-01-18 07:12:39'),
(10, 1, 61, 3, '2024-01-18 07:13:03', '2024-01-18 07:13:03'),
(11, 1, 61, 4, '2024-01-18 07:13:03', '2024-01-18 07:13:03'),
(12, 1, 65, 3, '2024-01-18 07:14:31', '2024-01-18 07:14:31'),
(13, 1, 64, 4, '2024-01-18 07:14:52', '2024-01-18 07:14:52'),
(14, 1, 53, 3, '2024-01-18 07:15:23', '2024-01-18 07:15:23'),
(15, 1, 53, 4, '2024-01-18 07:15:23', '2024-01-18 07:15:23'),
(16, 1, 63, 4, '2024-01-18 07:17:10', '2024-01-18 07:17:10'),
(17, 1, 54, 3, '2024-01-18 07:17:49', '2024-01-18 07:17:49'),
(18, 1, 60, 3, '2024-01-18 07:19:12', '2024-01-18 07:19:12'),
(19, 1, 60, 4, '2024-01-18 07:19:12', '2024-01-18 07:19:12'),
(20, 1, 58, 3, '2024-01-18 07:20:09', '2024-01-18 07:20:09'),
(21, 1, 58, 4, '2024-01-18 07:20:09', '2024-01-18 07:20:09'),
(22, 1, 57, 3, '2024-01-18 07:20:53', '2024-01-18 07:20:53'),
(23, 1, 57, 4, '2024-01-18 07:20:53', '2024-01-18 07:20:53'),
(24, 1, 56, 3, '2024-01-18 07:22:01', '2024-01-18 07:22:01'),
(25, 1, 56, 4, '2024-01-18 07:22:01', '2024-01-18 07:22:01'),
(26, 1, 55, 3, '2024-01-18 07:25:20', '2024-01-18 07:25:20'),
(27, 1, 55, 4, '2024-01-18 07:25:20', '2024-01-18 07:25:20'),
(28, 1, 52, 3, '2024-01-18 07:25:44', '2024-01-18 07:25:44'),
(29, 1, 52, 4, '2024-01-18 07:25:44', '2024-01-18 07:25:44');

-- --------------------------------------------------------

--
-- Table structure for table `product_options`
--

CREATE TABLE `product_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_options`
--

INSERT INTO `product_options` (`id`, `user_id`, `name`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1, 5, 'Wine', 'hihiuh', 550, '2024-01-16 11:11:56', '2024-01-16 11:25:53'),
(3, 5, 'qwerty', 'iuhi', 500, '2024-01-16 11:34:49', '2024-01-16 11:34:49'),
(4, 5, 'Hyper Combo', 'iiugg text', 430, '2024-01-16 11:35:06', '2024-01-16 11:38:17'),
(5, 5, 'Perfume', 'hiu', 120, '2024-01-16 11:35:48', '2024-01-16 11:35:48');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `user_id`, `name`, `description`, `level`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'Full Access', 1, '2024-01-12 12:14:17', '2024-01-26 07:11:36'),
(3, 1, 'Customer', NULL, 4, '2024-01-12 13:37:11', '2024-01-26 07:17:01'),
(4, 1, 'Manager', 'Limited Access', 2, '2024-01-12 13:37:36', '2024-01-26 07:12:07'),
(5, 1, 'Operator', NULL, 3, '2024-01-12 13:37:53', '2024-01-26 07:16:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role_id`, `first_name`, `last_name`, `email`, `phone`, `password`, `code`, `address`, `city`, `country`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mark Chovava', 1, 'Mark', 'Chovava', 'mark@email.com', '+263782210021', '$2y$12$OVnjtrqUeiwV5tyyLiEYseYy9zN9wpXhyxYIqi64z2AssMXEyzF2K', '12345678', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', NULL, NULL, '2024-01-17 09:42:03', '2024-01-26 06:57:54'),
(2, 'Joe Cho', 5, 'Joe', 'Cho', 'joe@email.com', '12345678', '$2y$12$Y6J7yh0pgMb9eJ8qbPHs1.9KhaShzY0XDbkNOGPNcMXKqbGxV27PO', '781199366242', '18 Cleveland Rd., Milton Park, Harare', 'Harare', 'Zimbabwe', NULL, NULL, '2024-01-26 07:28:20', '2024-01-26 08:36:24'),
(3, 'Reb Cho', 4, 'Reb', 'Cho', 'reb@email.com', '12343221', '$2y$12$K/pEx5U6t.WYFkshMFO/euqJYjCe/4MemPtvgohPuw0OGE/YVNcW6', '102951106859', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', NULL, NULL, '2024-01-26 07:29:00', '2024-01-30 08:07:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_infos`
--
ALTER TABLE `app_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_item_options`
--
ALTER TABLE `cart_item_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_item_options`
--
ALTER TABLE `order_item_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_users`
--
ALTER TABLE `order_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_infos`
--
ALTER TABLE `app_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `cart_item_options`
--
ALTER TABLE `cart_item_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_item_options`
--
ALTER TABLE `order_item_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_users`
--
ALTER TABLE `order_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product_options`
--
ALTER TABLE `product_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
