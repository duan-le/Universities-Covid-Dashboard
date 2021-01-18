-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 18, 2021 at 12:43 AM
-- Server version: 8.0.17
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
-- Database: `university_covid`
--

-- --------------------------------------------------------

--
-- Table structure for table `alberta`
--

CREATE TABLE `alberta` (
  `university_name` varchar(30) NOT NULL,
  `cases` varchar(30) DEFAULT NULL,
  `date_range` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `british_columbia`
--

CREATE TABLE `british_columbia` (
  `university_name` varchar(30) NOT NULL,
  `cases` varchar(30) DEFAULT NULL,
  `date_range` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manitoba`
--

CREATE TABLE `manitoba` (
  `university_name` varchar(30) NOT NULL,
  `cases` varchar(30) DEFAULT NULL,
  `date_range` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ontario`
--

CREATE TABLE `ontario` (
  `university_name` varchar(30) NOT NULL,
  `cases` varchar(30) DEFAULT NULL,
  `date_range` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quebec`
--

CREATE TABLE `quebec` (
  `university_name` varchar(30) NOT NULL,
  `cases` varchar(30) DEFAULT NULL,
  `date_range` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saskatchewan`
--

CREATE TABLE `saskatchewan` (
  `university_name` varchar(30) NOT NULL,
  `cases` varchar(30) DEFAULT NULL,
  `date_range` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `university_name` varchar(30) NOT NULL,
  `location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`university_name`, `location`) VALUES
('McGill University', '845 Sherbrooke St W, Montreal, Quebec H3A 0G4'),
('University of Calgary', '2500 University Dr NW, Calgary, AB T2N 1N4'),
('University of Manitoba', '66 Chancellors Cir, Winnipeg, MB R3T 2N2'),
('University of Toronto', '27 King\'s College Cir, Toronto, ON M5S');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alberta`
--
ALTER TABLE `alberta`
  ADD PRIMARY KEY (`date_range`,`university_name`),
  ADD KEY `university_name` (`university_name`);

--
-- Indexes for table `british_columbia`
--
ALTER TABLE `british_columbia`
  ADD PRIMARY KEY (`date_range`,`university_name`),
  ADD KEY `university_name` (`university_name`);

--
-- Indexes for table `manitoba`
--
ALTER TABLE `manitoba`
  ADD PRIMARY KEY (`date_range`,`university_name`),
  ADD KEY `university_name` (`university_name`);

--
-- Indexes for table `ontario`
--
ALTER TABLE `ontario`
  ADD PRIMARY KEY (`date_range`,`university_name`),
  ADD KEY `university_name` (`university_name`);

--
-- Indexes for table `quebec`
--
ALTER TABLE `quebec`
  ADD PRIMARY KEY (`date_range`,`university_name`),
  ADD KEY `university_name` (`university_name`);

--
-- Indexes for table `saskatchewan`
--
ALTER TABLE `saskatchewan`
  ADD PRIMARY KEY (`date_range`,`university_name`),
  ADD KEY `university_name` (`university_name`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`university_name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alberta`
--
ALTER TABLE `alberta`
  ADD CONSTRAINT `alberta_ibfk_1` FOREIGN KEY (`university_name`) REFERENCES `universities` (`university_name`);

--
-- Constraints for table `british_columbia`
--
ALTER TABLE `british_columbia`
  ADD CONSTRAINT `british_columbia_ibfk_1` FOREIGN KEY (`university_name`) REFERENCES `universities` (`university_name`);

--
-- Constraints for table `manitoba`
--
ALTER TABLE `manitoba`
  ADD CONSTRAINT `manitoba_ibfk_1` FOREIGN KEY (`university_name`) REFERENCES `universities` (`university_name`);

--
-- Constraints for table `ontario`
--
ALTER TABLE `ontario`
  ADD CONSTRAINT `ontario_ibfk_1` FOREIGN KEY (`university_name`) REFERENCES `universities` (`university_name`);

--
-- Constraints for table `quebec`
--
ALTER TABLE `quebec`
  ADD CONSTRAINT `quebec_ibfk_1` FOREIGN KEY (`university_name`) REFERENCES `universities` (`university_name`);

--
-- Constraints for table `saskatchewan`
--
ALTER TABLE `saskatchewan`
  ADD CONSTRAINT `saskatchewan_ibfk_1` FOREIGN KEY (`university_name`) REFERENCES `universities` (`university_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
