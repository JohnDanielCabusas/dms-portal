-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2025 at 01:07 PM
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
-- Database: `db_dms`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `activity_log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `auto_created` tinyint(1) DEFAULT 0,
  `is_unclassified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `created_at`, `auto_created`, `is_unclassified`) VALUES
(5002, 'Resignation Letter', '', '2025-11-18 22:17:11', 1, 0),
(5003, 'Leave Request Form', '', '2025-11-18 22:18:06', 1, 0),
(5004, 'Resume / CV', 'Auto-created category for Resume / CV', '2025-11-24 02:26:40', 1, 0),
(5005, 'Leave Request', 'Auto-created category for Leave Request', '2025-12-03 05:28:11', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `name`, `user_id`, `created_at`) VALUES
(4001, 'IT', 1, '2025-11-17 02:21:47'),
(4002, 'Marketing', 1, '2025-11-17 02:21:47'),
(4003, 'Sales', 1, '2025-11-17 02:21:47'),
(4004, 'HR', 1, '2025-11-17 02:21:47'),
(4005, 'Finance', 1, '2025-11-17 02:21:47'),
(4006, 'Nursing', 1, '2025-11-27 02:39:14'),
(4007, 'qwertyuY', 3, '2025-12-03 07:46:28'),
(4008, 'Unassigned', 10, '2025-12-03 12:25:24'),
(4009, 'cfccvcxfffggsss', 3, '2025-12-03 12:46:38');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `file_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `size` bigint(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `document_type` varchar(100) DEFAULT NULL,
  `classification_confidence` enum('Low','Medium','High') DEFAULT NULL,
  `classification_error` varchar(255) DEFAULT NULL,
  `text_sample` text DEFAULT NULL,
  `shared` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','archived','deleted') DEFAULT 'active',
  `file_path` varchar(500) DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT 0,
  `encryption_version` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_shares`
--

