-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2025 at 05:05 PM
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
(8419, 3, 'User logged in', '2025-11-27 16:00:50');

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
(5003, 'Leave Request Form', '', '2025-11-18 22:18:06', 1, 0),
(5004, 'Resume / CV', 'Auto-created category for Resume / CV', '2025-11-24 02:26:40', 1, 0);

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
(4006, 'Nursing', 1, '2025-11-27 02:39:14');

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
  `department_id` int(11) DEFAULT NULL,
  `document_type` varchar(100) DEFAULT NULL,
  `classification_confidence` enum('Low','Medium','High') DEFAULT NULL,
  `classification_error` varchar(255) DEFAULT NULL,
  `text_sample` text DEFAULT NULL,
  `editable_content` longtext DEFAULT NULL,
  `is_editable` tinyint(1) DEFAULT 0,
  `current_version` int(11) DEFAULT 1,
  `shared` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','archived','deleted') DEFAULT 'active',
  `file_path` varchar(500) DEFAULT NULL,
  `document_type_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`file_id`, `name`, `original_name`, `size`, `type`, `user_id`, `workspace_id`, `category_id`, `department_id`, `document_type`, `classification_confidence`, `classification_error`, `text_sample`, `editable_content`, `is_editable`, `current_version`, `shared`, `created_at`, `status`, `file_path`, `document_type_category_id`) VALUES
(1096, 'leave.pdf', 'leave.pdf', 17170, 'pdf', 1, NULL, NULL, NULL, 'Leave Request Form', 'Low', NULL, 'october 23, 2025\nmr. daniel cruz\nhuman resources manager\ntechnova solutions inc.\nmakati city, metro manila\nsubject: leave request\ndear mr. cruz,\ni would like to formally request a leave of absence fro...', NULL, 0, 1, 0, '2025-11-24 03:19:12', 'active', 'fcd3ab61ee3844098b4bdb0da39d3dfbb447fe6f9b3689614637426fbfb57920', NULL),
(1097, 'leave (1).pdf', 'leave.pdf', 17170, 'pdf', 1, NULL, NULL, NULL, 'Leave Request Form', 'Low', NULL, 'october 23, 2025\nmr. daniel cruz\nhuman resources manager\ntechnova solutions inc.\nmakati city, metro manila\nsubject: leave request\ndear mr. cruz,\ni would like to formally request a leave of absence fro...', NULL, 0, 1, 0, '2025-11-24 03:38:17', 'active', '2338a573acf5d40accc00118ef8736510c5aa42238e1d174c65df763b11e072c', NULL),
(1098, 'leave (2).pdf', 'leave.pdf', 17170, 'pdf', 1, NULL, NULL, NULL, 'Leave Request Form', 'Low', NULL, 'october 23, 2025\nmr. daniel cruz\nhuman resources manager\ntechnova solutions inc.\nmakati city, metro manila\nsubject: leave request\ndear mr. cruz,\ni would like to formally request a leave of absence fro...', NULL, 0, 1, 0, '2025-11-24 03:51:26', 'active', '0a9a7524dcaf4b932f659ed2818b23ac3e3eb939c3035f71780e218f48456f96', NULL),
(1099, 'leave.pdf', 'leave.pdf', 17170, 'pdf', 1, NULL, NULL, NULL, 'Leave Request Form', 'Low', NULL, 'october 23, 2025\nmr. daniel cruz\nhuman resources manager\ntechnova solutions inc.\nmakati city, metro manila\nsubject: leave request\ndear mr. cruz,\ni would like to formally request a leave of absence fro...', NULL, 0, 1, 0, '2025-11-24 03:53:25', 'deleted', '645ab26ebfbdcfc53af7bf3cc7a33201e7e5f4375947992adf492dd610c66840', NULL),
(1100, 'leave.docx', 'leave.docx', 13936, 'docx', 1, NULL, NULL, NULL, 'Leave Request Form', 'Low', NULL, 'october 23, 2025\nmr. daniel cruz\nhuman resources manager\ntechnova solutions inc.\nmakati city, metro manila\nsubject: leave request\ndear mr. cruz,\ni would like to formally request a leave of absence fro...', NULL, 0, 1, 0, '2025-11-24 04:00:08', 'active', 'e6ab39587d29a81815653435e8a9076a9e95949948c6bdfcc7c45bdf6249fc16', NULL),
(1101, 'resignation.docx', 'resignation.docx', 14217, 'docx', 1, NULL, NULL, NULL, 'Resignation Letter', 'Low', NULL, 'john daniel cabusas\npasig city, metro manila, 1600\njanden@email.com\n0911-000-4444\noctober 17, 2025\nmr. john p. cruz\nhuman resources manager\nbrighttech solutions inc.\nmandaluyong city, metro manila\nsub...', NULL, 0, 1, 0, '2025-11-24 06:11:35', 'active', '884656702b627f9060f8194f63055d0bfa3711abd589352ae69574e28f692730', NULL),
(1102, 'DTR_Format_Sample.xlsx', 'DTR_Format_Sample.xlsx', 31273, 'xlsx', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2025-11-24 06:18:02', 'active', 'd293c47b6bb8b4f5338beff61c1387389cacee322b8d23ac7d42a199e85033eb', NULL),
(1103, 'DMS.zip', 'DMS.zip', 682609, 'zip', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2025-11-24 06:21:34', 'active', 'd4a8285abdde924d16a16771fb8131147374e5d53a644c36897814712a399755', NULL),
(1104, 'Logo.png', 'Logo.png', 300740, 'png', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2025-11-24 06:27:01', 'active', 'f249e2842a1e753a69433bf3b573d2edf93df3528ba4cd3d084a46f1a91fcd03', NULL),
(1105, 'HRM.pptx', 'HRM.pptx', 7233592, 'pptx', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2025-11-24 07:49:27', 'active', '409e70262848f75b9c63c76939edfffb99308d5b92d1004fec0e1cbef1436727', NULL),
(1106, 'HRM.pptx', 'HRM.pptx', 7233592, 'pptx', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2025-11-26 19:29:28', 'deleted', 'e09b326a68330d5699c0c1e407d6cbf1997d3e05b3d2bfd09b63efd7a1fa17dc', NULL),
(1107, 'leave (3).pdf', 'leave.pdf', 17170, 'pdf', 1, NULL, NULL, NULL, 'Leave Request Form', 'Low', NULL, 'october 23, 2025\nmr. daniel cruz\nhuman resources manager\ntechnova solutions inc.\nmakati city, metro manila\nsubject: leave request\ndear mr. cruz,\ni would like to formally request a leave of absence fro...', NULL, 0, 1, 1, '2025-11-26 22:59:23', 'active', 'f5efc8b165eadba8f92baef41ded521ac2774880e398c15ad4edb80764fb030e', NULL),
(1108, 'leave (4).pdf', 'leave.pdf', 17170, 'pdf', 1, NULL, NULL, NULL, 'Leave Request Form', 'Low', NULL, 'october 23, 2025\nmr. daniel cruz\nhuman resources manager\ntechnova solutions inc.\nmakati city, metro manila\nsubject: leave request\ndear mr. cruz,\ni would like to formally request a leave of absence fro...', NULL, 0, 1, 0, '2025-11-27 01:29:13', 'active', 'c2f9b40b5a1a68ca5fb5a2b194c4f2ba664004db756dcaf8d016f76bd5bfad70', NULL),
(1109, 'rresign.pdf', 'resignation.pdf', 37030, 'pdf', 1, NULL, NULL, NULL, 'Resignation Letter', 'Low', NULL, 'john daniel cabusas\npasig city, metro manila, 1600\njanden@email.com\n0911-000-4444\noctober 17, 2025\nmr. john p. cruz\nhuman resources manager\nbrighttech solutions inc.\nmandaluyong city, metro manila\nsub...', NULL, 0, 1, 1, '2025-11-27 02:08:51', 'active', '01c6b7d5fb219630d842e5b4f17295f462e797792f0d603756902f376c1f9b6d', NULL),
(1110, 'leave (5).pdf', 'leave.pdf', 17170, 'pdf', 1, NULL, NULL, NULL, 'Leave Request Form', 'Low', NULL, 'october 23, 2025\nmr. daniel cruz\nhuman resources manager\ntechnova solutions inc.\nmakati city, metro manila\nsubject: leave request\ndear mr. cruz,\ni would like to formally request a leave of absence fro...', NULL, 0, 1, 0, '2025-11-27 04:24:25', 'active', '7fc284357aa8201cd744a49062913da8dc1ba0966d8da31831521b974231cd3d', NULL),
(1111, 'leave (6).pdf', 'leave.pdf', 17170, 'pdf', 1, NULL, NULL, NULL, 'Leave Request Form', 'Low', NULL, 'october 23, 2025\nmr. daniel cruz\nhuman resources manager\ntechnova solutions inc.\nmakati city, metro manila\nsubject: leave request\ndear mr. cruz,\ni would like to formally request a leave of absence fro...', NULL, 0, 1, 0, '2025-11-27 04:24:32', 'active', '9ca90b50c31ae5a2296ad8d5c53d023a9c89bf2067292f82c243b197b537285a', NULL),
(1112, 'resignation (1).pdf', 'resignation.pdf', 37030, 'pdf', 1, NULL, 5001, NULL, 'Resignation Letter', 'Low', NULL, 'john daniel cabusas\npasig city, metro manila, 1600\njanden@email.com\n0911-000-4444\noctober 17, 2025\nmr. john p. cruz\nhuman resources manager\nbrighttech solutions inc.\nmandaluyong city, metro manila\nsub...', NULL, 0, 1, 0, '2025-11-27 13:09:36', 'active', '4f728e4ca925f6ba144be25986ea200c52e85bfef31a6ab6ea7861bbaa5fb10f', NULL),
(1113, 'Resignation-Letter.docx', 'Resignation-Letter.docx', 7245, 'docx', 1, NULL, NULL, NULL, 'Resignation Letter', 'Low', NULL, 'lyrika jewel hermoso\n 123 mabini street\n pasig city, 1600\n lyrika.hermoso@email.com\n 0917-123-4567\n november 27, 2025\nmr. juan dela cruz\n hr manager\n abc solutions inc.\n 456 ortigas avenue\n pasig city...', NULL, 0, 1, 0, '2025-11-27 13:17:47', 'active', '5543963d8ea6298782536b2e0f3744df985a576a911419563717b26fb5deb140', NULL),
(1114, 'resignation.docx', 'resignation.docx', 14217, 'docx', 7, NULL, NULL, NULL, 'Resignation Letter', 'Low', NULL, 'john daniel cabusas\npasig city, metro manila, 1600\njanden@email.com\n0911-000-4444\noctober 17, 2025\nmr. john p. cruz\nhuman resources manager\nbrighttech solutions inc.\nmandaluyong city, metro manila\nsub...', NULL, 0, 1, 0, '2025-11-27 13:44:02', 'active', 'd99a90e88e58750fe50866f9eb7d51b5a4c6e097b613ef9c4867adc85ccac00c', NULL),
(1115, 'resignation.docx', 'resignation.docx', 14217, 'docx', 7, NULL, NULL, NULL, 'Resignation Letter', 'Low', NULL, 'john daniel cabusas\npasig city, metro manila, 1600\njanden@email.com\n0911-000-4444\noctober 17, 2025\nmr. john p. cruz\nhuman resources manager\nbrighttech solutions inc.\nmandaluyong city, metro manila\nsub...', NULL, 0, 1, 0, '2025-11-27 13:44:17', 'archived', '82527e2c906e8c04ab549df596c084ad84a84290feea9bd17d49102b00c62e6a', NULL),
(1116, 'resignation.docx', 'resignation.docx', 14217, 'docx', 5, NULL, NULL, NULL, 'Resignation Letter', 'Low', NULL, 'john daniel cabusas\npasig city, metro manila, 1600\njanden@email.com\n0911-000-4444\noctober 17, 2025\nmr. john p. cruz\nhuman resources manager\nbrighttech solutions inc.\nmandaluyong city, metro manila\nsub...', NULL, 0, 1, 0, '2025-11-27 14:18:20', 'active', 'd3878b8da1129109cdd97d5da7b75822ba1a56f564e691197a32806880eaa008', NULL),
(1117, 'hsdhgsa.pdf', 'leave.pdf', 17170, 'pdf', 5, NULL, NULL, NULL, 'Leave Request Form', 'Low', NULL, 'october 23, 2025\nmr. daniel cruz\nhuman resources manager\ntechnova solutions inc.\nmakati city, metro manila\nsubject: leave request\ndear mr. cruz,\ni would like to formally request a leave of absence fro...', NULL, 0, 1, 0, '2025-11-27 14:53:37', 'active', 'd8efadb92d20cfa51a8721cf7a074ca85cd880a5bfc671668954c07bb4b45886', NULL),
(1118, 'resignation (1).docx', 'resignation.docx', 14217, 'docx', 5, NULL, NULL, NULL, 'Resignation Letter', 'Low', NULL, 'john daniel cabusas\npasig city, metro manila, 1600\njanden@email.com\n0911-000-4444\noctober 17, 2025\nmr. john p. cruz\nhuman resources manager\nbrighttech solutions inc.\nmandaluyong city, metro manila\nsub...', NULL, 0, 1, 0, '2025-11-27 15:00:49', 'active', '323c40780213b8a49e957ef83ba1dec4e783d02d1e39447563df16625b1a5f6a', NULL),
(1119, 'DTR_Format_Sample.xlsx', 'DTR_Format_Sample.xlsx', 31273, 'xlsx', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2025-11-27 15:01:32', 'active', '1f7709c0a91c5768f31a3069051cd553ce6a4f3f31f5a6b2ac60c20ad4f9b7cf', NULL),
(1120, 'DMS.zip', 'DMS.zip', 682609, 'zip', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, '2025-11-27 15:07:00', 'active', '2e85c736cca3877ed4cee863e9a86c113a094d5d851529bed1e77ab94031d8d8', NULL),
(1121, 'leave (1).pdf', 'leave.pdf', 17170, 'pdf', 5, NULL, NULL, NULL, 'Leave Request Form', 'Low', NULL, 'october 23, 2025\nmr. daniel cruz\nhuman resources manager\ntechnova solutions inc.\nmakati city, metro manila\nsubject: leave request\ndear mr. cruz,\ni would like to formally request a leave of absence fro...', NULL, 0, 1, 0, '2025-11-27 15:36:38', 'active', '82cba8bd71019a291d6aa3f7022f627e7e64096356db2ba65520df0d85d02f5c', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `file_editors`
--

CREATE TABLE `file_editors` (
  `editor_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
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

