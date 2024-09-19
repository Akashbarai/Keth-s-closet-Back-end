-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2024 at 05:00 AM
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
-- Database: `keiths_closet`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'Donald', '$2y$10$ZFzCgbbRfO2MXjaN7BOxVuq7QQjdq10HDohulKlzFIjS29nq1kCIK');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `created_at`, `created_by`) VALUES
(1, 'New Project', 'We going to take new project next week.', '2024-08-30 10:02:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  `volunteer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `announcement_id`, `volunteer_id`, `comment`, `created_at`) VALUES
(1, 1, 1, '', '2024-08-30 10:03:29'),
(3, 1, 1, '', '2024-08-30 10:13:18'),
(4, 1, 3, '', '2024-08-30 10:15:32');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `address`, `contact_number`, `created_at`) VALUES
(1, 'Hospital A', '123 Main St', '123-456-7890', '2024-08-30 09:39:18'),
(2, 'Hospital B', '456 Elm St', '234-567-8901', '2024-08-30 09:39:18'),
(3, 'Hospital C', '789 Oak St', '345-678-9012', '2024-08-30 09:39:18');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `volunteer_id` int(11) NOT NULL,
  `status` enum('pending','preparing','ready','delivered') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `hospital_id` int(11) NOT NULL,
  `warehouse_volunteer_id` int(11) DEFAULT NULL,
  `delivery_volunteer_id` int(11) DEFAULT NULL,
  `approx_delivery_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `volunteer_id`, `status`, `created_at`, `hospital_id`, `warehouse_volunteer_id`, `delivery_volunteer_id`, `approx_delivery_time`) VALUES
(1, 1, 'pending', '2024-08-30 08:46:06', 0, NULL, NULL, NULL),
(2, 1, 'pending', '2024-08-30 09:43:41', 3, NULL, NULL, NULL),
(3, 1, 'pending', '2024-08-30 09:48:15', 2, NULL, NULL, NULL),
(4, 1, 'pending', '2024-08-30 09:49:15', 1, NULL, NULL, NULL),
(5, 3, 'pending', '2024-08-30 10:36:36', 2, NULL, NULL, NULL),
(6, 4, 'pending', '2024-09-01 23:10:00', 2, NULL, NULL, NULL),
(7, 1, 'pending', '2024-09-09 05:11:57', 2, NULL, NULL, NULL),
(8, 6, 'pending', '2024-09-19 01:37:02', 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` enum('pending','prepared') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item_name`, `quantity`, `status`) VALUES
(1, 1, 'socks', 2, 'pending'),
(2, 4, 'socks', 2, 'pending'),
(3, 5, 'jacket', 2, 'pending'),
(4, 6, 'tshirt', 2, 'pending'),
(5, 7, 'tshirt', 5, 'pending'),
(6, 8, 'jacket', 2, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `reactions`
--

CREATE TABLE `reactions` (
  `id` int(11) NOT NULL,
  `announcement_id` int(11) NOT NULL,
  `volunteer_id` int(11) NOT NULL,
  `reaction_type` enum('love') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reactions`
--

INSERT INTO `reactions` (`id`, `announcement_id`, `volunteer_id`, `reaction_type`, `created_at`) VALUES
(1, 1, 1, 'love', '2024-08-30 10:03:19'),
(2, 1, 3, 'love', '2024-08-30 10:15:25');

-- --------------------------------------------------------

--
-- Table structure for table `volunteers`
--

CREATE TABLE `volunteers` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_approved` tinyint(1) DEFAULT 0,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `volunteers`
--

INSERT INTO `volunteers` (`id`, `username`, `email`, `password`, `created_at`, `is_approved`, `address`, `phone_number`, `profile_photo`) VALUES
(1, 'Akashbarai', 'Akashbarai80@gmail.com', '$2y$10$pHhpaAHjSk9DnadamH.Z9uDNKJwlGshEDqQeb0r1vzEkuDiQrbwO2', '2024-08-30 05:11:23', 1, '2/93 Sproule Street', '0480329792', 'uploads/2.png'),
(3, 'Akashbarai2', 'Akashbarai.canada@gmail.com', '$2y$10$CdkWvPhyYEoU0cbL5MgdyelsTUyd5rtD83.BwYE92.I.OaNgW0tLO', '2024-08-30 07:06:20', 1, '', '', 'uploads/WIN_20230523_15_27_30_Pro.jpg'),
(4, 'Akashbarai23', 'Akashbara4i80@gmail.com', '$2y$10$BnAeloyrwbA4j7g8k5zuIu4yYTwO2EE1giAM33845HD2qL/7FA7QO', '2024-09-01 23:03:54', 1, NULL, NULL, NULL),
(5, 'Donald', 'Akashuubarai80@gmail.com', '$2y$10$qQhd/ZTK/myAL5bawNtsge3UJCTBJlfZa/w.x6lem/SBCiITOaTtq', '2024-09-01 23:39:31', 1, NULL, NULL, NULL),
(6, 'Sanjib', 'Akashbarai880@gmail.com', '$2y$10$gSq4vxJpGY1ukjyiw9/7uOmJNWDlcihZngsteQp/MBPRhzPGlhiN2', '2024-09-19 01:25:47', 1, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcement_id` (`announcement_id`),
  ADD KEY `volunteer_id` (`volunteer_id`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volunteer_id` (`volunteer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcement_id` (`announcement_id`),
  ADD KEY `volunteer_id` (`volunteer_id`);

--
-- Indexes for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reactions`
--
ALTER TABLE `reactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `volunteers`
--
ALTER TABLE `volunteers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `admins` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteers` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteers` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `reactions`
--
ALTER TABLE `reactions`
  ADD CONSTRAINT `reactions_ibfk_1` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`id`),
  ADD CONSTRAINT `reactions_ibfk_2` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
