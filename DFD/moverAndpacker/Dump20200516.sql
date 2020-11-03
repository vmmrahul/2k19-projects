-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: moversandpackers
-- ------------------------------------------------------
-- Server version	5.5.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `moversandpackers`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `moversandpackers` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `moversandpackers`;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `email` varchar(30) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('anmol@gmail.com','123','admin','9592231891'),('ayushi.dhir95@gmail.com','111','admin','7989767699'),('b@gmail.com','123','subadmin','9779319197');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `bookingid` int(11) NOT NULL AUTO_INCREMENT,
  `bookername` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `pickupstate` varchar(45) DEFAULT NULL,
  `pickupcity` varchar(45) DEFAULT NULL,
  `pickupaddress` text,
  `droppingstate` varchar(45) DEFAULT NULL,
  `droppingcity` varchar(45) DEFAULT NULL,
  `droppingaddress` text,
  `packagename` varchar(45) DEFAULT NULL,
  `dateofbooking` date DEFAULT NULL,
  `dateofpickup` date DEFAULT NULL,
  `dateofdropping` date DEFAULT NULL,
  `paymentmode` varchar(45) DEFAULT NULL,
  `amountreceived` float DEFAULT NULL,
  `paymentstatus` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `dispatchstatus` varchar(45) DEFAULT NULL,
  `emailstatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bookingid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (36,'anmol','hundal.anmol96@gmail.com','9592231891','Punjab','Amritsar','cc','Punjab','Amritsar','kl','Gold 122','2019-11-09','2019-11-28','2019-11-28','Cash',0,'success','accepted','pending','pending'),(37,'anmol','hundal.anmol96@gmail.com','9592231891','Uttar Pradesh','Kanpur','aaa','Uttar Pradesh','Lucknow','aaa','Gold 125','2019-11-09','2019-11-26','2019-11-27','Cash',0,'pending','rejected','pending','pending'),(38,'anmol','hundal.anmol96@gmail.com','9592231891','Uttar Pradesh','Kanpur','aaa','Uttar Pradesh','Lucknow','aaa','Gold 125','2019-11-09','2019-11-26','2019-11-29','Cash',0,'success','accepted','success','success'),(39,'anmol','hundal.anmol96@gmail.com','9592231891','Punjab','Jalandhar','rt','Punjab','Amritsar','op','Premium 103','2019-11-09','2019-11-27','2019-11-28','online',12000,'success','accepted','success','success'),(42,'anmol','hundal.anmol96@gmail.com','9592231891','Punjab','Tarn-Taran','House no.101','Punjab','Amritsar','houseno.109','Premium 101','2019-11-10','2019-11-27','2019-11-25','online',4500,'success','accepted','pending','pending'),(46,'anmol','hundal.anmol96@gmail.com','9592231891','Punjab','Tarn-Taran','errw','Punjab','Amritsar','opp','Premium 101','2019-11-10','2019-11-27','2019-11-29','online',4500,'success','pending','pending','pending'),(47,'anmol','hundal.anmol96@gmail.com','9592231891','Punjab','Amritsar','aaa','Punjab','Tarn-Taran','mmmm','Gold 101','2019-11-11','2019-11-27','2019-11-30','Cash',0,'pending','rejected','pending','pending'),(48,'anmol','hundal.anmol96@gmail.com','9592231891','Punjab','Tarn-Taran','ccc','Punjab','Amritsar','kkk','Premium 101','2019-11-11','2019-11-29','2019-11-30','online',4500,'success','pending','pending','pending'),(49,'anmol','hundal.anmol96@gmail.com','9592231891','Punjab','Amritsar','aaa','Punjab','Tarn-Taran','aaa','Gold 101','2019-11-11','2019-11-27','2019-11-30','online',9000,'success','pending','pending','pending'),(50,'anmol','hundal.anmol96@gmail.com','9592231891','Punjab','Amritsar','aaa','Punjab','Tarn-Taran','bbb','Premium 101','2019-11-11','2019-11-27','2019-11-29','Cash',0,'pending','accepted','pending','pending'),(52,'anmol','hundal.anmol96@gmail.com','9592231891','Punjab','Amritsar','zzz','Punjab','Tarn-Taran','xxx','Premium 101','2019-11-16','2019-11-27','2019-11-28','Cash',0,'success','pending','success','pending'),(53,'anmol','hundal.anmol96@gmail.com','9592231891','Punjab','Amritsar','house no.101 rani ka bagh ','Punjab','Amritsar','house 102 majitha road','Gold 122','2019-11-19','2019-11-28','2019-11-30','Cash',0,'pending','pending','pending','pending'),(54,'anmol','hundal.anmol96@gmail.com','9592231891','Punjab','Amritsar','house no. 100 Sunny enclave,Ram Tirath Road','Punjab','Attari','House no. 201 Rani ka bagh','Gold 129','2019-11-21','2019-11-27','2019-11-29','Cash',0,'pending','pending','pending','pending'),(55,'anmol','hundal.anmol96@gmail.com','9592231891','Punjab','Tarn-Taran','HNo:78,Urban avenue','Punjab','Tarn-Taran','HNo:90,farid avenue','Gold 133','2019-11-22','2019-11-28','2019-11-29','online',12000,'success','pending','pending','pending');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_track`
