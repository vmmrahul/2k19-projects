-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2020 at 08:20 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `funtime`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminstrator`
--

CREATE TABLE `adminstrator` (
  `email` varchar(60) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `otp` int(10) NOT NULL,
  `mobile` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminstrator`
--

INSERT INTO `adminstrator` (`email`, `password`, `type`, `otp`, `mobile`) VALUES
('kiranjotk002@gmail.com', 'kiran', 'Super Admin', 0, '9076500998'),
('preet@gmail.com', 'preet', 'Admin', 0, '7567576990'),
('sharmaekta717@gmail.com', 'ektasharma', 'Super Admin', 0, '7837023838');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(10) NOT NULL,
  `showtimeid` int(10) NOT NULL,
  `seats` text NOT NULL,
  `grandtotal` float(10,2) NOT NULL,
  `noofseats` int(10) NOT NULL,
  `useremail` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `showtimeid`, `seats`, `grandtotal`, `noofseats`, `useremail`, `datetime`) VALUES
(3, 41, 'A9,A10', 220.00, 2, 'sharmaekta717@gmail.com', '2019-04-16 13:53:55'),
(5, 41, 'B8,B7', 220.00, 2, 'kiranjotk002@gmail.com', '2019-04-16 13:53:55'),
(6, 47, 'E9,E10', 360.00, 2, 'sharmaekta717@gmail.com', '2019-04-16 13:53:55'),
(7, 47, 'E9,E10', 360.00, 2, 'sharmaekta717@gmail.com', '2019-04-16 13:53:55'),
(8, 58, 'G7', 180.00, 1, 'kiranjotk002@gmail.com', '2019-04-16 13:53:55'),
(9, 101, 'A11,A12', 400.00, 2, 'sharmaekta717@gmail.com', '2019-04-16 13:53:55'),
(10, 101, 'A10', 200.00, 1, 'sharmaekta717@gmail.com', '2019-04-16 13:53:55'),
(11, 98, 'C6,C7', 300.00, 2, 'kiranjotk002@gmail.com', '2019-04-16 13:53:55'),
(12, 98, 'A9,A10', 300.00, 2, 'sharmaekta717@gmail.com', '2019-04-16 13:53:55'),
(13, 98, 'A11,A12,A8', 450.00, 3, 'sharmaekta717@gmail.com', '2019-04-16 13:53:55'),
(14, 98, 'A11,A12,A8', 450.00, 3, 'sharmaekta717@gmail.com', '2019-04-16 13:53:55'),
(15, 98, 'A11,A12,A8', 450.00, 3, 'sharmaekta717@gmail.com', '2019-04-16 13:53:55'),
(16, 144, 'A9', 150.00, 1, 'sharmaekta717@gmail.com', '2019-04-17 19:53:49'),
(17, 110, 'A1,A2', 300.00, 2, 'sumansareen2018@gmail.com', '2019-04-17 20:51:23'),
(18, 110, 'A11,A12', 300.00, 2, 'mehakmehra2913@gmail.com', '2019-04-17 20:54:09'),
(19, 113, 'A2,A1', 300.00, 2, 'malikaarora574@gmail.com', '2019-04-17 20:57:25'),
(20, 114, 'A9,A10', 300.00, 2, 'mehakmehra2913@gmail.com', '2019-04-18 11:17:01'),
(21, 111, 'A10,A11', 300.00, 2, 'mehakmehra2913@gmail.com', '2019-04-18 15:21:04'),
(22, 111, 'B5,B6', 300.00, 2, 'kiranjotk002@gmail.com', '2019-04-18 15:24:18'),
(23, 159, 'A9,A10', 360.00, 2, 'sharmaekta717@gmail.com', '2019-05-11 17:21:29'),
(24, 159, 'A6,A5', 360.00, 2, 'mehakmehra2913@gmail.com', '2019-05-11 17:41:43');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catname` varchar(60) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catname`, `description`) VALUES
('Action Movies', 'Action films are a film genre where action  such as fighting, stunts, car chases or explosions, take precedence .'),
('Comedy Movies', 'Films are make laugh films designed to elicit laughter from the audience'),
('Crime Movies', 'A crime story is about a crime that is being committed or was committed.'),
('Drama', 'Drama Films are serious presentations or stories with settings or life situations that portray realistic characters in conflict with either themselves, others, or forces of nature'),
('Horror Movies', 'A horror film is a film that seeks to elicit fear.'),
('Romantic Movies', 'Romantic films often explore the essential themes of love at first sight, young (and older) love.');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genrename` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genrename`, `description`, `photo`) VALUES
('Action Movie', 'Action movie are a movie genre where action sequence such as fighting,stunt take precendence over elements like character or complex plotting', 'dhoom.jpg'),
('Comedy Movie', 'Comedy is a genre of film in which the main emphasis is on humour. These films are designed to make the audience laugh through amusement and most often work by exaggerating characteristics for humorous effect.', 'welcome.jpg'),
('Drama', 'Drama Films are serious presentations or stories with settings or life situations that portray realistic characters in conflict with either themselves, others, or forces of nature.', 'kesari.jpg'),
('Horror Movie', 'Horror movies are designed to frightened and panic cause dread and alarm , and to invoke our hidden worst fear.', 'horror.jpg'),
('Punjabi Movies', 'Punjabi cinema sometimes metonymously referred to as Pollywood, is the Punjabi language film .', 'gudyia.jpg'),
('Romantic Movie', 'Romantic movies are love stories or a affairs of heart that center on passion, emotion and the romantic affectionate involvement of main characters.', 'veerzara.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(10) NOT NULL,
  `moviename` varchar(100) NOT NULL,
  `releasedate` varchar(100) NOT NULL,
  `director` varchar(100) NOT NULL,
  `poster` varchar(100) NOT NULL,
  `genrename` varchar(100) NOT NULL,
  `synopsis` text NOT NULL,
  `trailer` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `moviename`, `releasedate`, `director`, `poster`, `genrename`, `synopsis`, `trailer`) VALUES
