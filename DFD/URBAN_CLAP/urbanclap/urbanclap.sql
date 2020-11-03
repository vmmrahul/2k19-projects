-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2019 at 02:24 AM
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
-- Database: `urbanclap`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`, `password`, `mobile`, `type`) VALUES
('abc@gmail.com', '1234', '0123456789', 'admin'),
('manisha.attri96@gmail.com', '8146', '8146130143', 'Admin'),
('ritika.dogra23@gmail.com', 'ritika', '9530769265', 'Sub-Admin'),
('shivalisharma295@gmail.com', 'shivali', '9815877737', 'Sub-Admin');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dateofbooking` date NOT NULL,
  `timefrom` varchar(100) NOT NULL,
  `timeto` varchar(100) NOT NULL,
  `place` text NOT NULL,
  `status` varchar(100) NOT NULL,
  `paymentstatus` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `spemail` varchar(40) NOT NULL,
  `dates` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bid`, `email`, `dateofbooking`, `timefrom`, `timeto`, `place`, `status`, `paymentstatus`, `price`, `spemail`, `dates`) VALUES
(11, 'manisha.attri96@gmail.com', '2019-11-22', '13:10', '14:10', '#47,NEW DIAMOND AVENUE,MAJITHA ROAD,AMRITSAR', 'accepted', 'pending', 500, 'ravi@gmail.com', '2019-11-16'),
(13, 'shikha22attri.94@gmail.com', '2019-11-22', '14:00', '16:00', 'Urban Enclave', 'accepted', 'pending', 500, 'ravi@gmail.com', '2019-11-16'),
(14, 'shikha22attri.94@gmail.com', '2019-11-21', '15:15', '17:00', 'Aman Avenue', 'accepted', 'pending', 500, 'ravi@gmail.com', '2019-11-16'),
(15, 'shikha22attri.94@gmail.com', '2019-11-21', '13:00', '14:30', 'HNo:78,Mall Road', 'accepted', 'pending', 2200, 'kiran@gmail.com', '2019-11-18'),
(16, 'yashima.arora18@gmail.com', '2019-11-28', '12:00', '14:00', 'HNo:90,Shivala Road', 'pending', 'pending', 250, 'ankush@gmail.com', '2019-11-18'),
(17, 'yashima.arora18@gmail.com', '2019-11-28', '10:00', '11:00', 'HNo:67,Farid Avenue', 'accepted', 'Complete', 680, 'kanchan@gmail.com', '2019-11-19'),
(18, 'shikha22attri.94@gmail.com', '2019-11-27', '11:30', '13:00', 'HNo:45,Mall Road', 'accepted', 'Complete', 680, 'kanchan@gmail.com', '2019-11-19'),
(19, 'manisha.attri96@gmail.com', '2019-11-23', '12:00', '13:00', 'HNo:123,Kahlon Colony', 'accepted', 'Complete', 680, 'kanchan@gmail.com', '2019-11-19'),
(20, 'yashima.arora18@gmail.com', '2019-11-22', '13:00', '14:00', 'H No:90,Mall Road', 'accepted', 'Complete', 500, 'ravi@gmail.com', '2019-11-19');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catname` varchar(100) NOT NULL,
  `description` varchar(400) NOT NULL,
  `photo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catname`, `description`, `photo`) VALUES
('BeautySalon', 'Salon at its Best', 'categoryphotos/2399saloon1.jpg'),
('Cleaning', 'Cleaning of Houses on this Festive Occassion...', 'categoryphotos/3647clean7.jpg'),
('Electronics', 'The best thing about a picture is that it never changes, even when the people in it do', 'categoryphotos/5946ac1.jpg'),
('HealthWellness', 'your health is at peak', 'categoryphotos/6899yoga6.jpg'),
('InteriorDesigner', 'Home-where the happiness begins', 'categoryphotos/interior3.jpg'),
('Photography', 'The best thing about a picture is that it never changes, even when the people in it do.', 'categoryphotos/4910photography1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviewed` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `rating` float NOT NULL,
  `description` text NOT NULL,
  `useremail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviewed`, `email`, `rating`, `description`, `useremail`) VALUES
