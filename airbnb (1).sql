-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 29, 2022 at 09:18 AM
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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `room_id`, `start_date`, `end_date`, `price`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2022-06-21 15:10:08', '2022-06-21 15:10:08', 1000, 1000, '2022-06-21 15:10:08', '2022-06-21 15:10:08'),
(2, 2, 1, '2022-06-21 15:10:08', '2022-06-21 15:10:08', 10000, 10000, '2022-06-21 15:10:08', '2022-06-21 15:10:08');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `reservation_id`, `rating`, `comment`) VALUES
(1, 1, 10, 'OKAY'),
(2, 2, 9, 'UKI');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `home_type`, `room_type`, `total_occupancy`, `total_bedrooms`, `total_bathrooms`, `summary`, `address`, `has_tv`, `has_kitchen`, `has_air_con`, `has_heating`, `has_internet`, `price`, `owner_id`, `created_at`) VALUES
(1, 'villa', 'king room', 100, 10, 20, 'Beautiful house', '42 Ho Hao Hon', 1, 1, 1, 1, 1, 10000, 1, '2022-06-21 22:05:45'),
(2, 'Condo', 'Dirty Room', 2, 1, 1, 'Very dirty', '85 Đ. Hồ Tùng Mậu, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh', 1, 0, 0, 0, 1, 1000, 2, '2022-06-21 22:08:03'),
(3, 'villa', 'queen room', 5, 5, 5, 'dep lem', '8 Hoang Minh Giam', 1, 1, 11, 1, 1, 2000, 1, '2022-06-23 22:35:02');

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
  `created_at` datetime NOT NULL,
  `phone_number` varchar(50) COLLATE utf16_unicode_ci NOT NULL,
  `profile_img` varchar(200) COLLATE utf16_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `phone_number`, `profile_img`) VALUES
(1, 'Nhat', 'nhat.caominh.32@gmail.com', 'password', '2022-06-21 14:48:39', '0909123987', 'https://hero.fandom.com/wiki/Gumball_Watterson'),
(2, 'My', 'myxinhgai@gmail.com', 'password', '2022-06-21 15:01:46', '0123456780', 'https://theamazingworldofgumball.fandom.com/wiki/Penny_Fitzgerald');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservation_room_id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `reservation_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_reservations_id` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_users_id` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
