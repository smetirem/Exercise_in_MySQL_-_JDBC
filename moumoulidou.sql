-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 15, 2022 at 06:55 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moumoulidou`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int(11) NOT NULL,
  `title` varchar(15) NOT NULL,
  `type` varchar(20) NOT NULL,
  `description` varchar(70) NOT NULL,
  `semester` enum('11','22','33','44') NOT NULL,
  `ecp` int(2) NOT NULL,
  `user_tc` int(10) NOT NULL,
  UNIQUE KEY `course_id` (`course_id`,`user_tc`) USING BTREE,
  KEY `use_tc` (`user_tc`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `title`, `type`, `description`, `semester`, `ecp`, `user_tc`) VALUES
(1, 'Mathematics', 'Optional', 'Description 1', '11', 25, 57),
(2, 'Physics', 'Mandatory', 'Description 2', '22', 22, 57),
(3, 'Chemistry', 'Optional', ' Description 3 ', '33', 10, 51),
(4, 'Informatics', 'Mandatory', 'Description 4', '44', 20, 58);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
CREATE TABLE IF NOT EXISTS `enrollment` (
  `enrollment_id` int(10) NOT NULL AUTO_INCREMENT,
  `grade` int(2) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `user_fk` int(10) NOT NULL,
  `course_fk` int(11) NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  KEY `user_fk` (`user_fk`),
  KEY `course_fk` (`course_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`enrollment_id`, `grade`, `status`, `user_fk`, `course_fk`) VALUES
(3, 8, 'Completed', 3, 2),
(5, 9, 'Completed', 6, 3),
(6, 5, 'Completed', 9, 2),
(7, 5, ' Completed', 4, 1),
(8, 4, 'On Going', 9, 1),
(9, 0, 'On Going', 6, 2),
(10, 0, 'On Going', 3, 1),
(11, 5, 'On Going', 8, 1),
(13, 0, 'On Going', 63, 4),
(14, 9, 'Completed', 3, 3),
(15, 7, 'Completed', 6, 1),
(16, 5, 'Completed', 9, 4),
(17, 6, 'Completed ', 4, 3),
(18, 0, 'On Going ', 9, 3),
(21, 0, 'On Going ', 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
CREATE TABLE IF NOT EXISTS `semester` (
  `semester_id` int(2) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `user_fk` int(10) NOT NULL,
  PRIMARY KEY (`semester_id`,`user_fk`),
  KEY `user_fk` (`user_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`semester_id`, `semester`, `user_fk`) VALUES
(1, '1', 7),
(2, '2', 3),
(3, '3', 4),
(4, '3', 6),
(5, '5', 8),
(6, '6', 9),
(8, '8', 62);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(15) NOT NULL,
  `role` varchar(25) NOT NULL,
  `mobile` int(14) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `registry` int(15) NOT NULL,
  `registration_date` date NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password` (`password`),
  UNIQUE KEY `registry` (`registry`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `last_name`, `email`, `password`, `role`, `mobile`, `address`, `registry`, `registration_date`) VALUES
(3, 'Konstantinos', 'Karras ', 'kk@eap.gr', '11111111', 'Student', 695847125, 'Address 1', 1111, '2021-02-25'),
(4, 'Marios', 'Alevras', 'aa@eap.gr', '22222222', 'Student', 693214568, '  Address 2  ', 2222, '2021-02-25'),
(6, 'Maria', 'Krasa', 'mk@eap.gr', '33333333', 'Student', 693214111, 'Address 3', 3333, '2021-02-25'),
(7, 'Afroditi', 'Koumeli', 'ak@eap.gr', '44444444', 'Student', 693241114, 'Address 4', 4444, '2021-02-25'),
(8, 'Menelaos', 'Zotos', 'mz@eap.gr', '55555555', 'Student', 693994568, 'Address 5', 5555, '2021-02-25'),
(9, 'Ioannis', 'Grivas', 'ig@eap.gr', '66666666', 'Student', 693214222, 'Address 6', 6666, '2021-02-25'),
(40, 'Alexandros', 'Papasotitiou', 'ap@eap.gr', '77777777', 'Professor', 695441267, 'Address 7', 7777, '2021-03-18'),
(51, 'Eudokia', 'Roumelioti', 'er@eap.gr', '88888888', 'Professor', 695412367, 'Address 8', 8888, '2021-03-18'),
(56, 'Xariklia', 'Lagoydaki', 'xl@eap.gr ', '10110111', 'Administrator', 693256521, '  Address 11  ', 1011, '2021-03-18'),
(57, 'Nikolaos', 'Stauroy', 'ns@eap.gr', '99999999', 'Professor', 699652241, '   Address 9   ', 9999, '2021-03-18'),
(58, 'Chrisi', 'Markoulaki', 'xm@eap.gr', '10101010', 'Professor', 695412698, 'Address 10', 1010, '2021-03-18'),
(60, 'Ioannis', 'Prokopidis', 'pp@eap.gr', '10120222', 'Administrator', 693256444, 'Address 12', 1012, '2021-03-18'),
(61, 'Eleni', 'Kararitaki', 'eek@eap.gr', '10131313', 'Professor', 693256554, 'Address 13', 1313, '2021-03-22'),
(62, 'Evaggelos', 'Pappas', 'ep@eap.gr', ' 14141414 ', 'Student', 697412554, ' Address 14 ', 1414, '2021-03-23'),
(63, 'Konstantinos', 'Karras ', 'kk_@eap.gr', '11110000', 'Student', 695847133, 'Address 50', 1100, '2021-02-25');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`user_tc`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course_fk`) REFERENCES `courses` (`course_id`) ON UPDATE CASCADE;

--
-- Constraints for table `semester`
--
ALTER TABLE `semester`
  ADD CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
