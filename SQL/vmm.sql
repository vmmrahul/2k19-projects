-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2020 at 07:15 AM
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
-- Database: `vmm`
--

-- --------------------------------------------------------

--
-- Table structure for table `desktops`
--

CREATE TABLE `desktops` (
  `pc_id` int(11) NOT NULL,
  `pc_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `mother_board` varchar(300) NOT NULL,
  `processor` varchar(100) NOT NULL,
  `ram` varchar(100) NOT NULL,
  `ishdd` varchar(200) NOT NULL,
  `hddgb` varchar(100) NOT NULL,
  `hddcount` varchar(100) NOT NULL,
  `isssd` varchar(200) NOT NULL,
  `ssdcount` varchar(100) NOT NULL,
  `ssdgb` varchar(100) NOT NULL,
  `lcd` varchar(100) NOT NULL,
  `km` varchar(100) NOT NULL,
  `ups` varchar(100) NOT NULL,
  `remarks` text NOT NULL,
  `os` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `desktops`
--

INSERT INTO `desktops` (`pc_id`, `pc_name`, `location`, `mother_board`, `processor`, `ram`, `ishdd`, `hddgb`, `hddcount`, `isssd`, `ssdcount`, `ssdgb`, `lcd`, `km`, `ups`, `remarks`, `os`) VALUES
(4, 'Lab-2_1', 'lab2', 'Asus h-61', 'i3', '4 GB', 'no', 'No', '0', 'yes', '1', '250 GB', 'yes', 'yes', 'yes', 'OK', ''),
(5, 'Ulla Sloan', 'lab1', 'Sunt modi id quod de', 'i3', '4 GB', 'no', 'No', '0', 'yes', '1', '500 GB', 'yes', 'yes', 'yes', 'Vel quam consequuntu', ''),
(6, 'dcmdlkfm', 'lab1', 'dvkm', 'pentium', '2 GB', 'yes', '160 GB', '4', 'no', '0', 'No', 'yes', 'yes', 'yes', 'sdflknjkn', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `desktops`
--
ALTER TABLE `desktops`
  ADD PRIMARY KEY (`pc_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `desktops`
--
ALTER TABLE `desktops`
  MODIFY `pc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
