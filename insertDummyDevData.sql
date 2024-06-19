-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 19, 2024 at 02:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` bigint(20) NOT NULL,
  `address_line_1` varchar(512) NOT NULL,
  `addressline_2` varchar(512) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(75) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `local_user`
--

CREATE TABLE `local_user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(320) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `local_user`
--

INSERT INTO `local_user` (`id`, `email`, `first_name`, `last_name`, `password`, `username`) VALUES
(7, 'test-1@tester.com', 'Dave', 'Tester', '$2a$10$1L5YhB3F/sCzW/UxZLiwzePE98pa4jyti7rpmIobmozxD.9s1Qzjq', 'test-1'),
(8, 'test-2@tester.com', 'Dave', 'Tester', '$2a$10$c9c3Tz5e9WQ2qTHJLDr2yO7c0Y9J634owqP5hLylYV21CHuTUXHry', 'test-2'),
(10, 'test-3@tester.com', 'Dave', 'Tester', '$2a$10$HLv2UN9C2P6IGJPO42EGg.AYVFWiVnGpBMtGMAnbQodz5vcRIuzj2', 'test-3');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `long_describtion` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `short_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `web_order`
--

CREATE TABLE `web_order` (
  `id` bigint(20) NOT NULL,
  `address_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `web_order_quantities`
--

CREATE TABLE `web_order_quantities` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkb7b5aavt0mlydpvdiuesa9r8` (`user_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKce3rbi3bfstbvvyne34c1dvyv` (`product_id`);

--
-- Indexes for table `local_user`
--
ALTER TABLE `local_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK46f7ufu7j9nkhuyfly98to4u1` (`email`),
  ADD UNIQUE KEY `UK93d93k106ik2383youkc9bixl` (`username`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKjmivyxk9rmgysrmsqw15lqr5b` (`name`);

--
-- Indexes for table `web_order`
--
ALTER TABLE `web_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK65jlvhv84w95l6dimcc1p6hqr` (`address_id`),
  ADD KEY `FK8mvneqqd44higf18x0m67bg29` (`user_id`);

--
-- Indexes for table `web_order_quantities`
--
ALTER TABLE `web_order_quantities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK654x9lb2ii9jrhsriicg518iw` (`order_id`),
  ADD KEY `FKi7eexulg463xqvxgykc3qqx0a` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `local_user`
--
ALTER TABLE `local_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `web_order`
--
ALTER TABLE `web_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `web_order_quantities`
--
ALTER TABLE `web_order_quantities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FKkb7b5aavt0mlydpvdiuesa9r8` FOREIGN KEY (`user_id`) REFERENCES `local_user` (`id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `FKp7gj4l80fx8v0uap3b2crjwp5` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `web_order`
--
ALTER TABLE `web_order`
  ADD CONSTRAINT `FK65jlvhv84w95l6dimcc1p6hqr` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `FK8mvneqqd44higf18x0m67bg29` FOREIGN KEY (`user_id`) REFERENCES `local_user` (`id`);

--
-- Constraints for table `web_order_quantities`
--
ALTER TABLE `web_order_quantities`
  ADD CONSTRAINT `FK654x9lb2ii9jrhsriicg518iw` FOREIGN KEY (`order_id`) REFERENCES `web_order` (`id`),
  ADD CONSTRAINT `FKi7eexulg463xqvxgykc3qqx0a` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
