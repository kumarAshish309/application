-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 12, 2021 at 01:41 PM
-- Server version: 5.7.36-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbaws`
--

-- --------------------------------------------------------

--
-- Table structure for table `claims`
--

CREATE TABLE `claims` (
  `claim_id` int(11) NOT NULL,
  `claim_date` date DEFAULT NULL,
  `claim_amount` int(11) DEFAULT NULL,
  `dealer_id` int(11) DEFAULT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `repair_or_replace` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `claims`
--

INSERT INTO `claims` (`claim_id`, `claim_date`, `claim_amount`, `dealer_id`, `Customer_id`, `part_id`, `repair_or_replace`) VALUES
(1, '2021-12-09', 1000, 1, 1, 1, 'repr');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Customer_id` int(11) NOT NULL,
  `Customer_name` varchar(30) DEFAULT NULL,
  `dealer_id` int(11) DEFAULT NULL,
  `Country` varchar(40) DEFAULT NULL,
  `State` varchar(40) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Zipcode` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`Customer_id`, `Customer_name`, `dealer_id`, `Country`, `State`, `City`, `Zipcode`) VALUES
(1, 'Rajq', 1, 'wqe', 'eq', 'eq', '131'),
(2, 'fsfsf', 4, 'fsafs', 'afa', 'adsfa', '432'),
(3, 'Raj', 3, 'a', 'up', 'lk', '411033'),
(4, 'raj', 4, 'India', 'Maharashtra', 'Pune', '411033');

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `dealer_id` int(6) NOT NULL,
  `dealer_name` varchar(20) NOT NULL,
  `dealer_country` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Zipcode` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dealers`
--

INSERT INTO `dealers` (`dealer_id`, `dealer_name`, `dealer_country`, `State`, `City`, `Zipcode`) VALUES
(1, 'ashish', 'India', 'Maharashtra', 'pune', 411033),
(3, 'Kapil', 'U K', 'up', 'pune', 2222),
(4, 'da', 'da', 'ad', 'ada', 2131),
(5, 'jdklahf', 'as', 'fsaf', 'safs', 312423),
(6, 'saAH', 'kah', 'kjdak', 'khjfsakjf', 131);

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `part_id` int(11) NOT NULL,
  `part_name` varchar(20) DEFAULT NULL,
  `mancfacture_id` int(11) DEFAULT NULL,
  `manf_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`part_id`, `part_name`, `mancfacture_id`, `manf_date`) VALUES
(1, 'Ashish', 121, '2021-12-15');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `claim_id` int(11) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `claim_id`, `transaction_date`, `transaction_amount`) VALUES
(1, 1, '2021-12-09', 11111);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(80) NOT NULL,
  `name` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `password`) VALUES
(1, 'Ashish', 'Ashish Vishwakarma', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendor_Id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  `zipcode` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendor_Id`, `name`, `country`, `state`, `city`, `zipcode`) VALUES
(1, 'Ashish Vishwakarma', 'India', 'Maharashtr', 'Pune', '411033');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `claims`
--
ALTER TABLE `claims`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `dealer_id` (`dealer_id`),
  ADD KEY `Customer_id` (`Customer_id`),
  ADD KEY `part_id` (`part_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Customer_id`),
  ADD KEY `customers_ibfk_1` (`dealer_id`);

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`dealer_id`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`part_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `claim_id` (`claim_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendor_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `claims`
--
ALTER TABLE `claims`
  ADD CONSTRAINT `claims_ibfk_1` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`dealer_id`),
  ADD CONSTRAINT `claims_ibfk_2` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`),
  ADD CONSTRAINT `claims_ibfk_3` FOREIGN KEY (`part_id`) REFERENCES `parts` (`part_id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`dealer_id`) REFERENCES `dealers` (`dealer_id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`claim_id`) REFERENCES `claims` (`claim_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
