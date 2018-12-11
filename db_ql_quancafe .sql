-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2018 at 02:46 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ql_quancafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `ID` int(11) NOT NULL,
  `username` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`ID`, `username`, `password`, `name`) VALUES
(1, 'admin', 'admin', 'Admin'),
(2, 'huy123', '123456', 'Huy'),
(3, 'son123', '123456', 'Son');

-- --------------------------------------------------------

--
-- Table structure for table `drinks`
--

CREATE TABLE `drinks` (
  `ID` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `drinks`
--

INSERT INTO `drinks` (`ID`, `name`, `price`, `start_date`, `end_date`) VALUES
(4, 'Cà phê', 40000, '2018-01-01', '2018-12-12'),
(5, 'Bạc xỉu', 30000, '2017-01-01', '2018-12-12'),
(6, 'Cà phê đen', 20000, '2018-01-01', '2018-06-06'),
(7, 'Cà phê đá', 40000, '2017-12-12', '2018-01-31');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `ID` int(11) NOT NULL,
  `account_ID` int(11) NOT NULL,
  `invoice_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tables_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `total_price` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`ID`, `account_ID`, `invoice_date`, `tables_id`, `status`, `total_price`) VALUES
(8, 1, '2018-01-05 00:04:50', 1, 1, 260000),
(9, 1, '2018-01-05 00:04:47', 2, 1, 200000),
(10, 1, '2018-01-05 00:04:43', 5, 1, 170000),
(11, 1, '2018-01-05 00:07:15', 2, 1, 300000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `drinks_ID` int(11) NOT NULL,
  `count` int(50) NOT NULL,
  `invoice_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ID`, `drinks_ID`, `count`, `invoice_ID`) VALUES
(13, 4, 1, 8),
(14, 6, 1, 8),
(15, 5, 1, 9),
(16, 7, 1, 10),
(17, 6, 1, 11),
(18, 4, 1, 11),
(19, 5, 1, 11),
(20, 7, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `ID` int(11) NOT NULL,
  `table_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`ID`, `table_name`, `note`, `status`) VALUES
(1, 'Bàn 1', '', 0),
(2, 'Bàn 2', '', 0),
(3, 'Bàn 3', '', 0),
(4, 'Bàn 4', '', 0),
(5, 'Bàn 5', '5 người', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `drinks`
--
ALTER TABLE `drinks`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `account_ID` (`account_ID`),
  ADD KEY `tables_id` (`tables_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `drinks_ID` (`drinks_ID`),
  ADD KEY `invoice_ID` (`invoice_ID`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `drinks`
--
ALTER TABLE `drinks`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`account_ID`) REFERENCES `account` (`ID`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`tables_id`) REFERENCES `tables` (`ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`drinks_ID`) REFERENCES `drinks` (`ID`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`invoice_ID`) REFERENCES `invoice` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
