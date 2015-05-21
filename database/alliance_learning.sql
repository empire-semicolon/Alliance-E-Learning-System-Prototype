-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2015 at 02:40 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses_assigned`
--

CREATE TABLE IF NOT EXISTS `courses_assigned` (
  `assignmentId` int(11) NOT NULL,
  `user_details_userId` int(11) NOT NULL,
  `course_courseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses_assigned`
--

INSERT INTO `courses_assigned` (`assignmentId`, `user_details_userId`, `course_courseId`) VALUES
(1, 20158288, 222),
(2, 20158288, 111),
(3, 20158288, 444),
(4, 20158288, 555);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses_assigned`
--
ALTER TABLE `courses_assigned`
  ADD PRIMARY KEY (`assignmentId`), ADD KEY `fk_courses_taken_user_details1_idx` (`user_details_userId`), ADD KEY `fk_courses_taken_course1_idx` (`course_courseId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses_assigned`
--
ALTER TABLE `courses_assigned`
ADD CONSTRAINT `fk_courses_taken_course1` FOREIGN KEY (`course_courseId`) REFERENCES `course` (`courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_courses_taken_user_details1` FOREIGN KEY (`user_details_userId`) REFERENCES `user_details` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
