-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2022 at 10:17 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_messenger`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `room_id` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 = unread | 1 = read',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `room_id`, `status`, `message`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 1, 0, 'Papunta palang tayo sa exciting part\r\n', NULL, '2022-07-24 11:57:29', NULL, NULL),
(2, 3, 1, 2, 0, 'Where na you?', NULL, '2022-07-24 12:20:30', NULL, NULL),
(3, 3, 1, 2, 0, 'Awit sayo', NULL, '2022-07-24 12:22:55', NULL, NULL),
(4, 1, 3, 2, 0, 'Dami mong alam\r\n', NULL, '2022-07-24 12:22:55', NULL, NULL),
(8, 1, 2, 1, 0, 'Hoi', NULL, '2022-07-25 06:42:37', '2022-07-25 06:42:37', NULL),
(9, 1, 2, 1, 0, 'wala', NULL, '2022-07-25 06:44:15', '2022-07-25 06:44:15', NULL),
(10, 1, 2, 1, 0, 'test', NULL, '2022-07-25 06:44:39', '2022-07-25 06:44:39', NULL),
(11, 1, 2, 1, 0, 'help', NULL, '2022-07-25 06:44:50', '2022-07-25 06:44:50', NULL),
(12, 1, 2, 1, 0, 'test', NULL, '2022-07-25 06:45:05', '2022-07-25 06:45:05', NULL),
(13, 1, 2, 1, 0, 'test', NULL, '2022-07-25 06:48:30', '2022-07-25 06:48:30', NULL),
(14, 1, 3, 2, 0, 'Test ulet', NULL, '2022-07-25 06:49:03', '2022-07-25 06:49:03', NULL),
(15, 1, 3, 2, 0, 'Test ulet', NULL, '2022-07-25 06:49:06', '2022-07-25 06:49:06', NULL),
(16, 1, 3, 2, 0, 'Test ulet', NULL, '2022-07-25 06:49:11', '2022-07-25 06:49:11', NULL),
(17, 1, 2, 1, 0, 'test', NULL, '2022-07-25 06:50:10', '2022-07-25 06:50:10', NULL),
(18, 1, 2, 1, 0, 'bobo mo', NULL, '2022-07-25 06:50:16', '2022-07-25 06:50:16', NULL),
(19, 1, 2, 1, 0, 'hoy', NULL, '2022-07-25 06:52:26', '2022-07-25 06:52:26', NULL),
(21, 1, 3, 2, 0, 'sagot bobo', NULL, '2022-07-25 06:54:07', '2022-07-25 06:54:07', NULL),
(22, 2, 1, 1, 0, 'suntukan tayo ang ingay mo', NULL, '2022-07-25 06:57:20', '2022-07-25 06:57:20', NULL),
(23, 1, 2, 1, 0, 'G', NULL, '2022-07-25 07:36:59', '2022-07-25 07:36:59', NULL),
(24, 1, 9, 16, 0, 'Hello', NULL, '2022-07-25 19:21:17', '2022-07-25 19:21:17', NULL),
(25, 1, 9, 16, 0, 'Test', NULL, '2022-07-25 19:22:08', '2022-07-25 19:22:08', NULL),
(26, 1, 9, 16, 0, 'test', NULL, '2022-07-25 19:37:13', '2022-07-25 19:37:13', NULL),
(27, 1, 9, 16, 0, 'test', NULL, '2022-07-25 19:37:44', '2022-07-25 19:37:44', NULL),
(28, 1, 9, 16, 0, 'test', NULL, '2022-07-25 19:39:07', '2022-07-25 19:39:07', NULL),
(29, 1, 9, 16, 0, 'test', NULL, '2022-07-25 19:39:53', '2022-07-25 19:39:53', NULL),
(30, 1, 2, 1, 0, 'Test', NULL, '2022-07-25 21:00:41', '2022-07-25 21:00:41', NULL),
(31, 1, 10, 17, 0, 'Left and Right', NULL, '2022-07-25 21:12:49', '2022-07-25 21:12:49', NULL),
(32, 1, 11, 18, 0, 'Hello', NULL, '2022-07-25 21:13:41', '2022-07-25 21:13:41', NULL),
(33, 1, 11, 18, 0, 'Write your message', NULL, '2022-07-25 22:44:05', '2022-07-25 22:44:05', NULL),
(34, 2, 1, 1, 0, 'Arat', NULL, '2022-07-25 22:51:52', '2022-07-25 22:51:52', NULL),
(35, 1, 3, 2, 0, 'EZ', NULL, '2022-07-25 22:54:56', '2022-07-25 22:54:56', NULL),
(36, 1, 3, 2, 0, 'test', NULL, '2022-07-26 03:54:02', '2022-07-26 03:54:02', NULL),
(37, 1, 3, 2, 0, 'test', NULL, '2022-07-26 03:55:26', '2022-07-26 03:55:26', NULL),
(38, 1, 3, 2, 0, 'test', NULL, '2022-07-26 04:01:06', '2022-07-26 04:01:06', NULL),
(39, 1, 3, 2, 0, 'test', '/images/1658837145__1610469612058.jpg', '2022-07-26 04:05:45', '2022-07-26 04:05:45', NULL),
(40, 3, 1, 2, 0, 'Illustration of the example to upload an image to public folder in Laravel', '/images/1658838681__\'.png', '2022-07-26 04:31:21', '2022-07-26 04:31:21', NULL),
(41, 1, 3, 2, 0, 'Hello', '/images/1658899594__nbi.png', '2022-07-26 21:26:34', '2022-07-26 21:26:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages_room`
--