(6, 'Marudhar Express', '2019-04-12', 'Vishal Mishra', 'express.jpg', 'Romantic Movie', 'Marudhar Express is an upcoming Hindi movie scheduled to be released on 12 Apr, 2019. The movie is directed by Vishal Mishra and will feature Kunaal Roy Kapur, Tara Alisha Berry and Rajesh Sharma as lead characters.        ', 'https://www.youtube.com/embed/HEXUOwwk15Q'),
(8, 'Bharat', '2019-06-05', 'Ali Abbas Zafar', 'bharat.jpg', 'Drama', 'Bharat is an upcoming Indian Hindi-language drama film directed by Ali Abbas Zafar and jointly produced by Atul Agnihotri, Alvira Khan Agnihotri, Bhushan Kumar, Krishan Kumar, Nikhil Namit and Salman Khan. The film stars Salman Khan, Katrina Kaif , Tabu, Disha Patani and Shashank Arora.', 'https://www.youtube.com/embed/Fxq18WuuRms'),
(16, 'Kalank', '2019-04-17', 'Abhishek Verman', 'hd kalank.jpg', 'Romantic Movie', 'Kalank, a period film, set in pre-independent India is a story about an elite family and many of its hidden truths that begin to unfold as communal tensions rise and partition nears. Caught in this situation are Dev, Satya, Roop, and Zafar who find themselves in this battlefield of love.', 'https://www.youtube.com/embed/UmhXhTmP0a0'),
(19, 'Housefull 4', '2019-10-26', ' Farhad Samji', 'hd housefull 4.jpg', 'Comedy Movie', 'Housefull 4 is an upcoming Indian action comedy film directed by Farhad Samji, and produced by Sajid Nadiadwala under the banner of Nadiadwala Grandson Entertainment. The film is the fourth installment of Housefull. The third to be directed by Khan who also directed the first two installments.', 'https://www.youtube.com/embed/70MytgGCJ2U'),
(20, 'Kesari', '2019-03-21', 'Anurag Singh', 'kesari.jpg', 'Drama', 'KESARI is based on the true story of one of the bravest battles that India ever fought â€“ the Battle of Saragarhi. The year is 1897 and the British Empire having conquered most of India, is now trying to infiltrate Afghanistan. Fort Saragarhi, in the NWFP (North Western Frontier Province) is a small communication post used to relay messages between two major military forts - Gullistan and Lockhardt', 'https://www.youtube.com/embed/JFP24D15_XM'),
(21, 'Rabb Da Radio 2', '2019-03-29', 'Sharan Art', 'rdr2.jpg', 'Punjabi Movies', 'A newly married man returns home and is saddened to learn his extended family has split apart.', 'https://www.youtube.com/embed/_GRj61OrGHs'),
(22, 'Notebook', '2019-03-26', 'Nitin Kakkar', 'notebook.jpg', 'Romantic Movie', 'Hoping for a change, a former army officer takes a job as a teacher at a remote school in Kashmir. When he discovers a notebook from the previous instructor, he soon finds himself falling in love with a woman he has never met.', 'https://www.youtube.com/embed/SXYxOCLc9-c'),
(23, 'Student Of The Year 2', '2019-05-10', 'Punit Malhotra', 'soy2.jpg', 'Drama', 'Student of the Year 2 is an upcoming Indian romantic comedy drama film directed by Punit Malhotra. Produced by Karan Johar, Hiroo Yash Johar and Apoorva Mehta under the banner of Dharma Productions, the film will be distributed by Fox Star Studios.', 'https://www.youtube.com/embed/CTwlptUqwRU'),
(24, 'Manje Bistre 2', '2019-04-12', 'Baljit Singh Deo', 'manjebistre.jpg', 'Comedy Movie', 'Manje Bistre 2 is a Punjabi movie starring Gippy Grewal in prominent roles. It is a drama directed by Baljit Singh Deo with Gippy Grewal as writer, forming part of the crew.', 'https://www.youtube.com/embed/BcLtt3oiMe8'),
(25, 'Romeo Akhbar Walter', '2019-04-05', 'Robbie Grewal', 'romeoakhbarwa.jpg', 'Drama', 'Romeo Akbar Walter (RAW) is a spy thriller that is set against the backdrop of the Indo-Pakistani War of 1971. The film, which is inspired by true events, is directed by Robby Grewal.', 'https://www.youtube.com/embed/HSHjC8VdzCM'),
(27, 'Avengers:Endgame', '2019-04-26', 'Anthony Russo', 'advengers.jpg', 'Action Movie', 'Adrift in space with no food or water, Tony Stark sends a message to Pepper Potts as his oxygen supply starts to dwindle. Meanwhile, the remaining Avengers -- Thor, Black Widow, Captain America and Bruce Banner -- must figure out a way to bring back their vanquished allies for an epic showdown with Thanos -- the evil demigod who decimated the planet and the universe.', 'https://www.youtube.com/embed/TcMBFSGVi1c'),
(28, 'Batla', '2019-08-15', 'Nikkhil Advani', 'batla.jpg', 'Action Movie', ' Batla House is an upcoming Indian crime thriller film based on the Batla House encounter case that took place on 19 September 2008. The film is directed by Nikkhil Advani and starring John Abraham and Mrunal Thakur in the lead role. The film is set to release on 15 August 2019.', 'https://www.youtube.com/embed/9HJgtyELIGg'),
(29, 'Men In Black:International', '2019-06-14', 'F.Gary Gray', 'mib.png', 'Action Movie', 'Men in Black: International (stylized as MIB: International) is an upcoming American science fiction action comedy film directed by F. Gary Gray and written by Art Marcum and Matt Holloway. ', 'https://www.youtube.com/embed/40ghX7dNuKI'),
(30, 'Alaadin', '2019-05-24', 'Guy Ritchie', 'alaadin.png', 'Comedy Movie', 'Aladdin is an upcoming American musical fantasy film directed by Guy Ritchie, from the screenplay co-written with John August, and produced by Walt Disney Pictures.', 'https://www.youtube.com/embed/foyufD52aog'),
(31, 'It:Chapter two', '2019-09-05', 'Andy Muschietti', 'it.jpg', 'Horror Movie', 'It: Chapter Two is an upcoming American supernatural horror film and the sequel to the 2017 film It. Both parts were adapted from the 1986 novel It by Stephen King. The film is produced by New Line Cinema, Vertigo Entertainment, and Rideback, and distributed by Warner Bros', 'https://www.youtube.com/embed/OvfCQ2g4s0s'),
(32, 'Muklawa', '2019-05-24', 'Simerjit Singh', 'muklawa.jpg', 'Punjabi Movies', 'Muklawa is an upcoming Punjabi movie scheduled to be released on 24 May, 2019. The movie is directed by Simerjit Singh and will feature Ammy Virk, Sonam Bajwa, Gurpreet Ghuggi and Karamjit Anmol as lead characters.', 'https://www.youtube.com/embed/fbGnyTQdfXk'),
(33, 'Nadhoo Khan', '2019-04-26', 'Imran Sheik', 'nadhookhann.jpg', 'Punjabi Movies', 'Set in pre-independent India, Nadhoo Khan follows the story of Chanan, who aspires to become a wrestler despite his physical limitations. His grandfather agrees to coach him under one condition: that he stay away from women and focus solely on his training. Things take an interesting turn when Chanan falls for a girl, and is subsequently pitted against her brother in a wrestling competition.', 'https://www.youtube.com/embed/Vx8svo-577c'),
(34, 'Setters', '2019-05-03', 'Ashwini Chaudhary', 'setters.jpg', 'Drama', 'Setters is a Hindi movie starring Aftab Shivdasani, Shreyas Talpade and Sonnalli Seygall, in prominent roles. It is a drama directed by Ashwini Chaudhary, forming part of the crew. ', 'https://www.youtube.com/embed/q8rIKgOtrOs'),
(35, 'De De Pyaar De', '2019-05-17', 'Akiv Ali', 'De_De_Pyaar_De_Poster.jpg', 'Romantic Movie', 'A 50-year-old single father faces disapproval from his family and his ex-wife when he falls in love with a 26-year-old woman.', 'https://www.youtube.com/embed/EJUD2PptXrk'),
(36, 'Wine Country ', '2019-05-10', 'Amy Poehler', 'wine country.jpg', 'Comedy Movie', 'hbfghdgfdsygf', 'https://www.youtube.com/embed/PmBeRgJZ0v8'),
(37, 'Atte di Chiri', '2020-04-15', 'dkjhj', 'cmp-icon - Copy.png', 'Punjabi Movies', 'rjjrh', 'dkjghj');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(10) NOT NULL,
  `rating` int(10) NOT NULL,
  `movieid` int(10) NOT NULL,
  `user_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `rating`, `movieid`, `user_email`) VALUES
(2, 2, 22, 'kiranjotk002@gmail.com'),
(3, 3, 6, 'kiranjotk002@gmail.com'),
(4, 2, 28, 'kiranjotk002@gmail.com'),
(6, 4, 24, 'kiranjotk002@gmail.com'),
(7, 3, 19, 'kiranjotk002@gmail.com'),
(8, 1, 31, 'kiranjotk002@gmail.com'),
(11, 5, 20, 'kiranjotk002@gmail.com'),
(12, 2, 8, 'kiranjotk002@gmail.com'),
(13, 4, 16, 'kiranjotk002@gmail.com'),
(14, 3, 23, 'kiranjotk002@gmail.com'),
(15, 3, 32, 'kiranjotk002@gmail.com'),
(16, 5, 21, 'kiranjotk002@gmail.com'),
(17, 3, 25, 'kiranjotk002@gmail.com'),
(18, 3, 22, 'sharmaekta717@gmail.com'),
(19, 4, 20, 'sumansareen2018@gmail.com'),
(20, 5, 20, 'mehakmehra2913@gmail.com'),
(21, 4, 22, 'malikaarora574@gmail.com'),
(22, 5, 21, 'malikaarora574@gmail.com'),
(23, 5, 25, 'mehakmehra2913@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `message` text NOT NULL,
  `movieid` int(10) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `fullname`, `email`, `mobile`, `message`, `movieid`, `photo`, `datetime`) VALUES
(8, 'Monika', 'monika@gmail.com', 8844221155, 'Kesari+is+high+on+nationalism%2C+sense+of+freedom%2C+and+courage.+It+touches+the+hearts+of+every+Indian+and+reminds+you+of+a+history+that+was+forgotten.', 20, '', '2019-04-13 02:12:21'),
(9, 'kiran', 'kiran@gmail.com', 7508397712, 'The+Akshay+Kumar+starrer+KESARI+is+a+brave+and+inspirational+tale+of+courage+and+patriotism+with+the+dramatic+battle+sequence+as+its+USP', 20, '', '2019-04-13 02:12:43'),
(10, 'Sanajna', 'sanjana2@gmail.com', 9815201515, 'An+emotional+war+drama+with+solid+action+sequences.', 20, '', '2019-04-13 02:13:50'),
(11, 'Ekta', 'sharmaekta717@gmail.com', 7837023838, '%0D%0AIntense%2Cgripping%2Cintriguing%2Cexcellent+performances+by+john+and+jackie+shroff%2Cenjoyed+watching+it.', 25, '', '2019-04-13 02:16:08'),
(12, 'sumansareen', 'sumansareen2018@gmail.com', 8194916510, 'awwwwsmm+movie', 20, '', '2019-04-17 20:49:37'),
(13, 'sumansareen', 'sumansareen2018@gmail.com', 8194916510, 'really+enjoyed%2C+soo+gud', 20, '', '2019-04-17 20:50:02'),
(14, 'mehakmehra', 'mehakmehra2913@gmail.com', 8146893237, 'historical+dramtic+nd+true+stry.%0D%0A', 20, '', '2019-04-17 20:52:38'),
(15, 'mehakmehra', 'mehakmehra2913@gmail.com', 8146893237, 'learn+very+new+things+about+sikhism+from+thus+movie', 20, '', '2019-04-17 20:53:18'),
(16, 'malikaarora', 'malikaarora574@gmail.com', 7986443352, 'such+a+good+stry', 22, '', '2019-04-17 20:55:28'),
(17, 'malikaarora', 'malikaarora574@gmail.com', 7986443352, 'loved+it....', 22, '', '2019-04-17 20:55:54'),
(18, 'malikaarora', 'malikaarora574@gmail.com', 7986443352, 'very+true+stry+just+loved+it.%0D%0A', 21, '', '2019-04-17 20:56:49'),
(19, 'mehakmehra', 'mehakmehra2913@gmail.com', 8146893237, 'i+love+this+movi3e', 25, '', '2019-04-18 11:20:38');

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `id` int(10) NOT NULL,
  `showdate` date NOT NULL,
  `movieid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`id`, `showdate`, `movieid`) VALUES
