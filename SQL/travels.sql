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
-- Database: `travels`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `type`) VALUES
('kartik', '12345', 'Admin'),
('Roshni', '1234', 'Admin'),
('simmi', '1998', 'Sub admin'),
('sumit', '123456', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `busbooking`
--

CREATE TABLE `busbooking` (
  `busid` int(11) NOT NULL,
  `leavingfrom` varchar(50) NOT NULL,
  `goingto` varchar(50) NOT NULL,
  `mobile` int(15) NOT NULL,
  `adult` int(20) NOT NULL,
  `children` int(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `busbooking`
--

INSERT INTO `busbooking` (`busid`, `leavingfrom`, `goingto`, `mobile`, `adult`, `children`, `email`) VALUES
(1, 'delhi', 'amritsar', 2147483647, 2, 3, 'roshni@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `contactid` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phoneno` varchar(15) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`contactid`, `name`, `email`, `phoneno`, `message`) VALUES
(1, 'radhika', 'radhika@yahoo.com', '7979789798', 'zxc');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `destinationid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `maplocation` text NOT NULL,
  `photo` varchar(500) NOT NULL,
  `typeofdestination` varchar(500) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`destinationid`, `name`, `description`, `maplocation`, `photo`, `typeofdestination`, `country`) VALUES
(2, 'dalhousie', 'Dalhousie, one of the favourite among most tourists travelling to Himanchal Pradesh is famously known for its mesmerizing natural beauty and its old world charm.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d53815.48426770057!2d75.93857736297917!3d32.54035910504176!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x391c9138637f1ae1%3A0xbac8f1954c198c20!2sDalhousie%2C+Himachal+Pradesh!5e0!3m2!1sen!2sin!4v1516700506984\" width=\"200\" height=\"200\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'Dalhousie.jpg', 'Hill Station', 'India'),
(3, 'shimla', 'Dalhousie, one of the favourite among most tourists travelling to Himanchal Pradesh is famously known for its mesmerizing natural beauty and its old world charm.The well-knit roads, impeccable cleanliness, and an efficient administration make for a perfect combination for any tourist destination in the world. ', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d109348.11765967941!2d77.08898029870687!3d31.07834750087223!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390578e3e35d6e67%3A0x1f7e7ff6ff9f54b7!2sShimla%2C+Himachal+Pradesh!5e0!3m2!1sen!2sin!4v1516701661028\" width=\"200\" height=\"200\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'Shimla.jpg', 'Hill Station', 'India'),
(4, 'Munnar', 'Munnar tourism is blessed with lofty mountain ranges with hazy peaks, extensive tea estates and tranquil climate offers a calm and peaceful environment to the tourists. Amazing views of low flying clouds and mist filled valleys make it a little heaven with a cool, revitalizing climate. Cloudy mountain peaks blend pleasantly in Munnar to form a delightful atmosphere that is hard to explain in words.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31425.79514580147!2d77.04666822164457!3d10.080691342278735!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3b0799794d099a6d%3A0x63250e5553c7e0c!2sMunnar%2C+Kerala+685612!5e0!3m2!1sen!2sin!4v1516784070277\" width=\"200\" height=\"200\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'munnarpic.jpg', 'Hill Station', 'India'),
(5, 'Idduki', 'Idukki is amazing for people who are nature lovers. An ideal destination for trekking enthusiasts, family vacations, group travellers, friends, and couples looking for a romantic destination. ', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1006442.9174697276!2d76.4602102270947!3d9.81524564750053!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3b07ba8c818685f5%3A0xed1c494cc9cce9f2!2sIdukki%2C+Kerala!5e0!3m2!1sen!2sin!4v1516784359681\" width=\"200\" height=\"200\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'idduki.jpg', 'Hill Station', 'India'),
(6, 'Ranikhet', 'Ranikhet is a hill station in Uttarakhand State, northern India. Itâ€™s known for its views of the Himalayas. Hundreds of bells adorn Jhula Devi Temple, dedicated to the Hindu goddess Durga. Fruit trees grow on the terraced orchards of Chaubatia Gardens, with views of peaks including Nanda Devi. Mahatma Gandhi stayed in a hut, Gandhi Kuti, in nearby Tarikhet village during the independence struggle.\r\n', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d55482.842651830746!2d79.4020334921045!3d29.642103799460493!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39a0abd4273fb1dd%3A0x17d59cc393c2ccdc!2sRanikhet%2C+Uttarakhand!5e0!3m2!1sen!2sin!4v1516784652666\" width=\"200\" height=\"200\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'Ranikhet.jpg', 'Hill Station', 'India'),
(7, 'Haridwar', '                    Haridwar is one of the most religious places to visit in India. The majestic Ganga aarti in the evening with sparkling lights of the diyas at Har Ki Paudi is one of the most spectacular sights this country can offer.Haridwar is one of the most religious places to visit in India. The majestic Ganga aarti in the evening with sparkling lights of the diyas at Har Ki Paudi is one of the most spectacular sights this country can offer.\r\n\r\n\r\n\r\n', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d221243.1167511635!2d77.97583748066866!3d29.952873257924264!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3909470eb8ee57c9%3A0x4e449176a640f5f3!2sHaridwar%2C+Uttarakhand!5e0!3m2!1sen!2sin!4v1516787984865\" width=\"200\" height=\"200\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'haridwar.jpg', 'Religious', 'India'),
(8, 'Kedarnath', 'Kedarnath is popular for its ancient Shiva Temple, shrines, Himalayan ranges and undulating landscapes. Marked by the Kedarnath temple, near Chorabari Glacier, the area is flanked by the Kedarnath peaks and countless more ranges with peaks silver with snow. The most remote of the Char Dhams, and maybe hence, one of the most majestically beautiful, Kedarnath remains closed for the six months of winters due to unbearable temperatures and heavy snowfall.\r\n', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6858.855033211989!2d79.06255777271693!3d30.73449064848651!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39083ee051e628b1%3A0x167ce4efaf440f1e!2sKedarnath%2C+Uttarakhand+246445!5e0!3m2!1sen!2sin!4v1516788420879\" width=\"200\" height=\"200\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'kedarnath.jpg', 'Religious', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `flightbooking`
--

CREATE TABLE `flightbooking` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `flying_from` varchar(100) NOT NULL,
  `flying_to` varchar(100) NOT NULL,
  `date_departure` date NOT NULL,
  `date_return` date NOT NULL,
  `adults` int(10) NOT NULL,
  `children` int(10) NOT NULL,
  `class` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flightbooking`
--

INSERT INTO `flightbooking` (`id`, `type`, `flying_from`, `flying_to`, `date_departure`, `date_return`, `adults`, `children`, `class`, `email`, `mobile`) VALUES
(4, 'one way', 'canada', 'delhi', '2018-01-25', '0000-00-00', 4, 3, 'Business', 'test42@gmail.com', 8427600553),
(5, 'one way', 'melbourne', 'delhi', '2018-01-11', '0000-00-00', 2, 1, 'Economy', 'roshni@gmail.com', 7837609498),
(6, 'one way', 'amritsar', 'delhi', '2018-01-27', '0000-00-00', 2, 1, 'Economy', 'aarti@gmail.com', 12364567894);

-- --------------------------------------------------------

--
-- Table structure for table `hotelbooking`
--

CREATE TABLE `hotelbooking` (
  `bookingid` int(11) NOT NULL,
  `customername` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobileno` bigint(15) NOT NULL,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `noofpersons` int(11) NOT NULL,
  `paymentstatus` varchar(20) NOT NULL,
  `bookingdate` date NOT NULL,
  `totalprice` float NOT NULL,
  `time` time NOT NULL,
  `noofrooms` int(11) NOT NULL,
  `typeofroom` varchar(50) NOT NULL,
  `hotelid` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hotelrating`
--

CREATE TABLE `hotelrating` (
  `ratingid` int(11) NOT NULL,
  `hotelid` int(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hotelrooms`
--

CREATE TABLE `hotelrooms` (
  `roomid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  `roomno` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `roomphoto1` varchar(200) NOT NULL,
  `roomphoto2` varchar(200) NOT NULL,
  `roomphoto3` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `hotelid` int(11) NOT NULL,
  `ratingcount` int(11) NOT NULL,
  `rating` float NOT NULL,
  `capacity` int(11) NOT NULL,
  `discount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `hotelid` int(20) NOT NULL,
  `hotelname` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phoneno` varchar(50) NOT NULL,
  `coverphoto` varchar(100) NOT NULL,
  `rating` int(11) NOT NULL,
  `starrating` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `maplocation` text NOT NULL,
  `password` varchar(50) NOT NULL,
  `gstno` varchar(50) NOT NULL,
  `owner` varchar(100) NOT NULL,
  `panno` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`hotelid`, `hotelname`, `address`, `country`, `state`, `city`, `email`, `phoneno`, `coverphoto`, `rating`, `starrating`, `status`, `maplocation`, `password`, `gstno`, `owner`, `panno`) VALUES
(7, 'Hotel Ramada', '117 Hall Bazaar, Amritsar, 143006\r\n\r\n', 'India', 'punjab', 'Amritsar', 'reservations@ramadaamritsar.com', '1835025555', 'holiday inn.jpg', 0, '4 star', 'pending', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3397.21239067358!2d74.87517031442616!3d31.628034648983874!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39197cab2624312f%3A0x22da6562029447ee!2sRamada+Amritsar!5e0!3m2!1sen!2sin!4v1515663606952\" width=\"200\" height=\"200\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', '123456', 'NA', ' Mr. Mohinder singh & Mr. Ishvien Mohinder singh.', 'NA'),
(8, 'Humble Hotel', '18, Krishna Nagar, Lawrence Road\r\n   \r\n', 'India', 'punjab', 'Amritsar', 'booking@humblehotels.in', '1835044444', 'pic1.jpg', 0, '4 star', 'pending', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3396.490141064256!2d74.87459331442673!3d31.647807548006284!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x391963592bba2625%3A0xa57b395bad8a7ca6!2sHumble+Hotels+Amritsar!5e0!3m2!1sen!2sin!4v1516180145768\" width=\"200\" height=\"200\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', '123456', 'NA', 'NA', 'NA');

-- --------------------------------------------------------

--
-- Table structure for table `managehotelgallery`
--

CREATE TABLE `managehotelgallery` (
  `galleryid` int(11) NOT NULL,
  `hotelid` int(20) NOT NULL,
  `caption` varchar(200) NOT NULL,
  `photo` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `managehotelgallery`
--

INSERT INTO `managehotelgallery` (`galleryid`, `hotelid`, `caption`, `photo`) VALUES
(2, 2, 'sad', 'download.jpg'),
(3, 2, 'sadad', 'asd.jpg'),
(4, 2, 'sdad', 'download.jpg'),
(5, 2, 'dadad', 'download.jpg'),
(7, 3, 'aaaa', 'asd.jpg'),
(8, 3, 'hillstation', 'rp.jpg'),
(9, 3, 'hill', 'asd.jpg'),
(10, 5, 'room1', 'room1.jpg'),
(11, 5, 'room2', 'room2.jpg'),
(12, 5, 'room3', 'room3.jpg'),
(13, 7, '1', '1.jpg'),
(14, 7, '2', '2.jpg'),
(15, 7, '3', '3.jpg'),
(16, 7, '4', '4.jpg'),
(17, 7, '5', '5.jpg'),
(18, 7, '6', '6.jpg'),
(19, 7, '7', '7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `packageid` int(11) NOT NULL,
  `packagename` varchar(100) NOT NULL,
  `basiccost` float NOT NULL,
  `description` varchar(500) NOT NULL,
  `exitcity` varchar(50) NOT NULL,
  `entrycity` varchar(50) NOT NULL,
  `noofnights` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`packageid`, `packagename`, `basiccost`, `description`, `exitcity`, `entrycity`, `noofnights`) VALUES
(4, 'Singapore package', 70000, 'na\r\n\r\n\r\n ', 'amritsar', 'singapore', 6),
(5, 'Maldives', 80000, 'Na', 'delhi', 'maldives', 5),
(6, 'Manali', 5199, 'Explore the unmatched scenic grandeur of Manali, the extremely popular destination of North India in Himachal Pradesh. Pass through scenic Kullu Valley while driving to Manali. Displaying lavish natural scenery, Manali offers snow clad peaks and lovely green grasslands', 'Delhi', 'Manali', 3),
(7, 'Pattaya and Bangkok special package', 24999, 'Thailand is one the most visited countries in Asia and is renowned for its charming culture, beautiful sand beaches, Thai culinary delicacies and some amazing tourist attractions. Enjoy the highlights of Thailand and experience Bangkok and Pattaya, the two most vibrant cities of Thailand. ', 'Delhi', 'Bangkok', 6);

-- --------------------------------------------------------

--
-- Table structure for table `packagehoteloption`
--

CREATE TABLE `packagehoteloption` (
  `optionid` int(11) NOT NULL,
  `packageid` int(11) NOT NULL,
  `hotelname` varchar(100) NOT NULL,
  `cost` float NOT NULL,
  `nights` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packagehoteloption`
--

INSERT INTO `packagehoteloption` (`optionid`, `packageid`, `hotelname`, `cost`, `nights`) VALUES
(1, 4, 'Royal Plaza', 9800, 2);

-- --------------------------------------------------------

--
-- Table structure for table `roomgallery`
--

CREATE TABLE `roomgallery` (
  `galleryid` int(11) NOT NULL,
  `roomid` int(11) NOT NULL,
  `caption` varchar(200) NOT NULL,
  `photo` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roomrating`
--

CREATE TABLE `roomrating` (
  `roomrating` int(11) NOT NULL,
  `roomid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `rating` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roomtypes`
--

CREATE TABLE `roomtypes` (
  `typeid` int(11) NOT NULL,
  `typename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roomtypes`
--

INSERT INTO `roomtypes` (`typeid`, `typename`) VALUES
(1, 'super delux'),
(3, 'Delux'),
(5, 'Superior Room'),
(6, 'luxury');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`email`, `password`, `name`, `status`) VALUES
('', '123456', 'rohit sharma', 'Active'),
('rashmi@gmail.com', '12345', 'rashmi gulati', 'Active'),
('sahil@gmail.com', '123456', 'sahil kumar', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `busbooking`
--
ALTER TABLE `busbooking`
  ADD PRIMARY KEY (`busid`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`contactid`);

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`destinationid`);

--
-- Indexes for table `flightbooking`
--
ALTER TABLE `flightbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotelbooking`
--
ALTER TABLE `hotelbooking`
  ADD PRIMARY KEY (`bookingid`),
  ADD KEY `hotelid` (`hotelid`);

--
-- Indexes for table `hotelrating`
--
ALTER TABLE `hotelrating`
  ADD PRIMARY KEY (`ratingid`),
  ADD KEY `hotelid` (`hotelid`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `hotelrooms`
--
ALTER TABLE `hotelrooms`
  ADD PRIMARY KEY (`roomid`),
  ADD KEY `typeid` (`typeid`),
  ADD KEY `hotelid` (`hotelid`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`hotelid`);

--
-- Indexes for table `managehotelgallery`
--
ALTER TABLE `managehotelgallery`
  ADD PRIMARY KEY (`galleryid`),
  ADD KEY `hotelid` (`hotelid`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`packageid`);

--
-- Indexes for table `packagehoteloption`
--
ALTER TABLE `packagehoteloption`
  ADD PRIMARY KEY (`optionid`),
  ADD KEY `packageid` (`packageid`);

--
-- Indexes for table `roomgallery`
--
ALTER TABLE `roomgallery`
  ADD PRIMARY KEY (`galleryid`),
  ADD KEY `roomid` (`roomid`);

--
-- Indexes for table `roomrating`
--
ALTER TABLE `roomrating`
  ADD PRIMARY KEY (`roomrating`,`roomid`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `roomtypes`
--
ALTER TABLE `roomtypes`
  ADD PRIMARY KEY (`typeid`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `busbooking`
--
ALTER TABLE `busbooking`
  MODIFY `busid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `contactid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `destinationid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `flightbooking`
--
ALTER TABLE `flightbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hotelbooking`
--
ALTER TABLE `hotelbooking`
  MODIFY `bookingid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotelrating`
--
ALTER TABLE `hotelrating`
  MODIFY `ratingid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotelrooms`
--
ALTER TABLE `hotelrooms`
  MODIFY `roomid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `hotelid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `managehotelgallery`
--
ALTER TABLE `managehotelgallery`
  MODIFY `galleryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `packageid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `packagehoteloption`
--
ALTER TABLE `packagehoteloption`
  MODIFY `optionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roomgallery`
--
ALTER TABLE `roomgallery`
  MODIFY `galleryid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roomrating`
--
ALTER TABLE `roomrating`
  MODIFY `roomrating` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roomtypes`
--
ALTER TABLE `roomtypes`
  MODIFY `typeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hotelbooking`
--
ALTER TABLE `hotelbooking`
  ADD CONSTRAINT `hotelbooking_ibfk_1` FOREIGN KEY (`hotelid`) REFERENCES `hotels` (`hotelid`) ON DELETE CASCADE;

--
-- Constraints for table `hotelrating`
--
ALTER TABLE `hotelrating`
  ADD CONSTRAINT `hotelrating_ibfk_1` FOREIGN KEY (`hotelid`) REFERENCES `hotels` (`hotelid`) ON DELETE CASCADE,
  ADD CONSTRAINT `hotelrating_ibfk_2` FOREIGN KEY (`email`) REFERENCES `signup` (`email`) ON DELETE CASCADE;

--
-- Constraints for table `hotelrooms`
--
ALTER TABLE `hotelrooms`
  ADD CONSTRAINT `hotelrooms_ibfk_1` FOREIGN KEY (`typeid`) REFERENCES `roomtypes` (`typeid`) ON DELETE CASCADE,
  ADD CONSTRAINT `hotelrooms_ibfk_2` FOREIGN KEY (`hotelid`) REFERENCES `hotels` (`hotelid`) ON DELETE CASCADE;

--
-- Constraints for table `packagehoteloption`
--
ALTER TABLE `packagehoteloption`
  ADD CONSTRAINT `packagehoteloption_ibfk_1` FOREIGN KEY (`packageid`) REFERENCES `package` (`packageid`);

--
-- Constraints for table `roomgallery`
--
ALTER TABLE `roomgallery`
  ADD CONSTRAINT `roomgallery_ibfk_1` FOREIGN KEY (`roomid`) REFERENCES `hotelrooms` (`roomid`) ON DELETE CASCADE;

--
-- Constraints for table `roomrating`
--
ALTER TABLE `roomrating`
  ADD CONSTRAINT `roomrating_ibfk_1` FOREIGN KEY (`email`) REFERENCES `signup` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
