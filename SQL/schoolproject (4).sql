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
-- Database: `schoolproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`, `password`, `name`, `type`, `status`, `photo`) VALUES
('abc@gmail.com', '1234', 'abc', 'Admin', 'Active', 'uploadfile/admin/jean-wimmerlin-YxDENE4HgMM-unsplash.jpg'),
('rkb@gmail.com', '1234', 'rkb', 'Admin', 'Active', 'uploadfile/admin/r.jpg'),
('yam@gmail.com', '1234', 'rkb', 'Sub-Admin', 'Active', 'uploadfile/admin/christoph-schulz-wJ6xyh1YMxU-unsplash.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `cid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`cid`, `name`) VALUES
(4, 'One'),
(5, 'Two'),
(6, 'Three'),
(9, 'Four');

-- --------------------------------------------------------

--
-- Table structure for table `coursefee`
--

CREATE TABLE `coursefee` (
  `feeid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `fee` float NOT NULL,
  `sessionid` int(11) NOT NULL,
  `dueday` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coursefee`
--

INSERT INTO `coursefee` (`feeid`, `cid`, `fee`, `sessionid`, `dueday`) VALUES
(32, 4, 150000, 17, 30);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `sectionid` int(11) NOT NULL,
  `section` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`sectionid`, `section`) VALUES
(3, 'A'),
(7, 'B'),
(8, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sessionid` int(11) NOT NULL,
  `session` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sessionid`, `session`) VALUES
(17, '2018-2019');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`name`) VALUES
('Andhra Pradesh'),
('Arunachal Pradesh'),
('Assam'),
('Bihar'),
('Chhattisgarh'),
('Goa'),
('Gujarat'),
('Haryana'),
('Himachal Pradesh'),
('Jammu and Kashmir'),
('Jharkhand'),
('Karnataka'),
('Kerala'),
('Madhya Pradesh'),
('Maharashtra'),
('Manipur'),
('Meghalaya'),
('Mizoram'),
('Nagaland'),
('Orissa'),
('Punjab'),
('Rajasthan'),
('Sikkim'),
('Tamil Nadu'),
('Tripura'),
('Uttarakhand'),
('Uttar Pradesh'),
('West Bengal'),
('Telangana'),
('Andaman and Nicobar Islands'),
('Chandigarh'),
('Dadra and Nagar Haveli'),
('Daman and Diu'),
('Delhi'),
('Lakshadweep'),
('Pondicherry');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentid` int(11) NOT NULL,
  `admissiono` int(11) NOT NULL,
  `rollno` bigint(20) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `fathersname` varchar(100) NOT NULL,
  `mothersname` varchar(100) NOT NULL,
  `gender` varchar(500) NOT NULL,
  `dob` date NOT NULL,
  `fatheroccupation` varchar(100) NOT NULL,
  `motheroccupation` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `fatherphone` varchar(100) NOT NULL,
  `motherno` varchar(100) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `adharno` varchar(111) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `classofwithdraw` varchar(100) DEFAULT NULL,
  `dateofwithdraw` date DEFAULT NULL,
  `dateofadmission` date NOT NULL,
  `admissionby` varchar(100) NOT NULL,
  `sectionid` int(11) NOT NULL,
  `sessionid` int(11) NOT NULL,
  `registationno` varchar(200) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `state` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentid`, `admissiono`, `rollno`, `firstname`, `lastname`, `fathersname`, `mothersname`, `gender`, `dob`, `fatheroccupation`, `motheroccupation`, `address`, `fatherphone`, `motherno`, `nationality`, `adharno`, `photo`, `classofwithdraw`, `dateofwithdraw`, `dateofadmission`, `admissionby`, `sectionid`, `sessionid`, `registationno`, `cid`, `state`, `pin`) VALUES
