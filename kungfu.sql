-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2017 at 05:48 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kungfu`
--

-- --------------------------------------------------------

--
-- Table structure for table `attain`
--

CREATE TABLE IF NOT EXISTS `attain` (
  `stud_num` int(11) NOT NULL,
  `rank_num` int(255) NOT NULL,
  `attain_date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attain`
--

INSERT INTO `attain` (`stud_num`, `rank_num`, `attain_date`) VALUES
(1, 5, '2011-06-12'),
(2, 8, '2009-11-11'),
(3, 4, '2017-01-01'),
(4, 9, '2016-12-02'),
(5, 2, '2012-05-03'),
(6, 8, '2015-01-07'),
(7, 4, '2006-05-01'),
(8, 8, '2003-03-03'),
(9, 5, '2010-11-14'),
(10, 7, '2008-05-03');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `stud_num` int(11) NOT NULL,
  `day` varchar(50) NOT NULL,
  `level` varchar(255) NOT NULL,
  `time` varchar(200) NOT NULL,
  `attend` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`stud_num`, `day`, `level`, `time`, `attend`) VALUES
(4, 'Monday', 'Intermediate', '4 PM', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `class_num` int(11) NOT NULL,
  `class_day` varchar(100) NOT NULL,
  `class_time` varchar(100) NOT NULL,
  `class_description` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_num`, `class_day`, `class_time`, `class_description`) VALUES
(1, 'Monday', '5 PM', 'Intermediate Class'),
(2, 'Monday', '6 PM', 'Beginner Level Class'),
(3, 'Tuesday', '5 PM', 'Advanced Level Class'),
(4, 'Thursday', '5 PM', 'Advanced Level Class');

-- --------------------------------------------------------

--
-- Table structure for table `fee`
--