--

DROP TABLE IF EXISTS `booking_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_track` (
  `trackingid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingid` varchar(45) DEFAULT NULL,
  `remarks` text,
  `dateofupdate` date DEFAULT NULL,
  PRIMARY KEY (`trackingid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_track`
--

LOCK TABLES `booking_track` WRITE;
/*!40000 ALTER TABLE `booking_track` DISABLE KEYS */;
INSERT INTO `booking_track` VALUES (1,'37','your consigment will be delievered within 24 hrs','2019-11-18'),(2,'38','your consigment will reach your destination within 2 hours.','2019-11-19');
/*!40000 ALTER TABLE `booking_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `newsid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `dateofnews` date DEFAULT NULL,
  PRIMARY KEY (`newsid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (8,'new servives','new Services have been added for customers','2019-10-22'),(9,'modifications','new packages have been availed','2019-10-28'),(12,'modifications of services','qqqqqqqqcc','2019-10-31'),(13,'new services for customers!1','alert!!!!1','2019-10-31');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packages` (
  `packagename` varchar(60) NOT NULL,
  `description` varchar(450) DEFAULT NULL,
  `sourcestate` varchar(45) DEFAULT NULL,
  `sourcecity` varchar(45) DEFAULT NULL,
  `destinationstate` varchar(45) DEFAULT NULL,
  `destinationcity` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`packagename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES ('Gold 101','upto 2000 Kg extra @200 per kg','Punjab','Amritsar','Punjab','Tarn-Taran',9000),('Gold 102','upto 2000 Kg extra @200 per Kg ','Punjab','Amritsar','Punjab','Bathinda',14000),('Gold 103','upto 2000 Kg extra @200 per Kg ','Punjab','Amritsar','Punjab','Jalandhar',20000),('Gold 104','upto 2000 Kg extra @200 per Kg ','Punjab','Amritsar','Punjab','Pathankot',28000),('Gold 105','upto 2000 Kg extra @200 per Kg ','Punjab','Amritsar','Punjab','Ludhiana',26000),('Gold 106','upto 2000 Kg extra @200 per Kg ','Punjab','Gurdaspur','Delhi','Firozabad',70000),('Gold 107','upto 2000 Kg extra @200 per Kg ','Delhi','Shajahnabad','Punjab','Faridkot',55000),('Gold 108','upto 2000 Kg extra @200 per Kg ','Delhi','Mehrauli','Haryana','Panipat',45000),('Gold 109','upto 2000 Kg extra @200 per Kg ','Punjab','Ajnala','Punjab','Moga',25000),('Gold 110','upto 2000 Kg extra @200 per Kg ','Punjab','Attari','Jammu and Kashmir','Leh',43000),('Gold 111','upto 2000 Kg extra @200 per Kg ','Maharashtra','Mumbai','Haryana','Rohtak',37000),('Gold 112','upto 2000 Kg extra @200 per Kg ','Tamil Nadu','Pondicherry','Haryana','Sirsa',70000),('Gold 113','upto 2000 Kg extra @200 per Kg ','Karnataka','Manglore','West Bengal','Kolkata',55000),('Gold 114','upto 2000 Kg extra @200 per Kg','Delhi','Shergarh','Uttar Pradesh','Kanpur',50000),('Gold 115','upto 2000 Kg extra @200 per Kg','Punjab','Amritsar','Maharashtra','Mumbai',80000),('Gold 116','upto 2000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Ferozpur',35000),('Gold 117','upto 2000 Kg extra @200 per Kg','Uttar Pradesh','Ayodhya','Tamil Nadu','Ranipet',85000),('Gold 118','upto 2000 Kg extra @200 per Kg','West Bengal','Durgapur','Punjab','Pathankot',78000),('Gold 119','upto 2000 Kg extra @200 per Kg','Kerala','Kochi','Jammu and Kashmir','Srinagar',90000),('Gold 120','upto 2000 Kg extra @200 per Kg','Delhi','Firozabad','West Bengal','Shantipur',92000),('Gold 121','upto 2000 Kg extra @200 per Kg','Maharashtra','Ahmednagar','Maharashtra','Ahmednagar',18000),('Gold 122','upto 2000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Amritsar',15000),('Gold 123','upto 2000 Kg extra @200 per Kg','Jammu and Kashmir','Srinagar','Jammu and Kashmir','Srinagar',17500),('Gold 124','upto 2000 Kg extra @200 per Kg','Haryana','Ambala','Haryana','Gurugram',32000),('Gold 125','upto 2000 Kg extra @200 per Kg','Uttar Pradesh','Kanpur','Uttar Pradesh','Lucknow',21000),('Gold 126','upto 2000 Kg extra @200 per Kg','Karnataka','Hampi','Karnataka','Badami',20000),('Gold 127','upto 2000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Ajnala',13000),('Gold 128','upto 2000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Abhor',30000),('Gold 129','upto 2000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Attari',10000),('Gold 130','upto 2000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Faridkot',12500),('Gold 131','upto 2000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Gurdaspur',12000),('Gold 132','upto 2000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Moga',15000),('Gold 133','upto 2000 Kg extra @200 per Kg','Punjab','Tarn-Taran','Punjab','Tarn-Taran',12000),('Gold 134','upto 2000 Kg extra @200 per Kg','Punjab','Abhor','Punjab','Abhor',10000),('Gold 135','upto 2000 Kg extra @200 per Kg','Punjab','Ajnala','Punjab','Ajnala',12000),('Gold 136','upto 2000 Kg extra @200 per Kg','Punjab','Bathinda','Punjab','Bathinda',12000),('Gold 137','upto 2000 Kg extra @200 per Kg','Punjab','Faridkot','Punjab','Faridkot',13000),('Gold 138','upto 2000 Kg extra @200 per Kg','Punjab','Attari','Punjab','Attari',7500),('Gold 139','upto 2000 Kg extra @200 per Kg','Punjab','Ferozpur','Punjab','Ferozpur',12000),('Gold 140','upto 2000 Kg extra @200 per Kg','Punjab','Gurdaspur','Punjab','Gurdaspur',9800),('Gold 141','upto 2000 Kg extra @200 per Kg','Punjab','Jalandhar','Punjab','Jalandhar',8900),('Gold 142','upto 2000 Kg extra @200 per Kg','Punjab','Ludhiana','Punjab','Ludhiana',9000),('Gold 143','upto 2000 Kg extra @200 per Kg','Punjab','Moga','Punjab','Moga',9000),('Gold 144','upto 2000 Kg extra @200 per Kg','Punjab','Pathankot','Punjab','Pathankot',12000),('Premium 101','upto 1000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Tarn-Taran',4500),('Premium 102','upto 1000 Kg extra @200 per Kg ','Punjab','Amritsar','Punjab','Bathinda',7000),('Premium 103','upto 1000 Kg extra @200 per Kg ','Punjab','Amritsar','Punjab','Jalandhar',12000),('Premium 104','upto 1000 Kg extra @200 per Kg ','Punjab','Amritsar','Punjab','Pathankot',15000),('Premium 105','upto 1000 Kg extra @200 per Kg ','Punjab','Amritsar','Punjab','Ludhiana',13000),('Premium 106','upto 1000 Kg extra @200 per Kg ','Punjab','Gurdaspur','Delhi','Firozabad',40000),('Premium 107','upto 1000 Kg extra @200 per Kg ','Delhi','Shajahnabad','Punjab','Faridkot',30000),('Premium 108','upto 1000 Kg extra @200 per Kg ','Delhi','Mehrauli','Haryana','Panipat',28000),('Premium 109','upto 1000 Kg extra @200 per Kg ','Punjab','Ajnala','Punjab','Moga',15000),('Premium 110','upto 1000 Kg extra @200 per Kg ','Punjab','Attari','Jammu and Kashmir','Leh',22000),('Premium 111','upto 1000 Kg extra @200 per Kg ','Maharashtra','Mumbai','Haryana','Rohtak',28000),('Premium 112','upto 1000 Kg extra @200 per Kg ','Tamil Nadu','Pondicherry','Haryana','Sirsa',40000),('Premium 113','upto 1000 Kg extra @200 per Kg ','Karnataka','Manglore','West Bengal','Kolkata',30000),('Premium 114','upto 1000 Kg extra@200 per Kg','Delhi','Shergarh','Uttar Pradesh','Kanpur',30000),('Premium 115','upto 1000 Kg extra @200 per Kg  ','Punjab','Amritsar','Maharashtra','Mumbai',50000),('Premium 116','upto 1000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Ferozpur',18000),('Premium 117','upto 1000 Kg extra @200 per Kg','Uttar Pradesh','Ayodhya','Tamil Nadu','Ranipet',50000),('Premium 118','upto 1000 Kg extra @200 per Kg','West Bengal','Durgapur','Punjab','Pathankot',56000),('Premium 119','upto 1000 Kg extra @200 per Kg','Kerala','Kochi','Jammu and Kashmir','Srinagar',58000),('Premium 120','upto 1000 Kg extra @200 per Kg','Delhi','Firozabad','West Bengal','Shantipur',56000),('Premium 121','upto 1000 Kg extra @200 per Kg','Maharashtra','Ahmednagar','Maharashtra','Ahmednagar',12000),('Premium 122','upto 1000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Amritsar',7200),('Premium 123','upto 1000 Kg extra @200 per Kg','Jammu and Kashmir','Srinagar','Jammu and Kashmir','Srinagar',7800),('Premium 124','upto 1000 Kg extra @200 per Kg','Haryana','Ambala','Haryana','Gurugram',20000),('Premium 125','upto 1000 Kg extra @200 per Kg','Uttar Pradesh','Kanpur','Uttar Pradesh','Lucknow',13000),('Premium 126','upto 1000 Kg extra @200 per Kg','Karnataka','Hampi','Karnataka','Badami',12000),('Premium 127','upto 1000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Ajnala',5600),('Premium 128','upto 1000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Abhor',20000),('Premium 129','upto 1000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Attari',5000),('Premium 130','upto 1000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Faridkot',6700),('Premium 131','upto 1000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Gurdaspur',5600),('Premium 132','upto 1000 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Moga',7000),('Premium 133','upto 1000 Kg extra @200 per Kg','Punjab','Tarn-Taran','Punjab','Tarn-Taran',4500),('Premium 134','upto 1000 Kg extra @200 per Kg','Punjab','Abhor','Punjab','Abhor',5000),('Premium 135','upto 1000 Kg extra @200 per Kg','Punjab','Ajnala','Punjab','Ajnala',4500),('Premium 136','upto 1000 Kg extra @200 per Kg','Punjab','Bathinda','Punjab','Bathinda',5600),('Premium 137','upto 1000 Kg extra @200 per Kg','Punjab','Faridkot','Punjab','Faridkot',6700),('Premium 140','upto 1000 Kg extra @200 per Kg','Punjab','Gurdaspur','Punjab','Gurdaspur',4500),('Premium 142','upto 1000 Kg extra @200 per Kg','Punjab','Ludhiana','Punjab','Ludhiana',4600),('Premium 143','upto 1000 Kg extra @200 per Kg','Punjab','Moga','Punjab','Moga',5800),('Premium 144','upto 1000 Kg extra @200 per Kg','Punjab','Pathankot','Punjab','Pathankot',4500),('Silver 101','upto 1500 Kg extra @200 per Kg ','Punjab','Amritsar','Punjab','Tarn-Taran',7500),('Silver 102','upto 1500 Kg extra @200 per Kg ','Punjab','Amritsar','Punjab','Bathinda',12000),('Silver 103','upto 1500 Kg extra @200 per Kg ','Punjab','Amritsar','Punjab','Jalandhar',17000),('Silver 104','upto 1500 Kg extra @200 per Kg ','Punjab','Amritsar','Punjab','Pathankot',22000),('Silver 105','upto 1500 Kg extra @200 per Kg ','Punjab','Ludhiana','Punjab','Ludhiana',20000),('Silver 106','upto 1500 Kg extra @200 per Kg ','Punjab','Gurdaspur','Delhi','Firozabad',58000),('Silver 107','upto 1500 Kg extra @200 per Kg ','Delhi','Firozabad','Punjab','Faridkot',42000),('Silver 108','upto 1500 Kg extra @200 per Kg ','Delhi','Mehrauli','Haryana','Panipat',40000),('Silver 109','upto 1500 Kg extra @200 per Kg ','Punjab','Ajnala','Punjab','Moga',20000),('Silver 110','upto 1500 Kg extra @200 per Kg ','Punjab','Attari','Jammu and Kashmir','Leh',35000),('Silver 111','upto 1500 Kg extra @200 per Kg ','Maharashtra','Mumbai','Haryana','Rohtak',45000),('Silver 112','upto 1500 Kg extra @200 per Kg ','Tamil Nadu','Pondicherry','Haryana','Sirsa',58000),('Silver 113','upto 1500 Kg extra @200 per Kg ','Karnataka','Manglore','West Bengal','Kolkata',59000),('Silver 114','upto 1500 Kg extra @200 per Kg','Delhi','Shergarh','Uttar Pradesh','Kanpur',40000),('Silver 115','upto 1500 Kg extra @200 per Kg','Punjab','Amritsar','Maharashtra','Mumbai',65000),('Silver 116','upto 1500 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Ferozpur',26000),('Silver 117','upto 1500 Kg extra @200 per Kg','Uttar Pradesh','Ayodhya','Tamil Nadu','Ranipet',66000),('Silver 118','upto 1500 Kg extra @200 per Kg','West Bengal','Durgapur','Punjab','Pathankot',62000),('Silver 119','upto 1500 Kg extra @200 per Kg','Kerala','Kochi','Jammu and Kashmir','Srinagar',70000),('Silver 120','upto 1500 Kg extra @200 per Kg','Delhi','Firozabad','West Bengal','Shantipur',75000),('Silver 121','upto 1500 Kg extra @200 per Kg','Maharashtra','Ahmednagar','Maharashtra','Ahmednagar',15000),('Silver 122','upto 1500 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Amritsar',11000),('Silver 123','upto 1500 Kg extra @200 per Kg','Jammu and Kashmir','Srinagar','Jammu and Kashmir','Srinagar',13500),('Silver 124','upto 1500 Kg extra @200 per Kg','Haryana','Ambala','Haryana','Gurugram',26000),('Silver 125','upto 1500 Kg extra @200 per Kg','Uttar Pradesh','Kanpur','Uttar Pradesh','Lucknow',15500),('Silver 126','upto 1500 Kg extra @200 per Kg','Karnataka','Hampi','Karnataka','Badami',16500),('Silver 127','upto 1500 Kg extra @ 200 per Kg','Punjab','Amritsar','Punjab','Ajnala',9000),('Silver 128','upto 1500 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Abhor',25000),('Silver 129','upto 1500 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Attari',7600),('Silver 130','upto 1500 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Faridkot',8900),('Silver 131','upto 1500 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Gurdaspur',8000),('Silver 132','upto 1500 Kg extra @200 per Kg','Punjab','Amritsar','Punjab','Moga',10000),('Silver 138','upto 1500 Kg extra @200 per Kg','Punjab','Attari','Punjab','Attari',5800),('Silver 139','upto 1000 Kg extra @200 per Kg','Punjab','Ferozpur','Punjab','Ferozpur',4500),('Silver 141','upto 1000 Kg extra @200 per Kg','Punjab','Jalandhar','Punjab','Jalandhar',4500);
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `reviewid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingid` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `review` text,
  `dateofsubmission` date DEFAULT NULL,
  `bookername` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reviewid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (7,46,3,'I am really impressed with Packing Kings. Great service. Recently, I have moved house from Uppal to Miyapur. After listing the items in their website, I got quotes from various vendors and PackingKings team helped me to choose a vendor. They kept track and were in regular contact until the move is done. I have to make special mention about your website; Great design guys and so simple. The fact that my mom could list the items in your website and get a quote means you have done a fantastic job!!','2019-11-16','anmol','userphotos/38844house.jpg'),(8,38,3,'I am really impressed with Packing Kings. Great service. Recently, I have moved house from Uppal to Miyapur. After listing the items in their website, I got quotes from various vendors and Packing Kings team helped me to choose a vendor. They kept track and were in regular contact until the move is done. I have to make special mention about your website; Great design guys and so simple. The fact that my mom could list the items in your website and get a quote means you have done a fantastic job!!','2019-11-18','anmol','userphotos/62820car.jpg'),(9,38,3,'I am really impressed with Packing Kings. Great service. Recently, I have moved house from Uppal to Miyapur. After listing the items in their website, I got quotes from various vendors and Packing Kings team helped me to choose a vendor. They kept track and were in regular contact until the move is done. I have to make special mention about your website; Great design guys and so simple. The fact that my mom could list the items in your website and get a quote means you have done a fantastic job!!','2019-11-18','anmol','userphotos/62820car.jpg'),(10,39,5,'good','2019-11-22','anmol','userphotos/49432a111.jpg');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicingstations`
--

DROP TABLE IF EXISTS `servicingstations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicingstations` (
  `service_city_name` varchar(60) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `state` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`service_city_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicingstations`
--

LOCK TABLES `servicingstations` WRITE;
/*!40000 ALTER TABLE `servicingstations` DISABLE KEYS */;
INSERT INTO `servicingstations` VALUES ('Abhor','Abhor,Punjab','Punjab'),('Ahmednagar','Ahmednagar,Maharashtra','Maharashtra'),('Ajnala','Ajnala,Punjab','Punjab'),('Akhnoor','Akhnoor,Jammu and Kashmir','Jammu and Kashmir'),('Aligarh','Aligarh,Uttar Pradesh','Uttar Pradesh'),('Ambala','Ambala,Haryana','Haryana'),('Amritsar','Amritsar,Punjab\n','Punjab'),('Anantnag','Anantnag,Jammu and Kashmir','Jammu and Kashmir'),('Attari','Attari,Punjab','Punjab'),('Ayodhya','Ayodhya,Uttar Pradesh','Uttar Pradesh'),('Badami','Badami,Karnataka','Karnataka'),('Ballari','Ballari,Karnataka','Karnataka'),('Bareilly','Bareilly,Uttar Pradesh','Uttar Pradesh'),('Bathinda','Bathinda,Punjab','Punjab'),('Bekal','Bekal,Kerala','Kerala'),('Bengaluru','Bengaluru,Karnataka','Karnataka'),('Beypore','Beypore,Kerala','Kerala'),('Bhopal','Bhopal,Madhya Pradesh','Madhya Pradesh'),('Chennai','Chennai,Tamil Nadu','Tamil Nadu'),('Dewas','Dewas,Madhya Pradesh','Madhya Pradesh'),('Doda','Doda,Jammu and Kashmir','Jammu and Kashmir'),('Durgapur','Durgapur,West Bengal','West Bengal'),('Faridkot','Faridkot,Punjab','Punjab'),('Ferozpur','Ferozpur,Punjab','Punjab'),('Firozabad','Firozabad,Delhi','Delhi'),('Gunna','Gunna,Madhya Pradesh','Madhya Pradesh'),('Gurdaspur','Gurdaspur,Punjab','Punjab'),('Gurugram','Gurugram,Haryana','Haryana'),('Gwalior','Gwalior,Madhya Pradesh','Madhya Pradesh'),('Habra','Habra,West Bengal','West Bengal'),('Hampi','Hampi,Karnataka','Karnataka'),('Hubli','Hubli,Karnataka','Karnataka'),('Indore','Indore,Madhya Pradesh','Madhya Pradesh'),('Jabalpur','Jabalpur,Madhya Pradesh','Madhya Pradesh'),('Jalandhar','Jalandhar,Punjab','Punjab'),('Jangipur','Jangipur,West Bengal','West Bengal'),('Kannur','Kannur,Kerala','Kerala'),('Kanpur','Kanpur,Uttar Pradesh','Uttar Pradesh'),('Kochi','Kochi,Kerala','Kerala'),('Kohlapur','Kohlapur,Maharashtra','Maharashtra'),('Kolkata','Kolkata,West Bengal','West Bengal'),('Kollam','Kollam,Kerala','Kerala'),('Latur','Latur,Maharashtra','Maharashtra'),('Leh','Leh,Jammu and Kashmir\n','Jammu and Kashmir'),('Lucknow','Lucknow,Uttar Pradesh','Uttar Pradesh'),('Ludhiana','Ludhiana,Punjab','Punjab'),('Madurai','Madurai,Tamil Nadu','Tamil Nadu'),('Manglore','Manglore,Karnataka','Karnataka'),('Mannur','Mannur,Kerala','Kerala'),('Meerut','Meerut,Uttar Pradesh','Uttar Pradesh'),('Mehrauli','Mehrauli,Delhi','Delhi'),('Moga','Moga,Punjab','Punjab'),('Mumbai','Mumbai,Maharashtra','Maharashtra'),('Nagpur','Nagpur,Maharashtra','Maharashtra'),('Panipat','Panipat,Haryana','Haryana'),('Panna','Panna,Madhya Pradesh','Madhya Pradesh'),('Pathankot','Pathankot,Punjab','Punjab'),('Pondicherry','Pondicherry,Tamil Nadu','Tamil Nadu'),('Pune','Pune,Maharashtra','Maharashtra'),('Rajauri','Rajauri,Jammu and Kashmir','Jammu and Kashmir'),('Ranipet','Ranipet,Tamil Nadu','Tamil Nadu'),('Rohtak','Rohtak,Haryana','Haryana'),('Sagar','Sagar,Madhya Pradesh','Madhya Pradesh'),('Sangli','Sangli,Maharashtra','Maharashtra'),('Satna','Satna,Madhya Pradesh','Madhya Pradesh'),('Shajahnabad','Shajahnabad,Delhi','Delhi'),('Shantipur','Shantipur,West Bengal','West Bengal'),('Shergarh','Shergarh,Delhi','Delhi'),('Shoranur','Shoranur,Kerala','Kerala'),('Sirsa','Sirsa,Haryana','Haryana'),('Solapur','Solapur,Maharashtra','Maharashtra'),('Srinagar','Srinagar,Jammu and Kashmir','Jammu and Kashmir'),('Tarn-Taran','Tarn-Taran,Punjab','Punjab'),('Tenkasi','Tenkasi,Tamil Nadu','Tamil Nadu'),('Varanasi','Varanasi,Uttar Pradesh','Uttar Pradesh'),('Vayala','Vayala,Kerala','Kerala'),('Yamuna Nagar','Yamuna Nagar,Haryana','Haryana');
/*!40000 ALTER TABLE `servicingstations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `email` varchar(30) NOT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('aaa@gmail.com','9592231891','123','komal','tarn-taran','userphotos/76574a111.jpg'),('abd@gmail.com','9592231891','111','gitika','amritsar','userphotos/76421del.png'),('anmol@yahoo.com','9592231891','234','ayushi','amritsar','userphotos/26950del.png'),('ayushi.dhir95@gmail.com','8427543923','123','ayushi','amritsar','userphotos/90862edit.png'),('harwant@gmail.com','9465346609','1234','harwant','tarn-taran','userphotos/86473edit.png'),('hundal.anmol96@gmail.com','9592231891','111','anmol','tarn-taran','userphotos/52086del.png'),('komal111@gmail.com','9465346609','333','komal','tarn-taran','userphotos/10452edit.png'),('tarsem@gmail.com','9872553470','456','Tarsem Singh','tarn-taran','userphotos/4246edit.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-16 10:45:33
