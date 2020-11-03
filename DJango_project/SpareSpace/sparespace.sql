-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2019 at 04:24 AM
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
-- Database: `sparespace`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(100) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`, `password`, `type`, `mobile`) VALUES
('abc@gmail.com', '111', 'subadmin', '963258748'),
('pqr@gmail.com', '654', 'admin', '852369741');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingid` int(11) NOT NULL,
  `roomid` int(11) DEFAULT NULL,
  `tariff` varchar(45) DEFAULT NULL,
  `extraperson` int(11) DEFAULT NULL,
  `checkin` date DEFAULT NULL,
  `checkout` date DEFAULT NULL,
  `bookeremail` varchar(100) DEFAULT NULL,
  `bookeraddress` varchar(200) DEFAULT NULL,
  `bookermobile` varchar(10) DEFAULT NULL,
  `hostid` int(11) DEFAULT NULL,
  `totalbill` float DEFAULT NULL,
  `dateofbooking` date DEFAULT NULL,
  `paymentmode` varchar(45) DEFAULT NULL,
  `paymentstatus` varchar(50) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bookingid`, `roomid`, `tariff`, `extraperson`, `checkin`, `checkout`, `bookeremail`, `bookeraddress`, `bookermobile`, `hostid`, `totalbill`, `dateofbooking`, `paymentmode`, `paymentstatus`, `status`) VALUES
(10, 56, 'single', 0, '2019-11-14', '2019-11-15', 'hundal.anmol96@gmail.com', 'amritsar', '9592231891', 3, 283, '2019-11-14', 'online', 'success', 'pending'),
(11, 38, 'single', 1, '2019-11-16', '2019-11-19', 'hundal.anmol96@gmail.com', 'amritsar', '9592231891', 5, 0, '2019-11-16', 'Cash', 'pending', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cname` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cname`, `description`, `photo`) VALUES
('Apartment', 'Rent different types of apartments', 'categoryphotos/9461apartment.jpg'),
('banglow', 'big rooms', 'categoryphotos/429tenor.gif'),
('Event', 'Space for different events on rent', 'categoryphotos/2623event.jpg'),
('Flat', 'Rent Flats', 'categoryphotos/5833flat.jpg'),
('Office', 'Office/Co-working Space for rent', 'categoryphotos/1004office.jpg'),
('Parking', 'Parking Space on rent', 'categoryphotos/7648parking.jpg'),
('PG', 'rooms for students', 'categoryphotos/513pg.jpg'),
('resort', 'great place for holidays', 'categoryphotos/3736rangoli-10.jpg'),
('Shop', 'Space for shop on rent', 'categoryphotos/568shop.bmp'),
('Villa', ' Villas on rent', 'categoryphotos/1583villa.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `host`
--

CREATE TABLE `host` (
  `hid` int(11) NOT NULL,
  `hostname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `dp` varchar(200) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `host`
--

