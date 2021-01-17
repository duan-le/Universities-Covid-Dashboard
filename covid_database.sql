-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 06, 2021 at 10:18 PM
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
-- Database: `covid database`
--

-- --------------------------------------------------------

--
-- Table structure for table `mcgill`
--

CREATE TABLE `mcgill` (
  `province` varchar(30) NOT NULL,
  `uni_Name` varchar(30) DEFAULT NULL,
  `cases` decimal(6,0) DEFAULT NULL,
  `cdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ubc`
--

CREATE TABLE `ubc` (
  `province` varchar(30) NOT NULL,
  `uni_Name` varchar(30) DEFAULT NULL,
  `cases` decimal(6,0) DEFAULT NULL,
  `cdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `umanitoba`
--

CREATE TABLE `umanitoba` (
  `province` varchar(30) NOT NULL,
  `uni_Name` varchar(30) DEFAULT NULL,
  `cases` decimal(6,0) DEFAULT NULL,
  `cdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `uni_Name` varchar(30) NOT NULL,
  `location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`uni_Name`, `location`) VALUES
('University of Calgary', 'Somewhere');

-- --------------------------------------------------------

--
-- Table structure for table `uofc`
--

CREATE TABLE `uofc` (
  `province` varchar(30) NOT NULL,
  `uni_Name` varchar(30) DEFAULT NULL,
  `cases` decimal(6,0) DEFAULT NULL,
  `cdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uofc`
--

INSERT INTO `uofc` (`province`, `uni_Name`, `cases`, `cdate`) VALUES
('Alberta', 'University of Calgary', '10', '2021-01-06');

-- --------------------------------------------------------

--
-- Table structure for table `uofs`
--

CREATE TABLE `uofs` (
  `province` varchar(30) NOT NULL,
  `uni_Name` varchar(30) DEFAULT NULL,
  `cases` decimal(6,0) DEFAULT NULL,
  `cdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uoft`
--

CREATE TABLE `uoft` (
  `province` varchar(30) NOT NULL,
  `uni_Name` varchar(30) DEFAULT NULL,
  `cases` decimal(6,0) DEFAULT NULL,
  `cdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mcgill`
--
ALTER TABLE `mcgill`
  ADD PRIMARY KEY (`province`),
  ADD KEY `uni_Name` (`uni_Name`);

--
-- Indexes for table `ubc`
--
ALTER TABLE `ubc`
  ADD PRIMARY KEY (`province`),
  ADD KEY `uni_Name` (`uni_Name`);

--
-- Indexes for table `umanitoba`
--
ALTER TABLE `umanitoba`
  ADD PRIMARY KEY (`province`),
  ADD KEY `uni_Name` (`uni_Name`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`uni_Name`);

--
-- Indexes for table `uofc`
--
ALTER TABLE `uofc`
  ADD PRIMARY KEY (`province`),
  ADD KEY `uni_Name` (`uni_Name`);

--
-- Indexes for table `uofs`
--
ALTER TABLE `uofs`
  ADD PRIMARY KEY (`province`),
  ADD KEY `uni_Name` (`uni_Name`);

--
-- Indexes for table `uoft`
--
ALTER TABLE `uoft`
  ADD PRIMARY KEY (`province`),
  ADD KEY `uni_Name` (`uni_Name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mcgill`
--
ALTER TABLE `mcgill`
  ADD CONSTRAINT `mcgill_ibfk_1` FOREIGN KEY (`uni_Name`) REFERENCES `universities` (`uni_Name`);

--
-- Constraints for table `ubc`
--
ALTER TABLE `ubc`
  ADD CONSTRAINT `ubc_ibfk_1` FOREIGN KEY (`uni_Name`) REFERENCES `universities` (`uni_Name`);

--
-- Constraints for table `umanitoba`
--
ALTER TABLE `umanitoba`
  ADD CONSTRAINT `umanitoba_ibfk_1` FOREIGN KEY (`uni_Name`) REFERENCES `universities` (`uni_Name`);

--
-- Constraints for table `uofc`
--
ALTER TABLE `uofc`
  ADD CONSTRAINT `uofc_ibfk_1` FOREIGN KEY (`uni_Name`) REFERENCES `universities` (`uni_Name`);

--
-- Constraints for table `uofs`
--
ALTER TABLE `uofs`
  ADD CONSTRAINT `uofs_ibfk_1` FOREIGN KEY (`uni_Name`) REFERENCES `universities` (`uni_Name`);

--
-- Constraints for table `uoft`
--
ALTER TABLE `uoft`
  ADD CONSTRAINT `uoft_ibfk_1` FOREIGN KEY (`uni_Name`) REFERENCES `universities` (`uni_Name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
