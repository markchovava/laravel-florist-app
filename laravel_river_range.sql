-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2024 at 01:32 PM
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
(1, 1, 'River Range Roses Flower and Gift Shop', NULL, '18 Cleveland Ave., Milton Park, Harare', '+263 712 876720', 'info@riverrangeflorist.co.zw', 'https://www.riverrangeflorist.co.zw', '+263 712 876720', '+263 712 876720', '+263 712 876720', '+263 712 876720', '2024-01-27 18:00:00', '2024-02-19 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `shopping_session` longtext DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `product_quantity` bigint(20) DEFAULT NULL,
  `product_total` bigint(20) DEFAULT NULL,
  `extra_quantity` bigint(20) DEFAULT NULL,
  `extra_total` bigint(20) DEFAULT NULL,
  `cart_quantity` bigint(20) DEFAULT NULL,
  `cart_total` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_quantity` bigint(20) DEFAULT NULL,
  `product_unit_price` bigint(20) DEFAULT NULL,
  `product_total` bigint(20) DEFAULT NULL,
  `extra_name` varchar(255) DEFAULT NULL,
  `extra_quantity` bigint(20) DEFAULT NULL,
  `extra_total` bigint(20) DEFAULT NULL,
  `cartitem_quantity` bigint(20) DEFAULT NULL,
  `cartitem_total` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, 1, 'Protea Pincushion Bouquets', 3, 'Praise', '2024-01-12 14:12:46', '2024-03-12 06:16:11'),
(3, 1, 'Mixed Bouquets', 1, 'qwe', '2024-01-15 09:57:36', '2024-03-12 06:14:41'),
(4, 1, 'Baskets', 4, 'hjgh', '2024-01-17 15:17:36', '2024-03-12 12:14:57'),
(5, 1, 'Boxed Roses', 4, '...', '2024-03-12 06:17:08', '2024-03-12 06:17:08'),
(6, 1, 'Roses only Bouquets', 3, '...', '2024-03-12 06:18:19', '2024-03-12 06:18:19'),
(7, 1, 'Featured Products', 2, NULL, '2024-03-12 12:14:25', '2024-03-12 12:14:25');

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
(34, '2014_10_12_000000_create_users_table', 1),
(37, '2023_12_15_071734_create_permissions_table', 1),
(46, '2023_12_15_071557_create_cart_item_options_table', 1),
(47, '2024_01_24_154034_create_deliveries_table', 1),
(49, '2023_12_15_071651_create_order_item_options_table', 1),
(54, '2023_12_15_071916_create_app_infos_table', 1),
(61, '2024_03_13_075344_create_product_extras_table', 1),
(62, '2023_12_15_071510_create_carts_table', 1),
(63, '2023_12_15_071532_create_cart_items_table', 1),
(77, '2023_12_15_071658_create_order_items_table', 2),
(78, '2023_12_15_071703_create_orders_table', 2),
(79, '2024_01_17_101222_create_order_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `is_agree` int(11) DEFAULT NULL,
  `extra_quantity` bigint(20) DEFAULT NULL,
  `extra_total` bigint(20) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `delivery_name` varchar(255) DEFAULT NULL,
  `delivery_price` int(11) DEFAULT NULL,
  `delivery_status` varchar(255) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_total` int(11) DEFAULT NULL,
  `order_quantity` bigint(20) DEFAULT NULL,
  `order_total` bigint(20) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_no`, `is_agree`, `extra_quantity`, `extra_total`, `message`, `delivery_name`, `delivery_price`, `delivery_status`, `product_quantity`, `product_total`, `order_quantity`, `order_total`, `payment_method`, `created_at`, `updated_at`) VALUES
(34, 1, 'REF202403149873', 1, 0, 0, NULL, '15km around Harare', 1500, 'Processing', 1, 2500, 1, 4000, 'Paynow', '2024-03-14 09:13:27', '2024-03-14 09:13:27'),
(35, 1, 'REF202403148133', 1, 0, 0, NULL, '15km around Harare', 1500, 'Processing', 1, 8500, 1, 10000, 'Paynow', '2024-03-14 09:15:12', '2024-03-14 09:15:12'),
(36, 1, 'REF202403147506', 1, 5, 500, NULL, 'Harare CBD', 1000, 'Processing', 1, 1500, 6, 3000, 'Paynow', '2024-03-14 09:21:10', '2024-03-14 09:21:10'),
(37, 1, 'REF202403141530', 1, 5, 500, 'ggggggggggggggggggggggg', 'Harare CBD', 1000, 'Processing', 1, 8600, 6, 10100, 'Paynow', '2024-03-14 09:23:44', '2024-03-14 09:23:44'),
(38, 1, 'REF202403143902', 1, 0, 0, NULL, 'Harare CBD', 1000, 'Processing', 1, 1500, 1, 2500, 'Paynow', '2024-03-14 09:28:26', '2024-03-14 09:28:26'),
(39, 1, 'REF202403142448', 1, 5, 500, NULL, 'Harare CBD', 1000, 'Processing', 1, 2500, 6, 4000, 'Paynow', '2024-03-14 09:30:43', '2024-03-14 09:30:43'),
(40, 1, 'REF202403145384', 1, 0, 0, NULL, 'Harare CBD', 1000, 'Processing', 1, 1500, 1, 2500, 'Paynow', '2024-03-14 09:45:52', '2024-03-14 09:45:52'),
(41, 1, 'REF202403147391', 1, 10, 1000, NULL, 'Harare CBD', 1000, 'Processing', 2, 4000, 12, 6000, 'Paynow', '2024-03-14 10:08:40', '2024-03-14 10:08:40'),
(42, 1, 'REF202403142641', 1, 0, 0, NULL, '15km around Harare', 1500, 'Processing', 2, 6000, 2, 7500, 'Paynow', '2024-03-14 10:10:45', '2024-03-14 10:10:45'),
(43, 1, 'REF202403146530', 1, 5, 500, NULL, 'Harare CBD', 1000, 'Processing', 1, 2500, 6, 4000, 'Paynow', '2024-03-14 10:14:06', '2024-03-14 10:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_unit_price` bigint(20) DEFAULT NULL,
  `product_quantity` bigint(20) DEFAULT NULL,
  `product_total` bigint(20) DEFAULT NULL,
  `orderitem_total` bigint(20) DEFAULT NULL,
  `orderitem_quantity` bigint(20) DEFAULT NULL,
  `extra_name` varchar(255) DEFAULT NULL,
  `extra_quantity` bigint(20) DEFAULT NULL,
  `extra_total` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `user_id`, `order_id`, `product_id`, `product_name`, `product_unit_price`, `product_quantity`, `product_total`, `orderitem_total`, `orderitem_quantity`, `extra_name`, `extra_quantity`, `extra_total`, `created_at`, `updated_at`) VALUES