INSERT INTO `host` (`hid`, `hostname`, `email`, `password`, `city`, `mobile`, `dp`, `description`, `location`, `status`) VALUES
(1, 'rohan', 'rohan@gmail.com', '123', 'amritsar', '8547123230', 'hostphotos/2677h2.jpg', 'rent flats, PG rooms at affordable price', 'amritsar', 'active'),
(2, 'mohan', 'mohan@gmail.com', '222', 'jalandhar', '8427897463', 'hostphotos/2677h2.jpg', 'rent flats, PG rooms,apartments at decent price', 'jalandhar', 'active'),
(3, 'sohan', 'sohan99@gmail.com', '111', 'ludhiana', '9632587410', 'hostphotos/2677h2.jpg', 'rent affordable flats, PG rooms,villas', 'ludhiana', 'active'),
(4, 'nitin', 'nitin@gmail.com', '222', 'chandigarh', '9658742230', 'hostphotos/2677h2.jpg', 'rent apartments flats, PG rooms at price that suites all', 'chandigarh', 'active'),
(5, 'rajat', 'rajat11@gmail.com', '333', 'amritsar', '9854362107', 'hostphotos/2677h2.jpg', 'rent flats, PG rooms at best price', 'amritsar', 'active'),
(6, 'karan', 'karan@gmail.com', '123', 'jalandhar', '8547185691', 'hostphotos/2677h2.jpg', 'rent flats, PG rooms, shop space at decent  price', 'jalandhar', 'active'),
(7, 'rohit', 'rohit@gmail.com', '222', 'ludhiana', '9587412350', 'hostphotos/2677h2.jpg', 'rent flats, PG rooms at affordable price', 'ludhiana', 'active'),
(9, 'rahul', 'rkb@gmail.com', '1234', 'amritsar', '6280995201', 'hostphotos/289alexandre-debieve-KYHkWp3dnLI-unsplash.jpg', 'demo', 'amritsar', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `pid` int(11) NOT NULL,
  `photo` varchar(300) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `roomid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`pid`, `photo`, `description`, `roomid`) VALUES
(1, 'addspacephotos/2305pg1.jpeg', 'Address: C Block 12, Ranjit Avenue, Amritsar, Punjab\nNeat and clean place\nWith almirah and bathrooms attached laundary available on extra charges', 1),
(2, 'addspacephotos/4567pgc1.jpeg', '2 Bedrooms , 1 Bathroom, 1 Balcony with Others\nSemi furnished property with all amenities', 3),
(3, 'addspacephotos/4422pg31.jpeg', '4 Bedrooms , 4 Bathrooms, No Balcony\nShared Room(s)\n2 Beds per room\n2 Beds Available', 4),
(4, 'addspacephotos/4993pg32.jpeg', '4 Bedrooms , 4 Bathrooms, No Balcony\nShared Room(s)\n2 Beds per room\n2 Beds Available', 4),
(5, 'addspacephotos/1745pg33.jpeg', '4 Bedrooms , 4 Bathrooms, No Balcony\nShared Room(s)\n2 Beds per room\n2 Beds Available', 4),
(6, 'addspacephotos/1841ap1.jpeg', '4 Bedrooms , 4 Bathrooms, 1 Balcony with Pooja Room,Study Room,Servant Room,Others', 2),
(7, 'addspacephotos/7309ap2.jpeg', '4 Bedrooms , 4 Bathrooms, 1 Balcony with Pooja Room,Study Room,Servant Room,Others', 2),
(8, 'addspacephotos/5856ap3.jpeg', '4 Bedrooms , 4 Bathrooms, 1 Balcony with Pooja Room,Study Room,Servant Room,Others', 2),
(9, 'addspacephotos/3ap4.jpeg', '\n\n\n\nBath\nSuper Built up area 2201\n(204.48 sq.m.)\nBuilt Up area: 2200 sq.ft. (204.39 sq.m.)\nCarpet area: 2199 sq.ft. (204.29 sq.m.) ', 2),
(10, 'addspacephotos/1114ap5.jpeg', '1 Bedroom , 1 Bathroom, 1 Balcony \nFully furnished independent flat with double bed, ac, diwan bed, lcd, fridge,dish tv, chair table.', 5),
(11, 'addspacephotos/8616ap6.jpeg', 'Fully furnished independent flat with double bed, ac, diwan bed, lcd, fridge,dish tv, chair table.', 5),
(12, 'addspacephotos/5879ap7.jpeg', 'Fully furnished independent flat with double bed, ac, diwan bed, lcd, fridge,dish tv, chair table.', 5),
(13, 'addspacephotos/1660pg7.jpeg', '2 Bedrooms , 1 Bathroom, 1 Balcony \nIdeal suitable for small family students working individuals', 6),
(14, 'addspacephotos/5196pg8.jpeg', '2 Bedrooms , 1 Bathroom, 1 Balcony \nIdeal suitable for small family students working individuals', 6),
(15, 'addspacephotos/9284pg9.jpeg', '2 Bedrooms , 1 Bathroom, 1 Balcony \nIdeal suitable for small family students working individuals', 6),
(16, 'addspacephotos/7921pg10.jpeg', '2 Bedrooms , 1 Bathroom, 1 Balcony \nIdeal suitable for small family students working individuals', 6),
(17, 'addspacephotos/9514pg12.jpeg', '2 Bedrooms , 2 Bathrooms, 1 Balcony with Others', 7),
(18, 'addspacephotos/4786pg13.jpeg', '2 Bedrooms , 2 Bathrooms, 1 Balcony with Others', 7),
(19, 'addspacephotos/5184pg14.jpeg', '2 Bedrooms , 2 Bathrooms, 1 Balcony with Others', 7),
(20, 'addspacephotos/2534ap9.jpeg', '2 Bedrooms , 1 Bathroom, 2 Balconies with Others', 8),
(21, 'addspacephotos/1872ap10.jpeg', '2 Bedrooms , 1 Bathroom, 2 Balconies with Others', 8),
(22, 'addspacephotos/9823ap11.jpeg', '2 Bedrooms , 1 Bathroom, 2 Balconies with Others', 8),
(23, 'addspacephotos/2494ap13.jpeg', 'Fully Furnished, 2 Bedrooms , 2 Bathrooms, 2 Balconies with Others', 9),
(24, 'addspacephotos/6565ap14.jpeg', 'Fully Furnished, 2 Bedrooms , 2 Bathrooms, 2 Balconies with Others', 9),
(25, 'addspacephotos/2711ap15.jpeg', 'Fully Furnished, 2 Bedrooms , 2 Bathrooms, 2 Balconies with Others', 9),
(26, 'addspacephotos/3603ap16.jpeg', '2 Bedrooms , 1 Bathroom, 2 Balconies with Others, fully furnished', 10),
(27, 'addspacephotos/6344ap17.jpeg', '2 Bedrooms , 1 Bathroom, 2 Balconies with Others, fully furnished', 10),
(28, 'addspacephotos/4272ap18.jpeg', '2 Bedrooms , 1 Bathroom, 2 Balconies with Others, fully furnished', 10),
(29, 'addspacephotos/4460ap21.jfif', 'Newly Build Property with all the facilities and amenities available nearby', 11),
(30, 'addspacephotos/8459ap21.jpeg', 'Newly Build Property with all the facilities and amenities available nearby', 11),
(31, 'addspacephotos/9501ap22.jpeg', 'Newly Build Property with all the facilities and amenities available nearby', 11),
(32, 'addspacephotos/8011pg16.jpeg', '2 Bedrooms , 1 Bathroom, 1 Balcony, Furnished', 12),
(33, 'addspacephotos/4580pg17.jpeg', '2 Bedrooms , 1 Bathroom, 1 Balcony, Furnished', 12),
(34, 'addspacephotos/1016pg18.jpeg', '2 Bedrooms , 1 Bathroom, 1 Balcony, Furnished', 12),
(35, 'addspacephotos/9627pg20.jpeg', 'Boys Pg With All Modern Facilities Like Ac, Led Tv, Kitchen With Gas, Fridge Etc,  4 Bedrooms , 4 Bathrooms, No Balcony ', 13),
(36, 'addspacephotos/7654pg21.jpeg', 'Boys Pg With All Modern Facilities Like Ac, Led Tv, Kitchen With Gas, Fridge Etc,  4 Bedrooms , 4 Bathrooms, No Balcony ', 13),
(37, 'addspacephotos/6558pg22.jpeg', 'Boys Pg With All Modern Facilities Like Ac, Led Tv, Kitchen With Gas, Fridge Etc,  4 Bedrooms , 4 Bathrooms, No Balcony ', 13),
(38, 'addspacephotos/5840ap24.jpeg', '2 Bedrooms ,1 Bathroom, 2 Balconies with Others, semi-furnished, Super Built up area 2000(185.81 sq.m.),Built Up area: 1800 sq.ft. (167.23 sq.m.),Carpet area: 1600 sq.ft. (148.64 sq.m.)  ', 14),
(39, 'addspacephotos/4347ap25.jpeg', '2 Bedrooms ,1 Bathroom, 2 Balconies with Others, semi-furnished, Super Built up area 2000(185.81 sq.m.),Built Up area: 1800 sq.ft. (167.23 sq.m.),Carpet area: 1600 sq.ft. (148.64 sq.m.)  ', 14),
(40, 'addspacephotos/3541ap27.jpeg', '3 Bedrooms , 3 Bathrooms, 3+ Balconies with Others,Super Built up area 1439(133.69 sq.m.),Built Up area: 1438 sq.ft. (133.59 sq.m.)\n,Carpet area: 1437 sq.ft. (133.5 sq.m.), Semi-furnished', 15),
(41, 'addspacephotos/9754ap28.jpeg', '3 Bedrooms , 3 Bathrooms, 3+ Balconies with Others,Super Built up area 1439(133.69 sq.m.),Built Up area: 1438 sq.ft. (133.59 sq.m.)\n,Carpet area: 1437 sq.ft. (133.5 sq.m.), Semi-furnished', 15),
(42, 'addspacephotos/8335ap29.jpeg', '3 Bedrooms , 3 Bathrooms, 3+ Balconies with Others,Super Built up area 1439(133.69 sq.m.),Built Up area: 1438 sq.ft. (133.59 sq.m.)\n,Carpet area: 1437 sq.ft. (133.5 sq.m.), Semi-furnished', 15),
(44, 'addspacephotos/5688f2.jpeg', 'Kitchen', 16),
(45, 'addspacephotos/1407f3.jpeg', 'Washroom', 16),
(46, 'addspacephotos/7579f4.jpeg', 'Furnished Bedroom', 16),
(47, 'addspacephotos/6393f6.jpeg', 'Bedroom , 1 Bathroom, 2 Balconies with Others, furnished,\nArea:\nSuper Built up area 900(83.61 sq.m.),\nBuilt Up area: 880 sq.ft. (81.75 sq.m.),\nCarpet area: 850 sq.ft. (78.97 sq.m.)  ', 17),
(48, 'addspacephotos/3966f7.jpeg', 'Bedroom , 1 Bathroom, 2 Balconies with Others, furnished,\nArea:\nSuper Built up area 900(83.61 sq.m.),\nBuilt Up area: 880 sq.ft. (81.75 sq.m.),\nCarpet area: 850 sq.ft. (78.97 sq.m.)  ', 17),
(49, 'addspacephotos/2207f8.jpeg', 'Bedroom , 1 Bathroom, 2 Balconies with Others, furnished,\nArea:\nSuper Built up area 900(83.61 sq.m.),\nBuilt Up area: 880 sq.ft. (81.75 sq.m.),\nCarpet area: 850 sq.ft. (78.97 sq.m.)  ', 17),
(50, 'addspacephotos/9433pg24.jpg', '14 guests,5 bedrooms,14 beds,3 baths.It is in centre of the city. Every market, worthseeing places are at walkable distance.The rooms have proper air cooling. The Home is situated in Hall Bazar - City Center which is surrounded by Golden Temple, Jalianwala Bagh, Jama Masjid.', 18),
(51, 'addspacephotos/318pg25.jpg', '14 guests,5 bedrooms,14 beds,3 baths.It is in centre of the city. Every market, worthseeing places are at walkable distance.The rooms have proper air cooling. The Home is situated in Hall Bazar - City Center which is surrounded by Golden Temple, Jalianwala Bagh, Jama Masjid.', 18),
(52, 'addspacephotos/548pg26.jpg', '14 guests,5 bedrooms,14 beds,3 baths.It is in centre of the city. Every market, worthseeing places are at walkable distance.The rooms have proper air cooling. The Home is situated in Hall Bazar - City Center which is surrounded by Golden Temple, Jalianwala Bagh, Jama Masjid.', 18),
(53, 'addspacephotos/1688pg28.jpg', 'Located within 1.3 km of Golden Temple and less than 1 km of Jallianwala Bagh, Puri Guest House provides rooms with air conditioning and a private bathroom in Amritsar. Among the facilities at this property are a 24-hour front desk and a shared kitchen, along with free WiFi throughout the property. Private parking can be arranged at an extra charge.', 19),
(54, 'addspacephotos/562pg29.jpg', 'Located within 1.3 km of Golden Temple and less than 1 km of Jallianwala Bagh, Puri Guest House provides rooms with air conditioning and a private bathroom in Amritsar. Among the facilities at this property are a 24-hour front desk and a shared kitchen, along with free WiFi throughout the property. Private parking can be arranged at an extra charge.', 19),
(55, 'addspacephotos/1813pg30.jpg', 'Located within 1.3 km of Golden Temple and less than 1 km of Jallianwala Bagh, Puri Guest House provides rooms with air conditioning and a private bathroom in Amritsar. Among the facilities at this property are a 24-hour front desk and a shared kitchen, along with free WiFi throughout the property. Private parking can be arranged at an extra charge.', 19),
(57, 'addspacephotos/702pg30.jpeg', '1 Bedroom , 1 Bathroom, No Balcony ,Semifurnished. It has spacious 1 bedroom and 1 bathroom. Placed at model town. 180 sq.Ft.(Builtup area) is the area of the property. Building has three total floors and property is located on second floor. You will also get power back-Up with the property .', 20),
(58, 'addspacephotos/1721pg31.jpeg', '1 Bedroom , 1 Bathroom, No Balcony ,Semifurnished. It has spacious 1 bedroom and 1 bathroom. Placed at model town. 180 sq.Ft.(Builtup area) is the area of the property. Building has three total floors and property is located on second floor. You will also get power back-Up with the property ', 20),
(59, 'addspacephotos/7871pg34.jpeg', '2 Bedrooms , 1 Bathroom, 2 Balconies, Girls & Boys (Total Capacity: 4), Semifurnished.', 21),
(60, 'addspacephotos/8326pg35.jpeg', '2 Bedrooms , 1 Bathroom, 2 Balconies, Girls & Boys (Total Capacity: 4), Semifurnished.', 21),
(61, 'addspacephotos/7094pg36.jpeg', '2 Bedrooms , 1 Bathroom, 2 Balconies, Girls & Boys (Total Capacity: 4), Semifurnished.', 21),
(62, 'addspacephotos/8545ap31.jpg', '8 guests,4 bedrooms,4 beds,4 bathrooms,Located in the lanes of Garden Green Enclave, this 2 BHK is conveniently located in a neighbourhood which is close to the main highway leading to Wagah Border.', 23),
(63, 'addspacephotos/8936ap32.jpg', '8 guests,4 bedrooms,4 beds,4 bathrooms,Located in the lanes of Garden Green Enclave, this 2 BHK is conveniently located in a neighbourhood which is close to the main highway leading to Wagah Border.', 23),
(64, 'addspacephotos/9959ap33.jpg', '8 guests,4 bedrooms,4 beds,4 bathrooms,Located in the lanes of Garden Green Enclave, this 2 BHK is conveniently located in a neighbourhood which is close to the main highway leading to Wagah Border.', 23),
(65, 'addspacephotos/403ap35.jpg', 'This 2 Rooms fully furnished apartment on the third floor is less than 1 km from the Golden Temple,Jallianwala Bagh and is situated in the heart of the city.3 guests,1 bedroom,2 beds,1 bath', 24),
(66, 'addspacephotos/9860ap36.jpg', 'This 2 Rooms fully furnished apartment on the third floor is less than 1 km from the Golden Temple,Jallianwala Bagh and is situated in the heart of the city.3 guests,1 bedroom,2 beds,1 bath', 24),
(67, 'addspacephotos/3504ap37.jpg', 'This 2 Rooms fully furnished apartment on the third floor is less than 1 km from the Golden Temple,Jallianwala Bagh and is situated in the heart of the city.3 guests,1 bedroom,2 beds,1 bath', 24),
(68, 'addspacephotos/8678ap39.jpg', 'Built-Up Area:1200 Sq.ft,Bedroom:2,Spacious independent apartment available for rent at the heart of Amritsar. The location is very lucrative', 25),
(69, 'addspacephotos/1621ap40.jpg', 'Built-Up Area:1200 Sq.ft,Bedroom:2,Spacious independent apartment available for rent at the heart of Amritsar. The location is very lucrative', 25),
(70, 'addspacephotos/463ap41.jpg', 'Built-Up Area:1200 Sq.ft,Bedroom:2,Spacious independent apartment available for rent at the heart of Amritsar. The location is very lucrative', 25),
(71, 'addspacephotos/6497pg41.jpeg', '3 Bedrooms , 1 Bathroom, 2 Balconies ,Furnished,There are 3 rooms which can be shared among known ones.', 26),
(72, 'addspacephotos/130pg42.jpeg', '3 Bedrooms , 1 Bathroom, 2 Balconies ,Furnished,There are 3 rooms which can be shared among known ones.', 26),
(73, 'addspacephotos/2929pg43.jpeg', '3 Bedrooms , 1 Bathroom, 2 Balconies ,Furnished,There are 3 rooms which can be shared among known ones.', 26),
(74, 'addspacephotos/7479ap43.jpeg', '2 bhk flat available for rent in choti baradari i, jalandhar. It is located in choti baradri part 1, which is a very good society. The space is semi-Furnished, located on 1st floor of 2 floors. It has 2 bedrooms, 1 bathrooms and 2 balcony(s). It is an ideal accommodation for family and has a super built-Up area of 2000. 0 sq. Ft. It includes 1 wardrobe(s), 1 modular kitchen, 2 fan(s), 3 light(s) and 1 exhaust fan(s). It is a 0-1 years. There is 1 open parking. ', 27),
(75, 'addspacephotos/8961ap44.jpeg', '2 bhk flat available for rent in choti baradari i, jalandhar. It is located in choti baradri part 1, which is a very good society. The space is semi-Furnished, located on 1st floor of 2 floors. It has 2 bedrooms, 1 bathrooms and 2 balcony(s). It is an ideal accommodation for family and has a super built-Up area of 2000. 0 sq. Ft. It includes 1 wardrobe(s), 1 modular kitchen, 2 fan(s), 3 light(s) and 1 exhaust fan(s). It is a 0-1 years. There is 1 open parking. ', 27),
(76, 'addspacephotos/922ap45.jpeg', '2 bhk flat available for rent in choti baradari i, jalandhar. It is located in choti baradri part 1, which is a very good society. The space is semi-Furnished, located on 1st floor of 2 floors. It has 2 bedrooms, 1 bathrooms and 2 balcony(s). It is an ideal accommodation for family and has a super built-Up area of 2000. 0 sq. Ft. It includes 1 wardrobe(s), 1 modular kitchen, 2 fan(s), 3 light(s) and 1 exhaust fan(s). It is a 0-1 years. There is 1 open parking. ', 27),
(77, 'addspacephotos/8731ap47.jpeg', '4 bhk apartment for rent in choti baradari i, jalandhar. It is a fully furnished apartment, located on the 1st floor of 1 floors. The apartment has 4 bedrooms 4 bathrooms 2 balcony(s). It is also equipped with 4 wardrobe(s), 3 bed(s), 1 modular kitchen.', 28),
(78, 'addspacephotos/9486ap48.jpeg', '4 bhk apartment for rent in choti baradari i, jalandhar. It is a fully furnished apartment, located on the 1st floor of 1 floors. The apartment has 4 bedrooms 4 bathrooms 2 balcony(s). It is also equipped with 4 wardrobe(s), 3 bed(s), 1 modular kitchen.', 28),
(79, 'addspacephotos/4870ap49.jpeg', '4 bhk apartment for rent in choti baradari i, jalandhar. It is a fully furnished apartment, located on the 1st floor of 1 floors. The apartment has 4 bedrooms 4 bathrooms 2 balcony(s). It is also equipped with 4 wardrobe(s), 3 bed(s), 1 modular kitchen.', 28),
(80, 'addspacephotos/9829f10.jpeg', '1 Bedroom , 1 Bathroom, 1 Balcony with Others,Super Built up area 600sq.ft.(55.74 sq.m.) ,Semifurnished.', 29),
(81, 'addspacephotos/5292f11.jpeg', '1 Bedroom , 1 Bathroom, 1 Balcony with Others,Super Built up area 600sq.ft.(55.74 sq.m.) ,Semifurnished.', 29),
(82, 'addspacephotos/550f12.jpeg', '1 Bedroom , 1 Bathroom, 1 Balcony with Others,Super Built up area 600sq.ft.(55.74 sq.m.) ,Semifurnished.', 29),
(83, 'addspacephotos/2336ap51.jpeg', 'The apartment is location is very idle, it is near to market, bus stand, and railway station . Hospitals and banks and other amenities are also very nearby the apartment.', 30),
(84, 'addspacephotos/6961ap52.jpeg', 'The apartment location is very idle, it is near to market, bus stand, and railway station . Hospitals and banks and other amenities are also very nearby the apartment.', 30),
(85, 'addspacephotos/3477ap53.jpeg', 'The apartment location is very idle, it is near to market, bus stand, and railway station . Hospitals and banks and other amenities are also very nearby the apartment.', 30),
(86, 'addspacephotos/2319f14.webp', 'Super Builtup area (ft²):1600,Carpet Area (ft²):1600,fully furnished,Total Floors:6 , Bedrooms: 3, Bathrooms: 3.', 31),
(87, 'addspacephotos/500f15.webp', 'Super Builtup area (ft²):1600,Carpet Area (ft²):1600,fully furnished,Total Floors:6 , Bedrooms: 3, Bathrooms: 3', 31),
(88, 'addspacephotos/3078f16.webp', 'Super Builtup area (ft²):1600,Carpet Area (ft²):1600,fully furnished,Total Floors:6 , Bedrooms: 3, Bathrooms: 3', 31),
(89, 'addspacephotos/9304f18.webp', '3 Bedrooms - 3 Baths - area:1500 ft2, fully furnished', 32),
(90, 'addspacephotos/9102f19.webp', '3 Bedrooms - 3 Baths - area:1500 ft2, fully furnished', 32),
(91, 'addspacephotos/2947f20.webp', '3 Bedrooms - 3 Baths - area:1500 ft2, fully furnished', 32),
(92, 'addspacephotos/6193f22.bmp', 'Built-Up Area: 2050 Sq.ft.,Bedroom:4, newly built flat with four bedroom drawing room. lobby and attach bath and modular kitchen at a Jalandhar heights.', 33),
(93, 'addspacephotos/9219f23.png', 'Built-Up Area: 2050 Sq.ft.,Bedroom:4, newly built flat with four bedroom drawing room. lobby and attach bath and modular kitchen at a Jalandhar heights', 33),
(94, 'addspacephotos/2537f24.png', 'Built-Up Area: 2050 Sq.ft.,Bedroom:4, newly built flat with four bedroom drawing room. lobby and attach bath and modular kitchen at a Jalandhar heights.', 33),
(95, 'addspacephotos/7886f26.png', 'Built-Up Area:2000 Sq.ft.,Carpet Area:1000 Sq.ft, 1 Bedroom, 2 Bathroom, Balcony:1', 34),
(96, 'addspacephotos/6694f27.png', 'Built-Up Area:2000 Sq.ft.,Carpet Area:1000 Sq.ft, 1 Bedroom, 2 Bathroom, Balcony:1', 34),
(97, 'addspacephotos/4904f28.png', 'Built-Up Area:2000 Sq.ft.,Carpet Area:1000 Sq.ft, 1 Bedroom, 2 Bathroom, Balcony:1', 34),
(98, 'addspacephotos/8164f30.png', 'Built-Up Area:1000 Sq.ft, 2 Bedrooms,North Facing 2 Bedroom, Drawing room, lobby, at first floor. furnished with AC, Fridge, RO water Purifier, Water Geyser, Gas Stove, fan in each room, 2 Cooler, curtain etc.', 35),
(99, 'addspacephotos/6194f31.png', 'Built-Up Area:1000 Sq.ft, 2 Bedrooms,North Facing 2 Bedroom, Drawing room, lobby, at first floor. furnished with AC, Fridge, RO water Purifier, Water Geyser, Gas Stove, fan in each room, 2 Cooler, curtain etc.', 35),
(100, 'addspacephotos/6351f32.png', 'Built-Up Area:1000 Sq.ft, 2 Bedrooms,North Facing 2 Bedroom, Drawing room, lobby, at first floor. furnished with AC, Fridge, RO water Purifier, Water Geyser, Gas Stove, fan in each room, 2 Cooler, curtain etc.', 35),
(101, 'addspacephotos/8934f34.jpg', '2 rooms with King size double bed each,1 makeshift bed in each room if required,2 bedrooms,2 bathrooms,each room with attached personal washroom.', 36),
(102, 'addspacephotos/3373f35.jpg', '2 rooms with King size double bed each,1 makeshift bed in each room if required,2 bedrooms,2 bathrooms,each room with attached personal washroom.', 36),
(103, 'addspacephotos/2804f36.jpg', '2 rooms with King size double bed each,1 makeshift bed in each room if required,2 bedrooms,2 bathrooms,each room with attached personal washroom.', 36),
(104, 'addspacephotos/5072f38.jpg', '3 bedrooms,2 beds,2 bathrooms,The listing is of a 1st floor flat with a private entrance having 3 spacious bedrooms with 3 bathrooms and a kitchenette and parking.There is ample parking in the colony and the colony is gated along with night guards on patrol.', 37),
(105, 'addspacephotos/2923f39.jpg', '3 bedrooms,2 beds,2 bathrooms,The listing is of a 1st floor flat with a private entrance having 3 spacious bedrooms with 3 bathrooms and a kitchenette and parking.There is ample parking in the colony and the colony is gated along with night guards on patrol.', 37),
(106, 'addspacephotos/2322f40.jpg', '3 bedrooms,2 beds,2 bathrooms,The listing is of a 1st floor flat with a private entrance having 3 spacious bedrooms with 3 bathrooms and a kitchenette and parking.There is ample parking in the colony and the colony is gated along with night guards on patrol.', 37),
(107, 'addspacephotos/1890f41.jpg', '3 bedrooms,2 beds,2 bathrooms,The listing is of a 1st floor flat with a private entrance having 3 spacious bedrooms with 3 bathrooms and a kitchenette and parking.There is ample parking in the colony and the colony is gated along with night guards on patrol.', 37),
(108, 'addspacephotos/450f43.jpg', '2 Bedrooms,2 Baths,1 Balcony,Spacious Flat with all amenities,fully furnished with a lush green garden.', 38),
(109, 'addspacephotos/6127f44.jpg', '2 Bedrooms,2 Baths,1 Balcony,Spacious Flat with all amenities,fully furnished with a lush green garden.', 38),
(110, 'addspacephotos/6758f45.jpg', '2 Bedrooms,2 Baths,1 Balcony,Spacious Flat with all amenities,fully furnished with a lush green garden.', 38),
(111, 'addspacephotos/1804v2.jpg', 'Experience all the famous attractions of Amritsar close by, or just unwind at this modern villa with a huge, lovely garden, plenty of natural lighting, spacious bedrooms and highly aesthetic interiors. Luxury and comfort go hand-in-hand here.', 39),
(112, 'addspacephotos/1397v3.jpg', 'Experience all the famous attractions of Amritsar close by, or just unwind at this modern villa with a huge, lovely garden, plenty of natural lighting, spacious bedrooms and highly aesthetic interiors. Luxury and comfort go hand-in-hand here.', 39),
(113, 'addspacephotos/5096v4.jpg', 'Experience all the famous attractions of Amritsar close by, or just unwind at this modern villa with a huge, lovely garden, plenty of natural lighting, spacious bedrooms and highly aesthetic interiors. Luxury and comfort go hand-in-hand here.', 39),
(114, 'addspacephotos/1647v6.jpg', '2 bedrooms, 2 washrooms, a beautiful garden,fully furnished and modern rooms with all amenities needed for comfy stay and cherished experience.All Public spaces, malls & shopping centres are at a walking distance along with easy access to Public Transport.', 40),
(115, 'addspacephotos/1780v7.jpg', '2 bedrooms, 2 washrooms, a beautiful garden,fully furnished and modern rooms with all amenities needed for comfy stay and cherished experience.All Public spaces, malls & shopping centres are at a walking distance along with easy access to Public Transport.', 40),
(116, 'addspacephotos/4271v8.jpg', '2 bedrooms, 2 washrooms, a beautiful garden,fully furnished and modern rooms with all amenities needed for comfy stay and cherished experience.All Public spaces, malls & shopping centres are at a walking distance along with easy access to Public Transport.', 40),
(117, 'addspacephotos/5306v10.jpg', '2 bedrooms, 2 washrooms, a garden, The villa offers a heaven of peace and tranquillity, set with a stunning contrasting view of the modern households along with the grassland countryside. private rooms with access to wifi, pool, gym, air conditioning, laundry etc. ', 41),
(118, 'addspacephotos/6365v12.jpg', '2 bedrooms, 2 washrooms, a garden, The villa offers a heaven of peace and tranquillity, set with a stunning contrasting view of the modern households along with the grassland countryside. private rooms with access to wifi, pool, gym, air conditioning, laundry etc. ', 41),
(119, 'addspacephotos/3677v13.jpg', '2 bedrooms, 2 washrooms, a garden, The villa offers a heaven of peace and tranquillity, set with a stunning contrasting view of the modern households along with the grassland countryside. private rooms with access to wifi, pool, gym, air conditioning, laundry etc. ', 41),
(120, 'addspacephotos/7759v14.jpg', '2 bedroom, 2 baths, lush green garden, swimming pool, fully furnished, a beautiful lounge and spacious balcony with all basic facilities including parking.', 42),
(121, 'addspacephotos/8891v15.jpg', '2 bedroom, 2 baths, lush green garden, swimming pool, fully furnished, a beautiful lounge and spacious balcony with all basic facilities including parking.', 42),
(122, 'addspacephotos/6263v17.jpg', '2 bedroom, 2 baths, lush green garden, swimming pool, fully furnished, a beautiful lounge and spacious balcony with all basic facilities including parking.', 42),
(123, 'addspacephotos/4386v18.jpg', '2 bedroom, 2 baths, lush green garden, swimming pool, fully furnished, a beautiful lounge and spacious balcony with all basic facilities including parking.', 42),
(124, 'addspacephotos/1381f48.jpg', '2 Bedrooms, 2 Baths,1 Balcony ,A cozy flat with a television, kitchen, balcony and bathroom makes this a cheap alternative.Flat features wooden furnishing, and is complete with all the amenities required for a comfortable stay with facility of lift.', 43),
(125, 'addspacephotos/8881f49.jpg', '2 Bedrooms, 2 Baths,1 Balcony ,A cozy flat with a television, kitchen, balcony and bathroom makes this a cheap alternative.Flat features wooden furnishing, and is complete with all the amenities required for a comfortable stay with facility of lift.', 43),
(126, 'addspacephotos/5451v20.jpg', '3 bedrooms,3 bathrooms,set in green environment villa is on ground floor and has all modern facilities.', 44),
(128, 'addspacephotos/7040v21.jpg', '3 bedrooms,3 bathrooms,set in green environment villa is on ground floor and has all modern facilities', 44),
(129, 'addspacephotos/1574v22.jpg', '3 bedrooms,3 bathrooms,set in green environment villa is on ground floor and has all modern facilities', 44),
(130, 'addspacephotos/243v24.jpg', 'Spacious Villa surrounded by greenry all around is a sight to behold. 2 bedrooms,2 baths and a spacious backyard to rewind, with all high tech facilities.', 45),
(131, 'addspacephotos/8460v25.jpg', 'Spacious Villa surrounded by greenry all around is a sight to behold. 2 bedrooms,2 baths and a spacious backyard to rewind, with all high tech facilities', 45),
(132, 'addspacephotos/3166v26.jpg', 'Spacious Villa surrounded by greenry all around is a sight to behold. 2 bedrooms,2 baths and a spacious backyard to rewind, with all high tech facilities', 45),
(133, 'addspacephotos/8052f51.jpg', '3 bedrooms, 3 Bathrooms, The flat is in the prime location, on the corner, neat and tidy, with no interference and with a good neighborhood. The Rooms are airy and spacious, the washrooms are neat and clean.Ample space for parking is available.', 46),
(134, 'addspacephotos/1730f52.jpg', '3 bedrooms, 3 Bathrooms, The flat is in the prime location, on the corner, neat and tidy, with no interference and with a good neighborhood. The Rooms are airy and spacious, the washrooms are neat and clean.Ample space for parking is available.', 46),
(135, 'addspacephotos/6665f53.jpg', '3 bedrooms, 3 Bathrooms, The flat is in the prime location, on the corner, neat and tidy, with no interference and with a good neighborhood. The Rooms are airy and spacious, the washrooms are neat and clean.Ample space for parking is available.', 46),
(136, 'addspacephotos/4222f55.jpg', '2 bedrooms, 2 bathrooms,surrounded by lush greenry,Located in the lanes of Garden Green Enclave, this 2 BHK is conveniently located in a neighbourhood which is close to the main highway leading to Wagah Border.well-furnished with all the modern amenities.', 47),
(137, 'addspacephotos/5174f56.jpg', '2 bedrooms, 2 bathrooms,surrounded by lush greenry,Located in the lanes of Garden Green Enclave, this 2 BHK is conveniently located in a neighbourhood which is close to the main highway leading to Wagah Border.well-furnished with all the modern amenities.', 47),
(138, 'addspacephotos/3982f57.jpg', '2 bedrooms, 2 bathrooms,surrounded by lush greenry,Located in the lanes of Garden Green Enclave, this 2 BHK is conveniently located in a neighbourhood which is close to the main highway leading to Wagah Border.well-furnished with all the modern amenities.', 47),
(139, 'addspacephotos/7848pg45.webp', 'New fully furnished PG including bed,almirah,fan and other basic things. There are 2 Rooms along with a kitchen and 2 washrooms. 2 Rooms can be on sharing and non sharing basis. AC will be available on demand. It is located in the safe and secure place, in the centre of city.Meals or Tiffin facility can be available as per demand.', 48),
(140, 'addspacephotos/2852pg46.webp', 'New fully furnished PG including bed,almirah,fan and other basic things. There are 2 Rooms along with a kitchen and 2 washrooms. 2 Rooms can be on sharing and non sharing basis. AC will be available on demand. It is located in the safe and secure place, in the centre of city.Meals or Tiffin facility can be available as per demand.', 48),
(141, 'addspacephotos/216s2.png', 'Super area:500 sqft, Carpet area:500 sqft, Plot area:600 sqft , Furnished', 49),
(142, 'addspacephotos/7587s3.png', 'Super area:500 sqft,Carpet area:500 sqft,Plot area:600 sqft , Furnished', 49),
(143, 'addspacephotos/8340ap55.jpeg', '3 Bedrooms , 3 Bathrooms, 1 Balcony with Pooja Room, Area Super Built up area: 2000 sqft(1672.25 sq.m.),Built Up area: 1550 sq.yards (1296 sq.m.),Carpet area: 1150 sq.yards (961.55 sq.m.) , Furnished, Three bedrooms set attached bathroom with kitchen lobby equipped with all modran facilities walking distance to main market or mbd mall ferzpur road ludhaina.', 52),
(144, 'addspacephotos/8143ap56.jpeg', '3 Bedrooms , 3 Bathrooms, 1 Balcony with Pooja Room, Area Super Built up area: 2000 sqft(1672.25 sq.m.),Built Up area: 1550 sq.yards (1296 sq.m.),Carpet area: 1150 sq.yards (961.55 sq.m.) , Furnished, Three bedrooms set attached bathroom with kitchen lobby equipped with all modran facilities walking distance to main market or mbd mall ferzpur road ludhaina.', 52),
(145, 'addspacephotos/4627ap57.jpeg', '3 Bedrooms , 3 Bathrooms, 1 Balcony with Pooja Room, Area Super Built up area: 2000 sqft(1672.25 sq.m.),Built Up area: 1550 sq.yards (1296 sq.m.),Carpet area: 1150 sq.yards (961.55 sq.m.) , Furnished, Three bedrooms set attached bathroom with kitchen lobby equipped with all modran facilities walking distance to main market or mbd mall ferzpur road ludhaina.', 52),
(146, 'addspacephotos/7984ap58.jpeg', '3 Bedrooms , 2 Bathrooms, 2 Balconies, Area:Super Built up area :1350 sqft(125.42 sq.m.), Carpet area: 1000 sq.ft., Furnished, Property is in prime location near dmc hospital, railway station, market everything thing easy to approach . Posh area,  good location west facing,  well maintained property,  easily approachable public transport,  safe society for families.', 53),
(147, 'addspacephotos/1522ap59.jpeg', '3 Bedrooms , 2 Bathrooms, 2 Balconies, Area:Super Built up area :1350 sqft(125.42 sq.m.), Carpet area: 1000 sq.ft., Furnished, Property is in prime location near dmc hospital, railway station, market everything thing easy to approach . Posh area,  good location west facing,  well maintained property,  easily approachable public transport,  safe society for families.', 53),
(148, 'addspacephotos/7842ap60.jpeg', '3 Bedrooms , 2 Bathrooms, 2 Balconies, Area:Super Built up area :1350 sqft(125.42 sq.m.), Carpet area: 1000 sq.ft., Furnished, Property is in prime location near dmc hospital, railway station, market everything thing easy to approach . Posh area,  good location west facing,  well maintained property,  easily approachable public transport,  safe society for families.', 53),
(149, 'addspacephotos/4489v29.jpeg', 'Status: Furnished, Area: 1,500 sq ft, Well designed 2 bhk independent villa is available at a prime location in Sunil Park. It has area of 1500 sqft and is available at a rent of Rs. 11,000. Furnishings include 2 wardrobe, 1 tv, 1 ac and 2 bed. It is facing east direction. The property has 2 bathrooms and 1 balcony. It is well connected to the city areas.', 54),
(150, 'addspacephotos/518v30.jpeg', 'Status: Furnished, Area: 1,500 sq ft, Well designed 2 bhk independent villa is available at a prime location in Sunil Park. It has area of 1500 sqft and is available at a rent of Rs. 11,000. Furnishings include 2 wardrobe, 1 tv, 1 ac and 2 bed. It is facing east direction. The property has 2 bathrooms and 1 balcony. It is well connected to the city areas.', 54),
(151, 'addspacephotos/8165v31.jpeg', 'Status: Furnished, Area: 1,500 sq ft, Well designed 2 bhk independent villa is available at a prime location in Sunil Park. It has area of 1500 sqft and is available at a rent of Rs. 11,000. Furnishings include 2 wardrobe, 1 tv, 1 ac and 2 bed. It is facing east direction. The property has 2 bathrooms and 1 balcony. It is well connected to the city areas.', 54),
(152, 'addspacephotos/4843v33.jpeg', 'Area: 1,800 sq ft, Furnished, 2 Bedrooms, 2 Baths, It has area of 1800 sqft and is available at a rent of Rs. 18,000. The house is furnished. Furnishings include 2 wardrobe, 1 tv, 1 refrigerator, 1 sofa, 1 dining table, 2 ac and 2 bed. It is northeast facing property. It has 2 bathrooms and 1 balcony. It is made in way to provide a comfortable living. It is well connected to the city areas.', 55),
(153, 'addspacephotos/7980v34.jpeg', 'Area: 1,800 sq ft, Furnished, 2 Bedrooms, 2 Baths, It has area of 1800 sqft and is available at a rent of Rs. 18,000. The house is furnished. Furnishings include 2 wardrobe, 1 tv, 1 refrigerator, 1 sofa, 1 dining table, 2 ac and 2 bed. It is northeast facing property. It has 2 bathrooms and 1 balcony. It is made in way to provide a comfortable living. It is well connected to the city areas.', 55),
(154, 'addspacephotos/2867v35.jpeg', 'Area: 1,800 sq ft, Furnished, 2 Bedrooms, 2 Baths, It has area of 1800 sqft and is available at a rent of Rs. 18,000. The house is furnished. Furnishings include 2 wardrobe, 1 tv, 1 refrigerator, 1 sofa, 1 dining table, 2 ac and 2 bed. It is northeast facing property. It has 2 bathrooms and 1 balcony. It is made in way to provide a comfortable living. It is well connected to the city areas.', 55),
(155, 'addspacephotos/4397v37.jpeg', 'Area: 500 sq ft, furnished, 2 Bedrooms, 2 Baths, North facing, 1 Balcony, Two Rooms and attached bathrooms with Kitchen and Living cum dining room also available. Fully furnished house. No male interference & safe for girls. Nearest to Pakhowal road. Genuine rent.', 56),
(156, 'addspacephotos/3091v38.jpeg', 'Area: 500 sq ft, furnished, 2 Bedrooms, 2 Baths, North facing, 1 Balcony, Two Rooms and attached bathrooms with Kitchen and Living cum dining room also available. Fully furnished house. No male interference & safe for girls. Nearest to Pakhowal road. Genuine rent.', 56),
(157, 'addspacephotos/9230v39.jpeg', 'Area: 500 sq ft, furnished, 2 Bedrooms, 2 Baths, North facing, 1 Balcony, Two Rooms and attached bathrooms with Kitchen and Living cum dining room also available. Fully furnished house. No male interference & safe for girls. Nearest to Pakhowal road. Genuine rent.', 56),
(158, 'addspacephotos/7947v40.jpeg', 'Area: 500 sq ft, furnished, 2 Bedrooms, 2 Baths, North facing, 1 Balcony, Two Rooms and attached bathrooms with Kitchen and Living cum dining room also available. Fully furnished house. No male interference & safe for girls. Nearest to Pakhowal road. Genuine rent.', 56),
(159, 'addspacephotos/8831f59.jpeg', 'Area: 1,500 sq ft, Furnished, Well designed 2 bhk independent house is available at a prime location in Sunil Park. It has area of 1500 sqft . Furnishings include 2 wardrobe, 1 tv, 1 ac and 2 bed. It is facing east direction. The property has 2 bathrooms and 1 balcony. It is well connected to the city areas.', 57),
(160, 'addspacephotos/7008f60.jpeg', 'Area: 1,500 sq ft, Furnished, Well designed 2 bhk independent house is available at a prime location in Sunil Park. It has area of 1500 sqft . Furnishings include 2 wardrobe, 1 tv, 1 ac and 2 bed. It is facing east direction. The property has 2 bathrooms and 1 balcony. It is well connected to the city areas.', 57),
(161, 'addspacephotos/4721f61.jpeg', 'Area: 1,500 sq ft, Furnished, Well designed 2 bhk independent house is available at a prime location in Sunil Park. It has area of 1500 sqft . Furnishings include 2 wardrobe, 1 tv, 1 ac and 2 bed. It is facing east direction. The property has 2 bathrooms and 1 balcony. It is well connected to the city areas.', 57),
(162, 'addspacephotos/8955f63.jpeg', 'Area: 2500 sqft, 2 Bedrooms, 2 Baths, 1 Balcony, Furnished,This spacious 2 bhk builder floor is available for rental and is located in the heart of rajguru nagar. It has area of 2500 sqft and is available at a rent of Rs. 20,000. The house is furnished. It has 2 wardrobe, 1 tv, 1 refrigerator and 1 sofa. It also has 1 washing machine, 1 dining table, 2 ac, 2 bed and 1 modular kitchen. It is located on the 1st floor(out of a total of 3 floor(s)). It is facing east direction. It is made in way to provide a comfortable living. It is well connected to the city areas.', 58),
(163, 'addspacephotos/6947f64.jpeg', 'Area: 2500 sqft, 2 Bedrooms, 2 Baths, 1 Balcony, Furnished,This spacious 2 bhk builder floor is available for rental and is located in the heart of rajguru nagar. It has area of 2500 sqft and is available at a rent of Rs. 20,000. The house is furnished. It has 2 wardrobe, 1 tv, 1 refrigerator and 1 sofa. It also has 1 washing machine, 1 dining table, 2 ac, 2 bed and 1 modular kitchen. It is located on the 1st floor(out of a total of 3 floor(s)). It is facing east direction. It is made in way to provide a comfortable living. It is well connected to the city areas.', 58),
(164, 'addspacephotos/6540f65.jpeg', 'Area: 2500 sqft, 2 Bedrooms, 2 Baths, 1 Balcony, Furnished,This spacious 2 bhk builder floor is available for rental and is located in the heart of rajguru nagar. It has area of 2500 sqft and is available at a rent of Rs. 20,000. The house is furnished. It has 2 wardrobe, 1 tv, 1 refrigerator and 1 sofa. It also has 1 washing machine, 1 dining table, 2 ac, 2 bed and 1 modular kitchen. It is located on the 1st floor(out of a total of 3 floor(s)). It is facing east direction. It is made in way to provide a comfortable living. It is well connected to the city areas.', 58),
(165, 'addspacephotos/8847pg48.jpeg', 'Area: 375 sq ft, 1 Bedroom, 1 Bathroom, 1 Balcony, Furnished, south facing.  This is independent fully furnished one room with parking facility available for Male and female situated just away 3km from froze Gandhi market and 2.5 km from ferozpur road.', 59),
(166, 'addspacephotos/775pg49.jpeg', 'Area: 375 sq ft, 1 Bedroom, 1 Bathroom, 1 Balcony, Furnished, south facing.  This is independent fully furnished one room with parking facility available for Male and female situated just away 3km from froze Gandhi market and 2.5 km from ferozpur road.', 59),
(167, 'addspacephotos/4462f67.jpeg', 'Area: 650 sq ft, 2 Bedrooms, 1 Bath, Furnished, A spacious 2 bhk builder floor is available for rental in Gurdev Nagar, Ludhiana. It is on 1st floor. The building has a total of 2 floor(s). It is facing north direction. It has 1 bathroom and 1 balcony. The time you will spend here will become the greatest moment of your life that will also help you to relieve, relax & evoke a great sense of happiness. The site is in close proximity to various civic utilities', 60),
(168, 'addspacephotos/2340f68.jpeg', 'Area: 650 sq ft, 2 Bedrooms, 1 Bath, Furnished, A spacious 2 bhk builder floor is available for rental in Gurdev Nagar, Ludhiana. It is on 1st floor. The building has a total of 2 floor(s). It is facing north direction. It has 1 bathroom and 1 balcony. The time you will spend here will become the greatest moment of your life that will also help you to relieve, relax & evoke a great sense of happiness. The site is in close proximity to various civic utilities.', 60),
(169, 'addspacephotos/5228f69.jpeg', 'Area: 650 sq ft, 2 Bedrooms, 1 Bath, Furnished, A spacious 2 bhk builder floor is available for rental in Gurdev Nagar, Ludhiana. It is on 1st floor. The building has a total of 2 floor(s). It is facing north direction. It has 1 bathroom and 1 balcony. The time you will spend here will become the greatest moment of your life that will also help you to relieve, relax & evoke a great sense of happiness. The site is in close proximity to various civic utilities.', 60),
(170, 'addspacephotos/2086f71.jpeg', '2 Bedrooms, 2 Baths, Semifurnished, Well designed 2 bhk builder floor is available at a prime location in Rajguru nagar. The house is semi-furnished. It is on the 1st floor of the building (total number of floors are 3). It is east facing property. The property has 2 bathrooms and 1 balcony. It is made in way to provide a comfortable living for the residents. The site is in close proximity to various civic utilities. ', 61),
(171, 'addspacephotos/8108f72.jpeg', '2 Bedrooms, 2 Baths, Semifurnished, Well designed 2 bhk builder floor is available at a prime location in Rajguru nagar. The house is semi-furnished. It is on the 1st floor of the building (total number of floors are 3). It is east facing property. The property has 2 bathrooms and 1 balcony. It is made in way to provide a comfortable living for the residents. The site is in close proximity to various civic utilities. ', 61),
(172, 'addspacephotos/6297ap62.jpeg', '3 bedrooms, 3 Bathrooms, 1 balcony, Furnished, It’s a 3 bhk multistorey apartment situated in Urban Estate. It is a furnished property. It’s on 3rd floor out of 4 floors building. The property has 3 bathrooms and 3 balconies. It is made in way to provide a comfortable living for the residents.', 62),
(173, 'addspacephotos/864ap63.jpeg', '3 bedrooms, 3 Bathrooms, 1 balcony, Furnished, It’s a 3 bhk multistorey apartment situated in Urban Estate. It is a furnished property. It’s on 3rd floor out of 4 floors building. The property has 3 bathrooms and 3 balconies. It is made in way to provide a comfortable living for the residents.', 62),
(174, 'addspacephotos/6230ap64.jpeg', '3 bedrooms, 3 Bathrooms, 1 balcony, Furnished, It’s a 3 bhk multistorey apartment situated in Urban Estate. It is a furnished property. It’s on 3rd floor out of 4 floors building. The property has 3 bathrooms and 3 balconies. It is made in way to provide a comfortable living for the residents.', 62),
(175, 'addspacephotos/8886ap66.jpeg', 'Area: 1,350 sq ft, furnished, 2 Bedrooms, 2 Bathrooms, It’s a 2 bhk independent house situated in Brs nagar, Ludhiana. It has an area of 1350 sqft with a carpet area of 1200 sqft . Its main door is facing east direction. It has 2 bathrooms and 1 balcony. It is made in way to provide a comfortable living for the residents. The site is in close proximity to various civic utilities.', 63),
(176, 'addspacephotos/9213ap67.jpeg', 'Area: 1,350 sq ft, furnished, 2 Bedrooms, 2 Bathrooms, It’s a 2 bhk independent house situated in Brs nagar, Ludhiana. It has an area of 1350 sqft with a carpet area of 1200 sqft . Its main door is facing east direction. It has 2 bathrooms and 1 balcony. It is made in way to provide a comfortable living for the residents. The site is in close proximity to various civic utilities.', 63),
(177, 'addspacephotos/2713ap68.jpeg', 'Area: 1,350 sq ft, furnished, 2 Bedrooms, 2 Bathrooms, It’s a 2 bhk independent house situated in Brs nagar, Ludhiana. It has an area of 1350 sqft with a carpet area of 1200 sqft . Its main door is facing east direction. It has 2 bathrooms and 1 balcony. It is made in way to provide a comfortable living for the residents. The site is in close proximity to various civic utilities.', 63),
(178, 'addspacephotos/7579f73.png', 'Super area: 1085 sqft, Carpet area: 880 sqft , Unfurnished, This Home has 2 bedroom and it is on 1st floor and has 2 bathroom.', 64),
(179, 'addspacephotos/2266f74.png', 'Super area: 1085 sqft, Carpet area: 880 sqft , Unfurnished, This Home has 2 bedroom and it is on 1st floor and has 2 bathroom.', 64),
(180, 'addspacephotos/6606f75.png', 'Super area: 1085 sqft, Carpet area: 880 sqft , Unfurnished, This Home has 2 bedroom and it is on 1st floor and has 2 bathroom.', 64),
(181, 'addspacephotos/2967ap70.png', '2 Bedrooms,2 Bathrooms, 2 Balconies, Semi-furnished , Super area:1200 sqft, Carpet area: 850 sqft, East Facing, Fully independent, well maintained 2 bhk apartment is available for rent in ireo waterfront ludhiana, with modular kitchen, vitrified tiles flooring, attached bathrooms, balconies, ample car parking.', 65),
(182, 'addspacephotos/6464ap71.png', '2 Bedrooms,2 Bathrooms, 2 Balconies, Semi-furnished , Super area:1200 sqft, Carpet area: 850 sqft, East Facing, Fully independent, well maintained 2 bhk apartment is available for rent in ireo waterfront ludhiana, with modular kitchen, vitrified tiles flooring, attached bathrooms, balconies, ample car parking.', 65),
(183, 'addspacephotos/6400ap72.png', '2 Bedrooms,2 Bathrooms, 2 Balconies, Semi-furnished , Super area:1200 sqft, Carpet area: 850 sqft, East Facing, Fully independent, well maintained 2 bhk apartment is available for rent in ireo waterfront ludhiana, with modular kitchen, vitrified tiles flooring, attached bathrooms, balconies, ample car parking.', 65),
(184, 'addspacephotos/96f75.jpg', 'Super area: 1500 sqft, Carpet area: 1600 sqft, 2 Bedrooms, 2 Bathrooms, 1 Balcony, 1 Pooja Room, Furnished, 2bhk flat fully furnished with car parking in Gurdev nagar.', 66),
(185, 'addspacephotos/4680f75.png', 'Super area: 1500 sqft, Carpet area: 1600 sqft, 2 Bedrooms, 2 Bathrooms, 1 Balcony, 1 Pooja Room, Furnished, 2bhk flat fully furnished with car parking in Gurdev nagar.', 66),
(186, 'addspacephotos/1242f76.png', 'Super area: 1500 sqft, Carpet area: 1600 sqft, 2 Bedrooms, 2 Bathrooms, 1 Balcony, 1 Pooja Room, Furnished, 2bhk flat fully furnished with car parking in Gurdev nagar.', 66),
(187, 'addspacephotos/5767pg2.png', 'Furnished, Occupancy:Single & Sharing, 4 Bathrooms, 3 Balconies, 7 rooms, east facing', 67),
(188, 'addspacephotos/650pg3.png', 'Furnished, Occupancy:Single & Sharing, 4 Bathrooms, 3 Balconies, 7 rooms, east facing', 67),
(189, 'addspacephotos/7443pg4.png', 'Furnished, Occupancy:Single & Sharing, 4 Bathrooms, 3 Balconies, 7 rooms, east facing', 67),
(190, 'addspacephotos/1522pg3.png', 'Address: C Block 12, Ranjit Avenue, Amritsar, Punjab Neat and clean place With almirah and bathrooms attached laundary available on extra charges.', 1),
(191, 'addspacephotos/4961v42.jpg', '2 bedrooms,2 beds,2 bathrooms,It is a newly constructed property with a modular kitchen, a living area and 2 bedrooms. One suite room with a sitting and a second deluxe size room. It is perfect for families, couples and business travellers. Located on GT Road near Mall of Amritsar, it is easily accessible through Public transport and popular restaurants and malls are at distance of less than 1 km.', 68),
(192, 'addspacephotos/1940v43.jpg', '2 bedrooms,2 beds,2 bathrooms,It is a newly constructed property with a modular kitchen, a living area and 2 bedrooms. One suite room with a sitting and a second deluxe size room. It is perfect for families, couples and business travellers. Located on GT Road near Mall of Amritsar, it is easily accessible through Public transport and popular restaurants and malls are at distance of less than 1 km.', 68),
(193, 'addspacephotos/4273v44.jpg', '2 bedrooms,2 beds,2 bathrooms,It is a newly constructed property with a modular kitchen, a living area and 2 bedrooms. One suite room with a sitting and a second deluxe size room. It is perfect for families, couples and business travellers. Located on GT Road near Mall of Amritsar, it is easily accessible through Public transport and popular restaurants and malls are at distance of less than 1 km.', 68),
(194, 'addspacephotos/5404ap71.jpg', '2 bedrooms,2 beds,2 bathrooms,It Is a Neat and Beautifully maintained apartment .Perfect for a comfortable stay.Easy Approach.All Important places are within 3 TO 4 kms. Open porch and a terrace garden .This is on the ground floor.owner is on the first floor.', 69),
(195, 'addspacephotos/4597ap72.jpg', '2 bedrooms,2 beds,2 bathrooms,It Is a Neat and Beautifully maintained apartment .Perfect for a comfortable stay.Easy Approach.All Important places are within 3 TO 4 kms. Open porch and a terrace garden .This is on the ground floor.owner is on the first floor.', 69),
(196, 'addspacephotos/5458ap73.jpg', '2 bedrooms,2 beds,2 bathrooms,It Is a Neat and Beautifully maintained apartment .Perfect for a comfortable stay.Easy Approach.All Important places are within 3 TO 4 kms. Open porch and a terrace garden .This is on the ground floor.owner is on the first floor.', 69),
(197, 'addspacephotos/1799v46.jpg', '1 bedroom,1 bed,1 private bathroom, It is a luxury villa with porticos set up in a colonial style of architecture located in the heart of jalandhar city.The place is a modern villa with all the amenities surrounded by big lawns and a kitchen garden growing organic vegetables and having its own fresh milk and poultry from its own cows and hens.Its a great place for nature lovers .A quiet and peaceful place to stay and relax.A home away from home very close to railway and bus terminals.', 70),
(198, 'addspacephotos/1345v47.jpg', '1 bedroom,1 bed,1 private bathroom, It is a luxury villa with porticos set up in a colonial style of architecture located in the heart of jalandhar city.The place is a modern villa with all the amenities surrounded by big lawns and a kitchen garden growing organic vegetables and having its own fresh milk and poultry from its own cows and hens.Its a great place for nature lovers .A quiet and peaceful place to stay and relax.A home away from home very close to railway and bus terminals.', 70),
(199, 'addspacephotos/7831v48.jpg', '1 bedroom,1 bed,1 private bathroom, It is a luxury villa with porticos set up in a colonial style of architecture located in the heart of jalandhar city.The place is a modern villa with all the amenities surrounded by big lawns and a kitchen garden growing organic vegetables and having its own fresh milk and poultry from its own cows and hens.Its a great place for nature lovers .A quiet and peaceful place to stay and relax.A home away from home very close to railway and bus terminals.', 70),
(200, 'addspacephotos/9651v49.jpg', '1 bedroom,1 bed,1 private bathroom, It is a luxury villa with porticos set up in a colonial style of architecture located in the heart of jalandhar city.The place is a modern villa with all the amenities surrounded by big lawns and a kitchen garden growing organic vegetables and having its own fresh milk and poultry from its own cows and hens.Its a great place for nature lovers .A quiet and peaceful place to stay and relax.A home away from home very close to railway and bus terminals.', 70);
INSERT INTO `photos` (`pid`, `photo`, `description`, `roomid`) VALUES
(201, 'addspacephotos/8143v51.jpg', '1 bedroom,2 beds,1 shared bathroom, 5 bedroom spacious villa in the heart of Punjab (Jalandhar) reflects a modern architectural and design aesthetic. We are surrounded by nature outside and within the house, with 2/3rd of our plot being green space. All rooms have a spacious balcony attached that envelops the first floor, surrounded by nature and practice completely green living at home. Spacious lawn is available on ground floor.', 71),
(202, 'addspacephotos/9839v52.jpg', '1 bedroom,2 beds,1 shared bathroom, 5 bedroom spacious villa in the heart of Punjab (Jalandhar) reflects a modern architectural and design aesthetic. We are surrounded by nature outside and within the house, with 2/3rd of our plot being green space. All rooms have a spacious balcony attached that envelops the first floor, surrounded by nature and practice completely green living at home. Spacious lawn is available on ground floor.', 71),
(203, 'addspacephotos/5076v53.jpg', '1 bedroom,2 beds,1 shared bathroom, 5 bedroom spacious villa in the heart of Punjab (Jalandhar) reflects a modern architectural and design aesthetic. We are surrounded by nature outside and within the house, with 2/3rd of our plot being green space. All rooms have a spacious balcony attached that envelops the first floor, surrounded by nature and practice completely green living at home. Spacious lawn is available on ground floor.', 71),
(204, 'addspacephotos/7300v54.jpg', '1 bedroom,2 beds,1 shared bathroom, 5 bedroom spacious villa in the heart of Punjab (Jalandhar) reflects a modern architectural and design aesthetic. We are surrounded by nature outside and within the house, with 2/3rd of our plot being green space. All rooms have a spacious balcony attached that envelops the first floor, surrounded by nature and practice completely green living at home. Spacious lawn is available on ground floor.', 71),
(205, 'addspacephotos/6661v56.jpg', '3 bedrooms,3 beds,3 bathrooms,Modern Grand Villa is located on Gurbanta Singh road in Jalandhar. Easily approachable by car/ taxi. It is surrounded by greenery and peaceful environment. Safe parking is available. Big fully equipped kitchen and common dining lobby is available. Whole place is safe and secure under surveillance of CCTV cameras. Balconies and open verandahs are there to enjoy outside views and relaxing.The place is neat and clean, tastefully built alongside canal on the main road. If you want to stay in safe and peaceful environment, then come to our place.', 72),
(206, 'addspacephotos/3469v57.jpg', '3 bedrooms,3 beds,3 bathrooms,Modern Grand Villa is located on Gurbanta Singh road in Jalandhar. Easily approachable by car/ taxi. It is surrounded by greenery and peaceful environment. Safe parking is available. Big fully equipped kitchen and common dining lobby is available. Whole place is safe and secure under surveillance of CCTV cameras. Balconies and open verandahs are there to enjoy outside views and relaxing.The place is neat and clean, tastefully built alongside canal on the main road. If you want to stay in safe and peaceful environment, then come to our place.', 72),
(207, 'addspacephotos/977v58.jpg', '3 bedrooms,3 beds,3 bathrooms,Modern Grand Villa is located on Gurbanta Singh road in Jalandhar. Easily approachable by car/ taxi. It is surrounded by greenery and peaceful environment. Safe parking is available. Big fully equipped kitchen and common dining lobby is available. Whole place is safe and secure under surveillance of CCTV cameras. Balconies and open verandahs are there to enjoy outside views and relaxing.The place is neat and clean, tastefully built alongside canal on the main road. If you want to stay in safe and peaceful environment, then come to our place.', 72),
(208, 'addspacephotos/6259v59.jpg', '3 bedrooms,3 beds,3 bathrooms,Modern Grand Villa is located on Gurbanta Singh road in Jalandhar. Easily approachable by car/ taxi. It is surrounded by greenery and peaceful environment. Safe parking is available. Big fully equipped kitchen and common dining lobby is available. Whole place is safe and secure under surveillance of CCTV cameras. Balconies and open verandahs are there to enjoy outside views and relaxing.The place is neat and clean, tastefully built alongside canal on the main road. If you want to stay in safe and peaceful environment, then come to our place.', 72),
(209, 'addspacephotos/4604v60.jpg', '3 bedrooms,3 beds,3 bathrooms,Modern Grand Villa is located on Gurbanta Singh road in Jalandhar. Easily approachable by car/ taxi. It is surrounded by greenery and peaceful environment. Safe parking is available. Big fully equipped kitchen and common dining lobby is available. Whole place is safe and secure under surveillance of CCTV cameras. Balconies and open verandahs are there to enjoy outside views and relaxing.The place is neat and clean, tastefully built alongside canal on the main road. If you want to stay in safe and peaceful environment, then come to our place.', 72),
(210, 'addspacephotos/5942pg51.jpg', '1 bedroom,1 bed,1 bathrooms,Room is on 1st floor.Comforts 2 guests.Double bed with medicated mattresses;Study table with chair;\nWooden wardrobe & ceiling fan.Split AC unit is fitted and chargeable at Rs.250 for 12 hours of night.Bathroom is private, not attached & located in 1st floor lobby. Hot water provided on request.Guest enjoy airy terrace & shared house is lobby-cum-dining area at ground floor.It is beautifully constructed with a contemporary style to suit and please most kind of persons. It is open, airy, bright and cheerful. With over 1700 sq.ft of space, lots of upgrades have been made to the home.Flooring is of broken marble stone and all doors are crafted of wood. Room has double lock arrangement for additional safety and security.House is porch, parking space, lobby area, dining room and terraces are available on sharing basis.', 73),
(211, 'addspacephotos/6225pg52.jpg', '1 bedroom,1 bed,1 bathrooms,Room is on 1st floor.Comforts 2 guests.Double bed with medicated mattresses;Study table with chair;\nWooden wardrobe & ceiling fan.Split AC unit is fitted and chargeable at Rs.250 for 12 hours of night.Bathroom is private, not attached & located in 1st floor lobby. Hot water provided on request.Guest enjoy airy terrace & shared house is lobby-cum-dining area at ground floor.It is beautifully constructed with a contemporary style to suit and please most kind of persons. It is open, airy, bright and cheerful. With over 1700 sq.ft of space, lots of upgrades have been made to the home.Flooring is of broken marble stone and all doors are crafted of wood. Room has double lock arrangement for additional safety and security.House is porch, parking space, lobby area, dining room and terraces are available on sharing basis.', 73),
(212, 'addspacephotos/5893pg53.jpg', '1 bedroom,1 bed,1 bathrooms,Room is on 1st floor.Comforts 2 guests.Double bed with medicated mattresses;Study table with chair;\nWooden wardrobe & ceiling fan.Split AC unit is fitted and chargeable at Rs.250 for 12 hours of night.Bathroom is private, not attached & located in 1st floor lobby. Hot water provided on request.Guest enjoy airy terrace & shared house is lobby-cum-dining area at ground floor.It is beautifully constructed with a contemporary style to suit and please most kind of persons. It is open, airy, bright and cheerful. With over 1700 sq.ft of space, lots of upgrades have been made to the home.Flooring is of broken marble stone and all doors are crafted of wood. Room has double lock arrangement for additional safety and security.House is porch, parking space, lobby area, dining room and terraces are available on sharing basis.', 73),
(213, 'addspacephotos/8525pg54.jpg', '1 bedroom,1 bed,1 bathrooms,Room is on 1st floor.Comforts 2 guests.Double bed with medicated mattresses;Study table with chair;\nWooden wardrobe & ceiling fan.Split AC unit is fitted and chargeable at Rs.250 for 12 hours of night.Bathroom is private, not attached & located in 1st floor lobby. Hot water provided on request.Guest enjoy airy terrace & shared house is lobby-cum-dining area at ground floor.It is beautifully constructed with a contemporary style to suit and please most kind of persons. It is open, airy, bright and cheerful. With over 1700 sq.ft of space, lots of upgrades have been made to the home.Flooring is of broken marble stone and all doors are crafted of wood. Room has double lock arrangement for additional safety and security.House is porch, parking space, lobby area, dining room and terraces are available on sharing basis.', 73),
(214, 'addspacephotos/2211pg55.jpg', '1 bedroom,1 bed,1 bathrooms,Room is on 1st floor.Comforts 2 guests.Double bed with medicated mattresses;Study table with chair;\nWooden wardrobe & ceiling fan.Split AC unit is fitted and chargeable at Rs.250 for 12 hours of night.Bathroom is private, not attached & located in 1st floor lobby. Hot water provided on request.Guest enjoy airy terrace & shared house is lobby-cum-dining area at ground floor.It is beautifully constructed with a contemporary style to suit and please most kind of persons. It is open, airy, bright and cheerful. With over 1700 sq.ft of space, lots of upgrades have been made to the home.Flooring is of broken marble stone and all doors are crafted of wood. Room has double lock arrangement for additional safety and security.House is porch, parking space, lobby area, dining room and terraces are available on sharing basis.', 73),
(215, 'addspacephotos/5530v62.jpg', '3 bedrooms,3 beds,4 bathrooms with all amenities.', 74),
(216, 'addspacephotos/8421v63.jpg', '3 bedrooms,3 beds,4 bathrooms with all amenities.', 74),
(217, 'addspacephotos/3771v64.jpg', '3 bedrooms,3 beds,4 bathrooms with all amenities.', 74),
(218, 'addspacephotos/7229v66.jpg', '3 bedrooms,3 beds,3 bathrooms with all modern facilities.', 75),
(219, 'addspacephotos/7309v67.jpg', '3 bedrooms,3 beds,3 bathrooms with all modern facilities', 75),
(220, 'addspacephotos/1019v68.jpg', '3 bedrooms,3 beds,3 bathrooms with all modern facilities', 75),
(221, 'addspacephotos/4131ap75.jpg', '1 bedroom,1 bed,1 bathroom.', 76),
(222, 'addspacephotos/7988ap76.jpg', '1 bedroom,1 bed,1 bathroom.', 76),
(223, 'addspacephotos/5621ap77.jpg', '1 bedroom,1 bed,1 bathroom', 76),
(224, 'addspacephotos/7866ap80.jpg', '2 bedrooms,2 beds,3 bathrooms.', 77),
(226, 'addspacephotos/3429ap81.jpg', '2 bedrooms,2 beds,3 bathrooms.', 77),
(227, 'addspacephotos/2966ap82.jpg', '2 bedrooms,2 beds,3 bathrooms.', 77);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviewid` int(11) NOT NULL,
  `bookingid` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `review` text DEFAULT NULL,
  `roomid` int(11) DEFAULT NULL,
  `dateofsubmission` date DEFAULT NULL,
  `bookeremail` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviewid`, `bookingid`, `rating`, `review`, `roomid`, `dateofsubmission`, `bookeremail`) VALUES
(1, 12, 3, 'nice', 70, '2019-11-18', 'ayushi.dhir95@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `roomid` int(11) NOT NULL,
  `roomname` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `coverphoto` varchar(200) DEFAULT NULL,
  `hid` int(11) DEFAULT NULL,
  `tariffsingle` float DEFAULT NULL,
  `tariffdouble` float DEFAULT NULL,
  `extraperson` float DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `count` float DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`roomid`, `roomname`, `area`, `description`, `coverphoto`, `hid`, `tariffsingle`, `tariffdouble`, `extraperson`, `rating`, `count`, `category`) VALUES
(1, 'PG for girls', 'ranjit avenue, amritsar', 'Address: C Block12, Ranjit Avenue, Amritsar, Punjab\nNeat and clean place\nWith almirah and bathrooms attached laundary available on extra charges.', 'spacephotos/3075pg.jpg', 1, 5000, 7000, 500, 0, 0, 'PG'),
(2, '4 BHK Residential Apartment', 'Khukharain Colony, Jalandhar', '4 Bedrooms , 4 Bathrooms, 1 Balcony with Pooja Room,Study Room,Servant Room,Others', 'spacephotos/5559apartment.jpg', 2, 1200, 2000, 440, 0, 0, 'Apartment'),
(3, 'Paying Guest for Boys', 'Moon Avenue , Majitha road ,amritsar', '2 Bedrooms , 1 Bathroom, 1 Balcony with Others.\nSemi furnished property with all amenities', 'spacephotos/5591pgc.jpeg', 1, 4000, 6000, 800, 0, 0, 'PG'),
(4, 'PG for Boys and Girls', 'Rani Ka Bagh, Amritsar', '4 Bedrooms , 4 Bathrooms, No Balcony\nShared Room(s)\n2 Beds per room\n2 Beds Available', 'spacephotos/1567pgc3.jpeg', 1, 2000, 4000, 500, 0, 0, 'PG'),
(5, '1BHK 1Bath Residential Apartment ', 'New Guru Amardas Nagar,Jalandhar , Punjab', '1 Bedroom , 1 Bathroom, 1 Balcony \nSuper Built up area 900\n(83.61 sq.m.)\nBuilt Up area: 800 sq.ft. (74.32 sq.m.),\nCarpet area: 600 sq.ft. (55.74 sq.m.) ,\nFully furnished independent flat with double bed, ac, diwan bed, lcd, fridge,dish tv, chair table. All are newly purchased.', 'spacephotos/6952Apartment1.jpg', 2, 1000, 1200, 600, 0, 0, 'Apartment'),
(6, 'Private Room for Girls & Boys', 'Urban Estate Phase II, jalandhar,punjab', 'Paying Guest in 2 BHK Independent House/Villa with 2 Bedrooms , 1 Bathroom, 1 Balcony ', 'spacephotos/5078pg6.jpeg', 2, 9000, 11000, 700, 0, 0, 'PG'),
(7, 'Private Room for Boys', '1099, Phase-1,urban Estate, Dugri, Jalandhar, Punjab', '2 Bedrooms , 2 Bathrooms, 1 Balcony with Others, fully furnished', 'spacephotos/5878pg11.jpg', 2, 12000, 13000, 300, 0, 0, 'PG'),
(8, 'Residential Apartment for Rent', 'Mithapura, Jalandhar, Punjab', 'Super Built up area 2000\n(185.81 sq.m.),\nBuilt Up area: 1800 sq.ft. (167.23 sq.m.),\nCarpet area: 1600 sq.ft. (148.64 sq.m.)  ,  2 Bedrooms , 1 Bathroom, 2 Balconies with Others', 'spacephotos/1747ap8.jpg', 2, 8000, 10000, 400, 0, 0, 'Apartment'),
(9, '2BHK 2Baths Residential Apartment', ' Basant Avenue, Amritsar, Punjab', '2 Bedrooms , 2 Bathrooms, 2 Balconies with Others,Super Built up area 2050\n(190.45 sq.m.),\nBuilt Up area: 1850 sq.ft. (171.87 sq.m.),\nCarpet area: 1650 sq.ft. (153.29 sq.m.)  ', 'spacephotos/5486ap12.png', 1, 8000, 10000, 500, 0, 0, 'Apartment'),
(10, '2BHK 1Bath Residential Apartment', 'Model Town, Amritsar, Punjab', 'Super Built up area 2000\n(185.81 sq.m.),\nBuilt Up area: 1800 sq.ft. (167.23 sq.m.),\nCarpet area: 1600 sq.ft. (148.64 sq.m.)  ,\n2 Bedrooms , 1 Bathroom, 2 Balconies with Others', 'spacephotos/112ap19.jpeg', 1, 9000, 13000, 900, 0, 0, 'Apartment'),
(11, '3 BHK Builder Floor 150 sqft Apartment', 'Green Avenue,Amritsar', 'Newly Build Property with all the facilities and amenities available nearby, 3 bedrooms, 3 bathrooms, semi-furnished', 'spacephotos/6256ap20.jpg', 1, 6000, 11000, 700, 0, 0, 'Apartment'),
(12, 'Shared Room for Boys', 'Link Road, Ludhiana, Punjab', 'Paying Guest in 2 BHK Independent House,2 Bedrooms , 2 Bathrooms, 1 Balcony ,Furnished', 'spacephotos/7053pg15.jpeg', 3, 3000, 5000, 300, 0, 0, 'PG'),
(13, 'Paying Guest in 4 BHK Independent House', 'GT Road, Ludhiana, Punjab', 'Shared Room for Boys,4 Bedrooms , 4 Bathrooms, No Balcony, Shared Room(s)-2 Beds per room,2 Beds Available', 'spacephotos/663pg19.jpeg', 3, 4500, 6000, 550, 0, 0, 'PG'),
(14, '2BHK 1Bath Residential Apartment', 'Improvement Trust,Rishi Nagar,Ludhiana,Punjab', '2 Bedrooms ,1 Bathroom, 2 Balconies with Others, semi-furnished, Super Built up area 2000(185.81 sq.m.),Built Up area: 1800 sq.ft. (167.23 sq.m.),Carpet area: 1600 sq.ft. (148.64 sq.m.)  ', 'spacephotos/5854ap23.jpeg', 3, 10000, 12000, 600, 0, 0, 'Apartment'),
(15, '3BHK 3Baths Residential Apartment', 'Kitchlu Nagar,Ludhiana', '3 Bedrooms , 3 Bathrooms, 3+ Balconies with Others,Super Built up area 1439(133.69 sq.m.),Built Up area: 1438 sq.ft. (133.59 sq.m.)\n,Carpet area: 1437 sq.ft. (133.5 sq.m.), Semi-furnished', 'spacephotos/2566ap26.jpeg', 3, 14000, 18000, 1000, 0, 0, 'Apartment'),
(16, '1BHK 1Bath Independent Flat', 'Orbit Flats,Sector 80, Chandigarh, Punjab', '1 Bedroom , 1 Bathroom, 1 Balcony , Area:Super Built up area 900\n(83.61 sq.m.),Built Up area: 800 sq.ft. (74.32 sq.m.),Carpet area: 600 sq.ft. (55.74 sq.m.) , fully furnished', 'spacephotos/8968f1.jpeg', 4, 13000, 11000, 1000, 0, 0, 'Flat'),
(17, 'Flat 1BHK, 1 Bath', 'Hig Flats, Sector 71,Chandigarh, Punjab', '1 Bedroom , 1 Bathroom, 2 Balconies with Others, furnished,Area:\nSuper Built up area 900(83.61 sq.m.),\nBuilt Up area: 880 sq.ft. (81.75 sq.m.),\nCarpet area: 850 sq.ft. (78.97 sq.m.)  ', 'spacephotos/3196f5.jpeg', 4, 18000, 15000, 2000, 0, 0, 'Flat'),
(18, 'PG Youth Hostel', 'Gandhi gate Near Golden Temple,Amritsar', '14 guests,5 bedrooms,14 beds,3 baths.It is in centre of the city. Every market, worthseeing places are at walkable distance.The rooms have proper air cooling. The Home is situated in Hall Bazar - City Center which is surrounded by Golden Temple, Jalianwala Bagh, Jama Masjid.', 'spacephotos/5289pg23.jpg', 5, 8133, 10646, 400, 0, 0, 'PG'),
(19, 'Puri Guest House', 'Inside mahan singh gate Pakki gali,Amritsar', 'Located within 1.3 km of Golden Temple and less than 1 km of Jallianwala Bagh, Puri Guest House provides rooms with air conditioning and a private bathroom in Amritsar. Among the facilities at this property are a 24-hour front desk and a shared kitchen, along with free WiFi throughout the property. Private parking can be arranged at an extra charge.', 'spacephotos/297pg27.jpg', 5, 3000, 5500, 300, 0, 0, 'PG'),
(20, '1 BHK Paying Guest for Girls', ' Model Town, Jalandhar, Punjab', '1 Bedroom , 1 Bathroom, No Balcony ,Semifurnished.  It has spacious 1 bedroom and 1 bathroom. Placed at model town. 180 sq.Ft.(Builtup area) is the area of the property. Building has three total floors and property is located on second floor. You will also get power back-Up with the property .', 'spacephotos/2981pg32.jpeg', 6, 3000, 6000, 600, 0, 0, 'PG'),
(21, 'Private Room for Girls & Boys in 2 BHK Independent House', ' Lig Flats, Suranussi, Jalandhar, Punjab', '2 Bedrooms , 1 Bathroom, 2 Balconies, Girls & Boys (Total Capacity: 4), Semifurnished', 'spacephotos/3234pg33.jpeg', 6, 5500, 9500, 1000, 0, 0, 'PG'),
(22, 'Private Room for Boys in 1 BHK Independent House', 'Chandigarh Road, , Ludhiana, Punjab', '1 Bedroom , 1 Bathroom, 1 Balcony , Boys (Total Capacity: 1),Furnished', 'spacephotos/8938pg37.jpeg', 7, 3600, 6000, 800, 0, 0, 'PG'),
(23, 'Silver Leaf Apartments', 'Garden Enclave,Amritsar', '8 guests,4 bedrooms,4 beds,4 bathrooms,Located in the lanes of Garden Green Enclave, this 2 BHK is conveniently located in a neighbourhood which is close to the main highway leading to Wagah Border.', 'spacephotos/5583ap30.jpg', 5, 3000, 5990, 800, 0, 0, 'Apartment'),
(24, 'Two room Apartment', 'Near Golden Temple,Amritsar', 'This 2 Rooms fully furnished apartment on the third floor is less than 1 km from the Golden Temple,Jallianwala Bagh and is situated in the heart of the city.3 guests,1 bedroom,2 beds,1 bath', 'spacephotos/4756ap34.jpg', 5, 5000, 7500, 500, 0, 0, 'Apartment'),
(25, '2 BHK 1200 Sq. ft Apartment', 'Lawrence Road, Amritsar', '\nBuilt-Up Area:1200 Sq.ft,Bedroom:2,Spacious independent apartment available for rent at the heart of Amritsar. The location is very lucrative.\n', 'spacephotos/4952ap38.jpg', 5, 8000, 12000, 500, 0, 0, 'Apartment'),
(26, 'Paying Guest in 3 BHK Independent/Builder Floor', 'sangam vihar, Ladhewali, Jalandhar, Punjab', '3 Bedrooms , 1 Bathroom, 2 Balconies ,Furnished,There are 3 rooms which can be shared among known ones. ', 'spacephotos/1889pg40.jpeg', 2, 3000, 5000, 2000, 0, 0, 'PG'),
(27, '2BHK 1Bath Residential Apartment', ' Choti Baradari I,Jalandhar, Punjab', 'Super Built up area: 2000(185.81 sq.m.),Built Up area: 1800 sq.ft. (167.23 sq.m.),Carpet area: 1600 sq.ft. (148.64 sq.m.),2 Bedrooms , 1 Bathroom, 2 Balconies with Others,semifurnished.', 'spacephotos/526ap42.jpeg', 6, 10000, 16000, 600, 0, 0, 'Apartment'),
(28, '4BHK 4Baths Residential Apartment ', 'Choti Baradari I, Jalandhar, Punjab', 'Super Built up area: 2200(204.39 sq.m.),Built Up area: 2000 sq.ft. (185.81 sq.m.),Carpet area: 1800 sq.ft. (167.23 sq.m.) sq.ft.,4 Bedrooms , 4 Bathrooms, 2 Balconies with Others.', 'spacephotos/7072ap46.jpeg', 6, 12000, 20000, 5000, 0, 0, 'Apartment'),
(29, '1BHK 1Bath Independent/Builder Floor Flat', ' HIG Flats, Bhagat Singh Colony,Jalandhar, Punjab', '1 Bedroom , 1 Bathroom, 1 Balcony with Others,Super Built up area 600sq.ft.(55.74 sq.m.) ,Semifurnished.', 'spacephotos/6900f9.jpeg', 6, 5500, 9000, 2000, 0, 0, 'Flat'),
(30, '3BHK 4Baths Residential Apartment', 'Ram Vatika, Model Town,Jalandhar, Punjab', '3 Bedrooms , 4 Bathrooms, 3 Balconies ,Super Built up area :1800 sqft(167.23 sq.m.),Built Up area: 1700 sq.ft. (157.94 sq.m.),Carpet area: 1600 sq.ft. (148.64 sq.m.)  ', 'spacephotos/5346ap50.jpeg', 6, 13000, 22000, 5000, 0, 0, 'Apartment'),
(31, 'Fully furnished flat 3 BHK', 'Model Town, Jalandhar, Punjab', 'Super Builtup area (ft²):1600,Carpet Area (ft²):1600,fully furnished,Total Floors:6 , Bedrooms: 3, Bathrooms: 3', 'spacephotos/2367f13.webp', 6, 16000, 30000, 8000, 0, 0, 'Flat'),
(32, 'Furnished 3 BHk flat', 'Kalkidhar Avenue, Jalandhar, Punjab', '3 Bedrooms - 3 Bathrooms - area:1500 ft2, fully furnished', 'spacephotos/7381f17.webp', 6, 10000, 16000, 5000, 0, 0, 'Flat'),
(33, '4 BHK 2050 Sq. ft Flat', ' Mithapur, Jalandhar', 'Built-Up Area: 2050 Sq.ft.,Bedroom:4, newly built flat with four bedroom drawing room. lobby and attach bath and modular kitchen at a Jalandhar heights .', 'spacephotos/6421f21.png', 2, 19000, 30000, 13000, 0, 0, 'Flat'),
(34, '1BHK Flat', 'Model Town,Jalandhar', 'Built-Up Area:2000 Sq.ft.,Carpet Area:1000 Sq.ft, 1 Bedroom, 2 Bathroom, Balcony:1,', 'spacephotos/7443f25.png', 2, 8000, 12000, 800, 0, 0, 'Flat'),
(35, '2 BHK 1000 Sq. ft Flat', 'Hardyal Nagar, Jalandhar', 'Built-Up Area:1000 Sq.ft, 2 Bedrooms,North Facing 2 Bedroom, Drawing room, lobby, at first floor. furnished with AC, Fridge, RO water Purifier, Water Geyser, Gas Stove, fan in each room, 2 Cooler, curtain etc.', 'spacephotos/2452f29.png', 2, 15000, 22000, 5000, 0, 0, 'Flat'),
(36, '2 BHK Flat', 'kashmir avenue, amritsar', '2 rooms with King size double bed each,1 makeshift bed in each room if required,2 bedrooms,2 bathrooms,each room with attached personal washroom.', 'spacephotos/6111f33.jpg', 5, 1250, 2000, 800, 0, 0, 'Flat'),
(37, 'Luxury 3BHK Flats', 'mall road,amritsar', '3 bedrooms,2 beds,2 bathrooms,The listing is of a 1st floor flat with a private entrance having 3 spacious bedrooms with 3 bathrooms and a kitchenette and parking.There is ample parking in the colony and the colony is gated along with night guards on patrol. ', 'spacephotos/9135f37.jpg', 5, 8000, 15000, 2000, 0, 0, 'Flat'),
(38, 'Spacious 2BHK Flat', 'Green Avenue,Amritsar', '2 Bedrooms,2 Baths,1 Balcony,Spacious Flat with all amenities,fully furnished with a lush green garden.', 'spacephotos/9006f42.jpg', 5, 9500, 15000, 2000, 0, 0, 'Flat'),
(39, 'Serenity Villa', 'Civil Lines,Amritsar', '2 bedrooms,2 bathrooms,Experience all the famous attractions of Amritsar close by, or just unwind at this modern villa with a huge, lovely garden, plenty of natural lighting, spacious bedrooms and highly aesthetic interiors. Luxury and comfort go hand-in-hand here.', 'spacephotos/6663v1.jpg', 5, 14500, 20000, 1000, 0, 0, 'Villa'),
(40, 'Bougain Villa', 'Mall Road, amritsar', '2 bedrooms, 2 washrooms, a beautiful garden,fully furnished and modern rooms with all amenities needed for comfy stay and cherished experience.All Public spaces, malls & shopping centres are at a walking distance along with easy access to Public Transport.', 'spacephotos/9940v5.jpg', 5, 8500, 13000, 2000, 0, 0, 'Villa'),
(41, 'Homestay Villa', 'Basant Avenue, Amritsar', '2 bedrooms, 2 washrooms, a garden, The villa offers a heaven of peace and tranquillity, set with a stunning contrasting view of the modern households along with the grassland countryside. private rooms with access to wifi, pool, gym, air conditioning, laundry etc. ', 'spacephotos/3594v9.jpg', 5, 5000, 1000, 1000, 0, 0, 'Villa'),
(42, '2 BHK Independent Villa', 'Holy City , Amritsar', '2 bedroom, 2 baths, lush green garden, swimming pool, fully furnished, a beautiful lounge and spacious balcony with all basic facilities including parking.', 'spacephotos/536v16.jpg', 1, 1150, 1750, 850, 0, 0, 'Villa'),
(43, 'Cozy Flats', 'Airport Road, Amritsar', '2 Bedrooms, 2 Baths,1 Balcony ,A cozy flat with a television, kitchen, balcony and bathroom makes this a cheap alternative.Flat features wooden furnishing, and is complete with all the amenities required for a comfortable stay with facility of lift.', 'spacephotos/7051f47.jpg', 1, 10500, 15000, 3500, 0, 0, 'Flat'),
(44, 'Oakwood Villa', 'Miran Kot Khurd,Amritsar', '3 bedrooms,3 bathrooms,set in green environment villa is on ground floor and has all modern facilities', 'spacephotos/4014v19.jpg', 1, 4500, 7500, 2000, 0, 0, 'Villa'),
(45, 'Green Villa', 'Vrindavan Garden,Amritsar', 'Spacious Villa surrounded by greenry all around is a sight to behold. 2 bedrooms,2 baths and a spacious backyard to rewind, with all high tech facilities.', 'spacephotos/1257v27.jpg', 1, 5500, 8000, 2000, 0, 0, 'Villa'),
(46, '3 BHK Comfy Independent Flat', 'Ranjit Avenue,Amritsar', '3 bedrooms, 3 Bathrooms, The flat is in the prime location, on the corner, neat and tidy, with no interference and with a good neighborhood. The Rooms are airy and spacious, the washrooms are neat and clean.Ample space for parking is available.', 'spacephotos/1665f50.jpg', 1, 4000, 6500, 750, 0, 0, 'Flat'),
(47, 'A Luxury 2BHK Flat', 'Garden Green Enclave,Amritsar Cantt ,Amritsar', '2 bedrooms, 2 bathrooms,surrounded by lush greenry,Located in the lanes of Garden Green Enclave, this 2 BHK is conveniently located in a neighbourhood which is close to the main highway leading to Wagah Border.well-furnished with all the modern amenities.', 'spacephotos/6180f54.jpg', 1, 4000, 7000, 1000, 0, 0, 'Flat'),
(48, 'Paying Guest in 2 BHK house', 'Janta Nagar, Ludhiana, Punjab', 'New fully furnished PG including bed,almirah,fan and other basic things. There are 2 Rooms along with a kitchen and 2 washrooms. 2 Rooms can be on sharing and non sharing basis. AC will be available on demand. It is located in the safe and secure place, in the centre of city.Meals or Tiffin facility can be available as per demand.', 'spacephotos/2300pg44.webp', 3, 3500, 5500, 600, 0, 0, 'PG'),
(49, 'Commercial Shop 500 sqft', ' Model Town, Ludhiana', 'Super area:500 sqft,Carpet area:500 sqft,Plot area:600 sqft , Furnished', 'spacephotos/2832s1.jpg', 3, 10000, 0, 0, 0, 0, 'Shop'),
(50, 'Commercial Shop 800 sqft', 'Sarabha Nagar, Ludhiana', 'Unfurnished, Super area: 800 sqft, 800 sqft commercial space with complete interior setup available for lease in sarabha nagar ludhiana. Ready to move showroom, Parking available, Easy approachable, Perfect branding space.', 'spacephotos/2822s4.jpg', 3, 20000, 0, 0, 0, 0, 'Shop'),
(51, 'Commercial Shop 1500 sqft', 'Gillwal, Ludhiana', '\nOverlooking:Main Road, Super area: 1500 sqft, Carpet area:1200 sqft, Unfurnished  \n', 'spacephotos/2608s5.png', 3, 28000, 0, 0, 0, 0, 'Shop'),
(52, '3BHK 3Baths Residential Apartment', 'Rajguru Nagar ,Ludhiana, Punjab', '3 Bedrooms , 3 Bathrooms, 1 Balcony with Pooja Room, Area\nSuper Built up area: 2000 sqft(1672.25 sq.m.),Built Up area: 1550 sq.yards (1296 sq.m.),Carpet area: 1150 sq.yards (961.55 sq.m.) , Furnished, Three bedrooms set attached bathroom with kitchen lobby equipped with all modran facilities walking distance to main market or mbd mall ferzpur road ludhaina.', 'spacephotos/1629ap54.jpeg', 3, 11000, 18000, 5000, 0, 0, 'Apartment'),
(53, '3BHK 2Baths Residential Apartment', 'Grewal Complex 566,B-1, Near Neem Chowk, Kudan Puri, Civil Lines, Ludhiana', '3 Bedrooms , 2 Bathrooms, 2 Balconies, Area:Super Built up area :1350 sqft(125.42 sq.m.), Carpet area: 1000 sq.ft., Furnished, Property is in prime location near dmc hospital, railway station, market everything thing easy to approach . Posh area,  good location west facing,  well maintained property,  easily approachable public transport,  safe society for families.', 'spacephotos/5516f55.jpg', 3, 15000, 12000, 900, 0, 0, 'Apartment'),
(54, '2 BHK Independent Villa', 'Sunil Park,Ludhiana', 'Status: Furnished, Area: 1,500 sq ft, Well designed 2 bhk independent villa is available at a prime location in Sunil Park. It has area of 1500 sqft and is available at a rent of Rs. 11,000. Furnishings include 2 wardrobe, 1 tv, 1 ac and 2 bed. It is facing east direction. The property has 2 bathrooms and 1 balcony. It is well connected to the city areas.', 'spacephotos/3296v28.jpeg', 3, 11000, 20000, 1000, 0, 0, 'Villa'),
(55, '2 BHK Villa', 'Brs nagar,Ludhiana', 'Area: 1,800 sq ft, Furnished, 2 Bedrooms, 2 Baths, It has area of 1800 sqft and is available at a rent of Rs. 18,000. The house is furnished. Furnishings include 2 wardrobe, 1 tv, 1 refrigerator, 1 sofa, 1 dining table, 2 ac and 2 bed. It is northeast facing property. It has 2 bathrooms and 1 balcony. It is made in way to provide a comfortable living. It is well connected to the city areas.', 'spacephotos/5267v32.jpeg', 3, 18000, 30000, 1500, 0, 0, 'Villa'),
(56, '2 BHK Fancy Villa', 'Pakhowal road,Ludhiana', 'Area: 500 sq ft, furnished, 2 Bedrooms, 2 Baths, North facing, 1 Balcony, Two Rooms and attached bathrooms with Kitchen and Living cum dining room also available. Fully furnished house. No male interference & safe for girls. Nearest to Pakhowal road. Genuine rent.', 'spacephotos/8512v36.jpeg', 3, 8500, 1250, 1000, 0, 0, 'Villa'),
(57, '2 BHK Independent Flat', 'Sunil Park,Ludhiana', 'Area: 1,500 sq ft, Furnished, Well designed 2 bhk independent house is available at a prime location in Sunil Park. It has area of 1500 sqft . Furnishings include 2 wardrobe, 1 tv, 1 ac and 2 bed. It is facing east direction. The property has 2 bathrooms and 1 balcony. It is well connected to the city areas.', 'spacephotos/8935f58.jpeg', 3, 11000, 18000, 5000, 0, 0, 'Flat'),
(58, '2 BHK Independent Flat', 'Rajguru Nagar ,Ludhiana, Punjab', 'Area: 2500 sqft, 2 Bedrooms, 2 Baths, 1 Balcony, Furnished,This spacious 2 bhk builder floor is available for rental and is located in the heart of rajguru nagar. It has area of 2500 sqft and is available at a rent of Rs. 20,000. The house is furnished. It has 2 wardrobe, 1 tv, 1 refrigerator and 1 sofa. It also has 1 washing machine, 1 dining table, 2 ac, 2 bed and 1 modular kitchen. It is located on the 1st floor(out of a total of 3 floor(s)). It is facing east direction. It is made in way to provide a comfortable living. It is well connected to the city areas.', 'spacephotos/6166f62.jpeg', 3, 14000, 22000, 3000, 0, 0, 'Flat'),
(59, '1 BHK Paying Guest', 'Pakhowal road,Ludhiana', 'Area: 375 sq ft, 1 Bedroom, 1 Bathroom, 1 Balcony, Furnished, south facing.  This is independent fully furnished one room with parking facility available for Male and female situated just away 3km from froze Gandhi market and 2.5 km from ferozpur road.', 'spacephotos/3490pg47.jpeg', 7, 6500, 1000, 450, 0, 0, 'PG'),
(60, '2 BHK Independent Floor Flat', 'Gurdev Nagar,Ludhiana', 'Area: 650 sq ft, 2 Bedrooms, 1 Bath, Furnished, A spacious 2 bhk builder floor is available for rental in Gurdev Nagar, Ludhiana. It is on 1st floor. The building has a total of 2 floor(s). It is facing north direction. It has 1 bathroom and 1 balcony. The time you will spend here will become the greatest moment of your life that will also help you to relieve, relax & evoke a great sense of happiness. The site is in close proximity to various civic utilities. ', 'spacephotos/7905f66.jpeg', 7, 9500, 15000, 2500, 0, 0, 'Flat'),
(61, 'Flat 2 BHK Independent Floor - 1,300 sq ft', 'Rajguru nagar,Ludhiana', '2 Bedrooms, 2 Baths, Semifurnished, Well designed 2 bhk builder floor is available at a prime location in Rajguru nagar. The house is semi-furnished. It is on the 1st floor of the building (total number of floors are 3). It is east facing property. The property has 2 bathrooms and 1 balcony. It is made in way to provide a comfortable living for the residents. The site is in close proximity to various civic utilities. ', 'spacephotos/4054f70.jpeg', 7, 15000, 24000, 6500, 0, 0, 'Flat'),
(62, '3 BHK Apartment - 1,780 sq ft', 'Urban Estate, Ludhiana', '3 bedrooms, 3 Bathrooms, 1 balcony, Furnished, It’s a 3 bhk multistorey apartment situated in Urban Estate. It is a furnished property. It’s on 3rd floor out of 4 floors building. The property has 3 bathrooms and 3 balconies. It is made in way to provide a comfortable living for the residents. ', 'spacephotos/7005ap61.jpeg', 7, 17500, 28000, 8500, 0, 0, 'Apartment'),
(63, '2 BHK Independent Apartment', 'Brs nagar,Ludhiana', 'Area: 1,350 sq ft, furnished, 2 Bedrooms, 2 Bathrooms, It’s a 2 bhk independent house situated in Brs nagar, Ludhiana. It has an area of 1350 sqft with a carpet area of 1200 sqft . Its main door is facing east direction. It has 2 bathrooms and 1 balcony. It is made in way to provide a comfortable living for the residents. The site is in close proximity to various civic utilities.', 'spacephotos/8599ap65.jpeg', 7, 16500, 28000, 9500, 0, 0, 'Apartment'),
(64, '2 BHK 1085 Sq-ft Flat', ' Panache Homes Omaxe Royal Residency, Ludhiana', 'Super area: 1085 sqft, Carpet area: 880 sqft , Unfurnished, This Home has 2 bedroom and it is on 1st floor and has 2 bathroom', 'spacephotos/4644f73.jpg', 7, 17000, 26000, 8500, 0, 0, 'Flat'),
(65, '2 BHK 1200 Sq-ft Apartment', ' Ireo Waterfront, Sidhwan Canal Rd, Ludhiana', '2 Bedrooms,2 Bathrooms, 2 Balconies, Semi-furnished , Super area:\n1200 sqft, Carpet area: 850 sqft, East Facing, Fully independent, well maintained 2 bhk apartment is available for rent in ireo waterfront ludhiana, with modular kitchen, vitrified tiles flooring, attached bathrooms, balconies, ample car parking.', 'spacephotos/2464ap69.jpg', 7, 12500, 20000, 5500, 0, 0, 'Apartment'),
(66, '2 BHK Flat 1500 sqft', 'Gurdev Nagar, Ludhiana', 'Super area: 1500 sqft, Carpet area: 1600 sqft, 2 Bedrooms, 2 Bathrooms, 1 Balcony, 1 Pooja Room, Furnished, 2bhk flat fully furnished with car parking in Gurdev nagar.', 'spacephotos/6477f74.jpg', 7, 18000, 32000, 9000, 0, 0, 'Flat'),
(67, 'Paying Guest', 'Pakhowal road, Ranjit Nagar, Ludhiana', 'Furnished, Occupancy:Single & Sharing, 4 Bathrooms, 3 Balconies, 7 rooms, east facing\n', 'spacephotos/5422pg1.png', 7, 3500, 5500, 500, 0, 0, 'PG'),
(68, 'Beautiful,Safe,Spacious Villa with a huge Lawn', 'GT Road, Amritsar', '2 bedrooms,2 beds,2 bathrooms,It is a newly constructed property with a modular kitchen, a living area and 2 bedrooms.\nOne suite room with a sitting and a second deluxe size room. It is perfect for families, couples and business travellers. Located on GT Road near Mall of Amritsar, it is easily accessible through Public transport and popular restaurants and malls are at distance of less than 1 km.', 'spacephotos/3v41.jpg', 1, 6000, 10000, 800, 0, 0, 'Villa'),
(69, 'ELINA Apartment', 'White Avneue, Amritsar', '2 bedrooms,2 beds,2 bathrooms,It Is a Neat and Beautifully maintained apartment .Perfect for a comfortable stay.Easy Approach.All Important places are within 3 TO 4 kms. Open porch and a terrace garden .This is on the ground floor.owner is on the first floor.', 'spacephotos/5963ap70.jpg', 5, 7500, 12000, 1200, 0, 0, 'Apartment'),
(70, 'Savrupson Modern Villa ', 'Urban Estate, Jalandhar', '1 bedroom,1 bed,1 private bathroom, It is a luxury villa with porticos set up in a colonial style of architecture located in the heart of jalandhar city.The place is a modern villa with all the amenities surrounded by big lawns and a kitchen garden growing organic vegetables and having its own fresh milk and poultry from its own cows and hens.Its a great place for nature lovers .A quiet and peaceful place to stay and relax.A home away from home very close to railway and bus terminals.', 'spacephotos/8880v45.jpg', 2, 8000, 12000, 2000, 0, 0, 'Villa'),
(71, 'Grand Villa', 'East Mohan Nagar, Jalandhar', '1 bedroom,2 beds,1 shared bathroom, 5 bedroom spacious villa in the heart of Punjab (Jalandhar) reflects a modern architectural and design aesthetic. We are surrounded by nature outside and within the house, with 2/3rd of our plot being green space. All rooms have a spacious balcony attached that envelops the first floor, surrounded by nature and practice completely green living at home. Spacious lawn is available on ground floor.', 'spacephotos/2659v50.jpg', 2, 5400, 9000, 1000, 0, 0, 'Villa'),
(72, 'Tarawal Villa', 'Gurbanta Singh road, Jalandhar', '3 bedrooms,3 beds,3 bathrooms,Modern Grand Villa is located on Gurbanta Singh road in Jalandhar. Easily approachable by car/ taxi. It is surrounded by greenery and peaceful environment. Safe parking is available. Big fully equipped kitchen and common dining lobby is available. Whole place is safe and secure under surveillance of CCTV cameras. Balconies and open verandahs are there to enjoy outside views and relaxing.The place is neat and clean, tastefully built alongside canal on the main road. If you want to stay in safe and peaceful environment, then come to our place.', 'spacephotos/7639v55.jpg', 2, 10000, 18000, 3500, 0, 0, 'Villa'),
(73, 'Paying Guest With Bright airy Bedroom and Bath', 'Guru Arjan Dev Nagar, Jalandhar', '1 bedroom,1 bed,1 bathrooms,Room is on 1st floor.Comforts 2 guests.Double bed with medicated mattresses;Study table with chair;\nWooden wardrobe & ceiling fan.Split AC unit is fitted and chargeable at Rs.250 for 12 hours of night.Bathroom is private, not attached & located in 1st floor lobby. Hot water provided on request.Guest enjoy airy terrace & shared house is lobby-cum-dining area at ground floor.It is beautifully constructed with a contemporary style to suit and please most kind of persons. It is open, airy, bright and cheerful. With over 1700 sq.ft of space, lots of upgrades have been made to the home.Flooring is of broken marble stone and all doors are crafted of wood. Room has double lock arrangement for additional safety and security.House is porch, parking space, lobby area, dining room and terraces are available on sharing basis.', 'spacephotos/4587pg50.jpg', 6, 9500, 15000, 2000, 0, 0, 'PG'),
(74, 'Kuckoos Modern Villa', 'Shastri Nagar,Jalandhar', '3 bedrooms,3 beds,4 bathrooms with all amenities,Drive into tranquility, as you enter Kuckoos villa and find a lush green garden. Relax at a veranda on our comfortable wooden chairs. You will feel at home with a care taker by your side 24/7. Meals, cleaning, or any kind of service could be used.\nGet your favourite book and enjoy a cosy corner or go all out on leashing your creativity, and when you do want to step out, we have Chunmun Mall, Model town market, Make up villa beauty parlour, Geeta temple and a Gurudwara for you to explore.', 'spacephotos/6373v61.jpg', 6, 12000, 20000, 5000, 0, 0, 'Villa'),
(75, 'The Palm House-fully furnished one acre villa', 'S.A.S Nagar, Jalandhar', '3 bedrooms,3 beds,3 bathrooms with all modern facilities,The Palm House is a heritage family home built in the traditional Indo-Islamic architectural style of canopied windows and carved pillars. It sits amid large, green, grassy lawns with a long driveway flanked by tall Royal Palms. Enjoy the deep, shady verandas on three sides of the house to relax in over the evening tea or morning breakfast. It has spacious interiors and tall windows for natural sunshine and ventilation, besides a lovely view of the garden.', 'spacephotos/800v65.jpg', 6, 20000, 38000, 15000, 0, 0, 'Villa'),
(76, 'Beautiful 1BHK Apartment', 'Gurjepal Nagar, Jalandhar', '1 bedroom,1 bed,1 bathroom, It is beautifully constructed with a contemporary style to suit and please most kind of persons. Apartment is open, airy, bright and cheerful. With over 1700 sq.ft of space, lots of upgrades have been made to the home.Flooring is a mix of natural marble tiles and broken stone and all doors are crafted of wood. Room has double lock arrangement for additional safety and security.Apartment is porch, parking space, lobby area, dining room and terraces are available on sharing basis.', 'spacephotos/9098ap74.jpg', 6, 11500, 18000, 5000, 0, 0, 'Apartment'),
(77, 'Jannat Apartment', 'Kitchlu Nagar, Ludhiana', '2 bedrooms,2 beds,3 bathrooms,It is a one of the very tastefully designed Apartment with modular Kitchen that includes all amenities. The guests no wonder call it a Home away from Home. Across the road A big Market, with Gym and Bank with ATM , Department store, Wine shop , Restaurant. The windows overlook greenery around.The apartment is peaceful and is very comfortable to stay. It has an elevator for approach.', 'spacephotos/9994ap78.jpg', 3, 10500, 20000, 5500, 0, 0, 'Apartment');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `mobile` varchar(10) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`mobile`, `email`, `password`, `name`, `address`, `photo`) VALUES
('9592231891', 'hundal.anmol96@gmail.com', '123', 'anmol', 'amritsar', 'userphotos/53808r2.jpeg'),
('6280995201', 'rkb@gmail.com', '1234', 'rkb', 'AMRITSAR', 'userphotos/78904christoph-schulz-wJ6xyh1YMxU-unsplash.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingid`),
  ADD KEY `rid` (`roomid`),
  ADD KEY `bemail` (`bookeremail`),
  ADD KEY `hidfk` (`hostid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cname`);

--
-- Indexes for table `host`
--
ALTER TABLE `host`
  ADD PRIMARY KEY (`hid`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `roomid` (`roomid`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviewid`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roomid`),
  ADD KEY `hid` (`hid`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `bookingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `host`
--
ALTER TABLE `host`
  MODIFY `hid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviewid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `roomid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `bemail` FOREIGN KEY (`bookeremail`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hidfk` FOREIGN KEY (`hostid`) REFERENCES `host` (`hid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rid` FOREIGN KEY (`roomid`) REFERENCES `rooms` (`roomid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `roomid` FOREIGN KEY (`roomid`) REFERENCES `rooms` (`roomid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `category` (`cname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hid` FOREIGN KEY (`hid`) REFERENCES `host` (`hid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
