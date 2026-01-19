-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2026 at 09:06 AM
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
-- Database: `company`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `manufact` (IN `name` VARCHAR(50), IN `address` VARCHAR(100), IN `contact` VARCHAR(50))   BEGIN
    INSERT INTO manufacturer(name, address, contact)
    VALUES(name, address, contact);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`id`, `name`, `address`, `contact`, `created_at`, `updated_at`) VALUES
(1, 'bashundhara', 'dhaka', '01774500817', '2026-01-19 06:54:32', '2026-01-19 06:54:32'),
(2, 'meghna', 'dhaka', '01774500818', '2026-01-19 06:54:32', '2026-01-19 06:54:32'),
(3, 'partex', 'dhaka', '01774500820', '2026-01-19 06:54:48', '2026-01-19 06:54:48'),
(4, 'walton', 'dhaka', '01774500821', '2026-01-19 06:54:48', '2026-01-19 06:54:48');

--
-- Triggers `manufacturer`
--
DELIMITER $$
CREATE TRIGGER `SHAMIM` AFTER DELETE ON `manufacturer` FOR EACH ROW BEGIN
DELETE FROM product WHERE product.mid = old.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `mid` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `mid`, `created_at`, `updated_at`) VALUES
(1, 'cement', 3000.00, 1, '2026-01-19 07:02:59', '2026-01-19 07:02:59'),
(2, 'steel', 6000.00, 1, '2026-01-19 07:02:59', '2026-01-19 07:02:59'),
(3, 'cement', 8000.00, 2, '2026-01-19 07:02:59', '2026-01-19 07:02:59'),
(4, 'beverages', 2000.00, 2, '2026-01-19 07:02:59', '2026-01-19 07:02:59'),
(5, 'sofa', 50000.00, 3, '2026-01-19 07:02:59', '2026-01-19 07:02:59'),
(6, 'bed', 4000.00, 3, '2026-01-19 07:02:59', '2026-01-19 07:02:59'),
(7, 'laptop', 50000.00, 4, '2026-01-19 07:04:02', '2026-01-19 07:04:02'),
(8, 'phone', 3000.00, 4, '2026-01-19 07:04:02', '2026-01-19 07:04:02');

-- --------------------------------------------------------

--
-- Stand-in structure for view `shamim`
-- (See below for the actual view)
--
CREATE TABLE `shamim` (
`id` int(11)
,`name` varchar(100)
,`price` decimal(10,2)
,`mid` int(10)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'shamim', 'shamim', '2026-01-19 06:53:55', '2026-01-19 06:53:55'),
(2, 'fahim', 'fahim', '2026-01-19 06:53:55', '2026-01-19 06:53:55');

-- --------------------------------------------------------

--
-- Structure for view `shamim`
--
DROP TABLE IF EXISTS `shamim`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `shamim`  AS SELECT `product`.`id` AS `id`, `product`.`name` AS `name`, `product`.`price` AS `price`, `product`.`mid` AS `mid`, `product`.`created_at` AS `created_at`, `product`.`updated_at` AS `updated_at` FROM `product` WHERE `product`.`price` > 5000 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
