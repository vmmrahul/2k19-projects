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
-- Database: `restaurantbilling`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `billid` int(11) NOT NULL,
  `dateofbill` date NOT NULL,
  `modeofpayment` varchar(100) NOT NULL,
  `typeoforder` varchar(100) NOT NULL,
  `cashcollected` float NOT NULL,
  `cashreturned` float NOT NULL,
  `address` varchar(500) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `totalbill` float NOT NULL,
  `tax` float NOT NULL,
  `status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`billid`, `dateofbill`, `modeofpayment`, `typeoforder`, `cashcollected`, `cashreturned`, `address`, `mobile`, `totalbill`, `tax`, `status`) VALUES
(17, '2019-07-10', 'Cash', 'Dining', 1500, 0, 'yityedghiuyegw', '6767676767', 1480.5, 5, 'Pending'),
(18, '2019-07-10', 'Cash', 'Dining', 1000, 0, 'home', '9023244059', 945, 5, 'Pending'),
(19, '2019-07-10', 'Credit Card', 'Take Away', 0, 0, '', '9023244059', 105, 5, 'Pending'),
(20, '2019-07-10', 'Credit Card', 'Home Delivery', 0, 0, 'aghij', '9814444059', 1249.5, 5, 'Done'),
(23, '2019-07-11', 'Cash', 'Take Away', 1500, 0, '', '4563786599', 1207.5, 5, 'Done'),
(24, '2019-07-11', 'Cash', 'Home Delivery', 1500, 0, 'rajan nagar', '7009882611', 1417.5, 5, 'Pending'),
(25, '2019-07-11', 'Cash', 'Take Away', 2100, 0, 'rajan nagar', '7009882611', 2047.5, 5, 'Pending'),
(26, '2019-07-13', 'Cash', 'Dining', 2600, 0, 'hdsjgsj', '9023244059', 2572.5, 5, 'Pending'),
(27, '2020-02-17', 'Cash', 'Dining', 1155, 0, 'dfg', '7087240207', 1155, 5, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `billdetails`
--

CREATE TABLE `billdetails` (
  `billdetailid` int(11) NOT NULL,
  `billid` int(11) NOT NULL,
  `menuid` int(11) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalprice` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billdetails`
--

INSERT INTO `billdetails` (`billdetailid`, `billid`, `menuid`, `price`, `quantity`, `totalprice`) VALUES
(3, 23, 20, 250, 1, 250),
(4, 23, 23, 100, 3, 300),
(6, 24, 20, 250, 3, 750),
(7, 24, 23, 100, 2, 200),
(9, 25, 20, 250, 3, 750),
(10, 25, 23, 100, 2, 200),
(13, 26, 21, 180, 5, 900),
(14, 26, 7, 110, 5, 550),
(15, 26, 20, 250, 4, 1000),
(16, 27, 20, 250, 4, 1000),
(17, 27, 23, 100, 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menuid` int(11) NOT NULL,
  `itemname` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menuid`, `itemname`, `description`, `price`) VALUES
(7, 'burger', 'extra tomota slice\n\n\n\n\n\n', 110),
(20, 'dosa', 'with extra sambar', 250),
(21, 'pav bhaji', 'with extra pav', 180),
(23, 'pasta', 'white sauce', 100),
(26, 'pizza', 'extra toppings\n', 190),
(27, 'cold coffee', 'chilled\n', 90),
(28, 'french fries', 'with chilli sauce\n', 80),
(29, 'tea', 'extra strong\n', 30);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `email` varchar(300) NOT NULL,
  `name` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`email`, `name`, `password`, `mobile`, `position`) VALUES
('abc@gmail.com', 'demo', '123', '6280995201', 'Cashier'),
('abcd@gmail.com', 'demo', '1234', '6280995201', 'Staff'),
('abcde@gmail.com', 'demo', '1234', '6280995201', 'Kitchen'),
('harpal@gmail.com', 'harpal', '1234', '7087240207', 'Cashier'),
('ritu@gmail.com', 'ritu', '123', '9023244059', 'Cashier'),
('sourav@gmail.com', 'sourav', 'saurav', '6655443377', 'Staff'),
('tarun@gmail.com', 'tarun', 'tarun', '3434343434', 'Kitchen'),
('yogesh@gmail.com', 'yogesh', 'yogesh', '1234554321', 'Cashier');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`billid`);

--
-- Indexes for table `billdetails`
--
ALTER TABLE `billdetails`
  ADD PRIMARY KEY (`billdetailid`),
  ADD KEY `billid` (`billid`),
  ADD KEY `menuid` (`menuid`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menuid`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `billid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `billdetails`
--
ALTER TABLE `billdetails`
  MODIFY `billdetailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billdetails`
--
ALTER TABLE `billdetails`
  ADD CONSTRAINT `fkbillidbilldetail` FOREIGN KEY (`billid`) REFERENCES `bill` (`billid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flmeniidbilldetail` FOREIGN KEY (`menuid`) REFERENCES `menu` (`menuid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
