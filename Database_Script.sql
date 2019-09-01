-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2019 at 12:02 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `video_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `catName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `catName`, `created_at`, `updated_at`) VALUES
(13, 'Programming', '2019-08-28 00:12:44', '2019-08-28 00:12:44'),
(14, 'Laravel', '2019-08-28 00:12:44', '2019-08-28 00:12:44'),
(15, 'Bangla', '2019-08-28 03:22:03', '2019-08-28 03:22:03'),
(16, 'Sports', '2019-08-28 03:31:54', '2019-08-28 03:31:54'),
(17, 'Islamic', '2019-08-28 03:35:13', '2019-08-28 03:35:13'),
(18, 'Masjid', '2019-08-28 03:37:35', '2019-08-28 03:37:35'),
(19, 'React', '2019-08-28 04:05:37', '2019-08-28 04:05:37'),
(20, 'Coding', '2019-08-31 09:24:20', '2019-08-31 09:24:20'),
(21, 'Jahangir', '2019-08-31 10:02:31', '2019-08-31 10:02:31'),
(22, 'News', '2019-08-31 10:07:36', '2019-08-31 10:07:36'),
(23, 'new', '2019-09-01 00:51:32', '2019-09-01 00:51:32'),
(24, 'new Islamic', '2019-09-01 00:54:08', '2019-09-01 00:54:08'),
(25, 'Zakir Naik', '2019-09-01 03:24:50', '2019-09-01 03:24:50'),
(26, 'Documentary', '2019-09-01 03:27:41', '2019-09-01 03:27:41'),
(27, 'Talk Show', '2019-09-01 03:54:38', '2019-09-01 03:54:38'),
(28, 'Politics', '2019-09-01 03:55:16', '2019-09-01 03:55:16');

-- --------------------------------------------------------

--
-- Table structure for table `category_video`
--

