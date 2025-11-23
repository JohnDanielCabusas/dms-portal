-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2025 at 11:05 PM
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

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`activity_log_id`, `user_id`, `activity`, `timestamp`) VALUES
(8079, 1, 'Updated workspace: BSIT', '2025-11-19 02:59:00'),
(8080, 1, 'Updated workspace: BSIT', '2025-11-19 02:59:28'),
(8081, 1, 'Uploaded 1 files', '2025-11-19 03:00:09'),
(8082, 1, 'Uploaded 1 files', '2025-11-19 03:00:28'),
(8083, 1, 'Uploaded 1 files', '2025-11-19 03:00:39'),
(8084, 1, 'Uploaded 1 files', '2025-11-19 03:01:08'),
(8085, 1, 'Deleted workspace: ccs', '2025-11-19 03:02:19'),
(8086, 1, 'Updated workspace: BSIT', '2025-11-19 04:08:44'),
(8087, 1, 'User logged in', '2025-11-19 04:09:12'),
(8088, 1, 'Updated workspace: ccs', '2025-11-19 04:09:35'),
(8089, 1, 'Added \"resignation.docx\" to workspace(s): BSIT, ccs', '2025-11-19 04:40:13'),
(8090, 1, 'User logged in', '2025-11-19 04:49:47'),
(8091, 1, 'Created workspace: qwerty', '2025-11-19 04:51:05'),
(8092, 1, 'Updated workspace: qwerty', '2025-11-19 04:54:34'),
(8093, 1, 'Updated workspace: BSIT', '2025-11-19 05:04:14'),
(8094, 1, 'Updated workspace: BSIT', '2025-11-19 05:14:49'),
(8095, 1, 'Updated workspace: BSIT', '2025-11-19 05:15:02'),
(8096, 1, 'Added \"resignation.docx\" to workspace(s): ccs, qwerty', '2025-11-19 05:15:20'),
(8097, 1, 'Added \"resignation.docx\" to workspace(s): ccs, qwerty', '2025-11-19 05:15:51'),
(8098, 2, 'User logged in', '2025-11-19 06:39:01'),
(8099, 1, 'User logged in', '2025-11-20 01:49:37'),
(8100, 1, 'Added \"resignation.docx\" to workspace(s): ccs', '2025-11-20 01:50:46'),
(8101, 1, 'Added \"leave.pdf\" to workspace(s): ccs, qwerty', '2025-11-20 01:53:21'),
(8102, 3, 'User logged in', '2025-11-20 01:56:16'),
(8103, 3, 'Added \"resignation.docx\" to workspace(s): BSIT', '2025-11-20 02:01:19'),
(8104, 1, 'User logged in', '2025-11-20 02:02:46'),
(8105, 1, 'Added \"resignation.docx\" to workspace(s): ccs', '2025-11-20 02:06:44'),
(8106, 1, 'Restored leave.pdf', '2025-11-20 02:46:00'),
(8107, 1, 'Restored leave (1).pdf', '2025-11-20 02:46:03'),
(8108, 1, 'Restored resignation.docx', '2025-11-20 02:46:05'),
(8109, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-11-20 03:34:12'),
(8110, 1, 'Downloaded invoice-sample.pdf', '2025-11-20 03:34:55'),
(8111, 1, 'Uploaded 1 files', '2025-11-20 03:35:26'),
(8112, 1, 'Uploaded 1 files', '2025-11-20 03:35:26'),
(8113, 1, 'Downloaded leave.pdf', '2025-11-20 03:35:31'),
(8114, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-11-20 03:37:17'),
(8115, 1, 'Uploaded 1 files', '2025-11-20 03:38:04'),
(8116, 1, 'Downloaded leave.pdf', '2025-11-20 04:12:08'),
(8117, 1, 'Downloaded resignation.docx', '2025-11-20 04:12:14'),
(8118, 1, 'Downloaded leave.pdf', '2025-11-20 04:13:09'),
(8119, 1, 'Downloaded resignation.docx', '2025-11-20 04:13:16'),
(8120, 1, 'Uploaded 1 files', '2025-11-20 04:57:11'),
(8121, 1, 'Uploaded 1 files', '2025-11-20 05:17:49'),
(8122, 1, 'Unshared leave.pdf', '2025-11-20 05:21:24'),
(8123, 1, 'Shared leave.pdf', '2025-11-20 05:21:30'),
(8124, 1, 'User logged in', '2025-11-20 05:27:56'),
(8125, 1, 'User logged in', '2025-11-20 05:29:56'),
(8126, 1, 'User logged in', '2025-11-20 06:16:41'),
(8127, 1, 'Uploaded 1 files', '2025-11-20 06:40:44'),
(8128, 1, 'Uploaded 1 files', '2025-11-20 06:41:06'),
(8129, 1, 'User logged in', '2025-11-20 07:15:50'),
(8130, 1, 'Uploaded 1 files', '2025-11-20 08:41:33'),
(8131, 1, 'Uploaded 1 files', '2025-11-20 08:42:50'),
(8132, 1, 'Uploaded 1 files', '2025-11-20 08:43:37'),
(8133, 1, 'User logged in', '2025-11-20 08:51:18'),
(8134, 1, 'Uploaded 1 files', '2025-11-20 08:52:01'),
(8135, 1, 'Permanently deleted leave.pdf', '2025-11-20 08:53:46'),
(8136, 1, 'User logged in', '2025-11-20 09:00:11'),
(8137, 1, 'Uploaded 1 files', '2025-11-20 09:00:51'),
(8138, 1, 'User logged in', '2025-11-20 10:03:09'),
(8139, 1, 'Downloaded resignation.docx', '2025-11-20 10:38:30'),
(8140, 1, 'Uploaded 1 files', '2025-11-20 10:46:11'),
(8141, 1, 'Uploaded 1 files', '2025-11-20 10:46:52'),
(8142, 1, 'Uploaded 1 files', '2025-11-20 12:01:44'),
(8143, 1, 'Uploaded 1 files', '2025-11-20 12:03:20'),
(8144, 1, 'Uploaded 1 files', '2025-11-20 12:49:37'),
(8145, 1, 'Uploaded 1 files', '2025-11-20 13:09:33'),
(8146, 1, 'User logged in', '2025-11-20 13:34:01'),
(8147, 1, 'Uploaded 1 files', '2025-11-20 13:42:14'),
(8148, 1, 'Restored file ID: 1027', '2025-11-20 14:22:24'),
(8149, 1, 'Uploaded 1 files', '2025-11-20 14:26:19'),
(8150, 1, 'Restored file ID: 1029', '2025-11-20 14:30:36'),
(8151, 1, 'Restored file ID: 1029', '2025-11-20 14:31:33'),
(8152, 1, 'User logged in', '2025-11-20 14:59:19'),
(8153, 1, 'User logged in', '2025-11-20 15:08:32'),
(8154, 1, 'User logged in', '2025-11-20 15:09:07'),
(8155, 1, 'Downloaded DTR_Format_Sample.xlsx', '2025-11-20 15:19:03'),
(8156, 1, 'Downloaded resignation.docx', '2025-11-20 15:34:13'),
(8157, 1, 'Uploaded 1 files', '2025-11-20 15:36:45'),
(8158, 1, 'Downloaded leave.pdf', '2025-11-20 15:37:10'),
(8159, 1, 'Uploaded 1 files', '2025-11-20 15:39:08'),
(8160, 1, 'Restored file ID: 1031', '2025-11-20 15:39:55'),
(8161, 1, 'Permanently deleted Logo.png', '2025-11-20 15:39:59'),
(8162, 1, 'Permanently deleted Screenshot 2025-11-20 233719.png', '2025-11-20 15:40:17'),
(8163, 1, 'Added \"DTR_Format_Sample.xlsx\" to workspace(s): ccs, qwerty', '2025-11-20 16:20:04'),
(8164, 1, 'Added \"resignation.docx\" to workspace(s): ccs, qwerty', '2025-11-20 16:20:31'),
(8165, 1, 'Added \"DTR_Format_Sample.xlsx\" to workspace(s): ccs', '2025-11-20 16:21:08'),
(8166, 1, 'User logged in', '2025-11-20 16:27:02'),
(8167, 1, 'Uploaded 1 files', '2025-11-20 16:33:08'),
(8168, 1, 'User logged in', '2025-11-21 12:19:27'),
(8169, 1, 'Updated workspace: BSIT', '2025-11-21 12:23:08'),
(8170, 1, 'Added \"leave.pdf\" to workspace(s): BSIT, ccs, qwerty', '2025-11-21 12:24:01'),
(8171, 1, 'Uploaded 1 files', '2025-11-21 12:26:42'),
(8172, 1, 'Uploaded 1 files', '2025-11-21 12:30:37'),
(8173, 1, 'Uploaded 1 files', '2025-11-21 12:30:52'),
(8174, 1, 'Uploaded 1 files', '2025-11-21 12:31:06'),
(8175, 1, 'Added \"leave.pdf\" to workspace(s): BSIT, ccs', '2025-11-21 12:31:20'),
(8176, 1, 'Uploaded 1 files', '2025-11-21 12:43:32'),
(8177, 1, 'Uploaded 1 files', '2025-11-21 12:43:49'),
(8178, 1, 'Added \"leave.docx\" to workspace(s): BSIT, ccs', '2025-11-21 12:54:21'),
(8179, 1, 'Added \"leave.docx\" to workspace(s): BSIT, ccs', '2025-11-21 12:54:47'),
(8180, 1, 'User logged in', '2025-11-21 12:55:23'),
(8181, 1, 'Added \"leave.pdf\" to workspace(s): BSIT, ccs, qwerty', '2025-11-21 13:04:20'),
(8182, 1, 'Uploaded 1 files to 2 workspace(s)', '2025-11-21 13:27:30'),
(8183, 1, 'Uploaded 1 files to 2 workspace(s)', '2025-11-21 13:44:02'),
(8184, 1, 'Uploaded 1 files to 2 workspace(s)', '2025-11-21 13:44:34'),
(8185, 1, 'Uploaded 1 files', '2025-11-21 13:51:10'),
(8186, 1, 'Uploaded 1 files', '2025-11-21 14:06:22'),
(8187, 1, 'Updated workspace associations for \"leave.pdf\" - Added to: BSIT, ccs', '2025-11-21 14:06:38'),
(8188, 1, 'Updated workspace associations for \"leave.pdf\" - Added to: BSIT', '2025-11-21 14:07:04'),
(8189, 1, 'Uploaded 1 files', '2025-11-21 14:53:02'),
(8190, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-21 14:53:20'),
(8191, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-21 14:54:11'),
(8192, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-21 15:10:04'),
(8193, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-21 15:10:34'),
(8194, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-21 15:10:52'),
(8195, 1, 'Permanently deleted leave.pdf', '2025-11-21 15:25:38'),
(8196, 1, 'Uploaded 1 files to 2 workspace(s)', '2025-11-21 15:25:57'),
(8197, 1, 'Added user: Full name', '2025-11-21 15:29:55'),
(8198, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-21 15:38:43'),
(8199, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-21 15:38:54'),
(8200, 1, 'Uploaded 1 files', '2025-11-21 15:41:51'),
(8201, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-21 15:42:06'),
(8202, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-21 15:53:41'),
(8203, 1, 'Uploaded 1 files', '2025-11-21 15:57:08'),
(8204, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-21 15:57:19'),
(8205, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-21 16:03:13'),
(8206, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-21 16:03:35'),
(8207, 1, 'Uploaded 1 files', '2025-11-21 16:03:55'),
(8208, 1, 'Updated workspaces for \"resignation.docx\"', '2025-11-21 16:04:40'),
(8209, 1, 'Restored file ID: 1060', '2025-11-21 16:06:08'),
(8210, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-11-21 16:09:54'),
(8211, 1, 'Updated system settings', '2025-11-21 16:19:57'),
(8212, 1, 'User logged in', '2025-11-21 21:53:59'),
(8213, 1, 'Downloaded leave.pdf', '2025-11-21 21:54:09'),
(8214, 1, 'User logged in', '2025-11-21 22:01:03'),
(8215, 1, 'Uploaded 1 files', '2025-11-21 22:01:53'),
(8216, 1, 'Uploaded 1 files', '2025-11-21 22:03:44'),
(8217, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-11-21 22:04:06');

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
(5001, 'Unclassified', 'Unknown file types', '2025-11-17 02:21:53', 1, 1),
(5002, 'Resignation Letter', '', '2025-11-18 22:17:11', 1, 0),
(5003, 'Leave Request Form', '', '2025-11-18 22:18:06', 1, 0);

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
(4005, 'Finance', 1, '2025-11-17 02:21:47');

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
  `workspace_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `document_type` varchar(100) DEFAULT NULL,
  `classification_confidence` enum('Low','Medium','High') DEFAULT NULL,
  `classification_error` varchar(255) DEFAULT NULL,
  `text_sample` text DEFAULT NULL,
  `shared` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','archived','deleted') DEFAULT 'active',
  `file_path` varchar(500) DEFAULT NULL,
  `document_type_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`file_id`, `name`, `original_name`, `size`, `type`, `user_id`, `workspace_id`, `category_id`, `document_type`, `classification_confidence`, `classification_error`, `text_sample`, `shared`, `created_at`, `status`, `file_path`, `document_type_category_id`) VALUES
(1061, 'leave.txt', 'leave.txt', 800, 'txt', 1, NULL, NULL, 'Leave Request Form', 'Low', NULL, 'october 23, 2025\n mr. daniel cruz\n human resources manager\n technova solutions inc.\n makati city, metro manila\n subject: leave request\n dear mr. cruz,\n i would like to formally request a leave of abse...', 0, '2025-11-21 16:09:53', 'active', 'C:\\Users\\PLPASIG\\AppData\\Local\\Temp\\dms_uploads\\2025\\11\\user_1\\leave.txt', NULL),
(1062, 'leave.pdf', 'leave.pdf', 17170, 'pdf', 1, NULL, NULL, 'Leave Request Form', 'Low', NULL, 'october 23, 2025\nmr. daniel cruz\nhuman resources manager\ntechnova solutions inc.\nmakati city, metro manila\nsubject: leave request\ndear mr. cruz,\ni would like to formally request a leave of absence fro...', 0, '2025-11-21 22:01:53', 'active', 'C:\\Users\\PLPASIG\\AppData\\Local\\Temp\\dms_uploads\\2025\\11\\user_1\\leave.pdf', NULL),
(1063, 'resignation.pdf', 'resignation.pdf', 37030, 'pdf', 1, NULL, NULL, 'Resignation Letter', 'Low', NULL, 'john daniel cabusas\npasig city, metro manila, 1600\njanden@email.com\n0911-000-4444\noctober 17, 2025\nmr. john p. cruz\nhuman resources manager\nbrighttech solutions inc.\nmandaluyong city, metro manila\nsub...', 0, '2025-11-21 22:03:43', 'active', 'C:\\Users\\PLPASIG\\AppData\\Local\\Temp\\dms_uploads\\2025\\11\\user_1\\resignation.pdf', NULL),
(1064, 'invoice-sample.pdf', 'invoice-sample.pdf', 61513, 'pdf', 1, NULL, NULL, 'Unclassified', 'Low', NULL, 'acme web solutions\n1234 cloud drive, makati city, 1200\nphone: (02) 5555-0123 | email: billing@acmeweb.ph\noctober 25, 2025\ninvoice no.: aw-2025-1001\ndue date: november 9, 2025\nbill to:\nbright star ente...', 0, '2025-11-21 22:04:06', 'active', 'C:\\Users\\PLPASIG\\AppData\\Local\\Temp\\dms_uploads\\2025\\11\\user_1\\invoice-sample.pdf', NULL);

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

--
-- Dumping data for table `file_workspaces`
--

INSERT INTO `file_workspaces` (`file_workspace_id`, `file_id`, `workspace_id`, `added_at`) VALUES
(10016, 1061, 2001, '2025-11-21 16:09:53'),
(10017, 1064, 2001, '2025-11-21 22:04:06');

-- --------------------------------------------------------

--
-- Table structure for table `reset_codes`
--

CREATE TABLE `reset_codes` (
  `reset_codes_id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `code` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(7001, 1, 'admin@example.com', '2025-11-17 04:06:52'),
(7002, 1, 'admin@example.com', '2025-11-18 22:08:54'),
(7003, 1, 'admin@example.com', '2025-11-18 22:08:55'),
(7004, 1, 'admin@example.com', '2025-11-18 22:50:10'),
(7005, 1, 'admin@example.com', '2025-11-19 00:15:38'),
(7006, 1, 'admin@example.com', '2025-11-19 04:09:12'),
(7007, 1, 'admin@example.com', '2025-11-19 04:49:47'),
(7008, 2, 'jane@example.com', '2025-11-19 06:39:00'),
(7009, 1, 'admin@example.com', '2025-11-20 01:49:37'),
(7010, 3, 'roces_raiza@plpasig.edu.ph', '2025-11-20 01:56:16'),
(7011, 1, 'admin@example.com', '2025-11-20 02:02:45'),
(7012, 1, 'admin@example.com', '2025-11-20 05:27:55'),
(7013, 1, 'admin@example.com', '2025-11-20 05:29:55'),
(7014, 1, 'admin@example.com', '2025-11-20 06:16:41'),
(7015, 1, 'admin@example.com', '2025-11-20 07:15:50'),
(7016, 1, 'admin@example.com', '2025-11-20 08:51:18'),
(7017, 1, 'admin@example.com', '2025-11-20 09:00:11'),
(7018, 1, 'admin@example.com', '2025-11-20 10:03:09'),
(7019, 1, 'admin@example.com', '2025-11-20 13:34:00'),
(7020, 1, 'admin@example.com', '2025-11-20 14:59:18'),
(7021, 1, 'admin@example.com', '2025-11-20 15:08:32'),
(7022, 1, 'admin@example.com', '2025-11-20 15:09:07'),
(7023, 1, 'admin@example.com', '2025-11-20 15:09:08'),
(7024, 1, 'admin@example.com', '2025-11-20 16:27:01'),
(7025, 1, 'admin@example.com', '2025-11-21 12:19:27'),
(7026, 1, 'admin@example.com', '2025-11-21 12:55:23'),
(7027, 1, 'admin@example.com', '2025-11-21 21:53:59'),
(7028, 1, 'admin@example.com', '2025-11-21 22:01:03');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `company` varchar(150) NOT NULL,
  `max_file_mb` int(11) DEFAULT 50,
  `allowed_types` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `company`, `max_file_mb`, `allowed_types`) VALUES
(6001, 'Acme Corp', 50, 'pdf,doc,docx,xls,xlsx,ppt,pptx,jpg,jpeg,png,gif,txt,zip');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staff') NOT NULL,
  `department_id` int(11) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive','archived') DEFAULT 'active',
  `archive_reason` varchar(100) DEFAULT NULL,
  `archive_notes` text DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `role`, `department_id`, `profile_image`, `status`, `archive_reason`, `archive_notes`, `archived_at`, `created_at`, `updated_at`) VALUES
(1, 'System Admin', 'admin@example.com', 'admin123', 'admin', 4001, NULL, 'active', NULL, NULL, NULL, '2025-11-17 02:21:49', '2025-11-21 12:44:00'),
(2, 'Jane Doe', 'jane@example.com', 'jane123', 'staff', 4002, NULL, 'active', NULL, NULL, NULL, '2025-11-17 02:21:49', '2025-11-17 02:21:49'),
(3, 'Raiza Roces', 'roces_raiza@plpasig.edu.ph', 'qwerty', 'admin', 4001, NULL, 'active', NULL, NULL, NULL, '2025-11-18 22:10:35', '2025-11-21 21:35:24'),
(4, 'Full name', 'fname@gmail.com', 'qwerty', 'staff', 4001, NULL, 'active', NULL, NULL, NULL, '2025-11-21 15:29:52', '2025-11-21 15:29:52');

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
(2001, 1, 'BSIT', '', '2025-11-18 22:13:27', '2025-11-21 12:23:05'),
(2002, 1, 'ccs', 'desc', '2025-11-18 22:14:32', '2025-11-19 04:09:33'),
(2003, 1, 'qwerty', '', '2025-11-19 04:51:04', '2025-11-19 04:54:33');

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
(3025, 2001, 2, '2025-11-21 12:23:05'),
(3026, 2001, 3, '2025-11-21 12:23:05'),
(3027, 2001, 1, '2025-11-21 12:23:05');

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
  ADD KEY `user_id` (`user_id`),
  ADD KEY `workspace_id` (`workspace_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `document_type_category_id` (`document_type_category_id`);

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
  ADD PRIMARY KEY (`reset_codes_id`);

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
  ADD PRIMARY KEY (`settings_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `department_id` (`department_id`);

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
  MODIFY `activity_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8218;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5004;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4008;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1065;

--
-- AUTO_INCREMENT for table `file_workspaces`
--
ALTER TABLE `file_workspaces`
  MODIFY `file_workspace_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10018;

--
-- AUTO_INCREMENT for table `reset_codes`
--
ALTER TABLE `reset_codes`
  MODIFY `reset_codes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9001;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `sessions_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7029;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6002;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `workspaces`
--
ALTER TABLE `workspaces`
  MODIFY `workspace_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2004;

--
-- AUTO_INCREMENT for table `workspace_members`
--
ALTER TABLE `workspace_members`
  MODIFY `workspace_member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3028;

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
  ADD CONSTRAINT `files_ibfk_2` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`workspace_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `files_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `files_ibfk_4` FOREIGN KEY (`document_type_category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `file_workspaces`
--
ALTER TABLE `file_workspaces`
  ADD CONSTRAINT `file_workspaces_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `file_workspaces_ibfk_2` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`workspace_id`) ON DELETE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

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