(13, 1, 1, 'RAHUL', 'SINGH', 'DEMO4', 'DEMO5', 'Male', '2019-12-31', 'WORKER', 'HOUSE WIFE', '999', '2222222222', '7777777777', 'INDIA', '11111111111111', 'uploadfile/studentimages/photo_2020-01-04_20-41-44.jpg', 'Null', '0000-00-00', '2019-12-30', 'rkb@gmail.com', 3, 17, 'Null', 4, 'Arunachal Pradesh', '9999'),
(14, 2, 2, 'Emma', 'PAGE', 'Martha Stevens', 'Fletcher Glover', 'Other', '2019-12-09', 'Consequatur voluptat', 'Sequi ut ea non nesc', 'Tempor saepe esse vo', '8488888888', '3111111111', 'Rerum mollitia quisq', '24888888888888', 'uploadfile/studentimages/20190304_094915.jpg', 'Null', '0000-00-00', '2019-12-30', 'rkb@gmail.com', 7, 17, 'Null', 4, 'Sikkim', '61'),
(16, 4, 4, 'ZGVUD', 'TU CYC', 'HFJ', 'HDHE', 'Male', '2020-01-05', 'HRH', 'JFJFAJ', 'Djrjrjjf', '0489456123', '0789456123', 'INDIA', '1234567890012', 'uploadfile/studentimages/IMG_20200106_160914.jpg', 'Null', '0000-00-00', '2020-01-07', 'rkb@gmail.com', 3, 17, 'Null', 4, 'Punjab', '143001'),
(17, 5, 5, 'KATHLEEN', 'Collier', 'Jermaine Mcclain', 'Madeline Boyer', 'FeMale', '2020-01-09', 'Esse in adipisci fu', 'Sit adipisci volupta', 'Consectetur consect', '7975012345', '7501234567', 'Error ullamco aut au', '3475012345678', 'uploadfile/studentimages/photo_2020-01-06_16-33-38.jpg', 'Null', '0000-00-00', '2020-01-09', 'rkb@gmail.com', 3, 17, 'Null', 4, 'Assam', '8814230'),
(18, 6, 6, 'Karly', 'HENDRICKS', 'Pearl Hutchinson', 'Chase Parks', 'Other', '2020-01-09', 'Duis est vel nostrum', 'Ea eaque ut impedit', 'Ex et eos consequat', '7501234567', '7501234567', 'Labore mollitia tene', '4375012345678', 'uploadfile/studentimages/photo_2020-01-06_16-33-38.jpg', 'Null', '0000-00-00', '2020-01-09', 'rkb@gmail.com', 8, 17, 'Null', 4, 'Sikkim', '143001'),
(19, 7, 7, 'MAY', 'Holmes', 'Nero Cline', 'Bradley Contreras', 'FeMale', '2020-01-01', 'Ex corrupti ut corr', 'Quasi voluptatem Al', 'Enim cumque qui modi', '6075012345', '3375012345', 'Ea placeat est obc', '8475012345678', 'uploadfile/studentimages/photo_2020-01-06_16-33-38.jpg', 'Null', '0000-00-00', '2020-01-09', 'rkb@gmail.com', 7, 17, 'Null', 4, 'Goa', '1430001'),
(20, 8, 8, 'JAQUELYN', 'Jackson', 'Omar Parks', 'Whoopi Petersen', 'Male', '2020-01-01', 'Reprehenderit quod u', 'Quo dolor id volupt', 'Ut sed iste ut error', '7501234567', '7501234567', 'Veritatis voluptas v', '9275012345678', 'uploadfile/studentimages/photo_2020-01-06_16-33-38.jpg', 'Null', '0000-00-00', '2020-01-09', 'rkb@gmail.com', 7, 17, 'Null', 4, 'Himachal Pradesh', '143001'),
(22, 10, 10, 'ALTHEA', 'Roth', 'Kelsie Cervantes', 'Fulton Sweeney', 'FeMale', '2020-01-01', 'Magni aliquip volupt', 'Praesentium nobis vo', 'Nisi modi reprehende', '8775012345', '3775012345', 'Cum qui commodo in m', '9475012345678', 'uploadfile/studentimages/photo_2020-01-06_16-33-38.jpg', 'Null', '0000-00-00', '2020-01-09', 'rkb@gmail.com', 8, 17, 'Null', 4, 'Nagaland', '100001'),
(24, 12, 10, 'SOPHIA', 'Rosa', 'Hayden Clemons', 'Paki Solomon', 'Male', '2020-01-02', 'Deleniti odio molest', 'Quasi ullamco volupt', 'Autem est adipisicin', '6075012345', '2775012345', 'Et consequat Soluta', '9075012345678', 'uploadfile/studentimages/photo_2020-01-06_16-33-38.jpg', 'Null', '0000-00-00', '2020-01-09', 'rkb@gmail.com', 8, 17, 'Null', 4, 'Chhattisgarh', '143001');

-- --------------------------------------------------------

--
-- Table structure for table `studentfee`
--

CREATE TABLE `studentfee` (
  `sfid` int(11) NOT NULL,
  `feeid` int(11) NOT NULL,
  `studentid` int(11) NOT NULL,
  `paidamount` float NOT NULL,
  `balance` float NOT NULL,
  `dateofpay` date NOT NULL,
  `recivedbyusername` varchar(100) NOT NULL,
  `van` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studentfee`
--

INSERT INTO `studentfee` (`sfid`, `feeid`, `studentid`, `paidamount`, `balance`, `dateofpay`, `recivedbyusername`, `van`) VALUES
(1, 32, 13, 1500, 148500, '2019-12-30', 'rkb@gmail.com', 0),
(2, 32, 13, 1400, 147100, '2020-01-07', 'rkb@gmail.com', 500),
(3, 32, 16, 100, 149900, '2020-01-07', 'rkb@gmail.com', 12),
(4, 32, 17, 10000, 140000, '2020-01-09', 'rkb@gmail.com', 0),
(5, 32, 14, 15000, 135000, '2020-02-09', 'rkb@gmail.com', 0),
(6, 32, 14, 15000, 120000, '2020-02-09', 'rkb@gmail.com', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `coursefee`
--
ALTER TABLE `coursefee`
  ADD PRIMARY KEY (`feeid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `sessionid` (`sessionid`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`sectionid`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sessionid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentid`),
  ADD UNIQUE KEY `admissiono` (`admissiono`),
  ADD UNIQUE KEY `studentid` (`studentid`),
  ADD KEY `sectionid` (`sectionid`),
  ADD KEY `sessionid` (`sessionid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `studentfee`
--
ALTER TABLE `studentfee`
  ADD PRIMARY KEY (`sfid`),
  ADD KEY `studentid` (`studentid`),
  ADD KEY `feeid` (`feeid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `coursefee`
--
ALTER TABLE `coursefee`
  MODIFY `feeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `sectionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `sessionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `studentfee`
--
ALTER TABLE `studentfee`
  MODIFY `sfid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coursefee`
--
ALTER TABLE `coursefee`
  ADD CONSTRAINT `coursefee_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  ADD CONSTRAINT `coursefee_ibfk_2` FOREIGN KEY (`sessionid`) REFERENCES `sessions` (`sessionid`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`sectionid`) REFERENCES `section` (`sectionid`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`sessionid`) REFERENCES `sessions` (`sessionid`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`);

--
-- Constraints for table `studentfee`
--
ALTER TABLE `studentfee`
  ADD CONSTRAINT `studentfee_ibfk_2` FOREIGN KEY (`studentid`) REFERENCES `student` (`studentid`),
  ADD CONSTRAINT `studentfee_ibfk_3` FOREIGN KEY (`feeid`) REFERENCES `coursefee` (`feeid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
