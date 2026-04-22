-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2026 at 03:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_management_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `guest_tbl`
--

CREATE TABLE `guest_tbl` (
  `guest_id` int(11) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guest_tbl`
--

INSERT INTO `guest_tbl` (`guest_id`, `fname`, `lname`) VALUES
(1, 'ralfh', 'cano'),
(2, 'daniela', 'colanag');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_tbl`
--

CREATE TABLE `reservation_tbl` (
  `reservation_id` int(11) NOT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_tbl`
--

INSERT INTO `reservation_tbl` (`reservation_id`, `guest_id`, `room_id`, `date`) VALUES
(1, 1, 1, '10/25/2026'),
(2, 2, 1, '10/26/2026'),
(3, 1, 3, '11/26/2026');

-- --------------------------------------------------------

--
-- Table structure for table `room_tbl`
--

CREATE TABLE `room_tbl` (
  `room_id` int(11) NOT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room_tbl`
--

INSERT INTO `room_tbl` (`room_id`, `room_type`, `price`) VALUES
(1, 'Regular', 500),
(2, 'Deluxe', 1000),
(3, 'Suite', 1500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guest_tbl`
--
ALTER TABLE `guest_tbl`
  ADD PRIMARY KEY (`guest_id`);

--
-- Indexes for table `reservation_tbl`
--
ALTER TABLE `reservation_tbl`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `guest_id` (`guest_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `room_tbl`
--
ALTER TABLE `room_tbl`
  ADD PRIMARY KEY (`room_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guest_tbl`
--
ALTER TABLE `guest_tbl`
  MODIFY `guest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservation_tbl`
--
ALTER TABLE `reservation_tbl`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `room_tbl`
--
ALTER TABLE `room_tbl`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation_tbl`
--
ALTER TABLE `reservation_tbl`
  ADD CONSTRAINT `reservation_tbl_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guest_tbl` (`guest_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_tbl_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room_tbl` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
