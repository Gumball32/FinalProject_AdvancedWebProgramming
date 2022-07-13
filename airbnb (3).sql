-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 13, 2022 at 02:05 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airbnb`
--

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `price` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `room_id`, `start_date`, `end_date`, `price`, `total`, `created_at`, `updated_at`) VALUES
(2, 2, 1, '2022-06-21 15:10:08', '2022-06-21 15:10:08', 10000, 10000, '2022-06-21 15:10:08', '2022-06-21 15:10:08'),
(3, 3, 1, '2022-07-05 16:51:16', '2022-07-05 16:51:16', 222, 222, '2022-07-05 16:51:16', '2022-07-05 16:51:16'),
(4, 4, 1, '2022-07-05 16:51:16', '2022-07-05 16:51:16', 111, 111, '2022-07-05 16:51:16', '2022-07-05 16:51:16');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(1000) COLLATE utf16_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reservation_id` (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `reservation_id`, `rating`, `comment`) VALUES
(2, 2, 9, 'UKI'),
(25, 3, 10, 'OKAY');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(300) COLLATE utf16_unicode_ci NOT NULL,
  `home_type` varchar(50) COLLATE utf16_unicode_ci NOT NULL,
  `room_type` varchar(50) COLLATE utf16_unicode_ci NOT NULL,
  `total_occupancy` int(11) NOT NULL,
  `total_bedrooms` int(11) NOT NULL,
  `total_bathrooms` int(11) NOT NULL,
  `summary` varchar(1000) COLLATE utf16_unicode_ci NOT NULL,
  `address` varchar(200) COLLATE utf16_unicode_ci NOT NULL,
  `has_tv` tinyint(1) NOT NULL,
  `has_kitchen` tinyint(1) NOT NULL,
  `has_air_con` tinyint(1) NOT NULL,
  `has_heating` tinyint(1) NOT NULL,
  `has_internet` tinyint(1) NOT NULL,
  `price` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(200) COLLATE utf16_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_name`, `home_type`, `room_type`, `total_occupancy`, `total_bedrooms`, `total_bathrooms`, `summary`, `address`, `has_tv`, `has_kitchen`, `has_air_con`, `has_heating`, `has_internet`, `price`, `owner_id`, `created_at`, `image`) VALUES
(1, 'ad1', 'Apartment', 'Private rooms', 100, 3, 21, '10 diem!!!!!?', 'New York', 0, 1, 1, 0, 1, 99, 1, '2022-06-21 22:05:45', NULL),
(5, 'numb', 'House', 'Shared rooms', 2, 1, 1, 'gg', 'Ly Ching Thang', 0, 0, 1, 1, 0, 3, 2, '2022-07-11 13:36:10', NULL),
(6, 'sang', 'Apartment', 'Entire place', 2, 2, 2, '2', '222', 0, 1, 0, 1, 0, 22, 1, '2022-07-12 05:59:58', NULL),
(8, 'image', 'Apartment', 'Entire place', 1, 1, 1, '1', '1', 0, 0, 0, 1, 0, 1, 1, '2022-07-12 23:30:30', 'images/itec_62cda1a66fb67.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf16_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf16_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone_number` varchar(50) COLLATE utf16_unicode_ci NOT NULL,
  `profile_img` varchar(200) COLLATE utf16_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `phone_number`, `profile_img`) VALUES
(1, 'Nhat', 'nhat.caominh.32@gmail.com', 'password', '2022-06-21 14:48:39', '0909123987', 'https://hero.fandom.com/wiki/Gumball_Watterson'),
(2, 'My', 'myxinhgai@gmail.com', 'password', '2022-06-21 15:01:46', '0123456780', 'https://theamazingworldofgumball.fandom.com/wiki/Penny_Fitzgerald'),
(3, '123456', 'thisismehaha@protonmail.com', '$2y$10$0sBidJH5S3.tLwvyzi1yw.c2IHl2wwmCfuTwuE5UDYu0Fd3U4IFA2', '2022-07-07 22:00:42', '11111111', NULL),
(4, 'nhat123', 'nhat.caominh.32@gmail.com', '$2y$10$Kmc/cG3J/Ncv9w2m.cjIKO9rLrN.Rp.YuQfdOKFp1PQOwrLySc3Re', '2022-07-07 23:15:48', '09099090', 'images/itec_62cda26a3d777.png');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservation_room_id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_reservations_id` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_users_id` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
