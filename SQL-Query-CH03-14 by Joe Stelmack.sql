-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2019 at 08:51 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wp`
--

-- --------------------------------------------------------

--
-- Table structure for table `EMPLOYEE`
--

CREATE TABLE `employee` (
  `EmployeeNumber` int(11) NOT NULL,
  `FirstName` char(25) NOT NULL,
  `LastName` char(25) NOT NULL,
  `Department` char(35) NOT NULL DEFAULT 'Human Resources',
  `Position` char(35) DEFAULT NULL,
  `Supervisor` int(11) DEFAULT NULL,
  `OfficePhone` char(12) DEFAULT NULL,
  `EmailAddress` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `EMPLOYEE`
--

INSERT INTO `EMPLOYEE` (`FirstName`, `LastName`, `Department`, `OfficePhone`) VALUES
('Tom', 'Caruthers', 'Accounting', '360-285-8430');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD PRIMARY KEY (`EmployeeNumber`),
  ADD UNIQUE KEY `EmailAddress` (`EmailAddress`),
  ADD KEY `EMP_DEPART_FK` (`Department`),
  ADD KEY `EMP_SUPER_FK` (`Supervisor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  MODIFY `EmployeeNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD CONSTRAINT `EMP_DEPART_FK` FOREIGN KEY (`Department`) REFERENCES `department` (`DepartmentName`) ON UPDATE CASCADE,
  ADD CONSTRAINT `EMP_SUPER_FK` FOREIGN KEY (`Supervisor`) REFERENCES `employee` (`EmployeeNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
