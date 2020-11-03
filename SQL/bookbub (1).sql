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
-- Database: `bookbub`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `fullname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`, `password`, `mobile`, `fullname`) VALUES
('aman34@gmail.com', '123', 7658763454, 'amanpreet'),
('gagan56@gmail.com', '1234', 9877657885, 'gagan'),
('jeevan123@gmail.com', '567', 5467865444, 'jeevanpreet'),
('joban12@gmail.com', '5656', 9876565437, 'jobanpreet'),
('sukh122@gmail.com', '234', 9875645367, 'sukhpreet');

-- --------------------------------------------------------

--
-- Table structure for table `author_signup`
--

CREATE TABLE `author_signup` (
  `authorid` int(10) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `address` varchar(300) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `profile_photo` varchar(200) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `publish_work` varchar(1000) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author_signup`
--

INSERT INTO `author_signup` (`authorid`, `fullname`, `address`, `mobile`, `email`, `profile_photo`, `description`, `publish_work`, `password`) VALUES
(2, 'Anne Rice', 'America', '9876567876', 'anne23@gmail.com', 'anne.jpg', 'Anne Rice[2] (born Howard Allen Frances O\'Brien; October 4, 1941) is an American author of gothic fiction, Christian literature, and erotica. She is perhaps best known for her series of novels, The Vampire Chronicles, revolving around the central character of Lestat. Books from The Vampire Chronicles were the subject of two film adaptations, Interview with the Vampire in 1994, and Queen of the Damned in 2002.', 'A.N. Roquelaure is the pseudonym for bestselling author Anne Rice, the author of 25 books. She lives in New Orleans.', '234'),
(7, 'JohnGrisham', 'USA', '9876567876', 'john12@gmail.com', 'john.jpg', 'JOHNGRISHAM is the author of twenty-seven novels, one work of nonfiction, a collection of stories, and four novels for young readers.', 'abc', '1234'),
(8, 'NeilGaiman', 'new york', '9582154456', 'Neil12@gmail.com', 'neil gaiman.jpg', 'Neil Richard MacKinnon Gaiman was born in Portchester, England on November 10, 1960. Gaiman worked as a journalist and freelance writer for a time, before deciding to try his hand at comic books.Gaiman writes both children and adult books.', ' Neil Richard Gaiman,[4] 10 November 1960)[6] is an English author of short fiction, novels, comic books, graphic novels, audio theatre, and films.', '8080'),
(9, 'DebbieMacomber', 'newyork', '8989898989', 'debbie23@gmail.com', 'Debbie.jpg', 'Debbie Macomber is a #1 New York Times bestselling author and one of todayâ€™s most popular writers with more than 200 million copies of her books in print worldwide. In her novels, Macomber brings to life compelling relationships that embrace family and enduring friendships, uplifting her readers with stories of connection and hope.', 'Debbie Macomber is an American author of romance novels and contemporary women\'s fiction ... After five years and many rejections from publishers, she turned to freelance magazine work. ... Starlight was the first of her novels to be published.', '8989'),
(10, 'BillBryson', 'England', '9875864123', 'bill65@gmail.com', 'bill.jpg', 'Bill Bryson\'s bestselling books include One Summer, A Short History of Nearly Everything, At Home, A Walk in the Woods, Neither Here nor There, Made in America, and The Mother Tongue.', 'Bill Bryson OBE HonFRS is an Anglo-American author of books on travel, the English language, science, and other non-fiction topics. Born in the United States, he has been a resident of Britain for most of his adult life.', '4545');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `Bookid` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `edition` int(5) NOT NULL,
  `price` int(10) NOT NULL,
  `e_edition` varchar(200) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `coverphoto` varchar(200) NOT NULL,
  `discount` int(10) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `authorid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`Bookid`, `title`, `description`, `edition`, `price`, `e_edition`, `genre`, `coverphoto`, `discount`, `category_name`, `authorid`) VALUES
