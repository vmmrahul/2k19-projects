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
-- Database: `homedecor`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `email` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`email`, `password`, `type`, `mobile`) VALUES
('anmolhundal@gmail.com', '222', 'admin', '9592231892'),
('ayushi@gmail.com', '444', 'admin', '9988543210'),
('gitika@gmail.com', '555', 'admin', '9865427869'),
('jkrandhawa@gmail.com', '111', 'admin', '9876543210'),
('rkb@gmail.com', '1234', 'admin', '6280995201');

-- --------------------------------------------------------

--
-- Table structure for table `billdetails`
--

CREATE TABLE `billdetails` (
  `detailid` int(11) NOT NULL,
  `billid` int(11) NOT NULL,
  `producatid` int(11) NOT NULL,
  `price` float NOT NULL,
  `qty` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `billdetails`
--

INSERT INTO `billdetails` (`detailid`, `billid`, `producatid`, `price`, `qty`) VALUES
(5, 5, 2, 56000, 4),
(6, 5, 4, 196000, 7),
(7, 5, 5, 18000, 6),
(8, 6, 38, 144000, 6),
(9, 6, 34, 486000, 9),
(10, 7, 31, 80000, 4),
(11, 7, 38, 144000, 6),
(12, 7, 34, 486000, 9),
(13, 7, 1, 126000, 6),
(14, 7, 4, 100000, 5),
(15, 8, 3, 375000, 5),
(16, 9, 1, 3500, 1),
(17, 9, 3, 735000, 7),
(18, 10, 4, 324000, 9);

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
  `status` varchar(100) NOT NULL,
  `typeofbill` varchar(100) NOT NULL,
  `dateoforder` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`billid`, `totalamount`, `email`, `address`, `mobile`, `status`, `typeofbill`, `dateoforder`) VALUES
