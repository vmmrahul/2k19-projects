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
-- Database: `kbc`
--

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `qid` int(11) NOT NULL,
  `question` text NOT NULL,
  `A` varchar(200) NOT NULL,
  `B` varchar(200) NOT NULL,
  `C` varchar(200) NOT NULL,
  `D` varchar(200) NOT NULL,
  `Ans` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`qid`, `question`, `A`, `B`, `C`, `D`, `Ans`) VALUES
(3, 'Grand Central Terminal, Park Avenue, New York is the world\'s', 'largest railway station', 'highest railway station', 'longest railway station', 'None of the above', 'A'),
(5, 'Entomology is the science that studies', 'Behavior of human beings', 'Insects', 'The origin and history of technical and scientific terms', 'The formation of rocks', 'B'),
(6, '	\r\nEritrea, which became the 182nd member of the UN in 1993, is in the continent of', 'Asia', 'Africa', 'Europe', 'Australia', 'B'),
(7, 'Garampani sanctuary is located at', 'Junagarh, Gujarat', ' Diphu, Assam', 'Kohima, Nagaland', 'Gangtok, Sikkim', 'B'),
(8, '	\r\nFor which of the following disciplines is Nobel Prize awarded?', 'Physics and Chemistry', 'Physiology or Medicine', 'Literature, Peace and Economics', 'All of the above', 'D'),
(9, 'Hitler party which came into power in 1933 is known as', 'Labour Party', 'Nazi Party', 'Ku-Klux-Klan', 'Democratic Party', 'B'),
(10, '	\r\nThe headquarter of ESCAP Economic and Social Commission for Asia are situated at', 'Bangkok', 'Geneva', 'Santiago (Chile)', 'Baghdad', 'A'),
(11, '	\r\nThe industrial organization of Atomic Minerals Division, Heavy Water Board (HWB) is located at', 'Mumbai', 'Kolkata', 'Hyderabad', 'Jadugude, Bihar', 'A'),
(12, 'The Indian Air Force celebrated its Golden Jubilee in', '1962', '1972', '1982', '1992', 'C'),
(13, 'The headquarter of OAU (Organization of African Unity) are at', 'Addis Ababa, Ethiopia', 'Washington DC', 'Paris', 'Jakarta, Indonesia', 'A'),
(14, '	\r\nThe headquarter of International Atomic Energy Agency (IAEA) are situated at', 'Vienna', 'Geneva', 'Rome', 'Paris', 'A'),
(15, 'The main crop of Meghalaya is', 'rice', 'wheat', 'barley', 'sugarcane', 'A'),
(16, 'The major minerals found in Uttar Pradesh are', 'limestone and dolomite', 'rock phosphate and dolomite', 'copper and graphite', 'None of the above', 'A'),
(17, 'The member of SEATO (South-East Asia Treaty Organisation) are', 'Australia, France, New Zealand', 'Philippines, Thailand', 'UK and USA', '	All of the above', 'D'),
(20, 'The highest national award in India given for exceptional work for advancement of art, literature and science', 'Bharat Ratna', 'Padma Awards', 'Gallantry Awards', 'None of the above', 'A'),
(21, 'The main reserves of phosphorus in the biosphere is in the', 'hydrosphere', 'atmosphere', 'lithosphere', 'troposphere', 'C'),
(22, 'The Loktak lake facing environmental problems is situated in', 'Orissa', 'Assam', 'Manipur', 'Kerala', 'C'),
(23, 'Who among the following has been named as the TIME magazine Person of the Year 2016?', 'Narendra Modi', 'Donald Trump', 'Vladimir Putin', 'Mark Zukerberg', 'B'),
(24, 'Which Indian village has recently earned the tag of becoming India’s first digital village in India?', 'Akrund', 'Akodara', 'Poshina', 'Punsari', 'B'),
(25, 'Who among the following has been elected as US ambassador to the United Nations (UN) by US President-elect Donald Trump?', 'Nikki Haley', 'Kamala Harris', 'Bobby Jindal', 'Ami Bera', 'A'),
(26, 'Name the person who has recently replaced Cyrus Mistry as the Chairman of Tata Global Beverages?', 'Ratan Tata', 'Lalit Modi', 'Harish Bhat', 'None of the above', 'C'),
(27, 'What is the newly launched toll-free helpline number for Unique Identification Authority of India?', '2016', '1947', '2000', '2020', 'B'),
(28, 'By when Indian Railways recently set the target to achieve 100 percent de-carbonisation with 90 percent electrification?', '2021', '2020', '2025', '2030', 'A'),
(29, 'Which Indian FMCG player is planning to make use of Artificial insemination technique to 92 per cent female offspring of cows? ', 'Glaxosmith Kline', 'Amul', 'Dabur', 'Patanjali', 'D'),
(30, 'Who was recently selected by the UN Security Council as the next UN Secretary-General?', 'Antonio Guterres', 'Ban Ki-moon', 'Theresa May', 'Angela Merkel', 'A'),
(31, 'Name the instant messaging mobile application launched by Google.', 'Hello', 'Ello', 'Aloo', 'Allo', 'D'),
(32, 'Which country has topped the Global Competitiveness Index, GCI 2016-17 released in September 2016. ', 'Switzerland', 'Singapore', 'United States of America', 'Sweden', 'A'),
(33, 'In which state of India, Adani Green Energy (Tamil Nadu) Ltd. has installed world’s largest solar power plant of 648 megawatts?', 'Andhra Pradesh', 'Tamil Nadu', 'Kerala', 'Karnataka', 'B'),
(34, 'Who is appointed as the Chairman of Life Insurance Corporation (LIC) of India?', 'Usha Pal', 'Usha Sangwan', 'VK Sharma', 'Nitin Srivastav', 'C'),
(35, 'Which stock exchange became the first Indian stock exchange to file Initial Public Offering with SEBI?', 'Bombay Stock Exchange', 'National Stock Exchange of India', 'Calcutta Stock Exchange', 'Madras Stock Exchange', 'A'),
(36, 'Nomad Film Festival 2016 started in which of the following cities? ', 'Mumbai', 'Jaipur', 'Jabalpur', 'New Delhi', 'D'),
(37, 'Which village became the first Wi-fi hotspot village in Haryana?', 'Bahu-Jholri', 'Rewari Khera', 'Gumthala Garhu', 'Thamber', 'C'),
(38, 'Who of the following topped the Forbes list of world’s highest paid actors of 2016?', 'Tom Cruise', 'Matt Damon', 'Dwayne Johnson', 'Jackie Chan', 'C'),
(39, 'Which of the following Indian Actress has been ranked 10th in the world in the list of “Forbes magazine”?', 'Sonam Kapoor', 'Katrina Kaif', 'Priyanka Chopra', 'Deepika Padukone', 'D'),
(40, 'Which company has acquired gaming (interactive livestreaming) startup Beam?', 'Apple', 'Microsoft', 'Google', 'IBM', 'C'),
(41, 'Who is recently appointed as the Managing Director of the State Bank of India? ', 'Shri Rajnish Kumar', 'Shri Sanjiv Malhotra', 'Arundhati Bhattacharya', 'Dinesh Kumar Khara', 'D'),
(42, 'What is the new name of Business Broadcast News channel ‘Bloomberg TV India’, owned by Anil Ambani?', 'BBN', 'BTV', 'BTVi', 'BloomTV', 'C'),
(43, 'What is the theme of the 2016 World Population Day', 'Vulnerable Populations in Emergencies', 'Investing in teenage girls', 'Investing in girls', 'None of These', 'B'),
(44, 'What is the name of the Massive Open Online Courses (MOOC) platform was launched by HRD ministry on August 15?', 'Swayam-Shiksha', 'Khud-Se', 'Swayam', 'None of the above', 'C'),
(45, 'Who has been elected as the Chairman of the International Chamber of Commerce (ICC)? ', 'Mukesh Ambani', 'Azim Premji', 'Sunil Bharti Mittal', 'Terry McGraw', 'C'),
(46, 'Who has been appointed as the new CEO, MD of Airtel Payments Bank by Bharti Airtel?', 'Shashi Arora', 'Manish Khera', 'AM Naik', 'Ashish Nanda', 'A'),
(47, 'Which harmful chemical is found in the bread and is claimed to cause cancer in the consumers?', 'Sodium Ascorbate', 'Monosodium Glutamate', 'Potassium Bromate', 'Maltodextrins', 'B'),
(48, 'What is the name of the new bill payment system which has been launched by RBI?', 'Bharat Bill Payment System (BBPS)', 'Bharat Bills Processing System (BBPS)', 'Bharat Bill Payment Slots (BBPS)', 'Bharat Billing Payment System (BBPS)', 'A'),
(49, 'Which online jewellery portal has been acquired by Titan in an all-cash deal?', 'Gitanjalishop', 'Caratlane', 'Bluestone', 'Thangamayil', 'B');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`qid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