(71, '2019-04-07', 21),
(75, '2019-04-09', 21),
(76, '2019-04-10', 21),
(77, '2019-04-11', 21),
(79, '2019-04-13', 21),
(80, '2019-04-13', 22),
(81, '2019-04-13', 24),
(82, '2019-04-13', 25),
(83, '2019-04-14', 25),
(84, '2019-04-13', 6),
(85, '2019-04-14', 6),
(87, '2019-04-13', 20),
(88, '2019-04-15', 20),
(89, '2019-04-16', 20),
(90, '2019-04-17', 20),
(91, '2019-04-15', 21),
(92, '2019-04-16', 21),
(93, '2019-04-17', 21),
(94, '2019-04-15', 22),
(95, '2019-04-16', 22),
(96, '2019-04-17', 22),
(97, '2019-04-15', 24),
(98, '2019-04-16', 24),
(99, '2019-04-17', 24),
(100, '2019-04-15', 6),
(101, '2019-04-16', 6),
(102, '2019-04-17', 6),
(103, '2019-04-18', 6),
(104, '2019-04-19', 6),
(105, '2019-04-20', 6),
(106, '2019-04-18', 20),
(107, '2019-04-19', 20),
(108, '2019-04-20', 20),
(109, '2019-04-18', 21),
(110, '2019-04-19', 21),
(111, '2019-04-20', 21),
(112, '2019-04-18', 22),
(113, '2019-04-19', 22),
(114, '2019-04-20', 22),
(115, '2019-04-18', 24),
(116, '2019-04-19', 24),
(117, '2019-04-20', 24),
(118, '2019-04-18', 25),
(119, '2019-04-19', 25),
(120, '2019-04-20', 25),
(121, '2019-05-12', 32),
(122, '2019-05-12', 6),
(123, '2020-04-17', 37);

