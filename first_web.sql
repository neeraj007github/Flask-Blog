-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2020 at 09:29 AM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `first_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(10) NOT NULL,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `msg` text NOT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone`, `msg`, `time`) VALUES
(1, 'neeraj', 'nnnn@nee.com', '1212121212', 'this is first', '2020-09-01 10:19:30'),
(2, 'NEERAJ PATEL', 'neermtech@gmail.com', '12312131213', 'gfghfhkkhgkj', NULL),
(3, 'NEERAJ PATEL', 'neermtech@gmail.com', '12312131213', 'gfghfhkkhgkj', '2020-09-01 13:35:15'),
(4, 'Sangeeta', 'hgfghfhgf@gmp.com', '2222222222', 'how r you ???', '2020-09-01 17:23:38'),
(5, 'Sangeeta', 'hgfghfhgf@gmp.com', '2222222222', 'how r you ???', '2020-09-09 10:21:07'),
(6, 'neeraj', 'neeraj2020mtech@gmail.com', '12312131213', 'jhjh', '2020-09-12 18:40:58'),
(7, 'neeraj', 'neeraj2020mtech@gmail.com', '12312131213', 'jhjh', '2020-09-13 11:13:02'),
(8, '', '', '', '', '2020-09-13 11:13:08'),
(9, 'neeraj', 'neeraj2020mtech@gmail.com', '2222222222', 'kjgj', '2020-09-13 11:13:30'),
(10, '', '', '', '', '2020-09-27 19:56:35'),
(11, 'kjk', 'neeraj2020mtech@gmail.com', '2222222222', 'jh', '2020-09-28 21:10:23');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `SNO` int(10) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `title` text NOT NULL,
  `content` varchar(500) NOT NULL,
  `Posted_By` text NOT NULL,
  `img_file` varchar(50) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`SNO`, `slug`, `title`, `content`, `Posted_By`, `img_file`, `date`) VALUES
(1, 'slug1', 'first post test', 'This is test post, this comes m DB', 'Neeraj', 'post-bg.jpg', '2020-10-23 16:52:38'),
(2, 'ss', 'Second is second', 'Now the user has to select the Data plan or enter the recharge amount manualy. Make payment using the MobiKwik wallet or the debit/credit card and the BS', 'Neeraj p.', '2.jpg', '2020-10-24 15:10:53'),
(3, '3', 'Jinja2 Tutorial - Part 2', 'sqlalchemy.exc.OperationalError: (MySQLdb._exceptions.OperationalError) (1366, "Incorrect string value: \'\\\\xE0\\\\xA4\\\\x95\\\\xE0\\\\xA5\\\\x8D...\' for column \'content\' at row 1")', 'nmk', '3.jpg', '2020-10-24 15:37:35'),
(4, 'slug4', 'Random Drawings', 'Q3.1 in the FAQ explains how to pick a winner for your giveaway for FREE\r\nThird-Party Draw Service is the premier solution to holding random drawings online\r\nStep by Step Guide explains how to hold a drawing with the Third-Party Draw Service\r\nStep by Step Video shows how to hold a drawing with the Third-Party Draw Service\r\nPrice Calculator tells exactly how much your drawing will cost\r\nDrawing FAQ answers common questions about holding drawings\r\nPublic Records shows all complet', 'random', '4.jpg', '2020-09-26 15:15:22'),
(5, 's5', 'Games and Lotteries', 'Lottery Quick Pick is perhaps the Internet\'s most popular with over 280 lotteries\r\nKeno Quick Pick for the popular game played in many countries\r\nCoin Flipper will give you heads or tails in many currencies\r\nDice Roller does exactly what it says on the tin\r\nPlaying Card Shuffler will draw cards from multiple shuffled decks\r\nBirdie Fund Generator will create birdie holes for golf courses\r\n', 'gilf', '5.jpg', '2020-09-26 15:15:22'),
(7, '12', 'Sangeeta', 'i m joker for chokar', 'naam nothing', '3.jpg', '2020-09-30 15:10:54'),
(8, '665565', 'James bond', '7 data plan will last you for days. When you\'ve exhausted your bandwidth, quickly and easily do BSNL net recharge or browse for other internet tariff plans in U', '', '', '2020-10-24 15:12:17'),
(9, 'gf', 'vh', 'gf', 'gf', 'hg', '2020-09-30 15:18:07'),
(10, 'gh', 'test last', 'kjygugiuglhlkh;', 'skp', '', '2020-10-23 15:36:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`SNO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `SNO` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