CREATE TABLE `file_shares` (
  `share_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `shared_with_user_id` int(11) DEFAULT NULL,
  `shared_with_department_id` int(11) DEFAULT NULL,
  `permission` enum('viewer','editor') DEFAULT 'viewer',
  `shared_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_workspaces`
--

CREATE TABLE `file_workspaces` (
  `file_workspace_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reset_codes`
--

CREATE TABLE `reset_codes` (
  `reset_codes_id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `code` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `token` varchar(255) NOT NULL DEFAULT '',
  `expires_at` timestamp NULL DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sessions_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sessions_id`, `user_id`, `email`, `timestamp`) VALUES
(7027, 1, 'admin@example.com', '2025-11-21 21:53:59'),
(7028, 1, 'admin@example.com', '2025-11-21 22:01:03'),
(7030, 1, 'admin@example.com', '2025-11-22 03:15:19'),
(7032, 1, 'admin@example.com', '2025-11-22 04:08:55'),
(7033, 1, 'admin@example.com', '2025-11-22 04:08:56'),
(7034, 1, 'admin@example.com', '2025-11-22 05:04:46'),
(7035, 1, 'admin@example.com', '2025-11-22 05:14:54'),
(7036, 1, 'admin@example.com', '2025-11-22 13:20:12'),
(7037, 1, 'admin@example.com', '2025-11-23 11:16:46'),
(7038, 1, 'admin@example.com', '2025-11-23 13:30:58'),
(7039, 1, 'admin@example.com', '2025-11-23 13:47:10'),
(7040, 1, 'admin@example.com', '2025-11-24 02:09:30'),
(7041, 1, 'admin@example.com', '2025-11-24 02:24:26'),
(7042, 1, 'admin@example.com', '2025-11-24 02:26:08'),
(7043, 1, 'admin@example.com', '2025-11-24 02:30:32'),
(7044, 1, 'admin@example.com', '2025-11-24 02:46:17'),
(7045, 1, 'admin@example.com', '2025-11-24 03:02:03'),
(7046, 1, 'admin@example.com', '2025-11-24 03:13:56'),
(7047, 1, 'admin@example.com', '2025-11-24 03:17:55'),
(7048, 1, 'admin@example.com', '2025-11-24 03:37:49'),
(7049, 1, 'admin@example.com', '2025-11-24 06:09:15'),
(7050, 1, 'admin@example.com', '2025-11-24 06:30:35'),
(7051, 1, 'admin@example.com', '2025-11-24 06:36:57'),
(7052, 1, 'admin@example.com', '2025-11-24 06:38:14'),
(7053, 1, 'admin@example.com', '2025-11-24 06:40:00'),
(7054, 1, 'admin@example.com', '2025-11-24 06:49:10'),
(7055, 1, 'admin@example.com', '2025-11-24 06:53:54'),
(7056, 1, 'admin@example.com', '2025-11-24 07:09:03'),
(7057, 1, 'admin@example.com', '2025-11-24 07:16:00'),
(7058, 1, 'admin@example.com', '2025-11-24 07:46:38'),
(7059, 1, 'admin@example.com', '2025-11-26 14:04:53'),
(7060, 1, 'admin@example.com', '2025-11-27 00:18:44'),
(7061, 1, 'admin@example.com', '2025-11-27 00:28:19'),
(7062, 1, 'admin@example.com', '2025-11-27 00:37:30'),
(7063, 1, 'admin@example.com', '2025-11-27 00:45:59'),
(7064, 1, 'admin@example.com', '2025-11-27 01:27:01'),
(7065, 1, 'admin@example.com', '2025-11-27 04:35:18'),
(7066, 1, 'admin@example.com', '2025-11-27 04:36:28'),
(7067, 1, 'admin@example.com', '2025-11-27 04:49:08'),
(7068, 1, 'admin@example.com', '2025-11-27 05:21:50'),
(7070, 1, 'admin@example.com', '2025-11-27 09:04:19'),
(7071, 1, 'admin@example.com', '2025-11-27 09:19:57'),
(7072, 1, 'admin@example.com', '2025-11-27 09:23:24'),
(7073, 1, 'admin@example.com', '2025-11-27 11:11:46'),
(7074, 1, 'admin@example.com', '2025-11-27 12:35:22'),
(7075, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-27 13:40:24'),
(7077, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-27 15:39:47'),
(7080, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-27 15:57:48'),
(7082, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-27 16:17:59'),
(7083, 1, 'admin@example.com', '2025-11-28 07:08:35'),
(7084, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-28 12:36:32'),
(7085, 1, 'admin@example.com', '2025-11-28 14:10:14'),
(7086, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-28 14:50:15'),
(7088, 1, 'admin@example.com', '2025-11-28 15:38:59'),
(7091, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-28 15:43:40'),
(7092, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-28 19:10:46'),
(7093, 1, 'admin@example.com', '2025-11-28 19:47:38'),
(7094, 1, 'admin@example.com', '2025-11-28 19:47:39'),
(7095, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-28 20:16:31'),
(7097, 1, 'admin@example.com', '2025-11-28 20:27:36'),
(7098, 1, 'admin@example.com', '2025-11-28 20:48:47'),
(7099, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-28 20:50:11'),
(7100, 1, 'admin@example.com', '2025-11-28 20:58:56'),
(7101, 1, 'admin@example.com', '2025-11-28 21:12:03'),
(7102, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-28 21:29:08'),
(7103, 1, 'admin@example.com', '2025-11-28 21:42:32'),
(7104, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-28 21:49:09'),
(7105, 1, 'admin@example.com', '2025-11-28 21:58:14'),
(7106, 1, 'admin@example.com', '2025-11-28 22:27:57'),
(7107, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-28 22:45:46'),
(7110, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-29 02:36:27'),
(7111, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-30 06:35:37'),
(7112, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-30 06:35:38'),
(7113, 1, 'admin@example.com', '2025-11-30 06:36:57'),
(7122, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-30 10:52:42'),
(7128, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-30 11:23:48'),
(7137, 1, 'admin@example.com', '2025-12-03 13:19:55'),
(7138, 1, 'admin@example.com', '2025-12-03 13:20:26'),
(7139, 1, 'admin@example.com', '2025-12-03 13:47:20'),
(7140, 1, 'admin@example.com', '2025-12-03 14:16:24'),
(7141, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-12-03 14:23:59'),
(7143, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-12-04 00:52:51'),
(7144, 1, 'admin@example.com', '2025-12-04 10:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `company` varchar(150) NOT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `max_file_mb` int(11) DEFAULT 50,
  `allowed_types` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `company`, `company_logo`, `created_by`, `updated_by`, `max_file_mb`, `allowed_types`) VALUES
(6001, 'DWYDTWQGDQWGD', '338fe8c24ec9c982c919685ae424f812cb94d69bfd13e003ee85d76d07580d77.png', 1, 1, 50, 'pdf,doc,docx,xls,xlsx,ppt,pptx,jpg,jpeg,png,gif,txt,zip');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('system_admin','department_admin','staff') NOT NULL DEFAULT 'staff',
  `department_id` int(11) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `status` enum('active','archived') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `role`, `department_id`, `profile_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'System Admin', 'admin@example.com', 'admin123', 'system_admin', 4004, 'gAAAAABpMW7-cIZTChi1-ABJSqdzExNWEXcWofu04PGyVrVgs5pgsdkB0DbbRjSdVwRVicKniuU6K8BfS5teOCMDdgQc6C4pWSz5fEacX-1X38YytRZg7wcNdN_266R5fU_Z12M18djfqXaxmZL2dlnSUcd2-7BszKnYjXBE3rZxYtnzEG9wdzw=.png', 'active', '2025-11-17 02:21:49', '2025-12-04 11:22:38'),
(7, 'Lyrika Jewel Hermoso', 'hermoso_lyrikajewel@plpasig.edu.ph', 'QWERTY', 'department_admin', 4007, 'feb6fa964ad9acf0912f9762c24db9210a285ad4cbc655b370557715bc8a4b30.png', 'active', '2025-11-27 13:36:06', '2025-12-03 12:44:20');

