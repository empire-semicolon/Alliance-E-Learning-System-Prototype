-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2015 at 02:30 PM
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
-- Table structure for table `business_unit`
--

CREATE TABLE IF NOT EXISTS `business_unit` (
  `businessUnitId` int(11) NOT NULL,
  `businessUnit` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `business_unit`
--

INSERT INTO `business_unit` (`businessUnitId`, `businessUnit`) VALUES
(1, 'Japan'),
(2, 'North America'),
(3, 'North America'),
(4, 'Rest of the World');

-- --------------------------------------------------------

--
-- Table structure for table `chapter`
--

CREATE TABLE IF NOT EXISTS `chapter` (
  `chapterId` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `course_courseId` int(11) NOT NULL,
  `chapterNumber` int(11) NOT NULL,
  `chapterTitle` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chapter`
--

INSERT INTO `chapter` (`chapterId`, `description`, `course_courseId`, `chapterNumber`, `chapterTitle`) VALUES
(11, 'Course 1 Chapter 1', 111, 1, 'Title 1'),
(12, 'Course 1 Chapter 2', 222, 2, 'Title 2');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `courseId` int(11) NOT NULL,
  `courseTitle` varchar(50) NOT NULL,
  `courseDescription` longtext NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastEdited` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_details_trainer` int(11) NOT NULL,
  `course_category_courseCategoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseId`, `courseTitle`, `courseDescription`, `dateCreated`, `lastEdited`, `user_details_trainer`, `course_category_courseCategoryId`) VALUES
(111, 'J2EE - Spring / Hibernate', 'This is a sample outline', '2015-05-15 21:53:08', '2015-05-15 03:51:03', 20151234, 1),
(222, 'Project Management', 'This is a sample outline', '2015-05-15 21:53:08', '2015-05-15 03:51:03', 20151234, 2),
(333, 'Design Patterns', 'This is a sample outline', '2015-05-15 21:53:08', '2015-05-15 03:51:03', 20151234, 3),
(444, 'Servlets', 'This is a sample outline', '2015-05-15 21:53:08', '2015-05-15 03:51:03', 20151234, 4),
(555, 'Java Server Pages', 'This is a sample outline', '2015-05-15 21:53:08', '2015-05-15 03:51:03', 20151234, 5);

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
(1, 20151234, 111),
(2, 20151234, 222);

-- --------------------------------------------------------

--
-- Table structure for table `course_category`
--

CREATE TABLE IF NOT EXISTS `course_category` (
  `courseCategoryId` int(11) NOT NULL,
  `courseCategory` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_category`
--

INSERT INTO `course_category` (`courseCategoryId`, `courseCategory`) VALUES
(1, 'Category 1'),
(2, 'Category 2'),
(3, 'Category 3'),
(4, 'Category 4'),
(5, 'Category 5');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE IF NOT EXISTS `exam` (
  `examId` int(11) NOT NULL,
  `examTitle` varchar(50) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateEdited` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `questionDetails` longtext NOT NULL,
  `numQuestions` int(11) NOT NULL,
  `course_courseId` int(11) NOT NULL,
  `examStart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `examDue` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `timeLimit` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`examId`, `examTitle`, `dateCreated`, `dateEdited`, `questionDetails`, `numQuestions`, `course_courseId`, `examStart`, `examDue`, `timeLimit`) VALUES
(1, 'Spring Exam', '2015-05-21 00:35:26', '2015-05-21 00:16:52', '', 5, 111, '2015-05-22 20:08:05', '2015-05-21 16:00:00', 60),
(2, 'HIbernate Exam', '2015-05-21 00:35:46', '2015-05-21 00:16:52', '', 10, 222, '2015-05-29 03:20:15', '2015-05-29 02:16:30', 60);

-- --------------------------------------------------------

--
-- Table structure for table `exam_scores`
--

CREATE TABLE IF NOT EXISTS `exam_scores` (
  `examScoresId` int(11) NOT NULL,
  `exam_examId` int(11) NOT NULL,
  `dateTaken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `score` int(11) NOT NULL,
  `max_score` int(11) NOT NULL,
  `user_details_userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exam_scores`
--

INSERT INTO `exam_scores` (`examScoresId`, `exam_examId`, `dateTaken`, `score`, `max_score`, `user_details_userId`) VALUES
(1, 1, '2015-05-21 00:43:28', 26, 30, 20151234);

-- --------------------------------------------------------

--
-- Table structure for table `presentation`
--

CREATE TABLE IF NOT EXISTS `presentation` (
  `presentationId` int(11) NOT NULL,
  `fileName` varchar(45) NOT NULL,
  `fileType` varchar(45) NOT NULL,
  `fileSize` double NOT NULL,
  `filePath` longtext NOT NULL,
  `description` longtext NOT NULL,
  `dateUploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `recordStatus` tinyint(1) NOT NULL DEFAULT '1',
  `chapter_chapterId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `presentation`
--

INSERT INTO `presentation` (`presentationId`, `fileName`, `fileType`, `fileSize`, `filePath`, `description`, `dateUploaded`, `recordStatus`, `chapter_chapterId`) VALUES
(11, 'Course 1 Chapter 1 Presentation', 'PDF', 23, 'sample file path', 'Course 1 Chapter 1 Presentation', '2015-05-15 03:57:51', 1, 11),
(12, 'Chapter 2', 'Test File Type', 6.123, 'Test File Path', 'Test Description', '2015-05-17 04:41:00', 1, 11),
(13, 'Update File Name', 'Update File Type', 69, 'Update File Path', 'Update Description', '2015-05-17 05:00:50', 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `userId` int(11) NOT NULL,
  `userName` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `middleName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `position` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `recordStatus` tinyint(1) NOT NULL DEFAULT '1',
  `user_type_userTypeId` int(11) NOT NULL,
  `business_unit_businessUnitId` int(11) NOT NULL,
  `companyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`userId`, `userName`, `password`, `firstName`, `middleName`, `lastName`, `birthday`, `position`, `email`, `dateCreated`, `recordStatus`, `user_type_userTypeId`, `business_unit_businessUnitId`, `companyId`) VALUES
(20151234, 'kimagustin', 'alliance@123', 'Kim', 'A.', 'Agustine', '1993-04-21', 'Senior Developer', 'kimagustin@gmail.com', '2015-05-16 23:10:17', 1, 0, 1, 20151234),
(20152312, 'tomas', 'test', 'Thomas', 'S.', 'Santella', '1993-09-21', 'Senior Developer', 'tomas@gmail.com', '2015-05-16 22:37:51', 1, 2, 2, 20152312),
(20155432, 'markfernandez', 'test', 'Mark', 'F.', 'Fernandez', '1993-08-28', 'Senior Developer', 'markfernandez@gmail.com', '2015-05-16 22:46:43', 1, 1, 1, 20155432),
(20158288, 'bcabansay', 'alliance@123', 'Bryan Agustine', 'C.', 'Cabansay', '1988-08-28', 'Junior Developer', 'blaire2985@gmail.com', '2015-05-16 22:38:12', 1, 2, 3, 20158288);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
  `userTypeId` int(11) NOT NULL,
  `userType` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`userTypeId`, `userType`) VALUES
(0, 'Admin'),
(1, 'Trainer'),
(2, 'Trainee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business_unit`
--
ALTER TABLE `business_unit`
  ADD PRIMARY KEY (`businessUnitId`);

--
-- Indexes for table `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`chapterId`), ADD KEY `fk_chapter_course1_idx` (`course_courseId`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseId`), ADD KEY `fk_course_course_category1_idx` (`course_category_courseCategoryId`), ADD KEY `fk_course_user_details1_idx` (`user_details_trainer`);

--
-- Indexes for table `courses_assigned`
--
ALTER TABLE `courses_assigned`
  ADD PRIMARY KEY (`assignmentId`), ADD KEY `fk_courses_taken_user_details1_idx` (`user_details_userId`), ADD KEY `fk_courses_taken_course1_idx` (`course_courseId`);

--
-- Indexes for table `course_category`
--
ALTER TABLE `course_category`
  ADD PRIMARY KEY (`courseCategoryId`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`examId`), ADD KEY `fk_exam_course1_idx` (`course_courseId`);

--
-- Indexes for table `exam_scores`
--
ALTER TABLE `exam_scores`
  ADD PRIMARY KEY (`examScoresId`), ADD KEY `fk_exam_scores_user_details1_idx` (`user_details_userId`), ADD KEY `fk_exam_scores_exam1` (`exam_examId`);

--
-- Indexes for table `presentation`
--
ALTER TABLE `presentation`
  ADD PRIMARY KEY (`presentationId`), ADD KEY `fk_presentation_chapter1_idx` (`chapter_chapterId`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`userId`), ADD UNIQUE KEY `userName_UNIQUE` (`userName`), ADD KEY `fk_user_details_user_type1_idx` (`user_type_userTypeId`), ADD KEY `fk_user_details_business_unit1_idx` (`business_unit_businessUnitId`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`userTypeId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chapter`
--
ALTER TABLE `chapter`
ADD CONSTRAINT `fk_chapter_course1` FOREIGN KEY (`course_courseId`) REFERENCES `course` (`courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
ADD CONSTRAINT `fk_course_course_category1` FOREIGN KEY (`course_category_courseCategoryId`) REFERENCES `course_category` (`courseCategoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_course_user_details1` FOREIGN KEY (`user_details_trainer`) REFERENCES `user_details` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `courses_assigned`
--
ALTER TABLE `courses_assigned`
ADD CONSTRAINT `fk_courses_taken_course1` FOREIGN KEY (`course_courseId`) REFERENCES `course` (`courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_courses_taken_user_details1` FOREIGN KEY (`user_details_userId`) REFERENCES `user_details` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
ADD CONSTRAINT `fk_exam_course1` FOREIGN KEY (`course_courseId`) REFERENCES `course` (`courseId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `exam_scores`
--
ALTER TABLE `exam_scores`
ADD CONSTRAINT `fk_exam_scores_exam1` FOREIGN KEY (`exam_examId`) REFERENCES `exam` (`examId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_exam_scores_user_details1` FOREIGN KEY (`user_details_userId`) REFERENCES `user_details` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `presentation`
--
ALTER TABLE `presentation`
ADD CONSTRAINT `fk_presentation_chapter1` FOREIGN KEY (`chapter_chapterId`) REFERENCES `chapter` (`chapterId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
ADD CONSTRAINT `fk_user_details_business_unit1` FOREIGN KEY (`business_unit_businessUnitId`) REFERENCES `business_unit` (`businessUnitId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_user_details_user_type1` FOREIGN KEY (`user_type_userTypeId`) REFERENCES `user_type` (`userTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
