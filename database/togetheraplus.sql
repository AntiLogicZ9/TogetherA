-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 07:27 PM
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
-- Database: `togetheraplus`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('super_admin','moderator') DEFAULT 'moderator',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `name`, `email`, `password_hash`, `role`, `created_at`) VALUES
(1, 'Admin User', 'admin@example.com', 'hashAdmin', 'super_admin', '2025-05-22 16:25:49'),
(2, 'nam', 'nam@gmail.com', '$2y$10$wna8e3WBuHhqeXtUEYbDyuxPRnDu.whgCvyztOjyrn1iq1cLHM/ia', 'super_admin', '2025-05-22 17:17:03');

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `message_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `helpers`
--

CREATE TABLE `helpers` (
  `helper_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT 0.00,
  `profile_photo` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verification_status` enum('pending','verified','rejected') DEFAULT 'pending',
  `verified_by` int(11) DEFAULT NULL,
  `status` enum('active','suspended','deactivated') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `helpers`
--

INSERT INTO `helpers` (`helper_id`, `name`, `email`, `password_hash`, `phone_number`, `address`, `skills`, `rating`, `profile_photo`, `created_at`, `updated_at`, `verification_status`, `verified_by`, `status`) VALUES
(1, 'Helper A', 'helperA@gmail.com', 'hashA', '1234567890', '123 Main Street, City A', 'Tutoring', 4.80, NULL, '2025-05-22 15:40:09', '2025-05-22 15:40:09', 'pending', NULL, 'active'),
(2, 'Helper B', 'helperB@gmail.com', 'hashB', '9876543210', '456 Elm Street, City B', 'Cleaning', 4.50, NULL, '2025-05-22 15:40:09', '2025-05-22 15:40:09', 'pending', NULL, 'active'),
(3, 'Helper C', 'helperC@gmail.com', 'hashC', '5556667777', '789 Oak Avenue, City C', 'Cooking', 4.70, NULL, '2025-05-22 15:40:09', '2025-05-22 15:40:09', 'pending', NULL, 'active'),
(4, 'Lewis Hamilton', 'lewis.hamilton@gmail.com', 'hashLH', '111222333', '123 Main Street, City A', 'Sign Language Interpreter', 4.85, NULL, '2025-05-22 15:40:40', '2025-05-22 15:40:40', 'pending', NULL, 'active'),
(5, 'Max Verstappen', 'max.verstappen@gmail.com', 'hashMV', '444555666', '456 Elm Street, City B', 'Mobility Assistant', 4.50, NULL, '2025-05-22 15:40:40', '2025-05-22 15:40:40', 'pending', NULL, 'active'),
(6, 'Sebastian Vettel', 'sebastian.vettel@gmail.com', 'hashSV', '777888999', '789 Oak Avenue, City C', 'Caregiving', 4.70, NULL, '2025-05-22 15:40:40', '2025-05-22 15:40:40', 'pending', NULL, 'active'),
(7, 'Charles Leclerc', 'charles.leclerc@gmail.com', 'hashCL', '999888777', '123 Main Street, City A', 'Speech Therapist', 4.90, NULL, '2025-05-22 15:40:40', '2025-05-22 15:40:40', 'pending', NULL, 'active'),
(8, 'Daniel Ricciardo', 'daniel.ricciardo@gmail.com', 'hashDR', '888555666', 'Random City D', 'Occupational Therapist', 4.30, NULL, '2025-05-22 15:40:40', '2025-05-22 15:40:40', 'pending', NULL, 'active'),
(9, 'Fernando Alonso', 'fernando.alonso@gmail.com', 'hashFA', '777444555', 'Random City D', 'Physical Therapist', 4.10, NULL, '2025-05-22 15:40:40', '2025-05-22 15:40:40', 'pending', NULL, 'active'),
(10, 'Lando Norris', 'lando.norris@gmail.com', 'hashLN', '111333555', '456 Elm Street, City B', 'Driving Assistant', 4.00, NULL, '2025-05-22 15:40:40', '2025-05-22 15:40:40', 'pending', NULL, 'active'),
(11, 'George Russell', 'george.russell@gmail.com', 'hashGR', '222333444', '123 Main Street, City A', 'Medical Assistance', 4.60, NULL, '2025-05-22 15:40:40', '2025-05-22 15:40:40', 'pending', NULL, 'active'),
(12, 'Valtteri Bottas', 'valtteri.bottas@gmail.com', 'hashVB', '555666777', '789 Oak Avenue, City C', 'Personal Caregiver', 4.40, NULL, '2025-05-22 15:40:40', '2025-05-22 15:40:40', 'pending', NULL, 'active'),
(13, 'Carlos Sainz', 'carlos.sainz@gmail.com', 'hashCS', '123987456', '789 Oak Avenue, City C', 'Mobility Assistant', 4.50, NULL, '2025-05-22 15:41:22', '2025-05-22 15:41:22', 'pending', NULL, 'active'),
(14, 'Sergio Perez', 'sergio.perez@gmail.com', 'hashSP', '987321654', '456 Elm Street, City B', 'Mobility Assistant', 4.40, NULL, '2025-05-22 15:41:22', '2025-05-22 15:41:22', 'pending', NULL, 'active'),
(15, 'Esteban Ocon', 'esteban.ocon@gmail.com', 'hashEO', '321654987', '123 Main Street, City A', 'Sign Language Interpreter', 4.70, NULL, '2025-05-22 15:41:22', '2025-05-22 15:41:22', 'pending', NULL, 'active'),
(16, 'Pierre Gasly', 'pierre.gasly@gmail.com', 'hashPG', '654789321', '456 Elm Street, City B', 'Sign Language Interpreter', 4.60, NULL, '2025-05-22 15:41:22', '2025-05-22 15:41:22', 'pending', NULL, 'active'),
(17, 'Kimi Raikkonen', 'kimi.raikkonen@gmail.com', 'hashKR', '456123789', '123 Main Street, City A', 'Caregiving', 4.30, NULL, '2025-05-22 15:41:22', '2025-05-22 15:41:22', 'pending', NULL, 'active'),
(18, 'Romain Grosjean', 'romain.grosjean@gmail.com', 'hashRG', '789456123', '789 Oak Avenue, City C', 'Caregiving', 4.20, NULL, '2025-05-22 15:41:22', '2025-05-22 15:41:22', 'pending', NULL, 'active'),
(19, 'Kevin Magnussen', 'kevin.magnussen@gmail.com', 'hashKM', '321789654', 'Random City D', 'Occupational Therapist', 4.00, NULL, '2025-05-22 15:41:22', '2025-05-22 15:41:22', 'pending', NULL, 'active'),
(20, 'Mick Schumacher', 'mick.schumacher@gmail.com', 'hashMS', '654123789', '456 Elm Street, City B', 'Occupational Therapist', 4.10, NULL, '2025-05-22 15:41:22', '2025-05-22 15:41:22', 'pending', NULL, 'active'),
(21, 'Nico Hulkenberg', 'nico.hulkenberg@gmail.com', 'hashNH', '987654321', 'Random City D', 'Speech Therapist', 4.55, NULL, '2025-05-22 15:41:22', '2025-05-22 15:41:22', 'pending', NULL, 'active'),
(22, 'Robert Kubica', 'robert.kubica@gmail.com', 'hashRK', '123456789', '123 Main Street, City A', 'Speech Therapist', 4.35, NULL, '2025-05-22 15:41:22', '2025-05-22 15:41:22', 'pending', NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `hiring_decisions`
--

CREATE TABLE `hiring_decisions` (
  `decision_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `selected_helper_id` int(11) NOT NULL,
  `decision_status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hiring_records`