-- --------------------------------------------------------

--
-- Table structure for table `workspaces`
--

CREATE TABLE `workspaces` (
  `workspace_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workspaces`
--

INSERT INTO `workspaces` (`workspace_id`, `user_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(2001, 1, 'BSIT', '', '2025-11-18 22:13:27', '2025-11-30 09:27:46'),
(2002, 1, 'ccs', 'desc', '2025-11-18 22:14:32', '2025-11-19 04:09:33'),
(2003, 1, 'qwerty', '', '2025-11-19 04:51:04', '2025-11-19 04:54:33'),
(2004, 7, 'secret', '', '2025-11-28 12:52:54', '2025-11-28 12:52:54');

-- --------------------------------------------------------

--
-- Table structure for table `workspace_members`
--

CREATE TABLE `workspace_members` (
  `workspace_member_id` int(11) NOT NULL,
  `workspace_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workspace_members`
--

INSERT INTO `workspace_members` (`workspace_member_id`, `workspace_id`, `user_id`, `joined_at`) VALUES
(3015, 2002, 1, '2025-11-19 04:09:33'),
(3019, 2003, 1, '2025-11-19 04:54:33'),
(3028, 2004, 7, '2025-11-28 12:52:54'),
(3029, 2001, 1, '2025-11-30 09:27:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`activity_log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `idx_files_user_id` (`user_id`),
  ADD KEY `idx_files_status` (`status`),
  ADD KEY `idx_files_shared` (`shared`),
  ADD KEY `files_ibfk_3` (`category_id`);

--
-- Indexes for table `file_shares`
--
ALTER TABLE `file_shares`
  ADD PRIMARY KEY (`share_id`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `shared_with_user_id` (`shared_with_user_id`),
  ADD KEY `shared_with_department_id` (`shared_with_department_id`),
  ADD KEY `idx_file_shares_file` (`file_id`),
  ADD KEY `idx_file_shares_user` (`shared_with_user_id`),
  ADD KEY `idx_file_shares_dept` (`shared_with_department_id`);

--
-- Indexes for table `file_workspaces`
--
ALTER TABLE `file_workspaces`
  ADD PRIMARY KEY (`file_workspace_id`),
  ADD UNIQUE KEY `unique_file_workspace` (`file_id`,`workspace_id`),
  ADD KEY `workspace_id` (`workspace_id`);

--
-- Indexes for table `reset_codes`
--
ALTER TABLE `reset_codes`
  ADD PRIMARY KEY (`reset_codes_id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_reset_codes_user_id` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sessions_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`),
  ADD KEY `idx_settings_created_by` (`created_by`),
  ADD KEY `idx_settings_updated_by` (`updated_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_users_role` (`role`),
  ADD KEY `idx_users_status` (`status`),
  ADD KEY `idx_users_department` (`department_id`);

--
-- Indexes for table `workspaces`
--
ALTER TABLE `workspaces`
  ADD PRIMARY KEY (`workspace_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `workspace_members`
--
ALTER TABLE `workspace_members`
  ADD PRIMARY KEY (`workspace_member_id`),
  ADD UNIQUE KEY `unique_workspace_member` (`workspace_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `activity_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8581;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5006;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4010;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1147;

--
-- AUTO_INCREMENT for table `file_shares`
--
ALTER TABLE `file_shares`
  MODIFY `share_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `file_workspaces`
--
ALTER TABLE `file_workspaces`
  MODIFY `file_workspace_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10064;

--
-- AUTO_INCREMENT for table `reset_codes`
--
ALTER TABLE `reset_codes`
  MODIFY `reset_codes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9007;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `sessions_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7145;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6002;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `workspaces`
--
ALTER TABLE `workspaces`
  MODIFY `workspace_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2005;

--
-- AUTO_INCREMENT for table `workspace_members`
--
ALTER TABLE `workspace_members`
  MODIFY `workspace_member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3033;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `activity_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `files_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `file_shares`
--
ALTER TABLE `file_shares`
  ADD CONSTRAINT `file_shares_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `file_shares_ibfk_2` FOREIGN KEY (`shared_with_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `file_shares_ibfk_3` FOREIGN KEY (`shared_with_department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE;

--
-- Constraints for table `file_workspaces`
--
ALTER TABLE `file_workspaces`
  ADD CONSTRAINT `file_workspaces_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `file_workspaces_ibfk_2` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`workspace_id`) ON DELETE CASCADE;

--
-- Constraints for table `reset_codes`
--
ALTER TABLE `reset_codes`
  ADD CONSTRAINT `fk_reset_codes_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `fk_settings_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_settings_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `workspaces`
--
ALTER TABLE `workspaces`
  ADD CONSTRAINT `workspaces_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `workspace_members`
--
ALTER TABLE `workspace_members`
  ADD CONSTRAINT `workspace_members_ibfk_1` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`workspace_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `workspace_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