CREATE TABLE IF NOT EXISTS `fee` (
  `fee_receipt_num` varchar(255) NOT NULL,
  `fee_amount` int(255) NOT NULL,
  `fee_description` varchar(255) NOT NULL,
  `fee_date` date NOT NULL,
  `stud_num` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee`
--

INSERT INTO `fee` (`fee_receipt_num`, `fee_amount`, `fee_description`, `fee_date`, `stud_num`) VALUES
('#FR080', 220, 'For Extra Classes in Vacation', '2015-05-06', 1),
('#FR081', 1256, 'Fees Paid for Advanced Level Class & Tests', '2010-03-05', 2),
('#FR082', 409, 'For extra training and protein shake', '2011-08-09', 3),
('#FR083', 1742, 'For Test and Karate Kit', '2014-04-09', 4),
('#FR084', 645, 'Going out for trip and learning from workshop', '2016-01-04', 5),
('#FR085', 2543, 'For protein intakes, hoodie, belts and much more.', '2009-01-05', 6),
('#FR086', 4761, 'For International Karate Trip', '2015-03-07', 7),
('#FR087', 1908, 'For Swags and Extra Training', '2003-08-12', 8),
('#FR088', 2910, 'For extra lectures and training workshop', '2016-01-03', 9),
('#FR089', 2415, 'For monthly fees', '2013-01-14', 10);

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE IF NOT EXISTS `meeting` (
  `meet_num` int(255) NOT NULL,
  `meet_date` date NOT NULL,
  `class_num` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `memberID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dateofbirth` date NOT NULL,
  `phonenumber` int(15) NOT NULL,
  `stud_join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `active` varchar(255) NOT NULL,
  `resetToken` varchar(255) DEFAULT NULL,
  `resetComplete` varchar(3) DEFAULT 'No'
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`memberID`, `username`, `fullname`, `password`, `email`, `dateofbirth`, `phonenumber`, `stud_join_date`, `address1`, `address2`, `active`, `resetToken`, `resetComplete`) VALUES
(17, 'unnitmetaliya', 'Unnit Metaliya', '$2y$10$2zxv4q/zoZ/UmGILZdMwBOkxOvx12PpFnlINOonCl1rjYJE0KKR4O', 'unnitjmetaliya@gmail.com', '1995-07-24', 2147483647, '2017-04-11 03:26:15', '316, Josephine Avenue,', 'Windsor, Ontario, N9B 2L1', 'Yes', NULL, 'No'),
(2, 'chiragpatel', 'Chirag Patel', 'S¼\r•3ÁjkÑ oÙ', 'chiragpatel@gmail.com', '1995-05-23', 519992835, '2017-04-10 07:00:00', '423, Pete Street, Windsor', 'Ontario, N9T 2O1', 'Yes', NULL, 'No'),
(3, 'vishalmodi', 'Vishal Modi', '€T4J¸9}<', 'vishalmodi@gmail.com', '1992-04-06', 412421543, '2017-04-10 07:00:00', '123, Sector T,', 'Toronto, Ontario, O51 BT6', '', NULL, 'No'),
(4, 'jackbrown', 'Jack Brown', 'åæÓË53Š{ƒø8®4ô', 'jackbrown@gmail.com', '1990-09-14', 51534312, '2017-04-11 02:31:00', '412, Hert Street, Detroit,', 'Michigan, 6TY 5RT', '', NULL, 'No'),
(5, 'trushapatel', 'Trusha Patel', 'åæÓË53Š{ƒø8®4ô', 'trushapatel@hotmail.com', '1993-02-02', 989837036, '2017-04-11 02:33:37', '167, Garima Park,', 'Adajan, Surat, 364120', '', NULL, 'No'),
(6, 'kunalpatel', 'Kunal Patel', '€1 £ÚMçòOEŸWÅcˆS', 'kunalpatel@gmail.com', '1995-06-02', 512542112, '2017-04-10 23:07:51', '415, Joe Street, Windsor', 'Ontario, T56 BG2', '', NULL, 'No'),
(7, 'jaydeepshah', 'Jaydeep Shah', '€T4J¸9}<', 'jaydeepshah@gmail.com', '1994-12-09', 412521521, '2017-04-11 02:30:49', '51, Hirabag Circle,', 'Varacha, Surat, 365104', '', NULL, 'No'),
(8, 'kishanterani', 'Kishan Terani', '€T4J¸9}<', 'kishanterani@gmail.com', '1995-04-05', 869063976, '0000-00-00 00:00:00', '123, Some Apartment', 'Some Street, Surat - 341109', '', NULL, 'No'),
(9, 'jiyakhan', 'Jiya Khan', '€T4J¸9}<', 'jiyakhan@gmail.com', '1991-08-11', 412521214, '2017-04-11 02:43:36', '143, Kole Bahar,', 'Agartala, Kuwait - 90B 2OP', '', NULL, 'No'),
(10, 'erikaroberts', 'Erika Roberts', '€T4J¸9}<', 'erikaroberts@gmail.com', '1989-02-01', 521542122, '0000-00-00 00:00:00', '45, Lopa Lobby,', 'Terrain Road, 091321', '', NULL, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE IF NOT EXISTS `parents` (
  `parentID` int(11) NOT NULL,
  `fathername` varchar(255) NOT NULL,
  `fatheremail` varchar(255) NOT NULL,
  `fathermobile` varchar(255) NOT NULL,
  `mothername` varchar(255) NOT NULL,
  `motheremail` varchar(255) DEFAULT NULL,
  `mothermobile` varchar(255) NOT NULL,
  `parentstudent` varchar(255) NOT NULL,
  `student_num` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`parentID`, `fathername`, `fatheremail`, `fathermobile`, `mothername`, `motheremail`, `mothermobile`, `parentstudent`, `student_num`) VALUES
(1, 'Jagdishbhai Metaliya', 'jpmetaliya@gmail.com', '9925823171', 'Madhuben Metaliya', 'mjmetaliya@gmail.com', '9726180292', 'Yes', 1),
(2, 'Raman Shah', 'ramanshah@gmail.com', '6542142213', 'Reema Shah', 'reemashah@gmail.com', '5123213134', 'No', 2),
(3, 'Tera Honeka', 'terahoneka@gmail.com', '5322314141', 'Sabse Badi', 'sabsebadi@gmail.com', '9423142491', 'Yes', 3),
(4, 'Kundan Singh', 'kundansingh@gmail.com', '6324321235', 'Urmila Singh', 'urmilasingh@gmail.com', '5212231234', 'No', 4),
(5, 'Yatra Safal', 'yatrasafal@gmail.com', '5139021234', 'Garima Shah', 'garimashah@gmail.com', '6732422121', 'No', 5),
(6, 'Vijay Ghelani', 'vijayghelani@gmail.com', '5412312323', 'Rama Ghelani', 'ramaghelani@gmail.com', '5321236421', 'Yes', 6),
(7, 'Ghano Pathan', 'ghanopathan@gmail.com', '6271235312', 'Heena Pathan', 'heenapathan@gmail.com', '8923422141', 'Yes', 7);

-- --------------------------------------------------------

--
-- Table structure for table `rank`
--

CREATE TABLE IF NOT EXISTS `rank` (
  `rank_num` int(11) NOT NULL,
  `rank_points` varchar(100) NOT NULL,
  `rank_name` varchar(100) NOT NULL,
  `rank_belt` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rank`
--

INSERT INTO `rank` (`rank_num`, `rank_points`, `rank_name`, `rank_belt`) VALUES
(1, '0', 'Novice', 'No Belt'),
(2, '1', 'Novice', 'White'),
(3, '2', 'Novice', 'Yellow'),
(4, '2.5', 'Novice', 'Yellow Black'),
(5, '3', 'Novice', 'Green'),
(6, '3.5', 'Novice', 'Green Black'),
(7, '4', 'Intermediate', 'Purple'),
(8, '4.5', 'Intermediate', 'Purple Black'),
(9, '5', 'Intermediate', 'Orange'),
(10, '5.5', 'Intermediate', 'Orange Black'),
(11, '6', 'Intermediate', 'Blue'),
(12, '6.5', 'Intermediate', 'Blue Black'),
(13, '7', 'Intermediate', 'Brown'),
(14, '7.5', 'Intermediate', 'Brown Black'),
(15, '8', 'Intermediate', 'Red'),
(16, '8.5', 'Intermediate', 'Red Black'),
(17, '9', 'Advanced', 'Black');

-- --------------------------------------------------------

--
-- Table structure for table `requirement`
--

CREATE TABLE IF NOT EXISTS `requirement` (
  `req_num` int(255) NOT NULL,
  `req_description` varchar(100) NOT NULL,
  `rank_num` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requirement`
--

INSERT INTO `requirement` (`req_num`, `req_description`, `rank_num`) VALUES
(1, 'Need to learn basic tricks', '1'),
(2, 'Little more than basic tricks', '2'),
(3, 'Some intermediate level tricks', '3'),
(4, 'Some more intermediate level tricks', '4'),
(5, 'Purely intermediate skills', '5'),
(6, 'Need excellent kicking skills', '6'),
(7, 'Kicking as well as punching skills', '7'),
(8, 'Round kicks and power punches', '8'),
(9, 'Above average in all terms of karate and fight tricks', '9'),
(10, 'Need to have basic knowledge about opponents'' strength. Should posses excellent fighting skills', '10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attain`
--
ALTER TABLE `attain`
  ADD PRIMARY KEY (`stud_num`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`stud_num`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_num`);

--
-- Indexes for table `fee`
--
ALTER TABLE `fee`
  ADD PRIMARY KEY (`fee_receipt_num`);

--
-- Indexes for table `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`meet_num`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`memberID`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`parentID`);

--
-- Indexes for table `rank`
--
ALTER TABLE `rank`
  ADD PRIMARY KEY (`rank_num`);

--
-- Indexes for table `requirement`
--
ALTER TABLE `requirement`
  ADD PRIMARY KEY (`req_num`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attain`
--
ALTER TABLE `attain`
  MODIFY `stud_num` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `stud_num` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_num` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `meeting`
--
ALTER TABLE `meeting`
  MODIFY `meet_num` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `memberID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `parentID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `rank`
--
ALTER TABLE `rank`
  MODIFY `rank_num` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `requirement`
--
ALTER TABLE `requirement`
  MODIFY `req_num` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