CREATE TABLE `messages_room` (
  `id` int(11) UNSIGNED NOT NULL,
  `creator_id` int(11) UNSIGNED NOT NULL COMMENT 'First to Message',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages_room`
--

INSERT INTO `messages_room` (`id`, `creator_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2022-07-24 11:58:13', NULL, NULL),
(2, 3, '2022-07-24 12:20:55', NULL, NULL),
(12, 1, '2022-07-25 19:15:08', '2022-07-25 19:15:08', NULL),
(13, 1, '2022-07-25 19:15:53', '2022-07-25 19:15:53', NULL),
(15, 1, '2022-07-25 19:19:51', '2022-07-25 19:19:51', NULL),
(16, 1, '2022-07-25 19:20:20', '2022-07-25 19:20:20', NULL),
(17, 1, '2022-07-25 21:12:42', '2022-07-25 21:12:42', NULL),
(18, 1, '2022-07-25 21:13:34', '2022-07-25 21:13:34', NULL),
(19, 1, '2022-07-25 22:32:00', '2022-07-25 22:32:00', NULL),
(20, 1, '2022-07-25 22:32:44', '2022-07-25 22:32:44', NULL),
(21, 1, '2022-07-26 23:50:47', '2022-07-26 23:50:47', NULL),
(22, 1, '2022-07-26 23:50:50', '2022-07-26 23:50:50', NULL),
(23, 1, '2022-07-26 23:50:50', '2022-07-26 23:50:50', NULL),
(24, 1, '2022-07-26 23:50:50', '2022-07-26 23:50:50', NULL),
(25, 1, '2022-07-26 23:50:51', '2022-07-26 23:50:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages_user`
--

CREATE TABLE `messages_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'Creator',
  `recipient_id` int(11) DEFAULT NULL COMMENT 'Receiver',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages_user`
--

INSERT INTO `messages_user` (`id`, `room_id`, `user_id`, `recipient_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 2, '2022-07-24 12:12:50', NULL, NULL),
(2, 2, 3, 1, '2022-07-24 12:21:19', NULL, NULL),
(25, 16, 1, 9, '2022-07-25 19:20:20', '2022-07-26', NULL),
(26, 17, 1, 10, '2022-07-25 21:12:42', '2022-07-26', NULL),
(27, 18, 1, 11, '2022-07-25 21:13:34', '2022-07-26', NULL),
(28, 19, 1, 22, '2022-07-25 22:32:00', '2022-07-26', NULL),
(29, 20, 1, 32, '2022-07-25 22:32:44', '2022-07-26', NULL),
(30, 21, 1, 41, '2022-07-26 23:50:47', '2022-07-27', NULL),
(31, 22, 1, 34, '2022-07-26 23:50:50', '2022-07-27', NULL),
(32, 23, 1, 33, '2022-07-26 23:50:50', '2022-07-27', NULL),
(33, 24, 1, 31, '2022-07-26 23:50:50', '2022-07-27', NULL),
(34, 25, 1, 29, '2022-07-26 23:50:51', '2022-07-27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL DEFAULT 'https://i.pinimg.com/originals/fd/14/a4/fd14a484f8e558209f0c2a94bc36b855.png',
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `image`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Cedrick Drice', 'admin@gmail.com', 'https://scontent.fmnl8-2.fna.fbcdn.net/v/t1.15752-9/61787321_447799989382125_7607084205947748352_n.jpg?stp=dst-jpg_p100x100&_nc_cat=105&ccb=1-7&_nc_sid=4de414&_nc_eui2=AeFceHh7gnNpJEyTvni8eR_VB5QwbiQCxy8HlDBuJALHL52pfhTWvo5gXpltNSNfDmnCU_zEBc6mh-QFc4rLfg9f&_nc_ohc=waP4Jj8bdQ4AX9P2KDp&tn=siBVF13usnpDNB-z&_nc_ht=scontent.fmnl8-2.fna&oh=03_AVKAYLGf0VOVV9hK11h1LW3f0rW_gFda0x02cKAEhkSVTQ&oe=63017CA0', '$2y$10$UM.tRSMqCS48T/jl7Kqe5.92HfnJkhhnPd6LRk514qZNObb2P7nI2', '2022-07-24 01:42:46', '2022-07-24 01:42:46'),
(2, 'Jasher Drice', 'user@gmail.com', 'https://travelerplus.com/storage/images/user/1536370025__jamesperson.jpg', '$2y$10$BjALktZ1YaL/533ra5wzteAdGHrwy0m7ExTa7laP.D3UDJDmKHid2', '2022-07-24 03:57:05', '2022-07-24 03:57:05'),
(3, 'User Agent', 'test@gmail.com', 'https://i.pinimg.com/originals/fd/14/a4/fd14a484f8e558209f0c2a94bc36b855.png', '$2y$10$fzMjIjlmvtRY3y7jIiBbtOAM6ge6XsHyR/zAI.00asy2xVX/EY7wO', '2022-07-24 04:20:16', '2022-07-24 04:20:16'),
(9, 'Nikola vucevic', 'nikola@gmail.com', 'https://i.pinimg.com/originals/fd/14/a4/fd14a484f8e558209f0c2a94bc36b855.png', '$2y$10$/urXrmlVlCNp.NJU2jeCGOeZRgQhTjQoUVV83.XIS6Qoe/omIQKs6', '2022-07-25 19:12:40', '2022-07-25 19:12:40'),
(10, 'Jimmy Butler', 'jimmy@gmail.com', 'https://i.pinimg.com/originals/fd/14/a4/fd14a484f8e558209f0c2a94bc36b855.png', '$2y$10$/urXrmlVlCNp.NJU2jeCGOeZRgQhTjQoUVV83.XIS6Qoe/omIQKs6', '2022-07-25 19:12:40', '2022-07-25 19:12:40'),
(11, 'Game Butler', 'jimmy1@gmail.com', 'https://travelerplus.com/storage/images/pages/1534738032__download.png', '$2y$10$/urXrmlVlCNp.NJU2jeCGOeZRgQhTjQoUVV83.XIS6Qoe/omIQKs6', '2022-07-25 19:12:40', '2022-07-25 19:12:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages_room`
--
ALTER TABLE `messages_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_id` (`creator_id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `messages_user`
--
ALTER TABLE `messages_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

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
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `messages_room`
--
ALTER TABLE `messages_room`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `messages_user`
--
ALTER TABLE `messages_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