(5, 45000, 'rkb@gmail.com', 'AMRITSAR', '6280995201', 'commplite', 'By Card', '2019-11-11'),
(6, 78000, 'rkb@gmail.com', 'AMRITSAR', '6280995201', 'pending', 'Cash', '2019-11-11'),
(7, 139000, 'rkb@gmail.com', 'AMRITSAR', '6280995201', 'commplite', 'By Card', '2019-11-11'),
(8, 75000, 'rkb@gmail.com', 'AMRITSAR', '6280995201', 'pending', 'Cash', '2019-11-11'),
(9, 108500, 'rkb@gmail.com', 'AMRITSAR', '6280995201', 'pending', 'Cash', '2019-11-11'),
(10, 36000, 'rkb@gmail.com', 'AMRITSAR', '6280995201', 'pending', 'Cash', '2019-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catname` varchar(45) NOT NULL,
  `description` text DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catname`, `description`, `photo`) VALUES
('Bathroom', 'One of the most common yet expensive spaces to design or renovate is the bathroom. This space is moving away from the idea of being a merely functional private zone to a relaxing room. All good bathroom designs start by addressing the layout, colour schemes, and bathroom tiles. A bathroom design should tie all elements like layout and accessories to suit the overall design. After all, well-done bathrooms add value and comfort to your home.', 'categoryphotos/75647bathroom.jpg'),
('Bedroom', 'Your bedroom is more than just a place to sleep. With increasingly common fast-paced lives, it is important to have a space to unwind. Bedrooms should have a vibe that reflects your personality and instantly lets you relax and recharge as you escape everyday life. You can set the tone of your bedroom by making tiny decor tweaks or by planning a complete overhaul of the bedroom design. ', 'categoryphotos/23123bedroom.jpg'),
('Garden', 'A well-landscaped garden is a thing of beauty, yet in most homes it is the last to receive design attention. A beautiful landscape will not only add to the visual appeal of your home but also enhance your lifestyle and enjoyment of being at home. The options for your garden design can be as elaborate or low maintenance as you desire, depending on your lifestyle and interest in gardening.', 'categoryphotos/65403garden.jpg'),
('Home office', 'Every home needs a productive room or corner. A study room or office room is for when you work from home or bring work home, or for when you need a place to go through bills, mail or store important paperwork. Even the kids can use it to do their homework, or quietly play a game online.', 'categoryphotos/23455homeoffice.jpg'),
('Kids room', 'For most children, their bedroom is a place to escape and daydream. A space dedicated to homework, games, books and toys. So it comes as no surprise that most kids’ room designs are fun, bright and have engaging decor. Because kids’ room themes are endless they pose a design challenge, as children\'s preferences change very often. ', 'categoryphotos/35505kidsroom.jpg'),
('Kitchen', 'The warmest space in most Indian homes is the kitchen — literally and figuratively. This is where you spend most of your time cooking, sharing meals and entertaining. Hence, it is really important that your kitchen design is the perfect balance of style, functionality and your personality.', 'categoryphotos/57656kitchen.jpg'),
('Living room', 'True to its name, the living room is where the family comes together to meet, greet, watch TV and play games. Most Indian homes have only one hall and hence the living room designs may vary to serve different functions. If you’re lucky enough to have more than one drawing room, you may make your living space a separate, more formal area away from the den or relaxing lounge.', 'categoryphotos/45878livingroom.jpg'),
('Pooja room', 'No Indian home is complete without a prayer room more commonly known as a pooja room. A rather small space, the puja room houses gods and is a place for rituals and festivities. Here is a guide with some basic tips and puja room ideas.', 'categoryphotos/62262poojaroom.jpg'),
('Terrace and balcony', 'Escaping the confines of shrinking urban homes and being out on balconies and elevated rooftop terraces is a great way to get some fresh air. Spacious or small, it is a great outdoor area to enjoy your morning coffee, read a book, fine dine or just relax. Most homeowners are resourceful and can adapt any terrace or balcony design to fit their needs.', 'categoryphotos/18548terraceandbalcony.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `newsid` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `dateofnews` date DEFAULT NULL,
  `hastags` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`newsid`, `title`, `description`, `dateofnews`, `hastags`) VALUES
(1, 'new category', 'a category that includes new products', '2019-10-22', '#newcategory'),
(11, 'living room', 'living room', '2019-10-31', 'living room'),
(12, 'living room', 'living room of new styles', '2019-10-31', 'living room');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_photos`
--

CREATE TABLE `portfolio_photos` (
  `photoid` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `portfolio_photos`
--

INSERT INTO `portfolio_photos` (`photoid`, `description`, `photo`, `pid`) VALUES
(1, 'This kitchen contains light green and white combination doors and chimney.There is a small window to exhaust the air.', 'portfoliophotos/99891kitchen1.jpg', 1),
(2, 'This kitchen contains wooden doors  with a  shelf of marble.The window makes the look of kitchen more beautiful.', 'portfoliophotos/29155kitchen2.jpg', 1),
(3, 'This kitchen contains one light brown color doors with microwave fitting.There are two windows in this kitchen.', 'portfoliophotos/99798kitchen3.jpg', 1),
(4, 'This kitchen contains grey and yellow color combination of doors with small space for the boxes of snacks etc.', 'portfoliophotos/10313kitchen4.jpg', 1),
(5, 'This kitchen contains wooden doors and a long painting on the wall makes the kitchen more beautiful.', 'portfoliophotos/47543kitchen5.jpg', 1),
(6, 'This kitchen contains sheesham wooden doors with white microwave.There is one double door refrigerator .', 'portfoliophotos/21572kitchen6.jpg', 1),
(7, 'This kitchen contains doors with glass fitting so that things visible from outside. There is small shelf for the plates.', 'portfoliophotos/87257kitchen7.jpg', 1),
(8, 'This kitchen contains white doors.This is a spacious and ultramodern kitchen.', 'portfoliophotos/64298kitchen8.jpg', 1),
(9, 'This is a simple kitchen with light brown doors with sinks on one side with modular design.', 'portfoliophotos/31986kitchen9.jpg', 1),
(10, 'This kitchen contains blue and white color\ncombination doors with white and blue almirah on one side.', 'portfoliophotos/66189kitchen10.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_videos`
--

CREATE TABLE `portfolio_videos` (
  `videoid` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `video` varchar(80) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(11) NOT NULL,
  `pname` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `hastags` varchar(60) DEFAULT NULL,
  `catname` varchar(60) DEFAULT NULL,
  `coverphoto` varchar(60) DEFAULT NULL,
  `photo1` varchar(60) DEFAULT NULL,
  `photo2` varchar(60) DEFAULT NULL,
  `photo3` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `pname`, `description`, `price`, `hastags`, `catname`, `coverphoto`, `photo1`, `photo2`, `photo3`) VALUES
(1, 'Mosaic tiles', 'Rain forest brown mosaic designer tiles by Axiom Exports.', 3500, 'tile', 'Bathroom', 'productphotos/20701mosaiccover.jpg', 'productphotos/58338mosaictiles.jpg', 'productphotos/51725mosaictiles1.jpg', 'productphotos/37825mosaictiles2.jpg'),
(2, 'Bathroom sinks', 'Mother of pearl wash basin.', 3500, 'sink', 'Bathroom', 'productphotos/54513sinkcoverphoto.jpg', 'productphotos/56432sink.jpg', 'productphotos/10306sink1.jpg', 'productphotos/74632sink2.jpg'),
(3, 'Bath tubs', 'Stone bath tubs', 15000, 'tubs', 'Bathroom', 'productphotos/79598bathcover.jpg', 'productphotos/19574bath.jpg', 'productphotos/43047bath1.jpg', 'productphotos/10728bath2.jpg'),
(4, 'Shower Curtains', 'Cortina Multicolour Polyester Shower Curtains', 4000, 'curtains', 'Bathroom', 'productphotos/34349curtainscover.jpg', 'productphotos/71584curtains.jpg', 'productphotos/54875curtains1.jpg', 'productphotos/75871curtains2.jpg'),
(5, 'Tissue Holder', 'An Illustrious and intricate pattern finely handcrafted on the bone, in an imperial tissue box', 500, 'holder', 'Bathroom', 'productphotos/29407tissuecover.jpg', 'productphotos/15431tissue.jpg', 'productphotos/31183tissue1.jpg', 'productphotos/75468tissue2.jpg'),
(6, 'Double bed', 'Ethnic India Art Crystal Queen size wood bed', 36600, 'doublebed', 'Bedroom', 'productphotos/33842bedcover.jpg', 'productphotos/79495bed.jpg', 'productphotos/52814bed1.jpg', 'productphotos/93398bed2.jpg'),
(7, 'Table Lamp', 'Our Entwined Eternity Table Lamp will add a touch of architectural elements.', 950, 'tablelamp', 'Bedroom', 'productphotos/93105lampcover.jpg', 'productphotos/50992lamp.jpg', 'productphotos/39176lamp1.jpg', 'productphotos/27084lamp2.jpg'),
(8, 'Wardrobe', 'Spacewood Apex Engineered Wood 3 Door Wardrobe', 25000, 'wardrobe', 'Bedroom', 'productphotos/28011wardrobecover.jpg', 'productphotos/55967wardrobe.jpg', 'productphotos/84871wardrobe1.jpg', 'productphotos/39297wardrobe2.jpg'),
(9, 'Sofa pillows', 'Hand made pillows of different colord', 400, 'pillows', 'Bedroom', 'productphotos/43977pillowcover.jpg', 'productphotos/71009pillow.jpg', 'productphotos/31927pillow1.jpg', 'productphotos/31518pillow2.jpg'),
(10, 'Dressing tables', 'Our Lexington dressing cabinet is a must for modern homes. Its three drawers can store all your make up', 5550, 'dressing table', 'Bedroom', 'productphotos/98090dressingtablecover.jpg', 'productphotos/35049dressingtable.jpg', 'productphotos/90538dressingtable1.jpg', 'productphotos/79716dressingtable2.jpg'),
(11, 'Garden furniture', 'Durable, Made Of Good Quality, All Weather Proof, Cozy And Comfortable.', 12000, 'garden furniture', 'Garden', 'productphotos/18940gardencover.jpg', 'productphotos/37032gardenfurniture.jpg', 'productphotos/32707gardenfurniture1.jpg', 'productphotos/91796gardenfurniture2.jpg'),
(12, 'Vanity cabinets', 'Since they take up so much room in such a small space, bathroom vanities and sink consoles are often the focal point of your bathroom.', 3600, 'vanitycabinet', 'Bathroom', 'productphotos/60642vanitycabinetcover.jpg', 'productphotos/54507vanitycabinet.jpg', 'productphotos/7428vanitycabinet1.jpg', 'productphotos/90527vanitycabinet2.jpg'),
(13, 'Bathroom Taps', 'Different types and colors of taps', 1000, 'taps', 'Bathroom', 'productphotos/73758tapcover.jpg', 'productphotos/14724tap.jpg', 'productphotos/19312tap1.jpg', 'productphotos/61512tap2.jpg'),
(14, 'Knobs and Handles', 'Avaliable in different sizes,materials,colors and finishes', 510, 'knobs and handles', 'Bathroom', 'productphotos/48545knobcover.jpg', 'productphotos/39885knob.jpg', 'productphotos/69821knob1.jpg', 'productphotos/66519knob2.jpg'),
(15, 'Soap dispenser', 'Not only a functional soap dispenser, these ceramic jars are also decorative.', 800, 'soapdispenser', 'Bathroom', 'productphotos/19890soapcover.jpg', 'productphotos/41361soap.jpg', 'productphotos/3316soap1.jpg', 'productphotos/65586soap2.jpg'),
(16, 'Shower', 'This makes you fresh and enjoy a new day after every night.', 4530, 'shower', 'Bathroom', 'productphotos/97377showercover.jpg', 'productphotos/26672shower.jpg', 'productphotos/16072shower1.jpg', 'productphotos/93057shower2.jpg'),
(17, 'Photo Frame', 'While the frame is often an afterthought to the purchased art , a poor photo frame can quickly make  an artistic display.', 560, 'photoframe', 'Bedroom', 'productphotos/4945photoframecover.jpg', 'productphotos/43124photoframe.jpg', 'productphotos/11854photoframe1.jpg', 'productphotos/79079photoframe2.jpg'),
(18, 'Mirror', 'If you live in a small home or are looking for a unique way to add some personality to your walls, let us share a little secret with you. ', 650, 'mirror', 'Bedroom', 'productphotos/23746mirrorcover.jpg', 'productphotos/80256mirror.jpg', 'productphotos/66923mirror1.jpg', 'productphotos/51806mirror2.jpg'),
(19, 'Wall patterns', 'Shopping for wall decor is one of the most exciting parts of decorating a home. Designs can range from tiny frames to oversize 3D sculptures', 4520, 'wallpattern', 'Bedroom', 'productphotos/79606wallpatterncover.jpg', 'productphotos/12881wallpattern.jpg', 'productphotos/55435wallpattern1.jpg', 'productphotos/78489wallpattern2.jpg'),
(20, 'Bedroom curtains', 'When you narrow down which window coverings fit your criteria, consider the size and shape of the windows, as well as factors out, such as sunlight', 15000, 'curtains', 'Bedroom', 'productphotos/59580bedcurtainscover.jpg', 'productphotos/96929bedcurtains.jpg', 'productphotos/24982bedcurtains1.jpg', 'productphotos/9091bedcurtains2.jpg'),
(21, 'Bedroom clocks', 'Clocks today go far beyond the standard cuckoo or grandfather styles — everything from a futuristic digital alarm clock to a simplistic wood grain clock can help add a touch of personal style.', 650, 'clocks', 'Bedroom', 'productphotos/61140clockcover.jpg', 'productphotos/53813clock.jpg', 'productphotos/12664clock1.jpg', 'productphotos/7286clock2.jpg'),
(22, 'Decorative pots', 'The pots give the garden a beautiful look and various colors also makes the garden a heaven.', 430, 'gardenpots', 'Garden', 'productphotos/55437gardenpotscover.jpg', 'productphotos/11925gardenpots.jpg', 'productphotos/36711gardenpots1.jpg', 'productphotos/16644gardenpots2.jpg'),
(23, 'Garden Sculptures', 'The garden sculptures gives a nice look and also.These sculptures also provides a classy look to the garden', 45000, 'gardensculptures', 'Garden', 'productphotos/65748sculpturescover.jpg', 'productphotos/16197sculptures.jpg', 'productphotos/44012sculptures1.jpg', 'productphotos/56029sculptures2.jpg'),
(24, 'Fountains', 'The gorgeous water fountains makes the garden a heaven and you can also move them from one place to other.', 6200, 'fountains', 'Garden', 'productphotos/83288fountaincover.jpg', 'productphotos/63907fountain.jpg', 'productphotos/88049fountain1.jpg', 'productphotos/45873fountain2.jpg'),
(25, 'Garden Candles', 'An outdoor candle, which is also known a pitch torch or a garden candle decorates the garden. It is usually 10 cm wide', 430, 'candles', 'Garden', 'productphotos/59857candlescover.jpg', 'productphotos/62822candles.jpg', 'productphotos/94815candles1.jpg', 'productphotos/7068candles2.jpg'),
(26, 'Birdbaths', 'A birdbath is an artificial puddle or small shallow created with a water filled basin in which birds bath may drink water or bath.', 2300, 'birdbaths', 'Garden', 'productphotos/89492birdbathscover.jpg', 'productphotos/76666birdbaths.jpg', 'productphotos/53941birdbaths1.jpg', 'productphotos/56346birdbaths2.jpg'),
(27, 'Solar garden lights', 'A solar cell is capable of converting sunlight to a direct current.Solar garden lights use a small photovoltaic panel', 3000, 'solargardenlights', 'Garden', 'productphotos/47454solarcover.jpg', 'productphotos/53605solar.jpg', 'productphotos/31855solar1.jpg', 'productphotos/57029solar2.jpg'),
(28, 'Wind chimes', 'Wind chimes are a type of percussion instrument constructed from suspended tubes, rods, bells.', 650, 'windchimes', 'Garden', 'productphotos/97526windchimecover.jpg', 'productphotos/46370windchime.jpg', 'productphotos/59473windchime1.jpg', 'productphotos/79937windchime2.jpg'),
(29, 'Decorative wall', 'A lighted accent wall draws attention to the water feature, which is nestled into a rock garden with neat rows of succulents', 56000, 'accentwall', 'Garden', 'productphotos/48342accentwallcover.jpg', 'productphotos/93627accentwall.jpg', 'productphotos/57820accentwall1.jpg', 'productphotos/63666accentwall2.jpg'),
(30, 'Pebbles', 'A pebble is a clast of rock with a particle size of 2 to 64 millimetres based on the Krumbein phi scale of sedimentology. Pebbles are generally considered larger than granules ', 1500, 'pebbles', 'Garden', 'productphotos/46149pebblecover.jpg', 'productphotos/62578pebble.jpg', 'productphotos/35312pebble1.jpg', 'productphotos/37643pebble2.jpg'),
(31, 'Home office chairs', 'An office chair, or desk chair, is a type of chair that is designed for use at a desk in an office. It is usually a swivel chair, with a set of wheels for mobility.', 5000, 'homeofficechairs', 'Home office', 'productphotos/41872officechaircover.jpg', 'productphotos/86414officechair.jpg', 'productphotos/60519officechair1.jpg', 'productphotos/18905officechair2.jpg'),
(32, 'Home office desks', 'A desk or bureau is a piece of furniture with a flat table-style work surface used in a school, office, home or the like for academic, professional or domestic activities such as reading, writing', 5000, 'homeofficedesks', 'Home office', 'productphotos/93400officedeskcover.jpg', 'productphotos/86597officedesk.jpg', 'productphotos/13393officedesk1.jpg', 'productphotos/47530officedesk2.jpg'),
(33, 'Bookcases', 'The bookshelf is one of the most basic pieces of furniture in any room, and also one of the most important. The right bookshelf is equal parts storage, interior design, personal history and convenience', 8500, 'bookcases', 'Home office', 'productphotos/2585bookcasecover.jpg', 'productphotos/1396bookcase.jpg', 'productphotos/24394bookcase1.jpg', 'productphotos/9648bookcase2.jpg'),
(34, 'Filing cabinets', 'A filing cabinet or sometimes file cabinet in American English is a piece of office furniture usually used to store paper documents in file folders. ', 6000, 'filing cabinet', 'Home office', 'productphotos/60448cabinetcover.jpg', 'productphotos/61750cabinet.jpg', 'productphotos/44606cabinet1.jpg', 'productphotos/28305cabinet2.jpg'),
(35, 'Bulletin boards', 'By adding a ledge, rod, and brackets, you can transform a simple bulletin board into something far more versatile it can hold mail, packages, keys and more', 3200, 'bulletinboards', 'Home office', 'productphotos/75531bulletincover.jpg', 'productphotos/26343bulletin.jpg', 'productphotos/26928bulletin1.jpg', 'productphotos/12386bulletin2.jpg'),
(36, 'Desk Lamps', ' Choosing a lamp style that matches the decor of your space is smart, though. If you have contemporary or modern decor, you will want a contemporary or modern desk lamp.', 4200, 'desklamp', 'Home office', 'productphotos/5989desklampscover.jpg', 'productphotos/49857desklamps.jpg', 'productphotos/3378desklamps1.jpg', 'productphotos/23142desklamps2.jpg'),
(37, 'Drafting tables', 'A drawing board also drawing table, drafting table or architects table is, in its antique form, a kind of multipurpose desk which can be used for any kind of drawing, writing.', 4500, 'drafting table', 'Home office', 'productphotos/96467draftingtablecover.jpg', 'productphotos/43263draftingtable.jpg', 'productphotos/80402draftingtable1.jpg', 'productphotos/30353draftingtable2.jpg'),
(38, 'Globe', 'Globes are a fantastic way to learn about the earth and its continents, countries and cities. An interactive globe is a great tool for teaching children about the diversity of our world.', 4000, 'globe', 'Home office', 'productphotos/1921globecover.jpg', 'productphotos/23978globe.jpg', 'productphotos/17506globe1.jpg', 'productphotos/53076globe2.jpg'),
(39, 'Pen Stand', 'This pen stand gives you a way to organise your things such as pens, pencils and other materials', 560, 'penstand', 'Home office', 'productphotos/50381pencover.jpg', 'productphotos/89543pen.jpg', 'productphotos/26811pen1.jpg', 'productphotos/32677pen2.jpg'),
(40, 'OfficeClock', 'A home office clock is a standing clock in differnt shapes.', 560, 'homeoofficeclock', 'Home office', 'productphotos/3455officeclockcover.jpg', 'productphotos/3198officeclock.jpg', 'productphotos/64544officeclock1.jpg', 'productphotos/22307officeclock2.jpg'),
(41, 'Bedsheets', 'These bedsheets are ideal for your children room and are available in different styles', 3000, 'bedsheets', 'Kids room', 'productphotos/1845bedsheetcover.jpg', 'productphotos/81634bedsheet.jpg', 'productphotos/89561bedsheet1.jpg', 'productphotos/16709bedsheet2.jpg'),
(42, 'KidsClock', 'These fun clocks features an art print of a doll  with a bright and cheerful scene  or a simple clock. It is a perfect finishing touch to your children room decor.', 850, 'clocks', 'Kids room', 'productphotos/19143kidsclockcover.jpg', 'productphotos/6203kidsclock.jpg', 'productphotos/12689kidsclock1.jpg', 'productphotos/47237kidsclock2.jpg'),
(43, 'Bean bags', 'We offer kids Bean Bags that are available in vibrant colors and designs.', 5000, 'beanbags', 'Kids room', 'productphotos/40235beanbagcover.jpg', 'productphotos/40016beanbag.jpg', 'productphotos/32554beanbag1.jpg', 'productphotos/38384beanbag2.jpg'),
(44, 'Lighting', 'A light in the nursery or kids room can serve many purposes. Wall lights double up as decoration, and light projectors can cast patterns over surfaces to provide a relaxing atmosphere before bed.', 6000, 'lighting', 'Kids room', 'productphotos/98543kidslightingcover.jpg', 'productphotos/71610kidslighting.jpg', 'productphotos/1066kidslighting1.jpg', 'productphotos/53649kidslighting2.jpg'),
(45, 'Curtains', 'There are many kinds of adorable Kids Room Curtains.They are both of light and heavy material, but not room darkening occcurs with them.', 2300, 'curtains', 'Kids room', 'productphotos/53057kidscurtainscover.jpg', 'productphotos/14336kidscurtains.jpg', 'productphotos/71691kidscurtains1.jpg', 'productphotos/21199kidscurtains2.jpg'),
(46, 'Wall stickers', 'Wall stickers in children room are a great decoration from toddler to teen, grows along with your children.Transform any room into a favourite place where kids have sweet dreams, imitate role models', 12000, 'wallstickers', 'Kids room', 'productphotos/47817kidsstickercover.jpg', 'productphotos/34585kidssticker.jpg', 'productphotos/49303kidssticker1.jpg', 'productphotos/34808kidssticker2.jpg'),
(47, 'Carpets', 'Carpets are designed to spark the imagination of children and provide positive experience that helps them learn new things.', 6000, 'carpets', 'Kids room', 'productphotos/88338kidscarpetcover.jpg', 'productphotos/48525kidscarpet.jpg', 'productphotos/38949kidscarpet1.jpg', 'productphotos/77517kidscarpet2.jpg'),
(48, 'Kids study table', 'The beautiful study table encourages your kids to learn.These study tables are durable and covers less space.', 2000, 'kidsstudytable', 'Kids room', 'productphotos/85561kidsstudycover.jpg', 'productphotos/26076kidsstudy.jpg', 'productphotos/98070kidsstudy1.jpg', 'productphotos/58357kidsstudy2.jpg'),
(49, 'Bunk beds', 'These beds cover less space in the room  but provides more space for your kids to sleep.', 13000, 'bunkbeds', 'Kids room', 'productphotos/70173bunkbedcover.jpg', 'productphotos/82992bunkbed.jpg', 'productphotos/98427bunkbed1.jpg', 'productphotos/81880bunkbed2.jpg'),
(50, 'Kids almirah', 'This beautiful printed Kids cupboard or almirah or wardrobe is very spacious. It comes with 5 durable shelves to keep your baby stuff organized. It has 4 wheels that makes it easy to move. When not in use, it can be folded and packed in box.', 12000, 'kidsalmirah', 'Kids room', 'productphotos/53398kidsalmirahcover.jpg', 'productphotos/2981kidsalmirah.jpg', 'productphotos/62755kidsalmirah1.jpg', 'productphotos/94596kidsalmirah2.jpg'),
(51, 'Kitchen sinks', 'The kitchen sink is the sink in the kitchen of a home or restaurant. The place where you wash your dishes.These are available in copper as well as steel', 3000, 'kitchensinks', 'Kitchen', 'productphotos/49921kitchensinkscover.jpg', 'productphotos/16588kitchensink.jpg', 'productphotos/48504kitchensink1.jpg', 'productphotos/74610kitchensink2.jpg'),
(52, 'Dining table', 'Some common types of table are the dining room table, which is used for seated persons to eat meals.', 15000, 'diningtable', 'Kitchen', 'productphotos/25390diningtablecover.jpg', 'productphotos/61975diningtable.jpg', 'productphotos/16896diningtable1.jpg', 'productphotos/61892diningtable2.jpg'),
(53, 'Dining chair', 'The most common shape is generally rectangular with two armed end chairs and an even number of un-armed side chairs along the long sides.', 3000, 'diningchairs', 'Kitchen', 'productphotos/2942diningchaircover.jpg', 'productphotos/41597diningchair.jpg', 'productphotos/31619diningchair1.jpg', 'productphotos/67559diningchair2.jpg'),
(54, 'Dinner set', 'They are made up of ceramic material and are extremely light in weight. Dinner Sets are a must buy item for any household. They are not only important but are functional too. It is said that food tastes better if it is presented beautifully.', 3000, 'dinnerset', 'Kitchen', 'productphotos/91668dinnersetcover.jpg', 'productphotos/38385dinnerset.jpg', 'productphotos/95732dinnerset1.jpg', 'productphotos/12500dinnerset2.jpg'),
(55, 'Serving trays', 'Serving Trays are a staple item in every home.Some serving trays are used to hold plates and drinks, while other some homes choose the tray to serve food on. Serving trays are an important part of the food industry.', 1500, 'serving trays', 'Kitchen', 'productphotos/84686servingtrayscover.jpg', 'productphotos/78592servingtrays.jpg', 'productphotos/53642servingtrays1.jpg', 'productphotos/670servingtrays2.jpg'),
(56, 'Teapots', 'A teapot is a container with a lid, a handle, and a spout, used for making and serving tea.It  is a vessel used for steeping tea leaves or a herbal mix in boiling .', 2500, 'teapots', 'Kitchen', 'productphotos/16244teapotscover.jpg', 'productphotos/99808teapots.jpg', 'productphotos/66318teapots1.jpg', 'productphotos/2397teapots2.jpg'),
(57, 'Gas stoves', 'A gas stove is a stove that is fuelled by combustible gas such as syngas, natural gas, propane, butane, liquefied petroleum gas or other flammable gas.It is available in different colors and two or three stoves.', 5000, 'gasstoves', 'Kitchen', 'productphotos/31222gasstovecover.jpg', 'productphotos/66168gasstove.jpg', 'productphotos/73692gasstove1.jpg', 'productphotos/27208gasstove2.jpg'),
(58, 'Chimney', 'Kitchen chimney is an appliance that absorb smoke, fumes from kitchen and makes kitchen clean and oil, smoke free.', 30000, 'chimney', 'Kitchen', 'productphotos/11008chimneycover.jpg', 'productphotos/92667chimney.jpg', 'productphotos/97249chimney1.jpg', 'productphotos/33284chimney2.jpg'),
(59, 'Refrigerator', 'A refrigerator is a kitchen appliance where you can store your perishable food at a cool temperature. You should store your milk and meat in the refrigerator to keep them from spoiling.It is available in single as well as double door and in different floral prints.', 20000, 'refrigerator', 'Kitchen', 'productphotos/77129fridgecover.jpg', 'productphotos/28619fridge.jpg', 'productphotos/4975fridge1.jpg', 'productphotos/9429fridge2.jpg'),
(60, 'Microwave', 'Microwave is defined as the part of the electromagnetic spectrum with large infrared waves and short radio waves, an oven that cooks food very quickly.It is available in different colors.', 10000, 'microwave', 'Kitchen', 'productphotos/90256microwavecover.jpg', 'productphotos/38585microwave.jpg', 'productphotos/34699microwave1.jpg', 'productphotos/89578microwave2.jpg'),
(61, 'Sofas', 'The two seater sofa available in different designs and colors.', 25000, 'livingroom sofas', 'Living room', 'productphotos/1005sofacover.jpg', 'productphotos/30790sofa.jpg', 'productphotos/5452sofa1.jpg', 'productphotos/55970sofa2.jpg'),
(62, 'Chaise Lounge', 'A chaise lounge is the American name of a form of sofa with a backrest at one end only. Elsewhere these sofas are called chaise longues.', 12000, 'chaiselounges', 'Living room', 'productphotos/16984chaisecover.jpg', 'productphotos/33772chaise.jpg', 'productphotos/40955chaise1.jpg', 'productphotos/19845chaise2.jpg'),
(63, 'Foot Stools', 'A footstool is a small low stool that you can rest your feet on when you are sitting in a chair.The upper part of these stools come in a rajisthani embroidery print.', 2300, 'footstools', 'Living room', 'productphotos/72561footstoolscover.jpg', 'productphotos/61630footstools.jpg', 'productphotos/36869footstools1.jpg', 'productphotos/8053footstools2.jpg'),
(64, 'Rocking chairs', 'A rocking chair or rocker is a type of chair with two curved bands also known as rockers attached to the bottom of the legs, connecting the legs on each side to each other.', 3000, 'rockingchair', 'Living room', 'productphotos/21199rockingcover.jpg', 'productphotos/21122rocking.jpg', 'productphotos/25547rocking1.jpg', 'productphotos/19122rocking2.jpg'),
(65, 'Coffee tables', 'A coffee table is a long, low table which is designed to be placed in front of or next to a sofa or upholstered chairs to support beverages, magazines, books, decorative objects, and other small items.', 1500, 'coffee tables', 'Living room', 'productphotos/98825coffeetablecover.jpg', 'productphotos/57264coffeetable.jpg', 'productphotos/79754coffeetable1.jpg', 'productphotos/85726coffeetable2.jpg'),
(66, 'Entertainment unit', 'The unit is often either an armoire or a self contained unit usually of wood and glass they often contain dedicated areas either drawers or other spaces for storage of records, videotapes, CDs or DVDs.', 35000, 'entertainmentunit', 'Living room', 'productphotos/65132tvcover.jpg', 'productphotos/17615tv.jpg', 'productphotos/32399tv1.jpg', 'productphotos/27484tv2.jpg'),
(67, 'ShowPiece', 'A showpiece is something that is admired because it is the best thing of its type, especially something that is intended to be impressive.', 3000, 'showpiece', 'Living room', 'productphotos/86320showpiececover.jpg', 'productphotos/29941showpice.jpg', 'productphotos/10256showpiece1.jpg', 'productphotos/65395showpiece2.jpg'),
(68, 'Chandeliers', 'Classic chandeliers have arrays of hanging crystal prisms to illuminate a room with refracted light, while contemporary chandeliers assume a more minimalist design that does not contain prisms and illuminate a room with direct light from the lamps.', 27000, 'chandeliers', 'Living room', 'productphotos/68188chandelierscover.jpg', 'productphotos/48669chandeliers.jpg', 'productphotos/31658chandeliers1.jpg', 'productphotos/54161chandeliers2.jpg'),
(69, 'Vases', 'Put the finishing touches on your space with decorative vases in glass and ceramic.Vases are a versatile decorative accent. Not only do they fill in the gaps on empty dining tables, end tables, and book shelves.', 560, 'vases', 'Living room', 'productphotos/33063vasecover.jpg', 'productphotos/3345vase.jpg', 'productphotos/81867vase1.jpg', 'productphotos/95551vase2.jpg'),
(70, 'Floor Lamps', 'Strategically placed lamps can take your room from mediocre to beautifully designed. Floor lamps have become a staple piece in every living room. Use a classically styled or a contemporary designed lamp to act as an accent to your current decor.', 2500, 'floorlamps', 'Living room', 'productphotos/91368floorcover.jpg', 'productphotos/19462floor.jpg', 'productphotos/65924floor1.jpg', 'productphotos/72539floor2.jpg'),
(71, 'GaneshJi  Moorti', 'This moorti is avaliable in white color and carved with different colors and stones.', 3300, 'Ganeshji moorti', 'Pooja room', 'productphotos/9313moorticover.jpg', 'productphotos/10635moorti.jpg', 'productphotos/52354moorti1.jpg', 'productphotos/10555moorti2.jpg'),
(72, 'Agarbati stand', 'Religious Agarbatti Stand available in golden color keeps puja house clean .Aggarbatti always end up messing your Desk or Puja Room or Office with Ash thus also brings this unique Sophisticated solution which helps in accumulating all the ash at one end.', 220, 'agarbattistand', 'Pooja room', 'productphotos/64431agarbaticover.jpg', 'productphotos/81670agarbati.jpg', 'productphotos/16703agarbati1.jpg', 'productphotos/11818agarbati2.jpg'),
(73, 'Pooja Mandir', 'A pooja mandir is considered to be auspicious and holy, hence, placing it in the right direction is important. Beautify your pooja room with an exquisitely carved wooden temple stand.', 2600, 'pooja mandir', 'Pooja room', 'productphotos/20183mandircover.jpg', 'productphotos/74444mandir.jpg', 'productphotos/53900mandir1.jpg', 'productphotos/41566mandir2.jpg'),
(74, 'Mandir Chowki', 'It is a type of small stool that is used in the mandir to sit and pray. It is available with beautiful carvings on the top.', 530, 'mandirchowki', 'Pooja room', 'productphotos/25602chowkicover.jpg', 'productphotos/33599chowki.jpg', 'productphotos/54439chowki1.jpg', 'productphotos/78420chowki2.jpg'),
(75, 'Hanging bells', 'Ratnatraya Brass Bell hanging made from quality brass material. It is beautifully carved by ancient ritual designs. This brass Bell hanging is used from ancient times to decorate home and temples. It can be used in festival and pooja.', 420, 'hangingbells', 'Pooja room', 'productphotos/62687bellcover.jpg', 'productphotos/87395bell.jpg', 'productphotos/23973bell1.jpg', 'productphotos/92285bell2.jpg'),
(76, 'String beads hanging curtains', 'The hanging curtains are embedded with different types of beads and can be hanged at the mandir entrance.', 1100, 'string beads hanging curtains', 'Pooja room', 'productphotos/58792hangingcover.jpg', 'productphotos/59846hanging.jpg', 'productphotos/33755hanging1.jpg', 'productphotos/93696hanging2.jpg'),
(77, 'Thali set', 'Traditional Pooja Thali Set includes 1 puja thali platter, 1 diya, 1 insence holder, 1 rolichawal holder, 1 glass, 1 spoon and 1 small lota. This puja thali set for Hindu temple rituals is a beautiful prayer set to worship any god and goddess.', 1400, 'thaliset', 'Pooja room', 'productphotos/37627thalisetcover.jpg', 'productphotos/21335thaliset.jpg', 'productphotos/28845thaliset1.jpg', 'productphotos/44659thaliset2.jpg'),
(78, 'Mini fans', 'The mini fan can be placed on atable or it can be hanged on a wall.', 450, 'minifans', 'Pooja room', 'productphotos/7925fancover.jpg', 'productphotos/3398fan.jpg', 'productphotos/22698fan1.jpg', 'productphotos/19858fan2.jpg'),
(79, 'Brass diya', 'Ratnatraya Diya made from quality brass material. Diya plate is used for oil lamp. This brass deepam is used from ancient times to decorate home and temples. It can be used in festival and pooja.', 300, 'brassdiya', 'Pooja room', 'productphotos/35956diyacover.jpg', 'productphotos/34074diya.jpg', 'productphotos/41796diya1.jpg', 'productphotos/15973diya2.jpg'),
(80, 'Door Hanging', 'Bandanwar can be hanged on doors and can be used on many ocassions like Pooja, Festivals.The Bandhanwar brings enlightenment to the decor & is a perfect decorative for the joyous celebrations of life, that is so very essential to the spirit of your day to day life.', 230, 'doorhangings', 'Pooja room', 'productphotos/17147doorhangingcover.jpg', 'productphotos/45683doorhanging.jpg', 'productphotos/16398doorhanging1.jpg', 'productphotos/12393doorhanging2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `professionals`
--

CREATE TABLE `professionals` (
  `pid` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `professionals`
--

INSERT INTO `professionals` (`pid`, `title`, `fullname`, `email`, `mobile`, `city`, `area`, `photo`, `password`) VALUES
(1, 'Kitchen', 'Babita', 'babita95@gmail.com', '9876543210', 'Ludhiana', 'Punjab', 'professionalphotos/58145team1.jpg', '111'),
(2, 'Living Room', 'Madhvi', 'madhvi95@gmail.com', '9865427840', 'Patiala', 'Punjab', 'professionalphotos/99432team2.jpg', '222');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(45) NOT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `mobile`, `password`, `name`, `address`, `photo`) VALUES
('dil@gmail.com', '7347698272', '222', 'dilpreet', '202,sunny enclave,Ram Tirath Road', 'userphotos/83842flower.jpg'),
('jkrandhawa@gmail.com', '9501795287', '111', 'jaspreet', '202,sunny enclave,Ram Tirath Road', 'userphotos/31566test2.jpg'),
('rkb@gmail.com', '6280995201', '1234', 'rahul', 'AMRITSAR', 'userphotos/6437749089.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `billdetails`
--
ALTER TABLE `billdetails`
  ADD PRIMARY KEY (`detailid`),
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
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`newsid`);

--
-- Indexes for table `portfolio_photos`
--
ALTER TABLE `portfolio_photos`
  ADD PRIMARY KEY (`photoid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `portfolio_videos`
--
ALTER TABLE `portfolio_videos`
  ADD PRIMARY KEY (`videoid`),
  ADD KEY `videoid` (`pid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `catname` (`catname`);

--
-- Indexes for table `professionals`
--
ALTER TABLE `professionals`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `billdetails`
--
ALTER TABLE `billdetails`
  MODIFY `detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `billid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `newsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `portfolio_photos`
--
ALTER TABLE `portfolio_photos`
  MODIFY `photoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `portfolio_videos`
--
ALTER TABLE `portfolio_videos`
  MODIFY `videoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `professionals`
--
ALTER TABLE `professionals`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `billdetails`
--
ALTER TABLE `billdetails`
  ADD CONSTRAINT `billdetails_ibfk_1` FOREIGN KEY (`billid`) REFERENCES `bills` (`billid`);

--
-- Constraints for table `portfolio_photos`
--
ALTER TABLE `portfolio_photos`
  ADD CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `portfolio_videos`
--
ALTER TABLE `portfolio_videos`
  ADD CONSTRAINT `videoid` FOREIGN KEY (`pid`) REFERENCES `professionals` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `catname` FOREIGN KEY (`catname`) REFERENCES `category` (`catname`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
