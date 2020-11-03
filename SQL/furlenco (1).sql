-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2020 at 07:13 AM
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
-- Database: `furlenco`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `type` varchar(500) NOT NULL,
  `mobile` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`, `password`, `type`, `mobile`) VALUES
('manisha.attri96@gmail.com', 'mishu', 'Sub Admin', '8146130143'),
('ritika.dogra23@gmail.com', 'ritika', 'Sub Admin', '9530769265'),
('shivalisharma295@gmail.com', 'shivali', 'Admin', '9815877737'),
('yashima.arora18@gmail.com', 'yashima', 'Sub Admin', '9464169010');

-- --------------------------------------------------------

--
-- Table structure for table `billdetails`
--

CREATE TABLE `billdetails` (
  `billdetailsid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `renttype` varchar(200) NOT NULL,
  `froms` date NOT NULL,
  `tos` date NOT NULL,
  `month` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `billid` int(11) NOT NULL,
  `fid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `billid` int(11) NOT NULL,
  `totalamount` float NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `paystatus` varchar(100) NOT NULL,
  `typeofbill` varchar(100) NOT NULL,
  `dateoforder` date NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catname` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `photo` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catname`, `description`, `photo`) VALUES
('Almirahs', 'A free-standing cupboard or wardrobe.', 'categoryphotos/6191almirahmain.jpg'),
('Beds', 'A bed is a piece of furniture which is used as a place to sleep or relax.', 'categoryphotos/6517mainbed.jpg'),
('Desk', 'A desk or bureau is a piece of furniture with a flat table-style work surface used in a school, office, home or the like for academic, professional or domestic activities such as reading, writing, or using equipment such as a computer.[', 'categoryphotos/2381deskmain.jpg'),
('Seating', 'One of the basic pieces of furniture, a chair is a type of seat.', 'categoryphotos/3785seatmain.jpg'),
('Tables', 'A table is an item of furniture with a flat top and one or more legs, used as a surface for working at, eating from or on which to place things.', 'categoryphotos/5753tablemain.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `furniture`
--

CREATE TABLE `furniture` (
  `furnitureid` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `catname` varchar(500) NOT NULL,
  `weight` varchar(500) NOT NULL,
  `dimensions` varchar(500) NOT NULL,
  `coverphoto` varchar(500) NOT NULL,
  `Qtyavailable` int(11) NOT NULL,
  `perdayrent` float NOT NULL,
  `permonthrent` float NOT NULL,
  `halfyearrent` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `furniture`
--

INSERT INTO `furniture` (`furnitureid`, `title`, `catname`, `weight`, `dimensions`, `coverphoto`, `Qtyavailable`, `perdayrent`, `permonthrent`, `halfyearrent`) VALUES
(1, 'Wooden Almirah with 4 doors', 'Almirahs', '107.5kg', '72', 'furniturephotos/74744wood1.jpg', 7, 200, 2000, 1100),
(2, 'Wooden Almirah with 4 doors', 'Almirahs', '110.3kg', '72', 'furniturephotos/5984wood2.jpg', 5, 150, 3000, 1500),
(3, 'Wooden Almirah with 4 doors', 'Almirahs', '105.3kg', '73', 'furniturephotos/72084wood3.jpg', 4, 100, 3500, 1750),
(4, 'Wooden Almirah with 4 doors', 'Almirahs', '120kg', '68', 'furniturephotos/81714wood4.jpg', 6, 100, 2500, 1200),
(5, 'Steel Almirah', 'Almirahs', '115kg', '101', 'furniturephotos/6472steel1.jpg', 3, 120, 1500, 750),
(6, 'Steel Almirah', 'Almirahs', '103kg', '107', 'furniturephotos/6045steel2.jpg', 3, 100, 1750, 950),
(7, 'Steel Almirah', 'Almirahs', '130kg', '112', 'furniturephotos/1054steel3.jpg', 3, 150, 1800, 1100),
(8, 'Steel Almirah', 'Almirahs', '107kg', '110', 'furniturephotos/8090steel4.jpg', 2, 170, 2000, 1495),
(9, 'Bunk Bed', 'Beds', '200pounds', '100', 'furniturephotos/1901bunk1.jpg', 5, 120, 1500, 750),
(10, 'Bunk Bed', 'Beds', '150pounds', '110x200', 'furniturephotos/39bunk2.jpg', 6, 150, 1600, 800),
(11, 'Bunk Bed', 'Beds', '130pounds', '150x160', 'furniturephotos/5603bunk4.jpg', 3, 150, 1700, 650),
(12, 'Single Beds', 'Beds', '30kg', '91x800', 'furniturephotos/6468singlebed1.jpg', 4, 105, 1500, 600),
(13, 'Single Beds', 'Beds', '14kg', '85x100', 'furniturephotos/4595singlebed2.jpg', 6, 100, 1600, 450),
(14, 'Single Beds', 'Beds', '20kg', '80x99', 'furniturephotos/9347singlebed3.jpg', 5, 103, 1500, 500),
(18, 'Computer Desk', 'Desk', '50kg', '111x120', 'furniturephotos/7138comp1.jpg', 5, 200, 1000, 750),
(19, 'Computer Desk', 'Desk', '60kg', '120x115', 'furniturephotos/9448comp2.jpg', 5, 150, 1500, 900),
(20, 'Computer Desk', 'Desk', '45kg', '110x103', 'furniturephotos/9219comp3.jpg', 5, 120, 1200, 600),
(21, 'Computer Desk', 'Desk', '65kg', '105x114', 'furniturephotos/2164comp5.jpg', 5, 110, 1300, 550),
(22, 'Computer Desk', 'Desk', '50kg', '99x110', 'furniturephotos/3670comp7.jpg', 5, 105, 1450, 750),
(23, 'test', 'Almirahs', '45', '4567', 'furniturephotos/35724wood3.jpg', 5, 20, 100, 50),
(24, 'test', 'Almirahs', '45', '4567', 'furniturephotos/53924wood3.jpg', 5, 20, 100, 50);

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `pid` int(11) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `remarks` text NOT NULL,
  `furnitureid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`pid`, `photo`, `remarks`, `furnitureid`) VALUES
