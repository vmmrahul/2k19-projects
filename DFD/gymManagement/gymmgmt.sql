-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2020 at 07:12 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gymmgmt`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`, `password`, `name`, `type`) VALUES
('abc@gmail.com', '1', 'satwant', 'Admin'),
('satwant.uppal99@gmail.com', '1', 'satwant k', 'Admin'),
('xy@gmail.com', '12', 'xyz', 'Sub Admin');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `id` int(10) NOT NULL,
  `grandtotal` float(10,2) NOT NULL,
  `datetime` datetime NOT NULL,
  `useremail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`id`, `grandtotal`, `datetime`, `useremail`) VALUES
(3, 4500.00, '2020-04-02 09:10:01', 'abc@gmail.com'),
(4, 2500.00, '2020-04-04 09:32:19', 'sanah@gmail.com'),
(5, 4500.00, '2020-04-04 12:41:24', 'abhi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `billdetail`
--

CREATE TABLE `billdetail` (
  `id` int(10) NOT NULL,
  `packageid` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `expirationDate` date NOT NULL,
  `billid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billdetail`
--

INSERT INTO `billdetail` (`id`, `packageid`, `price`, `expirationDate`, `billid`) VALUES
(1, 1, 4500, '2020-06-01', 3),
(2, 2, 2500, '2020-05-04', 4),
(3, 1, 4500, '2020-06-03', 5);

-- --------------------------------------------------------

--
-- Table structure for table `diet`
--

CREATE TABLE `diet` (
  `id` int(10) NOT NULL,
  `date` date NOT NULL,
  `morning` text NOT NULL,
  `morningSnack` text NOT NULL,
  `afternoon` text NOT NULL,
  `eveningSnack` text NOT NULL,
  `night` text NOT NULL,
  `memberemail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diet`
--

INSERT INTO `diet` (`id`, `date`, `morning`, `morningSnack`, `afternoon`, `eveningSnack`, `night`, `memberemail`) VALUES
(2, '2020-04-04', '3 Scrambled Eggs\r\n1 large grapefruit', '25 almonds....', 'Turkey Wrap\r\n1 apple', '1 piece of string cheese', 'Spicy Chicken and Pasta\r\nSide salad and 2 Tbsp olive oil/vinegar dressing', 'sanah@gmail.com'),
(3, '2020-04-04', 'Wholegrain toast with polyunsaturated margarine', 'Apple	1 medium', 'Wholegrain sandwich with roast beef, reduced fat cheese and mixed salad with polyunsaturated maragarine', 'Unsalted nuts	30g', 'Fruit salad and reduced fat yoghurt	1 cup diced fresh fruit\r\n100g yoghurt', 'abhi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

CREATE TABLE `exercise` (
  `id` int(10) NOT NULL,
  `memberemail` varchar(100) NOT NULL,
  `week` varchar(15) NOT NULL,
  `monday` text NOT NULL,
  `tuesday` text NOT NULL,
  `wednesday` text NOT NULL,
  `thursday` text NOT NULL,
  `friday` text NOT NULL,
  `saturday` text NOT NULL,
  `sunday` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exercise`
--

