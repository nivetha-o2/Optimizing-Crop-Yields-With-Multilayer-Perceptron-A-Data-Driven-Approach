-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 27, 2017 at 05:22 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `onshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `uname` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`uname`, `password`) VALUES
('admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category` varchar(50) NOT NULL,
  `subcategory` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category`, `subcategory`) VALUES
('man', 'footware'),
('man', 'shirts'),
('man', 'foodware');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` varchar(15) NOT NULL,
  `category` varchar(20) NOT NULL,
  `subcategory` varchar(20) NOT NULL,
  `image` varchar(50) NOT NULL,
  `pno` varchar(15) NOT NULL,
  `price` varchar(10) NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category`, `subcategory`, `image`, `pno`, `price`, `description`) VALUES
('1', 'man', 'foodware', 'Desert.jpg', '123456', '500', 'good'),
('2', 'man', 'shirts', 'TMPDOODLE1479389401567.jpg', '579848', '5000', 'Cggdfffffd'),
('3', '', 'foodware', 'Desert.jpg', 'ertert', 'ertert', 'erterter');

-- --------------------------------------------------------

--
-- Table structure for table `pro_order`
--

CREATE TABLE `pro_order` (
  `id` varchar(10) NOT NULL,
  `pname` varchar(20) NOT NULL,
  `pno` varchar(10) NOT NULL,
  `price` varchar(20) NOT NULL,
  `size` varchar(15) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `accno` varchar(25) NOT NULL,
  `address` varchar(30) NOT NULL,
  `pnumber` varchar(10) NOT NULL,
  `bank` varchar(10) NOT NULL,
  `city` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pro_order`
--