(3, 'furniturephotos/53784wood1open.jpg', 'Spacious Almirah.', 2),
(4, 'furniturephotos/2813bunk3.jpg', 'Beautiful bed for kids', 9),
(5, 'furniturephotos/66464wood1.jpg', 'Wooden almirahs have long life.', 1),
(6, 'furniturephotos/12514wood1open.jpg', 'Wooden almirahs have long life.', 1),
(8, 'furniturephotos/6565bunk5.jpg', 'Beautiful bed for kids', 10),
(9, 'furniturephotos/73714wood1.jpg', 'Wooden almirahs have long life.', 1),
(10, 'furniturephotos/8414comp6.jpg', 'Best Wooden Computer Desk', 18),
(11, 'furniturephotos/1424comp1.jpg', 'Best Wooden Computer Desk', 18),
(12, 'furniturephotos/5652comp2.jpg', 'Best Wooden Computer Desk', 18),
(13, 'furniturephotos/4247comp7.jpg', 'Best Wooden Computer Desk', 19),
(14, 'furniturephotos/5970deskmain.jpg', 'Best Wooden Computer Desk', 19),
(15, 'furniturephotos/7750comp2.jpg', 'Best Wooden Computer Desk', 19),
(16, 'furniturephotos/6297comp10.jpg', 'Best Wooden Computer Desk', 20),
(17, 'furniturephotos/5464deskmain.jpg', 'Best Wooden Computer Desk', 20),
(18, 'furniturephotos/2431comp2.jpg', 'Best Wooden Computer Desk', 20),
(19, 'furniturephotos/9668comp6.jpg', 'Best Wooden Computer Desk', 21),
(20, 'furniturephotos/4952comp15.jpg', 'Best Wooden Computer Desk', 21),
(21, 'furniturephotos/8373comp15.jpg', 'Best Wooden Computer Desk', 22),
(22, 'furniturephotos/7525comp13.jpg', 'Best Wooden Computer Desk', 22),
(23, 'furniturephotos/41784wood9.jpg', 'Wooden almirahs have long life.', 2),
(24, 'furniturephotos/33204wood12.jpg', 'Wooden almirahs have long life.', 3),
(25, 'furniturephotos/80864wood5.jpg', 'Wooden almirahs have long life.', 3),
(26, 'furniturephotos/45784wood7.jpg', 'Wooden almirahs have long life.', 4),
(27, 'furniturephotos/52684wood8.jpg', 'Wooden almirahs have long life.', 4),
(28, 'furniturephotos/494steel8.jpg', 'Two door steel almirah', 5),
(29, 'furniturephotos/3938steel10.jpg', 'Two door steel almirah', 5),
(30, 'furniturephotos/7992steel2.jpg', 'Two door steel almirah', 7),
(31, 'furniturephotos/7478steel7.jpg', 'Two door steel almirah', 7),
(33, 'furniturephotos/5680steel10.jpg', 'Two door steel almirah', 8),
(34, 'furniturephotos/4319steel11.jpg', 'Two door steel almirah', 8),
(35, 'furniturephotos/9463bunk8.jpg', 'Beautiful bed for kids', 9),
(36, 'furniturephotos/652bunk9.jpg', 'Beautiful bed for kids', 9),
(37, 'furniturephotos/6038bunk12.jpg', 'Beautiful Brown bunk bed for kids', 10),
(38, 'furniturephotos/9550bunk11.jpg', 'Beautiful  brown bed for kids', 10),
(39, 'furniturephotos/8759bunk16.jpg', 'White bunk bed for kids', 11),
(40, 'furniturephotos/5452bunk15.jpg', 'White bunk bed for kids', 11),
(41, 'furniturephotos/4790singlebed2.jpg', 'single bed', 12),
(42, 'furniturephotos/621singlebed5.jpg', 'Single bed with a beautiful bedsheet.', 12),
(43, 'furniturephotos/242singlebed6.jpg', 'single bed', 13),
(44, 'furniturephotos/9180singlebed7.jpg', 'single bed', 13),
(45, 'furniturephotos/9559singlebed8.jpg', 'Brown single beds', 14),
(46, 'furniturephotos/9811singlebed5.jpg', 'Brown single beds', 14);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `mobile` varchar(12) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `address` varchar(500) NOT NULL,
  `landmark` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `pan` int(11) NOT NULL,
  `adhaar` int(11) NOT NULL,
  `remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`mobile`, `name`, `email`, `address`, `landmark`, `password`, `photo`, `pan`, `adhaar`, `remarks`) VALUES
('6280995201', 'abc', 'abc@gmail.com', 'amritsar', 'amritsar', '1234', 'userpics/6589mr-cup-fabien-barral-Mwuod2cm8g4-unsplash.jpg', 2147483647, 2147483647, 'demo'),
('9815877737', 'Shivali Devgan', 'shivali@gmail.com', '4416,amritsar', 'near khalsa clg', 'shiya', 'userpics/2272w1.jpg', 123654789, 14526987, 'goodd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `billdetails`
--
ALTER TABLE `billdetails`
  ADD PRIMARY KEY (`billdetailsid`),
  ADD KEY `billid` (`billid`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`billid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catname`);

--
-- Indexes for table `furniture`
--
ALTER TABLE `furniture`
  ADD PRIMARY KEY (`furnitureid`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`mobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billdetails`
--
ALTER TABLE `billdetails`
  MODIFY `billdetailsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `billid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `furniture`
--
ALTER TABLE `furniture`
  MODIFY `furnitureid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billdetails`
--
ALTER TABLE `billdetails`
  ADD CONSTRAINT `billdetails_ibfk_1` FOREIGN KEY (`billid`) REFERENCES `bills` (`billid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