--
-- Dumping data for table `file_shares`
--

INSERT INTO `file_shares` (`share_id`, `file_id`, `shared_with_user_id`, `shared_with_department_id`, `permission`, `shared_by`, `created_at`) VALUES
(1, 1109, 4, NULL, 'editor', 1, '2025-11-27 02:37:41'),
(2, 1109, 2, NULL, 'viewer', 1, '2025-11-27 02:37:47'),
(3, 1109, NULL, 4005, 'viewer', 1, '2025-11-27 02:37:59'),
(4, 1109, NULL, 4002, 'viewer', 1, '2025-11-27 12:37:07'),
(5, 1109, NULL, 4001, 'viewer', 1, '2025-11-27 12:37:14'),
(6, 1109, NULL, 4003, 'viewer', 1, '2025-11-27 12:37:27');

-- --------------------------------------------------------

--
-- Table structure for table `file_versions`
--

CREATE TABLE `file_versions` (
  `version_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `version_number` int(11) NOT NULL,
  `content` longtext DEFAULT NULL,
  `content_hash` varchar(255) DEFAULT NULL,
  `edited_by` int(11) NOT NULL,
  `edit_summary` varchar(255) DEFAULT NULL,
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

--
-- Dumping data for table `file_workspaces`
--

INSERT INTO `file_workspaces` (`file_workspace_id`, `file_id`, `workspace_id`, `added_at`) VALUES
(10032, 1096, 2001, '2025-11-24 03:19:12'),
(10033, 1099, 2001, '2025-11-26 19:28:23'),
(10034, 1099, 2002, '2025-11-26 19:28:23'),
(10035, 1100, 2001, '2025-11-26 19:28:35'),
(10036, 1100, 2002, '2025-11-26 19:28:35'),
(10037, 1100, 2003, '2025-11-26 19:28:35'),
(10038, 1106, 2001, '2025-11-26 19:29:28'),
(10039, 1106, 2002, '2025-11-26 19:53:41'),
(10044, 1104, 2001, '2025-11-26 19:53:42'),
(10045, 1104, 2002, '2025-11-26 19:53:42'),
(10047, 1103, 2001, '2025-11-26 20:07:25'),
(10048, 1103, 2002, '2025-11-26 20:07:25'),
(10050, 1105, 2001, '2025-11-26 21:04:20'),
(10051, 1105, 2002, '2025-11-26 21:04:20'),
(10052, 1108, 2001, '2025-11-27 01:29:13'),
(10053, 1108, 2002, '2025-11-27 01:29:13'),
(10054, 1107, 2002, '2025-11-27 01:29:47'),
(10055, 1107, 2003, '2025-11-27 01:29:47'),
(10056, 1109, 2001, '2025-11-27 02:08:51'),
(10057, 1109, 2002, '2025-11-27 02:08:51'),
(10058, 1110, 2001, '2025-11-27 04:24:28'),
(10059, 1111, 2001, '2025-11-27 04:24:35');

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
(7081, 3, 'roces_raiza@plpasig.edu.ph', '2025-11-27 16:00:49');

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
  `role` enum('system_admin','department_admin','staff') NOT NULL DEFAULT 'staff',
  `department_id` int(11) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `status` enum('active','archived') NOT NULL DEFAULT 'active',
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
(1, 'System Admin', 'admin@example.com', 'admin123', 'system_admin', 4004, NULL, 'active', NULL, NULL, NULL, '2025-11-17 02:21:49', '2025-11-27 15:54:08'),
(2, 'Jane Doe', 'jane@example.com', 'jane123', 'staff', 4002, NULL, 'active', NULL, NULL, NULL, '2025-11-17 02:21:49', '2025-11-17 02:21:49'),
(3, 'Raiza Roces', 'roces_raiza@plpasig.edu.ph', 'qwerty', 'system_admin', 4001, '6f84d2810c1ce053608f73ee9189f4f11c1962f757f0a10d4fac30b24b898f33.png', 'active', NULL, NULL, NULL, '2025-11-18 22:10:35', '2025-11-27 15:54:25'),
(4, 'Full name', 'fname@gmail.com', 'qwerty', 'system_admin', 4001, NULL, 'active', NULL, NULL, NULL, '2025-11-21 15:29:52', '2025-11-27 15:42:20'),
(5, 'Glaiza Vallejos', 'vallejos_glaiza@plpasig.edu.ph', '123456', 'staff', 4001, '62e248d20bb258aca37fdb1fc06f11e983f2631ca1f2b52bc43281606fa2fd11.png', 'active', NULL, NULL, NULL, '2025-11-22 03:40:51', '2025-11-27 15:56:07'),
(6, 'sample name', 'sample@gmail.com', 'qwerty', 'staff', 4003, NULL, 'active', NULL, NULL, NULL, '2025-11-26 22:01:32', '2025-11-27 13:49:06'),
(7, 'Lyrika Jewel Hermoso', 'hermoso_lyrikajewel@plpasig.edu.ph', 'QWERTY', 'department_admin', 4003, 'feb6fa964ad9acf0912f9762c24db9210a285ad4cbc655b370557715bc8a4b30.png', 'active', NULL, NULL, NULL, '2025-11-27 13:36:06', '2025-11-27 15:58:02');

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
  ADD KEY `workspace_id` (`workspace_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `document_type_category_id` (`document_type_category_id`),
  ADD KEY `files_ibfk_5` (`department_id`),
  ADD KEY `idx_files_user_id` (`user_id`),
  ADD KEY `idx_files_status` (`status`),
  ADD KEY `idx_files_shared` (`shared`);

--
-- Indexes for table `file_editors`
--
ALTER TABLE `file_editors`
  ADD PRIMARY KEY (`editor_id`),
  ADD UNIQUE KEY `unique_editor` (`file_id`,`user_id`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `user_id` (`user_id`);

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
-- Indexes for table `file_versions`
--
ALTER TABLE `file_versions`
  ADD PRIMARY KEY (`version_id`),
  ADD UNIQUE KEY `unique_version` (`file_id`,`version_number`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `edited_by` (`edited_by`);

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
  MODIFY `activity_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8420;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5005;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4008;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1122;

--
-- AUTO_INCREMENT for table `file_editors`
--
ALTER TABLE `file_editors`
  MODIFY `editor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_shares`
--
ALTER TABLE `file_shares`
  MODIFY `share_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `file_versions`
--
ALTER TABLE `file_versions`
  MODIFY `version_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_workspaces`
--
ALTER TABLE `file_workspaces`
  MODIFY `file_workspace_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10060;

--
-- AUTO_INCREMENT for table `reset_codes`
--
ALTER TABLE `reset_codes`
  MODIFY `reset_codes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9001;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `sessions_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7082;

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
  ADD CONSTRAINT `files_ibfk_4` FOREIGN KEY (`document_type_category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `files_ibfk_5` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL;

--
-- Constraints for table `file_editors`
--
ALTER TABLE `file_editors`
  ADD CONSTRAINT `file_editors_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `file_editors_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `file_shares`
--
ALTER TABLE `file_shares`
  ADD CONSTRAINT `file_shares_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `file_shares_ibfk_2` FOREIGN KEY (`shared_with_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `file_shares_ibfk_3` FOREIGN KEY (`shared_with_department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE;

--
-- Constraints for table `file_versions`
--
ALTER TABLE `file_versions`
  ADD CONSTRAINT `file_versions_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `file_versions_ibfk_2` FOREIGN KEY (`edited_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

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
-- --------------------------------------------------------

ALTER TABLE `settings`
  ADD COLUMN `company_logo` VARCHAR(255) NULL AFTER `company`;

INSERT INTO `settings` (settings_id, company, max_file_mb, allowed_types, company_logo)
VALUES (6001, 'DMS', 50, 'pdf,doc,docx,jpg,jpeg,png,txt', NULL)
ON DUPLICATE KEY UPDATE settings_id = settings_id;

ALTER TABLE `files`
  ADD COLUMN `is_encrypted` TINYINT(1) NOT NULL DEFAULT 0 AFTER `file_path`,
  ADD COLUMN `encryption_version` VARCHAR(32) NULL AFTER `is_encrypted`;

UPDATE `files`
SET is_encrypted = CASE WHEN file_path IS NOT NULL AND file_path <> '' THEN 1 ELSE 0 END,
    encryption_version = COALESCE(encryption_version, 'hash_v1');

ALTER TABLE reset_codes ADD COLUMN token VARCHAR(255) UNIQUE NOT NULL DEFAULT '';
ALTER TABLE reset_codes ADD COLUMN expires_at TIMESTAMP NULL DEFAULT NULL;
ALTER TABLE reset_codes ADD COLUMN is_used TINYINT(1) DEFAULT 0;

-- ADD COLUMNS FOR RESET CODES
ALTER TABLE reset_codes ADD COLUMN token VARCHAR(255) UNIQUE NOT NULL DEFAULT '';
ALTER TABLE reset_codes ADD COLUMN expires_at TIMESTAMP NULL DEFAULT NULL;
ALTER TABLE reset_codes ADD COLUMN is_used TINYINT(1) DEFAULT 0;

-- unused table
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS file_editors;
DROP TABLE IF EXISTS file_versions;
SET FOREIGN_KEY_CHECKS = 1;

-- unused columns
ALTER TABLE files DROP COLUMN editable_content;
ALTER TABLE files DROP COLUMN is_editable;
ALTER TABLE files DROP COLUMN current_version;


-- Drop the foreign key constraint
ALTER TABLE files DROP FOREIGN KEY files_ibfk_4;

-- Drop the index
ALTER TABLE files DROP INDEX document_type_category_id;

-- Drop the column
ALTER TABLE files DROP COLUMN document_type_category_id;
 
-- Migration: add user_id to reset_codes, backfill from users.email, add FK

-- Add nullable user_id column
ALTER TABLE reset_codes
  ADD COLUMN user_id INT NULL AFTER email;

--  Backfill existing rows by matching email -> users.email
UPDATE reset_codes rc
JOIN users u ON rc.email = u.email
SET rc.user_id = u.user_id
WHERE rc.user_id IS NULL;

-- Check how many rows remain unmatched (inspect output before continuing)
SELECT COUNT(*) AS no_user_matches FROM reset_codes WHERE user_id IS NULL;

-- Add index and foreign key constraint (ON DELETE SET NULL recommended)
ALTER TABLE reset_codes
  ADD INDEX idx_reset_codes_user_id (user_id);

ALTER TABLE reset_codes
  ADD CONSTRAINT fk_reset_codes_user
    FOREIGN KEY (user_id) REFERENCES users(user_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE;
--  Add nullable created_by and updated_by columns
ALTER TABLE settings
  ADD COLUMN created_by INT NULL AFTER company_logo,
  ADD COLUMN updated_by INT NULL AFTER created_by;

--  (Optional) Backfill created_by/updated_by to a known admin (replace 1 with the admin user_id)
-- Only run if you want to attribute the existing settings row to an existing user
UPDATE settings SET created_by = 1, updated_by = 1 WHERE settings_id = 6001 AND (created_by IS NULL OR updated_by IS NULL);

--  Add indexes then FK constraints referencing users.user_id (ON DELETE SET NULL recommended)
ALTER TABLE settings
  ADD INDEX idx_settings_created_by (created_by),
  ADD INDEX idx_settings_updated_by (updated_by);

ALTER TABLE settings
  ADD CONSTRAINT fk_settings_created_by
    FOREIGN KEY (created_by) REFERENCES users(user_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  ADD CONSTRAINT fk_settings_updated_by
    FOREIGN KEY (updated_by) REFERENCES users(user_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

--  Verify
SELECT * FROM settings;
SHOW CREATE TABLE settings;

ALTER TABLE users
  DROP COLUMN archive_reason,
  DROP COLUMN archive_notes,
  DROP COLUMN archived_at;

-- Migration: drop deprecated columns from files table
-- Removes workspace_id and department_id which are now represented
-- by the file_workspaces table and file_shares.
ALTER TABLE files DROP FOREIGN KEY files_ibfk_2;
ALTER TABLE files DROP FOREIGN KEY files_ibfk_5;

ALTER TABLE files
  DROP COLUMN workspace_id,
  DROP COLUMN department_id;

  
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