-- --------------------------------------------------------

--
-- Table structure for table `showtimings`
--

CREATE TABLE `showtimings` (
  `id` int(10) NOT NULL,
  `audi` varchar(10) NOT NULL,
  `price` int(10) NOT NULL,
  `showtime` time NOT NULL,
  `showid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `showtimings`
--

INSERT INTO `showtimings` (`id`, `audi`, `price`, `showtime`, `showid`) VALUES
(41, 'Audi 2', 110, '14:15:00', 71),
(47, 'Audi 3', 180, '09:15:00', 76),
(55, 'Audi 1', 110, '09:30:00', 79),
(56, 'Audi 2', 110, '17:00:00', 79),
(57, 'Audi 3', 110, '22:00:00', 79),
(58, 'Audi 1', 180, '09:15:00', 81),
(59, 'Audi 2', 180, '12:15:00', 81),
(60, 'Audi 2', 180, '14:30:00', 81),
(61, 'Audi 3', 180, '17:30:00', 81),
(63, 'Audi 1', 110, '12:30:00', 82),
(64, 'Audi 2', 110, '17:00:00', 82),
(65, 'Audi 3', 110, '11:15:00', 83),
(66, 'Audi 3', 110, '20:00:00', 83),
(67, 'Audi 1', 180, '10:00:00', 84),
(68, 'Audi 2', 180, '13:15:00', 84),
(69, 'Audi 3', 180, '20:30:00', 84),
(70, 'Audi 1', 180, '12:15:00', 85),
(71, 'Audi 2', 180, '15:30:00', 85),
(72, 'Audi 3', 180, '22:00:00', 85),
(74, 'Audi 2', 110, '12:30:00', 87),
(75, 'Audi 3', 110, '17:15:00', 87),
(76, 'Audi 1', 110, '22:55:00', 87),
(77, 'Audi 1', 160, '11:15:00', 100),
(78, 'Audi 2', 160, '14:00:00', 100),
(79, 'Audi 3', 160, '22:22:00', 100),
(80, 'Audi 1', 160, '10:15:00', 101),
(81, 'Audi 2', 160, '13:20:00', 101),
(82, 'Audi 3', 180, '23:18:00', 101),
(83, 'Audi 3', 160, '12:00:00', 102),
(84, 'Audi 1', 180, '17:17:00', 102),
(85, 'Audi 1', 150, '11:30:00', 88),
(86, 'Audi 2', 150, '16:30:00', 88),
(87, 'Audi 3', 150, '22:10:00', 88),
(88, 'Audi 1', 150, '10:15:00', 89),
(89, 'Audi 3', 150, '13:15:00', 89),
(90, 'Audi 2', 150, '21:00:00', 89),
(91, 'Audi 1', 150, '09:15:00', 90),
(92, 'Audi 2', 150, '14:14:00', 90),
(93, 'Audi 3', 150, '18:20:00', 90),
(94, 'Audi 1', 150, '10:10:00', 91),
(95, 'Audi 2', 150, '15:15:00', 91),
(96, 'Audi 3', 150, '21:00:00', 91),
(97, 'Audi 1', 150, '08:15:00', 92),
(98, 'Audi 2', 150, '14:15:00', 92),
(99, 'Audi 2', 150, '09:21:00', 93),
(100, 'Audi 3', 150, '15:15:00', 93),
(101, 'Audi 1', 200, '11:30:00', 97),
(102, 'Audi 2', 200, '15:00:00', 97),
(103, 'Audi 3', 210, '22:15:00', 97),
(104, 'Audi 1', 200, '11:20:00', 98),
(105, 'Audi 2', 200, '12:00:00', 98),
(106, 'Audi 3', 200, '21:15:00', 98),
(107, 'Audi 1', 200, '12:15:00', 99),
(108, 'Audi 2', 180, '19:08:00', 99),
(109, 'Audi 3', 200, '21:30:00', 99),
(110, 'Audi 1', 150, '09:20:00', 106),
(111, 'Audi 2', 150, '22:15:00', 106),
(112, 'Audi 3', 180, '13:13:00', 106),
(113, 'Audi 1', 150, '10:00:00', 109),
(114, 'Audi 2', 150, '14:15:00', 109),
(115, 'Audi 3', 200, '21:10:00', 109),
(116, 'Audi 1', 150, '11:00:00', 107),
(117, 'Audi 2', 180, '15:15:00', 107),
(118, 'Audi 3', 180, '21:30:00', 107),
(119, 'Audi 1', 140, '08:45:00', 108),
(120, 'Audi 2', 150, '14:20:00', 108),
(121, 'Audi 2', 200, '22:30:00', 108),
(122, 'Audi 1', 180, '09:30:00', 110),
(123, 'Audi 2', 150, '16:00:00', 110),
(124, 'Audi 3', 150, '21:45:00', 110),
(125, 'Audi 1', 140, '11:00:00', 111),
(126, 'Audi 2', 150, '15:45:00', 111),
(127, 'Audi 3', 150, '22:30:00', 111),
(128, 'Audi 1', 180, '11:15:00', 115),
(129, 'Audi 2', 180, '15:15:00', 115),
(130, 'Audi 3', 190, '20:45:00', 115),
(131, 'Audi 1', 170, '10:30:00', 116),
(132, 'Audi 2', 160, '13:10:00', 116),
(133, 'Audi 3', 150, '20:20:00', 116),
(134, 'Audi 1', 150, '10:45:00', 117),
(135, 'Audi 3', 150, '21:21:00', 117),
(136, 'Audi 1', 180, '10:45:00', 118),
(137, 'Audi 2', 150, '12:30:00', 118),
(138, 'Audi 3', 190, '20:45:00', 118),
(139, 'Audi 1', 170, '11:00:00', 119),
(140, 'Audi 2', 170, '15:30:00', 119),
(141, 'Audi 3', 180, '23:00:00', 119),
(142, 'Audi 1', 170, '10:00:00', 120),
(143, 'Audi 3', 180, '19:15:00', 120),
(144, 'Audi 1', 150, '11:15:00', 103),
(145, 'Audi 2', 150, '16:00:00', 103),
(146, 'Audi 3', 170, '21:15:00', 103),
(147, 'Audi 1', 150, '10:45:00', 104),
(148, 'Audi 2', 150, '13:45:00', 104),
(149, 'Audi 3', 150, '21:30:00', 104),
(150, 'Audi 3', 150, '11:20:00', 105),
(151, 'Audi 1', 150, '14:15:00', 105),
(152, 'Audi 2', 150, '21:45:00', 105),
(153, 'Audi 1', 150, '15:30:00', 112),
(154, 'Audi 3', 150, '21:45:00', 112),
(155, 'Audi 1', 150, '09:20:00', 113),
(156, 'Audi 2', 150, '18:45:00', 113),
(157, 'Audi 2', 150, '14:15:00', 114),
(158, 'Audi 1', 180, '13:34:00', 121),
(159, 'Audi 1', 180, '10:48:00', 122),
(160, 'Audi 1', 560, '01:19:00', 123);

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobile` bigint(12) NOT NULL,
  `fullname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`email`, `password`, `mobile`, `fullname`) VALUES
('kiranjotk002@gmail.com', 'kiran', 7837023838, 'Kiranjot Kaur'),
('malikaarora574@gmail.com', 'malika', 7986443352, 'malikaarora'),
('mehakmehra2913@gmail.com', 'mehak', 8146893237, 'mehakmehra'),
('sharmaekta717@gmail.com', 'ektasharma', 9915951710, 'ektasharma'),
('sumansareen2018@gmail.com', 'suman', 8194916510, 'sumansareen');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminstrator`
--
ALTER TABLE `adminstrator`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `showtimeid` (`showtimeid`,`useremail`),
  ADD KEY `useremail` (`useremail`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catname`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genrename`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genrename` (`genrename`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movieid` (`movieid`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movieid` (`movieid`);

--
-- Indexes for table `showtimings`
--
ALTER TABLE `showtimings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `showid` (`showid`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT for table `showtimings`
--
ALTER TABLE `showtimings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`showtimeid`) REFERENCES `showtimings` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`useremail`) REFERENCES `signup` (`email`);

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`genrename`) REFERENCES `genre` (`genrename`);

--
-- Constraints for table `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`movieid`) REFERENCES `movies` (`id`);

--
-- Constraints for table `showtimings`
--
ALTER TABLE `showtimings`
  ADD CONSTRAINT `showtimings_ibfk_1` FOREIGN KEY (`showid`) REFERENCES `shows` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