(4, 'film encyclopedia', 'A film crew is a group of people hired by a film company, employed during the \"production\" or \"photography\" phase, for the purpose of producing a film or motion picture. Crew is distinguished from cast, who are the actors who appear in front of the camera or provide voices for characters in the film.', 2013, 2000, 'Role based security.pdf', 'film', 'film.jpg', 20, 'Art and Music', 2),
(5, 'Dungeon lord', 'Fantasy Novel is any book that contains unrealistic settings, or magic, often set in a medieval universe, or possibly involving mythical beings or supernatural forms as a primary element of the plot, theme, or setting.', 2015, 2000, 'Role based security.pdf', 'Fantasy', 'fantasy.jpg', 10, 'Comics', 2),
(6, 'Dollglas Adams', '  Humor  is the tendency of experiences to provoke laughter and provide amusement.', 2013, 1500, 'Role based security.pdf', 'Humor', 'humor.jpg', 15, 'Entertainment', 2),
(8, 'Roguelawyer', 'Sebastian Rudd is a street lawyer, but not your typical street lawyer. His office is a black customized bulletproof van, complete with Wi-Fi  a bar, a small fridge, and fine leather chairs.', 2014, 3000, 'Role based security.pdf', 'Thrillers', 'thirller.jpg', 12, 'Mystery and suspense', 7),
(9, 'Backstrom', 'Backstrom series of books remain very real and authentic in nature due to Perssonâ€™s experience as a renowned criminologist and a leading psychological profiler.  Persson has held the position of Professor at the National Swedish Police Board and is regularly consulted as the countryâ€™s foremost expert on crime.', 2016, 2500, 'Role based security.pdf', 'crime', 'crime.jpg', 10, 'Mystery and suspense', 7),
(10, 'Time to kill', '\r\nCarl Lee is charged with murder, and he enlists the help of his friend, Jake Brigance. Given the town\'s racism and corruption, it is almost certain that Carl will be pronounced guilty and sentenced to prison. ', 2012, 3000, 'Role based security.pdf', 'suspense', 'suspense.jpg', 12, 'Mystery and suspense', 7),
(11, 'Renegades', '\r\nRenegades takes place in Gatlon (a fictional city), in the aftermath of a civil war between the Renegades and the Anarchists. Both are groups of people with superpowers. The Renegades consider themselves superheroes - fighting for the greater good. The Anarchists are the most powerful of many villain gangs, and consider themselves the super-villains.', 2013, 1500, 'Role based security.pdf', 'Vampires', 'vampires.jpg', 10, 'Horror', 7),
(12, 'Happily ever after', 'My Jumbo Book Of Fairy Tales has a compilation of eight classic fairy tales that are loved by the children.', 2014, 2500, 'Role based security.pdf', 'fairy tales', 'fairy tales.jpg', 10, 'Kids', 8),
(13, 'Ocean at the end of lane', 'A middle-aged man returns to his childhood home to attend a funeral. Although the house he lived in is long gone, he is drawn to the farm at the end of the road, where, when he was seven, he encountered a most remarkable girl, Lettie Hempstock, and her mother and grandmother. He hasnâ€™t thought of Lettie in decades, and yet as he sits by the pond (a pond that sheâ€™d claimed was an ocean) behind the ramshackle old farmhouse where she once lived, the unremembered past comes flooding back. \r\n\r\n', 2012, 3000, 'Role based security.pdf', 'fantasy', '4.jpg', 12, 'Comics', 8),
(14, 'Sandman', 'Sandman  poetry book was try and pull back and just describe the right things, leave enough room .', 2010, 2000, 'Role based security.pdf', 'peotry', 'sandman.jpg', 10, 'literature and fiction', 8),
(15, 'flash fiction', 'Flash Fiction Magazine has compiled a sterling collection of exceptional contemporary examples of this unique fictional form covering a wide range of ideas and genres, from literary to romantic to humorous to horrifying.', 2015, 1000, 'Role based security.pdf', 'fiction', 'fiction.jpg', 10, 'literature and fiction', 8),
(16, ' Interview with vampire', ' vampires shocking, and chillingly erotic, this is a novel of mesmerizing beauty and astonishing force â€” a story of danger and flight, of love and loss, of suspense and resolution, and of the extraordinary power of the senses. It is a novel only Anne Rice could write.', 2014, 1200, 'Role based security.pdf', 'Vampires', 'v.jpg', 10, 'Horror', 2),
(17, 'Cold as ice', 'The job was supposed to be dead easy--hand-deliver some legal papers to billionaire philanthropist Harry Van Dornâ€™s extravagant yacht, get his signature and be done. But Manhattan lawyer Genevieve Spenser soon realizes sheâ€™s in the wrong place at the wrong time, and that the publicly benevolent playboy has a sick, vicious side. As he tries to make her his plaything for the evening, eager to use and abuse her until he discards her with the rest of his victims, Genevieve must keep her wits if she intends to survive the night.', 2015, 2000, 'Role based security.pdf', 'suspense', 's.jpg', 12, 'Mystery and suspense', 2),
(18, 'Sullivan Street Bakery', 'This book guide  you to making sourdough and the Italian-inspired cafe dishes from one of Manhattans best bakeries. Sullivan Street Bakery is renowned for its outstanding bread. \r\n\r\n', 2012, 2500, 'Role based security.pdf', 'fashion', 'italian.jpg', 10, 'Cooking', 9),
(19, 'The Chaperone', 'The Chaperone is a New York Times-bestselling novel about the woman who chaperoned an irreverent Louise Brooks to New York City  and the summer that would change them both.', 2016, 4000, 'Role based security.pdf', 'women fiction', 'women fiction.jpg', 12, 'literature and fiction', 9),
(20, 'Tori de clare', 'When nineteen-year-old Naomi Stone is snatched from her husband at knifepoint on the night of their wedding and taken to a deserted cemetery, she knows her life is finished. Drugged and disorientated, she loses consciousness as she lies in an open grave with a gun to her head.', 2012, 2500, 'Role based security.pdf', 'Psychological Thriller', 'p thriller.jpg', 12, 'Mystery and suspense', 9),
(22, 'fashion', 'This title examines the positions of clothing designer, clothing buyer, fashion photographer, and fashion model. The duties and responsibilities of the professional in each of these occupations are examined.', 2012, 4000, 'Role based security.pdf', 'fashion', 'f.jpg', 15, 'Art and Music', 9),
(23, 'The empty desk', 'For years a single desk at Grandview Elementary School has sat empty, avoided by every child who passes through its classroom. Across town, a mother waits for a daughter who didnâ€™t return home. And from a distance, a young woman mourns the sister she lost.', 2015, 3000, 'Role based security.pdf', 'Ghosts', 'ghost.jpg', 12, 'Horror', 9),
(24, 'The Netherlands', 'Netherlands is full of drama and splendor â€” from the mighty Hague to artists like Rembrandt and Vermeer to power struggles among royalty.', 2014, 2500, 'Role based security.pdf', 'History', 'history.jpg', 12, 'literature and fiction', 10),
(25, 'Adams', ' This book is Discover one of the first American dynasties in this enthralling look at the Adams line. From Founding Father John Adams to sixth president John Quincy Adams to diplomats and authors, this compelling account sheds light on the legacy of a fascinating family.', 2015, 3000, 'Role based security.pdf', 'History', 'history 1.jpg', 10, 'literature and fiction', 10),
(26, 'Carrying Albert home', 'Big Fish meets The Notebook in this emotionally evocative story about a man, a woman, and an alligator that is a moving tribute to love, from the New York Times bestselling author of the award-winning memoir Rocket Boysâ€”the basis of the movie October Sky.', 2012, 4000, 'Role based security.pdf', 'Humor', 'humor 1.jpg', 20, 'Entertainment', 10),
(27, 'Fresh Off the Boat', ' This book is the â€œbrash and funnyâ€ memoir (The New York Times) that inspired the hit TV comedy series.', 2014, 2500, 'Role based security.pdf', 'Humor', 'humor2.jpg', 10, 'Entertainment', 10),
(28, 'Carrabba Italian', 'Carrabbaâ€™s Italian Grill has offered its amici (Italian for â€œfriendsâ€) an extraordinary dining experience. Serving hand-prepared, contemporary renditions of traditional family recipes, Carrabbaâ€™s makes everyone who walks through the door feel right at home. ', 2013, 1500, 'Role based security.pdf', 'Italain', 'italian1.jpg', 12, 'Cooking', 10),
(29, 'The Riddle of the Labyrinth', 'It is about the scholars  who  struggled to decipher the linguistic key to a mysterious Bronze Age civilization â€” only to have the puzzle solved by an enthusiastic novice. A riveting intellectual detective story comes to life in this â€œcaptivating and important book.', 2010, 4000, 'Role based security.pdf', 'fiction', 'fiction 1.jpg', 15, 'literature and fiction', 10),
(30, 'June Bug', 'I believed everything my daddy told me until I walked into Wal-Mart and saw my picture on a little poster . . .â€ For as long as she can remember, June Bug and her father have traveled the back roads of the country in their beat-up RV, spending many nights.', 2014, 2000, 'Role based security.pdf', 'fairy tales', 'tales.jpg', 15, 'Kids', 8);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_name`, `description`) VALUES
('Art and Music', 'The arts refers to the theory and physical expression of creativity found in human societies and cultures. Major constituents of the arts include literature (including drama, poetry). Music means Self-expansion and oneness. It is an art by itself. Art, in any of its forms, is generated by a person, or a group of talented yet usually ordinary people, that express, willingly or not, an opinion regarding present times.'),
('Comics', 'Comics is a medium used to express ideas by still images, often combined with text or other visual information. Comics frequently takes the form of juxtaposed sequences of panels of images. ... Common forms of comics include comic strips, editorial and gag cartoons, and comic books'),
('Cooking', 'Cooking or cookery is the art, technology, science and craft of preparing food for consumption.'),
('Entertainment', 'Entertainment is a form of activity that holds the attention and interest of an audience, or gives pleasure and delight. It can be an idea or a task.'),
('Health and fitness', ' Health is a state of complete physical, mental and social well-being. ... Exercise â€“ any bodily activity that enhances or maintains physical fitness and overall health and wellness.'),
('Horror', 'Horror is a genre of speculative fiction which is intended to, or has the capacity to frighten, scare, disgust, or startle its readers or viewers by inducing feelings of horror and terror.'),
('Kids', 'This category is for readers and listeners up to about age 12. It is often illustrated. The term is used in senses that sometimes exclude young-adult fiction,'),
('literature and fiction', 'Fiction, literature created from the imagination, not presented as fact, though it may be based on a true story or situation. Types of literature in the fiction genre include the novel, short story, and novella. The word is from the Latin fictiÅ, â€œthe act of making, fashioning, or molding.'),
('Mystery and suspense', 'Mystery fiction is a genre of fiction usually involving a mysterious death or a crime to be solved.Mystery fiction\" can be detective stories in which the emphasis is on the puzzle or suspense element and its logical solution such as a whodunit.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` bigint(15) NOT NULL,
  `shipping_address` text NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_email`, `password`, `name`, `mobile`, `shipping_address`, `status`) VALUES
('abc12@gmail.com', '4545', 'abc', 7894561233, 'na', 'enable'),
('test@gmail.com', '23', 'test', 8989898989, 'na', 'enable');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `author_signup`
--
ALTER TABLE `author_signup`
  ADD PRIMARY KEY (`authorid`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`Bookid`),
  ADD KEY `category_name` (`category_name`),
  ADD KEY `authorid` (`authorid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author_signup`
--
ALTER TABLE `author_signup`
  MODIFY `authorid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `Bookid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`authorid`) REFERENCES `author_signup` (`authorid`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`category_name`) REFERENCES `categories` (`category_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