INSERT INTO `exercise` (`id`, `memberemail`, `week`, `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`) VALUES
(3, 'sanah@gmail.com', 'Week 1', '%0D%0A++++Flat+bench+barbell+press+%E2%80%93+4+sets+of+8+reps%0D%0A++++Push+ups+%E2%80%93+4+sets+of+10+reps%0D%0A++++Cable+crossovers+%E2%80%93+3+sets+of+15+reps%0D%0A++++Incline+dumbbell+flyes+%E2%80%93+4+sets+of+12+reps%0D%0A++++Barbell+biceps+curls+%E2%80%93+3+sets+of+15+reps%0D%0A++++Alternate+arm+hammer+curls+%E2%80%93+4+sets+of+12+reps+per+arm%0D%0A++++Triceps+rope+overhead+extensions+%E2%80%93+3+sets+of+20+reps%0D%0A++++Triceps+dips+%E2%80%93+3+sets+of+15+reps%0D%0A++++10+minutes+on+the+elliptical+machine%0D%0A', '%0D%0A++++Standing+barbell+military+press+%E2%80%93+4+sets+of+10+reps%0D%0A++++Dumbbell+lateral+raises+%E2%80%93+4+sets+of+15+reps%0D%0A++++EZ+bar+upright+rows+%E2%80%93+3+sets+of+15+reps%0D%0A++++Seated+dumbbell+shoulder+press+%E2%80%93+4+sets+of+10+reps%0D%0A++++Dumbbell+shrugs+%E2%80%93+4+sets+of+10+reps%0D%0A++++Close-grip+lat+pulldowns+%E2%80%93+4+sets+of+12+reps%0D%0A++++Dumbbell+bent+over+rows+%E2%80%93+4+sets+of+12+reps+per+arm%0D%0A++++T-Bar+rows+%E2%80%93+4+sets+of+10+reps%0D%0A++++10+minutes+on+the+stationary+bike%0D%0A', '%0D%0A++++10+burpees%0D%0A++++10+push+ups%0D%0A++++15+crunches%0D%0A++++20+squat+thrusts%0D%0A++++3+sets+of+10+hanging+leg+raises%0D%0A++++3+x+1-minute+rounds+of+plank%0D%0A++++20+minutes+low+intensity+cardio+on+the+treadmill%0D%0A', '%0D%0A++++Incline+dumbbell+press+%E2%80%93+5+sets+of+5+reps%0D%0A++++Flat+bench+barbell+press+%E2%80%93+5+sets+of+5+reps%0D%0A++++Deadlifts+%E2%80%93+5+sets+of+5+reps%0D%0A++++Barbell+clean+and+press+%E2%80%93+5+sets+of+5+reps%0D%0A++++Barbell+bent-over+rows+%E2%80%93+5+sets+of+5+reps%0D%0A++++Barbell+snatch+%E2%80%93+5+sets+of+5+reps%0D%0A++++10+minutes+on+the+stationary+bike%0D%0A', '%0D%0A++++Barbell+squats+%E2%80%93+4+sets+of+8+reps%0D%0A++++Leg+press+machine+%E2%80%93+3+sets+of+12+reps%0D%0A++++Leg+extensions+%E2%80%93+3+sets+of+15+reps%0D%0A++++Hamstring+curls+%E2%80%93+3+sets+of+15+reps%0D%0A++++Walking+lunges+%E2%80%93+4+sets+of+10+reps+per+leg%0D%0A++++Seated+or+standing+calf+raises+%E2%80%93+4+sets+of+20+reps+per+leg%0D%0A++++10+minutes+on+the+elliptical+machine%0D%0A', '%0D%0A++++Barbell+squats+%E2%80%93+4+sets+of+8+reps%0D%0A++++Leg+press+machine+%E2%80%93+3+sets+of+12+reps%0D%0A++++Leg+extensions+%E2%80%93+3+sets+of+15+reps%0D%0A++++Hamstring+curls+%E2%80%93+3+sets+of+15+reps%0D%0A++++Walking+lunges+%E2%80%93+4+sets+of+10+reps+per+leg%0D%0A++++Seated+or+standing+calf+raises+%E2%80%93+4+sets+of+20+reps+per+leg%0D%0A++++10+minutes+on+the+elliptical+machine%0D%0A', 'off'),
(6, 'sanah@gmail.com', 'Week 2', 'hhf++jwhrthethteh', 'ytyt', 'tdy', 'yre', 'tt', 'te', 'te'),
(7, 'abhi@gmail.com', 'Week 1', '%3Ch6%3EGym%3C%2Fh6%3E%0D%0A++++++++++++++++++++++++++++++++++++%3Cspan%3E10.00+-+11.00%3C%2Fspan%3E%0D%0A++++++++++++++++++++++++++++++++++++%3Cdiv+class%3D%22trainer-name%22%3E%0D%0A++++++++++++++++++++++++++++++++++++++++John+Smith%0D%0A++++++++++++++++++++++++++++++++++++%3C%2Fdiv%3E', '%3Ch6%3EYoga%3C%2Fh6%3E%0D%0A++++++++++++++++++++++++++++++++++++%3Cspan%3E10.00+-+12.00%3C%2Fspan%3E%0D%0A++++++++++++++++++++++++++++++++++++%3Cdiv+class%3D%22trainer-name%22%3E%0D%0A++++++++++++++++++++++++++++++++++++++++John+Smith%0D%0A++++++++++++++++++++++++++++++++++++%3C%2Fdiv%3E', '%3Ch6%3EBody%3C%2Fh6%3E%0D%0A++++++++++++++++++++++++++++++++++++%3Cspan%3E10.00+-+12.00%3C%2Fspan%3E%0D%0A++++++++++++++++++++++++++++++++++++%3Cdiv+class%3D%22trainer-name%22%3E%0D%0A++++++++++++++++++++++++++++++++++++++++John+Smith%0D%0A++++++++++++++++++++++++++++++++++++%3C%2Fdiv%3E', '%3Ch6%3ECardio%3C%2Fh6%3E%0D%0A++++++++++++++++++++++++++++++++++++%3Cspan%3E10.00+-+11.00%3C%2Fspan%3E%0D%0A++++++++++++++++++++++++++++++++++++%3Cdiv+class%3D%22trainer-name%22%3E%0D%0A++++++++++++++++++++++++++++++++++++++++John+Smith%0D%0A++++++++++++++++++++++++++++++++++++%3C%2Fdiv%3E', '%3Ch6%3ERunning%3C%2Fh6%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cspan%3E14.00+-+16.00%3C%2Fspan%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cdiv+class%3D%22trainer-name%22%3E%0D%0A++++++++++++++++++++++++++++++++++++++++++++John+Smith%0D%0A++++++++++++++++++++++++++++++++++++++++%3C%2Fdiv%3E', '%3Ch6%3EBox%3C%2Fh6%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cspan%3E14.00+-+15.00%3C%2Fspan%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cdiv+class%3D%22trainer-name%22%3E%0D%0A++++++++++++++++++++++++++++++++++++++++++++John+Smith%0D%0A++++++++++++++++++++++++++++++++++++++++%3C%2Fdiv%3E', 'off'),
(8, 'abhi@gmail.com', 'Week 2', '%3Ch6%3EGym%3C%2Fh6%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cspan%3E14.00+-+16.00%3C%2Fspan%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cdiv+class%3D%22trainer-name%22%3E%0D%0A++++++++++++++++++++++++++++++++++++++++++++John+Smith%0D%0A++++++++++++++++++++++++++++++++++++++++%3C%2Fdiv%3E', '%3Ch6%3ECardio%3C%2Fh6%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cspan%3E16.00+-+18.00%3C%2Fspan%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cdiv+class%3D%22trainer-name%22%3E%0D%0A++++++++++++++++++++++++++++++++++++++++++++John+Smith%0D%0A++++++++++++++++++++++++++++++++++++++++%3C%2Fdiv%3E', '%3Ch6%3EGym%3C%2Fh6%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cspan%3E16.00+-+19.00%3C%2Fspan%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cdiv+class%3D%22trainer-name%22%3E%0D%0A++++++++++++++++++++++++++++++++++++++++++++John+Smith%0D%0A++++++++++++++++++++++++++++++++++++++++%3C%2Fdiv%3E', '%3Ch6%3EYoga%3C%2Fh6%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cspan%3E16.00+-+18.00%3C%2Fspan%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cdiv+class%3D%22trainer-name%22%3E%0D%0A++++++++++++++++++++++++++++++++++++++++++++John+Smith%0D%0A++++++++++++++++++++++++++++++++++++++++%3C%2Fdiv%3E', '%3Ch6%3EGym%3C%2Fh6%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cspan%3E16.00+-+20.00%3C%2Fspan%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cdiv+class%3D%22trainer-name%22%3E%0D%0A++++++++++++++++++++++++++++++++++++++++++++John+Smith%0D%0A++++++++++++++++++++++++++++++++++++++++%3C%2Fdiv%3E', '%3Ch6%3EBox%3C%2Fh6%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cspan%3E18.00+-+22.00%3C%2Fspan%3E%0D%0A++++++++++++++++++++++++++++++++++++++++%3Cdiv+class%3D%22trainer-name%22%3E%0D%0A++++++++++++++++++++++++++++++++++++++++++++John+Smith%0D%0A++++++++++++++++++++++++++++++++++++++++%3C%2Fdiv%3E', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) NOT NULL,
  `packagename` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `duration` int(10) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `packagename`, `price`, `duration`, `description`) VALUES
