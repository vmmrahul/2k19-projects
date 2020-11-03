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
-- Database: `onlineshopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `name` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `name`, `usertype`) VALUES
('admin', '12345', 'admin', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `billdetails`
--

CREATE TABLE `billdetails` (
  `detailid` int(11) NOT NULL,
  `billid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `qty` int(2) NOT NULL,
  `discount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billdetails`
--

INSERT INTO `billdetails` (`detailid`, `billid`, `productid`, `photo`, `price`, `qty`, `discount`) VALUES
(1, 2, 6, 'uploads/180.jpg', 354, 1, 5),
(2, 2, 7, 'uploads/ic.jpg', 5657, 1, 7),
(3, 3, 6, 'uploads/180.jpg', 354, 1, 5),
(4, 3, 7, 'uploads/ic.jpg', 5657, 1, 7),
(5, 3, 5, 'uploads/apple.jpg', 2434, 1, 5),
(6, 3, 9, 'uploads/170.jpg', 43636, 1, 54),
(7, 3, 1, 'uploads/ic.jpg', 35000, 1, 20),
(8, 3, 4, 'uploads/bullet.png', 100, 1, 0),
(9, 4, 6, 'uploads/180.jpg', 354, 1, 5),
(10, 4, 7, 'uploads/ic.jpg', 5657, 1, 7),
(11, 4, 5, 'uploads/apple.jpg', 2434, 1, 5),
(12, 4, 9, 'uploads/170.jpg', 43636, 1, 54),
(13, 4, 1, 'uploads/ic.jpg', 35000, 1, 20),
(14, 4, 4, 'uploads/bullet.png', 100, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `billid` int(11) NOT NULL,
  `dateofbill` timestamp NOT NULL DEFAULT current_timestamp(),
  `totalqty` int(11) NOT NULL,
  `totalamount` float NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `typeofbill` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`billid`, `dateofbill`, `totalqty`, `totalamount`, `email`, `status`, `typeofbill`) VALUES
(2, '2019-10-21 05:39:30', 2, 5597, 'parwindersingh@vmmeducation.com', 'pending', 'cod'),
(3, '2019-10-21 05:40:20', 6, 55982, 'parwindersingh@vmmeducation.com', 'pending', 'onlinepayemnt'),
(4, '2019-10-21 05:42:26', 6, 55982, 'parwindersingh@vmmeducation.com', 'pending', 'onlinepayemnt');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryid` int(11) NOT NULL,
  `categoryname` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `supercategory` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryid`, `categoryname`, `description`, `supercategory`) VALUES
(6, 'Electronics', 'frtewt', 'Men'),
(7, 'Electronics', 'frtewt', 'Women'),
(12, 'Toys', 'sdgtdsg', 'Kids'),
(13, 'shirt', 'shirt', 'Men'),
(14, 'shirt', 'shirt', 'Men');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productid` int(11) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `discount` float NOT NULL,
  `description` text NOT NULL,
  `categoryid` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productid`, `productname`, `price`, `discount`, `description`, `categoryid`, `photo`) VALUES
(1, 'One Plus 7', 35000, 20, 'frtewt', 12, 'uploads/ic.jpg'),
(2, 'One Plus 7 Pro', 45000, 20, 'f7547fdsf', 6, 'uploads/apple.jpg'),
(4, 'q', 100, 0, 'sdfds', 12, 'uploads/bullet.png'),
(5, 'asdsa', 2434, 5, 'safaf', 7, 'uploads/apple.jpg'),
(6, 'safr', 354, 5, '545', 6, 'uploads/180.jpg'),
(7, 'fdsf', 5657, 7, 'gfjgfj', 6, 'uploads/ic.jpg'),
(8, 'asfds', 456547, 0, '7657', 6, 'uploads/170.jpg'),
(9, 'saff', 43636, 54, 'sdsg', 7, 'uploads/170.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `password`, `name`) VALUES
('parwindersingh@vmmeducation.com', 'e10adc3949ba59abbe56e057f20f883e', 'Parwinder Singh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `billdetails`
--
ALTER TABLE `billdetails`
  ADD PRIMARY KEY (`detailid`),
  ADD KEY `billid` (`billid`),
  ADD KEY `productid` (`productid`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`billid`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productid`),
  ADD KEY `categoryid` (`categoryid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billdetails`
--
ALTER TABLE `billdetails`
  MODIFY `detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `billid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billdetails`
--
ALTER TABLE `billdetails`
  ADD CONSTRAINT `billdetails_ibfk_1` FOREIGN KEY (`billid`) REFERENCES `bills` (`billid`),
  ADD CONSTRAINT `billdetails_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`);

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`categoryid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