(35, 1, 34, 55, 'Protea Pincushion bouquets L10', 2500, 1, 2500, 2500, 1, 'Extra Flowers', 0, 0, '2024-03-14 09:13:27', '2024-03-14 09:13:27'),
(36, 1, 35, 75, 'Small Heart Boxed Roses', 8500, 1, 8500, 8500, 1, 'Extra Flowers', 0, 0, '2024-03-14 09:15:12', '2024-03-14 09:15:12'),
(37, 1, 36, 54, 'Protea Pincushion Bouquets S10', 1500, 1, 1500, 2000, 6, 'Extra Flowers', 5, 500, '2024-03-14 09:21:10', '2024-03-14 09:21:10'),
(38, 1, 37, 89, 'Roses only bouquets M50', 8600, 1, 8600, 9100, 6, 'Extra Flowers', 5, 500, '2024-03-14 09:23:44', '2024-03-14 09:23:44'),
(39, 1, 38, 67, 'Mixed Bouquets M5', 1500, 1, 1500, 1500, 1, 'Extra Flowers', 0, 0, '2024-03-14 09:28:26', '2024-03-14 09:28:26'),
(40, 1, 39, 81, 'Roses only Bouquets M10', 2500, 1, 2500, 3000, 6, 'Extra Flowers', 5, 500, '2024-03-14 09:30:43', '2024-03-14 09:30:43'),
(41, 1, 40, 54, 'Protea Pincushion Bouquets S10', 1500, 1, 1500, 1500, 1, 'Extra Flowers', 0, 0, '2024-03-14 09:45:52', '2024-03-14 09:45:52'),
(42, 1, 41, 54, 'Protea Pincushion Bouquets S10', 1500, 1, 1500, 1500, 1, 'Extra Flowers', 0, 0, '2024-03-14 10:08:40', '2024-03-14 10:08:40'),
(43, 1, 41, 55, 'Protea Pincushion bouquets L10', 2500, 1, 2500, 3500, 11, 'Extra Flowers', 10, 1000, '2024-03-14 10:08:40', '2024-03-14 10:08:40'),
(44, 1, 42, 82, 'Roses only bouquets S20', 3000, 2, 6000, 6000, 2, 'Extra Flowers', 0, 0, '2024-03-14 10:10:45', '2024-03-14 10:10:45'),
(45, 1, 43, 55, 'Protea Pincushion bouquets L10', 2500, 1, 2500, 3000, 6, 'Extra Flowers', 5, 500, '2024-03-14 10:14:06', '2024-03-14 10:14:06');

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
(33, 34, 1, 'Mark Chovava', 'Mark', 'Chovava', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'mark@email.com', '+263782210021', '2024-03-14 09:13:27', '2024-03-14 09:13:27'),
(34, 35, 1, 'Mark Chovava', 'Mark', 'Chovava', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'mark@email.com', '+263782210021', '2024-03-14 09:15:12', '2024-03-14 09:15:12'),
(35, 36, 1, 'Mark Chovava', 'Mark', 'Chovava', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'mark@email.com', '+263782210021', '2024-03-14 09:21:10', '2024-03-14 09:21:10'),
(36, 37, 1, 'Mark Chovava', 'Mark', 'Chovava', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'mark@email.com', '+263782210021', '2024-03-14 09:23:44', '2024-03-14 09:23:44'),
(37, 38, 1, 'Mark Chovava', 'Mark', 'Chovava', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'markchovava@gmail.com', '+263782210021', '2024-03-14 09:28:26', '2024-03-14 09:28:26'),
(38, 39, 1, 'Mark Chovava', 'Mark', 'Chovava', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'markchovava@gmail.com', '+263782210021', '2024-03-14 09:30:43', '2024-03-14 09:30:43'),
(39, 40, 1, 'Mark Chovava', 'Mark', 'Chovava', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'markchovava@gmail.com', '+263782210021', '2024-03-14 09:45:52', '2024-03-14 09:45:52'),
(40, 41, 1, 'Mark Chovava', 'Mark', 'Chovava', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'markchovava@gmail.com', '+263782210021', '2024-03-14 10:08:40', '2024-03-14 10:08:40'),
(41, 42, 1, 'Mark Chovava', 'Mark', 'Chovava', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'markchovava@gmail.com', '+263782210021', '2024-03-14 10:10:45', '2024-03-14 10:10:45'),
(42, 43, 1, 'Mark Chovava', 'Mark', 'Chovava', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', 'markchovava@gmail.com', '+263782210021', '2024-03-14 10:14:06', '2024-03-14 10:14:06');

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
(48, 'App\\Models\\User', 1, 'mark@email.com', '2be1272c3b12d8265ac79f81f08b7aeae96ab1c715731bf2fcda162cd47c3e8c', '[\"*\"]', NULL, NULL, '2024-02-19 12:45:00', '2024-02-19 12:45:00'),
(50, 'App\\Models\\User', 1, 'mark@email.com', '76031f82856c665dc4287a41ce79878fc8fd11e384d220ae3903e41ad1dbe231', '[\"*\"]', NULL, NULL, '2024-02-19 12:47:18', '2024-02-19 12:47:18'),
(52, 'App\\Models\\User', 1, 'mark@email.com', 'ec798ca2fa40853cab04a21918afb361799b05aebc313234cdb5269fe0a43b79', '[\"*\"]', NULL, NULL, '2024-02-19 12:48:50', '2024-02-19 12:48:50'),
(54, 'App\\Models\\User', 1, 'mark@email.com', 'd4bed2abd4f7d956896984ec29ed467966248696a19b19edc707ef2b839188a1', '[\"*\"]', NULL, NULL, '2024-02-19 13:09:40', '2024-02-19 13:09:40'),
(56, 'App\\Models\\User', 1, 'mark@email.com', '488e8cdc13f8488a9194347d34678dfefc3c9a8091b08ad829b621a03b871290', '[\"*\"]', NULL, NULL, '2024-02-19 13:18:16', '2024-02-19 13:18:16'),
(58, 'App\\Models\\User', 1, 'mark@email.com', '3f20d9a406f39e199de23d05cbc8e3c334d000f5959cf97dce0796883869217d', '[\"*\"]', NULL, NULL, '2024-02-19 13:21:40', '2024-02-19 13:21:40'),
(61, 'App\\Models\\User', 1, 'mark@email.com', '1ca4a8657b4764901a38e713964ee55095c6b6fe3a93bb079565bf4bad31d6df', '[\"*\"]', NULL, NULL, '2024-02-20 11:31:03', '2024-02-20 11:31:03'),
(62, 'App\\Models\\User', 1, 'mark@email.com', 'a5515d910b89099cbb745b5cad518bb2af14ff0517553f5fa70fb35b80a0ec82', '[\"*\"]', NULL, NULL, '2024-02-20 11:33:26', '2024-02-20 11:33:26'),
(63, 'App\\Models\\User', 1, 'mark@email.com', 'd7248c950fe6f7b89c831992a36b715118a7b6957838f9858d87c7d31f425287', '[\"*\"]', NULL, NULL, '2024-02-20 11:34:57', '2024-02-20 11:34:57'),
(64, 'App\\Models\\User', 1, 'mark@email.com', 'c2e9740d7841ddf441b7095ff1116ada5bf15ed6f0d380219d188eb31d82641c', '[\"*\"]', NULL, NULL, '2024-02-20 11:37:47', '2024-02-20 11:37:47'),
(65, 'App\\Models\\User', 1, 'mark@email.com', 'f9602b6a41d1fe83cda9c82aea3bd1e0032f7b8a2531d78acaf3ae01badcfedc', '[\"*\"]', NULL, NULL, '2024-02-20 11:39:03', '2024-02-20 11:39:03'),
(66, 'App\\Models\\User', 1, 'mark@email.com', '3cea35f7fbc0af52ff58e8c91b33d7754cea937cb55b668896d4535c961a7e1e', '[\"*\"]', NULL, NULL, '2024-02-20 11:48:40', '2024-02-20 11:48:40'),
(67, 'App\\Models\\User', 1, 'mark@email.com', '1f47bae85b1f74bb223af958e5985850aa9e5bef5c779531ec5c3e7802c8ea3c', '[\"*\"]', NULL, NULL, '2024-02-20 11:49:54', '2024-02-20 11:49:54'),
(68, 'App\\Models\\User', 1, 'mark@email.com', 'a0c259926fa3e06cc68afb235086b79fc1621aa7ed992b915c5a73ec56b483d1', '[\"*\"]', NULL, NULL, '2024-02-20 11:56:36', '2024-02-20 11:56:36'),
(69, 'App\\Models\\User', 1, 'mark@email.com', 'f1de5d7eab1327a10bc502d139bd7cd8e30e4b08e76d7deb9cdb9c13880bd452', '[\"*\"]', NULL, NULL, '2024-02-20 18:32:47', '2024-02-20 18:32:47'),
(70, 'App\\Models\\User', 1, 'mark@email.com', 'd048b63e99f82b8af0f6f5164fa2a8e97d57bb95156bc39969e4832328ac7b86', '[\"*\"]', NULL, NULL, '2024-02-20 18:32:48', '2024-02-20 18:32:48'),
(71, 'App\\Models\\User', 1, 'mark@email.com', '91978ed7cba649f672671a9f5ca5e981a25fbd21f41eaaa5f4d699750ad6ecba', '[\"*\"]', NULL, NULL, '2024-02-21 04:09:54', '2024-02-21 04:09:54'),
(72, 'App\\Models\\User', 1, 'mark@email.com', 'ab91427ed82b331065170ad04015c02dfdb6a27291cbe67ad0683480e6411c84', '[\"*\"]', NULL, NULL, '2024-02-21 04:09:55', '2024-02-21 04:09:55'),
(73, 'App\\Models\\User', 1, 'mark@email.com', '463f66dcb088c0481809a1ec82eef1be1e376e4028e6f36513c80e54b46e420c', '[\"*\"]', '2024-03-14 10:14:14', NULL, '2024-03-12 06:11:16', '2024-03-14 10:14:14');

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
(51, 1, 'Mixed Bouquets M10', 'We pride ourselves with bouquets that are full of fresh cut roses.\r\nCustomers can order our standard bouquets described in the catalogue and order as many extra roses as they want to be added to their bouquet or to be delivered as a separate extra bouquet. Enjoy ordering our standard bouquets and extras. Experience the bliss of flowers when we deliver your order.\r\nMedium size,\r\n5 roses,\r\nL= 40-45cm,\r\nW=30cm.', 1500, 'storage/img/products/image_20240312080.jpg', 'storage/img/products/thumbnail_2024031208149.jpg', '2023-12-15 15:07:22', '2024-03-12 11:22:23'),
(52, 1, 'Protea Pincushion Bouquets L10', 'Protea Pincushion Bouquets small size arrangement in a basket with 10 flowers.', 2500, 'storage/img/products/image_2024031210820.jpg', 'storage/img/products/thumbnail_2024031210285.jpg', '2023-12-15 15:09:17', '2024-03-12 11:02:36'),
(53, 1, 'Baskets S9 Oval', 'Small size arrangement in a basket with 9 roses plus an assortment of fillers and greenery.\r\nLength=25cm\r\nWidth= 15cm\r\nHeight=10cm', 2800, 'storage/img/products/image_2024031209902.jpg', 'storage/img/products/thumbnail_202403120965.jpg', '2023-12-15 15:10:25', '2024-03-12 11:17:05'),
(54, 1, 'Protea Pincushion Bouquets S10', 'Protea Pincushion Bouquets small size arrangement in a basket with 10 flowers. Length = 40cm - 45cm, Width= 35cm.', 1500, 'storage/img/products/image_2024031210578.jpg', 'storage/img/products/thumbnail_2024031210215.jpg', '2023-12-15 15:15:57', '2024-03-12 11:09:51'),
(55, 1, 'Protea Pincushion bouquets L10', 'Protea Pincushion Bouquets small size arrangement in a basket with 10 flowers.', 2500, 'storage/img/products/image_2024021910822.jpg', 'storage/img/products/thumbnail_2024021910320.jpg', '2023-12-15 15:23:20', '2024-03-12 11:05:02'),
(56, 1, 'Protea Pincushion bouquets M15', 'Protea Pincushion bouquets medium size arrangement in a basket with 15 flowers.', 2500, 'storage/img/products/image_20240312104.jpg', 'storage/img/products/thumbnail_202403121090.jpg', '2023-12-15 15:24:19', '2024-03-12 11:06:36'),
(57, 1, 'Protea Pincushion Bouquets M10', 'Protea Pincushion Bouquets medium size arrangement in a basket with 10 flowers.', 2000, 'storage/img/products/image_2024021910747.jpg', 'storage/img/products/thumbnail_2024021910465.jpg', '2023-12-15 15:26:24', '2024-03-12 11:07:15'),
(58, 1, 'Baskets M9 Oval', 'Baskets M9 Oval medium size arrangement in a basket with 9 roses plus an assortment of fillers and greenery.\r\nLength = 35cm,\r\nWidth = 20cm,\r\nHeight = 10cm.', 3200, 'storage/img/products/image_2024031209567.jpg', 'storage/img/products/thumbnail_202403120918.jpg', '2023-12-15 15:28:09', '2024-03-12 11:11:59'),
(61, 1, 'Mixed Bouquets S10', 'We pride ourselves with bouquets that are full of fresh cut roses. Customers can order our standard bouquets described in the catalogue and order as many extra roses as they want to be added to their bouquet or to be delivered as a separate extra bouquet. Enjoy ordering our standard bouquets and extras. Experience the bliss of flowers when we deliver your order.', 2000, 'storage/img/products/image_2024021910857.jpg', 'storage/img/products/thumbnail_2024021910106.jpg', '2023-12-15 18:01:44', '2024-03-12 06:42:33'),
(63, 1, 'Baskets L13 oval', 'Baskets L13 oval large size arrangement in a basket with 13 roses plus an assortment of fillers and greenery.\r\nLength=45cm, Width = 25cm, Height = 15cm.', 5000, 'storage/img/products/image_2024031209409.jpg', 'storage/img/products/thumbnail_202403120960.jpg', '2023-12-15 18:16:39', '2024-03-12 11:13:14'),
(64, 1, 'Baskets L13 round', 'Large size arrangement in a basket with 13 roses plus an assortment of fillers and greenery.\r\nDiameter=45cm,\r\nHeight = 15cm.', 4500, 'storage/img/products/image_202403120937.jpg', 'storage/img/products/thumbnail_2024031209401.jpg', '2023-12-15 18:21:18', '2024-03-12 11:20:56'),
(65, 1, 'Mixed Bouquets S5', 'We pride ourselves with bouquets that are full of fresh cut roses. Customers can order our standard bouquets described in the catalogue and order as many extra roses as they want to be added to their bouquet or to be delivered as a separate extra bouquet. Enjoy ordering our standard bouquets and extras. Experience the bliss of flowers when we deliver your order. \r\nA small size bouquet with 5 roses plus an assortment of fillers and greenery.\r\nLength= 30-35cm\r\nWidth at top= 20cm', 1500, 'storage/img/products/image_2024031208675.jpg', 'storage/img/products/thumbnail_202403120813.jpg', '2023-12-15 18:23:30', '2024-03-12 06:39:19'),
(66, 1, 'Mixed Bouquets L10', 'We pride ourselves with bouquets that are full of fresh cut roses. Customers can order our standard bouquets described in the catalogue and order as many extra roses as they want to be added to their bouquet or to be delivered as a separate extra bouquet. Enjoy ordering our standard bouquets and extras. Experience the bliss of flowers when we deliver your order.\r\nLarge Size, <br />\r\n10 roses. <br />\r\nL= 50-55cm, <br />\r\nW=40cm <br />', 2500, 'storage/img/products/image_2024031209510.jpg', 'storage/img/products/thumbnail_2024031209859.jpg', '2023-12-16 08:35:33', '2024-03-12 11:19:06'),
(67, 1, 'Mixed Bouquets M5', 'We pride ourselves with bouquets that are full of fresh cut roses. Customers can order our standard bouquets described in the catalogue and order as many extra roses as they want to be added to their bouquet or to be delivered as a separate extra bouquet. Enjoy ordering our standard bouquets and extras. Experience the bliss of flowers when we deliver your order. A small size bouquet with 5 roses plus an assortment of fillers and greenery.  \r\nMedium size\r\n5 roses\r\nL= 40-45cm\r\nW=30cm', 1500, 'storage/img/products/image_2024031209947.jpg', 'storage/img/products/thumbnail_2024031209395.jpg', '2024-01-15 07:57:17', '2024-03-12 11:18:13'),
(68, 1, 'Baskets M9 Round', 'Baskets M9 Round medium size arrangement in a basket with 9 roses plus an assortment of fillers and greenery.\r\nDiameter=35cm\r\nHeight = 10cm', 3000, 'storage/img/products/image_2024021910124.jpg', 'storage/img/products/thumbnail_2024021910273.jpg', '2024-01-16 11:20:04', '2024-03-12 11:20:20'),
(69, 1, 'Protea Pincushion Bouquets L15', 'Protea Pincushion Bouquets large size arrangement in a basket with 15 flowers.', 3500, 'storage/img/products/image_202403121093.jpg', 'storage/img/products/thumbnail_20240310835.jpg', '2024-03-12 08:33:10', '2024-03-12 11:01:47'),
(70, 1, 'Protea Pincushion Bouquets L20', 'Protea Pincushion Bouquets large size arrangement in a basket with 20 flowers.', 4500, 'storage/img/products/image_2024031210491.jpg', 'storage/img/products/thumbnail_20240310731.jpg', '2024-03-12 08:37:42', '2024-03-12 11:00:58'),
(71, 1, 'Protea Pincushion Bouquets L30', 'Protea Pincushion Bouquets large size arrangement with 30 flowers.', 6500, 'storage/img/products/image_2024031211150.jpg', 'storage/img/products/thumbnail_20240311484.jpg', '2024-03-12 09:01:04', '2024-03-12 11:00:09'),
(72, 1, 'Round Small Boxed Roses', 'Round Small Boxed Roses arrangement of roses.', 8500, 'storage/img/products/image_2024031211739.jpg', 'storage/img/products/thumbnail_20240311751.jpg', '2024-03-12 09:09:52', '2024-03-12 10:54:45'),
(73, 1, 'Medium Round Boxed Roses', 'Medium Round Box arrangement of roses.', 10500, 'storage/img/products/image_2024031211184.jpg', 'storage/img/products/thumbnail_2024031190.jpg', '2024-03-12 09:11:15', '2024-03-12 10:55:47'),
(74, 1, 'Large Round Boxed Roses', 'Large Round Boxed Roses arrangement of roses', 15000, 'storage/img/products/image_2024031211234.jpg', 'storage/img/products/thumbnail_20240311323.jpg', '2024-03-12 09:12:29', '2024-03-12 10:56:15'),
(75, 1, 'Small Heart Boxed Roses', 'Small Heart Boxed Roses arrangement of roses.', 8500, 'storage/img/products/image_2024031211936.jpg', 'storage/img/products/thumbnail_20240311938.jpg', '2024-03-12 09:13:48', '2024-03-12 10:56:39'),
(76, 1, 'Medium Heart Boxed Roses', 'Medium Heart Boxed Roses arrangement of roses.', 10500, 'storage/img/products/image_2024031211529.jpg', 'storage/img/products/thumbnail_20240311561.jpg', '2024-03-12 09:16:28', '2024-03-12 10:57:18'),
(77, 1, 'Large Heart Boxed Roses', 'Large Heart Boxed Roses arrangement of roses.', 15000, 'storage/img/products/image_2024031211351.jpg', 'storage/img/products/thumbnail_20240311132.jpg', '2024-03-12 09:20:52', '2024-03-12 10:54:11'),
(78, 1, 'Small Square Boxed Roses', 'Small Square Boxed Roses arrangement of roses.', 8500, 'storage/img/products/image_2024031211465.jpg', 'storage/img/products/thumbnail_20240311210.jpg', '2024-03-12 09:25:08', '2024-03-12 10:53:37'),
(79, 1, 'Medium Square Boxed Roses', 'Medium Square Boxed Roses arrangement of roses.', 10500, 'storage/img/products/image_2024031211559.jpg', 'storage/img/products/thumbnail_20240311185.jpg', '2024-03-12 09:26:39', '2024-03-12 10:53:04'),
(80, 1, 'Large Square Boxed Roses', 'Large Square Boxed Roses arrangement of roses.', 15000, 'storage/img/products/image_2024031211866.jpg', 'storage/img/products/thumbnail_2024031116.jpg', '2024-03-12 09:27:53', '2024-03-12 10:52:29'),
(81, 1, 'Roses only Bouquets M10', 'Various colors and sizes are available.', 2500, 'storage/img/products/image_202403121379.jpg', 'storage/img/products/thumbnail_20240313158.jpg', '2024-03-12 11:26:21', '2024-03-12 11:47:09'),
(82, 1, 'Roses only bouquets S20', 'Roses only bouquets various colors and sizes are available.', 3000, 'storage/img/products/image_202403121364.jpg', 'storage/img/products/thumbnail_2024031213843.jpg', '2024-03-12 11:28:07', '2024-03-12 11:48:53'),
(83, 1, 'Roses only bouquets S30', 'Various colors and sizes are available.', 4200, 'storage/img/products/image_2024031213272.jpg', 'storage/img/products/thumbnail_20240313217.jpg', '2024-03-12 11:29:15', '2024-03-12 11:43:56'),
(84, 1, 'Roses only bouquets S10', 'Various colors and sizes are available.', 2000, 'storage/img/products/image_2024031213466.jpg', 'storage/img/products/thumbnail_2024031213440.jpg', '2024-03-12 11:29:54', '2024-03-12 11:44:20'),
(85, 1, 'Roses only bouquets M10', 'Roses only bouquets with various colors and sizes are available.', 2500, 'storage/img/products/image_2024031213790.jpg', 'storage/img/products/thumbnail_20240313427.jpg', '2024-03-12 11:32:16', '2024-03-12 11:44:46'),
(86, 1, 'Roses only bouquets M20', 'Roses only bouquets with various colors and sizes are available.', 4000, 'storage/img/products/image_2024031213627.jpg', 'storage/img/products/thumbnail_20240313964.jpg', '2024-03-12 11:33:08', '2024-03-12 11:46:11'),
(87, 1, 'Roses only bouquets M30', 'Roses only bouquets with various colors and sizes are available.', 5500, 'storage/img/products/image_2024031213565.jpg', 'storage/img/products/thumbnail_20240313167.jpg', '2024-03-12 11:34:00', '2024-03-12 11:49:23'),
(88, 1, 'Roses only bouquets M40', 'Roses only bouquets with various colors and sizes are available.', 7000, 'storage/img/products/image_2024031213868.jpg', 'storage/img/products/thumbnail_20240313484.jpg', '2024-03-12 11:35:21', '2024-03-12 11:47:43'),
(89, 1, 'Roses only bouquets M50', 'Roses only bouquets with various colors and sizes are available.', 8600, 'storage/img/products/image_2024031213389.jpg', 'storage/img/products/thumbnail_2024031314.jpg', '2024-03-12 11:36:28', '2024-03-12 11:50:00'),
(90, 1, 'Roses only bouquets L10', 'Roses only bouquets with various colors and sizes are available.', 3000, 'storage/img/products/image_2024031213380.jpg', 'storage/img/products/thumbnail_20240313889.jpg', '2024-03-12 11:37:56', '2024-03-12 11:46:34'),
(91, 1, 'Roses only bouquets L20', 'Roses only bouquets with various colors and sizes are available.', 5000, 'storage/img/products/image_2024031213395.jpg', 'storage/img/products/thumbnail_20240313932.jpg', '2024-03-12 11:38:45', '2024-03-12 11:45:42'),
(92, 1, 'Roses only bouquets L40', 'Roses only bouquets with various colors and sizes are available.', 9000, 'storage/img/products/image_2024031213408.jpg', 'storage/img/products/thumbnail_2024031351.jpg', '2024-03-12 11:40:01', '2024-03-12 11:45:14'),
(93, 1, 'Roses only bouquets L30', 'Roses only bouquets with various colors and sizes are available.', 7000, 'storage/img/products/image_2024031213965.jpg', 'storage/img/products/thumbnail_20240313216.jpg', '2024-03-12 11:40:47', '2024-03-12 11:43:30'),
(94, 1, 'Roses only bouquets L50', 'Roses only bouquets with various colors and sizes are available.', 11000, 'storage/img/products/image_2024031213371.jpg', 'storage/img/products/thumbnail_20240313113.jpg', '2024-03-12 11:41:47', '2024-03-12 11:42:55'),
(95, 1, 'Roses only bouquets M100', 'Roses only bouquets with various colors and sizes are available.', 21000, 'storage/img/products/image_2024031213835.jpg', 'storage/img/products/thumbnail_20240313128.jpg', '2024-03-12 11:56:51', '2024-03-12 11:56:51');

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
(5, 1, 68, 4, '2024-01-18 07:11:23', '2024-01-18 07:11:23'),
(6, 1, 51, 3, '2024-01-18 07:11:47', '2024-01-18 07:11:47'),
(8, 1, 67, 3, '2024-01-18 07:12:39', '2024-01-18 07:12:39'),
(10, 1, 61, 3, '2024-01-18 07:13:03', '2024-01-18 07:13:03'),
(12, 1, 65, 3, '2024-01-18 07:14:31', '2024-01-18 07:14:31'),
(13, 1, 64, 4, '2024-01-18 07:14:52', '2024-01-18 07:14:52'),
(15, 1, 53, 4, '2024-01-18 07:15:23', '2024-01-18 07:15:23'),
(16, 1, 63, 4, '2024-01-18 07:17:10', '2024-01-18 07:17:10'),
(17, 1, 54, 3, '2024-01-18 07:17:49', '2024-01-18 07:17:49'),
(21, 1, 58, 4, '2024-01-18 07:20:09', '2024-01-18 07:20:09'),
(22, 1, 57, 3, '2024-01-18 07:20:53', '2024-01-18 07:20:53'),
(23, 1, 57, 4, '2024-01-18 07:20:53', '2024-01-18 07:20:53'),
(30, 1, 69, 2, '2024-03-12 08:33:52', '2024-03-12 08:33:52'),
(31, 1, 77, 5, '2024-03-12 09:35:25', '2024-03-12 09:35:25'),
(32, 1, 80, 5, '2024-03-12 09:36:04', '2024-03-12 09:36:04'),
(33, 1, 79, 5, '2024-03-12 09:37:19', '2024-03-12 09:37:19'),
(34, 1, 78, 5, '2024-03-12 09:37:54', '2024-03-12 09:37:54'),
(35, 1, 72, 5, '2024-03-12 09:43:32', '2024-03-12 09:43:32'),
(37, 1, 76, 5, '2024-03-12 09:44:17', '2024-03-12 09:44:17'),
(38, 1, 73, 5, '2024-03-12 09:44:39', '2024-03-12 09:44:39'),
(39, 1, 74, 5, '2024-03-12 09:45:09', '2024-03-12 09:45:09'),
(40, 1, 75, 5, '2024-03-12 09:46:16', '2024-03-12 09:46:16'),
(42, 1, 71, 2, '2024-03-12 10:58:49', '2024-03-12 10:58:49'),
(43, 1, 52, 2, '2024-03-12 11:03:00', '2024-03-12 11:03:00'),
(44, 1, 70, 2, '2024-03-12 11:03:28', '2024-03-12 11:03:28'),
(45, 1, 55, 2, '2024-03-12 11:04:24', '2024-03-12 11:04:24'),
(46, 1, 56, 2, '2024-03-12 11:06:16', '2024-03-12 11:06:16'),
(48, 1, 81, 6, '2024-03-12 11:26:44', '2024-03-12 11:26:44'),
(49, 1, 93, 6, '2024-03-12 11:52:18', '2024-03-12 11:52:18'),
(50, 1, 89, 6, '2024-03-12 11:53:18', '2024-03-12 11:53:18'),
(51, 1, 87, 6, '2024-03-12 11:53:53', '2024-03-12 11:53:53'),
(52, 1, 82, 6, '2024-03-12 11:54:30', '2024-03-12 11:54:30'),
(53, 1, 95, 6, '2024-03-12 11:57:02', '2024-03-12 11:57:02'),
(54, 1, 88, 6, '2024-03-12 11:57:28', '2024-03-12 11:57:28'),
(55, 1, 84, 6, '2024-03-12 11:57:44', '2024-03-12 11:57:44'),
(56, 1, 90, 6, '2024-03-12 11:57:58', '2024-03-12 11:57:58'),
(57, 1, 85, 6, '2024-03-12 11:58:20', '2024-03-12 11:58:20'),
(58, 1, 86, 6, '2024-03-12 11:59:38', '2024-03-12 11:59:38'),
(59, 1, 91, 6, '2024-03-12 11:59:52', '2024-03-12 11:59:52'),
(60, 1, 92, 6, '2024-03-12 12:00:06', '2024-03-12 12:00:06'),
(61, 1, 83, 6, '2024-03-12 12:00:25', '2024-03-12 12:00:25'),
(62, 1, 89, 7, '2024-03-12 12:16:07', '2024-03-12 12:16:07'),
(63, 1, 54, 7, '2024-03-12 12:16:38', '2024-03-12 12:16:38'),
(64, 1, 84, 7, '2024-03-12 12:17:25', '2024-03-12 12:17:25'),
(65, 1, 58, 7, '2024-03-12 12:17:56', '2024-03-12 12:17:56'),
(66, 1, 72, 7, '2024-03-12 12:18:22', '2024-03-12 12:18:22'),
(67, 1, 71, 7, '2024-03-12 12:19:18', '2024-03-12 12:19:18'),
(68, 1, 75, 7, '2024-03-12 12:19:59', '2024-03-12 12:19:59'),
(69, 1, 61, 7, '2024-03-12 12:20:54', '2024-03-12 12:20:54');

-- --------------------------------------------------------

--
-- Table structure for table `product_extras`
--

CREATE TABLE `product_extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_extras`
--

INSERT INTO `product_extras` (`id`, `user_id`, `name`, `slug`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'Extra Flowers', 'flower', 5, 100, NULL, NULL);

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
(1, 'Mark Chovava', 1, 'Mark', 'Chovava', 'markchovava@gmail.com', '+263782210021', '$2y$12$OVnjtrqUeiwV5tyyLiEYseYy9zN9wpXhyxYIqi64z2AssMXEyzF2K', '12345678', '14949  Tynwald South, Harare, Zimbabwe', 'Harare', 'Zimbabwe', NULL, NULL, '2024-01-17 09:42:03', '2024-01-26 06:57:54'),
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
-- Indexes for table `product_extras`
--
ALTER TABLE `product_extras`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `cart_item_options`
--
ALTER TABLE `cart_item_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `order_users`
--
ALTER TABLE `order_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `product_extras`
--
ALTER TABLE `product_extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