(1, 'Gold', 4500, 60, '60+Day+Package'),
(2, 'Silver', 2500, 30, '1+Month+Regress+Training');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(10) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `caption`, `photo`, `description`) VALUES
(2, '4+Ways+to+Level+Up+Your+Boring+Gym+Routine', '1.jpg', '4+Ways+to+Level+Up+Your+Boring+Gym+Routine'),
(3, 'relief+for+gyms+and+fitness+centres', '2.png', 'relief+for+gyms+and+fitness+centres'),
(4, 'Gym+etiquette+for+newbies', 'fit-1.jpg', 'Gym+etiquette+for+newbies'),
(5, 'Fitnestic', 'gym.jpg', 'Fitnestic..+Body+Building%2C+the+original+LES+MILLS+barbell+class%2C+will%0D%0A++++++++++++++++++++++++++++++++++++++++++++++++++++++++sculpt%2C+tone+and+strengthen+your+entire+body%2C+fast%21+Focusing%0D%0A++++++++++++++++++++++++++++++++++++++++++++++++++++++++on+low+weight+loads+and+high+repetition+movements%2C+you%27ll%0D%0A++++++++++++++++++++++++++++++++++++++++++++++++++++++++burn+fat%2C+gain+strength+and+quickly+produce+lean+body+muscle%0D%0A++++++++++++++++++++++++++++++++++++++++++++++++++++++++conditioning.+All+the+benefits+of+working+with+weighs+in+one%0D%0A++++++++++++++++++++++++++++++++++++++++++++++++++++++++action+packed%2C+highly+physical+class.+The+world%E2%80%99s+fastest%0D%0A++++++++++++++++++++++++++++++++++++++++++++++++++++++++way+to+get+in+shape.+Find+your+Lessmills+Bodypump+class%0D%0A++++++++++++++++++++++++++++++++++++++++++++++++++++++++here.'),
(6, 'Body+building', 'author-1.jpg', 'Body+building'),
(7, 'Racing+runing', 'author-2.jpg', 'Racing+runing'),
(8, 'Yoga+Fitness', 'author-3.jpg', 'Yoga+Fitness'),
(9, 'Kick+boxing', 'author-4.jpg', 'Kick+boxing'),
(10, 'Cardio+workout', 'author-5.jpg', 'Cardio+workout'),
(11, 'Martial+Arts', 'author-6.jpg', 'Martial+Arts');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobile` bigint(12) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `weight` int(10) NOT NULL,
  `height` varchar(50) NOT NULL,
  `age` int(10) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `goalWeight` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `password`, `mobile`, `fullname`, `weight`, `height`, `age`, `gender`, `goalWeight`) VALUES
('abc@gmail.com', '789', 9915951710, 'ABC', 0, '', 0, '', 0),
('abhi@gmail.com', '123', 9915951710, 'Abhi Sehgal', 75, '5%275%27%27', 28, 'Male', 72),
('kjfdhgk@uygf.lk', '123', 7877987789, 'khdkjd', 0, '', 0, '', 0),
('sanah@gmail.com', '123', 9915951710, 'Sanah Arora', 55, '5%27+1%27%27', 25, 'Female', 50);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(10) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `video` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `caption`, `video`, `description`) VALUES
(3, 'The+Rock%27s+Ultimate+Workout', 'https%3A%2F%2Fwww.youtube.com%2Fembed%2F24fdcMw0Bj0', 'na'),
(4, 'Tiger+Shroff%27s+Gym+Workout+Video', 'https%3A%2F%2Fwww.youtube.com%2Fembed%2FwFb8EhhoSRc', 'Tiger+Shroff%27s+Gym+Workout+Video'),
(5, 'The+Best+Chests+In+Bodybuilding+-+Chest+Day+Workout', 'https%3A%2F%2Fwww.youtube.com%2Fembed%2Far9sBJXs19Q', '%23bodybuilding+%23chestday+%23workoutmotivation'),
(6, 'Ladies+Fitness+Gym+Training', 'https%3A%2F%2Fwww.youtube.com%2Fembed%2FuliYnGn51qQ', 'Ladies+Fitness+Gym+Training'),
(7, 'BEAST+in+the+Beauty+-+Cassandra+Martin+%7C+Muscle+Madness', 'https%3A%2F%2Fwww.youtube.com%2Fembed%2Fd8Cmw1UyViQ', '%23Fighters+%23Bodybuilding+%23Fitness'),
(8, 'Workout+Plan+to+GAIN+WEIGHT+for+Women', 'https%3A%2F%2Fwww.youtube.com%2Fembed%2FFDpM-CGMXcw', 'Workout+Plan+to+GAIN+WEIGHT+for+Women'),
(9, 'Easy+Beginners+Workout+for+Women+%E2%80%93+', 'https%3A%2F%2Fwww.youtube.com%2Fembed%2FJRG0xfsktJA', 'At+Home+Full+Body+20+Minute+Floor+Exercises'),
(10, '6+EXERCISES+FOR+BETTER+GLUTES', 'https%3A%2F%2Fwww.youtube.com%2Fembed%2FSlTtw_ysPDM', '6+EXERCISES+FOR+BETTER+GLUTES'),
(11, 'Total+Upper-Body+Workout+%7C+Kathleen+Tesori', 'https%3A%2F%2Fwww.youtube.com%2Fembed%2F3RcDkEOJV8c', 'Total+Upper-Body+Workout+%7C+Kathleen+Tesori');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `useremail` (`useremail`);

--
-- Indexes for table `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packageid` (`packageid`),
  ADD KEY `billid` (`billid`);

--
-- Indexes for table `diet`
--
ALTER TABLE `diet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memberemail` (`memberemail`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `billdetail`
--
ALTER TABLE `billdetail`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `diet`
--
ALTER TABLE `diet`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `exercise`
--
ALTER TABLE `exercise`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `exercise`
--
ALTER TABLE `exercise`
  ADD CONSTRAINT `exercise_ibfk_1` FOREIGN KEY (`memberemail`) REFERENCES `user` (`email`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
