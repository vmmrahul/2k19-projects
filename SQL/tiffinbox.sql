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
-- Database: `tiffinbox`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `email`, `password`, `mobile`) VALUES
('Ravleen Kaur', 'ravleen@gmail.com', '123', '7485968574');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryname` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryname`, `description`) VALUES
('Chinese', 'Chinese Food'),
('French', 'French food\r\n'),
('Indian', 'Roti With Dal'),
('Italian', 'Italian Food'),
('Persian', 'Persian food');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `itemid` int(11) NOT NULL,
  `itemname` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `category` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `partnerid` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `availabledays` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `partnertable`
--

CREATE TABLE `partnertable` (
  `partnerid` int(11) NOT NULL,
  `companyname` varchar(100) NOT NULL,
  `ownername` varchar(100) NOT NULL,
  `mobileno` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `location` text NOT NULL,
  `status` varchar(20) NOT NULL,
  `photo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partnertable`
--

INSERT INTO `partnertable` (`partnerid`, `companyname`, `ownername`, `mobileno`, `address`, `city`, `email`, `password`, `location`, `status`, `photo`) VALUES
(1, 'KFC', 'Rajech Gupta', '4152635241', 'Mall Road', 'Amritsar', 'kfc@gmail.com', '12345', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3396.694566665852!2d74.86898301463407!3d31.64221214828261!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x391964a6fd8f866d%3A0xf7b320032756665e!2sKFC!5e0!3m2!1sen!2sin!4v1563776670615!5m2!1sen!2sin', 'Approved', 'partner/abc.jpg'),
(2, ' zomato', 'Namika', '7788995544', 'bus stand,amritsar', 'Amritsar', 'Namika@gmail.com', '12345678', 'https://www.google.com/maps/embed?pb=\r\n!1m18!1m12!1m3!1d3397.1398987040047!2d74.88161281463378!\r\n3d31.630019748885292!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39196352cf6525f5%3A0x3f4411fa6a476a27!2sAmritsar!5e0!3m2!1sen!2sin!4v1563777222084!5m2!1sen!2sin', 'Approved', 'partner/f1.png'),
(3, 'Rome', 'Paris gupta', '1122334455', 'ram bagh', 'Amritsar', 'Paris@gmail.com', '123', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6793.844101854321!2d74.8739605736476!3d31.635984559855398!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3919635129b569c9%3A0x6745193406c30d7d!2sRam+Bagh%2C+Amritsar%2C+Punjab!5e0!3m2!1sen!2sin!4v1563777369062!5m2!1sen!2sin', 'Approved', 'partner/images.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `photo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryname`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemid`),
  ADD KEY `partnerid` (`partnerid`);

--
-- Indexes for table `partnertable`
--
ALTER TABLE `partnertable`
  ADD PRIMARY KEY (`partnerid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `itemid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `partnertable`
--
ALTER TABLE `partnertable`
  MODIFY `partnerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
