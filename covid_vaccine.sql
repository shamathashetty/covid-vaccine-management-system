-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2022 at 07:46 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `covid_vaccine`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Getdata` ()   begin 
select * from person;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `D_id` int(10) NOT NULL,
  `D_dept` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`D_id`, `D_dept`) VALUES
(1, 'staff'),
(2, 'nurse'),
(3, 'compounder'),
(4, 'surgeon');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `H_id` int(11) NOT NULL,
  `H_name` varchar(30) NOT NULL,
  `H_contactno` decimal(10,0) DEFAULT NULL,
  `H_type` char(1) NOT NULL CHECK (`H_type` = 'G' or `H_type` = 'P'),
  `H_address` varchar(20) NOT NULL,
  `H_email` varchar(30) DEFAULT NULL,
  `H_vac` varchar(20) DEFAULT NULL,
  `quant_rem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`H_id`, `H_name`, `H_contactno`, `H_type`, `H_address`, `H_email`, `H_vac`, `quant_rem`) VALUES
(110, 'cauvery', '8045678', 'G', 'EC-PHASE-1', 'CAVERY@GMAIL.COM', '100', 70),
(118, 'pes', '8845678', 'G', 'hassana', 'pesgvt@GMAIL.COM', '90', 10),
(1110, 'rns', '812578', 'p', 'kundapura', 'rnspvt@GMAIL.COM', '150', 60),
(5110, 'cityhospital', '8045618', 'G', 'bglr', 'Citz@GMAIL.COM', '100', 70);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `P_id` int(11) NOT NULL,
  `P_name` varchar(30) NOT NULL,
  `P_Gender` char(20) NOT NULL,
  `P_DOB` int(15) NOT NULL,
  `P_contactno` int(10) DEFAULT NULL,
  `P_address` varchar(6) NOT NULL,
  `P_email` varchar(30) DEFAULT NULL,
  `p_age` int(30) DEFAULT NULL,
  `H_id` int(11) DEFAULT NULL,
  `D_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`P_id`, `P_name`, `P_Gender`, `P_DOB`, `P_contactno`, `P_address`, `P_email`, `p_age`, `H_id`, `D_id`) VALUES
(1, 'shamatha', 'f', -1983, 2147483647, 'balr', 'shamathashetty@gmailcom', 65, 110, 1),
(2, 'prerana', 'f', -1984, 836113789, 'hgl', 'preranashetty@gmailcom', 48, 1110, 2),
(3, 'soumya', 'f', -2007, 636115581, 'blr', 'soumya@gmailcom', 68, 1110, 1),
(4, 'shravya', 'f', -1987, 936114783, 'udp', 'sakshi@gmailcom', 69, 118, 4),
(5, 'jeevan', 'm', -1990, 936113587, 'bglr', 'jeevs@gmailcom', 19, 110, 4),
(6, 'sahana', 'f', -1987, 67852347, 'udp', 'sahana.evan@gmailcom', 69, 118, 4),
(7, 'shravya', 'f', -1987, 93611378, 'hsn', 'shravya@gmailcom', 69, 118, 4),
(8, 'sakshi', 'f', -1993, 936113478, 'bglt', 'sakshi@gmailcom', 69, 110, 4),
(10, 'Prerana', 'f', -1983, 2147483647, 'balr', 'prerana.m@gmailcom', 65, 110, 1);

--
-- Triggers `person`
--
DELIMITER $$
CREATE TRIGGER `Vaccinate_before` BEFORE INSERT ON `person` FOR EACH ROW IF NEW.P_age < 40 THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'assign doctor first ';
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

CREATE TABLE `vaccine` (
  `V_name` varchar(20) NOT NULL,
  `V_company` varchar(20) NOT NULL,
  `V_cost` float NOT NULL,
  `H_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccine`
--

INSERT INTO `vaccine` (`V_name`, `V_company`, `V_cost`, `H_id`) VALUES
('Covaxin', 'Bharat Biotech', 3500, 110),
('Covishield', 'AstraZeneca', 3000, 1110),
('Sputnik', 'GamaleyaCenter ', 1000, 118);

-- --------------------------------------------------------

--
-- Table structure for table `vaccineprior`
--

CREATE TABLE `vaccineprior` (
  `P_name` varchar(155) DEFAULT NULL,
  `P_age` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vaccinepriority`
--

CREATE TABLE `vaccinepriority` (
  `P_name` varchar(155) DEFAULT NULL,
  `P_age` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vaccinepriort`
--

CREATE TABLE `vaccinepriort` (
  `P_name` varchar(155) DEFAULT NULL,
  `P_age` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_priority`
--

CREATE TABLE `vaccine_priority` (
  `P_name` varchar(155) DEFAULT NULL,
  `P_age` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`D_id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`H_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`P_id`),
  ADD KEY `Person_H_id_fk` (`H_id`),
  ADD KEY `Person_D_id_fk` (`D_id`);

--
-- Indexes for table `vaccine`
--
ALTER TABLE `vaccine`
  ADD PRIMARY KEY (`V_name`),
  ADD KEY `Vaccine_H_id_fk` (`H_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `H_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5111;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `P_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `Person_D_id_fk` FOREIGN KEY (`D_id`) REFERENCES `doctor` (`D_id`),
  ADD CONSTRAINT `Person_H_id_fk` FOREIGN KEY (`H_id`) REFERENCES `hospital` (`H_id`);

--
-- Constraints for table `vaccine`
--
ALTER TABLE `vaccine`
  ADD CONSTRAINT `Vaccine_H_id_fk` FOREIGN KEY (`H_id`) REFERENCES `hospital` (`H_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
