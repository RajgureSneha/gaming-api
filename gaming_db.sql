-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2025 at 02:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gaming_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_03_190214_create_otps_table', 1),
(5, '2025_06_03_190224_create_scores_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `otps`
--

INSERT INTO `otps` (`id`, `phone`, `otp`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, '9876543210', '1234', '2025-06-04 03:22:55', '2025-06-04 02:56:01', '2025-06-04 03:12:56'),
(3, '9876543211', '1234', '2025-06-04 03:07:36', '2025-06-04 02:56:38', '2025-06-04 02:57:36'),
(4, '9876543212', '1234', '2025-06-04 03:17:09', '2025-06-04 02:58:37', '2025-06-04 03:07:10'),
(11, '9888566996', '1234', '2025-06-05 06:44:01', '2025-06-05 06:43:01', '2025-06-05 06:43:01');

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
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL,
  `scored_at` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`id`, `user_id`, `score`, `scored_at`, `created_at`, `updated_at`) VALUES
(1, 2, 120, '2025-06-04', '2025-06-04 03:33:32', '2025-06-04 03:33:32'),
(2, 3, 300, '2025-06-04', '2025-06-04 07:37:56', '2025-06-04 07:37:56'),
(3, 4, 50, '2025-06-04', '2025-06-04 07:44:10', '2025-06-04 07:44:10'),
(4, 5, 90, '2025-06-04', '2025-06-04 07:47:52', '2025-06-04 07:47:52'),
(5, 5, 120, '2025-05-15', '2025-06-04 07:48:53', '2025-06-04 07:48:53'),
(6, 5, 150, '2025-06-04', '2025-06-04 07:49:20', '2025-06-04 07:49:20'),
(7, 6, 250, '2025-06-04', '2025-06-04 08:59:14', '2025-06-04 08:59:14'),
(8, 7, 150, '2025-05-06', '2025-06-05 04:21:26', '2025-06-05 04:21:26'),
(9, 7, 190, '2025-06-06', '2025-06-05 04:21:38', '2025-06-05 04:21:38'),
(10, 8, 190, '2025-06-05', '2025-06-05 06:46:35', '2025-06-05 06:46:35'),
(11, 9, 200, '2025-06-05', '2025-06-05 07:07:56', '2025-06-05 07:07:56'),
(12, 9, 300, '2025-06-05', '2025-06-05 07:08:07', '2025-06-05 07:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8ndTzFyOu2zXLwffQ74HbnUq55H0wVwSdsJQ341b', NULL, '127.0.0.1', 'PostmanRuntime/7.44.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjVWelk3d3BDRXcxZ0s2UTJkelhDVWF3bW9FUVl1d2d0YW42ZDdsNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749026602),
('dxNGIhWCN8pkNDmF80Phv3Sk08uv697zW2D936fy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXRQd0laamExTFdZeFBVbGVXdVhHZHpPdXFoT1BWbW5EWW5DWUF6RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749116989),
('H9RfuNus6Dtun2743IzHLbel06w41dTj2A1DqZlm', NULL, '127.0.0.1', 'PostmanRuntime/7.44.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnRvdDhYRDNWdnFpTnFDdGhqd05qT09rUFFFazZ6ZnROQlhNRmRlRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1749045786);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `dob`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ram', 'john@example.com', NULL, '$2y$12$uh8W0Wd40pC6RYIvOTtGDOa8J77Uz18hMZUsBQzddJnt8gN8UF.4.', '9876543210', '2000-01-01', NULL, '2025-06-04 00:31:51', '2025-06-04 00:31:51'),
(2, 'sneha', 'sneha@example.com', NULL, '$2y$12$KHNty0M4yZUz74VHDXBjSuJECWfoD/4UDAPdab0wmLQ1DpNWv1VLu', '7038529623', '2000-01-01', NULL, '2025-06-04 03:14:35', '2025-06-04 03:14:35'),
(3, 'rahul', 'rahul@example.com', NULL, '$2y$12$WjQPIRetilpshzpw8Ywp8.gYpZTKR9Z5LfWmmh9qrp/v7fIz0/nhq', '7038553629', '2000-11-01', NULL, '2025-06-04 07:34:59', '2025-06-04 07:34:59'),
(4, 'neha', 'neha@example.com', NULL, '$2y$12$KgO/0VK5h2JfLNZ42R5KgOdmE.v8aAJI4.rg0YZ5va79wzrET1xAC', '1234567899', '2002-11-01', NULL, '2025-06-04 07:41:26', '2025-06-04 07:41:26'),
(5, 'priti', 'priti@example.com', NULL, '$2y$12$P/BMN/1N71F4wZ0gIqUpGeI5.qd0yYNxLYwGFWl0hW1lzBjgLntOy', '8886952336', '2003-08-01', NULL, '2025-06-04 07:46:47', '2025-06-04 07:46:47'),
(6, 'test', 'test@example.com', NULL, '$2y$12$yUwIe8p/rQLzB97Lwm7gSuUWdTtlI86AQ66nrBXNPhdiNFsTBwPfi', '9888566235', '1999-01-01', NULL, '2025-06-04 08:58:18', '2025-06-04 08:58:18'),
(7, 'test1', 'test1@example.com', NULL, '$2y$12$raLPVi3R6weQnhdLb4s7L.apJsJ5paj501gfnZF4HdzpI8SJBwzHe', '9888566334', '1999-01-01', NULL, '2025-06-05 04:20:33', '2025-06-05 04:20:33'),
(8, 'Rhohan', 'rohan@gmail.com', NULL, '$2y$12$EqlsC9JOgLyc8NbLLhUDnO9dyWBCnByFctHjKDW.z/AvSG2DCToXC', '8547962356', '1999-01-11', NULL, '2025-06-05 06:45:08', '2025-06-05 06:45:08'),
(9, 'Rhohans', 'rohan1@gmail.com', NULL, '$2y$12$mW31jVjWb98b7p9sOzb6J.CghBExwTBwYfUrzqaEDtv2vlUVZowkq', '9888566888', '1999-01-11', NULL, '2025-06-05 07:07:16', '2025-06-05 07:07:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scores_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