CREATE TABLE `category_video` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_video`
--

INSERT INTO `category_video` (`id`, `category_id`, `video_id`, `created_at`, `updated_at`) VALUES
(40, 19, 36, NULL, NULL),
(41, 13, 36, NULL, NULL),
(58, 15, 42, NULL, NULL),
(59, 27, 42, NULL, NULL),
(60, 28, 42, NULL, NULL),
(61, 27, 43, NULL, NULL),
(62, 15, 43, NULL, NULL),
(63, 15, 44, NULL, NULL),
(64, 26, 44, NULL, NULL),
(65, 16, 45, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_25_135328_create_video_lists_table', 2),
(9, '2019_08_26_050722_create_categories_table', 3),
(10, '2019_08_26_104156_create_videos_table', 4),
(11, '2019_08_27_053232_create_category_video_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('11c3317aa10aaff4e7899466e3549d461db1917c94ca8f04a1295d6b998ef895dba34789b36180df', 3, 1, 'MyApp', '[]', 0, '2019-08-28 03:19:42', '2019-08-28 03:19:42', '2020-08-28 09:19:42'),
('139a9861c48f789d0a4a8473aca3d02b36113ad1fe3a9450630b9ab9a27db5b9e6e31ea99f0c3177', 3, 1, 'MyApp', '[]', 0, '2019-08-26 21:21:07', '2019-08-26 21:21:07', '2020-08-27 03:21:07'),
('2d13c28bf68997200bcd5cd7d8e48acd524879f6650a724eaccb320c0e239bef8104bfe11d0aad6a', 3, 1, 'MyApp', '[]', 0, '2019-08-26 21:26:46', '2019-08-26 21:26:46', '2020-08-27 03:26:46'),
('48984ae7d239bf72ddc6060d534c6372c9b0d4fe04dfe693856d6e23caca2d394d162e16bb9e9798', 3, 1, 'MyApp', '[]', 0, '2019-08-28 00:02:23', '2019-08-28 00:02:23', '2020-08-28 06:02:23'),
('50acbd90b6751b4af2f0ba2a5adec3c49913b974aa7c1d9136edf88e34cc5497dc3155188d9f86f1', 3, 1, 'MyApp', '[]', 0, '2019-08-26 02:54:35', '2019-08-26 02:54:35', '2020-08-26 08:54:35'),
('52d118a637fc02db770c182b78c1c7e0d72151f6bf7dab0c816ef4be7c86444ca2b7dd445fbee157', 3, 1, 'MyApp', '[]', 0, '2019-08-26 20:44:26', '2019-08-26 20:44:26', '2020-08-27 02:44:26'),
('5370e937976f2c853a33c273471fe86bc8f8b085fe0e1964a149b2b7e3d5858b44af34516ef3457c', 3, 1, 'MyApp', '[]', 0, '2019-08-26 08:20:05', '2019-08-26 08:20:05', '2020-08-26 14:20:05'),
('57844835ad4b87b21f61af0e8ff4199a5c996a2a8a934f23bbd33d46c780fca012d09d12a9d2c8e9', 3, 1, 'MyApp', '[]', 0, '2019-08-26 02:45:10', '2019-08-26 02:45:10', '2020-08-26 08:45:10'),
('613fc5d36a172a8d1176b5eeacb5ad5460ed0832ef7f35766e24cdf5be55787cf2c9cb5fad822eda', 3, 1, 'MyApp', '[]', 0, '2019-08-26 18:36:02', '2019-08-26 18:36:02', '2020-08-27 00:36:02'),
('6c577ae57cdc60af718ee4c66376b5644b6e763cc2d04abfa07c2cae298cbac15d18681d26223107', 3, 1, 'MyApp', '[]', 0, '2019-08-26 07:23:59', '2019-08-26 07:23:59', '2020-08-26 13:23:59'),
('739399061b0ba7a68a830b526e44c2d5c3102e1b25d8bdabb663054550e45dc3d32923a977bc8c65', 3, 1, 'MyApp', '[]', 0, '2019-08-26 09:05:28', '2019-08-26 09:05:28', '2020-08-26 15:05:28'),
('779ce4f92de01371d764ace9ebec7cb45d8bf45ce3200ac1f9508cd6f399ca30943a1eaf8afae8a1', 3, 1, 'MyApp', '[]', 0, '2019-08-25 06:14:16', '2019-08-25 06:14:16', '2020-08-25 12:14:16'),
('78ef7ddb54995c4fafe37e03eb66b28a566d3a7273feb454023d850642ec7a7a30d1ddb7187b86f7', 3, 1, 'MyApp', '[]', 0, '2019-08-26 03:05:54', '2019-08-26 03:05:54', '2020-08-26 09:05:54'),
('795c0703e71670eea00daf8498230c9c481cf6cc2f62fa642fefd57d1f391db47e1b7545cd0fabcd', 3, 1, 'MyApp', '[]', 0, '2019-08-26 20:02:31', '2019-08-26 20:02:31', '2020-08-27 02:02:31'),
('7a142a00c3ceee1ec762202e1e1bfa63d15f650f97c50e6ce6004cf1c5a2309dad377f4eae974046', 3, 1, 'MyApp', '[]', 0, '2019-08-26 02:36:30', '2019-08-26 02:36:30', '2020-08-26 08:36:30'),
('7bef1adadf7ff1aef041cb40b3391598e406e580708ca2b67fc9db0c4ca3000e8bae33c977ca6155', 3, 1, 'MyApp', '[]', 0, '2019-08-26 19:58:23', '2019-08-26 19:58:23', '2020-08-27 01:58:23'),
('7c277c2caca1f63788104d658378815a95a6feb4bee87ba405435599a262560928f397e103e00fdb', 3, 1, 'MyApp', '[]', 0, '2019-08-26 20:02:51', '2019-08-26 20:02:51', '2020-08-27 02:02:51'),
('7f0b611a8b515fe7aab0df38818f2118c876313c58d4bb82b7014cdb4989ba282d213580ee3cd601', 3, 1, 'MyApp', '[]', 0, '2019-08-25 06:08:24', '2019-08-25 06:08:24', '2020-08-25 12:08:24'),
('8359c789103b50d26114a290ed86cfe15748cdc679e3c55628a3ecd51cb5ef8649b0dbbf0e871b8e', 3, 1, 'MyApp', '[]', 0, '2019-08-26 07:24:10', '2019-08-26 07:24:10', '2020-08-26 13:24:10'),
('8ade81fd480b3f78f03848e996e532618888812213b0ef1933be494a5c91aa94dee207cf48a61c52', 3, 1, 'MyApp', '[]', 0, '2019-08-26 08:20:16', '2019-08-26 08:20:16', '2020-08-26 14:20:16'),
('8b20a99ab8e99858fa42697441d002a6bee6a0a508f4c4868593ed838cf0d6833287f6523431bf60', 3, 1, 'MyApp', '[]', 0, '2019-08-26 08:20:41', '2019-08-26 08:20:41', '2020-08-26 14:20:41'),
('8e36be232dd217bb665faa395a0ead86e6558668be35635f91a81f2e122ebbba5ed92f8cebf0f28e', 1, 1, 'MyApp', '[]', 0, '2019-08-25 05:08:30', '2019-08-25 05:08:30', '2020-08-25 11:08:30'),
('90a36af958490bae3ac8ae057a0cf3c12ba588cf5b92c9dc1270fdac72a86cf61a17aff8c870a72f', 3, 1, 'MyApp', '[]', 0, '2019-08-26 09:07:39', '2019-08-26 09:07:39', '2020-08-26 15:07:39'),
('96e0fd3a42109a16e29482d8f109be16f68d53c81b8ecd49b1c0110539cdd8980e420be2c5fa9e5e', 3, 1, 'MyApp', '[]', 0, '2019-08-26 03:07:37', '2019-08-26 03:07:37', '2020-08-26 09:07:37'),
('a0f0c4fe576c0d9669838b7ca4b41b5616c1f85c7bd6ab50d7b6bdbd97bcf1bbea22978e7e997c20', 3, 1, 'MyApp', '[]', 0, '2019-08-26 20:41:44', '2019-08-26 20:41:44', '2020-08-27 02:41:44'),
('a6fe6e41b09317ec9bf3bcc53b4da519fc93f4eba0c2c9deb16fc557164650c27a49b61bc4635299', 3, 1, 'MyApp', '[]', 0, '2019-08-26 08:05:07', '2019-08-26 08:05:07', '2020-08-26 14:05:07'),
('cb7f8d379c745911485be8ddb2d3639ca2b0d821ba79bed764b64d3f0274f244c8ecf549788e1b58', 3, 1, 'MyApp', '[]', 0, '2019-08-31 07:50:07', '2019-08-31 07:50:07', '2020-08-31 13:50:07'),
('cca2897318108967ef796888a0bb684e54eef43351345a4ccdaf1f6ff4cf57ffcc7d201e9617267f', 3, 1, 'MyApp', '[]', 0, '2019-08-28 04:25:51', '2019-08-28 04:25:51', '2020-08-28 10:25:51'),
('d2a063eecd229c77bf6efb430315411b765cbdcde02e308b4f52217f2b7ab13ac9928a6047a28852', 3, 1, 'MyApp', '[]', 0, '2019-08-26 02:47:00', '2019-08-26 02:47:00', '2020-08-26 08:47:00'),
('da95a712de6dcd8161a5c14cc08843ad6a6eb0757cef8f457a1203e73647cfb08597f4c53c4d2dea', 3, 1, 'MyApp', '[]', 0, '2019-08-29 03:08:44', '2019-08-29 03:08:44', '2020-08-29 09:08:44'),
('dbb0203c377212fb587e9fce468f2aa62bf3f30f69b203eceb48fc6b109056b149f038474663155e', 3, 1, 'MyApp', '[]', 0, '2019-08-26 02:56:18', '2019-08-26 02:56:18', '2020-08-26 08:56:18'),
('dfdbdd7defba53ca903fcff916ece8d9c5083af5f19b0f85c5210f3f468f7f3710911ddd33d37471', 2, 1, 'MyApp', '[]', 0, '2019-08-25 05:28:19', '2019-08-25 05:28:19', '2020-08-25 11:28:19'),
('e295caf3afee7ecd097a0c72e239c7fc5859f1a5d140c3db1e11a90afe5bafd1d122637765b0eaf6', 3, 1, 'MyApp', '[]', 0, '2019-08-28 03:07:40', '2019-08-28 03:07:40', '2020-08-28 09:07:40'),
('e64da39d650cd43d2d10328ef9f53bea488ab88e05d3a6f785a70b61fe96714c311023b8b024294f', 3, 1, 'MyApp', '[]', 0, '2019-08-26 20:44:10', '2019-08-26 20:44:10', '2020-08-27 02:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Video Manager Personal Access Client', 'mlTiRnElLZP5dF96gAR5aC0lJ2YaZDEjXU9FOcCn', 'http://localhost', 1, 0, 0, '2019-08-25 03:31:21', '2019-08-25 03:31:21'),
(2, NULL, 'Video Manager Password Grant Client', 'lGNXkYhmWwlIoTYuyIhcCHO42KRWqrT85ODLgfyH', 'http://localhost', 0, 1, 0, '2019-08-25 03:31:21', '2019-08-25 03:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-08-25 03:31:21', '2019-08-25 03:31:21');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Akib', 'akshay.akki540@gmail.com', NULL, '$2y$10$CY39vDY1RVFs0fMF8FOfg.PUH7jtLyVwAF.TVTwbLe9J7U3v70LUi', NULL, '2019-08-25 05:08:29', '2019-08-25 05:08:29'),
(2, 'arnab', 'arnab@gmail.com', NULL, '$2y$10$h6VtbQzWe5Cog9NvjVlibOnFdg5yH7o/5xPCWxDmyS8N6OSv9.dIy', NULL, '2019-08-25 05:28:18', '2019-08-25 05:28:18'),
(3, 'arif', 'arif@gmail.com', NULL, '$2y$10$9F3ACPy0FMERRX5/LrjnvOiT1LZ.Xj5izZ/vaH/x8T4vMpxJXtuJu', NULL, '2019-08-25 06:08:24', '2019-08-25 06:08:24');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `title`, `link`, `created_at`, `updated_at`) VALUES
(36, 'What is React e', 'https://www.youtube.com/embed/N3AkSS5hXMA', '2019-08-28 04:05:37', '2019-08-28 04:05:37'),
(42, 'Bangla Tv talk show Edited', 'https://www.youtube.com/embed/9s29lKO9rFU', '2019-09-01 03:54:38', '2019-09-01 03:54:38'),
(43, 'Dbc news talk show', 'https://www.youtube.com/embed/8j-OfWvpVP0', '2019-09-01 03:57:11', '2019-09-01 03:57:11'),
(44, 'Life struggles of shepherds at Bathan', 'https://www.youtube.com/embed/Adazw-c7JXg', '2019-09-01 03:58:01', '2019-09-01 03:58:01'),
(45, 'Cristiano Ronaldo', 'https://www.youtube.com/embed/2mh_ZICm-EU', '2019-09-01 03:59:04', '2019-09-01 03:59:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_video`
--
ALTER TABLE `category_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `category_video`
--
ALTER TABLE `category_video`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
