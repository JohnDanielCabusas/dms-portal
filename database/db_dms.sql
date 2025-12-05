-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2025 at 09:40 AM
-- Server version: 8.0.37
-- PHP Version: 8.2.12

CREATE DATABASE IF NOT EXISTS `db_dms`;
USE `db_dms`;

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
  `activity_log_id` int NOT NULL,
  `user_id` int NOT NULL,
  `activity` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
(8217, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-11-21 22:04:06'),
(8218, 3, 'User logged in', '2025-11-21 23:06:32'),
(8219, 3, 'Updated user: System Admin', '2025-11-21 23:13:52'),
(8220, 1, 'User logged in', '2025-11-22 03:15:19'),
(8221, 1, 'Downloaded invoice-sample.pdf', '2025-11-22 03:34:02'),
(8222, 1, 'Updated workspaces for \"invoice-sample.pdf\"', '2025-11-22 03:35:09'),
(8223, 1, 'Updated workspaces for \"invoice-sample.pdf\"', '2025-11-22 03:35:53'),
(8224, 1, 'Uploaded 1 files', '2025-11-22 03:36:16'),
(8225, 1, 'Restored file ID: 1061', '2025-11-22 03:37:07'),
(8226, 1, 'Added user: glaiiiaa', '2025-11-22 03:40:53'),
(8227, 1, 'Added user: Lyrika', '2025-11-22 03:42:50'),
(8228, 1, 'Unshared leave.txt', '2025-11-22 03:46:03'),
(8229, 1, 'Shared leave.txt', '2025-11-22 03:46:12'),
(8230, 1, 'Unshared leave.txt', '2025-11-22 03:46:19'),
(8231, 1, 'Restored file ID: 1064', '2025-11-22 03:47:34'),
(8232, 1, 'Permanently deleted leave.txt', '2025-11-22 03:50:51'),
(8233, 3, 'User logged in', '2025-11-22 03:56:53'),
(8234, 1, 'User logged in', '2025-11-22 04:08:55'),
(8235, 1, 'User logged in', '2025-11-22 04:08:56'),
(8236, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-22 04:09:47'),
(8237, 1, 'Restored file ID: 1065', '2025-11-22 04:11:19'),
(8238, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-11-22 04:12:20'),
(8239, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-11-22 04:12:22'),
(8240, 1, 'Permanently deleted leave.pdf', '2025-11-22 04:13:26'),
(8241, 1, 'User logged in', '2025-11-22 05:04:47'),
(8242, 1, 'Updated workspaces for \"invoice-sample.pdf\"', '2025-11-22 05:05:41'),
(8243, 1, 'User logged in', '2025-11-22 05:14:54'),
(8244, 1, 'Unshared invoice-sample.pdf', '2025-11-22 05:21:25'),
(8245, 1, 'Downloaded invoice-sample.pdf', '2025-11-22 05:21:28'),
(8246, 1, 'Shared invoice-sample.pdf', '2025-11-22 05:21:34'),
(8247, 1, 'User logged in', '2025-11-22 13:20:12'),
(8248, 1, 'User logged in', '2025-11-23 11:16:46'),
(8249, 1, 'Restored file ID: 1066', '2025-11-23 11:17:42'),
(8250, 1, 'Unshared leave (1).pdf', '2025-11-23 11:40:00'),
(8251, 1, 'Restored file ID: 1065', '2025-11-23 11:42:09'),
(8252, 1, 'Renamed file to: liv.pdf', '2025-11-23 11:53:41'),
(8253, 1, 'Uploaded 1 files', '2025-11-23 11:58:52'),
(8254, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-23 12:13:10'),
(8255, 1, 'User logged in', '2025-11-23 13:30:59'),
(8256, 1, 'Uploaded 1 files', '2025-11-23 13:31:12'),
(8257, 1, 'Uploaded 1 files', '2025-11-23 13:32:02'),
(8258, 1, 'Uploaded 1 files', '2025-11-23 13:32:04'),
(8259, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-11-23 13:33:17'),
(8260, 1, 'Downloaded leave.pdf', '2025-11-23 13:33:36'),
(8261, 1, 'Downloaded leave.pdf', '2025-11-23 13:35:39'),
(8262, 1, 'Downloaded leave.pdf', '2025-11-23 13:35:51'),
(8263, 1, 'User logged in', '2025-11-23 13:47:11'),
(8264, 1, 'Downloaded leave.pdf', '2025-11-23 13:49:43'),
(8265, 1, 'Downloaded leave.pdf', '2025-11-23 13:50:14'),
(8266, 1, 'Downloaded leave.pdf', '2025-11-23 13:51:25'),
(8267, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-11-23 13:51:38'),
(8268, 1, 'Downloaded leave.pdf', '2025-11-23 13:51:51'),
(8269, 1, 'Downloaded leave.pdf', '2025-11-23 13:55:23'),
(8270, 1, 'Downloaded leave.pdf', '2025-11-23 13:56:02'),
(8271, 1, 'Downloaded leave.pdf', '2025-11-23 14:01:08'),
(8272, 1, 'Uploaded 1 files', '2025-11-23 14:12:37'),
(8273, 1, 'Downloaded resignation.pdf', '2025-11-23 14:12:42'),
(8274, 1, 'Downloaded resignation.pdf', '2025-11-23 14:16:03'),
(8275, 1, 'Downloaded resignation.pdf', '2025-11-23 14:16:25'),
(8276, 1, 'Downloaded resignation.pdf', '2025-11-23 14:17:09'),
(8277, 1, 'User logged in', '2025-11-24 02:09:30'),
(8278, 1, 'Uploaded 1 files', '2025-11-24 02:10:01'),
(8279, 1, 'Uploaded 1 files', '2025-11-24 02:12:43'),
(8280, 1, 'Uploaded 1 files', '2025-11-24 02:13:21'),
(8281, 1, 'Uploaded 1 files', '2025-11-24 02:15:32'),
(8282, 1, 'Uploaded 1 files', '2025-11-24 02:16:07'),
(8283, 1, 'Uploaded 1 files', '2025-11-24 02:17:25'),
(8284, 1, 'User logged in', '2025-11-24 02:24:26'),
(8285, 1, 'User logged in', '2025-11-24 02:26:08'),
(8286, 1, 'Uploaded 1 files', '2025-11-24 02:26:40'),
(8287, 1, 'User logged in', '2025-11-24 02:30:32'),
(8288, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-11-24 02:30:46'),
(8289, 1, 'User logged in', '2025-11-24 02:46:18'),
(8290, 1, 'Uploaded 1 files', '2025-11-24 02:47:03'),
(8291, 1, 'Uploaded 1 files', '2025-11-24 02:56:38'),
(8292, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-24 02:57:01'),
(8293, 1, 'User logged in', '2025-11-24 03:02:04'),
(8294, 1, 'Uploaded 1 files', '2025-11-24 03:04:02'),
(8295, 1, 'Uploaded 1 files', '2025-11-24 03:05:08'),
(8296, 1, 'Uploaded 1 files', '2025-11-24 03:06:12'),
(8297, 1, 'Uploaded 1 files', '2025-11-24 03:07:22'),
(8298, 1, 'Uploaded 1 files', '2025-11-24 03:08:57'),
(8299, 1, 'User logged in', '2025-11-24 03:13:56'),
(8300, 1, 'Uploaded 1 files', '2025-11-24 03:14:17'),
(8301, 1, 'User logged in', '2025-11-24 03:17:55'),
(8302, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-11-24 03:19:12'),
(8303, 1, 'User logged in', '2025-11-24 03:37:49'),
(8304, 1, 'Uploaded 1 files', '2025-11-24 03:38:18'),
(8305, 1, 'Uploaded 1 files', '2025-11-24 03:51:27'),
(8306, 1, 'Uploaded 1 files', '2025-11-24 03:53:25'),
(8307, 1, 'Uploaded 1 files', '2025-11-24 04:00:09'),
(8308, 1, 'Downloaded leave.docx', '2025-11-24 04:10:59'),
(8309, 1, 'User logged in', '2025-11-24 06:09:15'),
(8310, 1, 'Uploaded 1 files', '2025-11-24 06:11:35'),
(8311, 1, 'Uploaded 1 files', '2025-11-24 06:18:02'),
(8312, 1, 'Uploaded 1 files', '2025-11-24 06:21:35'),
(8313, 1, 'Uploaded 1 files', '2025-11-24 06:27:01'),
(8314, 1, 'User logged in', '2025-11-24 06:30:36'),
(8315, 1, 'User logged in', '2025-11-24 06:36:57'),
(8316, 1, 'User logged in', '2025-11-24 06:38:14'),
(8317, 1, 'User logged in', '2025-11-24 06:40:01'),
(8318, 1, 'User logged in', '2025-11-24 06:49:11'),
(8319, 1, 'User logged in', '2025-11-24 06:53:54'),
(8320, 1, 'User logged in', '2025-11-24 07:09:03'),
(8321, 1, 'User logged in', '2025-11-24 07:16:00'),
(8322, 1, 'Downloaded DTR_Format_Sample.xlsx', '2025-11-24 07:20:30'),
(8323, 1, 'User logged in', '2025-11-24 07:46:38'),
(8324, 1, 'Uploaded 1 files', '2025-11-24 07:49:27'),
(8325, 1, 'User logged in', '2025-11-26 14:04:54'),
(8326, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-26 19:28:24'),
(8327, 1, 'Updated workspaces for \"leave.docx\"', '2025-11-26 19:28:37'),
(8328, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-11-26 19:29:29'),
(8329, 1, 'Downloaded HRM (1).pptx', '2025-11-26 19:40:00'),
(8330, 1, 'Downloaded liv.pdf', '2025-11-26 19:42:07'),
(8331, 1, 'Renamed file from \"leave (3).pdf\" to \"liv\"', '2025-11-26 19:43:28'),
(8332, 1, 'Renamed file from \"leave (3).pdf\" to \"liv\"', '2025-11-26 19:43:29'),
(8333, 1, 'Renamed file from \"HRM (1).pptx\" to \"dms\"', '2025-11-26 20:05:55'),
(8334, 1, 'Renamed file from \"HRM (1).pptx\" to \"dms\"', '2025-11-26 20:05:56'),
(8335, 1, 'Renamed file from \"dms\" to \"hgcdhscd\"', '2025-11-26 20:06:06'),
(8336, 1, 'Renamed file from \"dms\" to \"hgcdhscd\"', '2025-11-26 20:06:06'),
(8337, 1, 'Renamed file from \"hgcdhscd\" to \"ffgd\"', '2025-11-26 20:11:41'),
(8338, 1, 'Renamed file from \"hgcdhscd\" to \"ffgd\"', '2025-11-26 20:11:41'),
(8339, 1, 'Permanently deleted leave.pdf', '2025-11-26 20:11:59'),
(8340, 1, 'Permanently deleted HRM.pptx', '2025-11-26 20:12:04'),
(8341, 1, 'Renamed file from \"leave (2).pdf\" to \"dfcdsc.pdf\"', '2025-11-26 20:13:27'),
(8342, 1, 'Renamed file from \"leave (2).pdf\" to \"dfcdsc.pdf\"', '2025-11-26 20:13:28'),
(8343, 1, 'Deleted user: Lyrika', '2025-11-26 20:31:27'),
(8344, 1, 'Renamed file from \"HRM.pptx\" to \"haha.pptx\"', '2025-11-26 21:02:14'),
(8345, 1, 'Renamed file from \"HRM.pptx\" to \"haha.pptx\"', '2025-11-26 21:02:15'),
(8346, 1, 'Renamed file from \"haha.pptx\" to \"hhjgsd.pptx\"', '2025-11-26 21:02:22'),
(8347, 1, 'Renamed file from \"haha.pptx\" to \"hhjgsd.pptx\"', '2025-11-26 21:02:22'),
(8348, 1, 'Downloaded hgdshsh.pptx', '2025-11-26 21:02:32'),
(8349, 1, 'Restored file ID: 1098', '2025-11-26 21:05:35'),
(8350, 1, 'Restored file ID: 1102', '2025-11-26 21:05:37'),
(8351, 1, 'Restored file ID: 1103', '2025-11-26 21:05:40'),
(8352, 1, 'Restored file ID: 1104', '2025-11-26 21:05:43'),
(8353, 1, 'Restored file ID: 1105', '2025-11-26 21:05:45'),
(8354, 1, 'Updated user: Raiza Roces', '2025-11-26 21:40:29'),
(8355, 1, 'Updated user: Raiza Roces', '2025-11-26 21:40:51'),
(8356, 1, 'Restored file ID: 1098', '2025-11-26 21:45:07'),
(8357, 1, 'Downloaded leave (2).pdf', '2025-11-26 21:45:20'),
(8358, 1, 'Updated user: Full name', '2025-11-26 21:54:49'),
(8359, 1, 'Added user: sample name', '2025-11-26 22:01:34'),
(8360, 1, 'Updated user: Full name', '2025-11-26 22:23:54'),
(8361, 1, 'Uploaded 1 files', '2025-11-26 22:59:23'),
(8362, 1, 'User logged in', '2025-11-27 00:18:45'),
(8363, 1, 'User logged in', '2025-11-27 00:28:20'),
(8364, 1, 'User logged in', '2025-11-27 00:37:30'),
(8365, 1, 'User logged in', '2025-11-27 00:45:59'),
(8366, 1, 'User logged in', '2025-11-27 01:27:02'),
(8367, 1, 'Uploaded 1 files to 2 workspace(s)', '2025-11-27 01:29:14'),
(8368, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-27 01:29:49'),
(8369, 1, 'Unshared leave (3).pdf', '2025-11-27 02:08:09'),
(8370, 1, 'Uploaded 1 files to 2 workspace(s)', '2025-11-27 02:08:51'),
(8371, 1, 'Archived user: sample name', '2025-11-27 02:10:48'),
(8372, 1, 'Restored file ID: 1108', '2025-11-27 02:11:22'),
(8373, 1, 'Restored user: sample name', '2025-11-27 02:20:20'),
(8374, 1, 'Added department: Nursing', '2025-11-27 02:39:15'),
(8375, 1, 'Updated department: Finance', '2025-11-27 04:09:38'),
(8376, 1, 'Updated department: HR', '2025-11-27 04:09:48'),
(8377, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-11-27 04:24:29'),
(8378, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-11-27 04:24:35'),
(8379, 1, 'User logged in', '2025-11-27 04:35:19'),
(8380, 1, 'User logged in', '2025-11-27 04:36:28'),
(8381, 1, 'User logged in', '2025-11-27 04:49:09'),
(8382, 1, 'User logged in', '2025-11-27 05:21:50'),
(8383, 3, 'User logged in', '2025-11-27 06:21:36'),
(8384, 1, 'User logged in', '2025-11-27 09:04:20'),
(8385, 1, 'User logged in', '2025-11-27 09:19:57'),
(8386, 1, 'User logged in', '2025-11-27 09:23:24'),
(8387, 1, 'User logged in', '2025-11-27 11:11:46'),
(8388, 1, 'User logged in', '2025-11-27 12:35:23'),
(8389, 1, 'Downloaded resignation.pdf', '2025-11-27 12:37:55'),
(8390, 1, 'Archived user: sample name', '2025-11-27 12:52:28'),
(8391, 1, 'Restored user: sample name', '2025-11-27 12:52:36'),
(8392, 1, 'Uploaded 1 files', '2025-11-27 13:09:36'),
(8393, 1, 'Uploaded 1 files', '2025-11-27 13:17:47'),
(8394, 1, 'Added user: Lyrika Jewel Hermoso', '2025-11-27 13:36:08'),
(8395, 1, 'Updated user: Lyrika Jewel Hermoso', '2025-11-27 13:36:27'),
(8396, 1, 'Updated user: Raiza Roces', '2025-11-27 13:36:43'),
(8397, 1, 'Archived user: Full name', '2025-11-27 13:36:54'),
(8398, 7, 'User logged in', '2025-11-27 13:40:25'),
(8399, 7, 'Uploaded 1 files', '2025-11-27 13:44:17'),
(8400, 5, 'User logged in', '2025-11-27 13:59:49'),
(8401, 5, 'Uploaded 1 files', '2025-11-27 14:18:20'),
(8402, 5, 'Renamed file from \"resignation.pdf\" to \"resign.pdf\"', '2025-11-27 14:53:11'),
(8403, 5, 'Uploaded 1 files', '2025-11-27 14:53:37'),
(8404, 5, 'Uploaded 1 files', '2025-11-27 15:00:49'),
(8405, 5, 'Uploaded 1 files', '2025-11-27 15:01:32'),
(8406, 5, 'Downloaded dfgh.xlsx', '2025-11-27 15:03:17'),
(8407, 5, 'Uploaded 1 files', '2025-11-27 15:07:01'),
(8408, 5, 'Uploaded 1 files', '2025-11-27 15:36:39'),
(8409, 5, 'Renamed file from \"leave.pdf\" to \"hsdhgsa.pdf\"', '2025-11-27 15:36:54'),
(8410, 5, 'Renamed file from \"leave.pdf\" to \"hsdhgsa.pdf\"', '2025-11-27 15:36:55'),
(8411, 7, 'User logged in', '2025-11-27 15:39:47'),
(8412, 7, 'Restored user: Full name', '2025-11-27 15:42:25'),
(8413, 3, 'User logged in', '2025-11-27 15:43:55'),
(8414, 5, 'User logged in', '2025-11-27 15:55:11'),
(8415, 7, 'User logged in', '2025-11-27 15:57:48'),
(8416, 7, 'Downloaded resignation.docx', '2025-11-27 15:58:56'),
(8417, 7, 'Renamed file from \"resign.pdf\" to \"rresign.pdf\"', '2025-11-27 16:00:09'),
(8418, 7, 'Renamed file from \"resign.pdf\" to \"rresign.pdf\"', '2025-11-27 16:00:10'),
(8419, 3, 'User logged in', '2025-11-27 16:00:50'),
(8420, 1, 'User logged in', '2025-11-28 08:19:52'),
(8421, 1, 'Uploaded 1 files', '2025-11-28 08:21:36'),
(8422, 1, 'Downloaded leave.pdf', '2025-11-28 08:21:42'),
(8423, 1, 'Uploaded 1 files', '2025-11-28 08:22:05'),
(8424, 2, 'User logged in', '2025-11-28 12:35:39'),
(8425, 2, 'User logged in', '2025-11-28 12:35:40'),
(8426, 2, 'Deleted workspace: BSIT', '2025-11-28 12:36:53'),
(8427, 2, 'Deleted workspace: BSIT', '2025-11-28 12:37:00'),
(8428, 2, 'Deleted workspace: BSIT', '2025-11-28 12:37:19'),
(8429, 1, 'User logged in', '2025-11-28 12:38:25'),
(8430, 1, 'Added user: jenny', '2025-11-28 12:39:34'),
(8431, 8, 'User logged in', '2025-11-28 12:40:06'),
(8432, 1, 'User logged in', '2025-11-28 12:41:24'),
(8433, 1, 'User logged in', '2025-11-28 12:41:24'),
(8434, 1, 'Permanently deleted leave.pdf', '2025-11-28 12:47:49'),
(8435, 1, 'Uploaded 1 file(s)', '2025-11-28 13:02:15'),
(8436, 1, 'Uploaded 1 file(s)', '2025-11-28 13:06:21'),
(8437, 1, 'User logged in', '2025-11-28 13:16:18'),
(8438, 1, 'Restored file ID: 1124', '2025-11-28 13:16:51'),
(8439, 1, 'User logged in', '2025-11-28 13:22:01'),
(8440, 1, 'Uploaded 1 file(s)', '2025-11-28 13:25:55'),
(8441, 1, 'Uploaded 1 file(s)', '2025-11-28 13:30:06'),
(8442, 1, 'Uploaded 1 file(s)', '2025-11-28 13:31:17'),
(8443, 1, 'Uploaded 1 file(s)', '2025-11-28 13:34:47'),
(8444, 1, 'Uploaded 1 file(s)', '2025-11-28 13:38:43'),
(8445, 1, 'Restored file ID: 4', '2025-11-28 13:38:58'),
(8446, 1, 'Uploaded 1 file(s)', '2025-11-28 13:46:46'),
(8447, 1, 'Permanently deleted file: resignation.docx', '2025-11-28 13:46:52'),
(8448, 1, 'Uploaded 1 file(s)', '2025-11-28 13:58:16'),
(8449, 1, 'Permanently deleted file: resignation.docx', '2025-11-28 13:58:34'),
(8450, 1, 'User logged in', '2025-11-28 14:14:05'),
(8451, 1, 'User logged in', '2025-11-28 14:15:39'),
(8452, 1, 'User logged in', '2025-11-29 02:00:52'),
(8453, 1, 'Updated system settings', '2025-11-29 02:01:08'),
(8454, 1, 'Updated system settings', '2025-11-29 02:01:18'),
(8455, 1, 'Uploaded 1 files', '2025-11-29 02:03:57'),
(8456, 1, 'Renamed file from \"resignation.docx\" to \"hello.docx\"', '2025-11-29 02:04:19'),
(8457, 1, 'Renamed file from \"resignation.docx\" to \"hello.docx\"', '2025-11-29 02:04:19'),
(8458, 1, 'Permanently deleted resignation.docx', '2025-11-29 02:05:09'),
(8459, 1, 'User logged in', '2025-11-29 02:10:43'),
(8460, 1, 'Uploaded 1 files', '2025-11-29 02:10:57'),
(8461, 1, 'Permanently deleted file: resignation.docx', '2025-11-29 02:11:11'),
(8462, 1, 'Uploaded 1 files', '2025-11-29 02:15:01'),
(8463, 1, 'Uploaded 1 files', '2025-11-29 02:15:44'),
(8464, 1, 'Permanently deleted file: DTR_Format_Sample.xlsx', '2025-11-29 02:16:05'),
(8465, 1, 'User logged in', '2025-11-29 02:21:37'),
(8466, 1, 'Downloaded resignation.docx', '2025-11-29 02:21:56'),
(8467, 1, 'Downloaded leave.pdf', '2025-11-29 02:22:02'),
(8468, 1, 'Permanently deleted file: resignation.docx', '2025-11-29 02:22:41'),
(8469, 1, 'Permanently deleted file: leave.pdf', '2025-11-29 02:22:42'),
(8470, 1, 'Uploaded 3 files', '2025-11-29 02:23:25'),
(8471, 1, 'Updated system settings', '2025-11-29 02:39:54'),
(8472, 1, 'Updated system settings', '2025-11-29 02:40:01'),
(8473, 1, 'Uploaded 1 files', '2025-11-29 02:49:28'),
(8474, 1, 'Permanently deleted file: Resume.pdf', '2025-11-29 04:14:48'),
(8475, 7, 'User logged in', '2025-11-29 06:21:59'),
(8476, 5, 'User logged in', '2025-11-29 06:22:28'),
(8477, 1, 'User logged in', '2025-11-29 06:23:24'),
(8478, 1, 'Updated workspace: BSIT', '2025-11-29 06:23:49'),
(8479, 5, 'User logged in', '2025-11-29 06:24:16'),
(8480, 1, 'User logged in', '2025-11-29 06:24:41'),
(8481, 7, 'User logged in', '2025-11-30 06:31:22'),
(8482, 8, 'User logged in', '2025-11-30 06:31:44'),
(8483, 1, 'User logged in', '2025-11-30 06:32:07'),
(8484, 1, 'Uploaded 1 files', '2025-11-30 06:34:00'),
(8485, 1, 'Renamed file from \"leave.docx\" to \"leaveko.docx\"', '2025-11-30 06:34:12'),
(8486, 1, 'Renamed file from \"leave.docx\" to \"leaveko.docx\"', '2025-11-30 06:34:12'),
(8487, 1, 'Renamed file from \"leaveko.docx\" to \"leaveh.docx\"', '2025-11-30 06:34:31'),
(8488, 1, 'Renamed file from \"leaveh.docx\" to \"leav.docx\"', '2025-11-30 06:43:55'),
(8489, 1, 'Renamed file from \"leav.docx\" to \"leave.docx\"', '2025-11-30 06:44:00'),
(8490, 1, 'Renamed file from \"leav.docx\" to \"leave.docx\"', '2025-11-30 06:44:00'),
(8491, 1, 'Permanently deleted file: leave.docx', '2025-11-30 06:46:33'),
(8492, 1, 'Permanently deleted file: Resume.pdf', '2025-11-30 06:46:33'),
(8493, 1, 'Permanently deleted file: Leave-Request.pdf', '2025-11-30 06:46:34'),
(8494, 1, 'Permanently deleted file: Resignation-Letter.docx', '2025-11-30 06:46:34'),
(8495, 1, 'Uploaded 1 files', '2025-11-30 06:46:58'),
(8496, 1, 'Renamed file from \"leave.pdf\" to \"leaveko.pdf\"', '2025-11-30 06:47:19'),
(8497, 1, 'Renamed file from \"leave.pdf\" to \"leaveko.pdf\"', '2025-11-30 06:47:19'),
(8498, 1, 'Renamed file from \"leaveko.pdf\" to \"hello.pdf\"', '2025-11-30 06:47:30'),
(8499, 1, 'Renamed file from \"hello.pdf\" to \"helloe.pdf\"', '2025-11-30 06:52:08'),
(8500, 1, 'Renamed file from \"hello.pdf\" to \"helloe.pdf\"', '2025-11-30 06:52:08'),
(8501, 1, 'Renamed file from \"helloe.pdf\" to \".pdf.pdf\"', '2025-11-30 06:52:29'),
(8502, 1, 'Renamed file from \"everyday.pdf\" to \"wego.pdf\"', '2025-11-30 07:01:04'),
(8503, 1, 'Renamed file from \"everyday.pdf\" to \"wego.pdf\"', '2025-11-30 07:01:05'),
(8504, 1, 'Renamed file from \"wego.pdf\" to \"everydayisnice.pdf\"', '2025-11-30 07:01:13'),
(8505, 1, 'Renamed file from \"wego.pdf\" to \"everydayisnice.pdf\"', '2025-11-30 07:01:13'),
(8506, 7, 'User logged in', '2025-11-30 07:04:52'),
(8507, 8, 'User logged in', '2025-11-30 07:07:45'),
(8508, 7, 'User logged in', '2025-11-30 07:08:17'),
(8509, 1, 'User logged in', '2025-11-30 07:09:51'),
(8510, 1, 'Deleted department: Nursing', '2025-11-30 07:11:40'),
(8511, 1, 'Updated department: Finance', '2025-11-30 07:18:28'),
(8512, 1, 'Updated department: IT', '2025-11-30 07:21:53'),
(8513, 1, 'Updated department: IT', '2025-11-30 07:27:45'),
(8514, 1, 'Deleted department: IT', '2025-11-30 07:29:24'),
(8515, 1, 'Deleted department: IT', '2025-11-30 07:30:22'),
(8516, 1, 'Deleted department: Finance', '2025-11-30 07:30:44'),
(8517, 1, 'Updated department: IT', '2025-11-30 07:31:03'),
(8518, 1, 'Updated department: IT', '2025-11-30 07:31:08'),
(8519, 1, 'Deleted department: HR', '2025-11-30 07:31:35'),
(8520, 1, 'Deleted department: IT', '2025-11-30 07:35:04'),
(8521, 1, 'Updated department: Marketing', '2025-11-30 07:36:04'),
(8522, 1, 'Deleted department: HR', '2025-11-30 07:36:15'),
(8523, 8, 'User logged in', '2025-11-30 07:36:25'),
(8524, 1, 'User logged in', '2025-11-30 07:36:50'),
(8525, 1, 'Uploaded 1 files', '2025-11-30 07:38:51'),
(8526, 1, 'Uploaded 1 files', '2025-11-30 07:42:33'),
(8527, 1, 'Deleted category: Leave Request Form', '2025-11-30 07:43:09'),
(8528, 1, 'Uploaded 1 files', '2025-11-30 07:43:24'),
(8529, 1, 'Renamed file from \"Leave-Request.docx\" to \"leaveko.docx\"', '2025-11-30 07:43:38'),
(8530, 1, 'Renamed file from \"Leave-Request.docx\" to \"leaveko.docx\"', '2025-11-30 07:43:38'),
(8531, 1, 'Permanently deleted file: Resume.pdf', '2025-11-30 07:43:59'),
(8532, 1, 'Permanently deleted file: leave.pdf', '2025-11-30 07:43:59'),
(8533, 1, 'Updated category: Leave Request Form', '2025-11-30 07:48:35'),
(8534, 1, 'Updated category: Leave Request', '2025-11-30 07:48:39'),
(8535, 1, 'Archived user: Full name', '2025-11-30 07:49:09'),
(8536, 1, 'Archived user: sample name', '2025-11-30 07:49:28'),
(8537, 1, 'Restored user: sample name', '2025-11-30 07:50:49'),
(8538, 1, 'Restored user: Full name', '2025-11-30 07:50:57'),
(8539, 1, 'Updated user: Dummy Account', '2025-11-30 07:51:12'),
(8540, 1, 'Archived user: Dummy Account', '2025-11-30 07:56:56'),
(8541, 1, 'Updated user: Sample Staff', '2025-11-30 07:57:39'),
(8542, 1, 'Permanently deleted user ID: 4', '2025-11-30 07:57:58'),
(8543, 1, 'Added user: Katreeina Notarte', '2025-11-30 07:59:28'),
(8544, 1, 'Archived user: Katreeina Notarte', '2025-11-30 08:00:42'),
(8545, 1, 'Permanently deleted user ID: 9', '2025-11-30 08:00:48'),
(8546, 1, 'Added user: Jenny Dump', '2025-11-30 08:01:39'),
(8547, 8, 'User logged in', '2025-11-30 08:03:11'),
(8548, 1, 'User logged in', '2025-11-30 08:03:27'),
(8549, 1, 'Archived user: Jenny Dump', '2025-11-30 08:04:44'),
(8550, 1, 'Permanently deleted user ID: 9', '2025-11-30 08:04:50'),
(8551, 1, 'Added user: Jenny Dump', '2025-11-30 08:10:59'),
(8552, 1, 'Archived user: Jenny Dump', '2025-11-30 08:15:27'),
(8553, 1, 'Added user: Jenny Dump', '2025-11-30 08:16:14'),
(8554, 1, 'Archived user: Jenny Dump', '2025-11-30 08:18:26'),
(8555, 1, 'Added user: Jenny Dump', '2025-11-30 08:20:08'),
(8556, 1, 'Added user: Jenny Dump', '2025-11-30 08:22:06'),
(8558, 1, 'User logged in', '2025-11-30 08:23:17'),
(8559, 1, 'Archived user: Jenny Dump', '2025-11-30 08:23:45'),
(8560, 1, 'Added user: Katreeina Notarte', '2025-11-30 08:26:21'),
(8561, 1, 'Archived user: Katreeina Notarte', '2025-11-30 08:26:52'),
(8562, 1, 'Permanently deleted user ID: 9', '2025-11-30 08:26:57'),
(8563, 1, 'Updated workspace: BSIT', '2025-11-30 08:29:02'),
(8564, 8, 'User logged in', '2025-11-30 08:39:20'),
(8565, 8, 'User logged in', '2025-11-30 09:10:10'),
(8566, 8, 'User logged in', '2025-11-30 09:12:44'),
(8567, 7, 'User logged in', '2025-11-30 09:17:18'),
(8568, 1, 'User logged in', '2025-11-30 09:18:01'),
(8569, 8, 'User logged in', '2025-11-30 09:18:58'),
(8570, 1, 'User logged in', '2025-11-30 09:22:49'),
(8571, 1, 'Downloaded leaveko.docx', '2025-11-30 09:24:13'),
(8572, 1, 'Uploaded 1 files', '2025-11-30 09:24:31'),
(8573, 1, 'Downloaded Resume.pdf', '2025-11-30 09:24:35'),
(8574, 1, 'Uploaded 1 files', '2025-11-30 09:41:46'),
(8575, 1, 'Uploaded 1 files', '2025-11-30 09:44:35'),
(8576, 1, 'Permanently deleted file: Resume (2).pdf', '2025-11-30 09:49:06'),
(8577, 1, 'Permanently deleted file: Resume (1).pdf', '2025-11-30 09:49:06'),
(8578, 1, 'Permanently deleted file: Resume.pdf', '2025-11-30 09:49:07'),
(8579, 1, 'Deleted workspace: qwerty', '2025-11-30 09:58:46'),
(8580, 1, 'Created workspace: Dump', '2025-11-30 09:59:01'),
(8581, 1, 'Deleted workspace: qwerty', '2025-11-30 09:59:05'),
(8582, 1, 'Updated workspaces for \"leave.pdf\"', '2025-11-30 09:59:37'),
(8583, 1, 'Deleted workspace: qwerty', '2025-11-30 10:04:17'),
(8584, 1, 'Deleted workspace: qwerty', '2025-11-30 10:05:48'),
(8585, 1, 'Created workspace: delete', '2025-11-30 10:07:43'),
(8586, 1, 'Created workspace: delete', '2025-11-30 10:10:02'),
(8587, 1, 'Deleted workspace: delete', '2025-11-30 10:10:05'),
(8588, 1, 'Updated workspace: Dump test', '2025-11-30 10:13:54'),
(8589, 1, 'Updated workspace: BSIT', '2025-11-30 10:16:18'),
(8590, 8, 'User logged in', '2025-11-30 10:16:25'),
(8591, 1, 'User logged in', '2025-11-30 10:17:00'),
(8592, 1, 'Deleted workspace: Dump test', '2025-11-30 10:17:13'),
(8593, 1, 'Created workspace: dump', '2025-11-30 10:17:57'),
(8594, 1, 'Updated workspace: BSIT', '2025-11-30 10:18:07'),
(8595, 1, 'Updated workspace: BSIT', '2025-11-30 10:18:16'),
(8596, 8, 'User logged in', '2025-11-30 10:18:42'),
(8597, 7, 'User logged in', '2025-11-30 10:19:38'),
(8598, 1, 'User logged in', '2025-11-30 10:20:02'),
(8599, 1, 'Updated workspace: BSIT', '2025-11-30 10:20:28'),
(8600, 7, 'User logged in', '2025-11-30 10:20:41'),
(8601, 7, 'User logged in', '2025-11-30 10:20:41'),
(8602, 1, 'User logged in', '2025-11-30 10:30:31'),
(8603, 1, 'Uploaded 1 files', '2025-11-30 10:31:31'),
(8604, 1, 'Updated workspaces for \"resignation.pdf\"', '2025-11-30 10:31:43'),
(8605, 1, 'Downloaded leave.pdf', '2025-11-30 10:35:42'),
(8606, 8, 'User logged in', '2025-11-30 10:41:12'),
(8607, 7, 'User logged in', '2025-11-30 10:41:28'),
(8608, 1, 'User logged in', '2025-11-30 10:41:57'),
(8609, 8, 'User logged in', '2025-11-30 10:59:33'),
(8610, 7, 'User logged in', '2025-11-30 11:02:47'),
(8611, 7, 'Downloaded leave.pdf', '2025-11-30 11:13:14'),
(8612, 8, 'User logged in', '2025-11-30 11:13:23'),
(8613, 8, 'Downloaded leave.pdf', '2025-11-30 11:13:31'),
(8614, 1, 'User logged in', '2025-11-30 11:16:07'),
(8615, 8, 'User logged in', '2025-11-30 11:18:19'),
(8616, 7, 'User logged in', '2025-11-30 11:18:44'),
(8617, 7, 'Uploaded 1 files', '2025-11-30 11:20:42'),
(8618, 7, 'Updated workspaces for \"Performance-Review-Letter.pdf\"', '2025-11-30 11:20:53'),
(8619, 8, 'User logged in', '2025-11-30 11:21:19'),
(8620, 8, 'Downloaded Performance-Review-Letter.pdf', '2025-11-30 11:21:28'),
(8621, 8, 'User logged in', '2025-11-30 11:24:23'),
(8622, 8, 'Downloaded Performance-Review-Letter.pdf', '2025-11-30 11:31:55'),
(8623, 8, 'Uploaded 1 files', '2025-11-30 11:32:28'),
(8624, 8, 'Renamed file from \"invoice-sample.pdf\" to \"bruh.pdf\"', '2025-11-30 11:32:34'),
(8625, 8, 'Renamed file from \"invoice-sample.pdf\" to \"bruh.pdf\"', '2025-11-30 11:32:34'),
(8626, 8, 'Updated workspaces for \"bruh.pdf\"', '2025-11-30 11:32:40'),
(8627, 8, 'Renamed file from \"bruh.pdf\" to \"everyday.pdf\"', '2025-11-30 11:32:52'),
(8628, 8, 'Renamed file from \"bruh.pdf\" to \"everyday.pdf\"', '2025-11-30 11:32:52'),
(8629, 1, 'User logged in', '2025-11-30 11:33:53'),
(8630, 8, 'User logged in', '2025-11-30 11:38:08'),
(8631, 1, 'User logged in', '2025-12-03 00:11:14'),
(8632, 1, 'Renamed file from \"leave.pdf\" to \"dontleave.pdf\"', '2025-12-03 00:11:23'),
(8633, 1, 'Renamed file from \"leave.pdf\" to \"dontleave.pdf\"', '2025-12-03 00:11:23'),
(8634, 1, 'Deleted department: Sales', '2025-12-03 00:11:46'),
(8635, 1, 'Added department: dump', '2025-12-03 00:11:56'),
(8636, 1, 'Updated department: dump', '2025-12-03 00:12:06'),
(8637, 1, 'Updated department: dump', '2025-12-03 00:12:12'),
(8638, 1, 'Deleted department: dump', '2025-12-03 00:15:03'),
(8639, 1, 'Added department: BSIT', '2025-12-03 00:15:18'),
(8640, 1, 'Permanently deleted file: invoice-sample.pdf', '2025-12-03 00:15:58'),
(8641, 1, 'Permanently deleted file: Performance-Review-Letter.pdf', '2025-12-03 00:15:58'),
(8642, 1, 'Uploaded 1 files', '2025-12-03 00:17:33'),
(8643, 1, 'Permanently deleted file: invoice-sample.pdf', '2025-12-03 00:18:21'),
(8644, 1, 'Uploaded 1 files', '2025-12-03 00:20:10'),
(8645, 1, 'Permanently deleted file: invoice-sample.pdf', '2025-12-03 00:22:35'),
(8646, 1, 'Permanently deleted file: resignation.pdf', '2025-12-03 00:22:36'),
(8647, 1, 'Permanently deleted file: leave.pdf', '2025-12-03 00:22:36'),
(8648, 1, 'Permanently deleted file: Leave-Request.docx', '2025-12-03 00:22:36'),
(8649, 1, 'Uploaded 3 files', '2025-12-03 00:22:56'),
(8650, 1, 'Permanently deleted file: invoice-sample.pdf', '2025-12-03 00:24:00'),
(8651, 1, 'Permanently deleted file: leave.docx', '2025-12-03 00:24:00'),
(8652, 1, 'Permanently deleted file: resignation.pdf', '2025-12-03 00:24:00'),
(8653, 1, 'Uploaded 3 files', '2025-12-03 00:24:27'),
(8654, 1, 'Permanently deleted file: invoice-sample.pdf', '2025-12-03 00:26:35'),
(8655, 1, 'Permanently deleted file: leave.docx', '2025-12-03 00:26:36'),
(8656, 1, 'Permanently deleted file: resignation.pdf', '2025-12-03 00:26:36'),
(8657, 1, 'Uploaded 3 files', '2025-12-03 00:28:27'),
(8658, 1, 'Uploaded 2 files', '2025-12-03 00:29:08'),
(8659, 1, 'Uploaded 1 files', '2025-12-03 00:29:38'),
(8660, 1, 'Uploaded 2 files', '2025-12-03 00:31:22'),
(8661, 1, 'Uploaded 2 files', '2025-12-03 00:32:42'),
(8662, 1, 'Permanently deleted file: Leave-Request (1).docx', '2025-12-03 00:33:10'),
(8663, 1, 'Permanently deleted file: Leave-Request.pdf', '2025-12-03 00:33:11'),
(8664, 1, 'Permanently deleted file: Leave-Request.docx', '2025-12-03 00:33:11'),
(8665, 1, 'Permanently deleted file: leave (1).docx', '2025-12-03 00:33:11'),
(8666, 1, 'Permanently deleted file: Resignation-Letter.docx', '2025-12-03 00:33:12'),
(8667, 1, 'Permanently deleted file: leave.pdf', '2025-12-03 00:33:12'),
(8668, 1, 'Permanently deleted file: Performance-Review-Letter.docx', '2025-12-03 00:33:13'),
(8669, 1, 'Permanently deleted file: invoice-sample.pdf', '2025-12-03 00:33:13'),
(8670, 1, 'Permanently deleted file: leave.docx', '2025-12-03 00:33:13'),
(8671, 1, 'Permanently deleted file: resignation.pdf', '2025-12-03 00:33:14'),
(8672, 1, 'Uploaded 4 files', '2025-12-03 00:35:57'),
(8673, 1, 'Uploaded 5 files', '2025-12-03 00:36:50'),
(8674, 1, 'Permanently deleted file: resignation.docx', '2025-12-03 00:38:18'),
(8675, 1, 'Permanently deleted file: Resume.pdf', '2025-12-03 00:38:18'),
(8676, 1, 'Permanently deleted file: invoice-sample.pdf', '2025-12-03 00:38:19'),
(8677, 1, 'Permanently deleted file: Offer-Letter.pdf', '2025-12-03 00:38:19'),
(8678, 1, 'Permanently deleted file: Performance-Review-Letter.docx', '2025-12-03 00:38:19'),
(8679, 1, 'Permanently deleted file: Leave-Request.docx', '2025-12-03 00:38:20'),
(8680, 1, 'Permanently deleted file: Leave-Request.pdf', '2025-12-03 00:38:20'),
(8681, 1, 'Permanently deleted file: leave.docx', '2025-12-03 00:38:20'),
(8682, 1, 'Permanently deleted file: leave.pdf', '2025-12-03 00:38:21'),
(8683, 1, 'Uploaded 3 files', '2025-12-03 00:38:51'),
(8684, 1, 'Updated system settings', '2025-12-04 11:55:14'),
(8685, 1, 'Updated system settings', '2025-12-04 11:55:23'),
(8686, 1, 'User logged in', '2025-12-04 12:27:10'),
(8687, 1, 'Updated system settings', '2025-12-04 12:27:16'),
(8688, 1, 'Updated system settings', '2025-12-04 12:27:41'),
(8689, 1, 'Updated system settings', '2025-12-04 12:29:34'),
(8690, 1, 'Updated system settings', '2025-12-04 12:31:48'),
(8691, 1, 'User logged in', '2025-12-04 12:37:13'),
(8692, 1, 'Updated system settings', '2025-12-04 12:37:21'),
(8693, 1, 'Updated system settings', '2025-12-04 12:37:56'),
(8694, 1, 'Updated system settings', '2025-12-04 12:38:20'),
(8695, 1, 'Updated system settings', '2025-12-04 12:43:00'),
(8696, 1, 'Updated system settings', '2025-12-04 12:43:22'),
(8697, 1, 'User logged in', '2025-12-04 12:47:08'),
(8698, 1, 'Updated system settings', '2025-12-04 12:47:16'),
(8699, 1, 'Updated system settings', '2025-12-04 12:47:23'),
(8700, 8, 'User logged in', '2025-12-04 12:48:17'),
(8701, 7, 'User logged in', '2025-12-04 13:02:36'),
(8702, 1, 'User logged in', '2025-12-04 13:03:06'),
(8703, 1, 'Uploaded 1 files', '2025-12-04 13:03:54'),
(8704, 1, 'Uploaded 1 files to 1 workspace(s)', '2025-12-04 13:11:39'),
(8705, 1, 'Uploaded 1 files', '2025-12-04 13:17:27'),
(8706, 1, 'User logged in', '2025-12-04 13:24:06'),
(8707, 1, 'Deleted department: BSIT', '2025-12-04 13:24:35'),
(8708, 1, 'Added department: BSIT', '2025-12-04 13:24:50'),
(8709, 7, 'User logged in', '2025-12-04 13:34:09'),
(8710, 1, 'User logged in', '2025-12-04 13:37:04'),
(8711, 1, 'Updated department: BSIT', '2025-12-04 13:39:01'),
(8712, 1, 'Updated department: BSIT', '2025-12-04 13:39:10'),
(8713, 7, 'User logged in', '2025-12-04 13:39:40'),
(8714, 1, 'User logged in', '2025-12-04 13:47:45'),
(8715, 1, 'Updated department: BSIT', '2025-12-04 13:48:11'),
(8716, 7, 'User logged in', '2025-12-04 13:48:18'),
(8717, 1, 'User logged in', '2025-12-04 13:49:12'),
(8718, 8, 'User logged in', '2025-12-04 13:49:29'),
(8719, 1, 'User logged in', '2025-12-04 13:50:31'),
(8720, 1, 'Uploaded 13 files to 1 workspace(s)', '2025-12-04 13:59:58'),
(8721, 1, 'Permanently deleted file: resignation.docx', '2025-12-04 14:00:34'),
(8722, 1, 'Permanently deleted file: resignation.pdf', '2025-12-04 14:00:34'),
(8723, 1, 'Permanently deleted file: Offer-Letter.pdf', '2025-12-04 14:00:34'),
(8724, 1, 'Permanently deleted file: Performance-Review-Letter.docx', '2025-12-04 14:00:35'),
(8725, 1, 'Permanently deleted file: Performance-Review-Letter.pdf', '2025-12-04 14:00:35'),
(8726, 1, 'Permanently deleted file: leave.pdf', '2025-12-04 14:00:36'),
(8727, 1, 'Permanently deleted file: Leave-Request.docx', '2025-12-04 14:00:36'),
(8728, 1, 'Permanently deleted file: Employee-Warning.pdf', '2025-12-04 14:00:36'),
(8729, 1, 'Permanently deleted file: invoice-sample.pdf', '2025-12-04 14:00:37'),
(8730, 1, 'Permanently deleted file: leave.docx', '2025-12-04 14:00:37'),
(8731, 1, 'Permanently deleted file: Disciplinary-Action-Letter (1).docx', '2025-12-04 14:00:37'),
(8732, 1, 'Permanently deleted file: Disciplinary-Action-Letter.pdf', '2025-12-04 14:00:38'),
(8733, 1, 'Permanently deleted file: DTR_Format_Sample.xlsx', '2025-12-04 14:00:38'),
(8734, 1, 'Permanently deleted file: resignation (1).pdf', '2025-12-04 14:00:38'),
(8735, 1, 'Permanently deleted file: Employee-Warning (1).pdf', '2025-12-04 14:00:39'),
(8736, 1, 'Permanently deleted file: leave (1).pdf', '2025-12-04 14:00:39'),
(8737, 1, 'Permanently deleted file: cat.png', '2025-12-04 14:00:39'),
(8738, 1, 'Permanently deleted file: Disciplinary-Action-Letter.docx', '2025-12-04 14:00:40'),
(8739, 1, 'Permanently deleted file: Alex_Resume.docx', '2025-12-04 14:00:40'),
(8740, 1, 'Deleted category: Leave Request Form', '2025-12-04 14:07:20'),
(8741, 1, 'Deleted category: Invoice', '2025-12-04 14:07:28'),
(8742, 1, 'Deleted department: Marketing', '2025-12-04 14:29:08'),
(8743, 1, 'Added department: Marketing', '2025-12-04 14:29:17'),
(8744, 1, 'User logged in', '2025-12-05 01:39:55');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `auto_created` tinyint(1) DEFAULT '0',
  `is_unclassified` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `created_at`, `auto_created`, `is_unclassified`) VALUES
(5001, 'Unclassified', 'Unknown file types', '2025-11-17 02:21:53', 1, 1),
(5005, 'Resume / CV', 'Auto-created category for Resume / CV', '2025-11-30 07:38:51', 1, 0),
(5006, 'Leave Request', 'Auto-created category for Leave Request Form', '2025-11-30 07:43:23', 1, 0),
(5008, 'Resignation Letter', 'Auto-created category for Resignation Letter', '2025-11-30 10:31:31', 1, 0),
(5009, 'Performance Review', 'Auto-created category for Performance Review', '2025-11-30 11:20:42', 1, 0),
(5011, 'Offer Letter / Employment Contract', 'Auto-created category for Offer Letter / Employment Contract', '2025-12-03 00:36:49', 1, 0),
(5012, 'Employee Warning / Disciplinary Action', 'Auto-created category for Employee Warning / Disciplinary Action', '2025-12-03 00:38:50', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `name`, `user_id`, `created_at`) VALUES
(4006, 'Unassigned', 8, '2025-11-30 07:27:41'),
(4007, 'BSIT', 1, '2025-12-04 13:24:49'),
(4008, 'Marketing', 1, '2025-12-04 14:29:16');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `file_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `original_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `size` bigint NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `document_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `classification_confidence` enum('Low','Medium','High') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `classification_error` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `text_sample` text COLLATE utf8mb4_general_ci,
  `shared` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('active','archived','deleted') COLLATE utf8mb4_general_ci DEFAULT 'active',
  `file_path` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `encryption_version` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_shares`
--

CREATE TABLE `file_shares` (
  `share_id` int NOT NULL,
  `file_id` int NOT NULL,
  `shared_with_user_id` int DEFAULT NULL,
  `shared_with_department_id` int DEFAULT NULL,
  `permission` enum('viewer','editor') COLLATE utf8mb4_general_ci DEFAULT 'viewer',
  `shared_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_workspaces`
--

CREATE TABLE `file_workspaces` (
  `file_workspace_id` int NOT NULL,
  `file_id` int NOT NULL,
  `workspace_id` int NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reset_codes`
--

CREATE TABLE `reset_codes` (
  `reset_codes_id` int NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `expires_at` timestamp NULL DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sessions_id` int NOT NULL,
  `user_id` int NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
(7028, 1, 'admin@example.com', '2025-11-21 22:01:03'),
(7029, 3, 'roces_raiza@plpasig.edu.ph', '2025-11-21 23:06:32'),
(7030, 1, 'admin@example.com', '2025-11-22 03:15:19'),
(7031, 3, 'roces_raiza@plpasig.edu.ph', '2025-11-22 03:56:52'),
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
(7069, 3, 'roces_raiza@plpasig.edu.ph', '2025-11-27 06:21:35'),
(7070, 1, 'admin@example.com', '2025-11-27 09:04:19'),
(7071, 1, 'admin@example.com', '2025-11-27 09:19:57'),
(7072, 1, 'admin@example.com', '2025-11-27 09:23:24'),
(7073, 1, 'admin@example.com', '2025-11-27 11:11:46'),
(7074, 1, 'admin@example.com', '2025-11-27 12:35:22'),
(7075, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-27 13:40:24'),
(7076, 5, 'vallejos_glaiza@plpasig.edu.ph', '2025-11-27 13:59:49'),
(7077, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-27 15:39:47'),
(7078, 3, 'roces_raiza@plpasig.edu.ph', '2025-11-27 15:43:55'),
(7079, 5, 'vallejos_glaiza@plpasig.edu.ph', '2025-11-27 15:55:10'),
(7080, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-27 15:57:48'),
(7081, 3, 'roces_raiza@plpasig.edu.ph', '2025-11-27 16:00:49'),
(7082, 1, 'admin@example.com', '2025-11-28 08:19:52'),
(7083, 2, 'jane@example.com', '2025-11-28 12:35:39'),
(7084, 2, 'jane@example.com', '2025-11-28 12:35:39'),
(7085, 1, 'admin@example.com', '2025-11-28 12:38:25'),
(7086, 8, 'jennypatanag@gmail.com', '2025-11-28 12:40:06'),
(7087, 1, 'admin@example.com', '2025-11-28 12:41:23'),
(7088, 1, 'admin@example.com', '2025-11-28 12:41:24'),
(7089, 1, 'admin@example.com', '2025-11-28 13:16:17'),
(7090, 1, 'admin@example.com', '2025-11-28 13:22:00'),
(7091, 1, 'admin@example.com', '2025-11-28 14:14:04'),
(7092, 1, 'admin@example.com', '2025-11-28 14:15:39'),
(7093, 1, 'admin@example.com', '2025-11-29 02:00:52'),
(7094, 1, 'admin@example.com', '2025-11-29 02:10:43'),
(7095, 1, 'admin@example.com', '2025-11-29 02:21:36'),
(7096, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-29 06:21:59'),
(7097, 5, 'vallejos_glaiza@plpasig.edu.ph', '2025-11-29 06:22:28'),
(7098, 1, 'admin@example.com', '2025-11-29 06:23:23'),
(7099, 5, 'vallejos_glaiza@plpasig.edu.ph', '2025-11-29 06:24:16'),
(7100, 1, 'admin@example.com', '2025-11-29 06:24:40'),
(7101, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-30 06:31:22'),
(7102, 8, 'jennypatanag@gmail.com', '2025-11-30 06:31:44'),
(7103, 1, 'admin@example.com', '2025-11-30 06:32:07'),
(7104, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-30 07:04:52'),
(7105, 8, 'jennypatanag@gmail.com', '2025-11-30 07:07:45'),
(7106, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-30 07:08:16'),
(7107, 1, 'admin@example.com', '2025-11-30 07:09:50'),
(7108, 8, 'jennypatanag@gmail.com', '2025-11-30 07:36:24'),
(7109, 1, 'admin@example.com', '2025-11-30 07:36:50'),
(7110, 8, 'jennypatanag@gmail.com', '2025-11-30 08:03:11'),
(7111, 1, 'admin@example.com', '2025-11-30 08:03:27'),
(7113, 1, 'admin@example.com', '2025-11-30 08:23:17'),
(7114, 8, 'jennypatanag@gmail.com', '2025-11-30 08:39:20'),
(7115, 8, 'jennypatanag@gmail.com', '2025-11-30 09:10:10'),
(7116, 8, 'jennypatanag@gmail.com', '2025-11-30 09:12:43'),
(7117, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-30 09:17:18'),
(7118, 1, 'admin@example.com', '2025-11-30 09:18:01'),
(7119, 8, 'jennypatanag@gmail.com', '2025-11-30 09:18:58'),
(7120, 1, 'admin@example.com', '2025-11-30 09:22:49'),
(7121, 8, 'jennypatanag@gmail.com', '2025-11-30 10:16:24'),
(7122, 1, 'admin@example.com', '2025-11-30 10:16:59'),
(7123, 8, 'jennypatanag@gmail.com', '2025-11-30 10:18:41'),
(7124, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-30 10:19:38'),
(7125, 1, 'admin@example.com', '2025-11-30 10:20:02'),
(7126, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-30 10:20:40'),
(7127, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-30 10:20:41'),
(7128, 1, 'admin@example.com', '2025-11-30 10:30:30'),
(7129, 8, 'jennypatanag@gmail.com', '2025-11-30 10:41:12'),
(7130, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-30 10:41:28'),
(7131, 1, 'admin@example.com', '2025-11-30 10:41:57'),
(7132, 8, 'jennypatanag@gmail.com', '2025-11-30 10:59:33'),
(7133, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-30 11:02:46'),
(7134, 8, 'jennypatanag@gmail.com', '2025-11-30 11:13:22'),
(7135, 1, 'admin@example.com', '2025-11-30 11:16:06'),
(7136, 8, 'jennypatanag@gmail.com', '2025-11-30 11:18:19'),
(7137, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-11-30 11:18:43'),
(7138, 8, 'jennypatanag@gmail.com', '2025-11-30 11:21:18'),
(7139, 8, 'jennypatanag@gmail.com', '2025-11-30 11:24:23'),
(7140, 1, 'admin@example.com', '2025-11-30 11:33:52'),
(7141, 8, 'jennypatanag@gmail.com', '2025-11-30 11:38:08'),
(7142, 1, 'admin@example.com', '2025-12-03 00:11:13'),
(7143, 1, 'admin@example.com', '2025-12-04 12:27:10'),
(7144, 1, 'admin@example.com', '2025-12-04 12:37:13'),
(7145, 1, 'admin@example.com', '2025-12-04 12:47:08'),
(7146, 8, 'jennypatanag@gmail.com', '2025-12-04 12:48:17'),
(7147, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-12-04 13:02:36'),
(7148, 1, 'admin@example.com', '2025-12-04 13:03:06'),
(7149, 1, 'admin@example.com', '2025-12-04 13:24:06'),
(7150, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-12-04 13:34:08'),
(7151, 1, 'admin@example.com', '2025-12-04 13:37:03'),
(7152, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-12-04 13:39:39'),
(7153, 1, 'admin@example.com', '2025-12-04 13:47:45'),
(7154, 7, 'hermoso_lyrikajewel@plpasig.edu.ph', '2025-12-04 13:48:18'),
(7155, 1, 'admin@example.com', '2025-12-04 13:49:11'),
(7156, 8, 'jennypatanag@gmail.com', '2025-12-04 13:49:29'),
(7157, 1, 'admin@example.com', '2025-12-04 13:50:30'),
(7158, 1, 'admin@example.com', '2025-12-05 01:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int NOT NULL,
  `company` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `company_logo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `max_file_mb` int DEFAULT '50',
  `allowed_types` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `company`, `company_logo`, `max_file_mb`, `allowed_types`) VALUES
(6001, 'IVOS', 'gAAAAABpMYHjvdJHdk0RYU0JdoE-4Y56vzscubPr84myldzY2QcQj2zjuqshBuvbflr-4Sv8NNocqCQFh0FqxXC5CULGZtEtH4xfO0JzeVf4LOsiz0NWtmV4cWl8P1HaD4x_cu6y5G4n8n_vVUiIgmc1zyZYM978Gg==.jpg', 50, 'pdf,doc,docx,xls,xlsx,ppt,pptx,jpg,jpeg,png,gif,txt,zip');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('system_admin','department_admin','staff') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'staff',
  `department_id` int NOT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('active','archived') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  `archive_reason` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `archive_notes` text COLLATE utf8mb4_general_ci,
  `archived_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `role`, `department_id`, `profile_image`, `status`, `archive_reason`, `archive_notes`, `archived_at`, `created_at`, `updated_at`) VALUES
(1, 'System Admin', 'admin@example.com', 'admin123', 'system_admin', 4006, NULL, 'active', NULL, NULL, NULL, '2025-11-17 02:21:49', '2025-12-04 13:48:07'),
(2, 'Jane Doe', 'jane@example.com', 'jane123', 'staff', 4008, NULL, 'active', NULL, NULL, NULL, '2025-11-17 02:21:49', '2025-12-04 14:29:16'),
(3, 'Raiza Roces', 'roces_raiza@plpasig.edu.ph', 'qwerty', 'system_admin', 4006, '6f84d2810c1ce053608f73ee9189f4f11c1962f757f0a10d4fac30b24b898f33.png', 'active', NULL, NULL, NULL, '2025-11-18 22:10:35', '2025-12-04 13:24:35'),
(5, 'Glaiza Vallejos', 'vallejos_glaiza@plpasig.edu.ph', '123456', 'staff', 4007, '62e248d20bb258aca37fdb1fc06f11e983f2631ca1f2b52bc43281606fa2fd11.png', 'active', NULL, NULL, NULL, '2025-11-22 03:40:51', '2025-12-04 13:48:10'),
(6, 'Sample Staff', 'sample@gmail.com', 'qwerty', 'staff', 4006, NULL, 'active', NULL, NULL, NULL, '2025-11-26 22:01:32', '2025-12-04 13:48:28'),
(7, 'Lyrika Jewel Hermoso', 'hermoso_lyrikajewel@plpasig.edu.ph', 'QWERTY', 'department_admin', 4007, 'gAAAAABpMYZ6SuBf78MUnWXQ6afFRYjhifHremiaS7_sdEpX3Iy92GqvQyVkeRWPpBV3KWIZmzsHlNGUi9tn0LpCumuTdC4ruS0q2YQYr88thgj6KZpwi_NTgGyiALoGB8Qa1Mll9kaNYglzEGjt-Ah_V_YRu4BKKHsYNfgZz2Ymezrm405a17c=.jpeg', 'active', NULL, NULL, NULL, '2025-11-27 13:36:06', '2025-12-04 13:48:09'),
(8, 'jenny', 'jennypatanag@gmail.com', 'jenny123', 'staff', 4007, 'gAAAAABpMYXJcWSibiCMpQbwfvqPXMp-KyaHKkl4OYgvuLqTz03gei8JTs3TzkCy4Mbe7CKz3KawidFx8aHry70y-RXezpD6ZlpOrYeEvfITDsrBie7x4S-NDS_dtr3UqofV73TayqMdBF9AExx4qHCQztfH787mGpcK6-sBItwW7h2YY8JmPTI=.jpg', 'active', NULL, NULL, NULL, '2025-11-28 12:39:32', '2025-12-04 13:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `workspaces`
--

CREATE TABLE `workspaces` (
  `workspace_id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workspaces`
--

INSERT INTO `workspaces` (`workspace_id`, `user_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(2001, 1, 'BSIT', '', '2025-11-18 22:13:27', '2025-11-30 10:20:26'),
(2002, 1, 'ccs', 'desc', '2025-11-18 22:14:32', '2025-11-19 04:09:33'),
(2003, 1, 'dump', 'testing', '2025-11-30 10:17:55', '2025-11-30 10:17:55');

-- --------------------------------------------------------

--
-- Table structure for table `workspace_members`
--

CREATE TABLE `workspace_members` (
  `workspace_member_id` int NOT NULL,
  `workspace_id` int NOT NULL,
  `user_id` int NOT NULL,
  `joined_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workspace_members`
--

INSERT INTO `workspace_members` (`workspace_member_id`, `workspace_id`, `user_id`, `joined_at`) VALUES
(3015, 2002, 1, '2025-11-19 04:09:33'),
(3045, 2003, 1, '2025-11-30 10:17:55'),
(3053, 2001, 1, '2025-11-30 10:20:26'),
(3054, 2001, 3, '2025-11-30 10:20:26'),
(3055, 2001, 8, '2025-11-30 10:20:26'),
(3056, 2001, 7, '2025-11-30 10:20:26');

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
  ADD KEY `category_id` (`category_id`),
  ADD KEY `idx_files_user_id` (`user_id`),
  ADD KEY `idx_files_status` (`status`),
  ADD KEY `idx_files_shared` (`shared`);

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
  ADD PRIMARY KEY (`settings_id`);

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
  MODIFY `activity_log_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8745;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5013;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4009;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `file_shares`
--
ALTER TABLE `file_shares`
  MODIFY `share_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `file_workspaces`
--
ALTER TABLE `file_workspaces`
  MODIFY `file_workspace_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `reset_codes`
--
ALTER TABLE `reset_codes`
  MODIFY `reset_codes_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9001;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `sessions_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7159;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6002;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `workspaces`
--
ALTER TABLE `workspaces`
  MODIFY `workspace_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2006;

--
-- AUTO_INCREMENT for table `workspace_members`
--
ALTER TABLE `workspace_members`
  MODIFY `workspace_member_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3057;

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
  ADD CONSTRAINT `files_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

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