INSERT INTO `pro_order` (`id`, `pname`, `pno`, `price`, `size`, `uname`, `accno`, `address`, `pnumber`, `bank`, `city`, `status`) VALUES
('1', 'footware', 'we', 'wewe', 's size', 'ssssss', 'sss', 'sss', 'sss', 'sss', 'sss', '0'),
('2', 'footware', 'we', 'wewe', 's size', 'sundar', '23244324', 'try', '9976322008', 'sbi', 'trichy', '0'),
('3', 'foodware', '123456', '500', 'm size', 'sundar', '11144444', 'try', '9976322008', 'sbi', 'trichy', '0'),
('4', 'shirts', '579848', '5000', 'm size', '', '', '', '', '', '', '0'),
('5', 'shirts', '579848', '5000', 's size', 'sundar', '113', 'eqwqwe', '9976322008', 'retret', '444', '0'),
('6', 'shirts', '579848', '5000', 'm size', 'sundar', '78955555', 'trichy, 22', '9976322008', 'sbi', 'trichy', '0'),
('7', 'shirts', '579848', '5000', 'm size', 'sundar', '534543545', 'ert', '4234324', 'es', 'eqewqwe', '0'),
('8', 'shirts', '579848', '5000', 's size', 'sundar', '545435', 'err', '324324234', 'rdfsdf', 'sdfsdfsdf', '0'),
('9', 'shirts', '0997632200', '5000', 's size', 'retert', 'terterter', 'ertertrt', '9976322008', 'rt5ert', 'trichy', '0'),
('10', 'shirts', '579848', '5000', 's size', 'erter', 'rtet', 'ertert', 'rtrt', 'rtert', 'retret', '0'),
('10', 'shirts', '579848', '5000', 's size', 'erter', 'rtet', 'ertert', 'rtrt', 'rtert', 'retret', '0'),
('10', 'shirts', '579848', '5000', 's size', 'rewr', 'ewrwer', '32432', 'ere', 'erer', 'erdfdf', '0'),
('10', 'shirts', '579848', '5000', 's size', 'rewr', 'ewrwer', '32432', 'ere', 'erer', 'erdfdf', '0'),
('10', 'shirts', '579848', '5000', 's size', 'fsdf', 'ewrew', 'ewrewr', '45435', 'rewwede', 'werwerwer', '0'),
('10', 'shirts', '579848', '5000', 's size', 'sundar', '234124', 'wewqe', '124124', 'sbi', 'ddd', '0'),
('10', 'shirts', '234234234', '5000', 's size', 'ewer', '4545435', '545435', '9976322008', '333334', 'trichy', '0'),
('10', 'shirts', '234234234', '5000', 's size', 'ewer', '4545435', '545435', '9976322008', '333334', 'trichy', '0'),
('10', 'shirts', '579848', '5000', 's size', 'eqwe', 'dfsdg', 'jkjhk', '534543', '4', '454435', '0'),
('10', '', '', '', '', '', '', '', '', '', '', '0'),
('10', 'shirts', '579848', '5000', 's size', 'eqwe', 'dfsdg', 'jkjhk', '534543', '4', '454435', '0'),
('10', 'shirts', '579848', '5000', 's size', 'eqwe', 'dfsdg', 'jkjhk', '534543', '4', '454435', '0'),
('10', 'shirts', '579848', '5000', 's size', 'eqwe', 'dfsdg', 'jkjhk', '534543', '4', '454435', '0'),
('10', 'shirts', '579848', '5000', 's size', 'eqwe', 'dfsdg', 'jkjhk', '534543', '4', '454435', '0'),
('10', 'shirts', '579848', '5000', 's size', 'eqwe', 'dfsdg', 'jkjhk', '534543', '4', '454435', '0'),
('10', 'shirts', '579848', '5000', 's size', 'eqwe', 'dfsdg', 'jkjhk', '534543', '4', '454435', '0'),
('10', 'foodware', '123456', '500', 'l size', 'hgfh', 'ytutyu', 'ytuytuytu', 'ewrewr', 'ewrewr', 'ewrewr', '0');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` varchar(10) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `emailid` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `pnumber` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `dob` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `fname`, `lname`, `gender`, `emailid`, `password`, `pnumber`, `address`, `city`, `country`, `dob`) VALUES
('1', 'qereq', 'er', 'Male', 'rewr', 'ewr', 'werwerwe', 'werwe', 'rrwer', 'werwer', 'wer'),
('2', 'ewrwer', 'werwer', 'Male', 'rwerwe', 'rwer', 'werwerwewer', 'werwe', 'rwerw', 'erwer', 'werwer'),
('3', 'ewrwer', 'werwer', 'Male', 'rwerwe', 'rwer', 'werwerwewer', 'werwe', 'rwerw', 'erwer', 'werwer'),
('4', 'ewrwer', 'werwer', 'Male', 'rwerwe', 'rwer', 'werwerwewer', 'werwe', 'rwerw', 'erwer', 'werwer'),
('5', 'ewrwer', 'werwer', 'Male', 'rwerwe', 'rwer', 'werwerwewer', 'werwe', 'rwerw', 'erwer', 'werwer'),
('6', 'sundar', 'vijayan', 'Male', 'sundarv06@gmail.com', 'sundarv06', '9976322008', 'trichy', 'trichy', 'india', '1991-07-06'),
('7', 'ret', 'erter', 'Male', '111', '111', '9976322008', 'trichy\r\n22', 'trichy', 'India', '2017-03-08'),
('8', 'rr', 'rr', 'Male', 'rr', 'rr', '9976322008', 'trichy\r\n22', 'trichy', 'India', '2017-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `reviwe`
--

CREATE TABLE `reviwe` (
  `macid` varchar(20) NOT NULL,
  `id` varchar(15) NOT NULL,
  `pname` varchar(20) NOT NULL,
  `pno` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `rating` varchar(20) NOT NULL,
  `commant` varchar(50) NOT NULL,
  `advan` varchar(50) NOT NULL,
  `disadvan` varchar(50) NOT NULL,
  `status` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviwe`
--

INSERT INTO `reviwe` (`macid`, `id`, `pname`, `pno`, `email`, `rating`, `commant`, `advan`, `disadvan`, `status`) VALUES
('02-00-55-5F-38-63', '8', 'footware', 'we', 'asda', '1', 'sadas', 'sadas', 'asdas', '1');