(7, 'kanchan@gmail.com', 4, 'demo', 'manisha.attri96@gmail.com'),
(8, 'ravi@gmail.com', 3, 'VeryGood. :)', 'shikha22attri.94@gmail.com'),
(9, 'ravi@gmail.com', 4, 'good.thank you', 'yashima.arora18@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `serviceprovider`
--

CREATE TABLE `serviceprovider` (
  `email` varchar(40) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `business` varchar(40) NOT NULL,
  `catname` varchar(40) NOT NULL,
  `city` varchar(40) NOT NULL,
  `address` varchar(500) NOT NULL,
  `timings` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `servicearea` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `photo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `serviceprovider`
--

INSERT INTO `serviceprovider` (`email`, `name`, `mobile`, `password`, `business`, `catname`, `city`, `address`, `timings`, `price`, `servicearea`, `status`, `photo`) VALUES
('ananya@gamil.com', 'Ananya Verma', '9530769265', '497817', 'Kitchen Deep Cleaning', 'Cleaning', 'Gurdaspur', 'Shop No:78,Urban Estates', '11am-6pm', 562, 'Gurdaspur,Dinanagar', 'pending', 'serviceproviderphotos/4263kitclean2.jpg'),
('ankush@gmail.com', 'Ankush Sharma', '8146130143', '867946', 'Sofa Cleaning', 'Cleaning', 'Amritsar', '67,Shakti nagar', '11am-7pm', 250, 'Amritsar,Batala', 'pending', 'serviceproviderphotos/3230clean3.jpg'),
('bhushan@gmail.com', 'Bhushan Kumar', '9780648922', '124305', 'A/C Repair', 'Electronics', 'Gurdaspur', 'Bhushan Electronics,Jail Road', '10am-8pm', 350, 'Gurdaspur,Dinanagr', 'pending', 'serviceproviderphotos/7239ac3.jpg'),
('gautam@gmail.com', 'Gautam Kumar', '9780648922', '207827', 'Bathroom Deep Cleaning', 'Cleaning', 'Gurdaspur', 'Farid Avenue', '9am-7pm', 500, 'Gurdaspur', 'pending', 'serviceproviderphotos/3878bathclean2.jpg'),
('harman@gmail.com', 'Harman', '9646169010', '295841', 'Refrigerator repair', 'Electronics', 'Amritsar', 'Hall Bajar', '11am-9pm', 652, 'amritsar,Manawala', 'pending', 'serviceproviderphotos/2445ref1.jpg'),
('harpreet@gmail.com', 'Harpreet Kaur', '9780648922', '213945', 'Kitchen Deep Cleaning', 'Cleaning', 'Amritsar', 'Shop No:89,Kajal Colony', '10am-6pm', 560, 'Amritsar,Manawala,Batala', 'pending', 'serviceproviderphotos/9889clean1.jpg'),
('harpreetsingh@gmail.com', 'Harpreet Singh', '9530769265', '745968', 'Birthday Party Photography', 'Photography', 'Amritsar', 'Singh&Sons Photographers', '11am-7pm', 12000, 'Amritsar,Batala,Gurdaspur', 'pending', 'serviceproviderphotos/88birth2.jpg'),
('jagpreet@gmail.com', 'Jagpreet', '8054929382', '992659', 'Washing Machine Repair', 'Electronics', 'Amritsar', 'Batala Road', '10am-7pm', 450, 'Batala Road,Majitha Road,G.T. Road', 'pending', 'serviceproviderphotos/2877washingmachine1.jpg'),
('kajal@gmail.com', 'Kajal', '9815877737', '680794', 'Water Purifier Repair', 'Electronics', 'Benagaluru', 'shop no.46,mall road', '11am-7pm', 2500, 'bengaluru', 'pending', 'serviceproviderphotos/6103ac1.jpg'),
('kamalpreet@gmail.com', 'Kamalpreet Kaur', '9530769265', '911788', 'Room Decoration', 'InteriorDesigner', 'Gurdaspur', 'Kalyan colony,Kalyan Road', '9am-6pm', 1520, 'Gurdaspur,Dinanagr', 'pending', 'serviceproviderphotos/8557interior3.jpg'),
('kanchan@gmail.com', 'Kanchan Verma', '9646169010', '981477', 'Mehndi Artist', 'BeautySalon', 'Gurdaspur', 'Lakme-Beauty Salon,Jail Road', '10am-9pm', 680, 'Gurdaspur,Dinanagr', 'pending', 'serviceproviderphotos/9595mehndi3.jpg'),
('kapilsharma@gmail.com', 'Kapil Sharma', '9780648922', '718527', 'Wedding Photography', 'Photography', 'Amritsar', 'Sharma Photographers,Nehru Shopping Complex', '10am-8pm', 14000, 'Amritsar,Batala,Gurdaspur', 'pending', 'serviceproviderphotos/6179couple2.jpg'),
('kawal@gmail.com', 'Kawaljeet Kaur', '8054929382', '761729', 'Hair Stylist', 'BeautySalon', 'Amritsar', '67,Ranjit Avenue,B-Block', '9am-8pm', 650, 'Amritsar,Batala', 'pending', 'serviceproviderphotos/2927hair1.jpg'),
('kiran@gmail.com', 'Kiran', '9646169010', '955844', 'Deep Cleaning of Full House', 'Cleaning', 'Amritsar', 'Vijay Nagar', '10am-10pm', 2200, 'shakti nagar,vijay nagar,majitha road', 'pending', 'serviceproviderphotos/1548kit.jpg'),
('kritika@gmail.com', 'Kritika Arora', '9780648922', '459326', 'Birthday Party Photography', 'Photography', 'Gurdaspur', 'Arora Photographers,Aman Avenue', '9am-8pm', 5000, 'Gurdaspur,Dinanagr', 'pending', 'serviceproviderphotos/9713birthday1.jpg'),
('lovepreet@gmail.com', 'Lovepreet Singh', '9815877737', '440405', 'Wedding Photography', 'Photography', 'Gurdaspur', 'Love Photographers,Patel Avenue', '11am-7pm', 8900, 'Gurdaspur,Dinanagr', 'pending', 'serviceproviderphotos/3428photography5.jpg'),
('mandeep@gmail.com', 'Mandeep', '9815877737', '871207', 'Men Grooming', 'BeautySalon', 'Amritsar', 'Ranjit Avenue', '10am-7pm', 790, 'Amritsar', 'pending', 'serviceproviderphotos/9336menface2.jpg'),
('Mankaur@gmail.com', 'Manpreet Kaur', '8146130143', '698605', 'Kitchen Interior', 'InteriorDesigner', 'Gurdaspur', 'H No:45,Sharma Avenue', '11am-7pm', 3200, 'Gurdaspur,Batala', 'pending', 'serviceproviderphotos/603kit2.jpg'),
('mehar@gmail.com', 'Mehar Singh', '8146130143', 'mehar', 'Wedding Photography', 'Photography', 'Gurdaspur', 'Mehar Photographers,Mall Road', '11am-7pm', 4500, 'gurdaspur,dinanagr', 'pending', 'serviceproviderphotos/9657photography4.jpg'),
('mp@gmail.com', 'Manpreet', '8054929382', '1234', 'Hair Spa for Women', 'BeautySalon', 'Mumbai', 'near filmcity,goregaon', '10am-7pm', 1000, 'Goregaon,Andheri', 'pending', 'serviceproviderphotos/4401girl8.jpg'),
('neha@gmail.com', 'Neha', '9815877737', '286104', 'Washing Machine Repair', 'Electronics', 'Benagaluru', 'shop no. 14,mall road', '11am-7pm', 2500, 'bengaluru', 'pending', 'serviceproviderphotos/9984ac1.jpg'),
('nidhi@gmail.com', 'Nidhi', '8054929382', '066708', 'Hair Spa', 'BeautySalon', 'Chandigarh', 'Sector 34,P.U. Market,', '10am-8pm', 560, 'chandigarh', 'pending', 'serviceproviderphotos/5847hair4.jpg'),
('pankaj@gmail.com', 'Pankaj Arora', '8054929382', '834552', 'Bathroom Deep Cleaning', 'Cleaning', 'Gurdaspur', 'Shop No:10, Near Gandhi Chownk,Batala Road', '9am-8pm', 500, 'Gurdaspur', 'pending', 'serviceproviderphotos/2271bathclean.jpg'),
('pankajsharma@gmail.com', 'Pankaj Sharma', '9815877737', '201137', 'A/C Repair', 'Electronics', 'Gurdaspur', 'Parbhat Electronics,Batala Road', '11am-7pm', 250, 'Gurdaspur,Dinanagr', 'pending', 'serviceproviderphotos/9928ac5.jpg'),
('poonam@gmail.com', 'Poonam', '8146130143', 'poonam', 'Gym Trainer', 'HealthWellness', 'Mumbai', 'Wellness Gym,Vijay Nagar', '6am-4pm', 1000, 'Vijay Nagar', 'pending', 'gym5.jpg'),
('prachi@gmail.com', 'Prachi', '9815877737', 'prachi', 'Interior designer ', 'InteriorDesigner', 'Mumbai', '567,Goregaon', '11am-7pm', 1250, 'Goregaon,Andheri,', 'pending', 'serviceproviderphotos/5581girl10.jpg'),
('pragya@gmail.com', 'Pragya Sharma', '8146130143', '973890', 'Kitchen Deep Cleaning', 'Cleaning', 'Gurdaspur', 'Shop No:78,Kahlon Avenue', '10am-7pm', 650, 'Gurdaspur', 'pending', 'serviceproviderphotos/7530kitclean1.jpg'),
('rahul@gmail.com', 'Rahul', '8054929382', '833690', 'Men Facial', 'BeautySalon', 'Delhi', 'H No:34,Jallalabad chownk', '10am-7pm', 650, 'Aurangabad,Jallabad,Chandni chownk', 'pending', 'serviceproviderphotos/1639menface.jpg'),
('rajat@gmail.com', 'Rajat', '6280995201', '744910', 'Gym Trainer', 'HealthWellness', 'Amritsar', 'amritsar', '10am-7pm', 500, 'Vijay Nagar', 'pending', 'serviceproviderphotos/3656gym6.jpg'),
('ramesh@gmail.com', 'Ramesh Kumar', '9530769265', '441112', 'Washing Machine Repair', 'Electronics', 'Gurdaspur', 'Ramesh Elcetronics,Farid Avenue', '10am-7pm', 350, 'Gurdaspur,Dinanagr', 'pending', 'serviceproviderphotos/8237washingmachine1.jpg'),
('ravi@gmail.com', 'Ravi Kumar', '9815877737', '660476', 'MakeUp Artist', 'BeautySalon', 'Gurdaspur', 'Loreal- Hairstyles,Makeup,Manicure,Pedicure', '9am-8pm', 500, 'gurdaspur,dinanagr', 'pending', 'serviceproviderphotos/1893hair3.jpg'),
('ravikumar@gmail.com', 'Ravi Kumar', '8146130143', '376446', 'Yoga Trainer', 'HealthWellness', 'Gurdaspur', 'Ravi Yoga Centre,Farid Avenue', '6am-8pm', 1000, 'Gurdaspur,Dinanagr', 'pending', 'serviceproviderphotos/304yoga2.jpg'),
('rishi@gmail.com', 'Rishi', '8146130143', '212203', 'Gym Trainer', 'HealthWellness', 'Gurdaspur', 'Fitness Gym', '6am-4pm', 1200, 'Jail Road,Near Police station', 'pending', 'serviceproviderphotos/2850gym4.jpg'),
('ritika.dogra23@gmail.com', 'Ritika', '9530769265', '956268', 'Interior designer ', 'InteriorDesigner', 'Gurdaspur', 'Shop No:23,Jail Road', '10am-7pm', 5236, 'gurdaspur,dinanagar', 'pending', 'serviceproviderphotos/8738interior1.jpg'),
('satyam.arora18@gmail.com', 'Satyam', '9464169010', '611619', 'Car Washing', 'Cleaning', 'Amritsar', 'Shop No:134,Near Shivala ', '11am-7pm', 150, 'Amritsar,City Side', 'pending', 'serviceproviderphotos/191boy5.jpg'),
('shikha22attri.94@gmail.com', 'Shikha', '9780648922', '501982', 'MakeUp Artist', 'BeautySalon', 'Amritsar', 'MAJITHA ROAD,AMRITSAR', '10am-8pm', 500, 'Amritsar', 'pending', 'serviceproviderphotos/1263makeup.jpg'),
('shivali@gmail.com', 'Shivali Sharma', '9815877737', '054078', 'Birthday Party Photography', 'Photography', 'Amritsar', 'Shivali Photographers,Loharka Road', '10am-7pm', 10000, 'Amritsar,Batala,Gurdaspur', 'pending', 'serviceproviderphotos/6264birth3.jpg'),
('shivalisharma295@gmail.com', 'Shivali', '9815877737', 'shivali', 'Mehndi Expert', 'BeautySalon', 'Gurdaspur', 'jail road,near arya school', '11am-7pm', 400, 'gurdaspur,dinanagr', 'pending', 'serviceproviderphotos/3925girl9.jpg'),
('shivam@gmail.com', 'Shivam', '9530769265', '912811', 'Gym Trainer', 'HealthWellness', 'Gurdaspur', '22,urban estates', '10am-7pm', 2000, 'gurdaspur,dinanagr,batala', 'pending', 'serviceproviderphotos/9037gym5.jpg'),
('shweta@gmail.com', 'Shweta Kumari', '8054929382', '181460', 'Hair Stylist', 'BeautySalon', 'Gurdaspur', 'Shweta Beauty Salon,J.P. Nagar', '10am-7pm', 560, 'Gurdaspur', 'pending', 'serviceproviderphotos/3312hair2.jpg'),
('soham@gmail.com', 'Soham Singh', '8146130143', '106559', 'Wedding Photography', 'Photography', 'Amritsar', 'Soham Photographers,Ranjit Avenue', '10am-7pm', 15000, 'Amritsar,Manawala,Batala', 'pending', 'serviceproviderphotos/2437couple1.jpg'),
('sumit@gmail.com', 'Sumit Singh', '8146130143', '950543', 'Bathroom Deep Cleaning', 'Cleaning', 'Amritsar', '67,Batala Road', '10am-4pm', 250, 'Amritsar', 'pending', 'serviceproviderphotos/2225clean2.jpg'),
('sumitsingh@gmail.com', 'Sumit Singh', '8146130143', '561687', 'Washing Machine Repair', 'Electronics', 'Gurdaspur', 'Dogra Electronics', '11am-7pm', 250, 'Gurdaspur,Dinanagr', 'pending', 'serviceproviderphotos/7830wm4.jpg'),
('vidya@gmail.com', 'Vidya', '9815877737', '501793', 'Manicure,Pedicure', 'BeautySalon', 'Chandigarh', 'Vidya Salon & Spa', '10am-5pm', 650, 'Near PVR', 'pending', 'serviceproviderphotos/4mani1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `sid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `services` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `price` int(11) NOT NULL,
  `photo` varchar(700) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`sid`, `email`, `services`, `description`, `price`, `photo`) VALUES
(1, 'mp@gmail.com', 'Hair Spa,Rebonding,Smoothening', 'We give best services to you..Our customer is our priority', 1260, 'servicesphotos/8656menface.jpg'),
(2, 'harman@gmail.com', 'Refrigerator Repair', 'All Kinds of Refrigerators can be repaired', 300, 'servicesphotos/6288washingmachine1.jpg'),
(20, 'nidhi@gmail.com', 'Hair Spa,Hair coloring', 'Hair-the essential part of human body', 900, 'servicesphotos/1885hair4.jpg'),
(21, 'rahul@gmail.com', 'Men Grooming', 'Men Facial,Hair Massage to be done here', 1200, 'servicesphotos/1756menmassage.jpg'),
(22, 'vidya@gmail.com', 'Manicure,Pedicure', 'Hands and Feet should be as soft as a Rose Petal', 550, 'servicesphotos/7983mani2.jpg'),
(23, 'vidya@gmail.com', 'Mehndi ', 'Bridal Mehndi-Arabic Mehndi,Green mehndi', 3200, 'servicesphotos/9531mehndi2.jpg'),
(24, 'shivalisharma295@gmail.com', 'Mehndi ', 'All Kinds Of Mehndi ', 650, 'servicesphotos/8273mehndi1.jpg'),
(25, 'kiran@gmail.com', 'Cleaning', 'Deep Cleaning Of House And Kitchen', 1000, 'servicesphotos/2887clean1.jpg'),
(26, 'satyam.arora18@gmail.com', 'Car Washing', 'All Brands of Cars to be washed here', 150, 'servicesphotos/8780carwash1.jpg'),
(27, 'neha@gmail.com', 'A/C Repair', 'All Kinds Of Ac can be reapired', 150, 'servicesphotos/869ac2.jpg'),
(28, 'neha@gmail.com', 'Washing Machine Repair', 'All kinds of washing machine can be repaired by our professional team', 150, 'servicesphotos/9771wm3.jpg'),
(29, 'kajal@gmail.com', 'Water Purifier Repair', 'Everpure,Aquaguard etc. water purifiers can be repaired', 300, 'servicesphotos/4190ro1.jpg'),
(30, 'kajal@gmail.com', 'Washing Machine Repair', 'All Kinds of washing machine can be repaired', 150, 'servicesphotos/821wm5.jpg'),
(31, 'jagpreet@gmail.com', 'Washing Machine Repair', 'L.G.,Whirlpool,Samsung machine can be repaired', 170, 'servicesphotos/6545wm6.jpg'),
(32, 'rishi@gmail.com', 'Gym Trainer', 'Tredmill,Dumbles ..All Kinds of Exercises can be done here with full best equipments.', 1000, 'servicesphotos/7360gym5.jpg'),
(33, 'poonam@gmail.com', 'Gym Trainer', 'Best and Easy Exercises for Girls,Women and Kids.', 900, 'servicesphotos/5209gym3.jpg'),
(34, 'shivam@gmail.com', 'Gym Trainer', 'More Workout,More Fit,Better Health', 950, 'servicesphotos/3222gym9.jpg'),
(39, 'prachi@gmail.com', 'Interior Designer', 'Best Designing for Offices,Homes,Palaces', 4500, 'servicesphotos/824interior.jpg'),
(40, 'ritika.dogra23@gmail.com', 'Interior Designer', 'Interior Designing of kitchen,Drawing Rooms,Bedrooms', 3000, 'servicesphotos/4698interior3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `mobile` varchar(13) NOT NULL,
  `email` varchar(40) NOT NULL,
  `address` varchar(500) NOT NULL,
  `city` varchar(40) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`mobile`, `email`, `address`, `city`, `photo`, `password`) VALUES
('8146130143', 'manisha.attri96@gmail.com', '34,aman avenue', 'AMRITSAR', 'userphotos/6374girl7.jpg', 'mishu'),
('9530769265', 'shikha22attri.94@gmail.com', '#47,NEW DIAMOND AVENUE,MAJITHA ROAD,AMRITSAR', 'AMRITSAR', 'userphotos/4109girl1.jpg', 'shikha'),
('9646169010', 'yashima.arora18@gmail.com', 'HNo:90,Near Shivala', 'Amritsar', 'userphotos/9018girl4.jpg', 'bdcibh'),
('9815877737', 'riya@gmail.com', '678,Urban Estates', 'Bengaluru', 'userphotos/89881111.jpg', 'riya');

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
  ADD PRIMARY KEY (`bid`),
  ADD KEY `spemail` (`spemail`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catname`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviewed`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  ADD PRIMARY KEY (`email`),
  ADD KEY `catname` (`catname`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`mobile`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviewed` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  ADD CONSTRAINT `serviceprovider_ibfk_1` FOREIGN KEY (`catname`) REFERENCES `category` (`catname`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`email`) REFERENCES `serviceprovider` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
