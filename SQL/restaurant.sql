-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2020 at 07:14 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `date_of_bill` date NOT NULL,
  `gst` float NOT NULL,
  `payable` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `detail_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `p_id` float NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category_table`
--

CREATE TABLE `category_table` (
  `c_name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_table`
--

INSERT INTO `category_table` (`c_name`, `description`) VALUES
('south', 'itly\n'),
('East', 'Rice\ndal\n'),
('Bihar', 'Litti\n'),
('Kolkata', 'rasgulla\n');

-- --------------------------------------------------------

--
-- Table structure for table `product_tabel`
--

CREATE TABLE `product_tabel` (
  `pid` int(11) NOT NULL,
  `pname` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `mrp` float NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(200) NOT NULL,
  `c_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_tabel`
--

INSERT INTO `product_tabel` (`pid`, `pname`, `price`, `discount`, `mrp`, `description`, `photo`, `c_name`) VALUES
(1, 'ewf', 454, 45, 4545, 'sdmdoijsdjdiowj', 'photo', 'East'),
(2, 'the', 12, 3, 25, 'sell', 'photo', 'c_name');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`detail_id`);

--
-- Indexes for table `product_tabel`
--
ALTER TABLE `product_tabel`
  ADD PRIMARY KEY (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_tabel`
--
ALTER TABLE `product_tabel`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