--

CREATE TABLE `hiring_records` (
  `hiring_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `helper_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `total_hours` decimal(10,2) GENERATED ALWAYS AS (timestampdiff(HOUR,`start_time`,`end_time`)) VIRTUAL,
  `hourly_rate` decimal(10,2) NOT NULL,
  `fixed_price` decimal(10,2) DEFAULT NULL,
  `logged_hours` int(11) DEFAULT 0,
  `user_confirmation` enum('pending','confirmed','disputed') DEFAULT 'pending',
  `helper_confirmation` enum('pending','confirmed','disputed') DEFAULT 'pending',
  `admin_decision` enum('pending','resolved') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','in_progress','completed','disputed') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hiring_records`
--

INSERT INTO `hiring_records` (`hiring_id`, `user_id`, `helper_id`, `task_id`, `start_time`, `end_time`, `hourly_rate`, `fixed_price`, `logged_hours`, `user_confirmation`, `helper_confirmation`, `admin_decision`, `created_at`, `status`) VALUES
(1, 1, 1, 101, '2025-01-20 10:00:00', '2025-01-20 12:00:00', 20.00, NULL, 0, 'pending', 'pending', 'pending', '2025-05-22 15:40:19', 'completed'),
(2, 1, 2, 102, '2025-01-21 14:00:00', '2025-01-21 17:00:00', 15.00, NULL, 0, 'pending', 'pending', 'pending', '2025-05-22 15:40:19', 'completed'),
(3, 1, 3, 103, '2025-01-22 09:00:00', '2025-01-22 11:00:00', 18.00, NULL, 0, 'pending', 'pending', 'pending', '2025-05-22 15:40:19', 'completed'),
(4, 1, 4, 104, '2025-01-22 12:00:00', '2025-01-22 14:00:00', 20.00, NULL, 0, 'pending', 'pending', 'pending', '2025-05-22 15:41:00', 'completed'),
(5, 1, 5, 105, '2025-01-23 10:00:00', '2025-01-23 11:00:00', 22.00, NULL, 0, 'pending', 'pending', 'pending', '2025-05-22 15:41:00', 'completed'),
(6, 1, 6, 103, '2025-01-24 09:00:00', '2025-01-24 10:30:00', 25.00, NULL, 0, 'pending', 'pending', 'pending', '2025-05-22 15:41:00', 'completed'),
(7, 1, 13, 103, '2025-01-24 12:00:00', '2025-01-24 13:30:00', 25.00, NULL, 0, 'pending', 'pending', 'pending', '2025-05-22 15:41:00', 'completed'),
(8, 1, 14, 102, '2025-01-25 09:00:00', '2025-01-25 10:30:00', 18.00, NULL, 0, 'pending', 'pending', 'pending', '2025-05-22 15:41:00', 'completed'),
(9, 1, 15, 101, '2025-01-25 14:00:00', '2025-01-25 16:00:00', 20.00, NULL, 0, 'pending', 'pending', 'pending', '2025-05-22 15:41:00', 'completed'),
(10, 2, 1, 201, '2025-02-12 08:00:00', '2025-02-12 10:00:00', 15.00, NULL, 0, 'pending', 'pending', 'pending', '2025-05-22 16:38:24', 'completed'),
(11, 2, 3, 202, '2025-02-13 14:00:00', '2025-02-13 17:00:00', 12.00, NULL, 0, 'pending', 'pending', 'pending', '2025-05-22 16:38:24', 'completed'),
(12, 2, 2, 203, '2025-02-14 09:00:00', '2025-02-14 11:00:00', 20.00, NULL, 0, 'pending', 'pending', 'pending', '2025-05-22 16:38:24', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `send_from` varchar(255) NOT NULL,
  `send_to` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `message` text NOT NULL,
  `URL` varchar(1000) NOT NULL,
  `send_on` date NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` enum('unread','read') DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hiring_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('credit_card','mobile_payment','paypal') NOT NULL,
  `status` enum('pending','completed','failed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `user_id`, `hiring_id`, `amount`, `payment_method`, `status`, `created_at`) VALUES
(1, 1, 1, 40.00, 'credit_card', 'completed', '2025-05-22 15:40:28'),
(2, 1, 2, 45.00, 'paypal', 'completed', '2025-05-22 15:40:28'),
(3, 1, 3, 36.00, 'mobile_payment', 'completed', '2025-05-22 15:40:28'),
(10, 2, 10, 30.00, 'paypal', 'completed', '2025-02-12 04:05:00'),
(11, 2, 11, 36.00, 'credit_card', 'completed', '2025-02-13 11:05:00'),
(12, 2, 12, 40.00, 'mobile_payment', 'completed', '2025-02-14 05:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `public_seen`
--

CREATE TABLE `public_seen` (
  `Auto_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `resource_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` enum('audio','video','tutorial') NOT NULL,
  `description` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `uploaded_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `approved_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`resource_id`, `name`, `category`, `description`, `link`, `uploaded_by`, `created_at`, `updated_at`, `approved_by`) VALUES
(1, 'USA and Indian Sign Language Differences', 'video', 'Differences between USA and Indian Sign Languages', 'uploads/resources/682f5c60da855_WhatsApp Video 2025-05-22 at 23.06.17_bcfc1ec3.mp4', 2, '2025-05-22 17:18:24', '2025-05-22 17:18:24', NULL),
(2, 'Simple Sign Language Instructions', 'video', 'Simple Sign Language Instructions', 'uploads/resources/682f5cf28ca77_WhatsApp Video 2025-05-22 at 23.05.58_c4519ab7.mp4', 2, '2025-05-22 17:20:50', '2025-05-22 17:20:50', NULL),
(3, 'Under the Guns : A woman\'s reminiscences of the Civil War (Audiobook)', 'audio', 'Annie Turner Wittenmyer (August 26, 1827 – February 2, 1900) was an American charitable organization leader, known for social reform, relief work, and her writing. She served as the first National President of the Woman\'s Christian Temperance Union (WCTU), seventh National President of the Woman\'s Relief Corps (WRC), and also served as president of the Non-Partisan National Woman\'s Christian Temperance Union. In 2007, Wittenmyer was inducted into the Iowa Women\'s Hall of Fame.', 'uploads/resources/682f5d6ab85ed_undertheguns_00_wittenmyer_64kb.mp3', 2, '2025-05-22 17:22:50', '2025-05-22 17:22:50', NULL),
(4, 'Sign Language - How are you in different languages', 'video', 'Sign Language - How are you in different languages', 'uploads/resources/682f5de238fe3_WhatsApp Video 2025-05-22 at 23.06.32_40364811.mp4', 2, '2025-05-22 17:24:50', '2025-05-22 17:24:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resource_requests`
--

CREATE TABLE `resource_requests` (
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `helper_id` int(11) NOT NULL,
  `resource_type` enum('audio','video','tutorial') NOT NULL,
  `task_id` int(11) NOT NULL,
  `status` enum('pending','in_progress','completed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `helper_id` int(11) NOT NULL,
  `hiring_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `skill_required` text DEFAULT NULL,
  `hourly_rate` decimal(10,2) NOT NULL,
  `fixed_rate` decimal(10,2) DEFAULT NULL,
  `urgency` varchar(6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`task_id`, `user_id`, `title`, `description`, `skill_required`, `hourly_rate`, `fixed_rate`, `urgency`, `created_at`, `updated_at`) VALUES
(101, 1, 'Transportation Support', 'Assist in transporting goods', 'Transportation', 20.00, NULL, 'medium', '2025-01-24 14:46:38', '2025-01-24 14:46:38'),
(102, 1, 'General Care', 'Provide basic caregiving services', 'General Care', 18.00, NULL, 'low', '2025-01-24 14:46:38', '2025-01-24 14:46:38'),
(103, 1, 'Mobility Assistance', 'Assist with mobility for the elderly', 'Mobility Assistance', 25.00, NULL, 'high', '2025-01-24 14:46:38', '2025-01-24 14:46:38'),
(104, 1, 'Housekeeping Help', 'Cleaning and tidying up', 'Housekeeping', 15.00, NULL, 'low', '2025-01-24 14:46:38', '2025-01-24 14:46:38'),
(105, 1, 'Cooking Assistance', 'Prepare meals for an event', 'Cooking', 22.00, NULL, 'medium', '2025-01-24 14:46:38', '2025-01-24 14:46:38'),
(201, 2, 'Grocery Delivery', 'Buy and deliver weekly groceries', 'Errand Running', 15.00, NULL, 'low', '2025-02-10 03:00:00', '2025-02-10 03:00:00'),
(202, 2, 'Medication Reminder', 'Visit and remind client to take meds', 'Health Monitoring', 12.00, NULL, 'high', '2025-02-11 04:00:00', '2025-02-11 04:00:00'),
(203, 2, 'Companionship Visit', 'Spend quality time and chat', 'Social Support', 20.00, NULL, 'medium', '2025-02-12 05:00:00', '2025-02-12 05:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `trusted_contacts`
--

CREATE TABLE `trusted_contacts` (
  `contact_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `profile_photo` text DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `user_type` enum('disabled_individual','family_member','caretaker') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `verification_status` enum('pending','verified','rejected') DEFAULT 'pending',
  `verified_by` int(11) DEFAULT NULL,
  `status` enum('active','suspended','deactivated') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `profile_photo`, `password_hash`, `phone_number`, `address`, `user_type`, `created_at`, `updated_at`, `verification_status`, `verified_by`, `status`) VALUES
(1, 'Test User', 'user1@example.com', NULL, 'hash1', NULL, NULL, 'disabled_individual', '2025-05-22 15:38:46', '2025-05-22 15:38:46', 'pending', NULL, 'active'),
(2, 'nam', '123@gmail.com', NULL, '$2y$10$VHix.tObjSqCN5tuGUsgIOl4xJX7ZUjx4ok4MR7m/Y5JdYHUNNi1q', '1214', '12123', 'disabled_individual', '2025-05-22 15:47:32', '2025-05-22 15:47:52', 'verified', NULL, 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `helpers`
--
ALTER TABLE `helpers`
  ADD PRIMARY KEY (`helper_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `hiring_decisions`
--
ALTER TABLE `hiring_decisions`
  ADD PRIMARY KEY (`decision_id`),
  ADD KEY `task_id` (`task_id`),
  ADD KEY `selected_helper_id` (`selected_helper_id`);

--
-- Indexes for table `hiring_records`
--
ALTER TABLE `hiring_records`
  ADD PRIMARY KEY (`hiring_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `public_seen`
--
ALTER TABLE `public_seen`
  ADD PRIMARY KEY (`Auto_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`resource_id`);

--
-- Indexes for table `resource_requests`
--
ALTER TABLE `resource_requests`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `ix_tasks_user` (`user_id`);

--
-- Indexes for table `trusted_contacts`
--
ALTER TABLE `trusted_contacts`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `helpers`
--
ALTER TABLE `helpers`
  MODIFY `helper_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `hiring_decisions`
--
ALTER TABLE `hiring_decisions`
  MODIFY `decision_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hiring_records`
--
ALTER TABLE `hiring_records`
  MODIFY `hiring_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `public_seen`
--
ALTER TABLE `public_seen`
  MODIFY `Auto_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `resource_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `resource_requests`
--
ALTER TABLE `resource_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `trusted_contacts`
--
ALTER TABLE `trusted_contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`),
  ADD CONSTRAINT `chat_messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `chat_messages_ibfk_3` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `hiring_decisions`
--
ALTER TABLE `hiring_decisions`
  ADD CONSTRAINT `hiring_decisions_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hiring_decisions_ibfk_2` FOREIGN KEY (`selected_helper_id`) REFERENCES `helpers` (`helper_id`);

--
-- Constraints for table `public_seen`
--
ALTER TABLE `public_seen`
  ADD CONSTRAINT `public_seen_ibfk_1` FOREIGN KEY (`id`) REFERENCES `messages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `fk_tasks_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
