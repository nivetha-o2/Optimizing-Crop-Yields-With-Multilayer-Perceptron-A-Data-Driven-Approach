-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 03, 2023 at 08:02 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `fertilizer`
--

CREATE TABLE `fertilizer` (
  `id` varchar(100) NOT NULL,
  `Crop` varchar(100) NOT NULL,
  `N` varchar(100) NOT NULL,
  `P` varchar(100) NOT NULL,
  `K` varchar(100) NOT NULL,
  `Ph` varchar(100) NOT NULL,
  `soil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fertilizer`
--

INSERT INTO `fertilizer` (`id`, `Crop`, `N`, `P`, `K`, `Ph`, `soil`) VALUES
('0', 'rice', '80', '40', '40', '5.5', '30'),
('3', 'maize', '80', '40', '20', '5.5', '50'),
('5', 'chickpea', '40', '60', '80', '5.5', '60'),
('12', 'kidneybeans', '20', '60', '20', '5.5', '45'),
('13', 'pigeonpeas', '20', '60', '20', '5.5', '45'),
('14', 'mothbeans', '20', '40', '20', '5.5', '30'),
('15', 'mungbean', '20', '40', '20', '5.5', '80'),
('18', 'blackgram', '40', '60', '20', '5', '60'),
('24', 'lentil', '20', '60', '20', '5.5', '90'),
('60', 'pomegranate', '20', '10', '40', '5.5', '30'),
('61', 'banana', '100', '75', '50', '6.5', '40'),
('62', 'mango', '20', '20', '30', '5', '15'),
('63', 'grapes', '20', '125', '200', '4', '60'),
('66', 'watermelon', '100', '10', '50', '5.5', '70'),
('67', 'muskmelon', '100', '10', '50', '5.5', '30'),
('69', 'apple', '20', '125', '200', '6.5', '50'),
('74', 'orange', '20', '10', '10', '4', '60'),
('75', 'papaya', '50', '50', '50', '6', '20'),
('88', 'coconut', '20', '10', '30', '5', '45'),
('93', 'cotton', '120', '40', '20', '5.5', '70'),
('94', 'jute', '80', '40', '40', '5.5', '20'),
('95', 'coffee', '100', '20', '30', '5.5', '20');

-- --------------------------------------------------------

--
-- Table structure for table `userinput`
--

CREATE TABLE `userinput` (
  `id` int(10) NOT NULL auto_increment,
  `State_Name` varchar(100) NOT NULL,
  `District_Name` varchar(100) NOT NULL,
  `Crop_Year ` varchar(100) NOT NULL,
  `Season` varchar(100) NOT NULL,
  `Crop` varchar(100) NOT NULL,
  `Area` varchar(100) NOT NULL,
  `Prediction_val` varchar(100) NOT NULL,
  `mlp_acc` varchar(100) NOT NULL,
  `Nitrogen` varchar(500) NOT NULL,
  `Phosphorus` varchar(500) NOT NULL,
  `Potassium` varchar(500) NOT NULL,
  `Temperature` varchar(500) NOT NULL,
  `hm` varchar(500) NOT NULL,
  `PH` varchar(20) NOT NULL,
  `Rainfall` varchar(500) NOT NULL,
  `crop1` varchar(500) NOT NULL,
  `details1` text NOT NULL,
  `fertilizer` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `userinput`
--

INSERT INTO `userinput` (`id`, `State_Name`, `District_Name`, `Crop_Year `, `Season`, `Crop`, `Area`, `Prediction_val`, `mlp_acc`, `Nitrogen`, `Phosphorus`, `Potassium`, `Temperature`, `hm`, `PH`, `Rainfall`, `crop1`, `details1`, `fertilizer`) VALUES
(1, '8', 'trichy', '2023', 'Whole Year', 'rice', '123', '[11003.60210826]', '0.84', '', '', '', '', '', '', '', '', '', ''),
(2, '8', 'trichy', '2023', 'Whole Year', 'rice', '123', '[11003.60210826]', '0.84', '8.0', '6.0', '5.0', '5.0', '9.0', '6.0', '7.0', 'kidneybeans', 'Kidneybeans should be harvested. Its a Rabi crop, so it must be sown at the end of monsoon and beginning of winter season e.g between September and October.', 'N:20,P:60,K:20,PH LEVEL:5.5,soil_moisture:45');
