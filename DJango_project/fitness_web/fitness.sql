-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 15, 2020 at 07:05 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fitness`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admins`
--

CREATE TABLE `Admins` (
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `type` varchar(30) NOT NULL,
  `otp` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Admins`
--

INSERT INTO `Admins` (`email`, `password`, `mobile`, `type`, `otp`) VALUES
('admin@gmail.com', '1234', '6280995201', 'Admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Exercise`
--

CREATE TABLE `Exercise` (
  `EID` int(11) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Description` text NOT NULL,
  `caloriesburnt` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Exercise`
--

INSERT INTO `Exercise` (`EID`, `Title`, `Description`, `caloriesburnt`) VALUES
(1, 'cycling', 'that intensity should be at 200 watts or greater.', 952),
(2, 'skiing', 'his all depends on your experience as a skier. ', 850),
(3, 'Rowing', 'Again, 200 watts is the benchmark ', 816),
(4, 'Jumping rope', 'This should be at a moderate pace—approximately 100 skips per minute', 802),
(5, 'Kickboxing', 'Thai, fit into this category too', 700),
(6, 'Swimming', 'Freestyle works, but you should aim for a vigorous 75 yards per minute pace', 680),
(7, 'Outdoor bicycling', 'vigorous pace gets your heart rate soaring', 680);

-- --------------------------------------------------------

--
-- Table structure for table `Exercise_done`
--

CREATE TABLE `Exercise_done` (
  `id` int(11) NOT NULL,
  `Excerciseid` int(11) NOT NULL,
  `Dateofexcercise` date NOT NULL,
  `Email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Exercise_done`
--

INSERT INTO `Exercise_done` (`id`, `Excerciseid`, `Dateofexcercise`, `Email`) VALUES
(6, 7, '2020-05-13', 'abc@gmail.com'),
(7, 6, '2020-05-14', 'abc@gmail.com'),
(8, 5, '2020-05-14', 'abc@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `Food`
--

CREATE TABLE `Food` (
  `Foodid` int(11) NOT NULL,
  `Foodname` varchar(100) NOT NULL,
  `Calorie` float NOT NULL,
  `description` text NOT NULL,
  `Carbs` varchar(100) NOT NULL,
  `Protein` float NOT NULL,
  `fats` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Food`
--

INSERT INTO `Food` (`Foodid`, `Foodname`, `Calorie`, `description`, `Carbs`, `Protein`, `fats`) VALUES
(1, 'Milk Chocolate', 535, 'Milk Chocolate\r\n', '59.4', 7.65, 29.66),
(2, 'White Chocolate', 539, 'Sweets\r\n', '59.24', 5.87, 32.09),
(3, 'Sherbet Orange', 144, 'Sweets\r\n', '30.4', 1.1, 2),
(4, 'Oil Spotted Seal', 894, 'American Indian\r\n', '0.1', 0, 99.32),
(5, 'Fish Whitefish Eggs', 104, 'American Indian\r\n', '4.89', 14.66, 2.88),
(6, 'Lemons', 29, 'Fruits\r\n', '9.32', 1.1, 0.3),
(7, 'Lemon Juice Raw', 22, 'Fruits', '6.9', 0.35, 0.24);

-- --------------------------------------------------------

--
-- Table structure for table `Food_consumed`
--

CREATE TABLE `Food_consumed` (
  `FCID` int(11) NOT NULL,
  `Foodid` int(11) NOT NULL,
  `Qty` int(11) NOT NULL,
  `Dateofconsumption` date NOT NULL,
  `timeofconsumption` time NOT NULL,
  `Email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Food_consumed`
--

INSERT INTO `Food_consumed` (`FCID`, `Foodid`, `Qty`, `Dateofconsumption`, `timeofconsumption`, `Email`) VALUES
(1, 1, 45, '2020-05-13', '18:02:40', 'abc@gmail.com'),
(2, 4, 10, '2020-05-13', '18:02:46', 'abc@gmail.com'),
(3, 1, 45, '2020-05-14', '03:47:10', 'abc@gmail.com'),
(4, 3, 45, '2020-05-14', '04:13:46', 'abc@gmail.com'),
(5, 5, 10, '2020-05-14', '04:15:49', 'abc@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `email` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `password` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `waiste` float NOT NULL,
  `biceps` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`email`, `name`, `mobile`, `password`, `age`, `height`, `weight`, `waiste`, `biceps`) VALUES
('abc@gmail.com', 'Sunny', '6280995201', '1234', 23, 172, 64, 34, 22);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admins`
--
ALTER TABLE `Admins`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `Exercise`
--
ALTER TABLE `Exercise`
  ADD PRIMARY KEY (`EID`);

--
-- Indexes for table `Exercise_done`
--
ALTER TABLE `Exercise_done`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Food`
--
ALTER TABLE `Food`
  ADD PRIMARY KEY (`Foodid`);

--
-- Indexes for table `Food_consumed`
--
ALTER TABLE `Food_consumed`
  ADD PRIMARY KEY (`FCID`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Exercise`
--
ALTER TABLE `Exercise`
  MODIFY `EID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Exercise_done`
--
ALTER TABLE `Exercise_done`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Food`
--
ALTER TABLE `Food`
  MODIFY `Foodid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Food_consumed`
--
ALTER TABLE `Food_consumed`
  MODIFY `FCID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
