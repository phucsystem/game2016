-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2015 at 01:01 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `game`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_address`
--

CREATE TABLE IF NOT EXISTS `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_activity`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_activity` (
  `activity_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_login`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_api`
--

CREATE TABLE IF NOT EXISTS `oc_api` (
  `api_id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `username`, `firstname`, `lastname`, `password`, `status`, `date_added`, `date_modified`) VALUES
(1, 'vun2FZIWppJ9XdQdhTjCAKoZHdnwtNE2K1F5RXQoaOrRaZ9enWNh4D8Ij8XedE9U', '', '', '7z521Nwziqna0NFXHQP4KzquXWeFkyRoHqJqz5p2DA6co3jJ7DoKyduOjm9iEa71oZtWJf5x5MnWzbaxLsaSzAMkIu135596iAr517jkLQqJX2oSwQjSOYByEuGHKSZ30eCW6SjQyMHxSLQrupGK9pN5YntMwhMsfzuqYf7yyB5UlWP7F7A4Iyx4FYsKvoXahD01OksOMsGtRZlGyHRhp0uvJBFBIn496KT5bi1g6SpBUVUH4K5CitEfkgzt1fzb', 1, '2015-03-25 22:07:42', '2015-03-25 22:07:42');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

CREATE TABLE IF NOT EXISTS `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(79, 7, 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(87, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(94, 8, '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, '', 'catalog/demo/manufacturer/sony.png', 0),
(91, 8, '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, '', 'catalog/demo/manufacturer/canon.png', 0),
(88, 8, '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, '', 'catalog/demo/manufacturer/disney.png', 0),
(80, 7, '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(97, 8, '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, '', 'catalog/demo/manufacturer/nintendo.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(79, 1, 7, 'iPhone 6'),
(87, 1, 6, 'HP Banner'),
(93, 1, 8, 'Canon'),
(92, 1, 8, 'Burger King'),
(91, 1, 8, 'Coca Cola'),
(90, 1, 8, 'Disney'),
(89, 1, 8, 'Dell'),
(80, 1, 7, 'MacBookAir'),
(88, 1, 8, 'Harley Davidson'),
(94, 1, 8, 'NFL'),
(95, 1, 8, 'RedBull'),
(96, 1, 8, 'Sony'),
(97, 1, 8, 'Starbucks'),
(98, 1, 8, 'Nintendo');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

CREATE TABLE IF NOT EXISTS `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2011-05-30 12:14:55'),
(27, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2010-08-22 06:32:15'),
(20, 'catalog/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2011-07-16 02:14:42'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2011-05-30 12:15:18'),
(18, 'catalog/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2011-05-30 12:13:55'),
(17, '', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2011-05-30 12:15:11'),
(28, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2010-08-22 06:32:46'),
(26, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2010-08-22 06:31:45'),
(29, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2010-08-22 06:32:39'),
(30, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2010-08-22 06:33:00'),
(31, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2010-08-22 06:33:06'),
(32, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2010-08-22 06:33:12'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2011-05-30 12:15:25'),
(34, 'catalog/demo/ipod_touch_4.jpg', 0, 1, 4, 7, 1, '2009-02-03 14:18:11', '2011-05-30 12:15:31'),
(35, '', 28, 0, 0, 0, 1, '2010-09-17 10:06:48', '2010-09-18 14:02:42'),
(36, '', 28, 0, 0, 0, 1, '2010-09-17 10:07:13', '2010-09-18 14:02:55'),
(37, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:39', '2011-04-22 01:55:08'),
(38, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:51', '2010-09-18 14:03:51'),
(39, '', 34, 0, 0, 0, 1, '2010-09-18 14:04:17', '2011-04-22 01:55:20'),
(40, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:36', '2010-09-18 14:05:36'),
(41, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:49', '2011-04-22 01:55:30'),
(42, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:34', '2010-11-07 20:31:04'),
(43, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:49', '2011-04-22 01:55:40'),
(44, '', 34, 0, 0, 0, 1, '2010-09-21 15:39:21', '2010-11-07 20:30:55'),
(45, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:16', '2011-04-26 08:52:11'),
(46, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:31', '2011-04-26 08:52:23'),
(47, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:16', '2010-11-07 11:13:16'),
(48, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:33', '2010-11-07 11:13:33'),
(49, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:04', '2010-11-07 11:14:04'),
(50, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:23', '2011-04-22 01:16:01'),
(51, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:38', '2011-04-22 01:16:13'),
(52, '', 34, 0, 0, 0, 1, '2010-11-07 11:16:09', '2011-04-22 01:54:57'),
(53, '', 34, 0, 0, 0, 1, '2010-11-07 11:28:53', '2011-04-22 01:14:36'),
(54, '', 34, 0, 0, 0, 1, '2010-11-07 11:29:16', '2011-04-22 01:16:50'),
(55, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:32', '2010-11-08 10:31:32'),
(56, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:50', '2011-04-22 01:16:37'),
(57, '', 0, 1, 1, 3, 1, '2011-04-26 08:53:16', '2011-05-30 12:15:05'),
(58, '', 52, 0, 0, 0, 1, '2011-05-08 13:44:16', '2011-05-08 13:44:16');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(28, 1, 'Monitors', '', '', '', ''),
(33, 1, 'Cameras', '', '', '', ''),
(32, 1, 'Web Cameras', '', '', '', ''),
(31, 1, 'Scanners', '', '', '', ''),
(30, 1, 'Printers', '', '', '', ''),
(29, 1, 'Mice and Trackballs', '', '', '', ''),
(27, 1, 'Mac', '', '', '', ''),
(26, 1, 'PC', '', '', '', ''),
(17, 1, 'Software', '', '', '', ''),
(25, 1, 'Components', '', '', '', ''),
(24, 1, 'Phones &amp; PDAs', '', '', '', ''),
(20, 1, 'Desktops', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', '', 'Example of category description', ''),
(35, 1, 'test 1', '', '', '', ''),
(36, 1, 'test 2', '', '', '', ''),
(37, 1, 'test 5', '', '', '', ''),
(38, 1, 'test 4', '', '', '', ''),
(39, 1, 'test 6', '', '', '', ''),
(40, 1, 'test 7', '', '', '', ''),
(41, 1, 'test 8', '', '', '', ''),
(42, 1, 'test 9', '', '', '', ''),
(43, 1, 'test 11', '', '', '', ''),
(34, 1, 'MP3 Players', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', ''),
(18, 1, 'Laptops &amp; Notebooks', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', '', '', ''),
(44, 1, 'test 12', '', '', '', ''),
(45, 1, 'Windows', '', '', '', ''),
(46, 1, 'Macs', '', '', '', ''),
(47, 1, 'test 15', '', '', '', ''),
(48, 1, 'test 16', '', '', '', ''),
(49, 1, 'test 17', '', '', '', ''),
(50, 1, 'test 18', '', '', '', ''),
(51, 1, 'test 19', '', '', '', ''),
(52, 1, 'test 20', '', '', '', ''),
(53, 1, 'test 21', '', '', '', ''),
(54, 1, 'test 22', '', '', '', ''),
(55, 1, 'test 23', '', '', '', ''),
(56, 1, 'test 24', '', '', '', ''),
(57, 1, 'Tablets', '', '', '', ''),
(58, 1, 'test 25', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

CREATE TABLE IF NOT EXISTS `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

CREATE TABLE IF NOT EXISTS `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(25, 25, 0),
(28, 25, 0),
(28, 28, 1),
(35, 25, 0),
(35, 28, 1),
(35, 35, 2),
(36, 25, 0),
(36, 28, 1),
(36, 36, 2),
(29, 25, 0),
(29, 29, 1),
(30, 25, 0),
(30, 30, 1),
(31, 25, 0),
(31, 31, 1),
(32, 25, 0),
(32, 32, 1),
(20, 20, 0),
(27, 20, 0),
(27, 27, 1),
(26, 20, 0),
(26, 26, 1),
(24, 24, 0),
(18, 18, 0),
(45, 18, 0),
(45, 45, 1),
(46, 18, 0),
(46, 46, 1),
(17, 17, 0),
(33, 33, 0),
(34, 34, 0),
(37, 34, 0),
(37, 37, 1),
(38, 34, 0),
(38, 38, 1),
(39, 34, 0),
(39, 39, 1),
(40, 34, 0),
(40, 40, 1),
(41, 34, 0),
(41, 41, 1),
(42, 34, 0),
(42, 42, 1),
(43, 34, 0),
(43, 43, 1),
(44, 34, 0),
(44, 44, 1),
(47, 34, 0),
(47, 47, 1),
(48, 34, 0),
(48, 48, 1),
(49, 34, 0),
(49, 49, 1),
(50, 34, 0),
(50, 50, 1),
(51, 34, 0),
(51, 51, 1),
(52, 34, 0),
(52, 52, 1),
(58, 34, 0),
(58, 52, 1),
(58, 58, 2),
(53, 34, 0),
(53, 53, 1),
(54, 34, 0),
(54, 54, 1),
(55, 34, 0),
(55, 55, 1),
(56, 34, 0),
(56, 56, 1),
(57, 57, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_country`
--

CREATE TABLE IF NOT EXISTS `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'Korea, Republic of', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

CREATE TABLE IF NOT EXISTS `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

CREATE TABLE IF NOT EXISTS `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.66799998, 1, '2015-04-17 08:08:46'),
(2, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 1, '2015-04-17 08:08:46'),
(3, 'Euro', 'EUR', '', '€', '2', 0.92619997, 1, '2015-04-17 08:08:46');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

CREATE TABLE IF NOT EXISTS `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_activity`
--

CREATE TABLE IF NOT EXISTS `oc_customer_activity` (
  `activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ban_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

CREATE TABLE IF NOT EXISTS `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_login`
--

CREATE TABLE IF NOT EXISTS `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_login`
--

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, 'test', '127.0.0.1', 1, '2015-03-25 16:09:01', '2015-03-25 16:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

CREATE TABLE IF NOT EXISTS `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

CREATE TABLE IF NOT EXISTS `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

CREATE TABLE IF NOT EXISTS `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

CREATE TABLE IF NOT EXISTS `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_event`
--

CREATE TABLE IF NOT EXISTS `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

CREATE TABLE IF NOT EXISTS `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=428 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(413, 'module', 'category'),
(408, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(427, 'module', 'featured'),
(419, 'module', 'slideshow');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

CREATE TABLE IF NOT EXISTS `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

CREATE TABLE IF NOT EXISTS `oc_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

CREATE TABLE IF NOT EXISTS `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', '', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', '', '', ''),
(3, 1, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', '', '', ''),
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

CREATE TABLE IF NOT EXISTS `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

CREATE TABLE IF NOT EXISTS `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_module`
--

CREATE TABLE IF NOT EXISTS `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'affiliate', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(67, 1, 'carousel.29', 'content_top', 3),
(66, 1, 'slideshow.27', 'content_top', 1),
(65, 1, 'featured.28', 'content_top', 2),
(72, 3, 'category', 'column_left', 1),
(73, 3, 'banner.30', 'column_left', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

CREATE TABLE IF NOT EXISTS `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(42, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

CREATE TABLE IF NOT EXISTS `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `oc_location`
--

CREATE TABLE IF NOT EXISTS `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_marketing`
--

CREATE TABLE IF NOT EXISTS `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_modification`
--

CREATE TABLE IF NOT EXISTS `oc_modification` (
  `modification_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_module`
--

CREATE TABLE IF NOT EXISTS `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', 'a:5:{s:4:"name";s:17:"Banner - Category";s:9:"banner_id";s:1:"6";s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:6:"status";s:1:"1";}'),
(29, 'Home Page', 'carousel', 'a:5:{s:4:"name";s:20:"Carousel - Home Page";s:9:"banner_id";s:1:"8";s:5:"width";s:3:"130";s:6:"height";s:3:"100";s:6:"status";s:1:"1";}'),
(28, 'Home Page', 'featured', 'a:6:{s:4:"name";s:20:"Featured - Home Page";s:7:"product";a:4:{i:0;s:2:"43";i:1;s:2:"40";i:2;s:2:"42";i:3;s:2:"30";}s:5:"limit";s:1:"4";s:5:"width";s:3:"200";s:6:"height";s:3:"200";s:6:"status";s:1:"1";}'),
(27, 'Home Page', 'slideshow', 'a:5:{s:4:"name";s:21:"Slideshow - Home Page";s:9:"banner_id";s:1:"7";s:5:"width";s:4:"1140";s:6:"height";s:3:"380";s:6:"status";s:1:"1";}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

CREATE TABLE IF NOT EXISTS `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

CREATE TABLE IF NOT EXISTS `oc_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_fraud`
--

CREATE TABLE IF NOT EXISTS `oc_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

CREATE TABLE IF NOT EXISTS `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

CREATE TABLE IF NOT EXISTS `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

CREATE TABLE IF NOT EXISTS `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

CREATE TABLE IF NOT EXISTS `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

CREATE TABLE IF NOT EXISTS `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

CREATE TABLE IF NOT EXISTS `oc_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(28, 'Product 1', '', '', '', '', '', '', '', 939, 7, 'catalog/demo/htc_touch_hd_1.jpg', 5, 1, '100.0000', 200, 9, '2009-02-03', '146.40000000', 2, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 16:06:50', '2011-09-30 01:05:39'),
(29, 'Product 2', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/palm_treo_pro_1.jpg', 6, 1, '279.9900', 0, 9, '2009-02-03', '133.00000000', 2, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 16:42:17', '2011-09-30 01:06:08'),
(30, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'catalog/demo/canon_eos_5d_1.jpg', 9, 1, '100.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 16:59:00', '2011-09-30 01:05:23'),
(31, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/nikon_d300_1.jpg', 0, 1, '80.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 3, 1, 1, 0, 1, 0, '2009-02-03 17:00:10', '2011-09-30 01:06:00'),
(32, 'Product 5', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/ipod_touch_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 17:07:26', '2011-09-30 01:07:22'),
(33, 'Product 6', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/samsung_syncmaster_941bw.jpg', 0, 1, '200.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 17:08:31', '2011-09-30 01:06:29'),
(34, 'Product 7', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/ipod_shuffle_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:07:54', '2011-09-30 01:07:17'),
(35, 'Product 8', '', '', '', '', '', '', '', 1000, 5, '', 0, 0, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 18:08:31', '2011-09-30 01:06:17'),
(36, 'Product 9', '', '', '', '', '', '', '', 994, 6, 'catalog/demo/ipod_nano_1.jpg', 8, 0, '100.0000', 100, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 18:09:19', '2011-09-30 01:07:12'),
(40, 'product 11', '', '', '', '', '', '', '', 970, 5, 'catalog/demo/iphone_1.jpg', 8, 1, '101.0000', 0, 9, '2009-02-03', '10.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 1, '2009-02-03 21:07:12', '2011-09-30 01:06:53'),
(41, 'Product 14', '', '', '', '', '', '', '', 977, 5, 'catalog/demo/imac_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-03', '5.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 0, 1, 0, '2009-02-03 21:07:26', '2011-09-30 01:06:44'),
(42, 'Product 15', '', '', '', '', '', '', '', 990, 5, 'catalog/demo/apple_cinema_30.jpg', 8, 1, '100.0000', 400, 9, '2009-02-04', '12.50000000', 1, '1.00000000', '2.00000000', '3.00000000', 1, 1, 2, 0, 1, 0, '2009-02-03 21:07:37', '2011-09-30 00:46:19'),
(43, 'Product 16', '', '', '', '', '', '', '', 929, 5, 'catalog/demo/macbook_1.jpg', 8, 0, '500.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:07:49', '2011-09-30 01:05:46'),
(44, 'Product 17', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/macbook_air_1.jpg', 8, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:00', '2011-09-30 01:05:53'),
(45, 'Product 18', '', '', '', '', '', '', '', 998, 5, 'catalog/demo/macbook_pro_1.jpg', 8, 1, '2000.0000', 0, 100, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:17', '2011-09-15 22:22:01'),
(46, 'Product 19', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/sony_vaio_1.jpg', 10, 1, '1000.0000', 0, 9, '2009-02-03', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-03 21:08:29', '2011-09-30 01:06:39'),
(47, 'Product 21', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/hp_1.jpg', 7, 1, '100.0000', 400, 9, '2009-02-03', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 0, 1, 0, 1, 0, '2009-02-03 21:08:40', '2011-09-30 01:05:28'),
(48, 'product 20', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'catalog/demo/ipod_classic_1.jpg', 8, 1, '100.0000', 0, 9, '2009-02-08', '1.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 2, 1, 1, 0, 1, 0, '2009-02-08 17:21:51', '2011-09-30 01:07:06'),
(49, 'SAM1', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/samsung_tab_1.jpg', 0, 1, '199.9900', 0, 9, '2011-04-25', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 0, '2011-04-26 08:57:34', '2011-09-30 01:06:23');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(43, 2, 1, '1'),
(47, 4, 1, '16GB'),
(43, 4, 1, '8gb'),
(42, 3, 1, '100mhz'),
(47, 2, 1, '4');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

CREATE TABLE IF NOT EXISTS `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(35, 1, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', '', '', ''),
(48, 1, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(40, 1, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', '', '', ''),
(28, 1, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', ''),
(44, 1, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', '', '', ''),
(45, 1, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(29, 1, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', ''),
(36, 1, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(46, 1, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', '', '', ''),
(47, 1, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', '', '', ''),
(32, 1, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '', '', ''),
(41, 1, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', '', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', '', '', ''),
(34, 1, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(43, 1, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', '', '', ''),
(31, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', '', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', '', '', ''),
(42, 1, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there&amp;#39;s no limit to what you can achieve. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it&amp;#39;s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple&amp;#39;s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br /&gt;\r\n	&lt;br /&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br /&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170&amp;deg; horizontal; 170&amp;deg; vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br /&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br /&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50&amp;deg; to 95&amp;deg; F (10&amp;deg; to 35&amp;deg; C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40&amp;deg; to 116&amp;deg; F (-40&amp;deg; to 47&amp;deg; C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO &amp;#39;03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br /&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', '', ''),
(30, 1, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon''s press material for the EOS 5D states that it ''defines (a) new D-SLR category'', while we''re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably ''chunkier''). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR''s, an important difference when compared to the latter is that the EOS 5D doesn''t have any environmental seals. While Canon don''t specifically refer to the EOS 5D as a ''professional'' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they''ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

CREATE TABLE IF NOT EXISTS `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM AUTO_INCREMENT=441 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(440, 42, 1, 30, 1, '66.0000', '0000-00-00', '0000-00-00'),
(439, 42, 1, 20, 1, '77.0000', '0000-00-00', '0000-00-00'),
(438, 42, 1, 10, 1, '88.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

CREATE TABLE IF NOT EXISTS `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

CREATE TABLE IF NOT EXISTS `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2352 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2345, 30, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2321, 47, 'catalog/demo/hp_3.jpg', 0),
(2035, 28, 'catalog/demo/htc_touch_hd_2.jpg', 0),
(2351, 41, 'catalog/demo/imac_3.jpg', 0),
(1982, 40, 'catalog/demo/iphone_6.jpg', 0),
(2001, 36, 'catalog/demo/ipod_nano_5.jpg', 0),
(2000, 36, 'catalog/demo/ipod_nano_4.jpg', 0),
(2005, 34, 'catalog/demo/ipod_shuffle_5.jpg', 0),
(2004, 34, 'catalog/demo/ipod_shuffle_4.jpg', 0),
(2011, 32, 'catalog/demo/ipod_touch_7.jpg', 0),
(2010, 32, 'catalog/demo/ipod_touch_6.jpg', 0),
(2009, 32, 'catalog/demo/ipod_touch_5.jpg', 0),
(1971, 43, 'catalog/demo/macbook_5.jpg', 0),
(1970, 43, 'catalog/demo/macbook_4.jpg', 0),
(1974, 44, 'catalog/demo/macbook_air_4.jpg', 0),
(1973, 44, 'catalog/demo/macbook_air_2.jpg', 0),
(1977, 45, 'catalog/demo/macbook_pro_2.jpg', 0),
(1976, 45, 'catalog/demo/macbook_pro_3.jpg', 0),
(1986, 31, 'catalog/demo/nikon_d300_3.jpg', 0),
(1985, 31, 'catalog/demo/nikon_d300_2.jpg', 0),
(1988, 29, 'catalog/demo/palm_treo_pro_3.jpg', 0),
(1995, 46, 'catalog/demo/sony_vaio_5.jpg', 0),
(1994, 46, 'catalog/demo/sony_vaio_4.jpg', 0),
(1991, 48, 'catalog/demo/ipod_classic_4.jpg', 0),
(1990, 48, 'catalog/demo/ipod_classic_3.jpg', 0),
(1981, 40, 'catalog/demo/iphone_2.jpg', 0),
(1980, 40, 'catalog/demo/iphone_5.jpg', 0),
(2344, 30, 'catalog/demo/canon_eos_5d_3.jpg', 0),
(2320, 47, 'catalog/demo/hp_2.jpg', 0),
(2034, 28, 'catalog/demo/htc_touch_hd_3.jpg', 0),
(2350, 41, 'catalog/demo/imac_2.jpg', 0),
(1979, 40, 'catalog/demo/iphone_3.jpg', 0),
(1978, 40, 'catalog/demo/iphone_4.jpg', 0),
(1989, 48, 'catalog/demo/ipod_classic_2.jpg', 0),
(1999, 36, 'catalog/demo/ipod_nano_2.jpg', 0),
(1998, 36, 'catalog/demo/ipod_nano_3.jpg', 0),
(2003, 34, 'catalog/demo/ipod_shuffle_2.jpg', 0),
(2002, 34, 'catalog/demo/ipod_shuffle_3.jpg', 0),
(2008, 32, 'catalog/demo/ipod_touch_2.jpg', 0),
(2007, 32, 'catalog/demo/ipod_touch_3.jpg', 0),
(2006, 32, 'catalog/demo/ipod_touch_4.jpg', 0),
(1969, 43, 'catalog/demo/macbook_2.jpg', 0),
(1968, 43, 'catalog/demo/macbook_3.jpg', 0),
(1972, 44, 'catalog/demo/macbook_air_3.jpg', 0),
(1975, 45, 'catalog/demo/macbook_pro_4.jpg', 0),
(1984, 31, 'catalog/demo/nikon_d300_4.jpg', 0),
(1983, 31, 'catalog/demo/nikon_d300_5.jpg', 0),
(1987, 29, 'catalog/demo/palm_treo_pro_2.jpg', 0),
(1993, 46, 'catalog/demo/sony_vaio_2.jpg', 0),
(1992, 46, 'catalog/demo/sony_vaio_3.jpg', 0),
(2327, 49, 'catalog/demo/samsung_tab_7.jpg', 0),
(2326, 49, 'catalog/demo/samsung_tab_6.jpg', 0),
(2325, 49, 'catalog/demo/samsung_tab_5.jpg', 0),
(2324, 49, 'catalog/demo/samsung_tab_4.jpg', 0),
(2323, 49, 'catalog/demo/samsung_tab_3.jpg', 0),
(2322, 49, 'catalog/demo/samsung_tab_2.jpg', 0),
(2317, 42, 'catalog/demo/canon_logo.jpg', 0),
(2316, 42, 'catalog/demo/hp_1.jpg', 0),
(2315, 42, 'catalog/demo/compaq_presario.jpg', 0),
(2314, 42, 'catalog/demo/canon_eos_5d_1.jpg', 0),
(2313, 42, 'catalog/demo/canon_eos_5d_2.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

CREATE TABLE IF NOT EXISTS `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(224, 35, 11, '', 1),
(225, 47, 12, '2011-04-22', 1),
(223, 42, 2, '', 1),
(217, 42, 5, '', 1),
(209, 42, 6, '', 1),
(218, 42, 1, '', 1),
(208, 42, 4, 'test', 1),
(219, 42, 8, '2011-02-20', 1),
(222, 42, 7, '', 1),
(221, 42, 9, '22:25', 1),
(220, 42, 10, '2011-02-20 22:25', 1),
(226, 30, 5, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(1, 217, 42, 5, 41, 100, 0, '1.0000', '+', 0, '+', '1.00000000', '+'),
(6, 218, 42, 1, 31, 146, 1, '20.0000', '+', 2, '-', '20.00000000', '+'),
(7, 218, 42, 1, 43, 300, 1, '30.0000', '+', 3, '+', '30.00000000', '+'),
(5, 218, 42, 1, 32, 96, 1, '10.0000', '+', 1, '+', '10.00000000', '+'),
(4, 217, 42, 5, 39, 92, 1, '4.0000', '+', 0, '+', '4.00000000', '+'),
(2, 217, 42, 5, 42, 200, 1, '2.0000', '+', 0, '+', '2.00000000', '+'),
(3, 217, 42, 5, 40, 300, 0, '3.0000', '+', 0, '+', '3.00000000', '+'),
(8, 223, 42, 2, 23, 48, 1, '10.0000', '+', 0, '+', '10.00000000', '+'),
(10, 223, 42, 2, 44, 2696, 1, '30.0000', '+', 0, '+', '30.00000000', '+'),
(9, 223, 42, 2, 24, 194, 1, '20.0000', '+', 0, '+', '20.00000000', '+'),
(11, 223, 42, 2, 45, 3998, 1, '40.0000', '+', 0, '+', '40.00000000', '+'),
(12, 224, 35, 11, 46, 0, 1, '5.0000', '+', 0, '+', '0.00000000', '+'),
(13, 224, 35, 11, 47, 10, 1, '10.0000', '+', 0, '+', '0.00000000', '+'),
(14, 224, 35, 11, 48, 15, 1, '15.0000', '+', 0, '+', '0.00000000', '+'),
(16, 226, 30, 5, 40, 5, 1, '0.0000', '+', 0, '+', '0.00000000', '+'),
(15, 226, 30, 5, 39, 2, 1, '0.0000', '+', 0, '+', '0.00000000', '+');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

CREATE TABLE IF NOT EXISTS `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(40, 42),
(41, 42),
(42, 40),
(42, 41);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

CREATE TABLE IF NOT EXISTS `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=546 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(515, 42, 1, 100),
(519, 47, 1, 300),
(379, 28, 1, 400),
(329, 43, 1, 600),
(339, 29, 1, 0),
(343, 48, 1, 0),
(335, 40, 1, 0),
(539, 30, 1, 200),
(331, 44, 1, 700),
(333, 45, 1, 800),
(337, 31, 1, 0),
(425, 35, 1, 0),
(345, 33, 1, 0),
(347, 46, 1, 0),
(545, 41, 1, 0),
(351, 36, 1, 0),
(353, 34, 1, 0),
(355, 32, 1, 0),
(521, 49, 1, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

CREATE TABLE IF NOT EXISTS `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM AUTO_INCREMENT=440 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(419, 42, 1, 1, '90.0000', '0000-00-00', '0000-00-00'),
(439, 30, 1, 2, '90.0000', '0000-00-00', '0000-00-00'),
(438, 30, 1, 1, '80.0000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(28, 20),
(28, 24),
(29, 20),
(29, 24),
(30, 20),
(30, 33),
(31, 33),
(32, 34),
(33, 20),
(33, 28),
(34, 34),
(35, 20),
(36, 34),
(40, 20),
(40, 24),
(41, 27),
(42, 20),
(42, 28),
(43, 18),
(43, 20),
(44, 18),
(44, 20),
(45, 18),
(46, 18),
(46, 20),
(47, 18),
(47, 20),
(48, 20),
(48, 34),
(49, 57);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring_description`
--

CREATE TABLE IF NOT EXISTS `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

CREATE TABLE IF NOT EXISTS `oc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

CREATE TABLE IF NOT EXISTS `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

CREATE TABLE IF NOT EXISTS `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

CREATE TABLE IF NOT EXISTS `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

CREATE TABLE IF NOT EXISTS `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

CREATE TABLE IF NOT EXISTS `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

CREATE TABLE IF NOT EXISTS `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(146, 0, 'category', 'category_status', '1', 0),
(158, 0, 'account', 'account_status', '1', 0),
(159, 0, 'affiliate', 'affiliate_status', '1', 0),
(267, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(266, 0, 'config', 'config_shared', '0', 0),
(265, 0, 'config', 'config_secure', '0', 0),
(264, 0, 'config', 'config_fraud_status_id', '7', 0),
(263, 0, 'config', 'config_fraud_score', '', 0),
(262, 0, 'config', 'config_fraud_key', '', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(261, 0, 'config', 'config_fraud_detection', '0', 0),
(260, 0, 'config', 'config_mail_alert', '', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(259, 0, 'config', 'config_mail', 'a:7:{s:8:"protocol";s:4:"mail";s:9:"parameter";s:0:"";s:13:"smtp_hostname";s:0:"";s:13:"smtp_username";s:0:"";s:13:"smtp_password";s:0:"";s:9:"smtp_port";s:0:"";s:12:"smtp_timeout";s:0:"";}', 1),
(258, 0, 'config', 'config_ftp_status', '0', 0),
(257, 0, 'config', 'config_ftp_root', '', 0),
(256, 0, 'config', 'config_ftp_password', '', 0),
(255, 0, 'config', 'config_ftp_username', '', 0),
(254, 0, 'config', 'config_ftp_port', '21', 0),
(253, 0, 'config', 'config_ftp_hostname', '', 0),
(252, 0, 'config', 'config_image_location_height', '50', 0),
(251, 0, 'config', 'config_image_location_width', '268', 0),
(250, 0, 'config', 'config_image_cart_height', '47', 0),
(249, 0, 'config', 'config_image_cart_width', '47', 0),
(248, 0, 'config', 'config_image_wishlist_height', '47', 0),
(181, 0, 'config', 'config_meta_title', 'Your Store', 0),
(182, 0, 'config', 'config_meta_description', 'My Store', 0),
(183, 0, 'config', 'config_meta_keyword', '', 0),
(184, 0, 'config', 'config_template', 'default', 0),
(185, 0, 'config', 'config_layout_id', '4', 0),
(186, 0, 'config', 'config_country_id', '222', 0),
(187, 0, 'config', 'config_zone_id', '3563', 0),
(188, 0, 'config', 'config_language', 'en', 0),
(189, 0, 'config', 'config_admin_language', 'en', 0),
(190, 0, 'config', 'config_currency', 'USD', 0),
(191, 0, 'config', 'config_currency_auto', '1', 0),
(192, 0, 'config', 'config_length_class_id', '1', 0),
(193, 0, 'config', 'config_weight_class_id', '1', 0),
(194, 0, 'config', 'config_product_count', '1', 0),
(195, 0, 'config', 'config_product_limit', '15', 0),
(196, 0, 'config', 'config_product_description_length', '100', 0),
(197, 0, 'config', 'config_limit_admin', '20', 0),
(198, 0, 'config', 'config_review_status', '1', 0),
(199, 0, 'config', 'config_review_guest', '1', 0),
(200, 0, 'config', 'config_review_mail', '0', 0),
(201, 0, 'config', 'config_voucher_min', '1', 0),
(202, 0, 'config', 'config_voucher_max', '1000', 0),
(203, 0, 'config', 'config_tax', '1', 0),
(204, 0, 'config', 'config_tax_default', 'shipping', 0),
(205, 0, 'config', 'config_tax_customer', 'shipping', 0),
(206, 0, 'config', 'config_customer_online', '0', 0),
(207, 0, 'config', 'config_customer_group_id', '1', 0),
(208, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(209, 0, 'config', 'config_customer_price', '0', 0),
(210, 0, 'config', 'config_account_id', '3', 0),
(211, 0, 'config', 'config_account_mail', '0', 0),
(212, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(283, 0, 'config', 'config_api_id', '1', 0),
(214, 0, 'config', 'config_cart_weight', '1', 0),
(215, 0, 'config', 'config_checkout_guest', '1', 0),
(216, 0, 'config', 'config_checkout_id', '5', 0),
(217, 0, 'config', 'config_order_status_id', '1', 0),
(218, 0, 'config', 'config_processing_status', 'a:1:{i:0;s:1:"2";}', 1),
(219, 0, 'config', 'config_complete_status', 'a:1:{i:0;s:1:"5";}', 1),
(220, 0, 'config', 'config_order_mail', '0', 0),
(221, 0, 'config', 'config_stock_display', '0', 0),
(222, 0, 'config', 'config_stock_warning', '0', 0),
(223, 0, 'config', 'config_stock_checkout', '0', 0),
(224, 0, 'config', 'config_affiliate_approval', '0', 0),
(225, 0, 'config', 'config_affiliate_auto', '0', 0),
(226, 0, 'config', 'config_affiliate_commission', '5', 0),
(227, 0, 'config', 'config_affiliate_id', '4', 0),
(228, 0, 'config', 'config_affiliate_mail', '0', 0),
(229, 0, 'config', 'config_return_id', '0', 0),
(230, 0, 'config', 'config_return_status_id', '2', 0),
(231, 0, 'config', 'config_logo', 'catalog/logo.png', 0),
(232, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(233, 0, 'config', 'config_image_category_width', '80', 0),
(234, 0, 'config', 'config_image_category_height', '80', 0),
(235, 0, 'config', 'config_image_thumb_width', '228', 0),
(236, 0, 'config', 'config_image_thumb_height', '228', 0),
(237, 0, 'config', 'config_image_popup_width', '500', 0),
(238, 0, 'config', 'config_image_popup_height', '500', 0),
(239, 0, 'config', 'config_image_product_width', '228', 0),
(240, 0, 'config', 'config_image_product_height', '228', 0),
(241, 0, 'config', 'config_image_additional_width', '74', 0),
(242, 0, 'config', 'config_image_additional_height', '74', 0),
(243, 0, 'config', 'config_image_related_width', '80', 0),
(244, 0, 'config', 'config_image_related_height', '80', 0),
(245, 0, 'config', 'config_image_compare_width', '90', 0),
(246, 0, 'config', 'config_image_compare_height', '90', 0),
(247, 0, 'config', 'config_image_wishlist_width', '47', 0),
(180, 0, 'config', 'config_comment', '', 0),
(179, 0, 'config', 'config_open', '', 0),
(178, 0, 'config', 'config_image', '', 0),
(177, 0, 'config', 'config_fax', '', 0),
(176, 0, 'config', 'config_telephone', '123456789', 0),
(280, 0, 'config', 'config_email', 'phucsystem@gmail.com', 0),
(174, 0, 'config', 'config_geocode', '', 0),
(172, 0, 'config', 'config_owner', 'Your Name', 0),
(173, 0, 'config', 'config_address', 'Address 1', 0),
(171, 0, 'config', 'config_name', 'Your Store', 0),
(268, 0, 'config', 'config_seo_url', '0', 0),
(269, 0, 'config', 'config_file_max_size', '300000', 0),
(270, 0, 'config', 'config_file_ext_allowed', 'txt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nrtf\r\nxls\r\nppt\r\nodt\r\nods', 0),
(271, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/vnd.microsoft.icon\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-rar-compressed\r\napplication/x-msdownload\r\napplication/vnd.ms-cab-compressed\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf\r\nimage/vnd.adobe.photoshop\r\napplication/postscript\r\napplication/msword\r\napplication/rtf\r\napplication/vnd.ms-excel\r\napplication/vnd.ms-powerpoint\r\napplication/vnd.oasis.opendocument.text\r\napplication/vnd.oasis.opendocument.spreadsheet', 0),
(272, 0, 'config', 'config_maintenance', '0', 0),
(273, 0, 'config', 'config_password', '1', 0),
(282, 0, 'config', 'config_encryption', 'e9a401fd2933cad4dc96474ae872c285', 0),
(275, 0, 'config', 'config_compression', '0', 0),
(276, 0, 'config', 'config_error_display', '1', 0),
(277, 0, 'config', 'config_error_log', '1', 0),
(278, 0, 'config', 'config_error_filename', 'error.log', 0),
(279, 0, 'config', 'config_google_analytics', '', 0),
(281, 0, 'config', 'config_url', 'http://relg.local/', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

CREATE TABLE IF NOT EXISTS `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

CREATE TABLE IF NOT EXISTS `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

CREATE TABLE IF NOT EXISTS `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_upload`
--

CREATE TABLE IF NOT EXISTS `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_url_alias`
--

CREATE TABLE IF NOT EXISTS `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=844 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(824, 'product_id=48', 'ipod-classic'),
(836, 'category_id=20', 'desktops'),
(834, 'category_id=26', 'pc'),
(835, 'category_id=27', 'mac'),
(730, 'manufacturer_id=8', 'apple'),
(772, 'information_id=4', 'about_us'),
(768, 'product_id=42', 'test'),
(789, 'category_id=34', 'mp3-players'),
(781, 'category_id=36', 'test2'),
(774, 'category_id=18', 'laptop-notebook'),
(775, 'category_id=46', 'macs'),
(776, 'category_id=45', 'windows'),
(777, 'category_id=25', 'component'),
(778, 'category_id=29', 'mouse'),
(779, 'category_id=28', 'monitor'),
(780, 'category_id=35', 'test1'),
(782, 'category_id=30', 'printer'),
(783, 'category_id=31', 'scanner'),
(784, 'category_id=32', 'web-camera'),
(785, 'category_id=57', 'tablet'),
(786, 'category_id=17', 'software'),
(787, 'category_id=24', 'smartphone'),
(788, 'category_id=33', 'camera'),
(790, 'category_id=43', 'test11'),
(791, 'category_id=44', 'test12'),
(792, 'category_id=47', 'test15'),
(793, 'category_id=48', 'test16'),
(794, 'category_id=49', 'test17'),
(795, 'category_id=50', 'test18'),
(796, 'category_id=51', 'test19'),
(797, 'category_id=52', 'test20'),
(798, 'category_id=58', 'test25'),
(799, 'category_id=53', 'test21'),
(800, 'category_id=54', 'test22'),
(801, 'category_id=55', 'test23'),
(802, 'category_id=56', 'test24'),
(803, 'category_id=38', 'test4'),
(804, 'category_id=37', 'test5'),
(805, 'category_id=39', 'test6'),
(806, 'category_id=40', 'test7'),
(807, 'category_id=41', 'test8'),
(808, 'category_id=42', 'test9'),
(809, 'product_id=30', 'canon-eos-5d'),
(840, 'product_id=47', 'hp-lp3065'),
(811, 'product_id=28', 'htc-touch-hd'),
(812, 'product_id=43', 'macbook'),
(813, 'product_id=44', 'macbook-air'),
(814, 'product_id=45', 'macbook-pro'),
(816, 'product_id=31', 'nikon-d300'),
(817, 'product_id=29', 'palm-treo-pro'),
(818, 'product_id=35', 'product-8'),
(819, 'product_id=49', 'samsung-galaxy-tab-10-1'),
(820, 'product_id=33', 'samsung-syncmaster-941bw'),
(821, 'product_id=46', 'sony-vaio'),
(837, 'product_id=41', 'imac'),
(823, 'product_id=40', 'iphone'),
(825, 'product_id=36', 'ipod-nano'),
(826, 'product_id=34', 'ipod-shuffle'),
(827, 'product_id=32', 'ipod-touch'),
(828, 'manufacturer_id=9', 'canon'),
(829, 'manufacturer_id=5', 'htc'),
(830, 'manufacturer_id=7', 'hewlett-packard'),
(831, 'manufacturer_id=6', 'palm'),
(832, 'manufacturer_id=10', 'sony'),
(841, 'information_id=6', 'delivery'),
(842, 'information_id=3', 'privacy'),
(843, 'information_id=5', 'terms');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

CREATE TABLE IF NOT EXISTS `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '9f1d6cb26e038c6d7b7b308953fa84f978945e3b', 'a87f7db5d', 'John', 'Doe', 'phucsystem@gmail.com', '', '', '127.0.0.1', 1, '2015-03-25 22:07:42'),
(2, 2, 'test', 'e10adc3949ba59abbe56e057f20f883e', '95882b586', 'test', 'test', 'phucsystem@gmail.com', '', '', '127.0.0.1', 1, '2015-03-25 22:08:41'),
(3, 3, 'master', 'e10adc3949ba59abbe56e057f20f883e', 'd17ccc609', 'loi', 'loi', '', '', '', '', 0, '2015-06-02 22:32:42');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

CREATE TABLE IF NOT EXISTS `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', 'a:2:{s:6:"access";a:181:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:17:"catalog/recurring";i:10;s:14:"catalog/review";i:11;s:18:"common/column_left";i:12;s:18:"common/filemanager";i:13;s:11:"common/menu";i:14;s:14:"common/profile";i:15;s:12:"common/stats";i:16;s:18:"dashboard/activity";i:17;s:15:"dashboard/chart";i:18;s:18:"dashboard/customer";i:19;s:13:"dashboard/map";i:20;s:16:"dashboard/online";i:21;s:15:"dashboard/order";i:22;s:16:"dashboard/recent";i:23;s:14:"dashboard/sale";i:24;s:13:"design/banner";i:25;s:13:"design/layout";i:26;s:14:"extension/feed";i:27;s:19:"extension/installer";i:28;s:22:"extension/modification";i:29;s:16:"extension/module";i:30;s:17:"extension/openbay";i:31;s:17:"extension/payment";i:32;s:18:"extension/shipping";i:33;s:15:"extension/total";i:34;s:16:"feed/google_base";i:35;s:19:"feed/google_sitemap";i:36;s:15:"feed/openbaypro";i:37;s:20:"localisation/country";i:38;s:21:"localisation/currency";i:39;s:21:"localisation/geo_zone";i:40;s:21:"localisation/language";i:41;s:25:"localisation/length_class";i:42;s:21:"localisation/location";i:43;s:25:"localisation/order_status";i:44;s:26:"localisation/return_action";i:45;s:26:"localisation/return_reason";i:46;s:26:"localisation/return_status";i:47;s:25:"localisation/stock_status";i:48;s:22:"localisation/tax_class";i:49;s:21:"localisation/tax_rate";i:50;s:25:"localisation/weight_class";i:51;s:17:"localisation/zone";i:52;s:19:"marketing/affiliate";i:53;s:17:"marketing/contact";i:54;s:16:"marketing/coupon";i:55;s:19:"marketing/marketing";i:56;s:14:"module/account";i:57;s:16:"module/affiliate";i:58;s:20:"module/amazon_button";i:59;s:13:"module/banner";i:60;s:17:"module/bestseller";i:61;s:15:"module/carousel";i:62;s:15:"module/category";i:63;s:11:"module/ebay";i:64;s:15:"module/featured";i:65;s:13:"module/filter";i:66;s:22:"module/google_hangouts";i:67;s:11:"module/html";i:68;s:18:"module/information";i:69;s:13:"module/latest";i:70;s:16:"module/pp_button";i:71;s:15:"module/pp_login";i:72;s:16:"module/slideshow";i:73;s:14:"module/special";i:74;s:12:"module/store";i:75;s:14:"openbay/amazon";i:76;s:22:"openbay/amazon_listing";i:77;s:22:"openbay/amazon_product";i:78;s:16:"openbay/amazonus";i:79;s:24:"openbay/amazonus_listing";i:80;s:24:"openbay/amazonus_product";i:81;s:12:"openbay/ebay";i:82;s:20:"openbay/ebay_profile";i:83;s:21:"openbay/ebay_template";i:84;s:12:"openbay/etsy";i:85;s:20:"openbay/etsy_product";i:86;s:21:"openbay/etsy_shipping";i:87;s:17:"openbay/etsy_shop";i:88;s:23:"payment/amazon_checkout";i:89;s:24:"payment/authorizenet_aim";i:90;s:24:"payment/authorizenet_sim";i:91;s:21:"payment/bank_transfer";i:92;s:22:"payment/bluepay_hosted";i:93;s:24:"payment/bluepay_redirect";i:94;s:14:"payment/cheque";i:95;s:11:"payment/cod";i:96;s:17:"payment/firstdata";i:97;s:24:"payment/firstdata_remote";i:98;s:21:"payment/free_checkout";i:99;s:22:"payment/klarna_account";i:100;s:22:"payment/klarna_invoice";i:101;s:14:"payment/liqpay";i:102;s:14:"payment/nochex";i:103;s:15:"payment/paymate";i:104;s:16:"payment/paypoint";i:105;s:13:"payment/payza";i:106;s:26:"payment/perpetual_payments";i:107;s:18:"payment/pp_express";i:108;s:18:"payment/pp_payflow";i:109;s:25:"payment/pp_payflow_iframe";i:110;s:14:"payment/pp_pro";i:111;s:21:"payment/pp_pro_iframe";i:112;s:19:"payment/pp_standard";i:113;s:14:"payment/realex";i:114;s:21:"payment/realex_remote";i:115;s:22:"payment/sagepay_direct";i:116;s:22:"payment/sagepay_server";i:117;s:18:"payment/sagepay_us";i:118;s:24:"payment/securetrading_pp";i:119;s:24:"payment/securetrading_ws";i:120;s:14:"payment/skrill";i:121;s:19:"payment/twocheckout";i:122;s:28:"payment/web_payment_software";i:123;s:16:"payment/worldpay";i:124;s:16:"report/affiliate";i:125;s:25:"report/affiliate_activity";i:126;s:22:"report/affiliate_login";i:127;s:24:"report/customer_activity";i:128;s:22:"report/customer_credit";i:129;s:21:"report/customer_login";i:130;s:22:"report/customer_online";i:131;s:21:"report/customer_order";i:132;s:22:"report/customer_reward";i:133;s:16:"report/marketing";i:134;s:24:"report/product_purchased";i:135;s:21:"report/product_viewed";i:136;s:18:"report/sale_coupon";i:137;s:17:"report/sale_order";i:138;s:18:"report/sale_return";i:139;s:20:"report/sale_shipping";i:140;s:15:"report/sale_tax";i:141;s:17:"sale/custom_field";i:142;s:13:"sale/customer";i:143;s:20:"sale/customer_ban_ip";i:144;s:19:"sale/customer_group";i:145;s:10:"sale/order";i:146;s:14:"sale/recurring";i:147;s:11:"sale/return";i:148;s:12:"sale/voucher";i:149;s:18:"sale/voucher_theme";i:150;s:15:"setting/setting";i:151;s:13:"setting/store";i:152;s:16:"shipping/auspost";i:153;s:17:"shipping/citylink";i:154;s:14:"shipping/fedex";i:155;s:13:"shipping/flat";i:156;s:13:"shipping/free";i:157;s:13:"shipping/item";i:158;s:23:"shipping/parcelforce_48";i:159;s:15:"shipping/pickup";i:160;s:19:"shipping/royal_mail";i:161;s:12:"shipping/ups";i:162;s:13:"shipping/usps";i:163;s:15:"shipping/weight";i:164;s:11:"tool/backup";i:165;s:14:"tool/error_log";i:166;s:11:"tool/upload";i:167;s:12:"total/coupon";i:168;s:12:"total/credit";i:169;s:14:"total/handling";i:170;s:16:"total/klarna_fee";i:171;s:19:"total/low_order_fee";i:172;s:12:"total/reward";i:173;s:14:"total/shipping";i:174;s:15:"total/sub_total";i:175;s:9:"total/tax";i:176;s:11:"total/total";i:177;s:13:"total/voucher";i:178;s:8:"user/api";i:179;s:9:"user/user";i:180;s:20:"user/user_permission";}s:6:"modify";a:181:{i:0;s:17:"catalog/attribute";i:1;s:23:"catalog/attribute_group";i:2;s:16:"catalog/category";i:3;s:16:"catalog/download";i:4;s:14:"catalog/filter";i:5;s:19:"catalog/information";i:6;s:20:"catalog/manufacturer";i:7;s:14:"catalog/option";i:8;s:15:"catalog/product";i:9;s:17:"catalog/recurring";i:10;s:14:"catalog/review";i:11;s:18:"common/column_left";i:12;s:18:"common/filemanager";i:13;s:11:"common/menu";i:14;s:14:"common/profile";i:15;s:12:"common/stats";i:16;s:18:"dashboard/activity";i:17;s:15:"dashboard/chart";i:18;s:18:"dashboard/customer";i:19;s:13:"dashboard/map";i:20;s:16:"dashboard/online";i:21;s:15:"dashboard/order";i:22;s:16:"dashboard/recent";i:23;s:14:"dashboard/sale";i:24;s:13:"design/banner";i:25;s:13:"design/layout";i:26;s:14:"extension/feed";i:27;s:19:"extension/installer";i:28;s:22:"extension/modification";i:29;s:16:"extension/module";i:30;s:17:"extension/openbay";i:31;s:17:"extension/payment";i:32;s:18:"extension/shipping";i:33;s:15:"extension/total";i:34;s:16:"feed/google_base";i:35;s:19:"feed/google_sitemap";i:36;s:15:"feed/openbaypro";i:37;s:20:"localisation/country";i:38;s:21:"localisation/currency";i:39;s:21:"localisation/geo_zone";i:40;s:21:"localisation/language";i:41;s:25:"localisation/length_class";i:42;s:21:"localisation/location";i:43;s:25:"localisation/order_status";i:44;s:26:"localisation/return_action";i:45;s:26:"localisation/return_reason";i:46;s:26:"localisation/return_status";i:47;s:25:"localisation/stock_status";i:48;s:22:"localisation/tax_class";i:49;s:21:"localisation/tax_rate";i:50;s:25:"localisation/weight_class";i:51;s:17:"localisation/zone";i:52;s:19:"marketing/affiliate";i:53;s:17:"marketing/contact";i:54;s:16:"marketing/coupon";i:55;s:19:"marketing/marketing";i:56;s:14:"module/account";i:57;s:16:"module/affiliate";i:58;s:20:"module/amazon_button";i:59;s:13:"module/banner";i:60;s:17:"module/bestseller";i:61;s:15:"module/carousel";i:62;s:15:"module/category";i:63;s:11:"module/ebay";i:64;s:15:"module/featured";i:65;s:13:"module/filter";i:66;s:22:"module/google_hangouts";i:67;s:11:"module/html";i:68;s:18:"module/information";i:69;s:13:"module/latest";i:70;s:16:"module/pp_button";i:71;s:15:"module/pp_login";i:72;s:16:"module/slideshow";i:73;s:14:"module/special";i:74;s:12:"module/store";i:75;s:14:"openbay/amazon";i:76;s:22:"openbay/amazon_listing";i:77;s:22:"openbay/amazon_product";i:78;s:16:"openbay/amazonus";i:79;s:24:"openbay/amazonus_listing";i:80;s:24:"openbay/amazonus_product";i:81;s:12:"openbay/ebay";i:82;s:20:"openbay/ebay_profile";i:83;s:21:"openbay/ebay_template";i:84;s:12:"openbay/etsy";i:85;s:20:"openbay/etsy_product";i:86;s:21:"openbay/etsy_shipping";i:87;s:17:"openbay/etsy_shop";i:88;s:23:"payment/amazon_checkout";i:89;s:24:"payment/authorizenet_aim";i:90;s:24:"payment/authorizenet_sim";i:91;s:21:"payment/bank_transfer";i:92;s:22:"payment/bluepay_hosted";i:93;s:24:"payment/bluepay_redirect";i:94;s:14:"payment/cheque";i:95;s:11:"payment/cod";i:96;s:17:"payment/firstdata";i:97;s:24:"payment/firstdata_remote";i:98;s:21:"payment/free_checkout";i:99;s:22:"payment/klarna_account";i:100;s:22:"payment/klarna_invoice";i:101;s:14:"payment/liqpay";i:102;s:14:"payment/nochex";i:103;s:15:"payment/paymate";i:104;s:16:"payment/paypoint";i:105;s:13:"payment/payza";i:106;s:26:"payment/perpetual_payments";i:107;s:18:"payment/pp_express";i:108;s:18:"payment/pp_payflow";i:109;s:25:"payment/pp_payflow_iframe";i:110;s:14:"payment/pp_pro";i:111;s:21:"payment/pp_pro_iframe";i:112;s:19:"payment/pp_standard";i:113;s:14:"payment/realex";i:114;s:21:"payment/realex_remote";i:115;s:22:"payment/sagepay_direct";i:116;s:22:"payment/sagepay_server";i:117;s:18:"payment/sagepay_us";i:118;s:24:"payment/securetrading_pp";i:119;s:24:"payment/securetrading_ws";i:120;s:14:"payment/skrill";i:121;s:19:"payment/twocheckout";i:122;s:28:"payment/web_payment_software";i:123;s:16:"payment/worldpay";i:124;s:16:"report/affiliate";i:125;s:25:"report/affiliate_activity";i:126;s:22:"report/affiliate_login";i:127;s:24:"report/customer_activity";i:128;s:22:"report/customer_credit";i:129;s:21:"report/customer_login";i:130;s:22:"report/customer_online";i:131;s:21:"report/customer_order";i:132;s:22:"report/customer_reward";i:133;s:16:"report/marketing";i:134;s:24:"report/product_purchased";i:135;s:21:"report/product_viewed";i:136;s:18:"report/sale_coupon";i:137;s:17:"report/sale_order";i:138;s:18:"report/sale_return";i:139;s:20:"report/sale_shipping";i:140;s:15:"report/sale_tax";i:141;s:17:"sale/custom_field";i:142;s:13:"sale/customer";i:143;s:20:"sale/customer_ban_ip";i:144;s:19:"sale/customer_group";i:145;s:10:"sale/order";i:146;s:14:"sale/recurring";i:147;s:11:"sale/return";i:148;s:12:"sale/voucher";i:149;s:18:"sale/voucher_theme";i:150;s:15:"setting/setting";i:151;s:13:"setting/store";i:152;s:16:"shipping/auspost";i:153;s:17:"shipping/citylink";i:154;s:14:"shipping/fedex";i:155;s:13:"shipping/flat";i:156;s:13:"shipping/free";i:157;s:13:"shipping/item";i:158;s:23:"shipping/parcelforce_48";i:159;s:15:"shipping/pickup";i:160;s:19:"shipping/royal_mail";i:161;s:12:"shipping/ups";i:162;s:13:"shipping/usps";i:163;s:15:"shipping/weight";i:164;s:11:"tool/backup";i:165;s:14:"tool/error_log";i:166;s:11:"tool/upload";i:167;s:12:"total/coupon";i:168;s:12:"total/credit";i:169;s:14:"total/handling";i:170;s:16:"total/klarna_fee";i:171;s:19:"total/low_order_fee";i:172;s:12:"total/reward";i:173;s:14:"total/shipping";i:174;s:15:"total/sub_total";i:175;s:9:"total/tax";i:176;s:11:"total/total";i:177;s:13:"total/voucher";i:178;s:8:"user/api";i:179;s:9:"user/user";i:180;s:20:"user/user_permission";}}'),
(10, 'Demonstration', ''),
(2, 'Player', ''),
(3, 'Game Master', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=4225 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Pondicherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkas''ka Oblast''', '71', 1),
(3481, 220, 'Chernihivs''ka Oblast''', '74', 1),
(3482, 220, 'Chernivets''ka Oblast''', '77', 1),
(3483, 220, 'Crimea', '43', 1),
(3484, 220, 'Dnipropetrovs''ka Oblast''', '12', 1),
(3485, 220, 'Donets''ka Oblast''', '14', 1),
(3486, 220, 'Ivano-Frankivs''ka Oblast''', '26', 1),
(3487, 220, 'Khersons''ka Oblast''', '65', 1),
(3488, 220, 'Khmel''nyts''ka Oblast''', '68', 1),
(3489, 220, 'Kirovohrads''ka Oblast''', '35', 1),
(3490, 220, 'Kyiv', '30', 1),
(3491, 220, 'Kyivs''ka Oblast''', '32', 1),
(3492, 220, 'Luhans''ka Oblast''', '09', 1),
(3493, 220, 'L''vivs''ka Oblast''', '46', 1),
(3494, 220, 'Mykolayivs''ka Oblast''', '48', 1),
(3495, 220, 'Odes''ka Oblast''', '51', 1),
(3496, 220, 'Poltavs''ka Oblast''', '53', 1),
(3497, 220, 'Rivnens''ka Oblast''', '56', 1),
(3498, 220, 'Sevastopol''', '40', 1),
(3499, 220, 'Sums''ka Oblast''', '59', 1),
(3500, 220, 'Ternopil''s''ka Oblast''', '61', 1),
(3501, 220, 'Vinnyts''ka Oblast''', '05', 1),
(3502, 220, 'Volyns''ka Oblast''', '07', 1),
(3503, 220, 'Zakarpats''ka Oblast''', '21', 1),
(3504, 220, 'Zaporiz''ka Oblast''', '23', 1),
(3505, 220, 'Zhytomyrs''ka oblast''', '18', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubayy', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Kharkivs''ka Oblast''', '63', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_components`
--

CREATE TABLE IF NOT EXISTS `tbl_components` (
  `id` int(16) NOT NULL,
  `name` varchar(16) COLLATE utf8_bin NOT NULL,
  `inhouse_manufacturing` int(1) NOT NULL DEFAULT '0',
  `allowance_id` int(16) NOT NULL,
  `is_default` int(1) DEFAULT '0',
  `team_id` int(16) DEFAULT NULL,
  `round_id` int(16) DEFAULT NULL,
  `require` int(1) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=1398 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_components`
--

INSERT INTO `tbl_components` (`id`, `name`, `inhouse_manufacturing`, `allowance_id`, `is_default`, `team_id`, `round_id`, `require`) VALUES
(25, 'Seat', 0, 0, 1, 0, 0, 0),
(26, 'Handle bars', 0, 0, 1, 0, 0, 0),
(27, 'Frame', 0, 0, 1, 0, 0, 0),
(28, 'Casing', 1, 0, 1, 0, 0, 0),
(29, 'Motor', 0, 0, 1, 0, 0, 0),
(32, 'Wheels', 0, 0, 1, 0, 0, 0),
(31, 'Light', 0, 0, 1, 0, 0, 0),
(33, 'Braking system', 0, 0, 1, 0, 0, 0),
(34, 'Shock absorber', 0, 0, 1, 0, 0, 0),
(35, 'Accumulator', 0, 0, 1, 0, 0, 0),
(364, 'accumulator', 1, 0, 0, NULL, 1, 0),
(363, 'accumulator', 1, 0, 0, NULL, 1, 0),
(362, 'accumulator', 1, 0, 0, NULL, 1, 0),
(361, 'accumulator', 1, 0, 0, NULL, 1, 0),
(360, 'accumulator', 1, 0, 0, NULL, 1, 0),
(359, 'accumulator', 1, 0, 0, NULL, 1, 0),
(358, 'accumulator', 1, 0, 0, NULL, 1, 0),
(599, 'Handle bars', 1, 0, 0, 98, 1, 1),
(357, 'accumulator', 1, 0, 0, NULL, 1, 0),
(356, 'accumulator', 1, 0, 0, NULL, 1, 0),
(598, 'Seat', 1, 0, 0, 98, 1, 1),
(365, 'accumulator', 1, 0, 0, NULL, 1, 0),
(589, 'Handle bars', 1, 0, 0, 97, 1, 1),
(588, 'Seat', 1, 0, 0, 97, 1, 1),
(587, 'Accumulator', 1, 0, 0, 96, 1, 1),
(586, 'Shock absorber', 0, 0, 0, 96, 1, 1),
(585, 'Braking system', 1, 0, 0, 96, 1, 1),
(584, 'Wheels', 1, 0, 0, 96, 1, 1),
(583, 'Light', 0, 0, 0, 96, 1, 1),
(582, 'Motor', 0, 0, 0, 96, 1, 1),
(581, 'Casing', 1, 0, 0, 96, 1, 1),
(580, 'Frame', 1, 0, 0, 96, 1, 1),
(579, 'Handle bars', 1, 0, 0, 96, 1, 1),
(578, 'Seat', 1, 0, 0, 96, 1, 1),
(607, 'Accumulator', 1, 0, 0, 98, 1, 1),
(606, 'Shock absorber', 0, 0, 0, 98, 1, 1),
(605, 'Braking system', 1, 0, 0, 98, 1, 1),
(604, 'Wheels', 1, 0, 0, 98, 1, 1),
(603, 'Light', 0, 0, 0, 98, 1, 1),
(602, 'Motor', 0, 0, 0, 98, 1, 1),
(601, 'Casing', 1, 0, 0, 98, 1, 1),
(600, 'Frame', 1, 0, 0, 98, 1, 1),
(597, 'Accumulator', 1, 0, 0, 97, 1, 1),
(596, 'Shock absorber', 0, 0, 0, 97, 1, 1),
(595, 'Braking system', 1, 0, 0, 97, 1, 1),
(594, 'Wheels', 1, 0, 0, 97, 1, 1),
(593, 'Light', 0, 0, 0, 97, 1, 1),
(592, 'Motor', 0, 0, 0, 97, 1, 1),
(591, 'Casing', 1, 0, 0, 97, 1, 1),
(590, 'Frame', 1, 0, 0, 97, 1, 1),
(615, 'Braking system', 1, 0, 0, 98, 2, 1),
(608, 'Seat', 1, 0, 0, 98, 2, 1),
(614, 'Wheels', 1, 0, 0, 98, 2, 1),
(613, 'Light', 0, 0, 0, 98, 2, 1),
(612, 'Motor', 0, 0, 0, 98, 2, 1),
(611, 'Casing', 1, 0, 0, 98, 2, 1),
(610, 'Frame', 1, 0, 0, 98, 2, 1),
(609, 'Handle bars', 1, 0, 0, 98, 2, 1),
(622, 'Motor', 0, 0, 0, 99, 1, 1),
(621, 'Casing', 1, 0, 0, 99, 1, 1),
(620, 'Frame', 1, 0, 0, 99, 1, 1),
(619, 'Handle bars', 1, 0, 0, 99, 1, 1),
(618, 'Seat', 1, 0, 0, 99, 1, 1),
(617, 'Accumulator', 1, 0, 0, 98, 2, 1),
(616, 'Shock absorber', 0, 0, 0, 98, 2, 1),
(498, 'Seat', 1, 0, 0, NULL, 1, 1),
(499, 'Handle bars', 1, 0, 0, NULL, 1, 1),
(500, 'Frame', 1, 0, 0, NULL, 1, 1),
(501, 'Casing', 1, 0, 0, NULL, 1, 1),
(502, 'Motor', 0, 0, 0, NULL, 1, 1),
(503, 'Light', 0, 0, 0, NULL, 1, 1),
(504, 'Wheels', 1, 0, 0, NULL, 1, 1),
(505, 'Braking system', 1, 0, 0, NULL, 1, 1),
(506, 'Shock absorber', 0, 0, 0, NULL, 1, 1),
(507, 'Accumulator', 1, 0, 0, NULL, 1, 1),
(508, 'Seat', 1, 0, 0, NULL, 1, 1),
(509, 'Handle bars', 1, 0, 0, NULL, 1, 1),
(510, 'Frame', 1, 0, 0, NULL, 1, 1),
(511, 'Casing', 1, 0, 0, NULL, 1, 1),
(512, 'Motor', 0, 0, 0, NULL, 1, 1),
(513, 'Light', 0, 0, 0, NULL, 1, 1),
(514, 'Wheels', 1, 0, 0, NULL, 1, 1),
(515, 'Braking system', 1, 0, 0, NULL, 1, 1),
(516, 'Shock absorber', 0, 0, 0, NULL, 1, 1),
(517, 'Accumulator', 1, 0, 0, NULL, 1, 1),
(630, 'Frame', 1, 0, 0, 99, 2, 1),
(629, 'Handle bars', 1, 0, 0, 99, 2, 1),
(628, 'Seat', 1, 0, 0, 99, 2, 1),
(627, 'Accumulator', 1, 0, 0, 99, 1, 1),
(626, 'Shock absorber', 0, 0, 0, 99, 1, 1),
(625, 'Braking system', 1, 0, 0, 99, 1, 1),
(624, 'Wheels', 1, 0, 0, 99, 1, 1),
(623, 'Light', 0, 0, 0, 99, 1, 1),
(637, 'Accumulator', 1, 0, 0, 99, 2, 1),
(636, 'Shock absorber', 0, 0, 0, 99, 2, 1),
(635, 'Braking system', 1, 0, 0, 99, 2, 1),
(634, 'Wheels', 1, 0, 0, 99, 2, 1),
(633, 'Light', 0, 0, 0, 99, 2, 1),
(632, 'Motor', 0, 0, 0, 99, 2, 1),
(631, 'Casing', 1, 0, 0, 99, 2, 1),
(659, 'Handle bars', 1, 0, 0, 101, 1, 1),
(658, 'Seat', 1, 0, 0, 101, 1, 1),
(657, 'Accumulator', 1, 0, 0, 100, 2, 1),
(656, 'Shock absorber', 0, 0, 0, 100, 2, 1),
(655, 'Braking system', 1, 0, 0, 100, 2, 1),
(654, 'Wheels', 1, 0, 0, 100, 2, 1),
(653, 'Light', 0, 0, 0, 100, 2, 1),
(652, 'Motor', 0, 0, 0, 100, 2, 1),
(651, 'Casing', 1, 0, 0, 100, 2, 1),
(650, 'Frame', 1, 0, 0, 100, 2, 1),
(649, 'Handle bars', 1, 0, 0, 100, 2, 1),
(648, 'Seat', 1, 0, 0, 100, 2, 1),
(647, 'Accumulator', 1, 0, 0, 100, 1, 1),
(646, 'Shock absorber', 0, 0, 0, 100, 1, 1),
(645, 'Braking system', 1, 0, 0, 100, 1, 1),
(644, 'Wheels', 1, 0, 0, 100, 1, 1),
(643, 'Light', 0, 0, 0, 100, 1, 1),
(642, 'Motor', 0, 0, 0, 100, 1, 1),
(641, 'Casing', 1, 0, 0, 100, 1, 1),
(640, 'Frame', 1, 0, 0, 100, 1, 1),
(639, 'Handle bars', 1, 0, 0, 100, 1, 1),
(638, 'Seat', 1, 0, 0, 100, 1, 1),
(666, 'Shock absorber', 0, 0, 0, 101, 1, 1),
(665, 'Braking system', 1, 0, 0, 101, 1, 1),
(664, 'Wheels', 1, 0, 0, 101, 1, 1),
(663, 'Light', 0, 0, 0, 101, 1, 1),
(662, 'Motor', 0, 0, 0, 101, 1, 1),
(661, 'Casing', 1, 0, 0, 101, 1, 1),
(660, 'Frame', 1, 0, 0, 101, 1, 1),
(667, 'Accumulator', 1, 0, 0, 101, 1, 1),
(668, 'Seat', 1, 0, 0, 101, 2, 1),
(669, 'Handle bars', 1, 0, 0, 101, 2, 1),
(670, 'Frame', 1, 0, 0, 101, 2, 1),
(671, 'Casing', 1, 0, 0, 101, 2, 1),
(672, 'Motor', 0, 0, 0, 101, 2, 1),
(673, 'Light', 0, 0, 0, 101, 2, 1),
(674, 'Wheels', 1, 0, 0, 101, 2, 1),
(675, 'Braking system', 1, 0, 0, 101, 2, 1),
(676, 'Shock absorber', 0, 0, 0, 101, 2, 1),
(677, 'Accumulator', 1, 0, 0, 101, 2, 1),
(678, 'Seat', 1, 0, 0, 102, 1, 1),
(679, 'Handle bars', 1, 0, 0, 102, 1, 1),
(680, 'Frame', 1, 0, 0, 102, 1, 1),
(681, 'Casing', 1, 0, 0, 102, 1, 1),
(682, 'Motor', 0, 0, 0, 102, 1, 1),
(683, 'Light', 0, 0, 0, 102, 1, 1),
(684, 'Wheels', 1, 0, 0, 102, 1, 1),
(685, 'Braking system', 1, 0, 0, 102, 1, 1),
(686, 'Shock absorber', 0, 0, 0, 102, 1, 1),
(687, 'Accumulator', 1, 0, 0, 102, 1, 1),
(688, 'Seat', 1, 0, 0, 102, 2, 1),
(689, 'Handle bars', 1, 0, 0, 102, 2, 1),
(690, 'Frame', 1, 0, 0, 102, 2, 1),
(691, 'Casing', 1, 0, 0, 102, 2, 1),
(692, 'Motor', 0, 0, 0, 102, 2, 1),
(693, 'Light', 0, 0, 0, 102, 2, 1),
(694, 'Wheels', 1, 0, 0, 102, 2, 1),
(695, 'Braking system', 1, 0, 0, 102, 2, 1),
(696, 'Shock absorber', 0, 0, 0, 102, 2, 1),
(697, 'Accumulator', 1, 0, 0, 102, 2, 1),
(698, 'Seat', 1, 0, 0, 103, 1, 1),
(699, 'Handle bars', 1, 0, 0, 103, 1, 1),
(700, 'Frame', 1, 0, 0, 103, 1, 1),
(701, 'Casing', 1, 0, 0, 103, 1, 1),
(702, 'Motor', 0, 0, 0, 103, 1, 1),
(703, 'Light', 0, 0, 0, 103, 1, 1),
(704, 'Wheels', 1, 0, 0, 103, 1, 1),
(705, 'Braking system', 1, 0, 0, 103, 1, 1),
(706, 'Shock absorber', 0, 0, 0, 103, 1, 1),
(707, 'Accumulator', 1, 0, 0, 103, 1, 1),
(786, 'Shock absorber', 0, 0, 0, 111, 1, 0),
(785, 'Braking system', 0, 0, 0, 111, 1, 0),
(784, 'Wheels', 0, 0, 0, 111, 1, 0),
(783, 'Light', 0, 0, 0, 111, 1, 0),
(782, 'Motor', 0, 0, 0, 111, 1, 0),
(781, 'Casing', 1, 0, 0, 111, 1, 0),
(780, 'Frame', 0, 0, 0, 111, 1, 0),
(779, 'Handle bars', 0, 0, 0, 111, 1, 0),
(778, 'Seat', 0, 0, 0, 111, 1, 0),
(776, 'Shock absorber', 0, 0, 0, 110, 1, 0),
(775, 'Braking system', 0, 0, 0, 110, 1, 0),
(774, 'Wheels', 0, 0, 0, 110, 1, 0),
(773, 'Light', 0, 0, 0, 110, 1, 0),
(772, 'Motor', 0, 0, 0, 110, 1, 0),
(771, 'Casing', 1, 0, 0, 110, 1, 0),
(770, 'Frame', 0, 0, 0, 110, 1, 0),
(769, 'Handle bars', 0, 0, 0, 110, 1, 0),
(768, 'Seat', 0, 0, 0, 110, 1, 0),
(756, 'Shock absorber', 0, 0, 0, 108, 1, 0),
(755, 'Braking system', 0, 0, 0, 108, 1, 0),
(754, 'Wheels', 0, 0, 0, 108, 1, 0),
(753, 'Light', 0, 0, 0, 108, 1, 0),
(752, 'Motor', 0, 0, 0, 108, 1, 0),
(751, 'Casing', 1, 0, 0, 108, 1, 0),
(750, 'Frame', 0, 0, 0, 108, 1, 0),
(749, 'Handle bars', 0, 0, 0, 108, 1, 0),
(748, 'Seat', 0, 0, 0, 108, 1, 0),
(766, 'Shock absorber', 0, 0, 0, 109, 1, 0),
(765, 'Braking system', 0, 0, 0, 109, 1, 0),
(764, 'Wheels', 0, 0, 0, 109, 1, 0),
(763, 'Light', 0, 0, 0, 109, 1, 0),
(762, 'Motor', 0, 0, 0, 109, 1, 0),
(761, 'Casing', 1, 0, 0, 109, 1, 0),
(760, 'Frame', 0, 0, 0, 109, 1, 0),
(759, 'Handle bars', 0, 0, 0, 109, 1, 0),
(758, 'Seat', 0, 0, 0, 109, 1, 0),
(757, 'Accumulator', 0, 0, 0, 108, 1, 0),
(767, 'Accumulator', 0, 0, 0, 109, 1, 0),
(777, 'Accumulator', 0, 0, 0, 110, 1, 0),
(787, 'Accumulator', 0, 0, 0, 111, 1, 0),
(980, 'Frame', 0, 0, 0, 116, 4, 0),
(979, 'Handle bars', 0, 0, 0, 116, 4, 0),
(978, 'Seat', 0, 0, 0, 116, 4, 0),
(977, 'Accumulator', 0, 0, 0, 116, 3, 0),
(976, 'Shock absorber', 0, 0, 0, 116, 3, 0),
(975, 'Braking system', 0, 0, 0, 116, 3, 0),
(974, 'Wheels', 0, 0, 0, 116, 3, 0),
(973, 'Light', 0, 0, 0, 116, 3, 0),
(972, 'Motor', 0, 0, 0, 116, 3, 0),
(971, 'Casing', 1, 0, 0, 116, 3, 0),
(970, 'Frame', 0, 0, 0, 116, 3, 0),
(969, 'Handle bars', 0, 0, 0, 116, 3, 0),
(968, 'Seat', 0, 0, 0, 116, 3, 0),
(967, 'Accumulator', 0, 0, 0, 116, 2, 0),
(966, 'Shock absorber', 0, 0, 0, 116, 2, 0),
(965, 'Braking system', 0, 0, 0, 116, 2, 0),
(964, 'Wheels', 0, 0, 0, 116, 2, 0),
(963, 'Light', 0, 0, 0, 116, 2, 0),
(962, 'Motor', 0, 0, 0, 116, 2, 0),
(961, 'Casing', 1, 0, 0, 116, 2, 0),
(960, 'Frame', 0, 0, 0, 116, 2, 0),
(959, 'Handle bars', 0, 0, 0, 116, 2, 0),
(958, 'Seat', 0, 0, 0, 116, 2, 0),
(957, 'Accumulator', 0, 0, 0, 116, 1, 0),
(956, 'Shock absorber', 0, 0, 0, 116, 1, 0),
(955, 'Braking system', 0, 0, 0, 116, 1, 0),
(954, 'Wheels', 0, 0, 0, 116, 1, 0),
(953, 'Light', 0, 0, 0, 116, 1, 0),
(952, 'Motor', 0, 0, 0, 116, 1, 0),
(951, 'Casing', 1, 0, 0, 116, 1, 0),
(950, 'Frame', 0, 0, 0, 116, 1, 0),
(949, 'Handle bars', 0, 0, 0, 116, 1, 0),
(948, 'Seat', 0, 0, 0, 116, 1, 0),
(1060, 'Frame', 0, 0, 0, 118, 4, 0),
(1059, 'Handle bars', 0, 0, 0, 118, 4, 0),
(1058, 'Seat', 0, 0, 0, 118, 4, 0),
(1057, 'Accumulator', 0, 0, 0, 118, 3, 0),
(1056, 'Shock absorber', 0, 0, 0, 118, 3, 0),
(1055, 'Braking system', 0, 0, 0, 118, 3, 0),
(1054, 'Wheels', 0, 0, 0, 118, 3, 0),
(1053, 'Light', 0, 0, 0, 118, 3, 0),
(1052, 'Motor', 0, 0, 0, 118, 3, 0),
(1051, 'Casing', 1, 0, 0, 118, 3, 0),
(1050, 'Frame', 0, 0, 0, 118, 3, 0),
(1049, 'Handle bars', 0, 0, 0, 118, 3, 0),
(1048, 'Seat', 0, 0, 0, 118, 3, 0),
(1047, 'Accumulator', 0, 0, 0, 118, 2, 0),
(1046, 'Shock absorber', 0, 0, 0, 118, 2, 0),
(1045, 'Braking system', 0, 0, 0, 118, 2, 0),
(1044, 'Wheels', 0, 0, 0, 118, 2, 0),
(1043, 'Light', 0, 0, 0, 118, 2, 0),
(1042, 'Motor', 0, 0, 0, 118, 2, 0),
(1041, 'Casing', 1, 0, 0, 118, 2, 0),
(1040, 'Frame', 0, 0, 0, 118, 2, 0),
(1039, 'Handle bars', 0, 0, 0, 118, 2, 0),
(1038, 'Seat', 0, 0, 0, 118, 2, 0),
(1037, 'Accumulator', 0, 0, 0, 118, 1, 0),
(1036, 'Shock absorber', 0, 0, 0, 118, 1, 0),
(1035, 'Braking system', 0, 0, 0, 118, 1, 0),
(1034, 'Wheels', 0, 0, 0, 118, 1, 0),
(1033, 'Light', 0, 0, 0, 118, 1, 0),
(1032, 'Motor', 0, 0, 0, 118, 1, 0),
(1031, 'Casing', 1, 0, 0, 118, 1, 0),
(1030, 'Frame', 0, 0, 0, 118, 1, 0),
(1029, 'Handle bars', 0, 0, 0, 118, 1, 0),
(1028, 'Seat', 0, 0, 0, 118, 1, 0),
(1020, 'Frame', 0, 0, 0, 117, 4, 0),
(1019, 'Handle bars', 0, 0, 0, 117, 4, 0),
(1018, 'Seat', 0, 0, 0, 117, 4, 0),
(1017, 'Accumulator', 0, 0, 0, 117, 3, 0),
(1016, 'Shock absorber', 0, 0, 0, 117, 3, 0),
(1015, 'Braking system', 0, 0, 0, 117, 3, 0),
(1014, 'Wheels', 0, 0, 0, 117, 3, 0),
(1013, 'Light', 0, 0, 0, 117, 3, 0),
(1012, 'Motor', 0, 0, 0, 117, 3, 0),
(1011, 'Casing', 1, 0, 0, 117, 3, 0),
(1010, 'Frame', 0, 0, 0, 117, 3, 0),
(1009, 'Handle bars', 0, 0, 0, 117, 3, 0),
(1008, 'Seat', 0, 0, 0, 117, 3, 0),
(1007, 'Accumulator', 0, 0, 0, 117, 2, 0),
(1006, 'Shock absorber', 0, 0, 0, 117, 2, 0),
(1005, 'Braking system', 0, 0, 0, 117, 2, 0),
(1004, 'Wheels', 0, 0, 0, 117, 2, 0),
(1003, 'Light', 0, 0, 0, 117, 2, 0),
(1002, 'Motor', 0, 0, 0, 117, 2, 0),
(1001, 'Casing', 1, 0, 0, 117, 2, 0),
(1000, 'Frame', 0, 0, 0, 117, 2, 0),
(999, 'Handle bars', 0, 0, 0, 117, 2, 0),
(998, 'Seat', 0, 0, 0, 117, 2, 0),
(997, 'Accumulator', 0, 0, 0, 117, 1, 0),
(996, 'Shock absorber', 0, 0, 0, 117, 1, 0),
(995, 'Braking system', 0, 0, 0, 117, 1, 0),
(994, 'Wheels', 0, 0, 0, 117, 1, 0),
(993, 'Light', 0, 0, 0, 117, 1, 0),
(992, 'Motor', 0, 0, 0, 117, 1, 0),
(991, 'Casing', 1, 0, 0, 117, 1, 0),
(990, 'Frame', 0, 0, 0, 117, 1, 0),
(989, 'Handle bars', 0, 0, 0, 117, 1, 0),
(988, 'Seat', 0, 0, 0, 117, 1, 0),
(908, 'Seat', 0, 0, 0, 115, 1, 0),
(909, 'Handle bars', 0, 0, 0, 115, 1, 0),
(910, 'Frame', 0, 0, 0, 115, 1, 0),
(911, 'Casing', 1, 0, 0, 115, 1, 0),
(912, 'Motor', 0, 0, 0, 115, 1, 0),
(913, 'Light', 0, 0, 0, 115, 1, 0),
(914, 'Wheels', 0, 0, 0, 115, 1, 0),
(915, 'Braking system', 0, 0, 0, 115, 1, 0),
(916, 'Shock absorber', 0, 0, 0, 115, 1, 0),
(917, 'Accumulator', 0, 0, 0, 115, 1, 0),
(918, 'Seat', 0, 0, 0, 115, 2, 0),
(919, 'Handle bars', 0, 0, 0, 115, 2, 0),
(920, 'Frame', 0, 0, 0, 115, 2, 0),
(921, 'Casing', 1, 0, 0, 115, 2, 0),
(922, 'Motor', 0, 0, 0, 115, 2, 0),
(923, 'Light', 0, 0, 0, 115, 2, 0),
(924, 'Wheels', 0, 0, 0, 115, 2, 0),
(925, 'Braking system', 0, 0, 0, 115, 2, 0),
(926, 'Shock absorber', 0, 0, 0, 115, 2, 0),
(927, 'Accumulator', 0, 0, 0, 115, 2, 0),
(928, 'Seat', 0, 0, 0, 115, 3, 0),
(929, 'Handle bars', 0, 0, 0, 115, 3, 0),
(930, 'Frame', 0, 0, 0, 115, 3, 0),
(931, 'Casing', 1, 0, 0, 115, 3, 0),
(932, 'Motor', 0, 0, 0, 115, 3, 0),
(933, 'Light', 0, 0, 0, 115, 3, 0),
(934, 'Wheels', 0, 0, 0, 115, 3, 0),
(935, 'Braking system', 0, 0, 0, 115, 3, 0),
(936, 'Shock absorber', 0, 0, 0, 115, 3, 0),
(937, 'Accumulator', 0, 0, 0, 115, 3, 0),
(938, 'Seat', 0, 0, 0, 115, 4, 0),
(939, 'Handle bars', 0, 0, 0, 115, 4, 0),
(940, 'Frame', 0, 0, 0, 115, 4, 0),
(941, 'Casing', 1, 0, 0, 115, 4, 0),
(942, 'Motor', 0, 0, 0, 115, 4, 0),
(943, 'Light', 0, 0, 0, 115, 4, 0),
(944, 'Wheels', 0, 0, 0, 115, 4, 0),
(945, 'Braking system', 0, 0, 0, 115, 4, 0),
(946, 'Shock absorber', 0, 0, 0, 115, 4, 0),
(947, 'Accumulator', 0, 0, 0, 115, 4, 0),
(981, 'Casing', 1, 0, 0, 116, 4, 0),
(982, 'Motor', 0, 0, 0, 116, 4, 0),
(983, 'Light', 0, 0, 0, 116, 4, 0),
(984, 'Wheels', 0, 0, 0, 116, 4, 0),
(985, 'Braking system', 0, 0, 0, 116, 4, 0),
(986, 'Shock absorber', 0, 0, 0, 116, 4, 0),
(987, 'Accumulator', 0, 0, 0, 116, 4, 0),
(1021, 'Casing', 1, 0, 0, 117, 4, 0),
(1022, 'Motor', 0, 0, 0, 117, 4, 0),
(1023, 'Light', 0, 0, 0, 117, 4, 0),
(1024, 'Wheels', 0, 0, 0, 117, 4, 0),
(1025, 'Braking system', 0, 0, 0, 117, 4, 0),
(1026, 'Shock absorber', 0, 0, 0, 117, 4, 0),
(1027, 'Accumulator', 0, 0, 0, 117, 4, 0),
(1061, 'Casing', 1, 0, 0, 118, 4, 0),
(1062, 'Motor', 0, 0, 0, 118, 4, 0),
(1063, 'Light', 0, 0, 0, 118, 4, 0),
(1064, 'Wheels', 0, 0, 0, 118, 4, 0),
(1065, 'Braking system', 0, 0, 0, 118, 4, 0),
(1066, 'Shock absorber', 0, 0, 0, 118, 4, 0),
(1067, 'Accumulator', 0, 0, 0, 118, 4, 0),
(1068, 'Seat', 0, 0, 0, 119, 1, 0),
(1069, 'Handle bars', 0, 0, 0, 119, 1, 0),
(1070, 'Frame', 0, 0, 0, 119, 1, 0),
(1071, 'Casing', 1, 0, 0, 119, 1, 0),
(1072, 'Motor', 0, 0, 0, 119, 1, 0),
(1073, 'Light', 0, 0, 0, 119, 1, 0),
(1074, 'Wheels', 0, 0, 0, 119, 1, 0),
(1075, 'Braking system', 0, 0, 0, 119, 1, 0),
(1076, 'Shock absorber', 0, 0, 0, 119, 1, 0),
(1077, 'Accumulator', 0, 0, 0, 119, 1, 0),
(1078, 'Seat', 0, 0, 0, 119, 2, 0),
(1079, 'Handle bars', 0, 0, 0, 119, 2, 0),
(1080, 'Frame', 0, 0, 0, 119, 2, 0),
(1081, 'Casing', 1, 0, 0, 119, 2, 0),
(1082, 'Motor', 0, 0, 0, 119, 2, 0),
(1083, 'Light', 0, 0, 0, 119, 2, 0),
(1084, 'Wheels', 0, 0, 0, 119, 2, 0),
(1085, 'Braking system', 0, 0, 0, 119, 2, 0),
(1086, 'Shock absorber', 0, 0, 0, 119, 2, 0),
(1087, 'Accumulator', 0, 0, 0, 119, 2, 0),
(1088, 'Seat', 0, 0, 0, 119, 3, 0),
(1089, 'Handle bars', 0, 0, 0, 119, 3, 0),
(1090, 'Frame', 0, 0, 0, 119, 3, 0),
(1091, 'Casing', 1, 0, 0, 119, 3, 0),
(1092, 'Motor', 0, 0, 0, 119, 3, 0),
(1093, 'Light', 0, 0, 0, 119, 3, 0),
(1094, 'Wheels', 0, 0, 0, 119, 3, 0),
(1095, 'Braking system', 0, 0, 0, 119, 3, 0),
(1096, 'Shock absorber', 0, 0, 0, 119, 3, 0),
(1097, 'Accumulator', 0, 0, 0, 119, 3, 0),
(1098, 'Seat', 0, 0, 0, 120, 1, 0),
(1099, 'Handle bars', 0, 0, 0, 120, 1, 0),
(1100, 'Frame', 0, 0, 0, 120, 1, 0),
(1101, 'Casing', 1, 0, 0, 120, 1, 0),
(1102, 'Motor', 0, 0, 0, 120, 1, 0),
(1103, 'Light', 0, 0, 0, 120, 1, 0),
(1104, 'Wheels', 0, 0, 0, 120, 1, 0),
(1105, 'Braking system', 0, 0, 0, 120, 1, 0),
(1106, 'Shock absorber', 0, 0, 0, 120, 1, 0),
(1107, 'Accumulator', 0, 0, 0, 120, 1, 0),
(1108, 'Seat', 0, 0, 0, 120, 2, 0),
(1109, 'Handle bars', 0, 0, 0, 120, 2, 0),
(1110, 'Frame', 0, 0, 0, 120, 2, 0),
(1111, 'Casing', 1, 0, 0, 120, 2, 0),
(1112, 'Motor', 0, 0, 0, 120, 2, 0),
(1113, 'Light', 0, 0, 0, 120, 2, 0),
(1114, 'Wheels', 0, 0, 0, 120, 2, 0),
(1115, 'Braking system', 0, 0, 0, 120, 2, 0),
(1116, 'Shock absorber', 0, 0, 0, 120, 2, 0),
(1117, 'Accumulator', 0, 0, 0, 120, 2, 0),
(1118, 'Seat', 0, 0, 0, 120, 3, 0),
(1119, 'Handle bars', 0, 0, 0, 120, 3, 0),
(1120, 'Frame', 0, 0, 0, 120, 3, 0),
(1121, 'Casing', 1, 0, 0, 120, 3, 0),
(1122, 'Motor', 0, 0, 0, 120, 3, 0),
(1123, 'Light', 0, 0, 0, 120, 3, 0),
(1124, 'Wheels', 0, 0, 0, 120, 3, 0),
(1125, 'Braking system', 0, 0, 0, 120, 3, 0),
(1126, 'Shock absorber', 0, 0, 0, 120, 3, 0),
(1127, 'Accumulator', 0, 0, 0, 120, 3, 0),
(1128, 'Seat', 0, 0, 0, 120, 4, 0),
(1129, 'Handle bars', 0, 0, 0, 120, 4, 0),
(1130, 'Frame', 0, 0, 0, 120, 4, 0),
(1131, 'Casing', 1, 0, 0, 120, 4, 0),
(1132, 'Motor', 0, 0, 0, 120, 4, 0),
(1133, 'Light', 0, 0, 0, 120, 4, 0),
(1134, 'Wheels', 0, 0, 0, 120, 4, 0),
(1135, 'Braking system', 0, 0, 0, 120, 4, 0),
(1136, 'Shock absorber', 0, 0, 0, 120, 4, 0),
(1137, 'Accumulator', 0, 0, 0, 120, 4, 0),
(1138, 'Seat', 0, 0, 0, 121, 1, 0),
(1139, 'Handle bars', 0, 0, 0, 121, 1, 0),
(1140, 'Frame', 0, 0, 0, 121, 1, 0),
(1141, 'Casing', 1, 0, 0, 121, 1, 0),
(1142, 'Motor', 0, 0, 0, 121, 1, 0),
(1143, 'Light', 0, 0, 0, 121, 1, 0),
(1144, 'Wheels', 0, 0, 0, 121, 1, 0),
(1145, 'Braking system', 0, 0, 0, 121, 1, 0),
(1146, 'Shock absorber', 0, 0, 0, 121, 1, 0),
(1147, 'Accumulator', 0, 0, 0, 121, 1, 0),
(1148, 'Seat', 0, 0, 0, 121, 2, 0),
(1149, 'Handle bars', 0, 0, 0, 121, 2, 0),
(1150, 'Frame', 0, 0, 0, 121, 2, 0),
(1151, 'Casing', 1, 0, 0, 121, 2, 0),
(1152, 'Motor', 0, 0, 0, 121, 2, 0),
(1153, 'Light', 0, 0, 0, 121, 2, 0),
(1154, 'Wheels', 0, 0, 0, 121, 2, 0),
(1155, 'Braking system', 0, 0, 0, 121, 2, 0),
(1156, 'Shock absorber', 0, 0, 0, 121, 2, 0),
(1157, 'Accumulator', 0, 0, 0, 121, 2, 0),
(1158, 'Seat', 0, 0, 0, 121, 3, 0),
(1159, 'Handle bars', 0, 0, 0, 121, 3, 0),
(1160, 'Frame', 0, 0, 0, 121, 3, 0),
(1161, 'Casing', 1, 0, 0, 121, 3, 0),
(1162, 'Motor', 0, 0, 0, 121, 3, 0),
(1163, 'Light', 0, 0, 0, 121, 3, 0),
(1164, 'Wheels', 0, 0, 0, 121, 3, 0),
(1165, 'Braking system', 0, 0, 0, 121, 3, 0),
(1166, 'Shock absorber', 0, 0, 0, 121, 3, 0),
(1167, 'Accumulator', 0, 0, 0, 121, 3, 0),
(1168, 'Seat', 0, 0, 0, 122, 1, 0),
(1169, 'Handle bars', 0, 0, 0, 122, 1, 0),
(1170, 'Frame', 0, 0, 0, 122, 1, 0),
(1171, 'Casing', 1, 0, 0, 122, 1, 0),
(1172, 'Motor', 0, 0, 0, 122, 1, 0),
(1173, 'Light', 0, 0, 0, 122, 1, 0),
(1174, 'Wheels', 0, 0, 0, 122, 1, 0),
(1175, 'Braking system', 0, 0, 0, 122, 1, 0),
(1176, 'Shock absorber', 0, 0, 0, 122, 1, 0),
(1177, 'Accumulator', 0, 0, 0, 122, 1, 0),
(1178, 'Seat', 0, 0, 0, 122, 2, 0),
(1179, 'Handle bars', 0, 0, 0, 122, 2, 0),
(1180, 'Frame', 0, 0, 0, 122, 2, 0),
(1181, 'Casing', 1, 0, 0, 122, 2, 0),
(1182, 'Motor', 0, 0, 0, 122, 2, 0),
(1183, 'Light', 0, 0, 0, 122, 2, 0),
(1184, 'Wheels', 0, 0, 0, 122, 2, 0),
(1185, 'Braking system', 0, 0, 0, 122, 2, 0),
(1186, 'Shock absorber', 0, 0, 0, 122, 2, 0),
(1187, 'Accumulator', 0, 0, 0, 122, 2, 0),
(1188, 'Seat', 0, 0, 0, 122, 3, 0),
(1189, 'Handle bars', 0, 0, 0, 122, 3, 0),
(1190, 'Frame', 0, 0, 0, 122, 3, 0),
(1191, 'Casing', 1, 0, 0, 122, 3, 0),
(1192, 'Motor', 0, 0, 0, 122, 3, 0),
(1193, 'Light', 0, 0, 0, 122, 3, 0),
(1194, 'Wheels', 0, 0, 0, 122, 3, 0),
(1195, 'Braking system', 0, 0, 0, 122, 3, 0),
(1196, 'Shock absorber', 0, 0, 0, 122, 3, 0),
(1197, 'Accumulator', 0, 0, 0, 122, 3, 0),
(1198, 'Seat', 0, 0, 0, 123, 1, 0),
(1199, 'Handle bars', 0, 0, 0, 123, 1, 0),
(1200, 'Frame', 0, 0, 0, 123, 1, 0),
(1201, 'Casing', 1, 0, 0, 123, 1, 0),
(1202, 'Motor', 0, 0, 0, 123, 1, 0),
(1203, 'Light', 0, 0, 0, 123, 1, 0),
(1204, 'Wheels', 0, 0, 0, 123, 1, 0),
(1205, 'Braking system', 0, 0, 0, 123, 1, 0),
(1206, 'Shock absorber', 0, 0, 0, 123, 1, 0),
(1207, 'Accumulator', 0, 0, 0, 123, 1, 0),
(1208, 'Seat', 0, 0, 0, 123, 2, 0),
(1209, 'Handle bars', 0, 0, 0, 123, 2, 0),
(1210, 'Frame', 0, 0, 0, 123, 2, 0),
(1211, 'Casing', 1, 0, 0, 123, 2, 0),
(1212, 'Motor', 0, 0, 0, 123, 2, 0),
(1213, 'Light', 0, 0, 0, 123, 2, 0),
(1214, 'Wheels', 0, 0, 0, 123, 2, 0),
(1215, 'Braking system', 0, 0, 0, 123, 2, 0),
(1216, 'Shock absorber', 0, 0, 0, 123, 2, 0),
(1217, 'Accumulator', 0, 0, 0, 123, 2, 0),
(1218, 'Seat', 0, 0, 0, 123, 3, 0),
(1219, 'Handle bars', 0, 0, 0, 123, 3, 0),
(1220, 'Frame', 0, 0, 0, 123, 3, 0),
(1221, 'Casing', 1, 0, 0, 123, 3, 0),
(1222, 'Motor', 0, 0, 0, 123, 3, 0),
(1223, 'Light', 0, 0, 0, 123, 3, 0),
(1224, 'Wheels', 0, 0, 0, 123, 3, 0),
(1225, 'Braking system', 0, 0, 0, 123, 3, 0),
(1226, 'Shock absorber', 0, 0, 0, 123, 3, 0),
(1227, 'Accumulator', 0, 0, 0, 123, 3, 0),
(1228, 'Seat', 0, 0, 0, 124, 1, 0),
(1229, 'Handle bars', 0, 0, 0, 124, 1, 0),
(1230, 'Frame', 0, 0, 0, 124, 1, 0),
(1231, 'Casing', 1, 0, 0, 124, 1, 0),
(1232, 'Motor', 0, 0, 0, 124, 1, 0),
(1233, 'Light', 0, 0, 0, 124, 1, 0),
(1234, 'Wheels', 0, 0, 0, 124, 1, 0),
(1235, 'Braking system', 0, 0, 0, 124, 1, 0),
(1236, 'Shock absorber', 0, 0, 0, 124, 1, 0),
(1237, 'Accumulator', 0, 0, 0, 124, 1, 0),
(1238, 'Seat', 0, 0, 0, 124, 2, 0),
(1239, 'Handle bars', 0, 0, 0, 124, 2, 0),
(1240, 'Frame', 0, 0, 0, 124, 2, 0),
(1241, 'Casing', 1, 0, 0, 124, 2, 0),
(1242, 'Motor', 0, 0, 0, 124, 2, 0),
(1243, 'Light', 0, 0, 0, 124, 2, 0),
(1244, 'Wheels', 0, 0, 0, 124, 2, 0),
(1245, 'Braking system', 0, 0, 0, 124, 2, 0),
(1246, 'Shock absorber', 0, 0, 0, 124, 2, 0),
(1247, 'Accumulator', 0, 0, 0, 124, 2, 0),
(1248, 'Seat', 0, 0, 0, 124, 3, 0),
(1249, 'Handle bars', 0, 0, 0, 124, 3, 0),
(1250, 'Frame', 0, 0, 0, 124, 3, 0),
(1251, 'Casing', 1, 0, 0, 124, 3, 0),
(1252, 'Motor', 0, 0, 0, 124, 3, 0),
(1253, 'Light', 0, 0, 0, 124, 3, 0),
(1254, 'Wheels', 0, 0, 0, 124, 3, 0),
(1255, 'Braking system', 0, 0, 0, 124, 3, 0),
(1256, 'Shock absorber', 0, 0, 0, 124, 3, 0),
(1257, 'Accumulator', 0, 0, 0, 124, 3, 0),
(1258, 'Seat', 0, 0, 0, 124, 4, 0),
(1259, 'Handle bars', 0, 0, 0, 124, 4, 0),
(1260, 'Frame', 0, 0, 0, 124, 4, 0),
(1261, 'Casing', 1, 0, 0, 124, 4, 0),
(1262, 'Motor', 0, 0, 0, 124, 4, 0),
(1263, 'Light', 0, 0, 0, 124, 4, 0),
(1264, 'Wheels', 0, 0, 0, 124, 4, 0),
(1265, 'Braking system', 0, 0, 0, 124, 4, 0),
(1266, 'Shock absorber', 0, 0, 0, 124, 4, 0),
(1267, 'Accumulator', 0, 0, 0, 124, 4, 0),
(1268, 'Seat', 0, 0, 0, 125, 1, 0),
(1269, 'Handle bars', 0, 0, 0, 125, 1, 0),
(1270, 'Frame', 0, 0, 0, 125, 1, 0),
(1271, 'Casing', 1, 0, 0, 125, 1, 0),
(1272, 'Motor', 0, 0, 0, 125, 1, 0),
(1273, 'Light', 0, 0, 0, 125, 1, 0),
(1274, 'Wheels', 0, 0, 0, 125, 1, 0),
(1275, 'Braking system', 0, 0, 0, 125, 1, 0),
(1276, 'Shock absorber', 0, 0, 0, 125, 1, 0),
(1277, 'Accumulator', 0, 0, 0, 125, 1, 0),
(1278, 'Seat', 0, 0, 0, 125, 2, 0),
(1279, 'Handle bars', 0, 0, 0, 125, 2, 0),
(1280, 'Frame', 0, 0, 0, 125, 2, 0),
(1281, 'Casing', 1, 0, 0, 125, 2, 0),
(1282, 'Motor', 0, 0, 0, 125, 2, 0),
(1283, 'Light', 0, 0, 0, 125, 2, 0),
(1284, 'Wheels', 0, 0, 0, 125, 2, 0),
(1285, 'Braking system', 0, 0, 0, 125, 2, 0),
(1286, 'Shock absorber', 0, 0, 0, 125, 2, 0),
(1287, 'Accumulator', 0, 0, 0, 125, 2, 0),
(1288, 'Seat', 0, 0, 0, 125, 3, 0),
(1289, 'Handle bars', 0, 0, 0, 125, 3, 0),
(1290, 'Frame', 0, 0, 0, 125, 3, 0),
(1291, 'Casing', 1, 0, 0, 125, 3, 0),
(1292, 'Motor', 0, 0, 0, 125, 3, 0),
(1293, 'Light', 0, 0, 0, 125, 3, 0),
(1294, 'Wheels', 0, 0, 0, 125, 3, 0),
(1295, 'Braking system', 0, 0, 0, 125, 3, 0),
(1296, 'Shock absorber', 0, 0, 0, 125, 3, 0),
(1297, 'Accumulator', 0, 0, 0, 125, 3, 0),
(1298, 'Seat', 0, 0, 0, 125, 4, 0),
(1299, 'Handle bars', 0, 0, 0, 125, 4, 0),
(1300, 'Frame', 0, 0, 0, 125, 4, 0),
(1301, 'Casing', 1, 0, 0, 125, 4, 0),
(1302, 'Motor', 0, 0, 0, 125, 4, 0),
(1303, 'Light', 0, 0, 0, 125, 4, 0),
(1304, 'Wheels', 0, 0, 0, 125, 4, 0),
(1305, 'Braking system', 0, 0, 0, 125, 4, 0),
(1306, 'Shock absorber', 0, 0, 0, 125, 4, 0),
(1307, 'Accumulator', 0, 0, 0, 125, 4, 0),
(1308, 'Seat', 0, 0, 0, 125, 5, 0),
(1309, 'Handle bars', 0, 0, 0, 125, 5, 0),
(1310, 'Frame', 0, 0, 0, 125, 5, 0),
(1311, 'Casing', 1, 0, 0, 125, 5, 0),
(1312, 'Motor', 0, 0, 0, 125, 5, 0),
(1313, 'Light', 0, 0, 0, 125, 5, 0),
(1314, 'Wheels', 0, 0, 0, 125, 5, 0),
(1315, 'Braking system', 0, 0, 0, 125, 5, 0),
(1316, 'Shock absorber', 0, 0, 0, 125, 5, 0),
(1317, 'Accumulator', 0, 0, 0, 125, 5, 0),
(1318, 'Seat', 0, 0, 0, 126, 1, 0),
(1319, 'Handle bars', 0, 0, 0, 126, 1, 0),
(1320, 'Frame', 0, 0, 0, 126, 1, 0),
(1321, 'Casing', 1, 0, 0, 126, 1, 0),
(1322, 'Motor', 0, 0, 0, 126, 1, 0),
(1323, 'Light', 0, 0, 0, 126, 1, 0),
(1324, 'Wheels', 0, 0, 0, 126, 1, 0),
(1325, 'Braking system', 0, 0, 0, 126, 1, 0),
(1326, 'Shock absorber', 0, 0, 0, 126, 1, 0),
(1327, 'Accumulator', 0, 0, 0, 126, 1, 0),
(1328, 'Seat', 0, 0, 0, 126, 2, 0),
(1329, 'Handle bars', 0, 0, 0, 126, 2, 0),
(1330, 'Frame', 0, 0, 0, 126, 2, 0),
(1331, 'Casing', 1, 0, 0, 126, 2, 0),
(1332, 'Motor', 0, 0, 0, 126, 2, 0),
(1333, 'Light', 0, 0, 0, 126, 2, 0),
(1334, 'Wheels', 0, 0, 0, 126, 2, 0),
(1335, 'Braking system', 0, 0, 0, 126, 2, 0),
(1336, 'Shock absorber', 0, 0, 0, 126, 2, 0),
(1337, 'Accumulator', 0, 0, 0, 126, 2, 0),
(1338, 'Seat', 0, 0, 0, 126, 3, 0),
(1339, 'Handle bars', 0, 0, 0, 126, 3, 0),
(1340, 'Frame', 0, 0, 0, 126, 3, 0),
(1341, 'Casing', 1, 0, 0, 126, 3, 0),
(1342, 'Motor', 0, 0, 0, 126, 3, 0),
(1343, 'Light', 0, 0, 0, 126, 3, 0),
(1344, 'Wheels', 0, 0, 0, 126, 3, 0),
(1345, 'Braking system', 0, 0, 0, 126, 3, 0),
(1346, 'Shock absorber', 0, 0, 0, 126, 3, 0),
(1347, 'Accumulator', 0, 0, 0, 126, 3, 0),
(1348, 'Seat', 0, 0, 0, 126, 4, 0),
(1349, 'Handle bars', 0, 0, 0, 126, 4, 0),
(1350, 'Frame', 0, 0, 0, 126, 4, 0),
(1351, 'Casing', 1, 0, 0, 126, 4, 0),
(1352, 'Motor', 0, 0, 0, 126, 4, 0),
(1353, 'Light', 0, 0, 0, 126, 4, 0),
(1354, 'Wheels', 0, 0, 0, 126, 4, 0),
(1355, 'Braking system', 0, 0, 0, 126, 4, 0),
(1356, 'Shock absorber', 0, 0, 0, 126, 4, 0),
(1357, 'Accumulator', 0, 0, 0, 126, 4, 0),
(1358, 'Seat', 0, 0, 0, 127, 1, 0),
(1359, 'Handle bars', 0, 0, 0, 127, 1, 0),
(1360, 'Frame', 0, 0, 0, 127, 1, 0),
(1361, 'Casing', 1, 0, 0, 127, 1, 0),
(1362, 'Motor', 0, 0, 0, 127, 1, 0),
(1363, 'Light', 0, 0, 0, 127, 1, 0),
(1364, 'Wheels', 0, 0, 0, 127, 1, 0),
(1365, 'Braking system', 0, 0, 0, 127, 1, 0),
(1366, 'Shock absorber', 0, 0, 0, 127, 1, 0),
(1367, 'Accumulator', 0, 0, 0, 127, 1, 0),
(1368, 'Seat', 0, 0, 0, 127, 2, 0),
(1369, 'Handle bars', 0, 0, 0, 127, 2, 0),
(1370, 'Frame', 0, 0, 0, 127, 2, 0),
(1371, 'Casing', 1, 0, 0, 127, 2, 0),
(1372, 'Motor', 0, 0, 0, 127, 2, 0),
(1373, 'Light', 0, 0, 0, 127, 2, 0),
(1374, 'Wheels', 0, 0, 0, 127, 2, 0),
(1375, 'Braking system', 0, 0, 0, 127, 2, 0),
(1376, 'Shock absorber', 0, 0, 0, 127, 2, 0),
(1377, 'Accumulator', 0, 0, 0, 127, 2, 0),
(1378, 'Seat', 0, 0, 0, 127, 3, 0),
(1379, 'Handle bars', 0, 0, 0, 127, 3, 0),
(1380, 'Frame', 0, 0, 0, 127, 3, 0),
(1381, 'Casing', 1, 0, 0, 127, 3, 0),
(1382, 'Motor', 0, 0, 0, 127, 3, 0),
(1383, 'Light', 0, 0, 0, 127, 3, 0),
(1384, 'Wheels', 0, 0, 0, 127, 3, 0),
(1385, 'Braking system', 0, 0, 0, 127, 3, 0),
(1386, 'Shock absorber', 0, 0, 0, 127, 3, 0),
(1387, 'Accumulator', 0, 0, 0, 127, 3, 0),
(1388, 'Seat', 0, 0, 0, 127, 4, 0),
(1389, 'Handle bars', 0, 0, 0, 127, 4, 0),
(1390, 'Frame', 0, 0, 0, 127, 4, 0),
(1391, 'Casing', 1, 0, 0, 127, 4, 0),
(1392, 'Motor', 0, 0, 0, 127, 4, 0),
(1393, 'Light', 0, 0, 0, 127, 4, 0),
(1394, 'Wheels', 0, 0, 0, 127, 4, 0),
(1395, 'Braking system', 0, 0, 0, 127, 4, 0),
(1396, 'Shock absorber', 0, 0, 0, 127, 4, 0),
(1397, 'Accumulator', 0, 0, 0, 127, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_component_materials`
--

CREATE TABLE IF NOT EXISTS `tbl_component_materials` (
  `id` int(16) NOT NULL,
  `name` varchar(16) COLLATE utf8_bin NOT NULL,
  `cost` double NOT NULL,
  `range` double NOT NULL,
  `design` double NOT NULL,
  `reliability` double NOT NULL,
  `component_id` int(16) NOT NULL,
  `allowance_id` int(16) NOT NULL,
  `team_id` int(16) DEFAULT '0',
  `image` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3655 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_component_materials`
--

INSERT INTO `tbl_component_materials` (`id`, `name`, `cost`, `range`, `design`, `reliability`, `component_id`, `allowance_id`, `team_id`, `image`) VALUES
(26, 'Steel', 40, 2, 3, 0, 26, 0, 0, 'handle_steel.png'),
(25, 'Design', 75, 0, 5, 2, 25, 0, 0, 'seat_design.png'),
(24, 'Leather', 50, 0, 3, 1, 25, 0, 0, 'seat_leather.png'),
(23, 'Plastic', 30, 0, 2, 1, 25, 0, 0, 'seat_plastic.png'),
(27, 'Aluminum', 60, 3, 5, 0, 26, 0, 0, 'handle_aluminum.png'),
(28, 'CFK', 200, 4, 7, 0, 26, 0, 0, 'handle_cfk.png'),
(29, '1 KW', 200, 9, 0, 4, 29, 0, 0, 'motor_1kw.png'),
(30, '2 KW', 300, 8, 0, 7, 29, 0, 0, 'motor_2kw.png'),
(31, '4 KW', 600, 7, 0, 9, 29, 0, 0, 'motor_4kw.png'),
(32, 'Steel', 200, 2, 3, 1, 27, 0, 0, 'frame_steel.png'),
(33, 'Aluminum', 350, 4, 5, 2, 27, 0, 0, 'frame_aluminum.png'),
(34, 'CFK', 1200, 4, 7, 3, 27, 0, 0, 'frame_cfk.png'),
(35, 'Plastic', 200, 1, 2, 2, 28, 0, 0, 'casing_plastic.png'),
(36, 'Aluminum', 300, 3, 4, 4, 28, 0, 0, 'casing_aluminum.png'),
(37, 'CFK', 400, 8, 8, 6, 28, 0, 0, 'casing_cfk.png'),
(38, '2x 55W Halogen', 20, 1, 3, 0, 31, 0, 0, 'light_55w_halogen.png'),
(39, '2x 20W Halogen R', 45, 2, 4, 0, 31, 0, 0, 'light_20w_halogen.png'),
(40, 'Xenon ellipsoid', 155, 2, 5, 0, 31, 0, 0, 'light_xenon.png'),
(41, 'Steel', 60, 0, 1, 3, 32, 0, 0, 'wheel_steel.png'),
(42, 'Aluminum', 100, 1, 3, 2, 32, 0, 0, 'wheel_aluminum.png'),
(43, 'Aluminum design', 230, 1, 5, 2, 32, 0, 0, 'wheel_aluminum_design.png'),
(44, 'Drum brake', 100, 0, 0, 2, 33, 0, 0, 'brake_drum.png'),
(45, 'Disc brake', 200, 0, 1, 5, 33, 0, 0, 'brake_disc.png'),
(46, 'Coil spring', 105, 0, 0, 2, 34, 0, 0, 'absorber_spring.png'),
(47, 'Pneumatic', 170, 0, 1, 5, 34, 0, 0, 'absorber_Pneumatic.png'),
(48, 'Lead-acid', 300, 5, 0, 3, 35, 0, 0, 'accumulator_acid.png'),
(49, 'Lithium polymer', 600, 7, 0, 5, 35, 0, 0, 'accumulator_lithium_poli.png'),
(50, 'Lithium-ion', 1000, 10, 0, 8, 35, 0, 0, 'accumulator_ion.png'),
(1404, 'Xenon ellipsoid', 155, 2, 5, 0, 593, 0, 97, 'light_xenon.png'),
(1403, '2x 20W Halogen R', 45, 2, 4, 0, 593, 0, 97, 'light_20w_halogen.png'),
(1402, '2x 55W Halogen', 20, 1, 3, 0, 593, 0, 97, 'light_55w_halogen.png'),
(1401, '4 KW', 600, 7, 0, 9, 592, 0, 97, 'motor_4KW.png'),
(1400, '2 KW', 300, 8, 0, 7, 592, 0, 97, 'Motor_2KW.png'),
(1399, '1 KW', 200, 9, 0, 4, 592, 0, 97, 'Motor_1KW.png'),
(1398, 'CFK', 400, 8, 8, 6, 591, 0, 97, 'casing_cfk.png'),
(1397, 'Aluminum', 300, 3, 4, 4, 591, 0, 97, 'casing_aluminum.png'),
(1396, 'Plastic', 200, 1, 2, 2, 591, 0, 97, 'casing_plastic.png'),
(1395, 'CFK', 1200, 4, 7, 0, 590, 0, 97, 'frame_cfk.png'),
(1394, 'Aluminum', 350, 4, 5, 2, 590, 0, 97, 'frame_aluminum.png'),
(1393, 'Steel', 200, 2, 3, 1, 590, 0, 97, 'frame_steel.png'),
(1392, 'CFK', 200, 4, 7, 0, 589, 0, 97, 'handle_cfk.png'),
(1391, 'Aluminum', 60, 3, 5, 0, 589, 0, 97, 'handle_aluminum.png'),
(1390, 'Steel', 40, 2, 3, 0, 589, 0, 97, 'handle_steel.png'),
(770, 'Lithium-ion', 10000, 10, 0, 8, 365, 0, NULL, NULL),
(769, 'Lithium polymer', 600, 7, 0, 5, 365, 0, NULL, NULL),
(768, 'Lead-acid', 300, 5, 0, 3, 365, 0, NULL, NULL),
(767, 'Pneumatic', 170, 0, 1, 5, 364, 0, NULL, NULL),
(766, 'Coil spring', 105, 0, 0, 2, 364, 0, NULL, NULL),
(764, 'Drum brake', 100, 0, 0, 2, 363, 0, NULL, NULL),
(765, 'Disc brake', 200, 0, 1, 5, 363, 0, NULL, NULL),
(763, 'Aluminum design', 230, 1, 5, 2, 362, 0, NULL, NULL),
(762, 'Aluminum', 100, 1, 3, 2, 362, 0, NULL, NULL),
(761, 'Steel', 30, 0, 1, 3, 362, 0, NULL, NULL),
(760, 'Xenon ellipsoid', 155, 2, 5, 0, 361, 0, NULL, NULL),
(1389, 'Design', 75, 0, 2, 5, 588, 0, 97, 'seat_design.png'),
(1388, 'Leather', 50, 0, 1, 3, 588, 0, 97, 'seat_leather.png'),
(743, 'Plastic22', 30, 0, 2, 1, 356, 0, NULL, NULL),
(744, 'Leather222', 50, 0, 1, 3, 356, 0, NULL, NULL),
(745, 'Design', 75, 0, 2, 5, 356, 0, NULL, NULL),
(746, 'Steel', 40, 2, 3, 0, 357, 0, NULL, NULL),
(747, 'Aluminum', 60, 3, 5, 0, 357, 0, NULL, NULL),
(748, 'CFK', 200, 4, 7, 0, 357, 0, NULL, NULL),
(749, 'Steel', 200, 2, 3, 1, 358, 0, NULL, NULL),
(750, 'Aluminum', 350, 4, 5, 2, 358, 0, NULL, NULL),
(751, 'CFK', 1200, 4, 7, 0, 358, 0, NULL, NULL),
(752, 'Plastic', 200, 1, 2, 2, 359, 0, NULL, NULL),
(753, 'Aluminum', 300, 3, 4, 4, 359, 0, NULL, NULL),
(754, 'CFK', 400, 8, 8, 6, 359, 0, NULL, NULL),
(755, '1 KW', 200, 9, 0, 4, 360, 0, NULL, NULL),
(756, '2 KW', 300, 8, 0, 7, 360, 0, NULL, NULL),
(757, '4 KW', 600, 7, 0, 9, 360, 0, NULL, NULL),
(758, '2x 55W Halogen', 20, 1, 3, 0, 361, 0, NULL, NULL),
(759, '2x 20W Halogen R', 45, 2, 4, 0, 361, 0, NULL, NULL),
(1387, 'Plastic', 30, 0, 2, 1, 588, 0, 97, 'seat_plastic.png'),
(1386, 'Lithium-ion', 10000, 10, 0, 8, 587, 0, 96, 'accumulator_ion.png'),
(1385, 'Lithium polymer', 600, 7, 0, 5, 587, 0, 96, 'accumulator_polymer.png'),
(1384, 'Lead-acid', 300, 5, 0, 3, 587, 0, 96, 'accumulator_acid.png'),
(1383, 'Pneumatic', 170, 0, 1, 5, 586, 0, 96, 'shock_pnematic.png'),
(1382, 'Coil spring', 105, 0, 0, 2, 586, 0, 96, 'brake_coil.png'),
(1381, 'Disc brake', 200, 0, 1, 5, 585, 0, 96, 'brake_disc.png'),
(1380, 'Drum brake', 100, 0, 0, 2, 585, 0, 96, 'brake_drum.png'),
(1379, 'Aluminum design', 230, 1, 5, 2, 584, 0, 96, 'wheel_aluminum_design.png'),
(1378, 'Aluminum', 100, 1, 3, 2, 584, 0, 96, 'wheel_aluminum.png'),
(1377, 'Steel', 30, 0, 1, 3, 584, 0, 96, 'wheel_steel.png'),
(1376, 'Xenon ellipsoid', 155, 2, 5, 0, 583, 0, 96, 'light_xenon.png'),
(1375, '2x 20W Halogen R', 45, 2, 4, 0, 583, 0, 96, 'light_20w_halogen.png'),
(1374, '2x 55W Halogen', 20, 1, 3, 0, 583, 0, 96, 'light_55w_halogen.png'),
(1373, '4 KW', 600, 7, 0, 9, 582, 0, 96, 'motor_4kw.png'),
(1372, '2 KW', 300, 8, 0, 7, 582, 0, 96, 'motor_2kw.png'),
(1371, '1 KW', 200, 9, 0, 4, 582, 0, 96, 'motor_1kw.png'),
(1370, 'CFK', 400, 8, 8, 6, 581, 0, 96, 'casing_cfk.png'),
(1369, 'Aluminum', 300, 3, 4, 4, 581, 0, 96, 'casing_aluminum.png'),
(1368, 'Plastic', 200, 1, 2, 2, 581, 0, 96, 'casing_plastic.png'),
(1367, 'CFK', 1200, 4, 7, 0, 580, 0, 96, 'frame_cfk.png'),
(1366, 'Aluminum', 350, 4, 5, 2, 580, 0, 96, 'frame_aluminum.png'),
(1365, 'Steel', 200, 2, 3, 1, 580, 0, 96, 'frame_steel.png'),
(1364, 'CFK', 200, 4, 7, 0, 579, 0, 96, 'handle_cfk.png'),
(1363, 'Aluminum', 60, 3, 5, 0, 579, 0, 96, 'handle_aluminum.png'),
(1362, 'Steel', 40, 2, 3, 0, 579, 0, 96, 'handle_steel.png'),
(1361, 'Design', 75, 0, 2, 5, 578, 0, 96, 'seat_design.png'),
(1360, 'Leather', 50, 0, 1, 3, 578, 0, 96, 'seat_leather.png'),
(1359, 'Plastic', 30, 0, 2, 1, 578, 0, 96, 'seat_plastic.png'),
(1421, 'Steel', 200, 2, 3, 1, 600, 0, 98, 'frame_steel.png'),
(1420, 'CFK', 200, 4, 7, 0, 599, 0, 98, 'handle_cfk.png'),
(1419, 'Aluminum', 60, 3, 5, 0, 599, 0, 98, 'handle_aluminum.png'),
(1418, 'Steel', 40, 2, 3, 0, 599, 0, 98, 'handle_steel.png'),
(1417, 'Design', 75, 0, 2, 5, 598, 0, 98, 'seat_design.png'),
(1416, 'Leather', 50, 0, 1, 3, 598, 0, 98, 'seat_leather.png'),
(1415, 'Plastic', 30, 0, 2, 1, 598, 0, 98, 'seat_plastic.png'),
(1414, 'Lithium-ion', 10000, 10, 0, 8, 597, 0, 97, 'accumulator_ion.png'),
(1413, 'Lithium polymer', 600, 7, 0, 5, 597, 0, 97, 'accumulator_polymer.png'),
(1412, 'Lead-acid', 300, 5, 0, 3, 597, 0, 97, 'accumulator_acid.png'),
(1411, 'Pneumatic', 170, 0, 1, 5, 596, 0, 97, 'shock_pnematic.png'),
(1410, 'Coil spring', 105, 0, 0, 2, 596, 0, 97, 'brake_coil.png'),
(1409, 'Disc brake', 200, 0, 1, 5, 595, 0, 97, 'brake_disc.png'),
(1408, 'Drum brake', 100, 0, 0, 2, 595, 0, 97, 'brake_drum.png'),
(1405, 'Steel', 30, 0, 1, 3, 594, 0, 97, 'wheel_steel.png'),
(1406, 'Aluminum', 100, 1, 3, 2, 594, 0, 97, 'wheel_aluminum.png'),
(1407, 'Aluminum design', 230, 1, 5, 2, 594, 0, 97, 'wheel_aluminum_design.png'),
(1439, 'Pneumatic', 170, 0, 1, 5, 606, 0, 98, 'shock_pnematic.png'),
(1438, 'Coil spring', 105, 0, 0, 2, 606, 0, 98, 'brake_coil.png'),
(1437, 'Disc brake', 200, 0, 1, 5, 605, 0, 98, 'brake_disc.png'),
(1436, 'Drum brake', 100, 0, 0, 2, 605, 0, 98, 'brake_drum.png'),
(1435, 'Aluminum design', 230, 1, 5, 2, 604, 0, 98, 'wheel_aluminum_design.png'),
(1434, 'Aluminum', 100, 1, 3, 2, 604, 0, 98, 'wheel_aluminum.png'),
(1433, 'Steel', 30, 0, 1, 3, 604, 0, 98, 'wheel_steel.png'),
(1432, 'Xenon ellipsoid', 155, 2, 5, 0, 603, 0, 98, 'light_xenon.png'),
(1431, '2x 20W Halogen R', 45, 2, 4, 0, 603, 0, 98, 'light_20w_halogen.png'),
(1430, '2x 55W Halogen', 20, 1, 3, 0, 603, 0, 98, 'light_55w_halogen.png'),
(1429, '4 KW', 600, 7, 0, 9, 602, 0, 98, 'motor_4kw.png'),
(1428, '2 KW', 300, 8, 0, 7, 602, 0, 98, 'motor_2kw.png'),
(1427, '1 KW', 200, 9, 0, 4, 602, 0, 98, 'motor_1kw.png'),
(1426, 'CFK', 400, 8, 8, 6, 601, 0, 98, 'casing_cfk.png'),
(1425, 'Aluminum', 300, 3, 4, 4, 601, 0, 98, 'casing_aluminum.png'),
(1424, 'Plastic', 200, 1, 2, 2, 601, 0, 98, 'casing_plastic.png'),
(1423, 'CFK', 1200, 4, 7, 0, 600, 0, 98, 'frame_cfk.png'),
(1422, 'Aluminum', 350, 4, 5, 2, 600, 0, 98, 'frame_aluminum.png'),
(1461, 'Steel', 30, 0, 1, 3, 614, 0, 98, 'wheel_steel.png'),
(1460, 'Xenon ellipsoid', 155, 2, 5, 0, 613, 0, 98, 'light_xenon.png'),
(1459, '2x 20W Halogen R', 45, 2, 4, 0, 613, 0, 98, 'light_20w_halogen.png'),
(1458, '2x 55W Halogen', 20, 1, 3, 0, 613, 0, 98, 'light_55w_halogen.png'),
(1457, '4 KW', 600, 7, 0, 9, 612, 0, 98, 'motor_4kw.png'),
(1456, '2 KW', 300, 8, 0, 7, 612, 0, 98, 'motor_2kw.png'),
(1455, '1 KW', 200, 9, 0, 4, 612, 0, 98, 'motor_1kw.png'),
(1454, 'CFK', 400, 8, 8, 6, 611, 0, 98, 'casing_cfk.png'),
(1453, 'Aluminum', 300, 3, 4, 4, 611, 0, 98, 'casing_aluminum.png'),
(1452, 'Plastic', 200, 1, 2, 2, 611, 0, 98, 'casing_plastic.png'),
(1451, 'CFK', 1200, 4, 7, 0, 610, 0, 98, 'frame_cfk.png'),
(1450, 'Aluminum', 350, 4, 5, 2, 610, 0, 98, 'frame_aluminum.png'),
(1449, 'Steel', 200, 2, 3, 1, 610, 0, 98, 'frame_steel.png'),
(1448, 'CFK', 200, 4, 7, 0, 609, 0, 98, 'handle_cfk.png'),
(1447, 'Aluminum', 60, 3, 5, 0, 609, 0, 98, 'handle_aluminum.png'),
(1446, 'Steel', 40, 2, 3, 0, 609, 0, 98, 'handle_steel.png'),
(1445, 'Design', 75, 0, 2, 5, 608, 0, 98, 'seat_design.png'),
(1444, 'Leather', 50, 0, 1, 3, 608, 0, 98, 'seat_leather.png'),
(1443, 'Plastic', 30, 0, 2, 1, 608, 0, 98, 'seat_plastic.png'),
(1442, 'Lithium-ion', 10000, 10, 0, 8, 607, 0, 98, 'accumulator_ion.png'),
(1441, 'Lithium polymer', 600, 7, 0, 5, 607, 0, 98, 'accumulator_polymer.png'),
(1440, 'Lead-acid', 300, 5, 0, 3, 607, 0, 98, 'accumulator_acid.png'),
(1135, 'Plastic', 30, 0, 2, 1, 498, 0, NULL, 'seat_plastic.png'),
(1136, 'Leather', 50, 0, 1, 3, 498, 0, NULL, 'seat_leather.png'),
(1137, 'Design', 75, 0, 2, 5, 498, 0, NULL, 'seat_design.png'),
(1138, 'Steel', 40, 2, 3, 0, 499, 0, NULL, 'handle_steel.png'),
(1139, 'Aluminum', 60, 3, 5, 0, 499, 0, NULL, 'handle_aluminum.png'),
(1140, 'CFK', 200, 4, 7, 0, 499, 0, NULL, 'handle_cfk.png'),
(1141, 'Steel', 200, 2, 3, 1, 500, 0, NULL, 'frame_steel.png'),
(1142, 'Aluminum', 350, 4, 5, 2, 500, 0, NULL, 'frame_aluminum.png'),
(1143, 'CFK', 1200, 4, 7, 0, 500, 0, NULL, 'frame_cfk.png'),
(1144, 'Plastic', 200, 1, 2, 2, 501, 0, NULL, 'casing_plastic.png'),
(1145, 'Aluminum', 300, 3, 4, 4, 501, 0, NULL, 'casing_aluminum.png'),
(1146, 'CFK', 400, 8, 8, 6, 501, 0, NULL, 'casing_cfk.png'),
(1147, '1 KW', 200, 9, 0, 4, 502, 0, NULL, 'motor_1kw.png'),
(1148, '2 KW', 300, 8, 0, 7, 502, 0, NULL, 'motor_2kw.png'),
(1149, '4 KW', 600, 7, 0, 9, 502, 0, NULL, 'motor_4kw.png'),
(1150, '2x 55W Halogen', 20, 1, 3, 0, 503, 0, NULL, 'light_55w_halogen.png'),
(1151, '2x 20W Halogen R', 45, 2, 4, 0, 503, 0, NULL, 'light_20w_halogen4.png'),
(1152, 'Xenon ellipsoid', 155, 2, 5, 0, 503, 0, NULL, 'light_xenon.png'),
(1153, 'Steel', 30, 0, 1, 3, 504, 0, NULL, 'wheel_steel.png'),
(1154, 'Aluminum', 100, 1, 3, 2, 504, 0, NULL, 'wheel_aluminum.png'),
(1155, 'Aluminum design', 230, 1, 5, 2, 504, 0, NULL, 'wheel_aluminum_design.png'),
(1156, 'Drum brake', 100, 0, 0, 2, 505, 0, NULL, 'brake_drum.png'),
(1157, 'Disc brake', 200, 0, 1, 5, 505, 0, NULL, 'brake_disc.png'),
(1158, 'Coil spring', 105, 0, 0, 2, 506, 0, NULL, 'brake_coil.png'),
(1159, 'Pneumatic', 170, 0, 1, 5, 506, 0, NULL, 'shock_pnematic.png'),
(1160, 'Lead-acid', 300, 5, 0, 3, 507, 0, NULL, 'accumulator_acid.png'),
(1161, 'Lithium polymer', 600, 7, 0, 5, 507, 0, NULL, 'accumulator_polymer.png'),
(1162, 'Lithium-ion', 10000, 10, 0, 8, 507, 0, NULL, 'accumulator_ion.png'),
(1483, '1 KW', 200, 9, 0, 4, 622, 0, 99, 'motor_1kw.png'),
(1482, 'CFK', 400, 8, 8, 6, 621, 0, 99, 'casing_cfk.png'),
(1481, 'Aluminum', 300, 3, 4, 4, 621, 0, 99, 'casing_aluminum.png'),
(1480, 'Plastic', 200, 1, 2, 2, 621, 0, 99, 'casing_plastic.png'),
(1479, 'CFK', 1200, 4, 7, 0, 620, 0, 99, 'frame_cfk.png'),
(1478, 'Aluminum', 350, 4, 5, 2, 620, 0, 99, 'frame_aluminum.png'),
(1477, 'Steel', 200, 2, 3, 1, 620, 0, 99, 'frame_steel.png'),
(1476, 'CFK', 200, 4, 7, 0, 619, 0, 99, 'handle_cfk.png'),
(1475, 'Aluminum', 60, 3, 5, 0, 619, 0, 99, 'handle_aluminum.png'),
(1474, 'Steel', 40, 2, 3, 0, 619, 0, 99, 'handle_steel.png'),
(1473, 'Design', 75, 0, 2, 5, 618, 0, 99, 'seat_design.png'),
(1472, 'Leather', 50, 0, 1, 3, 618, 0, 99, 'seat_leather.png'),
(1471, 'Plastic', 30, 0, 2, 1, 618, 0, 99, 'seat_plastic.png'),
(1470, 'Lithium-ion', 10000, 10, 0, 8, 617, 0, 98, 'accumulator_ion.png'),
(1469, 'Lithium polymer', 600, 7, 0, 5, 617, 0, 98, 'accumulator_polymer.png'),
(1468, 'Lead-acid', 300, 5, 0, 3, 617, 0, 98, 'accumulator_acid.png'),
(1467, 'Pneumatic', 170, 0, 1, 5, 616, 0, 98, 'shock_pnematic.png'),
(1466, 'Coil spring', 105, 0, 0, 2, 616, 0, 98, 'brake_coil.png'),
(1465, 'Disc brake', 200, 0, 1, 5, 615, 0, 98, 'brake_disc.png'),
(1464, 'Drum brake', 100, 0, 0, 2, 615, 0, 98, 'brake_drum.png'),
(1462, 'Aluminum', 100, 1, 3, 2, 614, 0, 98, 'wheel_aluminum.png'),
(1463, 'Aluminum design', 230, 1, 5, 2, 614, 0, 98, 'wheel_aluminum_design.png'),
(1506, 'Aluminum', 350, 4, 5, 2, 630, 0, 99, 'frame_aluminum.png'),
(1505, 'Steel', 200, 2, 3, 1, 630, 0, 99, 'frame_steel.png'),
(1504, 'CFK', 200, 4, 7, 0, 629, 0, 99, 'handle_cfk.png'),
(1503, 'Aluminum', 60, 3, 5, 0, 629, 0, 99, 'handle_aluminum.png'),
(1502, 'Steel', 40, 2, 3, 0, 629, 0, 99, 'handle_steel.png'),
(1501, 'Design', 75, 0, 2, 5, 628, 0, 99, 'seat_design.png'),
(1500, 'Leather', 50, 0, 1, 3, 628, 0, 99, 'seat_leather.png'),
(1499, 'Plastic', 30, 0, 2, 1, 628, 0, 99, 'seat_plastic.png'),
(1498, 'Lithium-ion', 10000, 10, 0, 8, 627, 0, 99, 'accumulator_ion.png'),
(1497, 'Lithium polymer', 600, 7, 0, 5, 627, 0, 99, 'accumulator_polymer.png'),
(1496, 'Lead-acid', 300, 5, 0, 3, 627, 0, 99, 'accumulator_acid.png'),
(1495, 'Pneumatic', 170, 0, 1, 5, 626, 0, 99, 'shock_pnematic.png'),
(1494, 'Coil spring', 105, 0, 0, 2, 626, 0, 99, 'brake_coil.png'),
(1493, 'Disc brake', 200, 0, 1, 5, 625, 0, 99, 'brake_disc.png'),
(1492, 'Drum brake', 100, 0, 0, 2, 625, 0, 99, 'brake_drum.png'),
(1491, 'Aluminum design', 230, 1, 5, 2, 624, 0, 99, 'wheel_aluminum_design.png'),
(1490, 'Aluminum', 100, 1, 3, 2, 624, 0, 99, 'wheel_aluminum.png'),
(1489, 'Steel', 30, 0, 1, 3, 624, 0, 99, 'wheel_steel.png'),
(1488, 'Xenon ellipsoid', 155, 2, 5, 0, 623, 0, 99, 'light_xenon.png'),
(1484, '2 KW', 300, 8, 0, 7, 622, 0, 99, 'motor_2kw.png'),
(1485, '4 KW', 600, 7, 0, 9, 622, 0, 99, 'motor_4kw.png'),
(1486, '2x 55W Halogen', 20, 1, 3, 0, 623, 0, 99, 'light_55w_halogen.png'),
(1487, '2x 20W Halogen R', 45, 2, 4, 0, 623, 0, 99, 'light_20w_halogen.png'),
(1526, 'Lithium-ion', 10000, 10, 0, 8, 637, 0, 99, 'accumulator_ion.png'),
(1525, 'Lithium polymer', 600, 7, 0, 5, 637, 0, 99, 'accumulator_polymer.png'),
(1524, 'Lead-acid', 300, 5, 0, 3, 637, 0, 99, 'accumulator_acid.png'),
(1523, 'Pneumatic', 170, 0, 1, 5, 636, 0, 99, 'shock_pnematic.png'),
(1522, 'Coil spring', 105, 0, 0, 2, 636, 0, 99, 'brake_coil.png'),
(1521, 'Disc brake', 200, 0, 1, 5, 635, 0, 99, 'brake_disc.png'),
(1520, 'Drum brake', 100, 0, 0, 2, 635, 0, 99, 'brake_drum.png'),
(1519, 'Aluminum design', 230, 1, 5, 2, 634, 0, 99, 'wheel_aluminum_design.png'),
(1518, 'Aluminum', 100, 1, 3, 2, 634, 0, 99, 'wheel_aluminum.png'),
(1517, 'Steel', 30, 0, 1, 3, 634, 0, 99, 'wheel_steel.png'),
(1516, 'Xenon ellipsoid', 155, 2, 5, 0, 633, 0, 99, 'light_xenon.png'),
(1515, '2x 20W Halogen R', 45, 2, 4, 0, 633, 0, 99, 'light_20w_halogen.png'),
(1514, '2x 55W Halogen', 20, 1, 3, 0, 633, 0, 99, 'light_55w_halogen.png'),
(1513, '4 KW', 600, 7, 0, 9, 632, 0, 99, 'motor_4kw.png'),
(1512, '2 KW', 300, 8, 0, 7, 632, 0, 99, 'motor_2kw.png'),
(1511, '1 KW', 200, 9, 0, 4, 632, 0, 99, 'motor_1kw.png'),
(1507, 'CFK', 1200, 4, 7, 0, 630, 0, 99, 'frame_cfk.png'),
(1508, 'Plastic', 200, 1, 2, 2, 631, 0, 99, 'casing_plastic.png'),
(1509, 'Aluminum', 300, 3, 4, 4, 631, 0, 99, 'casing_aluminum.png'),
(1510, 'CFK', 400, 8, 8, 6, 631, 0, 99, 'casing_cfk.png'),
(1587, 'Aluminum', 60, 3, 5, 0, 659, 0, 101, 'handle_aluminum.png'),
(1586, 'Steel', 40, 2, 3, 0, 659, 0, 101, 'handle_steel.png'),
(1585, 'Design', 75, 0, 2, 5, 658, 0, 101, 'seat_design.png'),
(1584, 'Leather', 50, 0, 1, 3, 658, 0, 101, 'seat_leather.png'),
(1583, 'Plastic', 30, 0, 2, 1, 658, 0, 101, 'seat_plastic.png'),
(1582, 'Lithium-ion', 10000, 10, 0, 8, 657, 0, 100, 'accumulator_ion.png'),
(1581, 'Lithium polymer', 600, 7, 0, 5, 657, 0, 100, 'accumulator_lithium_poli.png'),
(1580, 'Lead-acid', 300, 5, 0, 3, 657, 0, 100, 'accumulator_acid.png'),
(1579, 'Pneumatic', 170, 0, 1, 5, 656, 0, 100, 'absorber_Pneumatic.png'),
(1578, 'Coil spring', 105, 0, 0, 2, 656, 0, 100, 'absorber_spring.png'),
(1577, 'Disc brake', 200, 0, 1, 5, 655, 0, 100, 'brake_disc.png'),
(1576, 'Drum brake', 100, 0, 0, 2, 655, 0, 100, 'brake_drum.png'),
(1575, 'Aluminum design', 230, 1, 5, 2, 654, 0, 100, 'wheel_aluminum_design.png'),
(1574, 'Aluminum', 100, 1, 3, 2, 654, 0, 100, 'wheel_aluminum.png'),
(1573, 'Steel', 30, 0, 1, 3, 654, 0, 100, 'wheel_steel.png'),
(1572, 'Xenon ellipsoid', 155, 2, 5, 0, 653, 0, 100, 'light_xenon.png'),
(1571, '2x 20W Halogen R', 45, 2, 4, 0, 653, 0, 100, 'light_20w_halogen.png'),
(1570, '2x 55W Halogen', 20, 1, 3, 0, 653, 0, 100, 'light_55w_halogen.png'),
(1569, '4 KW', 600, 7, 0, 9, 652, 0, 100, 'motor_4kw.png'),
(1568, '2 KW', 300, 8, 0, 7, 652, 0, 100, 'motor_2kw.png'),
(1567, '1 KW', 200, 9, 0, 4, 652, 0, 100, 'motor_1kw.png'),
(1566, 'CFK', 400, 8, 8, 6, 651, 0, 100, 'casing_cfk.png'),
(1565, 'Aluminum', 300, 3, 4, 4, 651, 0, 100, 'casing_aluminum.png'),
(1564, 'Plastic', 200, 1, 2, 2, 651, 0, 100, 'casing_plastic.png'),
(1563, 'CFK', 1200, 4, 7, 0, 650, 0, 100, 'frame_cfk.png'),
(1562, 'Aluminum', 350, 4, 5, 2, 650, 0, 100, 'frame_aluminum.png'),
(1561, 'Steel', 200, 2, 3, 1, 650, 0, 100, 'frame_steel.png'),
(1560, 'CFK', 200, 4, 7, 0, 649, 0, 100, 'handle_cfk.png'),
(1559, 'Aluminum', 60, 3, 5, 0, 649, 0, 100, 'handle_aluminum.png'),
(1558, 'Steel', 40, 2, 3, 0, 649, 0, 100, 'handle_steel.png'),
(1557, 'Design', 75, 0, 2, 5, 648, 0, 100, 'seat_design.png'),
(1556, 'Leather', 50, 0, 1, 3, 648, 0, 100, 'seat_leather.png'),
(1555, 'Plastic', 30, 0, 2, 1, 648, 0, 100, 'seat_plastic.png'),
(1554, 'Lithium-ion', 10000, 10, 0, 8, 647, 0, 100, 'accumulator_ion.png'),
(1553, 'Lithium polymer', 600, 7, 0, 5, 647, 0, 100, 'accumulator_lithium_poli.png'),
(1552, 'Lead-acid', 300, 5, 0, 3, 647, 0, 100, 'accumulator_acid.png'),
(1551, 'Pneumatic', 170, 0, 1, 5, 646, 0, 100, 'absorber_Pneumatic.png'),
(1550, 'Coil spring', 105, 0, 0, 2, 646, 0, 100, 'absorber_spring.png'),
(1549, 'Disc brake', 200, 0, 1, 5, 645, 0, 100, 'brake_disc.png'),
(1548, 'Drum brake', 100, 0, 0, 2, 645, 0, 100, 'brake_drum.png'),
(1547, 'Aluminum design', 230, 1, 5, 2, 644, 0, 100, 'wheel_aluminum_design.png'),
(1546, 'Aluminum', 100, 1, 3, 2, 644, 0, 100, 'wheel_aluminum.png'),
(1545, 'Steel', 30, 0, 1, 3, 644, 0, 100, 'wheel_steel.png'),
(1544, 'Xenon ellipsoid', 155, 2, 5, 0, 643, 0, 100, 'light_xenon.png'),
(1543, '2x 20W Halogen R', 45, 2, 4, 0, 643, 0, 100, 'light_20w_halogen.png'),
(1542, '2x 55W Halogen', 20, 1, 3, 0, 643, 0, 100, 'light_55w_halogen.png'),
(1541, '4 KW', 600, 7, 0, 9, 642, 0, 100, 'motor_4kw.png'),
(1540, '2 KW', 300, 8, 0, 7, 642, 0, 100, 'motor_2kw.png'),
(1539, '1 KW', 200, 9, 0, 4, 642, 0, 100, 'motor_1kw.png'),
(1538, 'CFK', 400, 8, 8, 6, 641, 0, 100, 'casing_cfk.png'),
(1537, 'Aluminum', 300, 3, 4, 4, 641, 0, 100, 'casing_aluminum.png'),
(1536, 'Plastic', 200, 1, 2, 2, 641, 0, 100, 'casing_plastic.png'),
(1535, 'CFK', 1200, 4, 7, 0, 640, 0, 100, 'frame_cfk.png'),
(1534, 'Aluminum', 350, 4, 5, 2, 640, 0, 100, 'frame_aluminum.png'),
(1533, 'Steel', 200, 2, 3, 1, 640, 0, 100, 'frame_steel.png'),
(1532, 'CFK', 200, 4, 7, 0, 639, 0, 100, 'handle_cfk.png'),
(1531, 'Aluminum', 60, 3, 5, 0, 639, 0, 100, 'handle_aluminum.png'),
(1527, 'Plastic', 30, 0, 2, 1, 638, 0, 100, 'seat_plastic.png'),
(1528, 'Leather', 50, 0, 1, 3, 638, 0, 100, 'seat_leather.png'),
(1529, 'Design', 75, 0, 2, 5, 638, 0, 100, 'seat_design.png'),
(1530, 'Steel', 40, 2, 3, 0, 639, 0, 100, 'handle_steel.png'),
(1603, 'Aluminum design', 230, 1, 5, 2, 664, 0, 101, 'wheel_aluminum_design.png'),
(1602, 'Aluminum', 100, 1, 3, 2, 664, 0, 101, 'wheel_aluminum.png'),
(1601, 'Steel', 30, 0, 1, 3, 664, 0, 101, 'wheel_steel.png'),
(1600, 'Xenon ellipsoid', 155, 2, 5, 0, 663, 0, 101, 'light_xenon.png'),
(1599, '2x 20W Halogen R', 45, 2, 4, 0, 663, 0, 101, 'light_20w_halogen.png'),
(1598, '2x 55W Halogen', 20, 1, 3, 0, 663, 0, 101, 'light_55w_halogen.png'),
(1597, '4 KW', 600, 7, 0, 9, 662, 0, 101, 'motor_4kw.png'),
(1596, '2 KW', 300, 8, 0, 7, 662, 0, 101, 'motor_2kw.png'),
(1595, '1 KW', 200, 9, 0, 4, 662, 0, 101, 'motor_1kw.png'),
(1594, 'CFK', 400, 8, 8, 6, 661, 0, 101, 'casing_cfk.png'),
(1593, 'Aluminum', 300, 3, 4, 4, 661, 0, 101, 'casing_aluminum.png'),
(1592, 'Plastic', 200, 1, 2, 2, 661, 0, 101, 'casing_plastic.png'),
(1591, 'CFK', 1200, 4, 7, 0, 660, 0, 101, 'frame_cfk.png'),
(1590, 'Aluminum', 350, 4, 5, 2, 660, 0, 101, 'frame_aluminum.png'),
(1589, 'Steel', 200, 2, 3, 1, 660, 0, 101, 'frame_steel.png'),
(1588, 'CFK', 200, 4, 7, 0, 659, 0, 101, 'handle_cfk.png'),
(1604, 'Drum brake', 100, 0, 0, 2, 665, 0, 101, 'brake_drum.png'),
(1605, 'Disc brake', 200, 0, 1, 5, 665, 0, 101, 'brake_disc.png'),
(1606, 'Coil spring', 105, 0, 0, 2, 666, 0, 101, 'absorber_spring.png'),
(1607, 'Pneumatic', 170, 0, 1, 5, 666, 0, 101, 'absorber_Pneumatic.png'),
(1608, 'Lead-acid', 300, 5, 0, 3, 667, 0, 101, 'accumulator_acid.png'),
(1609, 'Lithium polymer', 600, 7, 0, 5, 667, 0, 101, 'accumulator_lithium_poli.png'),
(1610, 'Lithium-ion', 10000, 10, 0, 8, 667, 0, 101, 'accumulator_ion.png'),
(1611, 'Plastic', 30, 0, 2, 1, 668, 0, 101, 'seat_plastic.png'),
(1612, 'Leather', 50, 0, 1, 3, 668, 0, 101, 'seat_leather.png'),
(1613, 'Design', 75, 0, 2, 5, 668, 0, 101, 'seat_design.png'),
(1614, 'Steel', 40, 2, 3, 0, 669, 0, 101, 'handle_steel.png'),
(1615, 'Aluminum', 60, 3, 5, 0, 669, 0, 101, 'handle_aluminum.png'),
(1616, 'CFK', 200, 4, 7, 0, 669, 0, 101, 'handle_cfk.png'),
(1617, 'Steel', 200, 2, 3, 1, 670, 0, 101, 'frame_steel.png'),
(1618, 'Aluminum', 350, 4, 5, 2, 670, 0, 101, 'frame_aluminum.png'),
(1619, 'CFK', 1200, 4, 7, 0, 670, 0, 101, 'frame_cfk.png'),
(1620, 'Plastic', 200, 1, 2, 2, 671, 0, 101, 'casing_plastic.png'),
(1621, 'Aluminum', 300, 3, 4, 4, 671, 0, 101, 'casing_aluminum.png'),
(1622, 'CFK', 400, 8, 8, 6, 671, 0, 101, 'casing_cfk.png'),
(1623, '1 KW', 200, 9, 0, 4, 672, 0, 101, 'motor_1kw.png'),
(1624, '2 KW', 300, 8, 0, 7, 672, 0, 101, 'motor_2kw.png'),
(1625, '4 KW', 600, 7, 0, 9, 672, 0, 101, 'motor_4kw.png'),
(1626, '2x 55W Halogen', 20, 1, 3, 0, 673, 0, 101, 'light_55w_halogen.png'),
(1627, '2x 20W Halogen R', 45, 2, 4, 0, 673, 0, 101, 'light_20w_halogen.png'),
(1628, 'Xenon ellipsoid', 155, 2, 5, 0, 673, 0, 101, 'light_xenon.png'),
(1629, 'Steel', 30, 0, 1, 3, 674, 0, 101, 'wheel_steel.png'),
(1630, 'Aluminum', 100, 1, 3, 2, 674, 0, 101, 'wheel_aluminum.png'),
(1631, 'Aluminum design', 230, 1, 5, 2, 674, 0, 101, 'wheel_aluminum_design.png'),
(1632, 'Drum brake', 100, 0, 0, 2, 675, 0, 101, 'brake_drum.png'),
(1633, 'Disc brake', 200, 0, 1, 5, 675, 0, 101, 'brake_disc.png'),
(1634, 'Coil spring', 105, 0, 0, 2, 676, 0, 101, 'absorber_spring.png'),
(1635, 'Pneumatic', 170, 0, 1, 5, 676, 0, 101, 'absorber_Pneumatic.png'),
(1636, 'Lead-acid', 300, 5, 0, 3, 677, 0, 101, 'accumulator_acid.png'),
(1637, 'Lithium polymer', 600, 7, 0, 5, 677, 0, 101, 'accumulator_lithium_poli.png'),
(1638, 'Lithium-ion', 10000, 10, 0, 8, 677, 0, 101, 'accumulator_ion.png'),
(1639, 'Plastic', 30, 0, 2, 1, 678, 0, 102, 'seat_plastic.png'),
(1640, 'Leather', 50, 0, 1, 3, 678, 0, 102, 'seat_leather.png'),
(1641, 'Design', 75, 0, 2, 5, 678, 0, 102, 'seat_design.png'),
(1642, 'Steel', 40, 2, 3, 0, 679, 0, 102, 'handle_steel.png'),
(1643, 'Aluminum', 60, 3, 5, 0, 679, 0, 102, 'handle_aluminum.png'),
(1644, 'CFK', 200, 4, 7, 0, 679, 0, 102, 'handle_cfk.png'),
(1645, 'Steel', 200, 2, 3, 1, 680, 0, 102, 'frame_steel.png'),
(1646, 'Aluminum', 350, 4, 5, 2, 680, 0, 102, 'frame_aluminum.png'),
(1647, 'CFK', 1200, 4, 7, 0, 680, 0, 102, 'frame_cfk.png'),
(1648, 'Plastic', 200, 1, 2, 2, 681, 0, 102, 'casing_plastic.png'),
(1649, 'Aluminum', 300, 3, 4, 4, 681, 0, 102, 'casing_aluminum.png'),
(1650, 'CFK', 400, 8, 8, 6, 681, 0, 102, 'casing_cfk.png'),
(1651, '1 KW', 200, 9, 0, 4, 682, 0, 102, 'motor_1kw.png'),
(1652, '2 KW', 300, 8, 0, 7, 682, 0, 102, 'motor_2kw.png'),
(1653, '4 KW', 600, 7, 0, 9, 682, 0, 102, 'motor_4kw.png'),
(1654, '2x 55W Halogen', 20, 1, 3, 0, 683, 0, 102, 'light_55w_halogen.png'),
(1655, '2x 20W Halogen R', 45, 2, 4, 0, 683, 0, 102, 'light_20w_halogen.png'),
(1656, 'Xenon ellipsoid', 155, 2, 5, 0, 683, 0, 102, 'light_xenon.png'),
(1657, 'Steel', 30, 0, 1, 3, 684, 0, 102, 'wheel_steel.png'),
(1658, 'Aluminum', 100, 1, 3, 2, 684, 0, 102, 'wheel_aluminum.png'),
(1659, 'Aluminum design', 230, 1, 5, 2, 684, 0, 102, 'wheel_aluminum_design.png'),
(1660, 'Drum brake', 100, 0, 0, 2, 685, 0, 102, 'brake_drum.png'),
(1661, 'Disc brake', 200, 0, 1, 5, 685, 0, 102, 'brake_disc.png'),
(1662, 'Coil spring', 105, 0, 0, 2, 686, 0, 102, 'absorber_spring.png'),
(1663, 'Pneumatic', 170, 0, 1, 5, 686, 0, 102, 'absorber_Pneumatic.png'),
(1664, 'Lead-acid', 300, 5, 0, 3, 687, 0, 102, 'accumulator_acid.png'),
(1665, 'Lithium polymer', 600, 7, 0, 5, 687, 0, 102, 'accumulator_lithium_poli.png'),
(1666, 'Lithium-ion', 10000, 10, 0, 8, 687, 0, 102, 'accumulator_ion.png'),
(1667, 'Plastic', 30, 0, 2, 1, 688, 0, 102, 'seat_plastic.png'),
(1668, 'Leather', 50, 0, 1, 3, 688, 0, 102, 'seat_leather.png'),
(1669, 'Design', 75, 0, 2, 5, 688, 0, 102, 'seat_design.png'),
(1670, 'Steel', 40, 2, 3, 0, 689, 0, 102, 'handle_steel.png'),
(1671, 'Aluminum', 60, 3, 5, 0, 689, 0, 102, 'handle_aluminum.png'),
(1672, 'CFK', 200, 4, 7, 0, 689, 0, 102, 'handle_cfk.png'),
(1673, 'Steel', 200, 2, 3, 1, 690, 0, 102, 'frame_steel.png'),
(1674, 'Aluminum', 350, 4, 5, 2, 690, 0, 102, 'frame_aluminum.png'),
(1675, 'CFK', 1200, 4, 7, 0, 690, 0, 102, 'frame_cfk.png'),
(1676, 'Plastic', 200, 1, 2, 2, 691, 0, 102, 'casing_plastic.png'),
(1677, 'Aluminum', 300, 3, 4, 4, 691, 0, 102, 'casing_aluminum.png'),
(1678, 'CFK', 400, 8, 8, 6, 691, 0, 102, 'casing_cfk.png'),
(1679, '1 KW', 200, 9, 0, 4, 692, 0, 102, 'motor_1kw.png'),
(1680, '2 KW', 300, 8, 0, 7, 692, 0, 102, 'motor_2kw.png'),
(1681, '4 KW', 600, 7, 0, 9, 692, 0, 102, 'motor_4kw.png'),
(1682, '2x 55W Halogen', 20, 1, 3, 0, 693, 0, 102, 'light_55w_halogen.png'),
(1683, '2x 20W Halogen R', 45, 2, 4, 0, 693, 0, 102, 'light_20w_halogen.png'),
(1684, 'Xenon ellipsoid', 155, 2, 5, 0, 693, 0, 102, 'light_xenon.png'),
(1685, 'Steel', 30, 0, 1, 3, 694, 0, 102, 'wheel_steel.png'),
(1686, 'Aluminum', 100, 1, 3, 2, 694, 0, 102, 'wheel_aluminum.png'),
(1687, 'Aluminum design', 230, 1, 5, 2, 694, 0, 102, 'wheel_aluminum_design.png'),
(1688, 'Drum brake', 100, 0, 0, 2, 695, 0, 102, 'brake_drum.png'),
(1689, 'Disc brake', 200, 0, 1, 5, 695, 0, 102, 'brake_disc.png'),
(1690, 'Coil spring', 105, 0, 0, 2, 696, 0, 102, 'absorber_spring.png'),
(1691, 'Pneumatic', 170, 0, 1, 5, 696, 0, 102, 'absorber_Pneumatic.png'),
(1692, 'Lead-acid', 300, 5, 0, 3, 697, 0, 102, 'accumulator_acid.png'),
(1693, 'Lithium polymer', 600, 7, 0, 5, 697, 0, 102, 'accumulator_lithium_poli.png'),
(1694, 'Lithium-ion', 10000, 10, 0, 8, 697, 0, 102, 'accumulator_ion.png'),
(1695, 'Plastic', 40, 10, 2, 1, 698, 0, 103, 'seat_plastic.png'),
(1696, 'Leather', 50, 0, 1, 3, 698, 0, 103, 'seat_leather.png'),
(1697, 'Design', 75, 0, 2, 5, 698, 0, 103, 'seat_design.png'),
(1698, 'Steel', 40, 2, 3, 0, 699, 0, 103, 'handle_steel.png'),
(1699, 'Aluminum', 60, 3, 5, 0, 699, 0, 103, 'handle_aluminum.png'),
(1700, 'CFK', 200, 4, 7, 0, 699, 0, 103, 'handle_cfk.png'),
(1701, 'Steel', 200, 2, 3, 1, 700, 0, 103, 'frame_steel.png'),
(1702, 'Aluminum', 350, 4, 5, 2, 700, 0, 103, 'frame_aluminum.png'),
(1703, 'CFK', 1200, 4, 7, 0, 700, 0, 103, 'frame_cfk.png'),
(1704, 'Plastic', 200, 1, 2, 2, 701, 0, 103, 'casing_plastic.png'),
(1705, 'Aluminum', 300, 3, 4, 4, 701, 0, 103, 'casing_aluminum.png'),
(1706, 'CFK', 400, 8, 8, 6, 701, 0, 103, 'casing_cfk.png'),
(1707, '1 KW', 200, 9, 0, 4, 702, 0, 103, 'motor_1kw.png'),
(1708, '2 KW', 300, 8, 0, 7, 702, 0, 103, 'motor_2kw.png'),
(1709, '4 KW', 600, 7, 0, 9, 702, 0, 103, 'motor_4kw.png'),
(1710, '2x 55W Halogen', 20, 1, 3, 0, 703, 0, 103, 'light_55w_halogen.png'),
(1711, '2x 20W Halogen R', 45, 2, 4, 0, 703, 0, 103, 'light_20w_halogen.png'),
(1712, 'Xenon ellipsoid', 155, 2, 5, 0, 703, 0, 103, 'light_xenon.png'),
(1713, 'Steel', 30, 0, 1, 3, 704, 0, 103, 'wheel_steel.png'),
(1714, 'Aluminum', 100, 1, 3, 2, 704, 0, 103, 'wheel_aluminum.png'),
(1715, 'Aluminum design', 230, 1, 5, 2, 704, 0, 103, 'wheel_aluminum_design.png'),
(1716, 'Drum brake', 100, 0, 0, 2, 705, 0, 103, 'brake_drum.png'),
(1717, 'Disc brake', 200, 0, 1, 5, 705, 0, 103, 'brake_disc.png'),
(1718, 'Coil spring', 105, 0, 0, 2, 706, 0, 103, 'absorber_spring.png'),
(1719, 'Pneumatic', 170, 0, 1, 5, 706, 0, 103, 'absorber_Pneumatic.png'),
(1720, 'Lead-acid', 300, 5, 0, 3, 707, 0, 103, 'accumulator_acid.png'),
(1721, 'Lithium polymer', 600, 7, 0, 5, 707, 0, 103, 'accumulator_lithium_poli.png'),
(1722, 'Lithium-ion', 10000, 10, 0, 8, 707, 0, 103, 'accumulator_ion.png'),
(1939, 'Aluminum design', 230, 1, 5, 2, 784, 0, 111, 'wheel_aluminum_design.png'),
(1938, 'Aluminum', 100, 1, 3, 2, 784, 0, 111, 'wheel_aluminum.png'),
(1937, 'Steel', 60, 0, 1, 3, 784, 0, 111, 'wheel_steel.png'),
(1936, 'Xenon ellipsoid', 155, 2, 5, 0, 783, 0, 111, 'light_xenon.png'),
(1935, '2x 20W Halogen R', 45, 2, 4, 0, 783, 0, 111, 'light_20w_halogen.png'),
(1934, '2x 55W Halogen', 20, 1, 3, 0, 783, 0, 111, 'light_55w_halogen.png'),
(1933, '4 KW', 600, 7, 0, 9, 782, 0, 111, 'motor_4kw.png'),
(1932, '2 KW', 300, 8, 0, 7, 782, 0, 111, 'motor_2kw.png'),
(1931, '1 KW', 200, 9, 0, 4, 782, 0, 111, 'motor_1kw.png'),
(1930, 'CFK', 400, 8, 8, 6, 781, 0, 111, 'casing_cfk.png'),
(1929, 'Aluminum', 300, 3, 4, 4, 781, 0, 111, 'casing_aluminum.png'),
(1928, 'Plastic', 200, 1, 2, 2, 781, 0, 111, 'casing_plastic.png'),
(1927, 'CFK', 1200, 4, 7, 3, 780, 0, 111, 'frame_cfk.png'),
(1926, 'Aluminum', 350, 4, 5, 2, 780, 0, 111, 'frame_aluminum.png'),
(1925, 'Steel', 200, 2, 3, 1, 780, 0, 111, 'frame_steel.png'),
(1924, 'CFK', 200, 4, 7, 0, 779, 0, 111, 'handle_cfk.png'),
(1923, 'Aluminum', 60, 3, 5, 0, 779, 0, 111, 'handle_aluminum.png'),
(1922, 'Steel', 40, 2, 3, 0, 779, 0, 111, 'handle_steel.png'),
(1921, 'Design', 75, 0, 5, 2, 778, 0, 111, 'seat_design.png'),
(1920, 'Leather', 50, 0, 3, 1, 778, 0, 111, 'seat_leather.png'),
(1919, 'Plastic', 30, 0, 2, 1, 778, 0, 111, 'seat_plastic.png'),
(1911, 'Aluminum design', 230, 1, 5, 2, 774, 0, 110, 'wheel_aluminum_design.png'),
(1910, 'Aluminum', 100, 1, 3, 2, 774, 0, 110, 'wheel_aluminum.png'),
(1909, 'Steel', 60, 0, 1, 3, 774, 0, 110, 'wheel_steel.png'),
(1908, 'Xenon ellipsoid', 155, 2, 5, 0, 773, 0, 110, 'light_xenon.png'),
(1907, '2x 20W Halogen R', 45, 2, 4, 0, 773, 0, 110, 'light_20w_halogen.png'),
(1906, '2x 55W Halogen', 20, 1, 3, 0, 773, 0, 110, 'light_55w_halogen.png'),
(1905, '4 KW', 600, 7, 0, 9, 772, 0, 110, 'motor_4kw.png'),
(1904, '2 KW', 300, 8, 0, 7, 772, 0, 110, 'motor_2kw.png'),
(1903, '1 KW', 200, 9, 0, 4, 772, 0, 110, 'motor_1kw.png'),
(1902, 'CFK', 400, 8, 8, 6, 771, 0, 110, 'casing_cfk.png'),
(1901, 'Aluminum', 300, 3, 4, 4, 771, 0, 110, 'casing_aluminum.png'),
(1900, 'Plastic', 200, 1, 2, 2, 771, 0, 110, 'casing_plastic.png'),
(1899, 'CFK', 1200, 4, 7, 3, 770, 0, 110, 'frame_cfk.png'),
(1898, 'Aluminum', 350, 4, 5, 2, 770, 0, 110, 'frame_aluminum.png'),
(1897, 'Steel', 200, 2, 3, 1, 770, 0, 110, 'frame_steel.png'),
(1896, 'CFK', 200, 4, 7, 0, 769, 0, 110, 'handle_cfk.png'),
(1895, 'Aluminum', 60, 3, 5, 0, 769, 0, 110, 'handle_aluminum.png'),
(1894, 'Steel', 40, 2, 3, 0, 769, 0, 110, 'handle_steel.png'),
(1893, 'Design', 75, 0, 5, 2, 768, 0, 110, 'seat_design.png'),
(1892, 'Leather', 50, 0, 3, 1, 768, 0, 110, 'seat_leather.png'),
(1891, 'Plastic', 30, 0, 2, 1, 768, 0, 110, 'seat_plastic.png'),
(1855, 'Aluminum design', 230, 1, 5, 2, 754, 0, 108, 'wheel_aluminum_design.png'),
(1854, 'Aluminum', 100, 1, 3, 2, 754, 0, 108, 'wheel_aluminum.png'),
(1853, 'Steel', 60, 0, 1, 3, 754, 0, 108, 'wheel_steel.png'),
(1852, 'Xenon ellipsoid', 155, 2, 5, 0, 753, 0, 108, 'light_xenon.png'),
(1851, '2x 20W Halogen R', 45, 2, 4, 0, 753, 0, 108, 'light_20w_halogen.png'),
(1850, '2x 55W Halogen', 20, 1, 3, 0, 753, 0, 108, 'light_55w_halogen.png'),
(1849, '4 KW', 600, 7, 0, 9, 752, 0, 108, 'motor_4kw.png'),
(1848, '2 KW', 300, 8, 0, 7, 752, 0, 108, 'motor_2kw.png'),
(1847, '1 KW', 200, 9, 0, 4, 752, 0, 108, 'motor_1kw.png'),
(1846, 'CFK', 400, 8, 8, 6, 751, 0, 108, 'casing_cfk.png'),
(1845, 'Aluminum', 300, 3, 4, 4, 751, 0, 108, 'casing_aluminum.png'),
(1844, 'Plastic', 200, 1, 2, 2, 751, 0, 108, 'casing_plastic.png'),
(1843, 'CFK', 1200, 4, 7, 3, 750, 0, 108, 'frame_cfk.png'),
(1842, 'Aluminum', 350, 4, 5, 2, 750, 0, 108, 'frame_aluminum.png'),
(1841, 'Steel', 200, 2, 3, 1, 750, 0, 108, 'frame_steel.png'),
(1840, 'CFK', 200, 4, 7, 0, 749, 0, 108, 'handle_cfk.png'),
(1839, 'Aluminum', 60, 3, 5, 0, 749, 0, 108, 'handle_aluminum.png'),
(1838, 'Steel', 40, 2, 3, 0, 749, 0, 108, 'handle_steel.png'),
(1837, 'Design', 75, 0, 5, 2, 748, 0, 108, 'seat_design.png'),
(1836, 'Leather', 50, 0, 3, 1, 748, 0, 108, 'seat_leather.png'),
(1835, 'Plastic', 30, 0, 2, 1, 748, 0, 108, 'seat_plastic.png'),
(1883, 'Aluminum design', 230, 1, 5, 2, 764, 0, 109, 'wheel_aluminum_design.png'),
(1882, 'Aluminum', 100, 1, 3, 2, 764, 0, 109, 'wheel_aluminum.png'),
(1881, 'Steel', 60, 0, 1, 3, 764, 0, 109, 'wheel_steel.png'),
(1880, 'Xenon ellipsoid', 155, 2, 5, 0, 763, 0, 109, 'light_xenon.png'),
(1879, '2x 20W Halogen R', 45, 2, 4, 0, 763, 0, 109, 'light_20w_halogen.png'),
(1878, '2x 55W Halogen', 20, 1, 3, 0, 763, 0, 109, 'light_55w_halogen.png'),
(1877, '4 KW', 600, 7, 0, 9, 762, 0, 109, 'motor_4kw.png'),
(1876, '2 KW', 300, 8, 0, 7, 762, 0, 109, 'motor_2kw.png'),
(1875, '1 KW', 200, 9, 0, 4, 762, 0, 109, 'motor_1kw.png'),
(1874, 'CFK', 400, 8, 8, 6, 761, 0, 109, 'casing_cfk.png'),
(1873, 'Aluminum', 300, 3, 4, 4, 761, 0, 109, 'casing_aluminum.png'),
(1872, 'Plastic', 200, 1, 2, 2, 761, 0, 109, 'casing_plastic.png'),
(1871, 'CFK', 1200, 4, 7, 3, 760, 0, 109, 'frame_cfk.png'),
(1870, 'Aluminum', 350, 4, 5, 2, 760, 0, 109, 'frame_aluminum.png'),
(1869, 'Steel', 200, 2, 3, 1, 760, 0, 109, 'frame_steel.png'),
(1868, 'CFK', 200, 4, 7, 0, 759, 0, 109, 'handle_cfk.png'),
(1867, 'Aluminum', 60, 3, 5, 0, 759, 0, 109, 'handle_aluminum.png'),
(1866, 'Steel', 40, 2, 3, 0, 759, 0, 109, 'handle_steel.png'),
(1865, 'Design', 75, 0, 5, 2, 758, 0, 109, 'seat_design.png'),
(1864, 'Leather', 50, 0, 3, 1, 758, 0, 109, 'seat_leather.png'),
(1863, 'Plastic', 30, 0, 2, 1, 758, 0, 109, 'seat_plastic.png'),
(1856, 'Drum brake', 100, 0, 0, 2, 755, 0, 108, 'brake_drum.png'),
(1857, 'Disc brake', 200, 0, 1, 5, 755, 0, 108, 'brake_disc.png'),
(1858, 'Coil spring', 105, 0, 0, 2, 756, 0, 108, 'absorber_spring.png'),
(1859, 'Pneumatic', 170, 0, 1, 5, 756, 0, 108, 'absorber_Pneumatic.png'),
(1860, 'Lead-acid', 300, 5, 0, 3, 757, 0, 108, 'accumulator_acid.png'),
(1861, 'Lithium polymer', 600, 7, 0, 5, 757, 0, 108, 'accumulator_lithium_poli.png'),
(1862, 'Lithium-ion', 1000, 10, 0, 8, 757, 0, 108, 'accumulator_ion.png'),
(1884, 'Drum brake', 100, 0, 0, 2, 765, 0, 109, 'brake_drum.png'),
(1885, 'Disc brake', 200, 0, 1, 5, 765, 0, 109, 'brake_disc.png'),
(1886, 'Coil spring', 105, 0, 0, 2, 766, 0, 109, 'absorber_spring.png'),
(1887, 'Pneumatic', 170, 0, 1, 5, 766, 0, 109, 'absorber_Pneumatic.png'),
(1888, 'Lead-acid', 300, 5, 0, 3, 767, 0, 109, 'accumulator_acid.png'),
(1889, 'Lithium polymer', 600, 7, 0, 5, 767, 0, 109, 'accumulator_lithium_poli.png'),
(1890, 'Lithium-ion', 1000, 10, 0, 8, 767, 0, 109, 'accumulator_ion.png'),
(1912, 'Drum brake', 100, 0, 0, 2, 775, 0, 110, 'brake_drum.png'),
(1913, 'Disc brake', 200, 0, 1, 5, 775, 0, 110, 'brake_disc.png'),
(1914, 'Coil spring', 105, 0, 0, 2, 776, 0, 110, 'absorber_spring.png'),
(1915, 'Pneumatic', 170, 0, 1, 5, 776, 0, 110, 'absorber_Pneumatic.png'),
(1916, 'Lead-acid', 300, 5, 0, 3, 777, 0, 110, 'accumulator_acid.png'),
(1917, 'Lithium polymer', 600, 7, 0, 5, 777, 0, 110, 'accumulator_lithium_poli.png'),
(1918, 'Lithium-ion', 1000, 10, 0, 8, 777, 0, 110, 'accumulator_ion.png'),
(1940, 'Drum brake', 100, 0, 0, 2, 785, 0, 111, 'brake_drum.png'),
(1941, 'Disc brake', 200, 0, 1, 5, 785, 0, 111, 'brake_disc.png'),
(1942, 'Coil spring', 105, 0, 0, 2, 786, 0, 111, 'absorber_spring.png'),
(1943, 'Pneumatic', 170, 0, 1, 5, 786, 0, 111, 'absorber_Pneumatic.png'),
(1944, 'Lead-acid', 300, 5, 0, 3, 787, 0, 111, 'accumulator_acid.png'),
(1945, 'Lithium polymer', 600, 7, 0, 5, 787, 0, 111, 'accumulator_lithium_poli.png'),
(1946, 'Lithium-ion', 1000, 10, 0, 8, 787, 0, 111, 'accumulator_ion.png'),
(2480, 'Leather', 50, 0, 3, 1, 978, 0, 116, 'seat_leather.png'),
(2479, 'Plastic', 30, 0, 2, 1, 978, 0, 116, 'seat_plastic.png'),
(2478, 'Lithium-ion', 1000, 10, 0, 8, 977, 0, 116, 'accumulator_ion.png'),
(2477, 'Lithium polymer', 600, 7, 0, 5, 977, 0, 116, 'accumulator_lithium_poli.png'),
(2476, 'Lead-acid', 300, 5, 0, 3, 977, 0, 116, 'accumulator_acid.png'),
(2475, 'Pneumatic', 170, 0, 1, 5, 976, 0, 116, 'absorber_Pneumatic.png'),
(2474, 'Coil spring', 105, 0, 0, 2, 976, 0, 116, 'absorber_spring.png'),
(2473, 'Disc brake', 200, 0, 1, 5, 975, 0, 116, 'brake_disc.png'),
(2472, 'Drum brake', 100, 0, 0, 2, 975, 0, 116, 'brake_drum.png'),
(2471, 'Aluminum design', 230, 1, 5, 2, 974, 0, 116, 'wheel_aluminum_design.png'),
(2470, 'Aluminum', 100, 1, 3, 2, 974, 0, 116, 'wheel_aluminum.png'),
(2469, 'Steel', 60, 0, 1, 3, 974, 0, 116, 'wheel_steel.png'),
(2468, 'Xenon ellipsoid', 155, 2, 5, 0, 973, 0, 116, 'light_xenon.png'),
(2467, '2x 20W Halogen R', 45, 2, 4, 0, 973, 0, 116, 'light_20w_halogen.png'),
(2466, '2x 55W Halogen', 20, 1, 3, 0, 973, 0, 116, 'light_55w_halogen.png'),
(2465, '4 KW', 600, 7, 0, 9, 972, 0, 116, 'motor_4kw.png'),
(2464, '2 KW', 300, 8, 0, 7, 972, 0, 116, 'motor_2kw.png'),
(2463, '1 KW', 200, 9, 0, 4, 972, 0, 116, 'motor_1kw.png'),
(2462, 'CFK', 400, 8, 8, 6, 971, 0, 116, 'casing_cfk.png'),
(2461, 'Aluminum', 300, 3, 4, 4, 971, 0, 116, 'casing_aluminum.png'),
(2460, 'Plastic', 200, 1, 2, 2, 971, 0, 116, 'casing_plastic.png'),
(2459, 'CFK', 1200, 4, 7, 3, 970, 0, 116, 'frame_cfk.png'),
(2458, 'Aluminum', 350, 4, 5, 2, 970, 0, 116, 'frame_aluminum.png'),
(2457, 'Steel', 200, 2, 3, 1, 970, 0, 116, 'frame_steel.png'),
(2456, 'CFK', 200, 4, 7, 0, 969, 0, 116, 'handle_cfk.png'),
(2455, 'Aluminum', 60, 3, 5, 0, 969, 0, 116, 'handle_aluminum.png'),
(2454, 'Steel', 40, 2, 3, 0, 969, 0, 116, 'handle_steel.png'),
(2453, 'Design', 75, 0, 5, 2, 968, 0, 116, 'seat_design.png'),
(2452, 'Leather', 50, 0, 3, 1, 968, 0, 116, 'seat_leather.png'),
(2451, 'Plastic', 30, 0, 2, 1, 968, 0, 116, 'seat_plastic.png'),
(2450, 'Lithium-ion', 1000, 10, 0, 8, 967, 0, 116, 'accumulator_ion.png'),
(2449, 'Lithium polymer', 600, 7, 0, 5, 967, 0, 116, 'accumulator_lithium_poli.png'),
(2448, 'Lead-acid', 300, 5, 0, 3, 967, 0, 116, 'accumulator_acid.png'),
(2447, 'Pneumatic', 170, 0, 1, 5, 966, 0, 116, 'absorber_Pneumatic.png'),
(2446, 'Coil spring', 105, 0, 0, 2, 966, 0, 116, 'absorber_spring.png'),
(2445, 'Disc brake', 200, 0, 1, 5, 965, 0, 116, 'brake_disc.png'),
(2444, 'Drum brake', 100, 0, 0, 2, 965, 0, 116, 'brake_drum.png'),
(2443, 'Aluminum design', 230, 1, 5, 2, 964, 0, 116, 'wheel_aluminum_design.png'),
(2442, 'Aluminum', 100, 1, 3, 2, 964, 0, 116, 'wheel_aluminum.png'),
(2441, 'Steel', 60, 0, 1, 3, 964, 0, 116, 'wheel_steel.png'),
(2440, 'Xenon ellipsoid', 155, 2, 5, 0, 963, 0, 116, 'light_xenon.png'),
(2439, '2x 20W Halogen R', 45, 2, 4, 0, 963, 0, 116, 'light_20w_halogen.png'),
(2438, '2x 55W Halogen', 20, 1, 3, 0, 963, 0, 116, 'light_55w_halogen.png'),
(2437, '4 KW', 600, 7, 0, 9, 962, 0, 116, 'motor_4kw.png'),
(2436, '2 KW', 300, 8, 0, 7, 962, 0, 116, 'motor_2kw.png'),
(2435, '1 KW', 200, 9, 0, 4, 962, 0, 116, 'motor_1kw.png'),
(2434, 'CFK', 400, 8, 8, 6, 961, 0, 116, 'casing_cfk.png'),
(2433, 'Aluminum', 300, 3, 4, 4, 961, 0, 116, 'casing_aluminum.png'),
(2432, 'Plastic', 200, 1, 2, 2, 961, 0, 116, 'casing_plastic.png'),
(2431, 'CFK', 1200, 4, 7, 3, 960, 0, 116, 'frame_cfk.png'),
(2430, 'Aluminum', 350, 4, 5, 2, 960, 0, 116, 'frame_aluminum.png'),
(2429, 'Steel', 200, 2, 3, 1, 960, 0, 116, 'frame_steel.png'),
(2428, 'CFK', 200, 4, 7, 0, 959, 0, 116, 'handle_cfk.png'),
(2427, 'Aluminum', 60, 3, 5, 0, 959, 0, 116, 'handle_aluminum.png'),
(2426, 'Steel', 40, 2, 3, 0, 959, 0, 116, 'handle_steel.png'),
(2425, 'Design', 75, 0, 5, 2, 958, 0, 116, 'seat_design.png'),
(2424, 'Leather', 50, 0, 3, 1, 958, 0, 116, 'seat_leather.png'),
(2423, 'Plastic', 30, 0, 2, 1, 958, 0, 116, 'seat_plastic.png'),
(2422, 'Lithium-ion', 1000, 10, 0, 8, 957, 0, 116, 'accumulator_ion.png'),
(2421, 'Lithium polymer', 600, 7, 0, 5, 957, 0, 116, 'accumulator_lithium_poli.png'),
(2420, 'Lead-acid', 300, 5, 0, 3, 957, 0, 116, 'accumulator_acid.png'),
(2419, 'Pneumatic', 170, 0, 1, 5, 956, 0, 116, 'absorber_Pneumatic.png'),
(2418, 'Coil spring', 105, 0, 0, 2, 956, 0, 116, 'absorber_spring.png'),
(2417, 'Disc brake', 200, 0, 1, 5, 955, 0, 116, 'brake_disc.png'),
(2416, 'Drum brake', 100, 0, 0, 2, 955, 0, 116, 'brake_drum.png'),
(2415, 'Aluminum design', 230, 1, 5, 2, 954, 0, 116, 'wheel_aluminum_design.png'),
(2414, 'Aluminum', 100, 1, 3, 2, 954, 0, 116, 'wheel_aluminum.png'),
(2413, 'Steel', 60, 0, 1, 3, 954, 0, 116, 'wheel_steel.png'),
(2412, 'Xenon ellipsoid', 155, 2, 5, 0, 953, 0, 116, 'light_xenon.png'),
(2411, '2x 20W Halogen R', 45, 2, 4, 0, 953, 0, 116, 'light_20w_halogen.png'),
(2410, '2x 55W Halogen', 20, 1, 3, 0, 953, 0, 116, 'light_55w_halogen.png'),
(2409, '4 KW', 600, 7, 0, 9, 952, 0, 116, 'motor_4kw.png'),
(2408, '2 KW', 300, 8, 0, 7, 952, 0, 116, 'motor_2kw.png'),
(2407, '1 KW', 200, 9, 0, 4, 952, 0, 116, 'motor_1kw.png'),
(2406, 'CFK', 400, 8, 8, 6, 951, 0, 116, 'casing_cfk.png'),
(2405, 'Aluminum', 300, 3, 4, 4, 951, 0, 116, 'casing_aluminum.png'),
(2404, 'Plastic', 200, 1, 2, 2, 951, 0, 116, 'casing_plastic.png'),
(2403, 'CFK', 1200, 4, 7, 3, 950, 0, 116, 'frame_cfk.png'),
(2402, 'Aluminum', 350, 4, 5, 2, 950, 0, 116, 'frame_aluminum.png'),
(2401, 'Steel', 200, 2, 3, 1, 950, 0, 116, 'frame_steel.png'),
(2400, 'CFK', 200, 4, 7, 0, 949, 0, 116, 'handle_cfk.png'),
(2399, 'Aluminum', 60, 3, 5, 0, 949, 0, 116, 'handle_aluminum.png'),
(2398, 'Steel', 40, 2, 3, 0, 949, 0, 116, 'handle_steel.png'),
(2397, 'Design', 75, 0, 5, 2, 948, 0, 116, 'seat_design.png'),
(2396, 'Leather', 50, 0, 3, 1, 948, 0, 116, 'seat_leather.png'),
(2395, 'Plastic', 30, 0, 2, 1, 948, 0, 116, 'seat_plastic.png'),
(2704, 'Leather', 50, 0, 3, 1, 1058, 0, 118, 'seat_leather.png'),
(2703, 'Plastic', 30, 0, 2, 1, 1058, 0, 118, 'seat_plastic.png'),
(2702, 'Lithium-ion', 1000, 10, 0, 8, 1057, 0, 118, 'accumulator_ion.png'),
(2701, 'Lithium polymer', 600, 7, 0, 5, 1057, 0, 118, 'accumulator_lithium_poli.png'),
(2700, 'Lead-acid', 300, 5, 0, 3, 1057, 0, 118, 'accumulator_acid.png'),
(2699, 'Pneumatic', 170, 0, 1, 5, 1056, 0, 118, 'absorber_Pneumatic.png'),
(2698, 'Coil spring', 105, 0, 0, 2, 1056, 0, 118, 'absorber_spring.png'),
(2697, 'Disc brake', 200, 0, 1, 5, 1055, 0, 118, 'brake_disc.png'),
(2696, 'Drum brake', 100, 0, 0, 2, 1055, 0, 118, 'brake_drum.png'),
(2695, 'Aluminum design', 230, 1, 5, 2, 1054, 0, 118, 'wheel_aluminum_design.png'),
(2694, 'Aluminum', 100, 1, 3, 2, 1054, 0, 118, 'wheel_aluminum.png'),
(2693, 'Steel', 60, 0, 1, 3, 1054, 0, 118, 'wheel_steel.png'),
(2692, 'Xenon ellipsoid', 155, 2, 5, 0, 1053, 0, 118, 'light_xenon.png'),
(2691, '2x 20W Halogen R', 45, 2, 4, 0, 1053, 0, 118, 'light_20w_halogen.png'),
(2690, '2x 55W Halogen', 20, 1, 3, 0, 1053, 0, 118, 'light_55w_halogen.png'),
(2689, '4 KW', 600, 7, 0, 9, 1052, 0, 118, 'motor_4kw.png'),
(2688, '2 KW', 300, 8, 0, 7, 1052, 0, 118, 'motor_2kw.png'),
(2687, '1 KW', 200, 9, 0, 4, 1052, 0, 118, 'motor_1kw.png'),
(2686, 'CFK', 400, 8, 8, 6, 1051, 0, 118, 'casing_cfk.png'),
(2685, 'Aluminum', 300, 3, 4, 4, 1051, 0, 118, 'casing_aluminum.png'),
(2684, 'Plastic', 200, 1, 2, 2, 1051, 0, 118, 'casing_plastic.png'),
(2683, 'CFK', 1200, 4, 7, 3, 1050, 0, 118, 'frame_cfk.png'),
(2682, 'Aluminum', 350, 4, 5, 2, 1050, 0, 118, 'frame_aluminum.png'),
(2681, 'Steel', 200, 2, 3, 1, 1050, 0, 118, 'frame_steel.png'),
(2680, 'CFK', 200, 4, 7, 0, 1049, 0, 118, 'handle_cfk.png'),
(2679, 'Aluminum', 60, 3, 5, 0, 1049, 0, 118, 'handle_aluminum.png'),
(2678, 'Steel', 40, 2, 3, 0, 1049, 0, 118, 'handle_steel.png'),
(2677, 'Design', 75, 0, 5, 2, 1048, 0, 118, 'seat_design.png'),
(2676, 'Leather', 50, 0, 3, 1, 1048, 0, 118, 'seat_leather.png'),
(2675, 'Plastic', 30, 0, 2, 1, 1048, 0, 118, 'seat_plastic.png'),
(2674, 'Lithium-ion', 1000, 10, 0, 8, 1047, 0, 118, 'accumulator_ion.png'),
(2673, 'Lithium polymer', 600, 7, 0, 5, 1047, 0, 118, 'accumulator_lithium_poli.png'),
(2672, 'Lead-acid', 300, 5, 0, 3, 1047, 0, 118, 'accumulator_acid.png'),
(2671, 'Pneumatic', 170, 0, 1, 5, 1046, 0, 118, 'absorber_Pneumatic.png'),
(2670, 'Coil spring', 105, 0, 0, 2, 1046, 0, 118, 'absorber_spring.png'),
(2669, 'Disc brake', 200, 0, 1, 5, 1045, 0, 118, 'brake_disc.png'),
(2668, 'Drum brake', 100, 0, 0, 2, 1045, 0, 118, 'brake_drum.png'),
(2667, 'Aluminum design', 230, 1, 5, 2, 1044, 0, 118, 'wheel_aluminum_design.png'),
(2666, 'Aluminum', 100, 1, 3, 2, 1044, 0, 118, 'wheel_aluminum.png'),
(2665, 'Steel', 60, 0, 1, 3, 1044, 0, 118, 'wheel_steel.png'),
(2664, 'Xenon ellipsoid', 155, 2, 5, 0, 1043, 0, 118, 'light_xenon.png'),
(2663, '2x 20W Halogen R', 45, 2, 4, 0, 1043, 0, 118, 'light_20w_halogen.png'),
(2662, '2x 55W Halogen', 20, 1, 3, 0, 1043, 0, 118, 'light_55w_halogen.png'),
(2661, '4 KW', 600, 7, 0, 9, 1042, 0, 118, 'motor_4kw.png'),
(2660, '2 KW', 300, 8, 0, 7, 1042, 0, 118, 'motor_2kw.png'),
(2659, '1 KW', 200, 9, 0, 4, 1042, 0, 118, 'motor_1kw.png'),
(2658, 'CFK', 400, 8, 8, 6, 1041, 0, 118, 'casing_cfk.png'),
(2657, 'Aluminum', 300, 3, 4, 4, 1041, 0, 118, 'casing_aluminum.png'),
(2656, 'Plastic', 200, 1, 2, 2, 1041, 0, 118, 'casing_plastic.png'),
(2655, 'CFK', 1200, 4, 7, 3, 1040, 0, 118, 'frame_cfk.png'),
(2654, 'Aluminum', 350, 4, 5, 2, 1040, 0, 118, 'frame_aluminum.png'),
(2653, 'Steel', 200, 2, 3, 1, 1040, 0, 118, 'frame_steel.png'),
(2652, 'CFK', 200, 4, 7, 0, 1039, 0, 118, 'handle_cfk.png'),
(2651, 'Aluminum', 60, 3, 5, 0, 1039, 0, 118, 'handle_aluminum.png'),
(2650, 'Steel', 40, 2, 3, 0, 1039, 0, 118, 'handle_steel.png'),
(2649, 'Design', 75, 0, 5, 2, 1038, 0, 118, 'seat_design.png'),
(2648, 'Leather', 50, 0, 3, 1, 1038, 0, 118, 'seat_leather.png'),
(2647, 'Plastic', 30, 0, 2, 1, 1038, 0, 118, 'seat_plastic.png'),
(2646, 'Lithium-ion', 1000, 10, 0, 8, 1037, 0, 118, 'accumulator_ion.png'),
(2645, 'Lithium polymer', 600, 7, 0, 5, 1037, 0, 118, 'accumulator_lithium_poli.png'),
(2644, 'Lead-acid', 300, 5, 0, 3, 1037, 0, 118, 'accumulator_acid.png'),
(2643, 'Pneumatic', 170, 0, 1, 5, 1036, 0, 118, 'absorber_Pneumatic.png'),
(2642, 'Coil spring', 105, 0, 0, 2, 1036, 0, 118, 'absorber_spring.png'),
(2641, 'Disc brake', 200, 0, 1, 5, 1035, 0, 118, 'brake_disc.png'),
(2640, 'Drum brake', 100, 0, 0, 2, 1035, 0, 118, 'brake_drum.png'),
(2639, 'Aluminum design', 230, 1, 5, 2, 1034, 0, 118, 'wheel_aluminum_design.png'),
(2638, 'Aluminum', 100, 1, 3, 2, 1034, 0, 118, 'wheel_aluminum.png'),
(2637, 'Steel', 60, 0, 1, 3, 1034, 0, 118, 'wheel_steel.png'),
(2636, 'Xenon ellipsoid', 155, 2, 5, 0, 1033, 0, 118, 'light_xenon.png'),
(2635, '2x 20W Halogen R', 45, 2, 4, 0, 1033, 0, 118, 'light_20w_halogen.png'),
(2634, '2x 55W Halogen', 20, 1, 3, 0, 1033, 0, 118, 'light_55w_halogen.png'),
(2633, '4 KW', 600, 7, 0, 9, 1032, 0, 118, 'motor_4kw.png'),
(2632, '2 KW', 300, 8, 0, 7, 1032, 0, 118, 'motor_2kw.png'),
(2631, '1 KW', 200, 9, 0, 4, 1032, 0, 118, 'motor_1kw.png'),
(2630, 'CFK', 400, 8, 8, 6, 1031, 0, 118, 'casing_cfk.png'),
(2629, 'Aluminum', 300, 3, 4, 4, 1031, 0, 118, 'casing_aluminum.png'),
(2628, 'Plastic', 200, 1, 2, 2, 1031, 0, 118, 'casing_plastic.png'),
(2627, 'CFK', 1200, 4, 7, 3, 1030, 0, 118, 'frame_cfk.png'),
(2626, 'Aluminum', 350, 4, 5, 2, 1030, 0, 118, 'frame_aluminum.png'),
(2625, 'Steel', 200, 2, 3, 1, 1030, 0, 118, 'frame_steel.png'),
(2624, 'CFK', 200, 4, 7, 0, 1029, 0, 118, 'handle_cfk.png'),
(2623, 'Aluminum', 60, 3, 5, 0, 1029, 0, 118, 'handle_aluminum.png'),
(2622, 'Steel', 40, 2, 3, 0, 1029, 0, 118, 'handle_steel.png'),
(2621, 'Design', 75, 0, 5, 2, 1028, 0, 118, 'seat_design.png'),
(2620, 'Leather', 50, 0, 3, 1, 1028, 0, 118, 'seat_leather.png'),
(2619, 'Plastic', 30, 0, 2, 1, 1028, 0, 118, 'seat_plastic.png'),
(2592, 'Leather', 50, 0, 3, 1, 1018, 0, 117, 'seat_leather.png'),
(2591, 'Plastic', 30, 0, 2, 1, 1018, 0, 117, 'seat_plastic.png'),
(2590, 'Lithium-ion', 1000, 10, 0, 8, 1017, 0, 117, 'accumulator_ion.png'),
(2589, 'Lithium polymer', 600, 7, 0, 5, 1017, 0, 117, 'accumulator_lithium_poli.png'),
(2588, 'Lead-acid', 300, 5, 0, 3, 1017, 0, 117, 'accumulator_acid.png'),
(2587, 'Pneumatic', 170, 0, 1, 5, 1016, 0, 117, 'absorber_Pneumatic.png'),
(2586, 'Coil spring', 105, 0, 0, 2, 1016, 0, 117, 'absorber_spring.png'),
(2585, 'Disc brake', 200, 0, 1, 5, 1015, 0, 117, 'brake_disc.png'),
(2584, 'Drum brake', 100, 0, 0, 2, 1015, 0, 117, 'brake_drum.png'),
(2583, 'Aluminum design', 230, 1, 5, 2, 1014, 0, 117, 'wheel_aluminum_design.png'),
(2582, 'Aluminum', 100, 1, 3, 2, 1014, 0, 117, 'wheel_aluminum.png'),
(2581, 'Steel', 60, 0, 1, 3, 1014, 0, 117, 'wheel_steel.png'),
(2580, 'Xenon ellipsoid', 155, 2, 5, 0, 1013, 0, 117, 'light_xenon.png'),
(2579, '2x 20W Halogen R', 45, 2, 4, 0, 1013, 0, 117, 'light_20w_halogen.png'),
(2578, '2x 55W Halogen', 20, 1, 3, 0, 1013, 0, 117, 'light_55w_halogen.png'),
(2577, '4 KW', 600, 7, 0, 9, 1012, 0, 117, 'motor_4kw.png'),
(2576, '2 KW', 300, 8, 0, 7, 1012, 0, 117, 'motor_2kw.png'),
(2575, '1 KW', 200, 9, 0, 4, 1012, 0, 117, 'motor_1kw.png'),
(2574, 'CFK', 400, 8, 8, 6, 1011, 0, 117, 'casing_cfk.png'),
(2573, 'Aluminum', 300, 3, 4, 4, 1011, 0, 117, 'casing_aluminum.png'),
(2572, 'Plastic', 200, 1, 2, 2, 1011, 0, 117, 'casing_plastic.png'),
(2571, 'CFK', 1200, 4, 7, 3, 1010, 0, 117, 'frame_cfk.png'),
(2570, 'Aluminum', 350, 4, 5, 2, 1010, 0, 117, 'frame_aluminum.png'),
(2569, 'Steel', 200, 2, 3, 1, 1010, 0, 117, 'frame_steel.png'),
(2568, 'CFK', 200, 4, 7, 0, 1009, 0, 117, 'handle_cfk.png'),
(2567, 'Aluminum', 60, 3, 5, 0, 1009, 0, 117, 'handle_aluminum.png'),
(2566, 'Steel', 40, 2, 3, 0, 1009, 0, 117, 'handle_steel.png'),
(2565, 'Design', 75, 0, 5, 2, 1008, 0, 117, 'seat_design.png'),
(2564, 'Leather', 50, 0, 3, 1, 1008, 0, 117, 'seat_leather.png'),
(2563, 'Plastic', 30, 0, 2, 1, 1008, 0, 117, 'seat_plastic.png');
INSERT INTO `tbl_component_materials` (`id`, `name`, `cost`, `range`, `design`, `reliability`, `component_id`, `allowance_id`, `team_id`, `image`) VALUES
(2562, 'Lithium-ion', 1000, 10, 0, 8, 1007, 0, 117, 'accumulator_ion.png'),
(2561, 'Lithium polymer', 600, 7, 0, 5, 1007, 0, 117, 'accumulator_lithium_poli.png'),
(2560, 'Lead-acid', 300, 5, 0, 3, 1007, 0, 117, 'accumulator_acid.png'),
(2559, 'Pneumatic', 170, 0, 1, 5, 1006, 0, 117, 'absorber_Pneumatic.png'),
(2558, 'Coil spring', 105, 0, 0, 2, 1006, 0, 117, 'absorber_spring.png'),
(2557, 'Disc brake', 200, 0, 1, 5, 1005, 0, 117, 'brake_disc.png'),
(2556, 'Drum brake', 100, 0, 0, 2, 1005, 0, 117, 'brake_drum.png'),
(2555, 'Aluminum design', 230, 1, 5, 2, 1004, 0, 117, 'wheel_aluminum_design.png'),
(2554, 'Aluminum', 100, 1, 3, 2, 1004, 0, 117, 'wheel_aluminum.png'),
(2553, 'Steel', 60, 0, 1, 3, 1004, 0, 117, 'wheel_steel.png'),
(2552, 'Xenon ellipsoid', 155, 2, 5, 0, 1003, 0, 117, 'light_xenon.png'),
(2551, '2x 20W Halogen R', 45, 2, 4, 0, 1003, 0, 117, 'light_20w_halogen.png'),
(2550, '2x 55W Halogen', 20, 1, 3, 0, 1003, 0, 117, 'light_55w_halogen.png'),
(2549, '4 KW', 600, 7, 0, 9, 1002, 0, 117, 'motor_4kw.png'),
(2548, '2 KW', 300, 8, 0, 7, 1002, 0, 117, 'motor_2kw.png'),
(2547, '1 KW', 200, 9, 0, 4, 1002, 0, 117, 'motor_1kw.png'),
(2546, 'CFK', 400, 8, 8, 6, 1001, 0, 117, 'casing_cfk.png'),
(2545, 'Aluminum', 300, 3, 4, 4, 1001, 0, 117, 'casing_aluminum.png'),
(2544, 'Plastic', 200, 1, 2, 2, 1001, 0, 117, 'casing_plastic.png'),
(2543, 'CFK', 1200, 4, 7, 3, 1000, 0, 117, 'frame_cfk.png'),
(2542, 'Aluminum', 350, 4, 5, 2, 1000, 0, 117, 'frame_aluminum.png'),
(2541, 'Steel', 200, 2, 3, 1, 1000, 0, 117, 'frame_steel.png'),
(2540, 'CFK', 200, 4, 7, 0, 999, 0, 117, 'handle_cfk.png'),
(2539, 'Aluminum', 60, 3, 5, 0, 999, 0, 117, 'handle_aluminum.png'),
(2538, 'Steel', 40, 2, 3, 0, 999, 0, 117, 'handle_steel.png'),
(2537, 'Design', 75, 0, 5, 2, 998, 0, 117, 'seat_design.png'),
(2536, 'Leather', 50, 0, 3, 1, 998, 0, 117, 'seat_leather.png'),
(2535, 'Plastic', 30, 0, 2, 1, 998, 0, 117, 'seat_plastic.png'),
(2534, 'Lithium-ion', 1000, 10, 0, 8, 997, 0, 117, 'accumulator_ion.png'),
(2533, 'Lithium polymer', 600, 7, 0, 5, 997, 0, 117, 'accumulator_lithium_poli.png'),
(2532, 'Lead-acid', 300, 5, 0, 3, 997, 0, 117, 'accumulator_acid.png'),
(2531, 'Pneumatic', 170, 0, 1, 5, 996, 0, 117, 'absorber_Pneumatic.png'),
(2530, 'Coil spring', 105, 0, 0, 2, 996, 0, 117, 'absorber_spring.png'),
(2529, 'Disc brake', 200, 0, 1, 5, 995, 0, 117, 'brake_disc.png'),
(2528, 'Drum brake', 100, 0, 0, 2, 995, 0, 117, 'brake_drum.png'),
(2527, 'Aluminum design', 230, 1, 5, 2, 994, 0, 117, 'wheel_aluminum_design.png'),
(2526, 'Aluminum', 100, 1, 3, 2, 994, 0, 117, 'wheel_aluminum.png'),
(2525, 'Steel', 60, 0, 1, 3, 994, 0, 117, 'wheel_steel.png'),
(2524, 'Xenon ellipsoid', 155, 2, 5, 0, 993, 0, 117, 'light_xenon.png'),
(2523, '2x 20W Halogen R', 45, 2, 4, 0, 993, 0, 117, 'light_20w_halogen.png'),
(2522, '2x 55W Halogen', 20, 1, 3, 0, 993, 0, 117, 'light_55w_halogen.png'),
(2521, '4 KW', 600, 7, 0, 9, 992, 0, 117, 'motor_4kw.png'),
(2520, '2 KW', 300, 8, 0, 7, 992, 0, 117, 'motor_2kw.png'),
(2519, '1 KW', 200, 9, 0, 4, 992, 0, 117, 'motor_1kw.png'),
(2518, 'CFK', 400, 8, 8, 6, 991, 0, 117, 'casing_cfk.png'),
(2517, 'Aluminum', 300, 3, 4, 4, 991, 0, 117, 'casing_aluminum.png'),
(2516, 'Plastic', 200, 1, 2, 2, 991, 0, 117, 'casing_plastic.png'),
(2515, 'CFK', 1200, 4, 7, 3, 990, 0, 117, 'frame_cfk.png'),
(2514, 'Aluminum', 350, 4, 5, 2, 990, 0, 117, 'frame_aluminum.png'),
(2513, 'Steel', 200, 2, 3, 1, 990, 0, 117, 'frame_steel.png'),
(2512, 'CFK', 200, 4, 7, 0, 989, 0, 117, 'handle_cfk.png'),
(2511, 'Aluminum', 60, 3, 5, 0, 989, 0, 117, 'handle_aluminum.png'),
(2510, 'Steel', 40, 2, 3, 0, 989, 0, 117, 'handle_steel.png'),
(2509, 'Design', 75, 0, 5, 2, 988, 0, 117, 'seat_design.png'),
(2508, 'Leather', 50, 0, 3, 1, 988, 0, 117, 'seat_leather.png'),
(2507, 'Plastic', 30, 0, 2, 1, 988, 0, 117, 'seat_plastic.png'),
(2283, 'Plastic', 30, 0, 2, 1, 908, 0, 115, 'seat_plastic.png'),
(2284, 'Leather', 50, 0, 3, 1, 908, 0, 115, 'seat_leather.png'),
(2285, 'Design', 75, 0, 5, 2, 908, 0, 115, 'seat_design.png'),
(2286, 'Steel', 40, 2, 3, 0, 909, 0, 115, 'handle_steel.png'),
(2287, 'Aluminum', 60, 3, 5, 0, 909, 0, 115, 'handle_aluminum.png'),
(2288, 'CFK', 200, 4, 7, 0, 909, 0, 115, 'handle_cfk.png'),
(2289, 'Steel', 200, 2, 3, 1, 910, 0, 115, 'frame_steel.png'),
(2290, 'Aluminum', 350, 4, 5, 2, 910, 0, 115, 'frame_aluminum.png'),
(2291, 'CFK', 1200, 4, 7, 3, 910, 0, 115, 'frame_cfk.png'),
(2292, 'Plastic', 200, 1, 2, 2, 911, 0, 115, 'casing_plastic.png'),
(2293, 'Aluminum', 300, 3, 4, 4, 911, 0, 115, 'casing_aluminum.png'),
(2294, 'CFK', 400, 8, 8, 6, 911, 0, 115, 'casing_cfk.png'),
(2295, '1 KW', 200, 9, 0, 4, 912, 0, 115, 'motor_1kw.png'),
(2296, '2 KW', 300, 8, 0, 7, 912, 0, 115, 'motor_2kw.png'),
(2297, '4 KW', 600, 7, 0, 9, 912, 0, 115, 'motor_4kw.png'),
(2298, '2x 55W Halogen', 20, 1, 3, 0, 913, 0, 115, 'light_55w_halogen.png'),
(2299, '2x 20W Halogen R', 45, 2, 4, 0, 913, 0, 115, 'light_20w_halogen.png'),
(2300, 'Xenon ellipsoid', 155, 2, 5, 0, 913, 0, 115, 'light_xenon.png'),
(2301, 'Steel', 60, 0, 1, 3, 914, 0, 115, 'wheel_steel.png'),
(2302, 'Aluminum', 100, 1, 3, 2, 914, 0, 115, 'wheel_aluminum.png'),
(2303, 'Aluminum design', 230, 1, 5, 2, 914, 0, 115, 'wheel_aluminum_design.png'),
(2304, 'Drum brake', 100, 0, 0, 2, 915, 0, 115, 'brake_drum.png'),
(2305, 'Disc brake', 200, 0, 1, 5, 915, 0, 115, 'brake_disc.png'),
(2306, 'Coil spring', 105, 0, 0, 2, 916, 0, 115, 'absorber_spring.png'),
(2307, 'Pneumatic', 170, 0, 1, 5, 916, 0, 115, 'absorber_Pneumatic.png'),
(2308, 'Lead-acid', 300, 5, 0, 3, 917, 0, 115, 'accumulator_acid.png'),
(2309, 'Lithium polymer', 600, 7, 0, 5, 917, 0, 115, 'accumulator_lithium_poli.png'),
(2310, 'Lithium-ion', 1000, 10, 0, 8, 917, 0, 115, 'accumulator_ion.png'),
(2311, 'Plastic', 30, 0, 2, 1, 918, 0, 115, 'seat_plastic.png'),
(2312, 'Leather', 50, 0, 3, 1, 918, 0, 115, 'seat_leather.png'),
(2313, 'Design', 75, 0, 5, 2, 918, 0, 115, 'seat_design.png'),
(2314, 'Steel', 40, 2, 3, 0, 919, 0, 115, 'handle_steel.png'),
(2315, 'Aluminum', 60, 3, 5, 0, 919, 0, 115, 'handle_aluminum.png'),
(2316, 'CFK', 200, 4, 7, 0, 919, 0, 115, 'handle_cfk.png'),
(2317, 'Steel', 200, 2, 3, 1, 920, 0, 115, 'frame_steel.png'),
(2318, 'Aluminum', 350, 4, 5, 2, 920, 0, 115, 'frame_aluminum.png'),
(2319, 'CFK', 1200, 4, 7, 3, 920, 0, 115, 'frame_cfk.png'),
(2320, 'Plastic', 200, 1, 2, 2, 921, 0, 115, 'casing_plastic.png'),
(2321, 'Aluminum', 300, 3, 4, 4, 921, 0, 115, 'casing_aluminum.png'),
(2322, 'CFK', 400, 8, 8, 6, 921, 0, 115, 'casing_cfk.png'),
(2323, '1 KW', 200, 9, 0, 4, 922, 0, 115, 'motor_1kw.png'),
(2324, '2 KW', 300, 8, 0, 7, 922, 0, 115, 'motor_2kw.png'),
(2325, '4 KW', 600, 7, 0, 9, 922, 0, 115, 'motor_4kw.png'),
(2326, '2x 55W Halogen', 20, 1, 3, 0, 923, 0, 115, 'light_55w_halogen.png'),
(2327, '2x 20W Halogen R', 45, 2, 4, 0, 923, 0, 115, 'light_20w_halogen.png'),
(2328, 'Xenon ellipsoid', 155, 2, 5, 0, 923, 0, 115, 'light_xenon.png'),
(2329, 'Steel', 60, 0, 1, 3, 924, 0, 115, 'wheel_steel.png'),
(2330, 'Aluminum', 100, 1, 3, 2, 924, 0, 115, 'wheel_aluminum.png'),
(2331, 'Aluminum design', 230, 1, 5, 2, 924, 0, 115, 'wheel_aluminum_design.png'),
(2332, 'Drum brake', 100, 0, 0, 2, 925, 0, 115, 'brake_drum.png'),
(2333, 'Disc brake', 200, 0, 1, 5, 925, 0, 115, 'brake_disc.png'),
(2334, 'Coil spring', 105, 0, 0, 2, 926, 0, 115, 'absorber_spring.png'),
(2335, 'Pneumatic', 170, 0, 1, 5, 926, 0, 115, 'absorber_Pneumatic.png'),
(2336, 'Lead-acid', 300, 5, 0, 3, 927, 0, 115, 'accumulator_acid.png'),
(2337, 'Lithium polymer', 600, 7, 0, 5, 927, 0, 115, 'accumulator_lithium_poli.png'),
(2338, 'Lithium-ion', 1000, 10, 0, 8, 927, 0, 115, 'accumulator_ion.png'),
(2339, 'Plastic', 30, 0, 2, 1, 928, 0, 115, 'seat_plastic.png'),
(2340, 'Leather', 50, 0, 3, 1, 928, 0, 115, 'seat_leather.png'),
(2341, 'Design', 75, 0, 5, 2, 928, 0, 115, 'seat_design.png'),
(2342, 'Steel', 40, 2, 3, 0, 929, 0, 115, 'handle_steel.png'),
(2343, 'Aluminum', 60, 3, 5, 0, 929, 0, 115, 'handle_aluminum.png'),
(2344, 'CFK', 200, 4, 7, 0, 929, 0, 115, 'handle_cfk.png'),
(2345, 'Steel', 200, 2, 3, 1, 930, 0, 115, 'frame_steel.png'),
(2346, 'Aluminum', 350, 4, 5, 2, 930, 0, 115, 'frame_aluminum.png'),
(2347, 'CFK', 1200, 4, 7, 3, 930, 0, 115, 'frame_cfk.png'),
(2348, 'Plastic', 200, 1, 2, 2, 931, 0, 115, 'casing_plastic.png'),
(2349, 'Aluminum', 300, 3, 4, 4, 931, 0, 115, 'casing_aluminum.png'),
(2350, 'CFK', 400, 8, 8, 6, 931, 0, 115, 'casing_cfk.png'),
(2351, '1 KW', 200, 9, 0, 4, 932, 0, 115, 'motor_1kw.png'),
(2352, '2 KW', 300, 8, 0, 7, 932, 0, 115, 'motor_2kw.png'),
(2353, '4 KW', 600, 7, 0, 9, 932, 0, 115, 'motor_4kw.png'),
(2354, '2x 55W Halogen', 20, 1, 3, 0, 933, 0, 115, 'light_55w_halogen.png'),
(2355, '2x 20W Halogen R', 45, 2, 4, 0, 933, 0, 115, 'light_20w_halogen.png'),
(2356, 'Xenon ellipsoid', 155, 2, 5, 0, 933, 0, 115, 'light_xenon.png'),
(2357, 'Steel', 60, 0, 1, 3, 934, 0, 115, 'wheel_steel.png'),
(2358, 'Aluminum', 100, 1, 3, 2, 934, 0, 115, 'wheel_aluminum.png'),
(2359, 'Aluminum design', 230, 1, 5, 2, 934, 0, 115, 'wheel_aluminum_design.png'),
(2360, 'Drum brake', 100, 0, 0, 2, 935, 0, 115, 'brake_drum.png'),
(2361, 'Disc brake', 200, 0, 1, 5, 935, 0, 115, 'brake_disc.png'),
(2362, 'Coil spring', 105, 0, 0, 2, 936, 0, 115, 'absorber_spring.png'),
(2363, 'Pneumatic', 170, 0, 1, 5, 936, 0, 115, 'absorber_Pneumatic.png'),
(2364, 'Lead-acid', 300, 5, 0, 3, 937, 0, 115, 'accumulator_acid.png'),
(2365, 'Lithium polymer', 600, 7, 0, 5, 937, 0, 115, 'accumulator_lithium_poli.png'),
(2366, 'Lithium-ion', 1000, 10, 0, 8, 937, 0, 115, 'accumulator_ion.png'),
(2367, 'Plastic', 30, 0, 2, 1, 938, 0, 115, 'seat_plastic.png'),
(2368, 'Leather', 50, 0, 3, 1, 938, 0, 115, 'seat_leather.png'),
(2369, 'Design', 75, 0, 5, 2, 938, 0, 115, 'seat_design.png'),
(2370, 'Steel', 40, 2, 3, 0, 939, 0, 115, 'handle_steel.png'),
(2371, 'Aluminum', 60, 3, 5, 0, 939, 0, 115, 'handle_aluminum.png'),
(2372, 'CFK', 200, 4, 7, 0, 939, 0, 115, 'handle_cfk.png'),
(2373, 'Steel', 200, 2, 3, 1, 940, 0, 115, 'frame_steel.png'),
(2374, 'Aluminum', 350, 4, 5, 2, 940, 0, 115, 'frame_aluminum.png'),
(2375, 'CFK', 1200, 4, 7, 3, 940, 0, 115, 'frame_cfk.png'),
(2376, 'Plastic', 200, 1, 2, 2, 941, 0, 115, 'casing_plastic.png'),
(2377, 'Aluminum', 300, 3, 4, 4, 941, 0, 115, 'casing_aluminum.png'),
(2378, 'CFK', 400, 8, 8, 6, 941, 0, 115, 'casing_cfk.png'),
(2379, '1 KW', 200, 9, 0, 4, 942, 0, 115, 'motor_1kw.png'),
(2380, '2 KW', 300, 8, 0, 7, 942, 0, 115, 'motor_2kw.png'),
(2381, '4 KW', 600, 7, 0, 9, 942, 0, 115, 'motor_4kw.png'),
(2382, '2x 55W Halogen', 20, 1, 3, 0, 943, 0, 115, 'light_55w_halogen.png'),
(2383, '2x 20W Halogen R', 45, 2, 4, 0, 943, 0, 115, 'light_20w_halogen.png'),
(2384, 'Xenon ellipsoid', 155, 2, 5, 0, 943, 0, 115, 'light_xenon.png'),
(2385, 'Steel', 60, 0, 1, 3, 944, 0, 115, 'wheel_steel.png'),
(2386, 'Aluminum', 100, 1, 3, 2, 944, 0, 115, 'wheel_aluminum.png'),
(2387, 'Aluminum design', 230, 1, 5, 2, 944, 0, 115, 'wheel_aluminum_design.png'),
(2388, 'Drum brake', 100, 0, 0, 2, 945, 0, 115, 'brake_drum.png'),
(2389, 'Disc brake', 200, 0, 1, 5, 945, 0, 115, 'brake_disc.png'),
(2390, 'Coil spring', 105, 0, 0, 2, 946, 0, 115, 'absorber_spring.png'),
(2391, 'Pneumatic', 170, 0, 1, 5, 946, 0, 115, 'absorber_Pneumatic.png'),
(2392, 'Lead-acid', 300, 5, 0, 3, 947, 0, 115, 'accumulator_acid.png'),
(2393, 'Lithium polymer', 600, 7, 0, 5, 947, 0, 115, 'accumulator_lithium_poli.png'),
(2394, 'Lithium-ion', 1000, 10, 0, 8, 947, 0, 115, 'accumulator_ion.png'),
(2481, 'Design', 75, 0, 5, 2, 978, 0, 116, 'seat_design.png'),
(2482, 'Steel', 40, 2, 3, 0, 979, 0, 116, 'handle_steel.png'),
(2483, 'Aluminum', 60, 3, 5, 0, 979, 0, 116, 'handle_aluminum.png'),
(2484, 'CFK', 200, 4, 7, 0, 979, 0, 116, 'handle_cfk.png'),
(2485, 'Steel', 200, 2, 3, 1, 980, 0, 116, 'frame_steel.png'),
(2486, 'Aluminum', 350, 4, 5, 2, 980, 0, 116, 'frame_aluminum.png'),
(2487, 'CFK', 1200, 4, 7, 3, 980, 0, 116, 'frame_cfk.png'),
(2488, 'Plastic', 200, 1, 2, 2, 981, 0, 116, 'casing_plastic.png'),
(2489, 'Aluminum', 300, 3, 4, 4, 981, 0, 116, 'casing_aluminum.png'),
(2490, 'CFK', 400, 8, 8, 6, 981, 0, 116, 'casing_cfk.png'),
(2491, '1 KW', 200, 9, 0, 4, 982, 0, 116, 'motor_1kw.png'),
(2492, '2 KW', 300, 8, 0, 7, 982, 0, 116, 'motor_2kw.png'),
(2493, '4 KW', 600, 7, 0, 9, 982, 0, 116, 'motor_4kw.png'),
(2494, '2x 55W Halogen', 20, 1, 3, 0, 983, 0, 116, 'light_55w_halogen.png'),
(2495, '2x 20W Halogen R', 45, 2, 4, 0, 983, 0, 116, 'light_20w_halogen.png'),
(2496, 'Xenon ellipsoid', 155, 2, 5, 0, 983, 0, 116, 'light_xenon.png'),
(2497, 'Steel', 60, 0, 1, 3, 984, 0, 116, 'wheel_steel.png'),
(2498, 'Aluminum', 100, 1, 3, 2, 984, 0, 116, 'wheel_aluminum.png'),
(2499, 'Aluminum design', 230, 1, 5, 2, 984, 0, 116, 'wheel_aluminum_design.png'),
(2500, 'Drum brake', 100, 0, 0, 2, 985, 0, 116, 'brake_drum.png'),
(2501, 'Disc brake', 200, 0, 1, 5, 985, 0, 116, 'brake_disc.png'),
(2502, 'Coil spring', 105, 0, 0, 2, 986, 0, 116, 'absorber_spring.png'),
(2503, 'Pneumatic', 170, 0, 1, 5, 986, 0, 116, 'absorber_Pneumatic.png'),
(2504, 'Lead-acid', 300, 5, 0, 3, 987, 0, 116, 'accumulator_acid.png'),
(2505, 'Lithium polymer', 600, 7, 0, 5, 987, 0, 116, 'accumulator_lithium_poli.png'),
(2506, 'Lithium-ion', 1000, 10, 0, 8, 987, 0, 116, 'accumulator_ion.png'),
(2593, 'Design', 75, 0, 5, 2, 1018, 0, 117, 'seat_design.png'),
(2594, 'Steel', 40, 2, 3, 0, 1019, 0, 117, 'handle_steel.png'),
(2595, 'Aluminum', 60, 3, 5, 0, 1019, 0, 117, 'handle_aluminum.png'),
(2596, 'CFK', 200, 4, 7, 0, 1019, 0, 117, 'handle_cfk.png'),
(2597, 'Steel', 200, 2, 3, 1, 1020, 0, 117, 'frame_steel.png'),
(2598, 'Aluminum', 350, 4, 5, 2, 1020, 0, 117, 'frame_aluminum.png'),
(2599, 'CFK', 1200, 4, 7, 3, 1020, 0, 117, 'frame_cfk.png'),
(2600, 'Plastic', 200, 1, 2, 2, 1021, 0, 117, 'casing_plastic.png'),
(2601, 'Aluminum', 300, 3, 4, 4, 1021, 0, 117, 'casing_aluminum.png'),
(2602, 'CFK', 400, 8, 8, 6, 1021, 0, 117, 'casing_cfk.png'),
(2603, '1 KW', 200, 9, 0, 4, 1022, 0, 117, 'motor_1kw.png'),
(2604, '2 KW', 300, 8, 0, 7, 1022, 0, 117, 'motor_2kw.png'),
(2605, '4 KW', 600, 7, 0, 9, 1022, 0, 117, 'motor_4kw.png'),
(2606, '2x 55W Halogen', 20, 1, 3, 0, 1023, 0, 117, 'light_55w_halogen.png'),
(2607, '2x 20W Halogen R', 45, 2, 4, 0, 1023, 0, 117, 'light_20w_halogen.png'),
(2608, 'Xenon ellipsoid', 155, 2, 5, 0, 1023, 0, 117, 'light_xenon.png'),
(2609, 'Steel', 60, 0, 1, 3, 1024, 0, 117, 'wheel_steel.png'),
(2610, 'Aluminum', 100, 1, 3, 2, 1024, 0, 117, 'wheel_aluminum.png'),
(2611, 'Aluminum design', 230, 1, 5, 2, 1024, 0, 117, 'wheel_aluminum_design.png'),
(2612, 'Drum brake', 100, 0, 0, 2, 1025, 0, 117, 'brake_drum.png'),
(2613, 'Disc brake', 200, 0, 1, 5, 1025, 0, 117, 'brake_disc.png'),
(2614, 'Coil spring', 105, 0, 0, 2, 1026, 0, 117, 'absorber_spring.png'),
(2615, 'Pneumatic', 170, 0, 1, 5, 1026, 0, 117, 'absorber_Pneumatic.png'),
(2616, 'Lead-acid', 300, 5, 0, 3, 1027, 0, 117, 'accumulator_acid.png'),
(2617, 'Lithium polymer', 600, 7, 0, 5, 1027, 0, 117, 'accumulator_lithium_poli.png'),
(2618, 'Lithium-ion', 1000, 10, 0, 8, 1027, 0, 117, 'accumulator_ion.png'),
(2705, 'Design', 75, 0, 5, 2, 1058, 0, 118, 'seat_design.png'),
(2706, 'Steel', 40, 2, 3, 0, 1059, 0, 118, 'handle_steel.png'),
(2707, 'Aluminum', 60, 3, 5, 0, 1059, 0, 118, 'handle_aluminum.png'),
(2708, 'CFK', 200, 4, 7, 0, 1059, 0, 118, 'handle_cfk.png'),
(2709, 'Steel', 200, 2, 3, 1, 1060, 0, 118, 'frame_steel.png'),
(2710, 'Aluminum', 350, 4, 5, 2, 1060, 0, 118, 'frame_aluminum.png'),
(2711, 'CFK', 1200, 4, 7, 3, 1060, 0, 118, 'frame_cfk.png'),
(2712, 'Plastic', 200, 1, 2, 2, 1061, 0, 118, 'casing_plastic.png'),
(2713, 'Aluminum', 300, 3, 4, 4, 1061, 0, 118, 'casing_aluminum.png'),
(2714, 'CFK', 400, 8, 8, 6, 1061, 0, 118, 'casing_cfk.png'),
(2715, '1 KW', 200, 9, 0, 4, 1062, 0, 118, 'motor_1kw.png'),
(2716, '2 KW', 300, 8, 0, 7, 1062, 0, 118, 'motor_2kw.png'),
(2717, '4 KW', 600, 7, 0, 9, 1062, 0, 118, 'motor_4kw.png'),
(2718, '2x 55W Halogen', 20, 1, 3, 0, 1063, 0, 118, 'light_55w_halogen.png'),
(2719, '2x 20W Halogen R', 45, 2, 4, 0, 1063, 0, 118, 'light_20w_halogen.png'),
(2720, 'Xenon ellipsoid', 155, 2, 5, 0, 1063, 0, 118, 'light_xenon.png'),
(2721, 'Steel', 60, 0, 1, 3, 1064, 0, 118, 'wheel_steel.png'),
(2722, 'Aluminum', 100, 1, 3, 2, 1064, 0, 118, 'wheel_aluminum.png'),
(2723, 'Aluminum design', 230, 1, 5, 2, 1064, 0, 118, 'wheel_aluminum_design.png'),
(2724, 'Drum brake', 100, 0, 0, 2, 1065, 0, 118, 'brake_drum.png'),
(2725, 'Disc brake', 200, 0, 1, 5, 1065, 0, 118, 'brake_disc.png'),
(2726, 'Coil spring', 105, 0, 0, 2, 1066, 0, 118, 'absorber_spring.png'),
(2727, 'Pneumatic', 170, 0, 1, 5, 1066, 0, 118, 'absorber_Pneumatic.png'),
(2728, 'Lead-acid', 300, 5, 0, 3, 1067, 0, 118, 'accumulator_acid.png'),
(2729, 'Lithium polymer', 600, 7, 0, 5, 1067, 0, 118, 'accumulator_lithium_poli.png'),
(2730, 'Lithium-ion', 1000, 10, 0, 8, 1067, 0, 118, 'accumulator_ion.png'),
(2731, 'Plastic', 30, 0, 2, 1, 1068, 0, 119, 'seat_plastic.png'),
(2732, 'Leather', 50, 0, 3, 1, 1068, 0, 119, 'seat_leather.png'),
(2733, 'Design', 75, 0, 5, 2, 1068, 0, 119, 'seat_design.png'),
(2734, 'Steel', 40, 2, 3, 0, 1069, 0, 119, 'handle_steel.png'),
(2735, 'Aluminum', 60, 3, 5, 0, 1069, 0, 119, 'handle_aluminum.png'),
(2736, 'CFK', 200, 4, 7, 0, 1069, 0, 119, 'handle_cfk.png'),
(2737, 'Steel', 200, 2, 3, 1, 1070, 0, 119, 'frame_steel.png'),
(2738, 'Aluminum', 350, 4, 5, 2, 1070, 0, 119, 'frame_aluminum.png'),
(2739, 'CFK', 1200, 4, 7, 3, 1070, 0, 119, 'frame_cfk.png'),
(2740, 'Plastic', 200, 1, 2, 2, 1071, 0, 119, 'casing_plastic.png'),
(2741, 'Aluminum', 300, 3, 4, 4, 1071, 0, 119, 'casing_aluminum.png'),
(2742, 'CFK', 400, 8, 8, 6, 1071, 0, 119, 'casing_cfk.png'),
(2743, '1 KW', 200, 9, 0, 4, 1072, 0, 119, 'motor_1kw.png'),
(2744, '2 KW', 300, 8, 0, 7, 1072, 0, 119, 'motor_2kw.png'),
(2745, '4 KW', 600, 7, 0, 9, 1072, 0, 119, 'motor_4kw.png'),
(2746, '2x 55W Halogen', 20, 1, 3, 0, 1073, 0, 119, 'light_55w_halogen.png'),
(2747, '2x 20W Halogen R', 45, 2, 4, 0, 1073, 0, 119, 'light_20w_halogen.png'),
(2748, 'Xenon ellipsoid', 155, 2, 5, 0, 1073, 0, 119, 'light_xenon.png'),
(2749, 'Steel', 60, 0, 1, 3, 1074, 0, 119, 'wheel_steel.png'),
(2750, 'Aluminum', 100, 1, 3, 2, 1074, 0, 119, 'wheel_aluminum.png'),
(2751, 'Aluminum design', 230, 1, 5, 2, 1074, 0, 119, 'wheel_aluminum_design.png'),
(2752, 'Drum brake', 100, 0, 0, 2, 1075, 0, 119, 'brake_drum.png'),
(2753, 'Disc brake', 200, 0, 1, 5, 1075, 0, 119, 'brake_disc.png'),
(2754, 'Coil spring', 105, 0, 0, 2, 1076, 0, 119, 'absorber_spring.png'),
(2755, 'Pneumatic', 170, 0, 1, 5, 1076, 0, 119, 'absorber_Pneumatic.png'),
(2756, 'Lead-acid', 300, 5, 0, 3, 1077, 0, 119, 'accumulator_acid.png'),
(2757, 'Lithium polymer', 600, 7, 0, 5, 1077, 0, 119, 'accumulator_lithium_poli.png'),
(2758, 'Lithium-ion', 1000, 10, 0, 8, 1077, 0, 119, 'accumulator_ion.png'),
(2759, 'Plastic', 30, 0, 2, 1, 1078, 0, 119, 'seat_plastic.png'),
(2760, 'Leather', 50, 0, 3, 1, 1078, 0, 119, 'seat_leather.png'),
(2761, 'Design', 75, 0, 5, 2, 1078, 0, 119, 'seat_design.png'),
(2762, 'Steel', 40, 2, 3, 0, 1079, 0, 119, 'handle_steel.png'),
(2763, 'Aluminum', 60, 3, 5, 0, 1079, 0, 119, 'handle_aluminum.png'),
(2764, 'CFK', 200, 4, 7, 0, 1079, 0, 119, 'handle_cfk.png'),
(2765, 'Steel', 200, 2, 3, 1, 1080, 0, 119, 'frame_steel.png'),
(2766, 'Aluminum', 350, 4, 5, 2, 1080, 0, 119, 'frame_aluminum.png'),
(2767, 'CFK', 1200, 4, 7, 3, 1080, 0, 119, 'frame_cfk.png'),
(2768, 'Plastic', 200, 1, 2, 2, 1081, 0, 119, 'casing_plastic.png'),
(2769, 'Aluminum', 300, 3, 4, 4, 1081, 0, 119, 'casing_aluminum.png'),
(2770, 'CFK', 400, 8, 8, 6, 1081, 0, 119, 'casing_cfk.png'),
(2771, '1 KW', 200, 9, 0, 4, 1082, 0, 119, 'motor_1kw.png'),
(2772, '2 KW', 300, 8, 0, 7, 1082, 0, 119, 'motor_2kw.png'),
(2773, '4 KW', 600, 7, 0, 9, 1082, 0, 119, 'motor_4kw.png'),
(2774, '2x 55W Halogen', 20, 1, 3, 0, 1083, 0, 119, 'light_55w_halogen.png'),
(2775, '2x 20W Halogen R', 45, 2, 4, 0, 1083, 0, 119, 'light_20w_halogen.png'),
(2776, 'Xenon ellipsoid', 155, 2, 5, 0, 1083, 0, 119, 'light_xenon.png'),
(2777, 'Steel', 60, 0, 1, 3, 1084, 0, 119, 'wheel_steel.png'),
(2778, 'Aluminum', 100, 1, 3, 2, 1084, 0, 119, 'wheel_aluminum.png'),
(2779, 'Aluminum design', 230, 1, 5, 2, 1084, 0, 119, 'wheel_aluminum_design.png'),
(2780, 'Drum brake', 100, 0, 0, 2, 1085, 0, 119, 'brake_drum.png'),
(2781, 'Disc brake', 200, 0, 1, 5, 1085, 0, 119, 'brake_disc.png'),
(2782, 'Coil spring', 105, 0, 0, 2, 1086, 0, 119, 'absorber_spring.png'),
(2783, 'Pneumatic', 170, 0, 1, 5, 1086, 0, 119, 'absorber_Pneumatic.png'),
(2784, 'Lead-acid', 300, 5, 0, 3, 1087, 0, 119, 'accumulator_acid.png'),
(2785, 'Lithium polymer', 600, 7, 0, 5, 1087, 0, 119, 'accumulator_lithium_poli.png'),
(2786, 'Lithium-ion', 1000, 10, 0, 8, 1087, 0, 119, 'accumulator_ion.png'),
(2787, 'Plastic', 30, 0, 2, 1, 1088, 0, 119, 'seat_plastic.png'),
(2788, 'Leather', 50, 0, 3, 1, 1088, 0, 119, 'seat_leather.png'),
(2789, 'Design', 75, 0, 5, 2, 1088, 0, 119, 'seat_design.png'),
(2790, 'Steel', 40, 2, 3, 0, 1089, 0, 119, 'handle_steel.png'),
(2791, 'Aluminum', 60, 3, 5, 0, 1089, 0, 119, 'handle_aluminum.png'),
(2792, 'CFK', 200, 4, 7, 0, 1089, 0, 119, 'handle_cfk.png'),
(2793, 'Steel', 200, 2, 3, 1, 1090, 0, 119, 'frame_steel.png'),
(2794, 'Aluminum', 350, 4, 5, 2, 1090, 0, 119, 'frame_aluminum.png'),
(2795, 'CFK', 1200, 4, 7, 3, 1090, 0, 119, 'frame_cfk.png'),
(2796, 'Plastic', 200, 1, 2, 2, 1091, 0, 119, 'casing_plastic.png'),
(2797, 'Aluminum', 300, 3, 4, 4, 1091, 0, 119, 'casing_aluminum.png'),
(2798, 'CFK', 400, 8, 8, 6, 1091, 0, 119, 'casing_cfk.png'),
(2799, '1 KW', 200, 9, 0, 4, 1092, 0, 119, 'motor_1kw.png'),
(2800, '2 KW', 300, 8, 0, 7, 1092, 0, 119, 'motor_2kw.png'),
(2801, '4 KW', 600, 7, 0, 9, 1092, 0, 119, 'motor_4kw.png'),
(2802, '2x 55W Halogen', 20, 1, 3, 0, 1093, 0, 119, 'light_55w_halogen.png'),
(2803, '2x 20W Halogen R', 45, 2, 4, 0, 1093, 0, 119, 'light_20w_halogen.png'),
(2804, 'Xenon ellipsoid', 155, 2, 5, 0, 1093, 0, 119, 'light_xenon.png'),
(2805, 'Steel', 60, 0, 1, 3, 1094, 0, 119, 'wheel_steel.png'),
(2806, 'Aluminum', 100, 1, 3, 2, 1094, 0, 119, 'wheel_aluminum.png'),
(2807, 'Aluminum design', 230, 1, 5, 2, 1094, 0, 119, 'wheel_aluminum_design.png'),
(2808, 'Drum brake', 100, 0, 0, 2, 1095, 0, 119, 'brake_drum.png'),
(2809, 'Disc brake', 200, 0, 1, 5, 1095, 0, 119, 'brake_disc.png'),
(2810, 'Coil spring', 105, 0, 0, 2, 1096, 0, 119, 'absorber_spring.png'),
(2811, 'Pneumatic', 170, 0, 1, 5, 1096, 0, 119, 'absorber_Pneumatic.png'),
(2812, 'Lead-acid', 300, 5, 0, 3, 1097, 0, 119, 'accumulator_acid.png'),
(2813, 'Lithium polymer', 600, 7, 0, 5, 1097, 0, 119, 'accumulator_lithium_poli.png'),
(2814, 'Lithium-ion', 1000, 10, 0, 8, 1097, 0, 119, 'accumulator_ion.png'),
(2815, 'Plastic', 30, 0, 2, 1, 1098, 0, 120, 'seat_plastic.png'),
(2816, 'Leather', 50, 0, 3, 1, 1098, 0, 120, 'seat_leather.png'),
(2817, 'Design', 75, 0, 5, 2, 1098, 0, 120, 'seat_design.png'),
(2818, 'Steel', 40, 2, 3, 0, 1099, 0, 120, 'handle_steel.png'),
(2819, 'Aluminum', 60, 3, 5, 0, 1099, 0, 120, 'handle_aluminum.png'),
(2820, 'CFK', 200, 4, 7, 0, 1099, 0, 120, 'handle_cfk.png'),
(2821, 'Steel', 200, 2, 3, 1, 1100, 0, 120, 'frame_steel.png'),
(2822, 'Aluminum', 350, 4, 5, 2, 1100, 0, 120, 'frame_aluminum.png'),
(2823, 'CFK', 1200, 4, 7, 3, 1100, 0, 120, 'frame_cfk.png'),
(2824, 'Plastic', 200, 1, 2, 2, 1101, 0, 120, 'casing_plastic.png'),
(2825, 'Aluminum', 300, 3, 4, 4, 1101, 0, 120, 'casing_aluminum.png'),
(2826, 'CFK', 400, 8, 8, 6, 1101, 0, 120, 'casing_cfk.png'),
(2827, '1 KW', 200, 9, 0, 4, 1102, 0, 120, 'motor_1kw.png'),
(2828, '2 KW', 300, 8, 0, 7, 1102, 0, 120, 'motor_2kw.png'),
(2829, '4 KW', 600, 7, 0, 9, 1102, 0, 120, 'motor_4kw.png'),
(2830, '2x 55W Halogen', 20, 1, 3, 0, 1103, 0, 120, 'light_55w_halogen.png'),
(2831, '2x 20W Halogen R', 45, 2, 4, 0, 1103, 0, 120, 'light_20w_halogen.png'),
(2832, 'Xenon ellipsoid', 155, 2, 5, 0, 1103, 0, 120, 'light_xenon.png'),
(2833, 'Steel', 60, 0, 1, 3, 1104, 0, 120, 'wheel_steel.png'),
(2834, 'Aluminum', 100, 1, 3, 2, 1104, 0, 120, 'wheel_aluminum.png'),
(2835, 'Aluminum design', 230, 1, 5, 2, 1104, 0, 120, 'wheel_aluminum_design.png'),
(2836, 'Drum brake', 100, 0, 0, 2, 1105, 0, 120, 'brake_drum.png'),
(2837, 'Disc brake', 200, 0, 1, 5, 1105, 0, 120, 'brake_disc.png'),
(2838, 'Coil spring', 105, 0, 0, 2, 1106, 0, 120, 'absorber_spring.png'),
(2839, 'Pneumatic', 170, 0, 1, 5, 1106, 0, 120, 'absorber_Pneumatic.png'),
(2840, 'Lead-acid', 300, 5, 0, 3, 1107, 0, 120, 'accumulator_acid.png'),
(2841, 'Lithium polymer', 600, 7, 0, 5, 1107, 0, 120, 'accumulator_lithium_poli.png'),
(2842, 'Lithium-ion', 1000, 10, 0, 8, 1107, 0, 120, 'accumulator_ion.png'),
(2843, 'Plastic', 30, 0, 2, 1, 1108, 0, 120, 'seat_plastic.png'),
(2844, 'Leather', 50, 0, 3, 1, 1108, 0, 120, 'seat_leather.png'),
(2845, 'Design', 75, 0, 5, 2, 1108, 0, 120, 'seat_design.png'),
(2846, 'Steel', 40, 2, 3, 0, 1109, 0, 120, 'handle_steel.png'),
(2847, 'Aluminum', 60, 3, 5, 0, 1109, 0, 120, 'handle_aluminum.png'),
(2848, 'CFK', 200, 4, 7, 0, 1109, 0, 120, 'handle_cfk.png'),
(2849, 'Steel', 200, 2, 3, 1, 1110, 0, 120, 'frame_steel.png'),
(2850, 'Aluminum', 350, 4, 5, 2, 1110, 0, 120, 'frame_aluminum.png'),
(2851, 'CFK', 1200, 4, 7, 3, 1110, 0, 120, 'frame_cfk.png'),
(2852, 'Plastic', 200, 1, 2, 2, 1111, 0, 120, 'casing_plastic.png'),
(2853, 'Aluminum', 300, 3, 4, 4, 1111, 0, 120, 'casing_aluminum.png'),
(2854, 'CFK', 400, 8, 8, 6, 1111, 0, 120, 'casing_cfk.png'),
(2855, '1 KW', 200, 9, 0, 4, 1112, 0, 120, 'motor_1kw.png'),
(2856, '2 KW', 300, 8, 0, 7, 1112, 0, 120, 'motor_2kw.png'),
(2857, '4 KW', 600, 7, 0, 9, 1112, 0, 120, 'motor_4kw.png'),
(2858, '2x 55W Halogen', 20, 1, 3, 0, 1113, 0, 120, 'light_55w_halogen.png'),
(2859, '2x 20W Halogen R', 45, 2, 4, 0, 1113, 0, 120, 'light_20w_halogen.png'),
(2860, 'Xenon ellipsoid', 155, 2, 5, 0, 1113, 0, 120, 'light_xenon.png'),
(2861, 'Steel', 60, 0, 1, 3, 1114, 0, 120, 'wheel_steel.png'),
(2862, 'Aluminum', 100, 1, 3, 2, 1114, 0, 120, 'wheel_aluminum.png'),
(2863, 'Aluminum design', 230, 1, 5, 2, 1114, 0, 120, 'wheel_aluminum_design.png'),
(2864, 'Drum brake', 100, 0, 0, 2, 1115, 0, 120, 'brake_drum.png'),
(2865, 'Disc brake', 200, 0, 1, 5, 1115, 0, 120, 'brake_disc.png'),
(2866, 'Coil spring', 105, 0, 0, 2, 1116, 0, 120, 'absorber_spring.png'),
(2867, 'Pneumatic', 170, 0, 1, 5, 1116, 0, 120, 'absorber_Pneumatic.png'),
(2868, 'Lead-acid', 300, 5, 0, 3, 1117, 0, 120, 'accumulator_acid.png'),
(2869, 'Lithium polymer', 600, 7, 0, 5, 1117, 0, 120, 'accumulator_lithium_poli.png'),
(2870, 'Lithium-ion', 1000, 10, 0, 8, 1117, 0, 120, 'accumulator_ion.png'),
(2871, 'Plastic', 30, 0, 2, 1, 1118, 0, 120, 'seat_plastic.png'),
(2872, 'Leather', 50, 0, 3, 1, 1118, 0, 120, 'seat_leather.png'),
(2873, 'Design', 75, 0, 5, 2, 1118, 0, 120, 'seat_design.png'),
(2874, 'Steel', 40, 2, 3, 0, 1119, 0, 120, 'handle_steel.png'),
(2875, 'Aluminum', 60, 3, 5, 0, 1119, 0, 120, 'handle_aluminum.png'),
(2876, 'CFK', 200, 4, 7, 0, 1119, 0, 120, 'handle_cfk.png'),
(2877, 'Steel', 200, 2, 3, 1, 1120, 0, 120, 'frame_steel.png'),
(2878, 'Aluminum', 350, 4, 5, 2, 1120, 0, 120, 'frame_aluminum.png'),
(2879, 'CFK', 1200, 4, 7, 3, 1120, 0, 120, 'frame_cfk.png'),
(2880, 'Plastic', 200, 1, 2, 2, 1121, 0, 120, 'casing_plastic.png'),
(2881, 'Aluminum', 300, 3, 4, 4, 1121, 0, 120, 'casing_aluminum.png'),
(2882, 'CFK', 400, 8, 8, 6, 1121, 0, 120, 'casing_cfk.png'),
(2883, '1 KW', 200, 9, 0, 4, 1122, 0, 120, 'motor_1kw.png'),
(2884, '2 KW', 300, 8, 0, 7, 1122, 0, 120, 'motor_2kw.png'),
(2885, '4 KW', 600, 7, 0, 9, 1122, 0, 120, 'motor_4kw.png'),
(2886, '2x 55W Halogen', 20, 1, 3, 0, 1123, 0, 120, 'light_55w_halogen.png'),
(2887, '2x 20W Halogen R', 45, 2, 4, 0, 1123, 0, 120, 'light_20w_halogen.png'),
(2888, 'Xenon ellipsoid', 155, 2, 5, 0, 1123, 0, 120, 'light_xenon.png'),
(2889, 'Steel', 60, 0, 1, 3, 1124, 0, 120, 'wheel_steel.png'),
(2890, 'Aluminum', 100, 1, 3, 2, 1124, 0, 120, 'wheel_aluminum.png'),
(2891, 'Aluminum design', 230, 1, 5, 2, 1124, 0, 120, 'wheel_aluminum_design.png'),
(2892, 'Drum brake', 100, 0, 0, 2, 1125, 0, 120, 'brake_drum.png'),
(2893, 'Disc brake', 200, 0, 1, 5, 1125, 0, 120, 'brake_disc.png'),
(2894, 'Coil spring', 105, 0, 0, 2, 1126, 0, 120, 'absorber_spring.png'),
(2895, 'Pneumatic', 170, 0, 1, 5, 1126, 0, 120, 'absorber_Pneumatic.png'),
(2896, 'Lead-acid', 300, 5, 0, 3, 1127, 0, 120, 'accumulator_acid.png'),
(2897, 'Lithium polymer', 600, 7, 0, 5, 1127, 0, 120, 'accumulator_lithium_poli.png'),
(2898, 'Lithium-ion', 1000, 10, 0, 8, 1127, 0, 120, 'accumulator_ion.png'),
(2899, 'Plastic', 30, 0, 2, 1, 1128, 0, 120, 'seat_plastic.png'),
(2900, 'Leather', 50, 0, 3, 1, 1128, 0, 120, 'seat_leather.png'),
(2901, 'Design', 75, 0, 5, 2, 1128, 0, 120, 'seat_design.png'),
(2902, 'Steel', 40, 2, 3, 0, 1129, 0, 120, 'handle_steel.png'),
(2903, 'Aluminum', 60, 3, 5, 0, 1129, 0, 120, 'handle_aluminum.png'),
(2904, 'CFK', 200, 4, 7, 0, 1129, 0, 120, 'handle_cfk.png'),
(2905, 'Steel', 200, 2, 3, 1, 1130, 0, 120, 'frame_steel.png'),
(2906, 'Aluminum', 350, 4, 5, 2, 1130, 0, 120, 'frame_aluminum.png'),
(2907, 'CFK', 1200, 4, 7, 3, 1130, 0, 120, 'frame_cfk.png'),
(2908, 'Plastic', 200, 1, 2, 2, 1131, 0, 120, 'casing_plastic.png'),
(2909, 'Aluminum', 300, 3, 4, 4, 1131, 0, 120, 'casing_aluminum.png'),
(2910, 'CFK', 400, 8, 8, 6, 1131, 0, 120, 'casing_cfk.png'),
(2911, '1 KW', 200, 9, 0, 4, 1132, 0, 120, 'motor_1kw.png'),
(2912, '2 KW', 300, 8, 0, 7, 1132, 0, 120, 'motor_2kw.png'),
(2913, '4 KW', 600, 7, 0, 9, 1132, 0, 120, 'motor_4kw.png'),
(2914, '2x 55W Halogen', 20, 1, 3, 0, 1133, 0, 120, 'light_55w_halogen.png'),
(2915, '2x 20W Halogen R', 45, 2, 4, 0, 1133, 0, 120, 'light_20w_halogen.png'),
(2916, 'Xenon ellipsoid', 155, 2, 5, 0, 1133, 0, 120, 'light_xenon.png'),
(2917, 'Steel', 60, 0, 1, 3, 1134, 0, 120, 'wheel_steel.png'),
(2918, 'Aluminum', 100, 1, 3, 2, 1134, 0, 120, 'wheel_aluminum.png'),
(2919, 'Aluminum design', 230, 1, 5, 2, 1134, 0, 120, 'wheel_aluminum_design.png'),
(2920, 'Drum brake', 100, 0, 0, 2, 1135, 0, 120, 'brake_drum.png'),
(2921, 'Disc brake', 200, 0, 1, 5, 1135, 0, 120, 'brake_disc.png'),
(2922, 'Coil spring', 105, 0, 0, 2, 1136, 0, 120, 'absorber_spring.png'),
(2923, 'Pneumatic', 170, 0, 1, 5, 1136, 0, 120, 'absorber_Pneumatic.png'),
(2924, 'Lead-acid', 300, 5, 0, 3, 1137, 0, 120, 'accumulator_acid.png'),
(2925, 'Lithium polymer', 600, 7, 0, 5, 1137, 0, 120, 'accumulator_lithium_poli.png'),
(2926, 'Lithium-ion', 1000, 10, 0, 8, 1137, 0, 120, 'accumulator_ion.png'),
(2927, 'Plastic', 30, 0, 2, 1, 1138, 0, 121, 'seat_plastic.png'),
(2928, 'Leather', 50, 0, 3, 1, 1138, 0, 121, 'seat_leather.png'),
(2929, 'Design', 75, 0, 5, 2, 1138, 0, 121, 'seat_design.png'),
(2930, 'Steel', 40, 2, 3, 0, 1139, 0, 121, 'handle_steel.png'),
(2931, 'Aluminum', 60, 3, 5, 0, 1139, 0, 121, 'handle_aluminum.png'),
(2932, 'CFK', 200, 4, 7, 0, 1139, 0, 121, 'handle_cfk.png'),
(2933, 'Steel', 200, 2, 3, 1, 1140, 0, 121, 'frame_steel.png'),
(2934, 'Aluminum', 350, 4, 5, 2, 1140, 0, 121, 'frame_aluminum.png'),
(2935, 'CFK', 1200, 4, 7, 3, 1140, 0, 121, 'frame_cfk.png'),
(2936, 'Plastic', 200, 1, 2, 2, 1141, 0, 121, 'casing_plastic.png'),
(2937, 'Aluminum', 300, 3, 4, 4, 1141, 0, 121, 'casing_aluminum.png'),
(2938, 'CFK', 400, 8, 8, 6, 1141, 0, 121, 'casing_cfk.png'),
(2939, '1 KW', 200, 9, 0, 4, 1142, 0, 121, 'motor_1kw.png'),
(2940, '2 KW', 300, 8, 0, 7, 1142, 0, 121, 'motor_2kw.png'),
(2941, '4 KW', 600, 7, 0, 9, 1142, 0, 121, 'motor_4kw.png'),
(2942, '2x 55W Halogen', 20, 1, 3, 0, 1143, 0, 121, 'light_55w_halogen.png'),
(2943, '2x 20W Halogen R', 45, 2, 4, 0, 1143, 0, 121, 'light_20w_halogen.png'),
(2944, 'Xenon ellipsoid', 155, 2, 5, 0, 1143, 0, 121, 'light_xenon.png'),
(2945, 'Steel', 60, 0, 1, 3, 1144, 0, 121, 'wheel_steel.png'),
(2946, 'Aluminum', 100, 1, 3, 2, 1144, 0, 121, 'wheel_aluminum.png'),
(2947, 'Aluminum design', 230, 1, 5, 2, 1144, 0, 121, 'wheel_aluminum_design.png'),
(2948, 'Drum brake', 100, 0, 0, 2, 1145, 0, 121, 'brake_drum.png'),
(2949, 'Disc brake', 200, 0, 1, 5, 1145, 0, 121, 'brake_disc.png'),
(2950, 'Coil spring', 105, 0, 0, 2, 1146, 0, 121, 'absorber_spring.png'),
(2951, 'Pneumatic', 170, 0, 1, 5, 1146, 0, 121, 'absorber_Pneumatic.png'),
(2952, 'Lead-acid', 300, 5, 0, 3, 1147, 0, 121, 'accumulator_acid.png'),
(2953, 'Lithium polymer', 600, 7, 0, 5, 1147, 0, 121, 'accumulator_lithium_poli.png'),
(2954, 'Lithium-ion', 1000, 10, 0, 8, 1147, 0, 121, 'accumulator_ion.png'),
(2955, 'Plastic', 30, 0, 2, 1, 1148, 0, 121, 'seat_plastic.png'),
(2956, 'Leather', 50, 0, 3, 1, 1148, 0, 121, 'seat_leather.png'),
(2957, 'Design', 75, 0, 5, 2, 1148, 0, 121, 'seat_design.png'),
(2958, 'Steel', 40, 2, 3, 0, 1149, 0, 121, 'handle_steel.png'),
(2959, 'Aluminum', 60, 3, 5, 0, 1149, 0, 121, 'handle_aluminum.png'),
(2960, 'CFK', 200, 4, 7, 0, 1149, 0, 121, 'handle_cfk.png'),
(2961, 'Steel', 200, 2, 3, 1, 1150, 0, 121, 'frame_steel.png'),
(2962, 'Aluminum', 350, 4, 5, 2, 1150, 0, 121, 'frame_aluminum.png'),
(2963, 'CFK', 1200, 4, 7, 3, 1150, 0, 121, 'frame_cfk.png'),
(2964, 'Plastic', 200, 1, 2, 2, 1151, 0, 121, 'casing_plastic.png'),
(2965, 'Aluminum', 300, 3, 4, 4, 1151, 0, 121, 'casing_aluminum.png'),
(2966, 'CFK', 400, 8, 8, 6, 1151, 0, 121, 'casing_cfk.png'),
(2967, '1 KW', 200, 9, 0, 4, 1152, 0, 121, 'motor_1kw.png'),
(2968, '2 KW', 300, 8, 0, 7, 1152, 0, 121, 'motor_2kw.png'),
(2969, '4 KW', 600, 7, 0, 9, 1152, 0, 121, 'motor_4kw.png'),
(2970, '2x 55W Halogen', 20, 1, 3, 0, 1153, 0, 121, 'light_55w_halogen.png'),
(2971, '2x 20W Halogen R', 45, 2, 4, 0, 1153, 0, 121, 'light_20w_halogen.png'),
(2972, 'Xenon ellipsoid', 155, 2, 5, 0, 1153, 0, 121, 'light_xenon.png'),
(2973, 'Steel', 60, 0, 1, 3, 1154, 0, 121, 'wheel_steel.png'),
(2974, 'Aluminum', 100, 1, 3, 2, 1154, 0, 121, 'wheel_aluminum.png'),
(2975, 'Aluminum design', 230, 1, 5, 2, 1154, 0, 121, 'wheel_aluminum_design.png'),
(2976, 'Drum brake', 100, 0, 0, 2, 1155, 0, 121, 'brake_drum.png'),
(2977, 'Disc brake', 200, 0, 1, 5, 1155, 0, 121, 'brake_disc.png'),
(2978, 'Coil spring', 105, 0, 0, 2, 1156, 0, 121, 'absorber_spring.png'),
(2979, 'Pneumatic', 170, 0, 1, 5, 1156, 0, 121, 'absorber_Pneumatic.png'),
(2980, 'Lead-acid', 300, 5, 0, 3, 1157, 0, 121, 'accumulator_acid.png'),
(2981, 'Lithium polymer', 600, 7, 0, 5, 1157, 0, 121, 'accumulator_lithium_poli.png'),
(2982, 'Lithium-ion', 1000, 10, 0, 8, 1157, 0, 121, 'accumulator_ion.png'),
(2983, 'Plastic', 30, 0, 2, 1, 1158, 0, 121, 'seat_plastic.png'),
(2984, 'Leather', 50, 0, 3, 1, 1158, 0, 121, 'seat_leather.png'),
(2985, 'Design', 75, 0, 5, 2, 1158, 0, 121, 'seat_design.png'),
(2986, 'Steel', 40, 2, 3, 0, 1159, 0, 121, 'handle_steel.png'),
(2987, 'Aluminum', 60, 3, 5, 0, 1159, 0, 121, 'handle_aluminum.png'),
(2988, 'CFK', 200, 4, 7, 0, 1159, 0, 121, 'handle_cfk.png'),
(2989, 'Steel', 200, 2, 3, 1, 1160, 0, 121, 'frame_steel.png'),
(2990, 'Aluminum', 350, 4, 5, 2, 1160, 0, 121, 'frame_aluminum.png'),
(2991, 'CFK', 1200, 4, 7, 3, 1160, 0, 121, 'frame_cfk.png'),
(2992, 'Plastic', 200, 1, 2, 2, 1161, 0, 121, 'casing_plastic.png'),
(2993, 'Aluminum', 300, 3, 4, 4, 1161, 0, 121, 'casing_aluminum.png'),
(2994, 'CFK', 400, 8, 8, 6, 1161, 0, 121, 'casing_cfk.png'),
(2995, '1 KW', 200, 9, 0, 4, 1162, 0, 121, 'motor_1kw.png'),
(2996, '2 KW', 300, 8, 0, 7, 1162, 0, 121, 'motor_2kw.png'),
(2997, '4 KW', 600, 7, 0, 9, 1162, 0, 121, 'motor_4kw.png'),
(2998, '2x 55W Halogen', 20, 1, 3, 0, 1163, 0, 121, 'light_55w_halogen.png'),
(2999, '2x 20W Halogen R', 45, 2, 4, 0, 1163, 0, 121, 'light_20w_halogen.png'),
(3000, 'Xenon ellipsoid', 155, 2, 5, 0, 1163, 0, 121, 'light_xenon.png'),
(3001, 'Steel', 60, 0, 1, 3, 1164, 0, 121, 'wheel_steel.png'),
(3002, 'Aluminum', 100, 1, 3, 2, 1164, 0, 121, 'wheel_aluminum.png'),
(3003, 'Aluminum design', 230, 1, 5, 2, 1164, 0, 121, 'wheel_aluminum_design.png'),
(3004, 'Drum brake', 100, 0, 0, 2, 1165, 0, 121, 'brake_drum.png'),
(3005, 'Disc brake', 200, 0, 1, 5, 1165, 0, 121, 'brake_disc.png'),
(3006, 'Coil spring', 105, 0, 0, 2, 1166, 0, 121, 'absorber_spring.png'),
(3007, 'Pneumatic', 170, 0, 1, 5, 1166, 0, 121, 'absorber_Pneumatic.png'),
(3008, 'Lead-acid', 300, 5, 0, 3, 1167, 0, 121, 'accumulator_acid.png'),
(3009, 'Lithium polymer', 600, 7, 0, 5, 1167, 0, 121, 'accumulator_lithium_poli.png'),
(3010, 'Lithium-ion', 1000, 10, 0, 8, 1167, 0, 121, 'accumulator_ion.png'),
(3011, 'Plastic', 30, 0, 2, 1, 1168, 0, 122, 'seat_plastic.png'),
(3012, 'Leather', 50, 0, 3, 1, 1168, 0, 122, 'seat_leather.png'),
(3013, 'Design', 75, 0, 5, 2, 1168, 0, 122, 'seat_design.png'),
(3014, 'Steel', 40, 2, 3, 0, 1169, 0, 122, 'handle_steel.png'),
(3015, 'Aluminum', 60, 3, 5, 0, 1169, 0, 122, 'handle_aluminum.png'),
(3016, 'CFK', 200, 4, 7, 0, 1169, 0, 122, 'handle_cfk.png'),
(3017, 'Steel', 200, 2, 3, 1, 1170, 0, 122, 'frame_steel.png'),
(3018, 'Aluminum', 350, 4, 5, 2, 1170, 0, 122, 'frame_aluminum.png'),
(3019, 'CFK', 1200, 4, 7, 3, 1170, 0, 122, 'frame_cfk.png'),
(3020, 'Plastic', 200, 1, 2, 2, 1171, 0, 122, 'casing_plastic.png'),
(3021, 'Aluminum', 300, 3, 4, 4, 1171, 0, 122, 'casing_aluminum.png'),
(3022, 'CFK', 400, 8, 8, 6, 1171, 0, 122, 'casing_cfk.png'),
(3023, '1 KW', 200, 9, 0, 4, 1172, 0, 122, 'motor_1kw.png'),
(3024, '2 KW', 300, 8, 0, 7, 1172, 0, 122, 'motor_2kw.png'),
(3025, '4 KW', 600, 7, 0, 9, 1172, 0, 122, 'motor_4kw.png'),
(3026, '2x 55W Halogen', 20, 1, 3, 0, 1173, 0, 122, 'light_55w_halogen.png'),
(3027, '2x 20W Halogen R', 45, 2, 4, 0, 1173, 0, 122, 'light_20w_halogen.png'),
(3028, 'Xenon ellipsoid', 155, 2, 5, 0, 1173, 0, 122, 'light_xenon.png'),
(3029, 'Steel', 60, 0, 1, 3, 1174, 0, 122, 'wheel_steel.png'),
(3030, 'Aluminum', 100, 1, 3, 2, 1174, 0, 122, 'wheel_aluminum.png'),
(3031, 'Aluminum design', 230, 1, 5, 2, 1174, 0, 122, 'wheel_aluminum_design.png'),
(3032, 'Drum brake', 100, 0, 0, 2, 1175, 0, 122, 'brake_drum.png'),
(3033, 'Disc brake', 200, 0, 1, 5, 1175, 0, 122, 'brake_disc.png'),
(3034, 'Coil spring', 105, 0, 0, 2, 1176, 0, 122, 'absorber_spring.png'),
(3035, 'Pneumatic', 170, 0, 1, 5, 1176, 0, 122, 'absorber_Pneumatic.png'),
(3036, 'Lead-acid', 300, 5, 0, 3, 1177, 0, 122, 'accumulator_acid.png'),
(3037, 'Lithium polymer', 600, 7, 0, 5, 1177, 0, 122, 'accumulator_lithium_poli.png'),
(3038, 'Lithium-ion', 1000, 10, 0, 8, 1177, 0, 122, 'accumulator_ion.png'),
(3039, 'Plastic', 30, 0, 2, 1, 1178, 0, 122, 'seat_plastic.png'),
(3040, 'Leather', 50, 0, 3, 1, 1178, 0, 122, 'seat_leather.png'),
(3041, 'Design', 75, 0, 5, 2, 1178, 0, 122, 'seat_design.png'),
(3042, 'Steel', 40, 2, 3, 0, 1179, 0, 122, 'handle_steel.png'),
(3043, 'Aluminum', 60, 3, 5, 0, 1179, 0, 122, 'handle_aluminum.png'),
(3044, 'CFK', 200, 4, 7, 0, 1179, 0, 122, 'handle_cfk.png'),
(3045, 'Steel', 200, 2, 3, 1, 1180, 0, 122, 'frame_steel.png'),
(3046, 'Aluminum', 350, 4, 5, 2, 1180, 0, 122, 'frame_aluminum.png'),
(3047, 'CFK', 1200, 4, 7, 3, 1180, 0, 122, 'frame_cfk.png'),
(3048, 'Plastic', 200, 1, 2, 2, 1181, 0, 122, 'casing_plastic.png'),
(3049, 'Aluminum', 300, 3, 4, 4, 1181, 0, 122, 'casing_aluminum.png'),
(3050, 'CFK', 400, 8, 8, 6, 1181, 0, 122, 'casing_cfk.png'),
(3051, '1 KW', 200, 9, 0, 4, 1182, 0, 122, 'motor_1kw.png'),
(3052, '2 KW', 300, 8, 0, 7, 1182, 0, 122, 'motor_2kw.png'),
(3053, '4 KW', 600, 7, 0, 9, 1182, 0, 122, 'motor_4kw.png'),
(3054, '2x 55W Halogen', 20, 1, 3, 0, 1183, 0, 122, 'light_55w_halogen.png'),
(3055, '2x 20W Halogen R', 45, 2, 4, 0, 1183, 0, 122, 'light_20w_halogen.png'),
(3056, 'Xenon ellipsoid', 155, 2, 5, 0, 1183, 0, 122, 'light_xenon.png'),
(3057, 'Steel', 60, 0, 1, 3, 1184, 0, 122, 'wheel_steel.png'),
(3058, 'Aluminum', 100, 1, 3, 2, 1184, 0, 122, 'wheel_aluminum.png'),
(3059, 'Aluminum design', 230, 1, 5, 2, 1184, 0, 122, 'wheel_aluminum_design.png'),
(3060, 'Drum brake', 100, 0, 0, 2, 1185, 0, 122, 'brake_drum.png'),
(3061, 'Disc brake', 200, 0, 1, 5, 1185, 0, 122, 'brake_disc.png'),
(3062, 'Coil spring', 105, 0, 0, 2, 1186, 0, 122, 'absorber_spring.png'),
(3063, 'Pneumatic', 170, 0, 1, 5, 1186, 0, 122, 'absorber_Pneumatic.png'),
(3064, 'Lead-acid', 300, 5, 0, 3, 1187, 0, 122, 'accumulator_acid.png'),
(3065, 'Lithium polymer', 600, 7, 0, 5, 1187, 0, 122, 'accumulator_lithium_poli.png'),
(3066, 'Lithium-ion', 1000, 10, 0, 8, 1187, 0, 122, 'accumulator_ion.png'),
(3067, 'Plastic', 30, 0, 2, 1, 1188, 0, 122, 'seat_plastic.png'),
(3068, 'Leather', 50, 0, 3, 1, 1188, 0, 122, 'seat_leather.png'),
(3069, 'Design', 75, 0, 5, 2, 1188, 0, 122, 'seat_design.png'),
(3070, 'Steel', 40, 2, 3, 0, 1189, 0, 122, 'handle_steel.png'),
(3071, 'Aluminum', 60, 3, 5, 0, 1189, 0, 122, 'handle_aluminum.png'),
(3072, 'CFK', 200, 4, 7, 0, 1189, 0, 122, 'handle_cfk.png'),
(3073, 'Steel', 200, 2, 3, 1, 1190, 0, 122, 'frame_steel.png'),
(3074, 'Aluminum', 350, 4, 5, 2, 1190, 0, 122, 'frame_aluminum.png'),
(3075, 'CFK', 1200, 4, 7, 3, 1190, 0, 122, 'frame_cfk.png'),
(3076, 'Plastic', 200, 1, 2, 2, 1191, 0, 122, 'casing_plastic.png'),
(3077, 'Aluminum', 300, 3, 4, 4, 1191, 0, 122, 'casing_aluminum.png'),
(3078, 'CFK', 400, 8, 8, 6, 1191, 0, 122, 'casing_cfk.png'),
(3079, '1 KW', 200, 9, 0, 4, 1192, 0, 122, 'motor_1kw.png'),
(3080, '2 KW', 300, 8, 0, 7, 1192, 0, 122, 'motor_2kw.png'),
(3081, '4 KW', 600, 7, 0, 9, 1192, 0, 122, 'motor_4kw.png'),
(3082, '2x 55W Halogen', 20, 1, 3, 0, 1193, 0, 122, 'light_55w_halogen.png'),
(3083, '2x 20W Halogen R', 45, 2, 4, 0, 1193, 0, 122, 'light_20w_halogen.png'),
(3084, 'Xenon ellipsoid', 155, 2, 5, 0, 1193, 0, 122, 'light_xenon.png'),
(3085, 'Steel', 60, 0, 1, 3, 1194, 0, 122, 'wheel_steel.png'),
(3086, 'Aluminum', 100, 1, 3, 2, 1194, 0, 122, 'wheel_aluminum.png'),
(3087, 'Aluminum design', 230, 1, 5, 2, 1194, 0, 122, 'wheel_aluminum_design.png'),
(3088, 'Drum brake', 100, 0, 0, 2, 1195, 0, 122, 'brake_drum.png'),
(3089, 'Disc brake', 200, 0, 1, 5, 1195, 0, 122, 'brake_disc.png'),
(3090, 'Coil spring', 105, 0, 0, 2, 1196, 0, 122, 'absorber_spring.png'),
(3091, 'Pneumatic', 170, 0, 1, 5, 1196, 0, 122, 'absorber_Pneumatic.png'),
(3092, 'Lead-acid', 300, 5, 0, 3, 1197, 0, 122, 'accumulator_acid.png'),
(3093, 'Lithium polymer', 600, 7, 0, 5, 1197, 0, 122, 'accumulator_lithium_poli.png'),
(3094, 'Lithium-ion', 1000, 10, 0, 8, 1197, 0, 122, 'accumulator_ion.png'),
(3095, 'Plastic', 30, 0, 2, 1, 1198, 0, 123, 'seat_plastic.png'),
(3096, 'Leather', 50, 0, 3, 1, 1198, 0, 123, 'seat_leather.png'),
(3097, 'Design', 75, 0, 5, 2, 1198, 0, 123, 'seat_design.png'),
(3098, 'Steel', 40, 2, 3, 0, 1199, 0, 123, 'handle_steel.png'),
(3099, 'Aluminum', 60, 3, 5, 0, 1199, 0, 123, 'handle_aluminum.png'),
(3100, 'CFK', 200, 4, 7, 0, 1199, 0, 123, 'handle_cfk.png'),
(3101, 'Steel', 200, 2, 3, 1, 1200, 0, 123, 'frame_steel.png'),
(3102, 'Aluminum', 350, 4, 5, 2, 1200, 0, 123, 'frame_aluminum.png'),
(3103, 'CFK', 1200, 4, 7, 3, 1200, 0, 123, 'frame_cfk.png'),
(3104, 'Plastic', 200, 1, 2, 2, 1201, 0, 123, 'casing_plastic.png'),
(3105, 'Aluminum', 300, 3, 4, 4, 1201, 0, 123, 'casing_aluminum.png'),
(3106, 'CFK', 400, 8, 8, 6, 1201, 0, 123, 'casing_cfk.png'),
(3107, '1 KW', 200, 9, 0, 4, 1202, 0, 123, 'motor_1kw.png'),
(3108, '2 KW', 300, 8, 0, 7, 1202, 0, 123, 'motor_2kw.png'),
(3109, '4 KW', 600, 7, 0, 9, 1202, 0, 123, 'motor_4kw.png'),
(3110, '2x 55W Halogen', 20, 1, 3, 0, 1203, 0, 123, 'light_55w_halogen.png'),
(3111, '2x 20W Halogen R', 45, 2, 4, 0, 1203, 0, 123, 'light_20w_halogen.png'),
(3112, 'Xenon ellipsoid', 155, 2, 5, 0, 1203, 0, 123, 'light_xenon.png'),
(3113, 'Steel', 60, 0, 1, 3, 1204, 0, 123, 'wheel_steel.png'),
(3114, 'Aluminum', 100, 1, 3, 2, 1204, 0, 123, 'wheel_aluminum.png'),
(3115, 'Aluminum design', 230, 1, 5, 2, 1204, 0, 123, 'wheel_aluminum_design.png'),
(3116, 'Drum brake', 100, 0, 0, 2, 1205, 0, 123, 'brake_drum.png'),
(3117, 'Disc brake', 200, 0, 1, 5, 1205, 0, 123, 'brake_disc.png'),
(3118, 'Coil spring', 105, 0, 0, 2, 1206, 0, 123, 'absorber_spring.png'),
(3119, 'Pneumatic', 170, 0, 1, 5, 1206, 0, 123, 'absorber_Pneumatic.png'),
(3120, 'Lead-acid', 300, 5, 0, 3, 1207, 0, 123, 'accumulator_acid.png'),
(3121, 'Lithium polymer', 600, 7, 0, 5, 1207, 0, 123, 'accumulator_lithium_poli.png'),
(3122, 'Lithium-ion', 1000, 10, 0, 8, 1207, 0, 123, 'accumulator_ion.png'),
(3123, 'Plastic', 30, 0, 2, 1, 1208, 0, 123, 'seat_plastic.png'),
(3124, 'Leather', 50, 0, 3, 1, 1208, 0, 123, 'seat_leather.png'),
(3125, 'Design', 75, 0, 5, 2, 1208, 0, 123, 'seat_design.png'),
(3126, 'Steel', 40, 2, 3, 0, 1209, 0, 123, 'handle_steel.png'),
(3127, 'Aluminum', 60, 3, 5, 0, 1209, 0, 123, 'handle_aluminum.png'),
(3128, 'CFK', 200, 4, 7, 0, 1209, 0, 123, 'handle_cfk.png'),
(3129, 'Steel', 200, 2, 3, 1, 1210, 0, 123, 'frame_steel.png'),
(3130, 'Aluminum', 350, 4, 5, 2, 1210, 0, 123, 'frame_aluminum.png'),
(3131, 'CFK', 1200, 4, 7, 3, 1210, 0, 123, 'frame_cfk.png'),
(3132, 'Plastic', 200, 1, 2, 2, 1211, 0, 123, 'casing_plastic.png'),
(3133, 'Aluminum', 300, 3, 4, 4, 1211, 0, 123, 'casing_aluminum.png'),
(3134, 'CFK', 400, 8, 8, 6, 1211, 0, 123, 'casing_cfk.png'),
(3135, '1 KW', 200, 9, 0, 4, 1212, 0, 123, 'motor_1kw.png'),
(3136, '2 KW', 300, 8, 0, 7, 1212, 0, 123, 'motor_2kw.png'),
(3137, '4 KW', 600, 7, 0, 9, 1212, 0, 123, 'motor_4kw.png'),
(3138, '2x 55W Halogen', 20, 1, 3, 0, 1213, 0, 123, 'light_55w_halogen.png'),
(3139, '2x 20W Halogen R', 45, 2, 4, 0, 1213, 0, 123, 'light_20w_halogen.png'),
(3140, 'Xenon ellipsoid', 155, 2, 5, 0, 1213, 0, 123, 'light_xenon.png'),
(3141, 'Steel', 60, 0, 1, 3, 1214, 0, 123, 'wheel_steel.png'),
(3142, 'Aluminum', 100, 1, 3, 2, 1214, 0, 123, 'wheel_aluminum.png'),
(3143, 'Aluminum design', 230, 1, 5, 2, 1214, 0, 123, 'wheel_aluminum_design.png'),
(3144, 'Drum brake', 100, 0, 0, 2, 1215, 0, 123, 'brake_drum.png'),
(3145, 'Disc brake', 200, 0, 1, 5, 1215, 0, 123, 'brake_disc.png'),
(3146, 'Coil spring', 105, 0, 0, 2, 1216, 0, 123, 'absorber_spring.png'),
(3147, 'Pneumatic', 170, 0, 1, 5, 1216, 0, 123, 'absorber_Pneumatic.png'),
(3148, 'Lead-acid', 300, 5, 0, 3, 1217, 0, 123, 'accumulator_acid.png'),
(3149, 'Lithium polymer', 600, 7, 0, 5, 1217, 0, 123, 'accumulator_lithium_poli.png'),
(3150, 'Lithium-ion', 1000, 10, 0, 8, 1217, 0, 123, 'accumulator_ion.png'),
(3151, 'Plastic', 30, 0, 2, 1, 1218, 0, 123, 'seat_plastic.png'),
(3152, 'Leather', 50, 0, 3, 1, 1218, 0, 123, 'seat_leather.png'),
(3153, 'Design', 75, 0, 5, 2, 1218, 0, 123, 'seat_design.png'),
(3154, 'Steel', 40, 2, 3, 0, 1219, 0, 123, 'handle_steel.png'),
(3155, 'Aluminum', 60, 3, 5, 0, 1219, 0, 123, 'handle_aluminum.png'),
(3156, 'CFK', 200, 4, 7, 0, 1219, 0, 123, 'handle_cfk.png'),
(3157, 'Steel', 200, 2, 3, 1, 1220, 0, 123, 'frame_steel.png'),
(3158, 'Aluminum', 350, 4, 5, 2, 1220, 0, 123, 'frame_aluminum.png'),
(3159, 'CFK', 1200, 4, 7, 3, 1220, 0, 123, 'frame_cfk.png'),
(3160, 'Plastic', 200, 1, 2, 2, 1221, 0, 123, 'casing_plastic.png'),
(3161, 'Aluminum', 300, 3, 4, 4, 1221, 0, 123, 'casing_aluminum.png'),
(3162, 'CFK', 400, 8, 8, 6, 1221, 0, 123, 'casing_cfk.png'),
(3163, '1 KW', 200, 9, 0, 4, 1222, 0, 123, 'motor_1kw.png'),
(3164, '2 KW', 300, 8, 0, 7, 1222, 0, 123, 'motor_2kw.png'),
(3165, '4 KW', 600, 7, 0, 9, 1222, 0, 123, 'motor_4kw.png'),
(3166, '2x 55W Halogen', 20, 1, 3, 0, 1223, 0, 123, 'light_55w_halogen.png'),
(3167, '2x 20W Halogen R', 45, 2, 4, 0, 1223, 0, 123, 'light_20w_halogen.png'),
(3168, 'Xenon ellipsoid', 155, 2, 5, 0, 1223, 0, 123, 'light_xenon.png'),
(3169, 'Steel', 60, 0, 1, 3, 1224, 0, 123, 'wheel_steel.png'),
(3170, 'Aluminum', 100, 1, 3, 2, 1224, 0, 123, 'wheel_aluminum.png'),
(3171, 'Aluminum design', 230, 1, 5, 2, 1224, 0, 123, 'wheel_aluminum_design.png'),
(3172, 'Drum brake', 100, 0, 0, 2, 1225, 0, 123, 'brake_drum.png'),
(3173, 'Disc brake', 200, 0, 1, 5, 1225, 0, 123, 'brake_disc.png'),
(3174, 'Coil spring', 105, 0, 0, 2, 1226, 0, 123, 'absorber_spring.png'),
(3175, 'Pneumatic', 170, 0, 1, 5, 1226, 0, 123, 'absorber_Pneumatic.png'),
(3176, 'Lead-acid', 300, 5, 0, 3, 1227, 0, 123, 'accumulator_acid.png'),
(3177, 'Lithium polymer', 600, 7, 0, 5, 1227, 0, 123, 'accumulator_lithium_poli.png'),
(3178, 'Lithium-ion', 1000, 10, 0, 8, 1227, 0, 123, 'accumulator_ion.png'),
(3179, 'Plastic', 30, 0, 2, 1, 1228, 0, 124, 'seat_plastic.png'),
(3180, 'Leather', 50, 0, 3, 1, 1228, 0, 124, 'seat_leather.png'),
(3181, 'Design', 75, 0, 5, 2, 1228, 0, 124, 'seat_design.png'),
(3182, 'Steel', 40, 2, 3, 0, 1229, 0, 124, 'handle_steel.png'),
(3183, 'Aluminum', 60, 3, 5, 0, 1229, 0, 124, 'handle_aluminum.png'),
(3184, 'CFK', 200, 4, 7, 0, 1229, 0, 124, 'handle_cfk.png'),
(3185, 'Steel', 200, 2, 3, 1, 1230, 0, 124, 'frame_steel.png'),
(3186, 'Aluminum', 350, 4, 5, 2, 1230, 0, 124, 'frame_aluminum.png'),
(3187, 'CFK', 1200, 4, 7, 3, 1230, 0, 124, 'frame_cfk.png'),
(3188, 'Plastic', 200, 1, 2, 2, 1231, 0, 124, 'casing_plastic.png'),
(3189, 'Aluminum', 300, 3, 4, 4, 1231, 0, 124, 'casing_aluminum.png'),
(3190, 'CFK', 400, 8, 8, 6, 1231, 0, 124, 'casing_cfk.png'),
(3191, '1 KW', 200, 9, 0, 4, 1232, 0, 124, 'motor_1kw.png'),
(3192, '2 KW', 300, 8, 0, 7, 1232, 0, 124, 'motor_2kw.png'),
(3193, '4 KW', 600, 7, 0, 9, 1232, 0, 124, 'motor_4kw.png'),
(3194, '2x 55W Halogen', 20, 1, 3, 0, 1233, 0, 124, 'light_55w_halogen.png'),
(3195, '2x 20W Halogen R', 45, 2, 4, 0, 1233, 0, 124, 'light_20w_halogen.png'),
(3196, 'Xenon ellipsoid', 155, 2, 5, 0, 1233, 0, 124, 'light_xenon.png'),
(3197, 'Steel', 60, 0, 1, 3, 1234, 0, 124, 'wheel_steel.png'),
(3198, 'Aluminum', 100, 1, 3, 2, 1234, 0, 124, 'wheel_aluminum.png'),
(3199, 'Aluminum design', 230, 1, 5, 2, 1234, 0, 124, 'wheel_aluminum_design.png'),
(3200, 'Drum brake', 100, 0, 0, 2, 1235, 0, 124, 'brake_drum.png'),
(3201, 'Disc brake', 200, 0, 1, 5, 1235, 0, 124, 'brake_disc.png'),
(3202, 'Coil spring', 105, 0, 0, 2, 1236, 0, 124, 'absorber_spring.png'),
(3203, 'Pneumatic', 170, 0, 1, 5, 1236, 0, 124, 'absorber_Pneumatic.png'),
(3204, 'Lead-acid', 300, 5, 0, 3, 1237, 0, 124, 'accumulator_acid.png'),
(3205, 'Lithium polymer', 600, 7, 0, 5, 1237, 0, 124, 'accumulator_lithium_poli.png'),
(3206, 'Lithium-ion', 1000, 10, 0, 8, 1237, 0, 124, 'accumulator_ion.png'),
(3207, 'Plastic', 30, 0, 2, 1, 1238, 0, 124, 'seat_plastic.png'),
(3208, 'Leather', 50, 0, 3, 1, 1238, 0, 124, 'seat_leather.png'),
(3209, 'Design', 75, 0, 5, 2, 1238, 0, 124, 'seat_design.png'),
(3210, 'Steel', 40, 2, 3, 0, 1239, 0, 124, 'handle_steel.png'),
(3211, 'Aluminum', 60, 3, 5, 0, 1239, 0, 124, 'handle_aluminum.png'),
(3212, 'CFK', 200, 4, 7, 0, 1239, 0, 124, 'handle_cfk.png'),
(3213, 'Steel', 200, 2, 3, 1, 1240, 0, 124, 'frame_steel.png'),
(3214, 'Aluminum', 350, 4, 5, 2, 1240, 0, 124, 'frame_aluminum.png'),
(3215, 'CFK', 1200, 4, 7, 3, 1240, 0, 124, 'frame_cfk.png'),
(3216, 'Plastic', 200, 1, 2, 2, 1241, 0, 124, 'casing_plastic.png'),
(3217, 'Aluminum', 300, 3, 4, 4, 1241, 0, 124, 'casing_aluminum.png'),
(3218, 'CFK', 400, 8, 8, 6, 1241, 0, 124, 'casing_cfk.png'),
(3219, '1 KW', 200, 9, 0, 4, 1242, 0, 124, 'motor_1kw.png'),
(3220, '2 KW', 300, 8, 0, 7, 1242, 0, 124, 'motor_2kw.png'),
(3221, '4 KW', 600, 7, 0, 9, 1242, 0, 124, 'motor_4kw.png'),
(3222, '2x 55W Halogen', 20, 1, 3, 0, 1243, 0, 124, 'light_55w_halogen.png'),
(3223, '2x 20W Halogen R', 45, 2, 4, 0, 1243, 0, 124, 'light_20w_halogen.png'),
(3224, 'Xenon ellipsoid', 155, 2, 5, 0, 1243, 0, 124, 'light_xenon.png'),
(3225, 'Steel', 60, 0, 1, 3, 1244, 0, 124, 'wheel_steel.png'),
(3226, 'Aluminum', 100, 1, 3, 2, 1244, 0, 124, 'wheel_aluminum.png'),
(3227, 'Aluminum design', 230, 1, 5, 2, 1244, 0, 124, 'wheel_aluminum_design.png');
INSERT INTO `tbl_component_materials` (`id`, `name`, `cost`, `range`, `design`, `reliability`, `component_id`, `allowance_id`, `team_id`, `image`) VALUES
(3228, 'Drum brake', 100, 0, 0, 2, 1245, 0, 124, 'brake_drum.png'),
(3229, 'Disc brake', 200, 0, 1, 5, 1245, 0, 124, 'brake_disc.png'),
(3230, 'Coil spring', 105, 0, 0, 2, 1246, 0, 124, 'absorber_spring.png'),
(3231, 'Pneumatic', 170, 0, 1, 5, 1246, 0, 124, 'absorber_Pneumatic.png'),
(3232, 'Lead-acid', 300, 5, 0, 3, 1247, 0, 124, 'accumulator_acid.png'),
(3233, 'Lithium polymer', 600, 7, 0, 5, 1247, 0, 124, 'accumulator_lithium_poli.png'),
(3234, 'Lithium-ion', 1000, 10, 0, 8, 1247, 0, 124, 'accumulator_ion.png'),
(3235, 'Plastic', 30, 0, 2, 1, 1248, 0, 124, 'seat_plastic.png'),
(3236, 'Leather', 50, 0, 3, 1, 1248, 0, 124, 'seat_leather.png'),
(3237, 'Design', 75, 0, 5, 2, 1248, 0, 124, 'seat_design.png'),
(3238, 'Steel', 40, 2, 3, 0, 1249, 0, 124, 'handle_steel.png'),
(3239, 'Aluminum', 60, 3, 5, 0, 1249, 0, 124, 'handle_aluminum.png'),
(3240, 'CFK', 200, 4, 7, 0, 1249, 0, 124, 'handle_cfk.png'),
(3241, 'Steel', 200, 2, 3, 1, 1250, 0, 124, 'frame_steel.png'),
(3242, 'Aluminum', 350, 4, 5, 2, 1250, 0, 124, 'frame_aluminum.png'),
(3243, 'CFK', 1200, 4, 7, 3, 1250, 0, 124, 'frame_cfk.png'),
(3244, 'Plastic', 200, 1, 2, 2, 1251, 0, 124, 'casing_plastic.png'),
(3245, 'Aluminum', 300, 3, 4, 4, 1251, 0, 124, 'casing_aluminum.png'),
(3246, 'CFK', 400, 8, 8, 6, 1251, 0, 124, 'casing_cfk.png'),
(3247, '1 KW', 200, 9, 0, 4, 1252, 0, 124, 'motor_1kw.png'),
(3248, '2 KW', 300, 8, 0, 7, 1252, 0, 124, 'motor_2kw.png'),
(3249, '4 KW', 600, 7, 0, 9, 1252, 0, 124, 'motor_4kw.png'),
(3250, '2x 55W Halogen', 20, 1, 3, 0, 1253, 0, 124, 'light_55w_halogen.png'),
(3251, '2x 20W Halogen R', 45, 2, 4, 0, 1253, 0, 124, 'light_20w_halogen.png'),
(3252, 'Xenon ellipsoid', 155, 2, 5, 0, 1253, 0, 124, 'light_xenon.png'),
(3253, 'Steel', 60, 0, 1, 3, 1254, 0, 124, 'wheel_steel.png'),
(3254, 'Aluminum', 100, 1, 3, 2, 1254, 0, 124, 'wheel_aluminum.png'),
(3255, 'Aluminum design', 230, 1, 5, 2, 1254, 0, 124, 'wheel_aluminum_design.png'),
(3256, 'Drum brake', 100, 0, 0, 2, 1255, 0, 124, 'brake_drum.png'),
(3257, 'Disc brake', 200, 0, 1, 5, 1255, 0, 124, 'brake_disc.png'),
(3258, 'Coil spring', 105, 0, 0, 2, 1256, 0, 124, 'absorber_spring.png'),
(3259, 'Pneumatic', 170, 0, 1, 5, 1256, 0, 124, 'absorber_Pneumatic.png'),
(3260, 'Lead-acid', 300, 5, 0, 3, 1257, 0, 124, 'accumulator_acid.png'),
(3261, 'Lithium polymer', 600, 7, 0, 5, 1257, 0, 124, 'accumulator_lithium_poli.png'),
(3262, 'Lithium-ion', 1000, 10, 0, 8, 1257, 0, 124, 'accumulator_ion.png'),
(3263, 'Plastic', 30, 0, 2, 1, 1258, 0, 124, 'seat_plastic.png'),
(3264, 'Leather', 50, 0, 3, 1, 1258, 0, 124, 'seat_leather.png'),
(3265, 'Design', 75, 0, 5, 2, 1258, 0, 124, 'seat_design.png'),
(3266, 'Steel', 40, 2, 3, 0, 1259, 0, 124, 'handle_steel.png'),
(3267, 'Aluminum', 60, 3, 5, 0, 1259, 0, 124, 'handle_aluminum.png'),
(3268, 'CFK', 200, 4, 7, 0, 1259, 0, 124, 'handle_cfk.png'),
(3269, 'Steel', 200, 2, 3, 1, 1260, 0, 124, 'frame_steel.png'),
(3270, 'Aluminum', 350, 4, 5, 2, 1260, 0, 124, 'frame_aluminum.png'),
(3271, 'CFK', 1200, 4, 7, 3, 1260, 0, 124, 'frame_cfk.png'),
(3272, 'Plastic', 200, 1, 2, 2, 1261, 0, 124, 'casing_plastic.png'),
(3273, 'Aluminum', 300, 3, 4, 4, 1261, 0, 124, 'casing_aluminum.png'),
(3274, 'CFK', 400, 8, 8, 6, 1261, 0, 124, 'casing_cfk.png'),
(3275, '1 KW', 200, 9, 0, 4, 1262, 0, 124, 'motor_1kw.png'),
(3276, '2 KW', 300, 8, 0, 7, 1262, 0, 124, 'motor_2kw.png'),
(3277, '4 KW', 600, 7, 0, 9, 1262, 0, 124, 'motor_4kw.png'),
(3278, '2x 55W Halogen', 20, 1, 3, 0, 1263, 0, 124, 'light_55w_halogen.png'),
(3279, '2x 20W Halogen R', 45, 2, 4, 0, 1263, 0, 124, 'light_20w_halogen.png'),
(3280, 'Xenon ellipsoid', 155, 2, 5, 0, 1263, 0, 124, 'light_xenon.png'),
(3281, 'Steel', 60, 0, 1, 3, 1264, 0, 124, 'wheel_steel.png'),
(3282, 'Aluminum', 100, 1, 3, 2, 1264, 0, 124, 'wheel_aluminum.png'),
(3283, 'Aluminum design', 230, 1, 5, 2, 1264, 0, 124, 'wheel_aluminum_design.png'),
(3284, 'Drum brake', 100, 0, 0, 2, 1265, 0, 124, 'brake_drum.png'),
(3285, 'Disc brake', 200, 0, 1, 5, 1265, 0, 124, 'brake_disc.png'),
(3286, 'Coil spring', 105, 0, 0, 2, 1266, 0, 124, 'absorber_spring.png'),
(3287, 'Pneumatic', 170, 0, 1, 5, 1266, 0, 124, 'absorber_Pneumatic.png'),
(3288, 'Lead-acid', 300, 5, 0, 3, 1267, 0, 124, 'accumulator_acid.png'),
(3289, 'Lithium polymer', 600, 7, 0, 5, 1267, 0, 124, 'accumulator_lithium_poli.png'),
(3290, 'Lithium-ion', 1000, 10, 0, 8, 1267, 0, 124, 'accumulator_ion.png'),
(3291, 'Plastic', 30, 0, 2, 1, 1268, 0, 125, 'seat_plastic.png'),
(3292, 'Leather', 50, 0, 3, 1, 1268, 0, 125, 'seat_leather.png'),
(3293, 'Design', 75, 0, 5, 2, 1268, 0, 125, 'seat_design.png'),
(3294, 'Steel', 40, 2, 3, 0, 1269, 0, 125, 'handle_steel.png'),
(3295, 'Aluminum', 60, 3, 5, 0, 1269, 0, 125, 'handle_aluminum.png'),
(3296, 'CFK', 200, 4, 7, 0, 1269, 0, 125, 'handle_cfk.png'),
(3297, 'Steel', 200, 2, 3, 1, 1270, 0, 125, 'frame_steel.png'),
(3298, 'Aluminum', 350, 4, 5, 2, 1270, 0, 125, 'frame_aluminum.png'),
(3299, 'CFK', 1200, 4, 7, 3, 1270, 0, 125, 'frame_cfk.png'),
(3300, 'Plastic', 200, 1, 2, 2, 1271, 0, 125, 'casing_plastic.png'),
(3301, 'Aluminum', 300, 3, 4, 4, 1271, 0, 125, 'casing_aluminum.png'),
(3302, 'CFK', 400, 8, 8, 6, 1271, 0, 125, 'casing_cfk.png'),
(3303, '1 KW', 200, 9, 0, 4, 1272, 0, 125, 'motor_1kw.png'),
(3304, '2 KW', 300, 8, 0, 7, 1272, 0, 125, 'motor_2kw.png'),
(3305, '4 KW', 600, 7, 0, 9, 1272, 0, 125, 'motor_4kw.png'),
(3306, '2x 55W Halogen', 20, 1, 3, 0, 1273, 0, 125, 'light_55w_halogen.png'),
(3307, '2x 20W Halogen R', 45, 2, 4, 0, 1273, 0, 125, 'light_20w_halogen.png'),
(3308, 'Xenon ellipsoid', 155, 2, 5, 0, 1273, 0, 125, 'light_xenon.png'),
(3309, 'Steel', 60, 0, 1, 3, 1274, 0, 125, 'wheel_steel.png'),
(3310, 'Aluminum', 100, 1, 3, 2, 1274, 0, 125, 'wheel_aluminum.png'),
(3311, 'Aluminum design', 230, 1, 5, 2, 1274, 0, 125, 'wheel_aluminum_design.png'),
(3312, 'Drum brake', 100, 0, 0, 2, 1275, 0, 125, 'brake_drum.png'),
(3313, 'Disc brake', 200, 0, 1, 5, 1275, 0, 125, 'brake_disc.png'),
(3314, 'Coil spring', 105, 0, 0, 2, 1276, 0, 125, 'absorber_spring.png'),
(3315, 'Pneumatic', 170, 0, 1, 5, 1276, 0, 125, 'absorber_Pneumatic.png'),
(3316, 'Lead-acid', 300, 5, 0, 3, 1277, 0, 125, 'accumulator_acid.png'),
(3317, 'Lithium polymer', 600, 7, 0, 5, 1277, 0, 125, 'accumulator_lithium_poli.png'),
(3318, 'Lithium-ion', 1000, 10, 0, 8, 1277, 0, 125, 'accumulator_ion.png'),
(3319, 'Plastic', 30, 0, 2, 1, 1278, 0, 125, 'seat_plastic.png'),
(3320, 'Leather', 50, 0, 3, 1, 1278, 0, 125, 'seat_leather.png'),
(3321, 'Design', 75, 0, 5, 2, 1278, 0, 125, 'seat_design.png'),
(3322, 'Steel', 40, 2, 3, 0, 1279, 0, 125, 'handle_steel.png'),
(3323, 'Aluminum', 60, 3, 5, 0, 1279, 0, 125, 'handle_aluminum.png'),
(3324, 'CFK', 200, 4, 7, 0, 1279, 0, 125, 'handle_cfk.png'),
(3325, 'Steel', 200, 2, 3, 1, 1280, 0, 125, 'frame_steel.png'),
(3326, 'Aluminum', 350, 4, 5, 2, 1280, 0, 125, 'frame_aluminum.png'),
(3327, 'CFK', 1200, 4, 7, 3, 1280, 0, 125, 'frame_cfk.png'),
(3328, 'Plastic', 200, 1, 2, 2, 1281, 0, 125, 'casing_plastic.png'),
(3329, 'Aluminum', 300, 3, 4, 4, 1281, 0, 125, 'casing_aluminum.png'),
(3330, 'CFK', 400, 8, 8, 6, 1281, 0, 125, 'casing_cfk.png'),
(3331, '1 KW', 200, 9, 0, 4, 1282, 0, 125, 'motor_1kw.png'),
(3332, '2 KW', 300, 8, 0, 7, 1282, 0, 125, 'motor_2kw.png'),
(3333, '4 KW', 600, 7, 0, 9, 1282, 0, 125, 'motor_4kw.png'),
(3334, '2x 55W Halogen', 20, 1, 3, 0, 1283, 0, 125, 'light_55w_halogen.png'),
(3335, '2x 20W Halogen R', 45, 2, 4, 0, 1283, 0, 125, 'light_20w_halogen.png'),
(3336, 'Xenon ellipsoid', 155, 2, 5, 0, 1283, 0, 125, 'light_xenon.png'),
(3337, 'Steel', 60, 0, 1, 3, 1284, 0, 125, 'wheel_steel.png'),
(3338, 'Aluminum', 100, 1, 3, 2, 1284, 0, 125, 'wheel_aluminum.png'),
(3339, 'Aluminum design', 230, 1, 5, 2, 1284, 0, 125, 'wheel_aluminum_design.png'),
(3340, 'Drum brake', 100, 0, 0, 2, 1285, 0, 125, 'brake_drum.png'),
(3341, 'Disc brake', 200, 0, 1, 5, 1285, 0, 125, 'brake_disc.png'),
(3342, 'Coil spring', 105, 0, 0, 2, 1286, 0, 125, 'absorber_spring.png'),
(3343, 'Pneumatic', 170, 0, 1, 5, 1286, 0, 125, 'absorber_Pneumatic.png'),
(3344, 'Lead-acid', 300, 5, 0, 3, 1287, 0, 125, 'accumulator_acid.png'),
(3345, 'Lithium polymer', 600, 7, 0, 5, 1287, 0, 125, 'accumulator_lithium_poli.png'),
(3346, 'Lithium-ion', 1000, 10, 0, 8, 1287, 0, 125, 'accumulator_ion.png'),
(3347, 'Plastic', 30, 0, 2, 1, 1288, 0, 125, 'seat_plastic.png'),
(3348, 'Leather', 50, 0, 3, 1, 1288, 0, 125, 'seat_leather.png'),
(3349, 'Design', 75, 0, 5, 2, 1288, 0, 125, 'seat_design.png'),
(3350, 'Steel', 40, 2, 3, 0, 1289, 0, 125, 'handle_steel.png'),
(3351, 'Aluminum', 60, 3, 5, 0, 1289, 0, 125, 'handle_aluminum.png'),
(3352, 'CFK', 200, 4, 7, 0, 1289, 0, 125, 'handle_cfk.png'),
(3353, 'Steel', 200, 2, 3, 1, 1290, 0, 125, 'frame_steel.png'),
(3354, 'Aluminum', 350, 4, 5, 2, 1290, 0, 125, 'frame_aluminum.png'),
(3355, 'CFK', 1200, 4, 7, 3, 1290, 0, 125, 'frame_cfk.png'),
(3356, 'Plastic', 200, 1, 2, 2, 1291, 0, 125, 'casing_plastic.png'),
(3357, 'Aluminum', 300, 3, 4, 4, 1291, 0, 125, 'casing_aluminum.png'),
(3358, 'CFK', 400, 8, 8, 6, 1291, 0, 125, 'casing_cfk.png'),
(3359, '1 KW', 200, 9, 0, 4, 1292, 0, 125, 'motor_1kw.png'),
(3360, '2 KW', 300, 8, 0, 7, 1292, 0, 125, 'motor_2kw.png'),
(3361, '4 KW', 600, 7, 0, 9, 1292, 0, 125, 'motor_4kw.png'),
(3362, '2x 55W Halogen', 20, 1, 3, 0, 1293, 0, 125, 'light_55w_halogen.png'),
(3363, '2x 20W Halogen R', 45, 2, 4, 0, 1293, 0, 125, 'light_20w_halogen.png'),
(3364, 'Xenon ellipsoid', 155, 2, 5, 0, 1293, 0, 125, 'light_xenon.png'),
(3365, 'Steel', 60, 0, 1, 3, 1294, 0, 125, 'wheel_steel.png'),
(3366, 'Aluminum', 100, 1, 3, 2, 1294, 0, 125, 'wheel_aluminum.png'),
(3367, 'Aluminum design', 230, 1, 5, 2, 1294, 0, 125, 'wheel_aluminum_design.png'),
(3368, 'Drum brake', 100, 0, 0, 2, 1295, 0, 125, 'brake_drum.png'),
(3369, 'Disc brake', 200, 0, 1, 5, 1295, 0, 125, 'brake_disc.png'),
(3370, 'Coil spring', 105, 0, 0, 2, 1296, 0, 125, 'absorber_spring.png'),
(3371, 'Pneumatic', 170, 0, 1, 5, 1296, 0, 125, 'absorber_Pneumatic.png'),
(3372, 'Lead-acid', 300, 5, 0, 3, 1297, 0, 125, 'accumulator_acid.png'),
(3373, 'Lithium polymer', 600, 7, 0, 5, 1297, 0, 125, 'accumulator_lithium_poli.png'),
(3374, 'Lithium-ion', 1000, 10, 0, 8, 1297, 0, 125, 'accumulator_ion.png'),
(3375, 'Plastic', 30, 0, 2, 1, 1298, 0, 125, 'seat_plastic.png'),
(3376, 'Leather', 50, 0, 3, 1, 1298, 0, 125, 'seat_leather.png'),
(3377, 'Design', 75, 0, 5, 2, 1298, 0, 125, 'seat_design.png'),
(3378, 'Steel', 40, 2, 3, 0, 1299, 0, 125, 'handle_steel.png'),
(3379, 'Aluminum', 60, 3, 5, 0, 1299, 0, 125, 'handle_aluminum.png'),
(3380, 'CFK', 200, 4, 7, 0, 1299, 0, 125, 'handle_cfk.png'),
(3381, 'Steel', 200, 2, 3, 1, 1300, 0, 125, 'frame_steel.png'),
(3382, 'Aluminum', 350, 4, 5, 2, 1300, 0, 125, 'frame_aluminum.png'),
(3383, 'CFK', 1200, 4, 7, 3, 1300, 0, 125, 'frame_cfk.png'),
(3384, 'Plastic', 200, 1, 2, 2, 1301, 0, 125, 'casing_plastic.png'),
(3385, 'Aluminum', 300, 3, 4, 4, 1301, 0, 125, 'casing_aluminum.png'),
(3386, 'CFK', 400, 8, 8, 6, 1301, 0, 125, 'casing_cfk.png'),
(3387, '1 KW', 200, 9, 0, 4, 1302, 0, 125, 'motor_1kw.png'),
(3388, '2 KW', 300, 8, 0, 7, 1302, 0, 125, 'motor_2kw.png'),
(3389, '4 KW', 600, 7, 0, 9, 1302, 0, 125, 'motor_4kw.png'),
(3390, '2x 55W Halogen', 20, 1, 3, 0, 1303, 0, 125, 'light_55w_halogen.png'),
(3391, '2x 20W Halogen R', 45, 2, 4, 0, 1303, 0, 125, 'light_20w_halogen.png'),
(3392, 'Xenon ellipsoid', 155, 2, 5, 0, 1303, 0, 125, 'light_xenon.png'),
(3393, 'Steel', 60, 0, 1, 3, 1304, 0, 125, 'wheel_steel.png'),
(3394, 'Aluminum', 100, 1, 3, 2, 1304, 0, 125, 'wheel_aluminum.png'),
(3395, 'Aluminum design', 230, 1, 5, 2, 1304, 0, 125, 'wheel_aluminum_design.png'),
(3396, 'Drum brake', 100, 0, 0, 2, 1305, 0, 125, 'brake_drum.png'),
(3397, 'Disc brake', 200, 0, 1, 5, 1305, 0, 125, 'brake_disc.png'),
(3398, 'Coil spring', 105, 0, 0, 2, 1306, 0, 125, 'absorber_spring.png'),
(3399, 'Pneumatic', 170, 0, 1, 5, 1306, 0, 125, 'absorber_Pneumatic.png'),
(3400, 'Lead-acid', 300, 5, 0, 3, 1307, 0, 125, 'accumulator_acid.png'),
(3401, 'Lithium polymer', 600, 7, 0, 5, 1307, 0, 125, 'accumulator_lithium_poli.png'),
(3402, 'Lithium-ion', 1000, 10, 0, 8, 1307, 0, 125, 'accumulator_ion.png'),
(3403, 'Plastic', 30, 0, 2, 1, 1308, 0, 125, 'seat_plastic.png'),
(3404, 'Leather', 50, 0, 3, 1, 1308, 0, 125, 'seat_leather.png'),
(3405, 'Design', 75, 0, 5, 2, 1308, 0, 125, 'seat_design.png'),
(3406, 'Steel', 40, 2, 3, 0, 1309, 0, 125, 'handle_steel.png'),
(3407, 'Aluminum', 60, 3, 5, 0, 1309, 0, 125, 'handle_aluminum.png'),
(3408, 'CFK', 200, 4, 7, 0, 1309, 0, 125, 'handle_cfk.png'),
(3409, 'Steel', 200, 2, 3, 1, 1310, 0, 125, 'frame_steel.png'),
(3410, 'Aluminum', 350, 4, 5, 2, 1310, 0, 125, 'frame_aluminum.png'),
(3411, 'CFK', 1200, 4, 7, 3, 1310, 0, 125, 'frame_cfk.png'),
(3412, 'Plastic', 200, 1, 2, 2, 1311, 0, 125, 'casing_plastic.png'),
(3413, 'Aluminum', 300, 3, 4, 4, 1311, 0, 125, 'casing_aluminum.png'),
(3414, 'CFK', 400, 8, 8, 6, 1311, 0, 125, 'casing_cfk.png'),
(3415, '1 KW', 200, 9, 0, 4, 1312, 0, 125, 'motor_1kw.png'),
(3416, '2 KW', 300, 8, 0, 7, 1312, 0, 125, 'motor_2kw.png'),
(3417, '4 KW', 600, 7, 0, 9, 1312, 0, 125, 'motor_4kw.png'),
(3418, '2x 55W Halogen', 20, 1, 3, 0, 1313, 0, 125, 'light_55w_halogen.png'),
(3419, '2x 20W Halogen R', 45, 2, 4, 0, 1313, 0, 125, 'light_20w_halogen.png'),
(3420, 'Xenon ellipsoid', 155, 2, 5, 0, 1313, 0, 125, 'light_xenon.png'),
(3421, 'Steel', 60, 0, 1, 3, 1314, 0, 125, 'wheel_steel.png'),
(3422, 'Aluminum', 100, 1, 3, 2, 1314, 0, 125, 'wheel_aluminum.png'),
(3423, 'Aluminum design', 230, 1, 5, 2, 1314, 0, 125, 'wheel_aluminum_design.png'),
(3424, 'Drum brake', 100, 0, 0, 2, 1315, 0, 125, 'brake_drum.png'),
(3425, 'Disc brake', 200, 0, 1, 5, 1315, 0, 125, 'brake_disc.png'),
(3426, 'Coil spring', 105, 0, 0, 2, 1316, 0, 125, 'absorber_spring.png'),
(3427, 'Pneumatic', 170, 0, 1, 5, 1316, 0, 125, 'absorber_Pneumatic.png'),
(3428, 'Lead-acid', 300, 5, 0, 3, 1317, 0, 125, 'accumulator_acid.png'),
(3429, 'Lithium polymer', 600, 7, 0, 5, 1317, 0, 125, 'accumulator_lithium_poli.png'),
(3430, 'Lithium-ion', 1000, 10, 0, 8, 1317, 0, 125, 'accumulator_ion.png'),
(3431, 'Plastic', 30, 0, 2, 1, 1318, 0, 126, 'seat_plastic.png'),
(3432, 'Leather', 50, 0, 3, 1, 1318, 0, 126, 'seat_leather.png'),
(3433, 'Design', 75, 0, 5, 2, 1318, 0, 126, 'seat_design.png'),
(3434, 'Steel', 40, 2, 3, 0, 1319, 0, 126, 'handle_steel.png'),
(3435, 'Aluminum', 60, 3, 5, 0, 1319, 0, 126, 'handle_aluminum.png'),
(3436, 'CFK', 200, 4, 7, 0, 1319, 0, 126, 'handle_cfk.png'),
(3437, 'Steel', 200, 2, 3, 1, 1320, 0, 126, 'frame_steel.png'),
(3438, 'Aluminum', 350, 4, 5, 2, 1320, 0, 126, 'frame_aluminum.png'),
(3439, 'CFK', 1200, 4, 7, 3, 1320, 0, 126, 'frame_cfk.png'),
(3440, 'Plastic', 200, 1, 2, 2, 1321, 0, 126, 'casing_plastic.png'),
(3441, 'Aluminum', 300, 3, 4, 4, 1321, 0, 126, 'casing_aluminum.png'),
(3442, 'CFK', 400, 8, 8, 6, 1321, 0, 126, 'casing_cfk.png'),
(3443, '1 KW', 200, 9, 0, 4, 1322, 0, 126, 'motor_1kw.png'),
(3444, '2 KW', 300, 8, 0, 7, 1322, 0, 126, 'motor_2kw.png'),
(3445, '4 KW', 600, 7, 0, 9, 1322, 0, 126, 'motor_4kw.png'),
(3446, '2x 55W Halogen', 20, 1, 3, 0, 1323, 0, 126, 'light_55w_halogen.png'),
(3447, '2x 20W Halogen R', 45, 2, 4, 0, 1323, 0, 126, 'light_20w_halogen.png'),
(3448, 'Xenon ellipsoid', 155, 2, 5, 0, 1323, 0, 126, 'light_xenon.png'),
(3449, 'Steel', 60, 0, 1, 3, 1324, 0, 126, 'wheel_steel.png'),
(3450, 'Aluminum', 100, 1, 3, 2, 1324, 0, 126, 'wheel_aluminum.png'),
(3451, 'Aluminum design', 230, 1, 5, 2, 1324, 0, 126, 'wheel_aluminum_design.png'),
(3452, 'Drum brake', 100, 0, 0, 2, 1325, 0, 126, 'brake_drum.png'),
(3453, 'Disc brake', 200, 0, 1, 5, 1325, 0, 126, 'brake_disc.png'),
(3454, 'Coil spring', 105, 0, 0, 2, 1326, 0, 126, 'absorber_spring.png'),
(3455, 'Pneumatic', 170, 0, 1, 5, 1326, 0, 126, 'absorber_Pneumatic.png'),
(3456, 'Lead-acid', 300, 5, 0, 3, 1327, 0, 126, 'accumulator_acid.png'),
(3457, 'Lithium polymer', 600, 7, 0, 5, 1327, 0, 126, 'accumulator_lithium_poli.png'),
(3458, 'Lithium-ion', 1000, 10, 0, 8, 1327, 0, 126, 'accumulator_ion.png'),
(3459, 'Plastic', 30, 0, 2, 1, 1328, 0, 126, 'seat_plastic.png'),
(3460, 'Leather', 50, 0, 3, 1, 1328, 0, 126, 'seat_leather.png'),
(3461, 'Design', 75, 0, 5, 2, 1328, 0, 126, 'seat_design.png'),
(3462, 'Steel', 40, 2, 3, 0, 1329, 0, 126, 'handle_steel.png'),
(3463, 'Aluminum', 60, 3, 5, 0, 1329, 0, 126, 'handle_aluminum.png'),
(3464, 'CFK', 200, 4, 7, 0, 1329, 0, 126, 'handle_cfk.png'),
(3465, 'Steel', 200, 2, 3, 1, 1330, 0, 126, 'frame_steel.png'),
(3466, 'Aluminum', 350, 4, 5, 2, 1330, 0, 126, 'frame_aluminum.png'),
(3467, 'CFK', 1200, 4, 7, 3, 1330, 0, 126, 'frame_cfk.png'),
(3468, 'Plastic', 200, 1, 2, 2, 1331, 0, 126, 'casing_plastic.png'),
(3469, 'Aluminum', 300, 3, 4, 4, 1331, 0, 126, 'casing_aluminum.png'),
(3470, 'CFK', 400, 8, 8, 6, 1331, 0, 126, 'casing_cfk.png'),
(3471, '1 KW', 200, 9, 0, 4, 1332, 0, 126, 'motor_1kw.png'),
(3472, '2 KW', 300, 8, 0, 7, 1332, 0, 126, 'motor_2kw.png'),
(3473, '4 KW', 600, 7, 0, 9, 1332, 0, 126, 'motor_4kw.png'),
(3474, '2x 55W Halogen', 20, 1, 3, 0, 1333, 0, 126, 'light_55w_halogen.png'),
(3475, '2x 20W Halogen R', 45, 2, 4, 0, 1333, 0, 126, 'light_20w_halogen.png'),
(3476, 'Xenon ellipsoid', 155, 2, 5, 0, 1333, 0, 126, 'light_xenon.png'),
(3477, 'Steel', 60, 0, 1, 3, 1334, 0, 126, 'wheel_steel.png'),
(3478, 'Aluminum', 100, 1, 3, 2, 1334, 0, 126, 'wheel_aluminum.png'),
(3479, 'Aluminum design', 230, 1, 5, 2, 1334, 0, 126, 'wheel_aluminum_design.png'),
(3480, 'Drum brake', 100, 0, 0, 2, 1335, 0, 126, 'brake_drum.png'),
(3481, 'Disc brake', 200, 0, 1, 5, 1335, 0, 126, 'brake_disc.png'),
(3482, 'Coil spring', 105, 0, 0, 2, 1336, 0, 126, 'absorber_spring.png'),
(3483, 'Pneumatic', 170, 0, 1, 5, 1336, 0, 126, 'absorber_Pneumatic.png'),
(3484, 'Lead-acid', 300, 5, 0, 3, 1337, 0, 126, 'accumulator_acid.png'),
(3485, 'Lithium polymer', 600, 7, 0, 5, 1337, 0, 126, 'accumulator_lithium_poli.png'),
(3486, 'Lithium-ion', 1000, 10, 0, 8, 1337, 0, 126, 'accumulator_ion.png'),
(3487, 'Plastic', 30, 0, 2, 1, 1338, 0, 126, 'seat_plastic.png'),
(3488, 'Leather', 50, 0, 3, 1, 1338, 0, 126, 'seat_leather.png'),
(3489, 'Design', 75, 0, 5, 2, 1338, 0, 126, 'seat_design.png'),
(3490, 'Steel', 40, 2, 3, 0, 1339, 0, 126, 'handle_steel.png'),
(3491, 'Aluminum', 60, 3, 5, 0, 1339, 0, 126, 'handle_aluminum.png'),
(3492, 'CFK', 200, 4, 7, 0, 1339, 0, 126, 'handle_cfk.png'),
(3493, 'Steel', 200, 2, 3, 1, 1340, 0, 126, 'frame_steel.png'),
(3494, 'Aluminum', 350, 4, 5, 2, 1340, 0, 126, 'frame_aluminum.png'),
(3495, 'CFK', 1200, 4, 7, 3, 1340, 0, 126, 'frame_cfk.png'),
(3496, 'Plastic', 200, 1, 2, 2, 1341, 0, 126, 'casing_plastic.png'),
(3497, 'Aluminum', 300, 3, 4, 4, 1341, 0, 126, 'casing_aluminum.png'),
(3498, 'CFK', 400, 8, 8, 6, 1341, 0, 126, 'casing_cfk.png'),
(3499, '1 KW', 200, 9, 0, 4, 1342, 0, 126, 'motor_1kw.png'),
(3500, '2 KW', 300, 8, 0, 7, 1342, 0, 126, 'motor_2kw.png'),
(3501, '4 KW', 600, 7, 0, 9, 1342, 0, 126, 'motor_4kw.png'),
(3502, '2x 55W Halogen', 20, 1, 3, 0, 1343, 0, 126, 'light_55w_halogen.png'),
(3503, '2x 20W Halogen R', 45, 2, 4, 0, 1343, 0, 126, 'light_20w_halogen.png'),
(3504, 'Xenon ellipsoid', 155, 2, 5, 0, 1343, 0, 126, 'light_xenon.png'),
(3505, 'Steel', 60, 0, 1, 3, 1344, 0, 126, 'wheel_steel.png'),
(3506, 'Aluminum', 100, 1, 3, 2, 1344, 0, 126, 'wheel_aluminum.png'),
(3507, 'Aluminum design', 230, 1, 5, 2, 1344, 0, 126, 'wheel_aluminum_design.png'),
(3508, 'Drum brake', 100, 0, 0, 2, 1345, 0, 126, 'brake_drum.png'),
(3509, 'Disc brake', 200, 0, 1, 5, 1345, 0, 126, 'brake_disc.png'),
(3510, 'Coil spring', 105, 0, 0, 2, 1346, 0, 126, 'absorber_spring.png'),
(3511, 'Pneumatic', 170, 0, 1, 5, 1346, 0, 126, 'absorber_Pneumatic.png'),
(3512, 'Lead-acid', 300, 5, 0, 3, 1347, 0, 126, 'accumulator_acid.png'),
(3513, 'Lithium polymer', 600, 7, 0, 5, 1347, 0, 126, 'accumulator_lithium_poli.png'),
(3514, 'Lithium-ion', 1000, 10, 0, 8, 1347, 0, 126, 'accumulator_ion.png'),
(3515, 'Plastic', 30, 0, 2, 1, 1348, 0, 126, 'seat_plastic.png'),
(3516, 'Leather', 50, 0, 3, 1, 1348, 0, 126, 'seat_leather.png'),
(3517, 'Design', 75, 0, 5, 2, 1348, 0, 126, 'seat_design.png'),
(3518, 'Steel', 40, 2, 3, 0, 1349, 0, 126, 'handle_steel.png'),
(3519, 'Aluminum', 60, 3, 5, 0, 1349, 0, 126, 'handle_aluminum.png'),
(3520, 'CFK', 200, 4, 7, 0, 1349, 0, 126, 'handle_cfk.png'),
(3521, 'Steel', 200, 2, 3, 1, 1350, 0, 126, 'frame_steel.png'),
(3522, 'Aluminum', 350, 4, 5, 2, 1350, 0, 126, 'frame_aluminum.png'),
(3523, 'CFK', 1200, 4, 7, 3, 1350, 0, 126, 'frame_cfk.png'),
(3524, 'Plastic', 200, 1, 2, 2, 1351, 0, 126, 'casing_plastic.png'),
(3525, 'Aluminum', 300, 3, 4, 4, 1351, 0, 126, 'casing_aluminum.png'),
(3526, 'CFK', 400, 8, 8, 6, 1351, 0, 126, 'casing_cfk.png'),
(3527, '1 KW', 200, 9, 0, 4, 1352, 0, 126, 'motor_1kw.png'),
(3528, '2 KW', 300, 8, 0, 7, 1352, 0, 126, 'motor_2kw.png'),
(3529, '4 KW', 600, 7, 0, 9, 1352, 0, 126, 'motor_4kw.png'),
(3530, '2x 55W Halogen', 20, 1, 3, 0, 1353, 0, 126, 'light_55w_halogen.png'),
(3531, '2x 20W Halogen R', 45, 2, 4, 0, 1353, 0, 126, 'light_20w_halogen.png'),
(3532, 'Xenon ellipsoid', 155, 2, 5, 0, 1353, 0, 126, 'light_xenon.png'),
(3533, 'Steel', 60, 0, 1, 3, 1354, 0, 126, 'wheel_steel.png'),
(3534, 'Aluminum', 100, 1, 3, 2, 1354, 0, 126, 'wheel_aluminum.png'),
(3535, 'Aluminum design', 230, 1, 5, 2, 1354, 0, 126, 'wheel_aluminum_design.png'),
(3536, 'Drum brake', 100, 0, 0, 2, 1355, 0, 126, 'brake_drum.png'),
(3537, 'Disc brake', 200, 0, 1, 5, 1355, 0, 126, 'brake_disc.png'),
(3538, 'Coil spring', 105, 0, 0, 2, 1356, 0, 126, 'absorber_spring.png'),
(3539, 'Pneumatic', 170, 0, 1, 5, 1356, 0, 126, 'absorber_Pneumatic.png'),
(3540, 'Lead-acid', 300, 5, 0, 3, 1357, 0, 126, 'accumulator_acid.png'),
(3541, 'Lithium polymer', 600, 7, 0, 5, 1357, 0, 126, 'accumulator_lithium_poli.png'),
(3542, 'Lithium-ion', 1000, 10, 0, 8, 1357, 0, 126, 'accumulator_ion.png'),
(3543, 'Plastic', 30, 0, 2, 1, 1358, 0, 127, 'seat_plastic.png'),
(3544, 'Leather', 50, 0, 3, 1, 1358, 0, 127, 'seat_leather.png'),
(3545, 'Design', 75, 0, 5, 2, 1358, 0, 127, 'seat_design.png'),
(3546, 'Steel', 40, 2, 3, 0, 1359, 0, 127, 'handle_steel.png'),
(3547, 'Aluminum', 60, 3, 5, 0, 1359, 0, 127, 'handle_aluminum.png'),
(3548, 'CFK', 200, 4, 7, 0, 1359, 0, 127, 'handle_cfk.png'),
(3549, 'Steel', 200, 2, 3, 1, 1360, 0, 127, 'frame_steel.png'),
(3550, 'Aluminum', 350, 4, 5, 2, 1360, 0, 127, 'frame_aluminum.png'),
(3551, 'CFK', 1200, 4, 7, 3, 1360, 0, 127, 'frame_cfk.png'),
(3552, 'Plastic', 200, 1, 2, 2, 1361, 0, 127, 'casing_plastic.png'),
(3553, 'Aluminum', 300, 3, 4, 4, 1361, 0, 127, 'casing_aluminum.png'),
(3554, 'CFK', 400, 8, 8, 6, 1361, 0, 127, 'casing_cfk.png'),
(3555, '1 KW', 200, 9, 0, 4, 1362, 0, 127, 'motor_1kw.png'),
(3556, '2 KW', 300, 8, 0, 7, 1362, 0, 127, 'motor_2kw.png'),
(3557, '4 KW', 600, 7, 0, 9, 1362, 0, 127, 'motor_4kw.png'),
(3558, '2x 55W Halogen', 20, 1, 3, 0, 1363, 0, 127, 'light_55w_halogen.png'),
(3559, '2x 20W Halogen R', 45, 2, 4, 0, 1363, 0, 127, 'light_20w_halogen.png'),
(3560, 'Xenon ellipsoid', 155, 2, 5, 0, 1363, 0, 127, 'light_xenon.png'),
(3561, 'Steel', 60, 0, 1, 3, 1364, 0, 127, 'wheel_steel.png'),
(3562, 'Aluminum', 100, 1, 3, 2, 1364, 0, 127, 'wheel_aluminum.png'),
(3563, 'Aluminum design', 230, 1, 5, 2, 1364, 0, 127, 'wheel_aluminum_design.png'),
(3564, 'Drum brake', 100, 0, 0, 2, 1365, 0, 127, 'brake_drum.png'),
(3565, 'Disc brake', 200, 0, 1, 5, 1365, 0, 127, 'brake_disc.png'),
(3566, 'Coil spring', 105, 0, 0, 2, 1366, 0, 127, 'absorber_spring.png'),
(3567, 'Pneumatic', 170, 0, 1, 5, 1366, 0, 127, 'absorber_Pneumatic.png'),
(3568, 'Lead-acid', 300, 5, 0, 3, 1367, 0, 127, 'accumulator_acid.png'),
(3569, 'Lithium polymer', 600, 7, 0, 5, 1367, 0, 127, 'accumulator_lithium_poli.png'),
(3570, 'Lithium-ion', 1000, 10, 0, 8, 1367, 0, 127, 'accumulator_ion.png'),
(3571, 'Plastic', 30, 0, 2, 1, 1368, 0, 127, 'seat_plastic.png'),
(3572, 'Leather', 50, 0, 3, 1, 1368, 0, 127, 'seat_leather.png'),
(3573, 'Design', 75, 0, 5, 2, 1368, 0, 127, 'seat_design.png'),
(3574, 'Steel', 40, 2, 3, 0, 1369, 0, 127, 'handle_steel.png'),
(3575, 'Aluminum', 60, 3, 5, 0, 1369, 0, 127, 'handle_aluminum.png'),
(3576, 'CFK', 200, 4, 7, 0, 1369, 0, 127, 'handle_cfk.png'),
(3577, 'Steel', 200, 2, 3, 1, 1370, 0, 127, 'frame_steel.png'),
(3578, 'Aluminum', 350, 4, 5, 2, 1370, 0, 127, 'frame_aluminum.png'),
(3579, 'CFK', 1200, 4, 7, 3, 1370, 0, 127, 'frame_cfk.png'),
(3580, 'Plastic', 200, 1, 2, 2, 1371, 0, 127, 'casing_plastic.png'),
(3581, 'Aluminum', 300, 3, 4, 4, 1371, 0, 127, 'casing_aluminum.png'),
(3582, 'CFK', 400, 8, 8, 6, 1371, 0, 127, 'casing_cfk.png'),
(3583, '1 KW', 200, 9, 0, 4, 1372, 0, 127, 'motor_1kw.png'),
(3584, '2 KW', 300, 8, 0, 7, 1372, 0, 127, 'motor_2kw.png'),
(3585, '4 KW', 600, 7, 0, 9, 1372, 0, 127, 'motor_4kw.png'),
(3586, '2x 55W Halogen', 20, 1, 3, 0, 1373, 0, 127, 'light_55w_halogen.png'),
(3587, '2x 20W Halogen R', 45, 2, 4, 0, 1373, 0, 127, 'light_20w_halogen.png'),
(3588, 'Xenon ellipsoid', 155, 2, 5, 0, 1373, 0, 127, 'light_xenon.png'),
(3589, 'Steel', 60, 0, 1, 3, 1374, 0, 127, 'wheel_steel.png'),
(3590, 'Aluminum', 100, 1, 3, 2, 1374, 0, 127, 'wheel_aluminum.png'),
(3591, 'Aluminum design', 230, 1, 5, 2, 1374, 0, 127, 'wheel_aluminum_design.png'),
(3592, 'Drum brake', 100, 0, 0, 2, 1375, 0, 127, 'brake_drum.png'),
(3593, 'Disc brake', 200, 0, 1, 5, 1375, 0, 127, 'brake_disc.png'),
(3594, 'Coil spring', 105, 0, 0, 2, 1376, 0, 127, 'absorber_spring.png'),
(3595, 'Pneumatic', 170, 0, 1, 5, 1376, 0, 127, 'absorber_Pneumatic.png'),
(3596, 'Lead-acid', 300, 5, 0, 3, 1377, 0, 127, 'accumulator_acid.png'),
(3597, 'Lithium polymer', 600, 7, 0, 5, 1377, 0, 127, 'accumulator_lithium_poli.png'),
(3598, 'Lithium-ion', 1000, 10, 0, 8, 1377, 0, 127, 'accumulator_ion.png'),
(3599, 'Plastic', 30, 0, 2, 1, 1378, 0, 127, 'seat_plastic.png'),
(3600, 'Leather', 50, 0, 3, 1, 1378, 0, 127, 'seat_leather.png'),
(3601, 'Design', 75, 0, 5, 2, 1378, 0, 127, 'seat_design.png'),
(3602, 'Steel', 40, 2, 3, 0, 1379, 0, 127, 'handle_steel.png'),
(3603, 'Aluminum', 60, 3, 5, 0, 1379, 0, 127, 'handle_aluminum.png'),
(3604, 'CFK', 200, 4, 7, 0, 1379, 0, 127, 'handle_cfk.png'),
(3605, 'Steel', 200, 2, 3, 1, 1380, 0, 127, 'frame_steel.png'),
(3606, 'Aluminum', 350, 4, 5, 2, 1380, 0, 127, 'frame_aluminum.png'),
(3607, 'CFK', 1200, 4, 7, 3, 1380, 0, 127, 'frame_cfk.png'),
(3608, 'Plastic', 200, 1, 2, 2, 1381, 0, 127, 'casing_plastic.png'),
(3609, 'Aluminum', 300, 3, 4, 4, 1381, 0, 127, 'casing_aluminum.png'),
(3610, 'CFK', 400, 8, 8, 6, 1381, 0, 127, 'casing_cfk.png'),
(3611, '1 KW', 200, 9, 0, 4, 1382, 0, 127, 'motor_1kw.png'),
(3612, '2 KW', 300, 8, 0, 7, 1382, 0, 127, 'motor_2kw.png'),
(3613, '4 KW', 600, 7, 0, 9, 1382, 0, 127, 'motor_4kw.png'),
(3614, '2x 55W Halogen', 20, 1, 3, 0, 1383, 0, 127, 'light_55w_halogen.png'),
(3615, '2x 20W Halogen R', 45, 2, 4, 0, 1383, 0, 127, 'light_20w_halogen.png'),
(3616, 'Xenon ellipsoid', 155, 2, 5, 0, 1383, 0, 127, 'light_xenon.png'),
(3617, 'Steel', 60, 0, 1, 3, 1384, 0, 127, 'wheel_steel.png'),
(3618, 'Aluminum', 100, 1, 3, 2, 1384, 0, 127, 'wheel_aluminum.png'),
(3619, 'Aluminum design', 230, 1, 5, 2, 1384, 0, 127, 'wheel_aluminum_design.png'),
(3620, 'Drum brake', 100, 0, 0, 2, 1385, 0, 127, 'brake_drum.png'),
(3621, 'Disc brake', 200, 0, 1, 5, 1385, 0, 127, 'brake_disc.png'),
(3622, 'Coil spring', 105, 0, 0, 2, 1386, 0, 127, 'absorber_spring.png'),
(3623, 'Pneumatic', 170, 0, 1, 5, 1386, 0, 127, 'absorber_Pneumatic.png'),
(3624, 'Lead-acid', 300, 5, 0, 3, 1387, 0, 127, 'accumulator_acid.png'),
(3625, 'Lithium polymer', 600, 7, 0, 5, 1387, 0, 127, 'accumulator_lithium_poli.png'),
(3626, 'Lithium-ion', 1000, 10, 0, 8, 1387, 0, 127, 'accumulator_ion.png'),
(3627, 'Plastic', 30, 0, 2, 1, 1388, 0, 127, 'seat_plastic.png'),
(3628, 'Leather', 50, 0, 3, 1, 1388, 0, 127, 'seat_leather.png'),
(3629, 'Design', 75, 0, 5, 2, 1388, 0, 127, 'seat_design.png'),
(3630, 'Steel', 40, 2, 3, 0, 1389, 0, 127, 'handle_steel.png'),
(3631, 'Aluminum', 60, 3, 5, 0, 1389, 0, 127, 'handle_aluminum.png'),
(3632, 'CFK', 200, 4, 7, 0, 1389, 0, 127, 'handle_cfk.png'),
(3633, 'Steel', 200, 2, 3, 1, 1390, 0, 127, 'frame_steel.png'),
(3634, 'Aluminum', 350, 4, 5, 2, 1390, 0, 127, 'frame_aluminum.png'),
(3635, 'CFK', 1200, 4, 7, 3, 1390, 0, 127, 'frame_cfk.png'),
(3636, 'Plastic', 200, 1, 2, 2, 1391, 0, 127, 'casing_plastic.png'),
(3637, 'Aluminum', 300, 3, 4, 4, 1391, 0, 127, 'casing_aluminum.png'),
(3638, 'CFK', 400, 8, 8, 6, 1391, 0, 127, 'casing_cfk.png'),
(3639, '1 KW', 200, 9, 0, 4, 1392, 0, 127, 'motor_1kw.png'),
(3640, '2 KW', 300, 8, 0, 7, 1392, 0, 127, 'motor_2kw.png'),
(3641, '4 KW', 600, 7, 0, 9, 1392, 0, 127, 'motor_4kw.png'),
(3642, '2x 55W Halogen', 20, 1, 3, 0, 1393, 0, 127, 'light_55w_halogen.png'),
(3643, '2x 20W Halogen R', 45, 2, 4, 0, 1393, 0, 127, 'light_20w_halogen.png'),
(3644, 'Xenon ellipsoid', 155, 2, 5, 0, 1393, 0, 127, 'light_xenon.png'),
(3645, 'Steel', 60, 0, 1, 3, 1394, 0, 127, 'wheel_steel.png'),
(3646, 'Aluminum', 100, 1, 3, 2, 1394, 0, 127, 'wheel_aluminum.png'),
(3647, 'Aluminum design', 230, 1, 5, 2, 1394, 0, 127, 'wheel_aluminum_design.png'),
(3648, 'Drum brake', 100, 0, 0, 2, 1395, 0, 127, 'brake_drum.png'),
(3649, 'Disc brake', 200, 0, 1, 5, 1395, 0, 127, 'brake_disc.png'),
(3650, 'Coil spring', 105, 0, 0, 2, 1396, 0, 127, 'absorber_spring.png'),
(3651, 'Pneumatic', 170, 0, 1, 5, 1396, 0, 127, 'absorber_Pneumatic.png'),
(3652, 'Lead-acid', 300, 5, 0, 3, 1397, 0, 127, 'accumulator_acid.png'),
(3653, 'Lithium polymer', 600, 7, 0, 5, 1397, 0, 127, 'accumulator_lithium_poli.png'),
(3654, 'Lithium-ion', 1000, 10, 0, 8, 1397, 0, 127, 'accumulator_ion.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customers`
--

CREATE TABLE IF NOT EXISTS `tbl_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `reliability` int(11) DEFAULT NULL,
  `range` int(11) DEFAULT NULL,
  `design` int(11) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  `max_price` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer_factors`
--

CREATE TABLE IF NOT EXISTS `tbl_customer_factors` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `round_id` int(11) DEFAULT '0',
  `region_id` int(11) DEFAULT NULL,
  `factor_id` float DEFAULT NULL,
  `factor_weight` double(16,2) DEFAULT '1.00',
  `factor_min_value` double(16,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17488 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_customer_factors`
--

INSERT INTO `tbl_customer_factors` (`id`, `customer_id`, `game_id`, `round_id`, `region_id`, `factor_id`, `factor_weight`, `factor_min_value`) VALUES
(1, 1, 0, 1, 1, 1, 1.00, 0.00),
(2, 1, 0, 1, 1, 2, 0.50, 0.00),
(3, 1, 0, 1, 1, 3, 1.00, 100.00),
(4, 1, 0, 1, 1, 4, 1.00, 10.00),
(5, 1, 0, 1, 1, 5, 1.00, 20.00),
(6, 2, 0, 1, 1, 1, 1.00, 0.00),
(7, 2, 0, 1, 1, 2, 1.00, 0.00),
(8, 2, 0, 1, 1, 3, 1.00, 100.00),
(9, 2, 0, 1, 1, 4, 1.00, 10.00),
(10, 2, 0, 1, 1, 5, 1.00, 20.00),
(11, 3, 0, 1, 1, 1, 1.00, 0.00),
(12, 3, 0, 1, 1, 2, 1.00, 0.00),
(13, 3, 0, 1, 1, 3, 1.00, 100.00),
(14, 3, 0, 1, 1, 4, 1.00, 10.00),
(15, 3, 0, 1, 1, 5, 1.00, 20.00),
(16, 1, 0, 1, 2, 1, 1.00, 0.00),
(17, 1, 0, 1, 2, 2, 1.00, 0.00),
(18, 1, 0, 1, 2, 3, 1.00, 100.00),
(19, 1, 0, 1, 2, 4, 1.00, 10.00),
(20, 1, 0, 1, 2, 5, 1.00, 20.00),
(21, 2, 0, 1, 2, 1, 1.00, 0.00),
(22, 2, 0, 1, 2, 2, 1.00, 0.00),
(23, 2, 0, 1, 2, 3, 1.00, 100.00),
(24, 2, 0, 1, 2, 4, 1.00, 10.00),
(25, 2, 0, 1, 2, 5, 1.00, 20.00),
(26, 3, 0, 1, 2, 1, 1.00, 0.00),
(27, 3, 0, 1, 2, 2, 1.00, 0.00),
(28, 3, 0, 1, 2, 3, 1.00, 100.00),
(29, 3, 0, 1, 2, 4, 1.00, 10.00),
(30, 3, 0, 1, 2, 5, 1.00, 20.00),
(31, 1, 0, 1, 3, 1, 1.00, 0.00),
(32, 1, 0, 1, 3, 2, 1.00, 0.00),
(33, 1, 0, 1, 3, 3, 1.00, 100.00),
(34, 1, 0, 1, 3, 4, 1.00, 10.00),
(35, 1, 0, 1, 3, 5, 1.00, 20.00),
(36, 2, 0, 1, 3, 1, 1.00, 0.00),
(37, 2, 0, 1, 3, 2, 1.00, 0.00),
(38, 2, 0, 1, 3, 3, 1.00, 100.00),
(39, 2, 0, 1, 3, 4, 1.00, 10.00),
(40, 2, 0, 1, 3, 5, 1.00, 20.00),
(41, 3, 0, 1, 3, 1, 1.00, 0.00),
(42, 3, 0, 1, 3, 2, 1.00, 0.00),
(43, 3, 0, 1, 3, 3, 1.00, 100.00),
(44, 3, 0, 1, 3, 4, 1.00, 10.00),
(45, 3, 0, 1, 3, 5, 1.00, 20.00),
(46, 1, 0, 1, 4, 1, 2.00, 0.00),
(47, 1, 0, 1, 4, 2, 1.00, 0.00),
(48, 1, 0, 1, 4, 3, 1.00, 100.00),
(49, 1, 0, 1, 4, 4, 1.00, 10.00),
(50, 1, 0, 1, 4, 5, 1.00, 20.00),
(51, 2, 0, 1, 4, 1, 1.00, 0.00),
(52, 2, 0, 1, 4, 2, 1.00, 0.00),
(53, 2, 0, 1, 4, 3, 1.00, 100.00),
(54, 2, 0, 1, 4, 4, 1.00, 10.00),
(55, 2, 0, 1, 4, 5, 1.00, 20.00),
(56, 3, 0, 1, 4, 1, 1.00, 0.00),
(57, 3, 0, 1, 4, 2, 1.00, 0.00),
(58, 3, 0, 1, 4, 3, 1.00, 100.00),
(59, 3, 0, 1, 4, 4, 1.00, 10.00),
(60, 3, 0, 1, 4, 5, 1.00, 20.00),
(61, 1, 0, 1, 1, 6, 1.00, 10.00),
(62, 2, 0, 1, 1, 6, 1.00, 10.00),
(63, 3, 0, 1, 1, 6, 1.00, 10.00),
(64, 1, 0, 1, 2, 6, 1.00, 10.00),
(65, 2, 0, 1, 2, 6, 1.00, 10.00),
(66, 3, 0, 1, 2, 6, 1.00, 10.00),
(67, 1, 0, 1, 3, 6, 1.00, 10.00),
(68, 2, 0, 1, 3, 6, 1.00, 10.00),
(69, 3, 0, 1, 3, 6, 1.00, 10.00),
(70, 1, 0, 1, 4, 6, 1.00, 10.00),
(71, 2, 0, 1, 4, 6, 1.00, 10.00),
(72, 3, 0, 1, 4, 6, 1.00, 10.00),
(6687, 1, NULL, 1, 4, 1, 1.00, NULL),
(6688, 1, NULL, 1, 4, 2, 1.00, NULL),
(6689, 1, NULL, 1, 4, 3, 1.00, 100.00),
(6690, 1, NULL, 1, 4, 4, 1.00, 10.00),
(6691, 1, NULL, 1, 4, 5, 1.00, 20.00),
(6692, 1, NULL, 1, 4, 6, 1.00, 10.00),
(6693, 2, NULL, 1, 4, 1, 1.00, NULL),
(6694, 2, NULL, 1, 4, 2, 1.00, NULL),
(6695, 2, NULL, 1, 4, 3, 1.00, 100.00),
(6696, 2, NULL, 1, 4, 4, 1.00, 10.00),
(6697, 2, NULL, 1, 4, 5, 1.00, 20.00),
(6698, 2, NULL, 1, 4, 6, 1.00, 10.00),
(6699, 3, NULL, 1, 4, 1, 1.00, NULL),
(6700, 3, NULL, 1, 4, 2, 1.00, NULL),
(6701, 3, NULL, 1, 4, 3, 1.00, 100.00),
(6702, 3, NULL, 1, 4, 4, 1.00, 10.00),
(6703, 3, NULL, 1, 4, 5, 1.00, 20.00),
(6704, 3, NULL, 1, 4, 6, 0.00, 0.00),
(6705, 1, NULL, 1, 2, 1, 1.00, NULL),
(6706, 1, NULL, 1, 2, 2, 1.00, NULL),
(6707, 1, NULL, 1, 2, 3, 1.00, 100.00),
(6708, 1, NULL, 1, 2, 4, 1.00, 10.00),
(6709, 1, NULL, 1, 2, 5, 1.00, 20.00),
(6710, 1, NULL, 1, 2, 6, 1.00, 10.00),
(6711, 2, NULL, 1, 2, 1, 1.00, NULL),
(6712, 2, NULL, 1, 2, 2, 1.00, NULL),
(6713, 2, NULL, 1, 2, 3, 1.00, 100.00),
(6714, 2, NULL, 1, 2, 4, 1.00, 10.00),
(6715, 2, NULL, 1, 2, 5, 1.00, 20.00),
(6716, 2, NULL, 1, 2, 6, 1.00, 10.00),
(6717, 3, NULL, 1, 2, 1, 1.00, NULL),
(6718, 3, NULL, 1, 2, 2, 1.00, NULL),
(6719, 3, NULL, 1, 2, 3, 1.00, 100.00),
(6720, 3, NULL, 1, 2, 4, 1.00, 10.00),
(6721, 3, NULL, 1, 2, 5, 1.00, 20.00),
(6722, 3, NULL, 1, 2, 6, 1.00, 10.00),
(6723, 1, NULL, 1, 3, 1, 1.00, NULL),
(6724, 1, NULL, 1, 3, 2, 1.00, NULL),
(6725, 1, NULL, 1, 3, 3, 1.00, 100.00),
(6726, 1, NULL, 1, 3, 4, 1.00, 10.00),
(6727, 1, NULL, 1, 3, 5, 1.00, 20.00),
(6728, 1, NULL, 1, 3, 6, 1.00, 10.00),
(6729, 2, NULL, 1, 3, 1, 1.00, NULL),
(6730, 2, NULL, 1, 3, 2, 1.00, NULL),
(6731, 2, NULL, 1, 3, 3, 1.00, 100.00),
(6732, 2, NULL, 1, 3, 4, 1.00, 10.00),
(6733, 2, NULL, 1, 3, 5, 1.00, 20.00),
(6734, 2, NULL, 1, 3, 6, 1.00, 10.00),
(6735, 3, NULL, 1, 3, 1, 1.00, NULL),
(6736, 3, NULL, 1, 3, 2, 1.00, NULL),
(6737, 3, NULL, 1, 3, 3, 1.00, 100.00),
(6738, 3, NULL, 1, 3, 4, 1.00, 10.00),
(6739, 3, NULL, 1, 3, 5, 1.00, 20.00),
(6740, 3, NULL, 1, 3, 6, 1.00, 10.00),
(6741, 1, NULL, 1, 1, 1, 1.00, NULL),
(6742, 1, NULL, 1, 1, 2, 0.50, NULL),
(6743, 1, NULL, 1, 1, 3, 1.00, 100.00),
(6744, 1, NULL, 1, 1, 4, 1.00, 10.00),
(6745, 1, NULL, 1, 1, 5, 1.00, 20.00),
(6746, 1, NULL, 1, 1, 6, 1.00, 10.00),
(6747, 2, NULL, 1, 1, 1, 1.00, NULL),
(6748, 2, NULL, 1, 1, 2, 1.00, NULL),
(6749, 2, NULL, 1, 1, 3, 1.00, 100.00),
(6750, 2, NULL, 1, 1, 4, 1.00, 10.00),
(6751, 2, NULL, 1, 1, 5, 1.00, 20.00),
(6752, 2, NULL, 1, 1, 6, 1.00, 10.00),
(6753, 3, NULL, 1, 1, 1, 1.00, NULL),
(6754, 3, NULL, 1, 1, 2, 1.00, NULL),
(6755, 3, NULL, 1, 1, 3, 1.00, 100.00),
(6756, 3, NULL, 1, 1, 4, 1.00, 10.00),
(6757, 3, NULL, 1, 1, 5, 1.00, 20.00),
(6758, 3, NULL, 1, 1, 6, 1.00, 10.00),
(16408, 1, 246, 1, 4, 1, 2.00, 0.00),
(16409, 1, 246, 1, 4, 2, 1.00, 0.00),
(16410, 1, 246, 1, 4, 3, 1.00, 100.00),
(16411, 1, 246, 1, 4, 4, 1.00, 10.00),
(16412, 1, 246, 1, 4, 5, 1.00, 20.00),
(16413, 1, 246, 1, 4, 6, 1.00, 10.00),
(16414, 2, 246, 1, 4, 1, 1.00, 0.00),
(16415, 2, 246, 1, 4, 2, 1.00, 0.00),
(16416, 2, 246, 1, 4, 3, 1.00, 100.00),
(16417, 2, 246, 1, 4, 4, 1.00, 10.00),
(16418, 2, 246, 1, 4, 5, 1.00, 20.00),
(16419, 2, 246, 1, 4, 6, 1.00, 10.00),
(16420, 3, 246, 1, 4, 1, 1.00, 0.00),
(16421, 3, 246, 1, 4, 2, 1.00, 0.00),
(16422, 3, 246, 1, 4, 3, 1.00, 100.00),
(16423, 3, 246, 1, 4, 4, 1.00, 10.00),
(16424, 3, 246, 1, 4, 5, 1.00, 20.00),
(16425, 3, 246, 1, 4, 6, 1.00, 10.00),
(16426, 1, 246, 1, 2, 1, 1.00, 0.00),
(16427, 1, 246, 1, 2, 2, 1.00, 0.00),
(16428, 1, 246, 1, 2, 3, 1.00, 100.00),
(16429, 1, 246, 1, 2, 4, 1.00, 10.00),
(16430, 1, 246, 1, 2, 5, 1.00, 20.00),
(16431, 1, 246, 1, 2, 6, 1.00, 10.00),
(16432, 2, 246, 1, 2, 1, 1.00, 0.00),
(16433, 2, 246, 1, 2, 2, 1.00, 0.00),
(16434, 2, 246, 1, 2, 3, 1.00, 100.00),
(16435, 2, 246, 1, 2, 4, 1.00, 10.00),
(16436, 2, 246, 1, 2, 5, 1.00, 20.00),
(16437, 2, 246, 1, 2, 6, 1.00, 10.00),
(16438, 3, 246, 1, 2, 1, 1.00, 0.00),
(16439, 3, 246, 1, 2, 2, 1.00, 0.00),
(16440, 3, 246, 1, 2, 3, 1.00, 100.00),
(16441, 3, 246, 1, 2, 4, 1.00, 10.00),
(16442, 3, 246, 1, 2, 5, 1.00, 20.00),
(16443, 3, 246, 1, 2, 6, 1.00, 10.00),
(16444, 1, 246, 1, 3, 1, 1.00, 0.00),
(16445, 1, 246, 1, 3, 2, 1.00, 0.00),
(16446, 1, 246, 1, 3, 3, 1.00, 100.00),
(16447, 1, 246, 1, 3, 4, 1.00, 10.00),
(16448, 1, 246, 1, 3, 5, 1.00, 20.00),
(16449, 1, 246, 1, 3, 6, 1.00, 10.00),
(16450, 2, 246, 1, 3, 1, 1.00, 0.00),
(16451, 2, 246, 1, 3, 2, 1.00, 0.00),
(16452, 2, 246, 1, 3, 3, 1.00, 100.00),
(16453, 2, 246, 1, 3, 4, 1.00, 10.00),
(16454, 2, 246, 1, 3, 5, 1.00, 20.00),
(16455, 2, 246, 1, 3, 6, 1.00, 10.00),
(16456, 3, 246, 1, 3, 1, 1.00, 0.00),
(16457, 3, 246, 1, 3, 2, 1.00, 0.00),
(16458, 3, 246, 1, 3, 3, 1.00, 100.00),
(16459, 3, 246, 1, 3, 4, 1.00, 10.00),
(16460, 3, 246, 1, 3, 5, 1.00, 20.00),
(16461, 3, 246, 1, 3, 6, 1.00, 10.00),
(16462, 1, 246, 1, 1, 1, 1.00, 0.00),
(16463, 1, 246, 1, 1, 2, 0.50, 0.00),
(16464, 1, 246, 1, 1, 3, 1.00, 100.00),
(16465, 1, 246, 1, 1, 4, 1.00, 10.00),
(16466, 1, 246, 1, 1, 5, 1.00, 20.00),
(16467, 1, 246, 1, 1, 6, 1.00, 10.00),
(16468, 2, 246, 1, 1, 1, 1.00, 0.00),
(16469, 2, 246, 1, 1, 2, 1.00, 0.00),
(16470, 2, 246, 1, 1, 3, 1.00, 100.00),
(16471, 2, 246, 1, 1, 4, 1.00, 10.00),
(16472, 2, 246, 1, 1, 5, 1.00, 20.00),
(16473, 2, 246, 1, 1, 6, 1.00, 10.00),
(16474, 3, 246, 1, 1, 1, 1.00, 0.00),
(16475, 3, 246, 1, 1, 2, 1.00, 0.00),
(16476, 3, 246, 1, 1, 3, 1.00, 100.00),
(16477, 3, 246, 1, 1, 4, 1.00, 10.00),
(16478, 3, 246, 1, 1, 5, 1.00, 20.00),
(16479, 3, 246, 1, 1, 6, 1.00, 10.00),
(16480, 1, 246, 2, 4, 1, 2.00, 0.00),
(16481, 1, 246, 2, 4, 2, 1.00, 0.00),
(16482, 1, 246, 2, 4, 3, 1.00, 100.00),
(16483, 1, 246, 2, 4, 4, 1.00, 10.00),
(16484, 1, 246, 2, 4, 5, 1.00, 20.00),
(16485, 1, 246, 2, 4, 6, 1.00, 10.00),
(16486, 2, 246, 2, 4, 1, 1.00, 0.00),
(16487, 2, 246, 2, 4, 2, 1.00, 0.00),
(16488, 2, 246, 2, 4, 3, 1.00, 100.00),
(16489, 2, 246, 2, 4, 4, 1.00, 10.00),
(16490, 2, 246, 2, 4, 5, 1.00, 20.00),
(16491, 2, 246, 2, 4, 6, 1.00, 10.00),
(16492, 3, 246, 2, 4, 1, 1.00, 0.00),
(16493, 3, 246, 2, 4, 2, 1.00, 0.00),
(16494, 3, 246, 2, 4, 3, 1.00, 100.00),
(16495, 3, 246, 2, 4, 4, 1.00, 10.00),
(16496, 3, 246, 2, 4, 5, 1.00, 20.00),
(16497, 3, 246, 2, 4, 6, 1.00, 10.00),
(16498, 1, 246, 2, 2, 1, 1.00, 0.00),
(16499, 1, 246, 2, 2, 2, 1.00, 0.00),
(16500, 1, 246, 2, 2, 3, 1.00, 100.00),
(16501, 1, 246, 2, 2, 4, 1.00, 10.00),
(16502, 1, 246, 2, 2, 5, 1.00, 20.00),
(16503, 1, 246, 2, 2, 6, 1.00, 10.00),
(16504, 2, 246, 2, 2, 1, 1.00, 0.00),
(16505, 2, 246, 2, 2, 2, 1.00, 0.00),
(16506, 2, 246, 2, 2, 3, 1.00, 100.00),
(16507, 2, 246, 2, 2, 4, 1.00, 10.00),
(16508, 2, 246, 2, 2, 5, 1.00, 20.00),
(16509, 2, 246, 2, 2, 6, 1.00, 10.00),
(16510, 3, 246, 2, 2, 1, 1.00, 0.00),
(16511, 3, 246, 2, 2, 2, 1.00, 0.00),
(16512, 3, 246, 2, 2, 3, 1.00, 100.00),
(16513, 3, 246, 2, 2, 4, 1.00, 10.00),
(16514, 3, 246, 2, 2, 5, 1.00, 20.00),
(16515, 3, 246, 2, 2, 6, 1.00, 10.00),
(16516, 1, 246, 2, 3, 1, 1.00, 0.00),
(16517, 1, 246, 2, 3, 2, 1.00, 0.00),
(16518, 1, 246, 2, 3, 3, 1.00, 100.00),
(16519, 1, 246, 2, 3, 4, 1.00, 10.00),
(16520, 1, 246, 2, 3, 5, 1.00, 20.00),
(16521, 1, 246, 2, 3, 6, 1.00, 10.00),
(16522, 2, 246, 2, 3, 1, 1.00, 0.00),
(16523, 2, 246, 2, 3, 2, 1.00, 0.00),
(16524, 2, 246, 2, 3, 3, 1.00, 100.00),
(16525, 2, 246, 2, 3, 4, 1.00, 10.00),
(16526, 2, 246, 2, 3, 5, 1.00, 20.00),
(16527, 2, 246, 2, 3, 6, 1.00, 10.00),
(16528, 3, 246, 2, 3, 1, 1.00, 0.00),
(16529, 3, 246, 2, 3, 2, 1.00, 0.00),
(16530, 3, 246, 2, 3, 3, 1.00, 100.00),
(16531, 3, 246, 2, 3, 4, 1.00, 10.00),
(16532, 3, 246, 2, 3, 5, 1.00, 20.00),
(16533, 3, 246, 2, 3, 6, 1.00, 10.00),
(16534, 1, 246, 2, 1, 1, 1.00, 0.00),
(16535, 1, 246, 2, 1, 2, 0.50, 0.00),
(16536, 1, 246, 2, 1, 3, 1.00, 100.00),
(16537, 1, 246, 2, 1, 4, 1.00, 10.00),
(16538, 1, 246, 2, 1, 5, 1.00, 20.00),
(16539, 1, 246, 2, 1, 6, 1.00, 10.00),
(16540, 2, 246, 2, 1, 1, 1.00, 0.00),
(16541, 2, 246, 2, 1, 2, 1.00, 0.00),
(16542, 2, 246, 2, 1, 3, 1.00, 100.00),
(16543, 2, 246, 2, 1, 4, 1.00, 10.00),
(16544, 2, 246, 2, 1, 5, 1.00, 20.00),
(16545, 2, 246, 2, 1, 6, 1.00, 10.00),
(16546, 3, 246, 2, 1, 1, 1.00, 0.00),
(16547, 3, 246, 2, 1, 2, 1.00, 0.00),
(16548, 3, 246, 2, 1, 3, 1.00, 100.00),
(16549, 3, 246, 2, 1, 4, 1.00, 10.00),
(16550, 3, 246, 2, 1, 5, 1.00, 20.00),
(16551, 3, 246, 2, 1, 6, 1.00, 10.00),
(16552, 1, 246, 3, 4, 1, 2.00, 0.00),
(16553, 1, 246, 3, 4, 2, 1.00, 0.00),
(16554, 1, 246, 3, 4, 3, 1.00, 100.00),
(16555, 1, 246, 3, 4, 4, 1.00, 10.00),
(16556, 1, 246, 3, 4, 5, 1.00, 20.00),
(16557, 1, 246, 3, 4, 6, 1.00, 10.00),
(16558, 2, 246, 3, 4, 1, 1.00, 0.00),
(16559, 2, 246, 3, 4, 2, 1.00, 0.00),
(16560, 2, 246, 3, 4, 3, 1.00, 100.00),
(16561, 2, 246, 3, 4, 4, 1.00, 10.00),
(16562, 2, 246, 3, 4, 5, 1.00, 20.00),
(16563, 2, 246, 3, 4, 6, 1.00, 10.00),
(16564, 3, 246, 3, 4, 1, 1.00, 0.00),
(16565, 3, 246, 3, 4, 2, 1.00, 0.00),
(16566, 3, 246, 3, 4, 3, 1.00, 100.00),
(16567, 3, 246, 3, 4, 4, 1.00, 10.00),
(16568, 3, 246, 3, 4, 5, 1.00, 20.00),
(16569, 3, 246, 3, 4, 6, 1.00, 10.00),
(16570, 1, 246, 3, 2, 1, 1.00, 0.00),
(16571, 1, 246, 3, 2, 2, 1.00, 0.00),
(16572, 1, 246, 3, 2, 3, 1.00, 100.00),
(16573, 1, 246, 3, 2, 4, 1.00, 10.00),
(16574, 1, 246, 3, 2, 5, 1.00, 20.00),
(16575, 1, 246, 3, 2, 6, 1.00, 10.00),
(16576, 2, 246, 3, 2, 1, 1.00, 0.00),
(16577, 2, 246, 3, 2, 2, 1.00, 0.00),
(16578, 2, 246, 3, 2, 3, 1.00, 100.00),
(16579, 2, 246, 3, 2, 4, 1.00, 10.00),
(16580, 2, 246, 3, 2, 5, 1.00, 20.00),
(16581, 2, 246, 3, 2, 6, 1.00, 10.00),
(16582, 3, 246, 3, 2, 1, 1.00, 0.00),
(16583, 3, 246, 3, 2, 2, 1.00, 0.00),
(16584, 3, 246, 3, 2, 3, 1.00, 100.00),
(16585, 3, 246, 3, 2, 4, 1.00, 10.00),
(16586, 3, 246, 3, 2, 5, 1.00, 20.00),
(16587, 3, 246, 3, 2, 6, 1.00, 10.00),
(16588, 1, 246, 3, 3, 1, 1.00, 0.00),
(16589, 1, 246, 3, 3, 2, 1.00, 0.00),
(16590, 1, 246, 3, 3, 3, 1.00, 100.00),
(16591, 1, 246, 3, 3, 4, 1.00, 10.00),
(16592, 1, 246, 3, 3, 5, 1.00, 20.00),
(16593, 1, 246, 3, 3, 6, 1.00, 10.00),
(16594, 2, 246, 3, 3, 1, 1.00, 0.00),
(16595, 2, 246, 3, 3, 2, 1.00, 0.00),
(16596, 2, 246, 3, 3, 3, 1.00, 100.00),
(16597, 2, 246, 3, 3, 4, 1.00, 10.00),
(16598, 2, 246, 3, 3, 5, 1.00, 20.00),
(16599, 2, 246, 3, 3, 6, 1.00, 10.00),
(16600, 3, 246, 3, 3, 1, 1.00, 0.00),
(16601, 3, 246, 3, 3, 2, 1.00, 0.00),
(16602, 3, 246, 3, 3, 3, 1.00, 100.00),
(16603, 3, 246, 3, 3, 4, 1.00, 10.00),
(16604, 3, 246, 3, 3, 5, 1.00, 20.00),
(16605, 3, 246, 3, 3, 6, 1.00, 10.00),
(16606, 1, 246, 3, 1, 1, 1.00, 0.00),
(16607, 1, 246, 3, 1, 2, 0.50, 0.00),
(16608, 1, 246, 3, 1, 3, 1.00, 100.00),
(16609, 1, 246, 3, 1, 4, 1.00, 10.00),
(16610, 1, 246, 3, 1, 5, 1.00, 20.00),
(16611, 1, 246, 3, 1, 6, 1.00, 10.00),
(16612, 2, 246, 3, 1, 1, 1.00, 0.00),
(16613, 2, 246, 3, 1, 2, 1.00, 0.00),
(16614, 2, 246, 3, 1, 3, 1.00, 100.00),
(16615, 2, 246, 3, 1, 4, 1.00, 10.00),
(16616, 2, 246, 3, 1, 5, 1.00, 20.00),
(16617, 2, 246, 3, 1, 6, 1.00, 10.00),
(16618, 3, 246, 3, 1, 1, 1.00, 0.00),
(16619, 3, 246, 3, 1, 2, 1.00, 0.00),
(16620, 3, 246, 3, 1, 3, 1.00, 100.00),
(16621, 3, 246, 3, 1, 4, 1.00, 10.00),
(16622, 3, 246, 3, 1, 5, 1.00, 20.00),
(16623, 3, 246, 3, 1, 6, 1.00, 10.00),
(16624, 1, 246, 4, 4, 1, 2.00, 0.00),
(16625, 1, 246, 4, 4, 2, 1.00, 0.00),
(16626, 1, 246, 4, 4, 3, 1.00, 100.00),
(16627, 1, 246, 4, 4, 4, 1.00, 10.00),
(16628, 1, 246, 4, 4, 5, 1.00, 20.00),
(16629, 1, 246, 4, 4, 6, 1.00, 10.00),
(16630, 2, 246, 4, 4, 1, 1.00, 0.00),
(16631, 2, 246, 4, 4, 2, 1.00, 0.00),
(16632, 2, 246, 4, 4, 3, 1.00, 100.00),
(16633, 2, 246, 4, 4, 4, 1.00, 10.00),
(16634, 2, 246, 4, 4, 5, 1.00, 20.00),
(16635, 2, 246, 4, 4, 6, 1.00, 10.00),
(16636, 3, 246, 4, 4, 1, 1.00, 0.00),
(16637, 3, 246, 4, 4, 2, 1.00, 0.00),
(16638, 3, 246, 4, 4, 3, 1.00, 100.00),
(16639, 3, 246, 4, 4, 4, 1.00, 10.00),
(16640, 3, 246, 4, 4, 5, 1.00, 20.00),
(16641, 3, 246, 4, 4, 6, 1.00, 10.00),
(16642, 1, 246, 4, 2, 1, 1.00, 0.00),
(16643, 1, 246, 4, 2, 2, 1.00, 0.00),
(16644, 1, 246, 4, 2, 3, 1.00, 100.00),
(16645, 1, 246, 4, 2, 4, 1.00, 10.00),
(16646, 1, 246, 4, 2, 5, 1.00, 20.00),
(16647, 1, 246, 4, 2, 6, 1.00, 10.00),
(16648, 2, 246, 4, 2, 1, 1.00, 0.00),
(16649, 2, 246, 4, 2, 2, 1.00, 0.00),
(16650, 2, 246, 4, 2, 3, 1.00, 100.00),
(16651, 2, 246, 4, 2, 4, 1.00, 10.00),
(16652, 2, 246, 4, 2, 5, 1.00, 20.00),
(16653, 2, 246, 4, 2, 6, 1.00, 10.00),
(16654, 3, 246, 4, 2, 1, 1.00, 0.00),
(16655, 3, 246, 4, 2, 2, 1.00, 0.00),
(16656, 3, 246, 4, 2, 3, 1.00, 100.00),
(16657, 3, 246, 4, 2, 4, 1.00, 10.00),
(16658, 3, 246, 4, 2, 5, 1.00, 20.00),
(16659, 3, 246, 4, 2, 6, 1.00, 10.00),
(16660, 1, 246, 4, 3, 1, 1.00, 0.00),
(16661, 1, 246, 4, 3, 2, 1.00, 0.00),
(16662, 1, 246, 4, 3, 3, 1.00, 100.00),
(16663, 1, 246, 4, 3, 4, 1.00, 10.00),
(16664, 1, 246, 4, 3, 5, 1.00, 20.00),
(16665, 1, 246, 4, 3, 6, 1.00, 10.00),
(16666, 2, 246, 4, 3, 1, 1.00, 0.00),
(16667, 2, 246, 4, 3, 2, 1.00, 0.00),
(16668, 2, 246, 4, 3, 3, 1.00, 100.00),
(16669, 2, 246, 4, 3, 4, 1.00, 10.00),
(16670, 2, 246, 4, 3, 5, 1.00, 20.00),
(16671, 2, 246, 4, 3, 6, 1.00, 10.00),
(16672, 3, 246, 4, 3, 1, 1.00, 0.00),
(16673, 3, 246, 4, 3, 2, 1.00, 0.00),
(16674, 3, 246, 4, 3, 3, 1.00, 100.00),
(16675, 3, 246, 4, 3, 4, 1.00, 10.00),
(16676, 3, 246, 4, 3, 5, 1.00, 20.00),
(16677, 3, 246, 4, 3, 6, 1.00, 10.00),
(16678, 1, 246, 4, 1, 1, 1.00, 0.00),
(16679, 1, 246, 4, 1, 2, 0.50, 0.00),
(16680, 1, 246, 4, 1, 3, 1.00, 100.00),
(16681, 1, 246, 4, 1, 4, 1.00, 10.00),
(16682, 1, 246, 4, 1, 5, 1.00, 20.00),
(16683, 1, 246, 4, 1, 6, 1.00, 10.00),
(16684, 2, 246, 4, 1, 1, 1.00, 0.00),
(16685, 2, 246, 4, 1, 2, 1.00, 0.00),
(16686, 2, 246, 4, 1, 3, 1.00, 100.00),
(16687, 2, 246, 4, 1, 4, 1.00, 10.00),
(16688, 2, 246, 4, 1, 5, 1.00, 20.00),
(16689, 2, 246, 4, 1, 6, 1.00, 10.00),
(16690, 3, 246, 4, 1, 1, 1.00, 0.00),
(16691, 3, 246, 4, 1, 2, 1.00, 0.00),
(16692, 3, 246, 4, 1, 3, 1.00, 100.00),
(16693, 3, 246, 4, 1, 4, 1.00, 10.00),
(16694, 3, 246, 4, 1, 5, 1.00, 20.00),
(16695, 3, 246, 4, 1, 6, 1.00, 10.00),
(16696, 1, 247, 1, 4, 1, 2.00, 0.00),
(16697, 1, 247, 1, 4, 2, 1.00, 0.00),
(16698, 1, 247, 1, 4, 3, 1.00, 100.00),
(16699, 1, 247, 1, 4, 4, 1.00, 10.00),
(16700, 1, 247, 1, 4, 5, 1.00, 20.00),
(16701, 1, 247, 1, 4, 6, 1.00, 10.00),
(16702, 2, 247, 1, 4, 1, 1.00, 0.00),
(16703, 2, 247, 1, 4, 2, 1.00, 0.00),
(16704, 2, 247, 1, 4, 3, 1.00, 100.00),
(16705, 2, 247, 1, 4, 4, 1.00, 10.00),
(16706, 2, 247, 1, 4, 5, 1.00, 20.00),
(16707, 2, 247, 1, 4, 6, 1.00, 10.00),
(16708, 3, 247, 1, 4, 1, 1.00, 0.00),
(16709, 3, 247, 1, 4, 2, 1.00, 0.00),
(16710, 3, 247, 1, 4, 3, 1.00, 100.00),
(16711, 3, 247, 1, 4, 4, 1.00, 10.00),
(16712, 3, 247, 1, 4, 5, 1.00, 20.00),
(16713, 3, 247, 1, 4, 6, 1.00, 10.00),
(16714, 1, 247, 1, 2, 1, 1.00, 0.00),
(16715, 1, 247, 1, 2, 2, 1.00, 0.00),
(16716, 1, 247, 1, 2, 3, 1.00, 100.00),
(16717, 1, 247, 1, 2, 4, 1.00, 10.00),
(16718, 1, 247, 1, 2, 5, 1.00, 20.00),
(16719, 1, 247, 1, 2, 6, 1.00, 10.00),
(16720, 2, 247, 1, 2, 1, 1.00, 0.00),
(16721, 2, 247, 1, 2, 2, 1.00, 0.00),
(16722, 2, 247, 1, 2, 3, 1.00, 100.00),
(16723, 2, 247, 1, 2, 4, 1.00, 10.00),
(16724, 2, 247, 1, 2, 5, 1.00, 20.00),
(16725, 2, 247, 1, 2, 6, 1.00, 10.00),
(16726, 3, 247, 1, 2, 1, 1.00, 0.00),
(16727, 3, 247, 1, 2, 2, 1.00, 0.00),
(16728, 3, 247, 1, 2, 3, 1.00, 100.00),
(16729, 3, 247, 1, 2, 4, 1.00, 10.00),
(16730, 3, 247, 1, 2, 5, 1.00, 20.00),
(16731, 3, 247, 1, 2, 6, 1.00, 10.00),
(16732, 1, 247, 1, 3, 1, 1.00, 0.00),
(16733, 1, 247, 1, 3, 2, 1.00, 0.00),
(16734, 1, 247, 1, 3, 3, 1.00, 100.00),
(16735, 1, 247, 1, 3, 4, 1.00, 10.00),
(16736, 1, 247, 1, 3, 5, 1.00, 20.00),
(16737, 1, 247, 1, 3, 6, 1.00, 10.00),
(16738, 2, 247, 1, 3, 1, 1.00, 0.00),
(16739, 2, 247, 1, 3, 2, 1.00, 0.00),
(16740, 2, 247, 1, 3, 3, 1.00, 100.00),
(16741, 2, 247, 1, 3, 4, 1.00, 10.00),
(16742, 2, 247, 1, 3, 5, 1.00, 20.00),
(16743, 2, 247, 1, 3, 6, 1.00, 10.00),
(16744, 3, 247, 1, 3, 1, 1.00, 0.00),
(16745, 3, 247, 1, 3, 2, 1.00, 0.00),
(16746, 3, 247, 1, 3, 3, 1.00, 100.00),
(16747, 3, 247, 1, 3, 4, 1.00, 10.00),
(16748, 3, 247, 1, 3, 5, 1.00, 20.00),
(16749, 3, 247, 1, 3, 6, 1.00, 10.00),
(16750, 1, 247, 1, 1, 1, 1.00, 0.00),
(16751, 1, 247, 1, 1, 2, 0.50, 0.00),
(16752, 1, 247, 1, 1, 3, 1.00, 100.00),
(16753, 1, 247, 1, 1, 4, 1.00, 10.00),
(16754, 1, 247, 1, 1, 5, 1.00, 20.00),
(16755, 1, 247, 1, 1, 6, 1.00, 10.00),
(16756, 2, 247, 1, 1, 1, 1.00, 0.00),
(16757, 2, 247, 1, 1, 2, 1.00, 0.00),
(16758, 2, 247, 1, 1, 3, 1.00, 100.00),
(16759, 2, 247, 1, 1, 4, 1.00, 10.00),
(16760, 2, 247, 1, 1, 5, 1.00, 20.00),
(16761, 2, 247, 1, 1, 6, 1.00, 10.00),
(16762, 3, 247, 1, 1, 1, 1.00, 0.00),
(16763, 3, 247, 1, 1, 2, 1.00, 0.00),
(16764, 3, 247, 1, 1, 3, 1.00, 100.00),
(16765, 3, 247, 1, 1, 4, 1.00, 10.00),
(16766, 3, 247, 1, 1, 5, 1.00, 20.00),
(16767, 3, 247, 1, 1, 6, 1.00, 10.00),
(16768, 1, 247, 2, 4, 1, 2.00, 0.00),
(16769, 1, 247, 2, 4, 2, 1.00, 0.00),
(16770, 1, 247, 2, 4, 3, 1.00, 100.00),
(16771, 1, 247, 2, 4, 4, 1.00, 10.00),
(16772, 1, 247, 2, 4, 5, 1.00, 20.00),
(16773, 1, 247, 2, 4, 6, 1.00, 10.00),
(16774, 2, 247, 2, 4, 1, 1.00, 0.00),
(16775, 2, 247, 2, 4, 2, 1.00, 0.00),
(16776, 2, 247, 2, 4, 3, 1.00, 100.00),
(16777, 2, 247, 2, 4, 4, 1.00, 10.00),
(16778, 2, 247, 2, 4, 5, 1.00, 20.00),
(16779, 2, 247, 2, 4, 6, 1.00, 10.00),
(16780, 3, 247, 2, 4, 1, 1.00, 0.00),
(16781, 3, 247, 2, 4, 2, 1.00, 0.00),
(16782, 3, 247, 2, 4, 3, 1.00, 100.00),
(16783, 3, 247, 2, 4, 4, 1.00, 10.00),
(16784, 3, 247, 2, 4, 5, 1.00, 20.00),
(16785, 3, 247, 2, 4, 6, 1.00, 10.00),
(16786, 1, 247, 2, 2, 1, 1.00, 0.00),
(16787, 1, 247, 2, 2, 2, 1.00, 0.00),
(16788, 1, 247, 2, 2, 3, 1.00, 100.00),
(16789, 1, 247, 2, 2, 4, 1.00, 10.00),
(16790, 1, 247, 2, 2, 5, 1.00, 20.00),
(16791, 1, 247, 2, 2, 6, 1.00, 10.00),
(16792, 2, 247, 2, 2, 1, 1.00, 0.00),
(16793, 2, 247, 2, 2, 2, 1.00, 0.00),
(16794, 2, 247, 2, 2, 3, 1.00, 100.00),
(16795, 2, 247, 2, 2, 4, 1.00, 10.00),
(16796, 2, 247, 2, 2, 5, 1.00, 20.00),
(16797, 2, 247, 2, 2, 6, 1.00, 10.00),
(16798, 3, 247, 2, 2, 1, 1.00, 0.00),
(16799, 3, 247, 2, 2, 2, 1.00, 0.00),
(16800, 3, 247, 2, 2, 3, 1.00, 100.00),
(16801, 3, 247, 2, 2, 4, 1.00, 10.00),
(16802, 3, 247, 2, 2, 5, 1.00, 20.00),
(16803, 3, 247, 2, 2, 6, 1.00, 10.00),
(16804, 1, 247, 2, 3, 1, 1.00, 0.00),
(16805, 1, 247, 2, 3, 2, 1.00, 0.00),
(16806, 1, 247, 2, 3, 3, 1.00, 100.00),
(16807, 1, 247, 2, 3, 4, 1.00, 10.00),
(16808, 1, 247, 2, 3, 5, 1.00, 20.00),
(16809, 1, 247, 2, 3, 6, 1.00, 10.00),
(16810, 2, 247, 2, 3, 1, 1.00, 0.00),
(16811, 2, 247, 2, 3, 2, 1.00, 0.00),
(16812, 2, 247, 2, 3, 3, 1.00, 100.00),
(16813, 2, 247, 2, 3, 4, 1.00, 10.00),
(16814, 2, 247, 2, 3, 5, 1.00, 20.00),
(16815, 2, 247, 2, 3, 6, 1.00, 10.00),
(16816, 3, 247, 2, 3, 1, 1.00, 0.00),
(16817, 3, 247, 2, 3, 2, 1.00, 0.00),
(16818, 3, 247, 2, 3, 3, 1.00, 100.00),
(16819, 3, 247, 2, 3, 4, 1.00, 10.00),
(16820, 3, 247, 2, 3, 5, 1.00, 20.00),
(16821, 3, 247, 2, 3, 6, 1.00, 10.00),
(16822, 1, 247, 2, 1, 1, 1.00, 0.00),
(16823, 1, 247, 2, 1, 2, 0.50, 0.00),
(16824, 1, 247, 2, 1, 3, 1.00, 100.00),
(16825, 1, 247, 2, 1, 4, 1.00, 10.00),
(16826, 1, 247, 2, 1, 5, 1.00, 20.00),
(16827, 1, 247, 2, 1, 6, 1.00, 10.00),
(16828, 2, 247, 2, 1, 1, 1.00, 0.00),
(16829, 2, 247, 2, 1, 2, 1.00, 0.00),
(16830, 2, 247, 2, 1, 3, 1.00, 100.00),
(16831, 2, 247, 2, 1, 4, 1.00, 10.00),
(16832, 2, 247, 2, 1, 5, 1.00, 20.00),
(16833, 2, 247, 2, 1, 6, 1.00, 10.00),
(16834, 3, 247, 2, 1, 1, 1.00, 0.00),
(16835, 3, 247, 2, 1, 2, 1.00, 0.00),
(16836, 3, 247, 2, 1, 3, 1.00, 100.00),
(16837, 3, 247, 2, 1, 4, 1.00, 10.00),
(16838, 3, 247, 2, 1, 5, 1.00, 20.00),
(16839, 3, 247, 2, 1, 6, 1.00, 10.00),
(16840, 1, 247, 3, 4, 1, 3.00, 0.00),
(16841, 1, 247, 3, 4, 2, 3.00, 0.00),
(16842, 1, 247, 3, 4, 3, 3.00, 100.00),
(16843, 1, 247, 3, 4, 4, 3.00, 10.00),
(16844, 1, 247, 3, 4, 5, 1.00, 20.00),
(16845, 1, 247, 3, 4, 6, 1.00, 10.00),
(16846, 2, 247, 3, 4, 1, 1.00, 0.00),
(16847, 2, 247, 3, 4, 2, 1.00, 0.00),
(16848, 2, 247, 3, 4, 3, 1.00, 100.00),
(16849, 2, 247, 3, 4, 4, 1.00, 10.00),
(16850, 2, 247, 3, 4, 5, 1.00, 20.00),
(16851, 2, 247, 3, 4, 6, 1.00, 10.00),
(16852, 3, 247, 3, 4, 1, 1.00, 0.00),
(16853, 3, 247, 3, 4, 2, 1.00, 0.00),
(16854, 3, 247, 3, 4, 3, 1.00, 100.00),
(16855, 3, 247, 3, 4, 4, 1.00, 10.00),
(16856, 3, 247, 3, 4, 5, 1.00, 20.00),
(16857, 3, 247, 3, 4, 6, 1.00, 10.00),
(16858, 1, 247, 3, 2, 1, 3.00, 0.00),
(16859, 1, 247, 3, 2, 2, 3.00, 0.00),
(16860, 1, 247, 3, 2, 3, 1.00, 100.00),
(16861, 1, 247, 3, 2, 4, 1.00, 10.00),
(16862, 1, 247, 3, 2, 5, 4.00, 20.00),
(16863, 1, 247, 3, 2, 6, 4.00, 10.00),
(16864, 2, 247, 3, 2, 1, 1.00, 0.00),
(16865, 2, 247, 3, 2, 2, 1.00, 0.00),
(16866, 2, 247, 3, 2, 3, 1.00, 100.00),
(16867, 2, 247, 3, 2, 4, 1.00, 10.00),
(16868, 2, 247, 3, 2, 5, 1.00, 20.00),
(16869, 2, 247, 3, 2, 6, 1.00, 10.00),
(16870, 3, 247, 3, 2, 1, 1.00, 0.00),
(16871, 3, 247, 3, 2, 2, 1.00, 0.00),
(16872, 3, 247, 3, 2, 3, 1.00, 100.00),
(16873, 3, 247, 3, 2, 4, 1.00, 10.00),
(16874, 3, 247, 3, 2, 5, 1.00, 20.00),
(16875, 3, 247, 3, 2, 6, 1.00, 10.00),
(16876, 1, 247, 3, 3, 1, 1.00, 0.00),
(16877, 1, 247, 3, 3, 2, 1.00, 0.00),
(16878, 1, 247, 3, 3, 3, 1.00, 100.00),
(16879, 1, 247, 3, 3, 4, 1.00, 10.00),
(16880, 1, 247, 3, 3, 5, 1.00, 20.00),
(16881, 1, 247, 3, 3, 6, 1.00, 10.00),
(16882, 2, 247, 3, 3, 1, 1.00, 0.00),
(16883, 2, 247, 3, 3, 2, 1.00, 0.00),
(16884, 2, 247, 3, 3, 3, 1.00, 100.00),
(16885, 2, 247, 3, 3, 4, 1.00, 10.00),
(16886, 2, 247, 3, 3, 5, 1.00, 20.00),
(16887, 2, 247, 3, 3, 6, 1.00, 10.00),
(16888, 3, 247, 3, 3, 1, 1.00, 0.00),
(16889, 3, 247, 3, 3, 2, 1.00, 0.00),
(16890, 3, 247, 3, 3, 3, 1.00, 100.00),
(16891, 3, 247, 3, 3, 4, 1.00, 10.00),
(16892, 3, 247, 3, 3, 5, 1.00, 20.00),
(16893, 3, 247, 3, 3, 6, 1.00, 10.00),
(16894, 1, 247, 3, 1, 1, 1.00, 0.00),
(16895, 1, 247, 3, 1, 2, 0.50, 0.00),
(16896, 1, 247, 3, 1, 3, 1.00, 100.00),
(16897, 1, 247, 3, 1, 4, 1.00, 10.00),
(16898, 1, 247, 3, 1, 5, 1.00, 20.00),
(16899, 1, 247, 3, 1, 6, 1.00, 10.00),
(16900, 2, 247, 3, 1, 1, 1.00, 0.00),
(16901, 2, 247, 3, 1, 2, 1.00, 0.00),
(16902, 2, 247, 3, 1, 3, 1.00, 100.00),
(16903, 2, 247, 3, 1, 4, 1.00, 10.00),
(16904, 2, 247, 3, 1, 5, 1.00, 20.00),
(16905, 2, 247, 3, 1, 6, 1.00, 10.00),
(16906, 3, 247, 3, 1, 1, 1.00, 0.00),
(16907, 3, 247, 3, 1, 2, 1.00, 0.00),
(16908, 3, 247, 3, 1, 3, 1.00, 100.00),
(16909, 3, 247, 3, 1, 4, 1.00, 10.00),
(16910, 3, 247, 3, 1, 5, 1.00, 20.00),
(16911, 3, 247, 3, 1, 6, 1.00, 10.00),
(16912, 1, 247, 4, 4, 1, 2.00, 0.00),
(16913, 1, 247, 4, 4, 2, 1.00, 0.00),
(16914, 1, 247, 4, 4, 3, 1.00, 100.00),
(16915, 1, 247, 4, 4, 4, 1.00, 10.00),
(16916, 1, 247, 4, 4, 5, 1.00, 20.00),
(16917, 1, 247, 4, 4, 6, 1.00, 10.00),
(16918, 2, 247, 4, 4, 1, 1.00, 0.00),
(16919, 2, 247, 4, 4, 2, 1.00, 0.00),
(16920, 2, 247, 4, 4, 3, 1.00, 100.00),
(16921, 2, 247, 4, 4, 4, 1.00, 10.00),
(16922, 2, 247, 4, 4, 5, 1.00, 20.00),
(16923, 2, 247, 4, 4, 6, 1.00, 10.00),
(16924, 3, 247, 4, 4, 1, 1.00, 0.00),
(16925, 3, 247, 4, 4, 2, 1.00, 0.00),
(16926, 3, 247, 4, 4, 3, 1.00, 100.00),
(16927, 3, 247, 4, 4, 4, 1.00, 10.00),
(16928, 3, 247, 4, 4, 5, 1.00, 20.00),
(16929, 3, 247, 4, 4, 6, 1.00, 10.00),
(16930, 1, 247, 4, 2, 1, 1.00, 0.00),
(16931, 1, 247, 4, 2, 2, 1.00, 0.00),
(16932, 1, 247, 4, 2, 3, 1.00, 100.00),
(16933, 1, 247, 4, 2, 4, 1.00, 10.00),
(16934, 1, 247, 4, 2, 5, 1.00, 20.00),
(16935, 1, 247, 4, 2, 6, 1.00, 10.00),
(16936, 2, 247, 4, 2, 1, 1.00, 0.00),
(16937, 2, 247, 4, 2, 2, 1.00, 0.00),
(16938, 2, 247, 4, 2, 3, 1.00, 100.00),
(16939, 2, 247, 4, 2, 4, 1.00, 10.00),
(16940, 2, 247, 4, 2, 5, 1.00, 20.00),
(16941, 2, 247, 4, 2, 6, 1.00, 10.00),
(16942, 3, 247, 4, 2, 1, 1.00, 0.00),
(16943, 3, 247, 4, 2, 2, 1.00, 0.00),
(16944, 3, 247, 4, 2, 3, 1.00, 100.00),
(16945, 3, 247, 4, 2, 4, 1.00, 10.00),
(16946, 3, 247, 4, 2, 5, 1.00, 20.00),
(16947, 3, 247, 4, 2, 6, 1.00, 10.00),
(16948, 1, 247, 4, 3, 1, 1.00, 0.00),
(16949, 1, 247, 4, 3, 2, 1.00, 0.00),
(16950, 1, 247, 4, 3, 3, 1.00, 100.00),
(16951, 1, 247, 4, 3, 4, 1.00, 10.00),
(16952, 1, 247, 4, 3, 5, 1.00, 20.00),
(16953, 1, 247, 4, 3, 6, 1.00, 10.00),
(16954, 2, 247, 4, 3, 1, 1.00, 0.00),
(16955, 2, 247, 4, 3, 2, 1.00, 0.00),
(16956, 2, 247, 4, 3, 3, 1.00, 100.00),
(16957, 2, 247, 4, 3, 4, 1.00, 10.00),
(16958, 2, 247, 4, 3, 5, 1.00, 20.00),
(16959, 2, 247, 4, 3, 6, 1.00, 10.00),
(16960, 3, 247, 4, 3, 1, 1.00, 0.00),
(16961, 3, 247, 4, 3, 2, 1.00, 0.00),
(16962, 3, 247, 4, 3, 3, 1.00, 100.00),
(16963, 3, 247, 4, 3, 4, 1.00, 10.00),
(16964, 3, 247, 4, 3, 5, 1.00, 20.00),
(16965, 3, 247, 4, 3, 6, 1.00, 10.00),
(16966, 1, 247, 4, 1, 1, 1.00, 0.00),
(16967, 1, 247, 4, 1, 2, 0.50, 0.00),
(16968, 1, 247, 4, 1, 3, 1.00, 100.00),
(16969, 1, 247, 4, 1, 4, 1.00, 10.00),
(16970, 1, 247, 4, 1, 5, 1.00, 20.00),
(16971, 1, 247, 4, 1, 6, 1.00, 10.00),
(16972, 2, 247, 4, 1, 1, 1.00, 0.00),
(16973, 2, 247, 4, 1, 2, 1.00, 0.00),
(16974, 2, 247, 4, 1, 3, 1.00, 100.00),
(16975, 2, 247, 4, 1, 4, 1.00, 10.00),
(16976, 2, 247, 4, 1, 5, 1.00, 20.00),
(16977, 2, 247, 4, 1, 6, 1.00, 10.00),
(16978, 3, 247, 4, 1, 1, 1.00, 0.00),
(16979, 3, 247, 4, 1, 2, 1.00, 0.00),
(16980, 3, 247, 4, 1, 3, 1.00, 100.00),
(16981, 3, 247, 4, 1, 4, 1.00, 10.00),
(16982, 3, 247, 4, 1, 5, 1.00, 20.00),
(16983, 3, 247, 4, 1, 6, 1.00, 10.00),
(16984, 1, 248, 1, 4, 1, 4.00, 0.00),
(16985, 1, 248, 1, 4, 2, 4.00, 0.00),
(16986, 1, 248, 1, 4, 3, 1.00, 100.00),
(16987, 1, 248, 1, 4, 4, 1.00, 10.00),
(16988, 1, 248, 1, 4, 5, 1.00, 20.00),
(16989, 1, 248, 1, 4, 6, 1.00, 10.00),
(16990, 2, 248, 1, 4, 1, 1.00, 0.00),
(16991, 2, 248, 1, 4, 2, 1.00, 0.00),
(16992, 2, 248, 1, 4, 3, 1.00, 100.00),
(16993, 2, 248, 1, 4, 4, 1.00, 10.00),
(16994, 2, 248, 1, 4, 5, 1.00, 20.00),
(16995, 2, 248, 1, 4, 6, 1.00, 10.00),
(16996, 3, 248, 1, 4, 1, 1.00, 0.00),
(16997, 3, 248, 1, 4, 2, 1.00, 0.00),
(16998, 3, 248, 1, 4, 3, 1.00, 100.00),
(16999, 3, 248, 1, 4, 4, 1.00, 10.00),
(17000, 3, 248, 1, 4, 5, 1.00, 20.00),
(17001, 3, 248, 1, 4, 6, 1.00, 10.00),
(17002, 1, 248, 1, 2, 1, 4.00, 0.00),
(17003, 1, 248, 1, 2, 2, 4.00, 0.00),
(17004, 1, 248, 1, 2, 3, 1.00, 100.00),
(17005, 1, 248, 1, 2, 4, 1.00, 10.00),
(17006, 1, 248, 1, 2, 5, 1.00, 20.00),
(17007, 1, 248, 1, 2, 6, 1.00, 10.00),
(17008, 2, 248, 1, 2, 1, 1.00, 0.00),
(17009, 2, 248, 1, 2, 2, 1.00, 0.00),
(17010, 2, 248, 1, 2, 3, 1.00, 100.00),
(17011, 2, 248, 1, 2, 4, 1.00, 10.00),
(17012, 2, 248, 1, 2, 5, 1.00, 20.00),
(17013, 2, 248, 1, 2, 6, 1.00, 10.00),
(17014, 3, 248, 1, 2, 1, 1.00, 0.00),
(17015, 3, 248, 1, 2, 2, 1.00, 0.00),
(17016, 3, 248, 1, 2, 3, 1.00, 100.00),
(17017, 3, 248, 1, 2, 4, 1.00, 10.00),
(17018, 3, 248, 1, 2, 5, 1.00, 20.00),
(17019, 3, 248, 1, 2, 6, 1.00, 10.00),
(17020, 1, 248, 1, 3, 1, 1.00, 0.00),
(17021, 1, 248, 1, 3, 2, 1.00, 0.00),
(17022, 1, 248, 1, 3, 3, 1.00, 100.00),
(17023, 1, 248, 1, 3, 4, 1.00, 10.00),
(17024, 1, 248, 1, 3, 5, 1.00, 20.00),
(17025, 1, 248, 1, 3, 6, 1.00, 10.00),
(17026, 2, 248, 1, 3, 1, 1.00, 0.00),
(17027, 2, 248, 1, 3, 2, 1.00, 0.00),
(17028, 2, 248, 1, 3, 3, 1.00, 100.00),
(17029, 2, 248, 1, 3, 4, 1.00, 10.00),
(17030, 2, 248, 1, 3, 5, 1.00, 20.00),
(17031, 2, 248, 1, 3, 6, 1.00, 10.00),
(17032, 3, 248, 1, 3, 1, 1.00, 0.00),
(17033, 3, 248, 1, 3, 2, 1.00, 0.00),
(17034, 3, 248, 1, 3, 3, 1.00, 100.00),
(17035, 3, 248, 1, 3, 4, 1.00, 10.00),
(17036, 3, 248, 1, 3, 5, 1.00, 20.00),
(17037, 3, 248, 1, 3, 6, 1.00, 10.00),
(17038, 1, 248, 1, 1, 1, 1.00, 0.00),
(17039, 1, 248, 1, 1, 2, 0.50, 0.00),
(17040, 1, 248, 1, 1, 3, 1.00, 100.00),
(17041, 1, 248, 1, 1, 4, 1.00, 10.00),
(17042, 1, 248, 1, 1, 5, 1.00, 20.00),
(17043, 1, 248, 1, 1, 6, 1.00, 10.00),
(17044, 2, 248, 1, 1, 1, 1.00, 0.00),
(17045, 2, 248, 1, 1, 2, 1.00, 0.00),
(17046, 2, 248, 1, 1, 3, 1.00, 100.00),
(17047, 2, 248, 1, 1, 4, 1.00, 10.00),
(17048, 2, 248, 1, 1, 5, 1.00, 20.00),
(17049, 2, 248, 1, 1, 6, 1.00, 10.00),
(17050, 3, 248, 1, 1, 1, 1.00, 0.00),
(17051, 3, 248, 1, 1, 2, 1.00, 0.00),
(17052, 3, 248, 1, 1, 3, 1.00, 100.00),
(17053, 3, 248, 1, 1, 4, 1.00, 10.00),
(17054, 3, 248, 1, 1, 5, 1.00, 20.00),
(17055, 3, 248, 1, 1, 6, 1.00, 10.00),
(17056, 1, 248, 2, 4, 1, 33333.00, 0.00),
(17057, 1, 248, 2, 4, 2, 4.00, 0.00),
(17058, 1, 248, 2, 4, 3, 1.00, 100.00),
(17059, 1, 248, 2, 4, 4, 1.00, 10.00),
(17060, 1, 248, 2, 4, 5, 1.00, 20.00),
(17061, 1, 248, 2, 4, 6, 1.00, 10.00),
(17062, 2, 248, 2, 4, 1, 1.00, 0.00),
(17063, 2, 248, 2, 4, 2, 1.00, 0.00),
(17064, 2, 248, 2, 4, 3, 1.00, 100.00),
(17065, 2, 248, 2, 4, 4, 1.00, 10.00),
(17066, 2, 248, 2, 4, 5, 1.00, 20.00),
(17067, 2, 248, 2, 4, 6, 1.00, 10.00),
(17068, 3, 248, 2, 4, 1, 1.00, 0.00),
(17069, 3, 248, 2, 4, 2, 1.00, 0.00),
(17070, 3, 248, 2, 4, 3, 1.00, 100.00),
(17071, 3, 248, 2, 4, 4, 1.00, 10.00),
(17072, 3, 248, 2, 4, 5, 1.00, 20.00),
(17073, 3, 248, 2, 4, 6, 1.00, 10.00),
(17074, 1, 248, 2, 2, 1, 4.00, 0.00),
(17075, 1, 248, 2, 2, 2, 4.00, 0.00),
(17076, 1, 248, 2, 2, 3, 1.00, 100.00),
(17077, 1, 248, 2, 2, 4, 1.00, 10.00),
(17078, 1, 248, 2, 2, 5, 1.00, 20.00),
(17079, 1, 248, 2, 2, 6, 1.00, 10.00),
(17080, 2, 248, 2, 2, 1, 1.00, 0.00),
(17081, 2, 248, 2, 2, 2, 1.00, 0.00),
(17082, 2, 248, 2, 2, 3, 1.00, 100.00),
(17083, 2, 248, 2, 2, 4, 1.00, 10.00),
(17084, 2, 248, 2, 2, 5, 1.00, 20.00),
(17085, 2, 248, 2, 2, 6, 1.00, 10.00),
(17086, 3, 248, 2, 2, 1, 1.00, 0.00),
(17087, 3, 248, 2, 2, 2, 1.00, 0.00),
(17088, 3, 248, 2, 2, 3, 1.00, 100.00),
(17089, 3, 248, 2, 2, 4, 1.00, 10.00),
(17090, 3, 248, 2, 2, 5, 1.00, 20.00),
(17091, 3, 248, 2, 2, 6, 1.00, 10.00),
(17092, 1, 248, 2, 3, 1, 1.00, 0.00),
(17093, 1, 248, 2, 3, 2, 1.00, 0.00),
(17094, 1, 248, 2, 3, 3, 1.00, 100.00),
(17095, 1, 248, 2, 3, 4, 1.00, 10.00),
(17096, 1, 248, 2, 3, 5, 1.00, 20.00),
(17097, 1, 248, 2, 3, 6, 1.00, 10.00),
(17098, 2, 248, 2, 3, 1, 1.00, 0.00),
(17099, 2, 248, 2, 3, 2, 1.00, 0.00),
(17100, 2, 248, 2, 3, 3, 1.00, 100.00),
(17101, 2, 248, 2, 3, 4, 1.00, 10.00),
(17102, 2, 248, 2, 3, 5, 1.00, 20.00),
(17103, 2, 248, 2, 3, 6, 1.00, 10.00),
(17104, 3, 248, 2, 3, 1, 1.00, 0.00),
(17105, 3, 248, 2, 3, 2, 1.00, 0.00),
(17106, 3, 248, 2, 3, 3, 1.00, 100.00),
(17107, 3, 248, 2, 3, 4, 1.00, 10.00),
(17108, 3, 248, 2, 3, 5, 1.00, 20.00),
(17109, 3, 248, 2, 3, 6, 1.00, 10.00),
(17110, 1, 248, 2, 1, 1, 1.00, 0.00),
(17111, 1, 248, 2, 1, 2, 0.50, 0.00),
(17112, 1, 248, 2, 1, 3, 1.00, 100.00),
(17113, 1, 248, 2, 1, 4, 1.00, 10.00),
(17114, 1, 248, 2, 1, 5, 1.00, 20.00),
(17115, 1, 248, 2, 1, 6, 1.00, 10.00),
(17116, 2, 248, 2, 1, 1, 1.00, 0.00),
(17117, 2, 248, 2, 1, 2, 1.00, 0.00),
(17118, 2, 248, 2, 1, 3, 1.00, 100.00),
(17119, 2, 248, 2, 1, 4, 1.00, 10.00),
(17120, 2, 248, 2, 1, 5, 1.00, 20.00),
(17121, 2, 248, 2, 1, 6, 1.00, 10.00),
(17122, 3, 248, 2, 1, 1, 1.00, 0.00),
(17123, 3, 248, 2, 1, 2, 1.00, 0.00),
(17124, 3, 248, 2, 1, 3, 1.00, 100.00),
(17125, 3, 248, 2, 1, 4, 1.00, 10.00),
(17126, 3, 248, 2, 1, 5, 1.00, 20.00),
(17127, 3, 248, 2, 1, 6, 1.00, 10.00),
(17128, 1, 248, 3, 4, 1, 4444.00, 0.00),
(17129, 1, 248, 3, 4, 2, 4.00, 0.00),
(17130, 1, 248, 3, 4, 3, 1.00, 100.00),
(17131, 1, 248, 3, 4, 4, 1.00, 10.00),
(17132, 1, 248, 3, 4, 5, 1.00, 20.00),
(17133, 1, 248, 3, 4, 6, 1.00, 10.00),
(17134, 2, 248, 3, 4, 1, 1.00, 0.00),
(17135, 2, 248, 3, 4, 2, 1.00, 0.00),
(17136, 2, 248, 3, 4, 3, 1.00, 100.00),
(17137, 2, 248, 3, 4, 4, 1.00, 10.00),
(17138, 2, 248, 3, 4, 5, 1.00, 20.00),
(17139, 2, 248, 3, 4, 6, 1.00, 10.00),
(17140, 3, 248, 3, 4, 1, 1.00, 0.00),
(17141, 3, 248, 3, 4, 2, 1.00, 0.00),
(17142, 3, 248, 3, 4, 3, 1.00, 100.00),
(17143, 3, 248, 3, 4, 4, 1.00, 10.00),
(17144, 3, 248, 3, 4, 5, 1.00, 20.00),
(17145, 3, 248, 3, 4, 6, 1.00, 10.00),
(17146, 1, 248, 3, 2, 1, 4.00, 0.00),
(17147, 1, 248, 3, 2, 2, 4.00, 0.00),
(17148, 1, 248, 3, 2, 3, 1.00, 100.00),
(17149, 1, 248, 3, 2, 4, 1.00, 10.00),
(17150, 1, 248, 3, 2, 5, 1.00, 20.00),
(17151, 1, 248, 3, 2, 6, 1.00, 10.00),
(17152, 2, 248, 3, 2, 1, 1.00, 0.00),
(17153, 2, 248, 3, 2, 2, 1.00, 0.00),
(17154, 2, 248, 3, 2, 3, 1.00, 100.00),
(17155, 2, 248, 3, 2, 4, 1.00, 10.00),
(17156, 2, 248, 3, 2, 5, 1.00, 20.00),
(17157, 2, 248, 3, 2, 6, 1.00, 10.00),
(17158, 3, 248, 3, 2, 1, 1.00, 0.00),
(17159, 3, 248, 3, 2, 2, 1.00, 0.00),
(17160, 3, 248, 3, 2, 3, 1.00, 100.00),
(17161, 3, 248, 3, 2, 4, 1.00, 10.00),
(17162, 3, 248, 3, 2, 5, 1.00, 20.00),
(17163, 3, 248, 3, 2, 6, 1.00, 10.00),
(17164, 1, 248, 3, 3, 1, 1.00, 0.00),
(17165, 1, 248, 3, 3, 2, 1.00, 0.00),
(17166, 1, 248, 3, 3, 3, 1.00, 100.00),
(17167, 1, 248, 3, 3, 4, 1.00, 10.00),
(17168, 1, 248, 3, 3, 5, 1.00, 20.00),
(17169, 1, 248, 3, 3, 6, 1.00, 10.00),
(17170, 2, 248, 3, 3, 1, 1.00, 0.00),
(17171, 2, 248, 3, 3, 2, 1.00, 0.00),
(17172, 2, 248, 3, 3, 3, 1.00, 100.00),
(17173, 2, 248, 3, 3, 4, 1.00, 10.00),
(17174, 2, 248, 3, 3, 5, 1.00, 20.00),
(17175, 2, 248, 3, 3, 6, 1.00, 10.00),
(17176, 3, 248, 3, 3, 1, 1.00, 0.00),
(17177, 3, 248, 3, 3, 2, 1.00, 0.00),
(17178, 3, 248, 3, 3, 3, 1.00, 100.00),
(17179, 3, 248, 3, 3, 4, 1.00, 10.00),
(17180, 3, 248, 3, 3, 5, 1.00, 20.00),
(17181, 3, 248, 3, 3, 6, 1.00, 10.00),
(17182, 1, 248, 3, 1, 1, 1.00, 0.00),
(17183, 1, 248, 3, 1, 2, 0.50, 0.00),
(17184, 1, 248, 3, 1, 3, 1.00, 100.00),
(17185, 1, 248, 3, 1, 4, 1.00, 10.00),
(17186, 1, 248, 3, 1, 5, 1.00, 20.00),
(17187, 1, 248, 3, 1, 6, 1.00, 10.00),
(17188, 2, 248, 3, 1, 1, 1.00, 0.00),
(17189, 2, 248, 3, 1, 2, 1.00, 0.00),
(17190, 2, 248, 3, 1, 3, 1.00, 100.00),
(17191, 2, 248, 3, 1, 4, 1.00, 10.00),
(17192, 2, 248, 3, 1, 5, 1.00, 20.00),
(17193, 2, 248, 3, 1, 6, 1.00, 10.00),
(17194, 3, 248, 3, 1, 1, 1.00, 0.00),
(17195, 3, 248, 3, 1, 2, 1.00, 0.00),
(17196, 3, 248, 3, 1, 3, 1.00, 100.00),
(17197, 3, 248, 3, 1, 4, 1.00, 10.00),
(17198, 3, 248, 3, 1, 5, 1.00, 20.00),
(17199, 3, 248, 3, 1, 6, 1.00, 10.00),
(17200, 1, 248, 4, 4, 1, 4444.00, 0.00),
(17201, 1, 248, 4, 4, 2, 4.00, 0.00),
(17202, 1, 248, 4, 4, 3, 1.00, 100.00),
(17203, 1, 248, 4, 4, 4, 1.00, 10.00),
(17204, 1, 248, 4, 4, 5, 1.00, 20.00),
(17205, 1, 248, 4, 4, 6, 1.00, 10.00),
(17206, 2, 248, 4, 4, 1, 1.00, 0.00),
(17207, 2, 248, 4, 4, 2, 1.00, 0.00),
(17208, 2, 248, 4, 4, 3, 1.00, 100.00),
(17209, 2, 248, 4, 4, 4, 1.00, 10.00),
(17210, 2, 248, 4, 4, 5, 1.00, 20.00),
(17211, 2, 248, 4, 4, 6, 1.00, 10.00),
(17212, 3, 248, 4, 4, 1, 1.00, 0.00),
(17213, 3, 248, 4, 4, 2, 1.00, 0.00),
(17214, 3, 248, 4, 4, 3, 1.00, 100.00),
(17215, 3, 248, 4, 4, 4, 1.00, 10.00),
(17216, 3, 248, 4, 4, 5, 1.00, 20.00),
(17217, 3, 248, 4, 4, 6, 1.00, 10.00),
(17218, 1, 248, 4, 2, 1, 4.00, 0.00),
(17219, 1, 248, 4, 2, 2, 4.00, 0.00),
(17220, 1, 248, 4, 2, 3, 1.00, 100.00),
(17221, 1, 248, 4, 2, 4, 1.00, 10.00),
(17222, 1, 248, 4, 2, 5, 1.00, 20.00),
(17223, 1, 248, 4, 2, 6, 1.00, 10.00),
(17224, 2, 248, 4, 2, 1, 1.00, 0.00),
(17225, 2, 248, 4, 2, 2, 1.00, 0.00),
(17226, 2, 248, 4, 2, 3, 1.00, 100.00),
(17227, 2, 248, 4, 2, 4, 1.00, 10.00),
(17228, 2, 248, 4, 2, 5, 1.00, 20.00),
(17229, 2, 248, 4, 2, 6, 1.00, 10.00),
(17230, 3, 248, 4, 2, 1, 1.00, 0.00),
(17231, 3, 248, 4, 2, 2, 1.00, 0.00),
(17232, 3, 248, 4, 2, 3, 1.00, 100.00),
(17233, 3, 248, 4, 2, 4, 1.00, 10.00),
(17234, 3, 248, 4, 2, 5, 1.00, 20.00),
(17235, 3, 248, 4, 2, 6, 1.00, 10.00),
(17236, 1, 248, 4, 3, 1, 1.00, 0.00),
(17237, 1, 248, 4, 3, 2, 1.00, 0.00),
(17238, 1, 248, 4, 3, 3, 1.00, 100.00),
(17239, 1, 248, 4, 3, 4, 1.00, 10.00),
(17240, 1, 248, 4, 3, 5, 1.00, 20.00),
(17241, 1, 248, 4, 3, 6, 1.00, 10.00),
(17242, 2, 248, 4, 3, 1, 1.00, 0.00),
(17243, 2, 248, 4, 3, 2, 1.00, 0.00),
(17244, 2, 248, 4, 3, 3, 1.00, 100.00),
(17245, 2, 248, 4, 3, 4, 1.00, 10.00),
(17246, 2, 248, 4, 3, 5, 1.00, 20.00),
(17247, 2, 248, 4, 3, 6, 1.00, 10.00),
(17248, 3, 248, 4, 3, 1, 1.00, 0.00),
(17249, 3, 248, 4, 3, 2, 1.00, 0.00),
(17250, 3, 248, 4, 3, 3, 1.00, 100.00),
(17251, 3, 248, 4, 3, 4, 1.00, 10.00),
(17252, 3, 248, 4, 3, 5, 1.00, 20.00),
(17253, 3, 248, 4, 3, 6, 1.00, 10.00),
(17254, 1, 248, 4, 1, 1, 1.00, 0.00),
(17255, 1, 248, 4, 1, 2, 0.50, 0.00),
(17256, 1, 248, 4, 1, 3, 1.00, 100.00),
(17257, 1, 248, 4, 1, 4, 1.00, 10.00),
(17258, 1, 248, 4, 1, 5, 1.00, 20.00),
(17259, 1, 248, 4, 1, 6, 1.00, 10.00),
(17260, 2, 248, 4, 1, 1, 1.00, 0.00),
(17261, 2, 248, 4, 1, 2, 1.00, 0.00),
(17262, 2, 248, 4, 1, 3, 1.00, 100.00),
(17263, 2, 248, 4, 1, 4, 1.00, 10.00),
(17264, 2, 248, 4, 1, 5, 1.00, 20.00),
(17265, 2, 248, 4, 1, 6, 1.00, 10.00),
(17266, 3, 248, 4, 1, 1, 1.00, 0.00),
(17267, 3, 248, 4, 1, 2, 1.00, 0.00),
(17268, 3, 248, 4, 1, 3, 1.00, 100.00),
(17269, 3, 248, 4, 1, 4, 1.00, 10.00),
(17270, 3, 248, 4, 1, 5, 1.00, 20.00),
(17271, 3, 248, 4, 1, 6, 1.00, 10.00),
(17272, 1, 248, 5, 4, 1, 33333.00, 0.00),
(17273, 1, 248, 5, 4, 2, 4.00, 0.00),
(17274, 1, 248, 5, 4, 3, 1.00, 100.00),
(17275, 1, 248, 5, 4, 4, 1.00, 10.00),
(17276, 1, 248, 5, 4, 5, 1.00, 20.00),
(17277, 1, 248, 5, 4, 6, 1.00, 10.00),
(17278, 2, 248, 5, 4, 1, 1.00, 0.00),
(17279, 2, 248, 5, 4, 2, 1.00, 0.00),
(17280, 2, 248, 5, 4, 3, 1.00, 100.00),
(17281, 2, 248, 5, 4, 4, 1.00, 10.00),
(17282, 2, 248, 5, 4, 5, 1.00, 20.00),
(17283, 2, 248, 5, 4, 6, 1.00, 10.00),
(17284, 3, 248, 5, 4, 1, 1.00, 0.00),
(17285, 3, 248, 5, 4, 2, 1.00, 0.00),
(17286, 3, 248, 5, 4, 3, 1.00, 100.00),
(17287, 3, 248, 5, 4, 4, 1.00, 10.00),
(17288, 3, 248, 5, 4, 5, 1.00, 20.00),
(17289, 3, 248, 5, 4, 6, 1.00, 10.00),
(17290, 1, 248, 5, 2, 1, 4.00, 0.00),
(17291, 1, 248, 5, 2, 2, 4.00, 0.00),
(17292, 1, 248, 5, 2, 3, 1.00, 100.00),
(17293, 1, 248, 5, 2, 4, 1.00, 10.00),
(17294, 1, 248, 5, 2, 5, 1.00, 20.00),
(17295, 1, 248, 5, 2, 6, 1.00, 10.00),
(17296, 2, 248, 5, 2, 1, 1.00, 0.00),
(17297, 2, 248, 5, 2, 2, 1.00, 0.00),
(17298, 2, 248, 5, 2, 3, 1.00, 100.00),
(17299, 2, 248, 5, 2, 4, 1.00, 10.00),
(17300, 2, 248, 5, 2, 5, 1.00, 20.00),
(17301, 2, 248, 5, 2, 6, 1.00, 10.00),
(17302, 3, 248, 5, 2, 1, 1.00, 0.00),
(17303, 3, 248, 5, 2, 2, 1.00, 0.00),
(17304, 3, 248, 5, 2, 3, 1.00, 100.00),
(17305, 3, 248, 5, 2, 4, 1.00, 10.00),
(17306, 3, 248, 5, 2, 5, 1.00, 20.00),
(17307, 3, 248, 5, 2, 6, 1.00, 10.00),
(17308, 1, 248, 5, 3, 1, 1.00, 0.00),
(17309, 1, 248, 5, 3, 2, 1.00, 0.00),
(17310, 1, 248, 5, 3, 3, 1.00, 100.00),
(17311, 1, 248, 5, 3, 4, 1.00, 10.00),
(17312, 1, 248, 5, 3, 5, 1.00, 20.00),
(17313, 1, 248, 5, 3, 6, 1.00, 10.00),
(17314, 2, 248, 5, 3, 1, 1.00, 0.00),
(17315, 2, 248, 5, 3, 2, 1.00, 0.00),
(17316, 2, 248, 5, 3, 3, 1.00, 100.00),
(17317, 2, 248, 5, 3, 4, 1.00, 10.00),
(17318, 2, 248, 5, 3, 5, 1.00, 20.00),
(17319, 2, 248, 5, 3, 6, 1.00, 10.00),
(17320, 3, 248, 5, 3, 1, 1.00, 0.00),
(17321, 3, 248, 5, 3, 2, 1.00, 0.00),
(17322, 3, 248, 5, 3, 3, 1.00, 100.00),
(17323, 3, 248, 5, 3, 4, 1.00, 10.00),
(17324, 3, 248, 5, 3, 5, 1.00, 20.00),
(17325, 3, 248, 5, 3, 6, 1.00, 10.00),
(17326, 1, 248, 5, 1, 1, 1.00, 0.00),
(17327, 1, 248, 5, 1, 2, 0.50, 0.00),
(17328, 1, 248, 5, 1, 3, 1.00, 100.00),
(17329, 1, 248, 5, 1, 4, 1.00, 10.00),
(17330, 1, 248, 5, 1, 5, 1.00, 20.00),
(17331, 1, 248, 5, 1, 6, 1.00, 10.00),
(17332, 2, 248, 5, 1, 1, 1.00, 0.00),
(17333, 2, 248, 5, 1, 2, 1.00, 0.00),
(17334, 2, 248, 5, 1, 3, 1.00, 100.00),
(17335, 2, 248, 5, 1, 4, 1.00, 10.00),
(17336, 2, 248, 5, 1, 5, 1.00, 20.00),
(17337, 2, 248, 5, 1, 6, 1.00, 10.00),
(17338, 3, 248, 5, 1, 1, 1.00, 0.00),
(17339, 3, 248, 5, 1, 2, 1.00, 0.00),
(17340, 3, 248, 5, 1, 3, 1.00, 100.00),
(17341, 3, 248, 5, 1, 4, 1.00, 10.00),
(17342, 3, 248, 5, 1, 5, 1.00, 20.00),
(17343, 3, 248, 5, 1, 6, 1.00, 10.00),
(17344, 1, 248, 6, 4, 1, 33333.00, 0.00),
(17345, 1, 248, 6, 4, 2, 4.00, 0.00),
(17346, 1, 248, 6, 4, 3, 1.00, 100.00),
(17347, 1, 248, 6, 4, 4, 1.00, 10.00),
(17348, 1, 248, 6, 4, 5, 1.00, 20.00),
(17349, 1, 248, 6, 4, 6, 1.00, 10.00),
(17350, 2, 248, 6, 4, 1, 1.00, 0.00),
(17351, 2, 248, 6, 4, 2, 1.00, 0.00),
(17352, 2, 248, 6, 4, 3, 1.00, 100.00),
(17353, 2, 248, 6, 4, 4, 1.00, 10.00),
(17354, 2, 248, 6, 4, 5, 1.00, 20.00),
(17355, 2, 248, 6, 4, 6, 1.00, 10.00),
(17356, 3, 248, 6, 4, 1, 1.00, 0.00),
(17357, 3, 248, 6, 4, 2, 1.00, 0.00),
(17358, 3, 248, 6, 4, 3, 1.00, 100.00),
(17359, 3, 248, 6, 4, 4, 1.00, 10.00),
(17360, 3, 248, 6, 4, 5, 1.00, 20.00),
(17361, 3, 248, 6, 4, 6, 1.00, 10.00),
(17362, 1, 248, 6, 2, 1, 4.00, 0.00),
(17363, 1, 248, 6, 2, 2, 4.00, 0.00),
(17364, 1, 248, 6, 2, 3, 1.00, 100.00),
(17365, 1, 248, 6, 2, 4, 1.00, 10.00),
(17366, 1, 248, 6, 2, 5, 1.00, 20.00),
(17367, 1, 248, 6, 2, 6, 1.00, 10.00),
(17368, 2, 248, 6, 2, 1, 1.00, 0.00),
(17369, 2, 248, 6, 2, 2, 1.00, 0.00),
(17370, 2, 248, 6, 2, 3, 1.00, 100.00),
(17371, 2, 248, 6, 2, 4, 1.00, 10.00),
(17372, 2, 248, 6, 2, 5, 1.00, 20.00),
(17373, 2, 248, 6, 2, 6, 1.00, 10.00),
(17374, 3, 248, 6, 2, 1, 1.00, 0.00),
(17375, 3, 248, 6, 2, 2, 1.00, 0.00),
(17376, 3, 248, 6, 2, 3, 1.00, 100.00),
(17377, 3, 248, 6, 2, 4, 1.00, 10.00),
(17378, 3, 248, 6, 2, 5, 1.00, 20.00),
(17379, 3, 248, 6, 2, 6, 1.00, 10.00),
(17380, 1, 248, 6, 3, 1, 1.00, 0.00),
(17381, 1, 248, 6, 3, 2, 1.00, 0.00),
(17382, 1, 248, 6, 3, 3, 1.00, 100.00),
(17383, 1, 248, 6, 3, 4, 1.00, 10.00),
(17384, 1, 248, 6, 3, 5, 1.00, 20.00),
(17385, 1, 248, 6, 3, 6, 1.00, 10.00),
(17386, 2, 248, 6, 3, 1, 1.00, 0.00),
(17387, 2, 248, 6, 3, 2, 1.00, 0.00),
(17388, 2, 248, 6, 3, 3, 1.00, 100.00),
(17389, 2, 248, 6, 3, 4, 1.00, 10.00),
(17390, 2, 248, 6, 3, 5, 1.00, 20.00),
(17391, 2, 248, 6, 3, 6, 1.00, 10.00),
(17392, 3, 248, 6, 3, 1, 1.00, 0.00),
(17393, 3, 248, 6, 3, 2, 1.00, 0.00),
(17394, 3, 248, 6, 3, 3, 1.00, 100.00),
(17395, 3, 248, 6, 3, 4, 1.00, 10.00),
(17396, 3, 248, 6, 3, 5, 1.00, 20.00),
(17397, 3, 248, 6, 3, 6, 1.00, 10.00),
(17398, 1, 248, 6, 1, 1, 1.00, 0.00),
(17399, 1, 248, 6, 1, 2, 0.50, 0.00),
(17400, 1, 248, 6, 1, 3, 1.00, 100.00),
(17401, 1, 248, 6, 1, 4, 1.00, 10.00),
(17402, 1, 248, 6, 1, 5, 1.00, 20.00),
(17403, 1, 248, 6, 1, 6, 1.00, 10.00),
(17404, 2, 248, 6, 1, 1, 1.00, 0.00),
(17405, 2, 248, 6, 1, 2, 1.00, 0.00),
(17406, 2, 248, 6, 1, 3, 1.00, 100.00),
(17407, 2, 248, 6, 1, 4, 1.00, 10.00),
(17408, 2, 248, 6, 1, 5, 1.00, 20.00),
(17409, 2, 248, 6, 1, 6, 1.00, 10.00),
(17410, 3, 248, 6, 1, 1, 1.00, 0.00),
(17411, 3, 248, 6, 1, 2, 1.00, 0.00),
(17412, 3, 248, 6, 1, 3, 1.00, 100.00),
(17413, 3, 248, 6, 1, 4, 1.00, 10.00),
(17414, 3, 248, 6, 1, 5, 1.00, 20.00),
(17415, 3, 248, 6, 1, 6, 1.00, 10.00),
(17416, 1, 249, 1, 4, 1, 2.00, 0.00),
(17417, 1, 249, 1, 4, 2, 1.00, 0.00),
(17418, 1, 249, 1, 4, 3, 1.00, 100.00),
(17419, 1, 249, 1, 4, 4, 1.00, 10.00),
(17420, 1, 249, 1, 4, 5, 1.00, 20.00),
(17421, 1, 249, 1, 4, 6, 1.00, 10.00),
(17422, 2, 249, 1, 4, 1, 1.00, 0.00),
(17423, 2, 249, 1, 4, 2, 1.00, 0.00),
(17424, 2, 249, 1, 4, 3, 1.00, 100.00),
(17425, 2, 249, 1, 4, 4, 1.00, 10.00),
(17426, 2, 249, 1, 4, 5, 1.00, 20.00),
(17427, 2, 249, 1, 4, 6, 1.00, 10.00),
(17428, 3, 249, 1, 4, 1, 1.00, 0.00),
(17429, 3, 249, 1, 4, 2, 1.00, 0.00),
(17430, 3, 249, 1, 4, 3, 1.00, 100.00),
(17431, 3, 249, 1, 4, 4, 1.00, 10.00),
(17432, 3, 249, 1, 4, 5, 1.00, 20.00),
(17433, 3, 249, 1, 4, 6, 1.00, 10.00),
(17434, 1, 249, 1, 2, 1, 1.00, 0.00),
(17435, 1, 249, 1, 2, 2, 1.00, 0.00),
(17436, 1, 249, 1, 2, 3, 1.00, 100.00),
(17437, 1, 249, 1, 2, 4, 1.00, 10.00),
(17438, 1, 249, 1, 2, 5, 1.00, 20.00),
(17439, 1, 249, 1, 2, 6, 1.00, 10.00),
(17440, 2, 249, 1, 2, 1, 1.00, 0.00),
(17441, 2, 249, 1, 2, 2, 1.00, 0.00),
(17442, 2, 249, 1, 2, 3, 1.00, 100.00),
(17443, 2, 249, 1, 2, 4, 1.00, 10.00),
(17444, 2, 249, 1, 2, 5, 1.00, 20.00),
(17445, 2, 249, 1, 2, 6, 1.00, 10.00),
(17446, 3, 249, 1, 2, 1, 1.00, 0.00),
(17447, 3, 249, 1, 2, 2, 1.00, 0.00),
(17448, 3, 249, 1, 2, 3, 1.00, 100.00),
(17449, 3, 249, 1, 2, 4, 1.00, 10.00),
(17450, 3, 249, 1, 2, 5, 1.00, 20.00),
(17451, 3, 249, 1, 2, 6, 1.00, 10.00),
(17452, 1, 249, 1, 3, 1, 1.00, 0.00),
(17453, 1, 249, 1, 3, 2, 1.00, 0.00),
(17454, 1, 249, 1, 3, 3, 1.00, 100.00),
(17455, 1, 249, 1, 3, 4, 1.00, 10.00),
(17456, 1, 249, 1, 3, 5, 1.00, 20.00),
(17457, 1, 249, 1, 3, 6, 1.00, 10.00),
(17458, 2, 249, 1, 3, 1, 1.00, 0.00),
(17459, 2, 249, 1, 3, 2, 1.00, 0.00),
(17460, 2, 249, 1, 3, 3, 1.00, 100.00),
(17461, 2, 249, 1, 3, 4, 1.00, 10.00),
(17462, 2, 249, 1, 3, 5, 1.00, 20.00),
(17463, 2, 249, 1, 3, 6, 1.00, 10.00),
(17464, 3, 249, 1, 3, 1, 1.00, 0.00),
(17465, 3, 249, 1, 3, 2, 1.00, 0.00),
(17466, 3, 249, 1, 3, 3, 1.00, 100.00),
(17467, 3, 249, 1, 3, 4, 1.00, 10.00),
(17468, 3, 249, 1, 3, 5, 1.00, 20.00),
(17469, 3, 249, 1, 3, 6, 1.00, 10.00),
(17470, 1, 249, 1, 1, 1, 1.00, 0.00),
(17471, 1, 249, 1, 1, 2, 0.50, 0.00),
(17472, 1, 249, 1, 1, 3, 1.00, 100.00),
(17473, 1, 249, 1, 1, 4, 1.00, 10.00),
(17474, 1, 249, 1, 1, 5, 1.00, 20.00),
(17475, 1, 249, 1, 1, 6, 1.00, 10.00),
(17476, 2, 249, 1, 1, 1, 1.00, 0.00),
(17477, 2, 249, 1, 1, 2, 1.00, 0.00),
(17478, 2, 249, 1, 1, 3, 1.00, 100.00),
(17479, 2, 249, 1, 1, 4, 1.00, 10.00),
(17480, 2, 249, 1, 1, 5, 1.00, 20.00),
(17481, 2, 249, 1, 1, 6, 1.00, 10.00),
(17482, 3, 249, 1, 1, 1, 1.00, 0.00),
(17483, 3, 249, 1, 1, 2, 1.00, 0.00),
(17484, 3, 249, 1, 1, 3, 1.00, 100.00),
(17485, 3, 249, 1, 1, 4, 1.00, 10.00),
(17486, 3, 249, 1, 1, 5, 1.00, 20.00),
(17487, 3, 249, 1, 1, 6, 1.00, 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_events`
--

CREATE TABLE IF NOT EXISTS `tbl_events` (
  `id` int(16) NOT NULL,
  `game_id` int(16) DEFAULT NULL,
  `round_id` int(16) DEFAULT NULL,
  `team_id` int(16) DEFAULT NULL,
  `title` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_events`
--

INSERT INTO `tbl_events` (`id`, `game_id`, `round_id`, `team_id`, `title`, `description`) VALUES
(64, NULL, 1, 0, '', ''),
(193, 246, 1, 0, '', ''),
(194, 246, 2, 0, '', ''),
(195, 246, 3, 0, '', ''),
(196, 246, 4, 0, '', ''),
(197, 247, 1, 0, '', ''),
(198, 247, 2, 0, '', ''),
(199, 247, 3, 0, '', ''),
(200, 247, 4, 0, '', ''),
(201, 248, 1, 0, '', ''),
(202, 248, 2, 0, '', ''),
(203, 248, 3, 0, '', ''),
(204, 248, 4, 0, '', ''),
(205, 248, 5, 0, '', ''),
(206, 248, 6, 0, '', ''),
(207, 249, 1, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_game`
--

CREATE TABLE IF NOT EXISTS `tbl_game` (
  `id` int(16) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `number_of_round` int(100) NOT NULL,
  `recycle_round` int(1) DEFAULT '1',
  `status` int(11) DEFAULT NULL,
  `created_by` varchar(100) COLLATE utf8_bin NOT NULL,
  `created_date` datetime NOT NULL,
  `current_round` int(2) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_game`
--

INSERT INTO `tbl_game` (`id`, `name`, `number_of_round`, `recycle_round`, `status`, `created_by`, `created_date`, `current_round`) VALUES
(246, 'game test', 4, 2, 2, '1', '2015-10-26 00:00:00', 2),
(247, 'dsds', 4, 2, 2, '1', '2015-10-26 00:00:00', 2),
(248, 'dsdsd', 6, 1, 3, '1', '2015-10-26 00:00:00', 3),
(249, 'fdfdfdf', 1, 1, 1, '1', '2015-10-26 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_game_allowances`
--

CREATE TABLE IF NOT EXISTS `tbl_game_allowances` (
  `id` int(10) NOT NULL,
  `round_id` int(10) NOT NULL,
  `team_id` int(10) NOT NULL,
  `game_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_game_setting`
--

CREATE TABLE IF NOT EXISTS `tbl_game_setting` (
  `id` int(16) NOT NULL,
  `type` varchar(16) COLLATE utf8_bin NOT NULL,
  `key` int(16) NOT NULL,
  `value` varchar(16) COLLATE utf8_bin NOT NULL,
  `is_default` int(11) NOT NULL DEFAULT '1' COMMENT '1:default 0:not default',
  `game_id` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'fk',
  `team_id` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'fk',
  `region_id` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'fk'
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_game_setting`
--

INSERT INTO `tbl_game_setting` (`id`, `type`, `key`, `value`, `is_default`, `game_id`, `team_id`, `region_id`) VALUES
(12, '2', 3, '500', 1, '0', '', ''),
(11, '2', 2, '30', 1, '0', '', ''),
(10, '2', 1, '3000', 1, '0', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_improvement`
--

CREATE TABLE IF NOT EXISTS `tbl_improvement` (
  `id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `round_id` int(11) DEFAULT NULL,
  `factor_id` int(11) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `description` text
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_improvement`
--

INSERT INTO `tbl_improvement` (`id`, `team_id`, `round_id`, `factor_id`, `value`, `description`) VALUES
(1, 122, 2, 1, 1000, 'âsas'),
(2, 122, 2, 3, 10, 'âsas'),
(3, 124, 2, 1, 1000, ''),
(4, 124, 2, 3, 10, ''),
(5, 125, 1, 1, 1000000, ''),
(6, 125, 1, 3, 10, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_market_inforrmations`
--

CREATE TABLE IF NOT EXISTS `tbl_market_inforrmations` (
  `id` int(10) NOT NULL,
  `name` varchar(16) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `max_price` double NOT NULL,
  `range` double NOT NULL,
  `reliability` double NOT NULL,
  `design` double NOT NULL,
  `image` double NOT NULL,
  `game_id` int(16) NOT NULL,
  `round_id` int(16) NOT NULL,
  `region_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_players`
--

CREATE TABLE IF NOT EXISTS `tbl_players` (
  `id` int(16) NOT NULL,
  `account` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `role` int(16) NOT NULL,
  `team_id` int(16) NOT NULL COMMENT 'fk',
  `user_type` int(1) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_players`
--

INSERT INTO `tbl_players` (`id`, `account`, `password`, `name`, `email`, `role`, `team_id`, `user_type`) VALUES
(5, 'player', '123456', 'phuc dang', 'phucsystem@gmail.com', 1, 10, 2),
(1, 'master', '123456', 'Game Master', 'test@gmail.com', 1, 0, 1),
(14, 'phucdang2', 'iKGNvV', 'phuc dang', 'phucsystem@gmail.com', 1, 8, 2),
(13, 'phucdang', 'zC9EvV', 'phuc dang', 'phucsystem@gmail.com', 1, 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE IF NOT EXISTS `tbl_products` (
  `id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `sell_price` double NOT NULL,
  `range` double NOT NULL,
  `reliability` double NOT NULL,
  `design` double NOT NULL,
  `manufacturing_cost` double NOT NULL,
  `team_id` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`id`, `name`, `sell_price`, `range`, `reliability`, `design`, `manufacturing_cost`, `team_id`) VALUES
(1, 'dsdsd', 7190, 26, 26, 24, 680, 64),
(2, 'dsdsd', 6810, 24, 21, 21, 680, 64),
(3, 'dsdsd', 6810, 24, 21, 21, 680, 64),
(4, 'dsdsd', 6810, 24, 21, 21, 680, 64),
(5, 'dsdsd', 7350, 30, 27, 29, 680, 64),
(6, 'dsdsd', 7650, 28, 27, 27, 680, 64),
(7, 'product 1', 8290, 24, 19, 20, 710, 71),
(8, 'product 2', 8590, 23, 25, 21, 710, 71),
(9, 'product 3', 7290, 23, 28, 17, 710, 71),
(10, 'sdsd', 0, 0, 0, 0, 700, 71),
(11, 'dsds', 3790, 11, 7, 4, 560, 71),
(12, 'sdsd', 3925, 4, 7, 7, 560, 71),
(13, 'dsd', 3610, 3, 3, 6, 560, 71),
(14, 'xxxx', 3590, 2, 3, 4, 560, 71),
(15, 'dsđ', 3610, 3, 3, 6, 560, 71),
(16, 'dsd', 3640, 2, 6, 5, 590, 71),
(17, 'dsd', 3550, 0, 3, 1, 530, 71),
(18, 'dsd', 3550, 0, 3, 1, 530, 71),
(19, 'dsd', 3550, 0, 3, 1, 530, 71),
(20, 'sss', 4830, 20, 21, 15, 540, 73),
(21, 'aaaa', 5785, 24, 26, 22, 540, 73),
(22, 'dsd', 5625, 27, 32, 25, 540, 73),
(23, 'dsd', 5625, 27, 32, 25, 540, 73),
(24, 'dsd', 5625, 27, 32, 25, 540, 73),
(25, '32323', 5035, 22, 22, 18, 540, 73),
(26, '32323', 5035, 22, 22, 18, 540, 73),
(27, '4343', 5255, 22, 26, 16, 540, 73),
(28, 'sd', 4810, 20, 22, 14, 540, 73),
(29, 'shit', 5900, 25, 18, 22, 540, 73),
(30, '1234', 4765, 20, 18, 14, 540, 73),
(31, 'sdsd', 5610, 50, 50, 44, 740, 77),
(32, 'aaaa', 5565, 54, 46, 28, 740, 78),
(33, 'zzzz', 5305, 48, 48, 40, 710, 78),
(34, 'product 1', 4960, 42, 36, 30, 710, 97),
(35, 'aaaa', 4935, 40, 36, 28, 710, 98),
(36, 'aaaaa', 5160, 44, 42, 38, 710, 99),
(37, 'aa', 5300, 44, 46, 30, 710, 102),
(38, 'product 1', 2645, 96, 60, 42, 710, 103),
(39, 'Scotter1', 6465, 51, 53, 46, 530, 106),
(40, 'Product 1', 4155, 12, 15, 12, 500, 107),
(41, 'Product_1_', 4055, 10, 18, 24, 500, 104),
(42, 'Product 2', 4535, 28, 22, 12, 500, 107),
(43, 'Product_1_', 4315, 30, 30, 12, 500, 104),
(44, 'Product_1_', 4305, 18, 12, 42, 500, 104),
(45, '11', 4055, 9, 16.2, 21.6, 500, 105),
(46, 'Product 31', 4315, 13.6, 20.4, 15.299999999999999, 500, 108),
(47, 'Product 32', 4475, 30.6, 22.1, 13.6, 500, 108),
(48, 'Product 33', 4405, 28.9, 13.6, 30.6, 500, 108),
(49, 'Product_1_4', 6950, 54, 64, 50, 500, 104),
(50, 'Product 34', 7330, 47.6, 57.8, 52.7, 500, 108),
(51, '21', 4055, 9, 16.2, 21.6, 500, 110),
(52, '22', 4510, 32.4, 27, 14.4, 500, 110),
(53, 'Product_1_1', 4055, 10, 18, 24, 500, 111),
(54, 'Product_1_2', 4315, 30, 30, 12, 500, 111),
(55, 'Product1_3', 4305, 18, 12, 42, 500, 111),
(56, '23', 4555, 25.2, 14.4, 32.4, 500, 110),
(57, '44', 5300, 46.8, 45, 43.2, 500, 110),
(58, 'Product_1_4', 6950, 54, 64, 50, 500, 111),
(59, 'Product11', 4055, 10, 18, 24, 500, 112),
(60, '31', 4315, 13.6, 20.4, 15.3, 500, 114),
(61, '32', 4475, 30.6, 22.1, 13.6, 500, 114),
(62, '11', 4055, 9, 16.2, 21.6, 500, 113),
(63, 'Product12', 4315, 30, 30, 12, 500, 112),
(64, '33', 4405, 28.9, 13.6, 30.6, 500, 114),
(65, '34', 7330, 47.6, 57.8, 52.7, 500, 114),
(66, 'trrtrt', 4830, 44, 36, 34, 530, 112),
(67, 'aaaa', 4785, 40, 36, 28, 530, 112),
(68, '22', 4510, 32.4, 27, 14.4, 500, 113),
(69, '23', 4555, 25.2, 14.4, 32.4, 500, 113),
(70, 'Product11', 4055, 10, 18, 24, 500, 116),
(71, '24', 5300, 46.8, 45, 43.2, 500, 113),
(72, '41', 4155, 12.8, 17.6, 14.4, 500, 115),
(73, 'Product12', 4315, 30, 30, 12, 500, 116),
(74, '42', 4535, 28.8, 25.6, 14.4, 500, 115),
(75, '43', 4455, 28.8, 14.4, 28.8, 500, 115),
(76, 'Product13', 4305, 18, 12, 42, 500, 116),
(77, '44', 6950, 43.2, 51.2, 40, 500, 115),
(78, 'Product14', 6950, 54, 64, 50, 500, 116),
(79, '21', 4055, 9, 16.2, 21.6, 500, 118),
(80, '22', 4510, 32.4, 27, 14.4, 500, 118),
(81, '23', 4555, 25.2, 14.4, 32.4, 500, 118),
(82, '24', 5300, 46.8, 45, 43.2, 500, 118),
(83, '31', 4315, 13.6, 20.4, 15.3, 500, 117),
(84, '32', 4475, 30.6, 22.1, 13.6, 500, 117),
(85, '33', 4405, 28.9, 13.6, 30.6, 500, 117),
(86, '34', 7330, 47.6, 57.8, 52.7, 500, 117),
(87, '321', 4785, 40, 36, 28, 530, 119),
(88, '322', 4805, 40, 36, 30, 530, 119),
(89, '323', 4830, 40, 38, 34, 530, 119),
(90, 'product_1_1', 4055, 10, 18, 24, 500, 120),
(91, 'product_1_2', 4315, 30, 30, 12, 500, 120),
(92, 'Product_1_3', 4305, 18, 12, 42, 500, 120),
(93, 'product_1_4', 6950, 54, 64, 50, 500, 120),
(94, 'aaaa', 4785, 40, 36, 28, 530, 121),
(95, 'aaaaaa', 4785, 40, 36, 28, 530, 122),
(96, 'sdsdsd', 5205, 50, 44, 36, 530, 122);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_components`
--

CREATE TABLE IF NOT EXISTS `tbl_product_components` (
  `id` int(10) NOT NULL,
  `component_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `material_id` int(10) NOT NULL,
  `team_id` int(16) DEFAULT NULL,
  `quantity_per_product` int(16) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=911 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_product_components`
--

INSERT INTO `tbl_product_components` (`id`, `component_id`, `product_id`, `material_id`, `team_id`, `quantity_per_product`) VALUES
(1, 366, 4, 771, 64, 0),
(2, 367, 4, 775, 64, 0),
(3, 368, 4, 778, 64, 0),
(4, 369, 4, 780, 64, 0),
(5, 370, 4, 783, 64, 0),
(6, 371, 4, 786, 64, 0),
(7, 372, 4, 790, 64, 0),
(8, 373, 4, 793, 64, NULL),
(9, 374, 4, 794, 64, 0),
(10, 375, 4, 796, 64, NULL),
(11, 366, 5, 771, 64, NULL),
(12, 367, 5, 775, 64, NULL),
(13, 368, 5, 777, 64, NULL),
(14, 369, 5, 782, 64, NULL),
(15, 370, 5, 783, 64, NULL),
(16, 371, 5, 787, 64, NULL),
(17, 372, 5, 791, 64, NULL),
(18, 373, 5, 793, 64, NULL),
(19, 374, 5, 795, 64, NULL),
(20, 375, 5, 796, 64, NULL),
(21, 366, 6, 773, 64, NULL),
(22, 367, 6, 776, 64, NULL),
(23, 368, 6, 778, 64, NULL),
(24, 369, 6, 781, 64, NULL),
(25, 370, 6, 783, 64, NULL),
(26, 371, 6, 788, 64, NULL),
(27, 372, 6, 790, 64, NULL),
(28, 373, 6, 793, 64, NULL),
(29, 374, 6, 794, 64, NULL),
(30, 375, 6, 796, 64, NULL),
(31, 436, 7, 968, 71, NULL),
(32, 437, 7, 970, 71, NULL),
(33, 438, 7, 0, 71, NULL),
(34, 439, 7, 0, 71, NULL),
(35, 440, 7, 0, 71, NULL),
(36, 441, 7, 0, 71, NULL),
(37, 442, 7, 0, 71, NULL),
(38, 443, 7, 0, 71, NULL),
(39, 444, 7, 0, 71, NULL),
(40, 445, 7, 0, 71, NULL),
(41, 436, 8, 968, 71, NULL),
(42, 437, 8, 970, 71, NULL),
(43, 438, 8, 0, 71, NULL),
(44, 439, 8, 0, 71, NULL),
(45, 440, 8, 0, 71, NULL),
(46, 441, 8, 0, 71, NULL),
(47, 442, 8, 0, 71, NULL),
(48, 443, 8, 0, 71, NULL),
(49, 444, 8, 0, 71, NULL),
(50, 445, 8, 0, 71, NULL),
(51, 436, 9, 968, 71, NULL),
(52, 437, 9, 970, 71, NULL),
(53, 438, 9, 0, 71, NULL),
(54, 439, 9, 0, 71, NULL),
(55, 440, 9, 0, 71, NULL),
(56, 441, 9, 0, 71, NULL),
(57, 442, 9, 0, 71, NULL),
(58, 443, 9, 0, 71, NULL),
(59, 444, 9, 0, 71, NULL),
(60, 445, 9, 0, 71, NULL),
(61, 436, 10, 968, 71, 1),
(62, 437, 10, 970, 71, 1),
(63, 438, 10, 0, 71, 1),
(64, 439, 10, 0, 71, 1),
(65, 440, 10, 0, 71, 1),
(66, 441, 10, 0, 71, 1),
(67, 442, 10, 0, 71, 1),
(68, 443, 10, 0, 71, 1),
(69, 444, 10, 0, 71, 1),
(70, 445, 10, 0, 71, 1),
(71, 436, 11, 968, 71, 1),
(72, 437, 11, 970, 71, 1),
(73, 438, 11, 0, 71, 1),
(74, 439, 11, 0, 71, 1),
(75, 440, 11, 0, 71, 1),
(76, 441, 11, 0, 71, 1),
(77, 442, 11, 0, 71, 1),
(78, 443, 11, 0, 71, 1),
(79, 444, 11, 0, 71, 1),
(80, 445, 11, 0, 71, 1),
(81, 436, 12, 968, 71, 1),
(82, 437, 12, 970, 71, 1),
(83, 438, 12, 0, 71, 1),
(84, 439, 12, 0, 71, 1),
(85, 440, 12, 0, 71, 1),
(86, 441, 12, 0, 71, 1),
(87, 442, 12, 0, 71, 1),
(88, 443, 12, 0, 71, 1),
(89, 444, 12, 0, 71, 1),
(90, 445, 12, 0, 71, 1),
(91, 436, 13, 968, 71, 1),
(92, 437, 13, 970, 71, 1),
(93, 438, 13, 0, 71, 1),
(94, 439, 13, 0, 71, 1),
(95, 440, 13, 0, 71, 1),
(96, 441, 13, 0, 71, 1),
(97, 442, 13, 0, 71, 1),
(98, 443, 13, 0, 71, 1),
(99, 444, 13, 0, 71, 1),
(100, 445, 13, 0, 71, 1),
(101, 436, 14, 968, 71, 1),
(102, 437, 14, 970, 71, 1),
(103, 438, 14, 0, 71, 1),
(104, 439, 14, 0, 71, 1),
(105, 440, 14, 0, 71, 1),
(106, 441, 14, 0, 71, 1),
(107, 442, 14, 0, 71, 1),
(108, 443, 14, 0, 71, 1),
(109, 444, 14, 0, 71, 1),
(110, 445, 14, 0, 71, 1),
(111, 436, 15, 968, 71, 1),
(112, 437, 15, 970, 71, 1),
(113, 438, 15, 0, 71, 1),
(114, 439, 15, 0, 71, 1),
(115, 440, 15, 0, 71, 1),
(116, 441, 15, 0, 71, 1),
(117, 442, 15, 0, 71, 1),
(118, 443, 15, 0, 71, 1),
(119, 444, 15, 0, 71, 1),
(120, 445, 15, 0, 71, 1),
(121, 436, 16, 968, 71, 1),
(122, 437, 16, 970, 71, 1),
(123, 438, 16, 0, 71, 1),
(124, 439, 16, 0, 71, 1),
(125, 440, 16, 0, 71, 1),
(126, 441, 16, 0, 71, 1),
(127, 442, 16, 0, 71, 1),
(128, 443, 16, 0, 71, 1),
(129, 444, 16, 0, 71, 1),
(130, 445, 16, 0, 71, 1),
(131, 436, 18, 968, 71, 1),
(132, 437, 18, 970, 71, 1),
(133, 438, 18, 0, 71, 1),
(134, 439, 18, 0, 71, 1),
(135, 440, 18, 0, 71, 1),
(136, 441, 18, 0, 71, 1),
(137, 442, 18, 0, 71, 1),
(138, 443, 18, 0, 71, 1),
(139, 444, 18, 0, 71, 1),
(140, 445, 18, 0, 71, 1),
(141, 436, 19, 968, 71, 1),
(142, 437, 19, 970, 71, 1),
(143, 438, 19, 0, 71, 1),
(144, 439, 19, 0, 71, 1),
(145, 440, 19, 0, 71, 1),
(146, 441, 19, 0, 71, 1),
(147, 442, 19, 0, 71, 1),
(148, 443, 19, 0, 71, 1),
(149, 444, 19, 0, 71, 1),
(150, 445, 19, 0, 71, 1),
(151, 456, 20, 1025, 73, 1),
(152, 457, 20, 1026, 73, 1),
(153, 458, 20, 1029, 73, 1),
(154, 459, 20, 1032, 73, 1),
(155, 460, 20, 1035, 73, 1),
(156, 461, 20, 1038, 73, 1),
(157, 462, 20, 1041, 73, 1),
(158, 463, 20, 1044, 73, 1),
(159, 464, 20, 1046, 73, 1),
(160, 465, 20, 1048, 73, 1),
(161, 456, 21, 1025, 73, 1),
(162, 457, 21, 1026, 73, 1),
(163, 458, 21, 1029, 73, 1),
(164, 459, 21, 1032, 73, 1),
(165, 460, 21, 1035, 73, 1),
(166, 461, 21, 1038, 73, 1),
(167, 462, 21, 1041, 73, 1),
(168, 463, 21, 1044, 73, 1),
(169, 464, 21, 1046, 73, 1),
(170, 465, 21, 1048, 73, 1),
(171, 456, 23, 1025, 73, 1),
(172, 457, 23, 1026, 73, 1),
(173, 458, 23, 1029, 73, 1),
(174, 459, 23, 1032, 73, 1),
(175, 460, 23, 1035, 73, 1),
(176, 461, 23, 1038, 73, 1),
(177, 462, 23, 1041, 73, 1),
(178, 463, 23, 1044, 73, 1),
(179, 464, 23, 1046, 73, 1),
(180, 465, 23, 1048, 73, 1),
(181, 456, 24, 1025, 73, 1),
(182, 457, 24, 1026, 73, 1),
(183, 458, 24, 1029, 73, 1),
(184, 459, 24, 1032, 73, 1),
(185, 460, 24, 1035, 73, 1),
(186, 461, 24, 1038, 73, 1),
(187, 462, 24, 1041, 73, 1),
(188, 463, 24, 1044, 73, 1),
(189, 464, 24, 1046, 73, 1),
(190, 465, 24, 1048, 73, 1),
(191, 456, 25, 1025, 73, 1),
(192, 457, 25, 1026, 73, 1),
(193, 458, 25, 1029, 73, 1),
(194, 459, 25, 1032, 73, 1),
(195, 460, 25, 1035, 73, 1),
(196, 461, 25, 1038, 73, 1),
(197, 462, 25, 1041, 73, 1),
(198, 463, 25, 1044, 73, 1),
(199, 464, 25, 1046, 73, 1),
(200, 465, 25, 1048, 73, 1),
(201, 456, 26, 1025, 73, 1),
(202, 457, 26, 1026, 73, 1),
(203, 458, 26, 1029, 73, 1),
(204, 459, 26, 1032, 73, 1),
(205, 460, 26, 1035, 73, 1),
(206, 461, 26, 1038, 73, 1),
(207, 462, 26, 1041, 73, 1),
(208, 463, 26, 1044, 73, 1),
(209, 464, 26, 1046, 73, 1),
(210, 465, 26, 1048, 73, 1),
(211, 456, 27, 1025, 73, 1),
(212, 457, 27, 1026, 73, 1),
(213, 458, 27, 1029, 73, 1),
(214, 459, 27, 1032, 73, 1),
(215, 460, 27, 1035, 73, 1),
(216, 461, 27, 1038, 73, 1),
(217, 462, 27, 1041, 73, 1),
(218, 463, 27, 1044, 73, 1),
(219, 464, 27, 1046, 73, 1),
(220, 465, 27, 1048, 73, 1),
(221, 456, 28, 1025, 73, 1),
(222, 457, 28, 1026, 73, 1),
(223, 458, 28, 1029, 73, 1),
(224, 459, 28, 1032, 73, 1),
(225, 460, 28, 1035, 73, 1),
(226, 461, 28, 1038, 73, 1),
(227, 462, 28, 1041, 73, 1),
(228, 463, 28, 1044, 73, 1),
(229, 464, 28, 1046, 73, 1),
(230, 465, 28, 1048, 73, 1),
(231, 456, 29, 1024, 73, 1),
(232, 457, 29, 1027, 73, 1),
(233, 458, 29, 1031, 73, 1),
(234, 459, 29, 1032, 73, 1),
(235, 460, 29, 1035, 73, 1),
(236, 461, 29, 1039, 73, 1),
(237, 462, 29, 1042, 73, 1),
(238, 463, 29, 1044, 73, 1),
(239, 464, 29, 1046, 73, 1),
(240, 465, 29, 1048, 73, 1),
(241, 456, 30, 1023, 73, 1),
(242, 457, 30, 1026, 73, 1),
(243, 458, 30, 1029, 73, 1),
(244, 459, 30, 1032, 73, 1),
(245, 460, 30, 1035, 73, 1),
(246, 461, 30, 1038, 73, 1),
(247, 462, 30, 1041, 73, 1),
(248, 463, 30, 1044, 73, 1),
(249, 464, 30, 1046, 73, 1),
(250, 465, 30, 1048, 73, 1),
(251, 478, 31, 1080, 77, 1),
(252, 479, 31, 1084, 77, 1),
(253, 480, 31, 1085, 77, 1),
(254, 481, 31, 1088, 77, 1),
(255, 482, 31, 1091, 77, 1),
(256, 483, 31, 1094, 77, 1),
(257, 484, 31, 1098, 77, 1),
(258, 485, 31, 1100, 77, 1),
(259, 486, 31, 1103, 77, 1),
(260, 487, 31, 1105, 77, 1),
(261, 488, 32, 1107, 78, 1),
(262, 489, 32, 1110, 78, 1),
(263, 490, 32, 1113, 78, 1),
(264, 491, 32, 1116, 78, 1),
(265, 492, 32, 1119, 78, 1),
(266, 493, 32, 1122, 78, 1),
(267, 494, 32, 1125, 78, 1),
(268, 495, 32, 1128, 78, 1),
(269, 496, 32, 1130, 78, 1),
(270, 497, 32, 1132, 78, 1),
(271, 488, 33, 1107, 78, 1),
(272, 489, 33, 1111, 78, 1),
(273, 490, 33, 1114, 78, 1),
(274, 491, 33, 1117, 78, 1),
(275, 492, 33, 1120, 78, 1),
(276, 493, 33, 1122, 78, 1),
(277, 494, 33, 1125, 78, 1),
(278, 495, 33, 1128, 78, 1),
(279, 496, 33, 1130, 78, 1),
(280, 497, 33, 1132, 78, 1),
(281, 588, 34, 1387, 97, 1),
(282, 589, 34, 1390, 97, 1),
(283, 590, 34, 1393, 97, 1),
(284, 591, 34, 1396, 97, 1),
(285, 592, 34, 1399, 97, 1),
(286, 593, 34, 1403, 97, 1),
(287, 594, 34, 1405, 97, 1),
(288, 595, 34, 1408, 97, 1),
(289, 596, 34, 1410, 97, 1),
(290, 597, 34, 1412, 97, 1),
(291, 598, 35, 1415, 98, 1),
(292, 599, 35, 1418, 98, 1),
(293, 600, 35, 1421, 98, 1),
(294, 601, 35, 1424, 98, 1),
(295, 602, 35, 1427, 98, 1),
(296, 603, 35, 1430, 98, 1),
(297, 604, 35, 1433, 98, 1),
(298, 605, 35, 1436, 98, 1),
(299, 606, 35, 1438, 98, 1),
(300, 607, 35, 1440, 98, 1),
(301, 618, 36, 1471, 99, 1),
(302, 619, 36, 1476, 99, 1),
(303, 620, 36, 1477, 99, 1),
(304, 621, 36, 1480, 99, 1),
(305, 622, 36, 1483, 99, 1),
(306, 623, 36, 1486, 99, 1),
(307, 624, 36, 1489, 99, 1),
(308, 625, 36, 1492, 99, 1),
(309, 626, 36, 1495, 99, 1),
(310, 627, 36, 1496, 99, 1),
(311, 678, 37, 1639, 102, 1),
(312, 679, 37, 1642, 102, 1),
(313, 680, 37, 1645, 102, 1),
(314, 681, 37, 1648, 102, 1),
(315, 682, 37, 1651, 102, 1),
(316, 683, 37, 1654, 102, 1),
(317, 684, 37, 1657, 102, 1),
(318, 685, 37, 1660, 102, 1),
(319, 686, 37, 1663, 102, 1),
(320, 687, 37, 1665, 102, 1),
(321, 698, 38, 1695, 103, 1),
(322, 699, 38, 1698, 103, 1),
(323, 700, 38, 1701, 103, 1),
(324, 701, 38, 1704, 103, 1),
(325, 702, 38, 1707, 103, 1),
(326, 703, 38, 1710, 103, 1),
(327, 704, 38, 1713, 103, 1),
(328, 705, 38, 1716, 103, 1),
(329, 706, 38, 1718, 103, 1),
(330, 707, 38, 1721, 103, 1),
(331, 728, 39, 1779, 106, 1),
(332, 729, 39, 1784, 106, 1),
(333, 730, 39, 1786, 106, 1),
(334, 731, 39, 1789, 106, 1),
(335, 732, 39, 1792, 106, 1),
(336, 733, 39, 1796, 106, 1),
(337, 734, 39, 1799, 106, 1),
(338, 735, 39, 1801, 106, 1),
(339, 736, 39, 1803, 106, 1),
(340, 737, 39, 1806, 106, 1),
(341, 738, 40, 1807, 107, 1),
(342, 739, 40, 1810, 107, 1),
(343, 740, 40, 0, 107, 1),
(344, 741, 40, 0, 107, 1),
(345, 742, 40, 0, 107, 1),
(346, 743, 40, 1822, 107, 1),
(347, 744, 40, 1825, 107, 1),
(348, 745, 40, 1828, 107, 1),
(349, 746, 40, 1830, 107, 1),
(350, 747, 40, 1832, 107, 1),
(351, 708, 41, 1723, 104, 1),
(352, 709, 41, 1726, 104, 1),
(353, 710, 41, 1729, 104, 1),
(354, 711, 41, 0, 104, 1),
(355, 712, 41, 0, 104, 1),
(356, 713, 41, 1738, 104, 1),
(357, 714, 41, 1741, 104, 1),
(358, 715, 41, 1744, 104, 1),
(359, 716, 41, 1746, 104, 1),
(360, 717, 41, 0, 104, 1),
(361, 738, 42, 1807, 107, 1),
(362, 739, 42, 1810, 107, 1),
(363, 740, 42, 1813, 107, 1),
(364, 741, 42, 0, 107, 1),
(365, 742, 42, 1819, 107, 1),
(366, 743, 42, 0, 107, 1),
(367, 744, 42, 1825, 107, 1),
(368, 745, 42, 1828, 107, 1),
(369, 746, 42, 1830, 107, 1),
(370, 747, 42, 1832, 107, 1),
(371, 708, 43, 1723, 104, 1),
(372, 709, 43, 0, 104, 1),
(373, 710, 43, 0, 104, 1),
(374, 711, 43, 0, 104, 1),
(375, 712, 43, 1735, 104, 1),
(376, 713, 43, 1738, 104, 1),
(377, 714, 43, 1741, 104, 1),
(378, 715, 43, 1744, 104, 1),
(379, 716, 43, 1746, 104, 1),
(380, 717, 43, 1748, 104, 1),
(381, 708, 44, 1724, 104, 1),
(382, 709, 44, 1728, 104, 1),
(383, 710, 44, 1729, 104, 1),
(384, 711, 44, 0, 104, 1),
(385, 712, 44, 0, 104, 1),
(386, 713, 44, 1740, 104, 1),
(387, 714, 44, 1742, 104, 1),
(388, 715, 44, 1744, 104, 1),
(389, 716, 44, 0, 104, 1),
(390, 717, 44, 0, 104, 1),
(391, 718, 45, 1751, 105, 1),
(392, 719, 45, 1754, 105, 1),
(393, 720, 45, 1757, 105, 1),
(394, 721, 45, 0, 105, 1),
(395, 722, 45, 0, 105, 1),
(396, 723, 45, 1766, 105, 1),
(397, 724, 45, 1769, 105, 1),
(398, 725, 45, 1772, 105, 1),
(399, 726, 45, 1774, 105, 1),
(400, 727, 45, 0, 105, 1),
(401, 748, 46, 1835, 108, 1),
(402, 749, 46, 0, 108, 1),
(403, 750, 46, 1841, 108, 1),
(404, 751, 46, 0, 108, 1),
(405, 752, 46, 0, 108, 1),
(406, 753, 46, 1850, 108, 1),
(407, 754, 46, 1853, 108, 1),
(408, 755, 46, 1856, 108, 1),
(409, 756, 46, 1858, 108, 1),
(410, 757, 46, 1860, 108, 1),
(411, 748, 47, 1835, 108, 1),
(412, 749, 47, 1838, 108, 1),
(413, 750, 47, 1841, 108, 1),
(414, 751, 47, 0, 108, 1),
(415, 752, 47, 1847, 108, 1),
(416, 753, 47, 0, 108, 1),
(417, 754, 47, 0, 108, 1),
(418, 755, 47, 1856, 108, 1),
(419, 756, 47, 1858, 108, 1),
(420, 757, 47, 1860, 108, 1),
(421, 748, 48, 1836, 108, 1),
(422, 749, 48, 1840, 108, 1),
(423, 750, 48, 1841, 108, 1),
(424, 751, 48, 0, 108, 1),
(425, 752, 48, 1847, 108, 1),
(426, 753, 48, 1852, 108, 1),
(427, 754, 48, 0, 108, 1),
(428, 755, 48, 1856, 108, 1),
(429, 756, 48, 0, 108, 1),
(430, 757, 48, 0, 108, 1),
(431, 708, 49, 1725, 104, 1),
(432, 709, 49, 1728, 104, 1),
(433, 710, 49, 1731, 104, 1),
(434, 711, 49, 0, 104, 1),
(435, 712, 49, 1737, 104, 1),
(436, 713, 49, 1739, 104, 1),
(437, 714, 49, 1741, 104, 1),
(438, 715, 49, 1744, 104, 1),
(439, 716, 49, 1747, 104, 1),
(440, 717, 49, 1750, 104, 1),
(441, 748, 50, 1837, 108, 1),
(442, 749, 50, 1840, 108, 1),
(443, 750, 50, 1843, 108, 1),
(444, 751, 50, 0, 108, 1),
(445, 752, 50, 1849, 108, 1),
(446, 753, 50, 1852, 108, 1),
(447, 754, 50, 1855, 108, 1),
(448, 755, 50, 1857, 108, 1),
(449, 756, 50, 1859, 108, 1),
(450, 757, 50, 1862, 108, 1),
(451, 768, 51, 1891, 110, 1),
(452, 769, 51, 1894, 110, 1),
(453, 770, 51, 1897, 110, 1),
(454, 771, 51, 0, 110, 1),
(455, 772, 51, 0, 110, 1),
(456, 773, 51, 1906, 110, 1),
(457, 774, 51, 1909, 110, 1),
(458, 775, 51, 1912, 110, 1),
(459, 776, 51, 1914, 110, 1),
(460, 777, 51, 0, 110, 1),
(461, 768, 52, 0, 110, 1),
(462, 769, 52, 0, 110, 1),
(463, 770, 52, 1897, 110, 1),
(464, 771, 52, 0, 110, 1),
(465, 772, 52, 1903, 110, 1),
(466, 773, 52, 1907, 110, 1),
(467, 774, 52, 1909, 110, 1),
(468, 775, 52, 1912, 110, 1),
(469, 776, 52, 1914, 110, 1),
(470, 777, 52, 1916, 110, 1),
(471, 778, 53, 1919, 111, 1),
(472, 779, 53, 1922, 111, 1),
(473, 780, 53, 1925, 111, 1),
(474, 781, 53, 0, 111, 1),
(475, 782, 53, 0, 111, 1),
(476, 783, 53, 1934, 111, 1),
(477, 784, 53, 1937, 111, 1),
(478, 785, 53, 1940, 111, 1),
(479, 786, 53, 1942, 111, 1),
(480, 787, 53, 0, 111, 1),
(481, 778, 54, 1919, 111, 1),
(482, 779, 54, 0, 111, 1),
(483, 780, 54, 0, 111, 1),
(484, 781, 54, 0, 111, 1),
(485, 782, 54, 1931, 111, 1),
(486, 783, 54, 1934, 111, 1),
(487, 784, 54, 1937, 111, 1),
(488, 785, 54, 1940, 111, 1),
(489, 786, 54, 1942, 111, 1),
(490, 787, 54, 1944, 111, 1),
(491, 778, 55, 1920, 111, 1),
(492, 779, 55, 1924, 111, 1),
(493, 780, 55, 1925, 111, 1),
(494, 781, 55, 0, 111, 1),
(495, 782, 55, 0, 111, 1),
(496, 783, 55, 1936, 111, 1),
(497, 784, 55, 1938, 111, 1),
(498, 785, 55, 1940, 111, 1),
(499, 786, 55, 0, 111, 1),
(500, 787, 55, 0, 111, 1),
(501, 768, 56, 0, 110, 1),
(502, 769, 56, 1896, 110, 1),
(503, 770, 56, 1897, 110, 1),
(504, 771, 56, 0, 110, 1),
(505, 772, 56, 0, 110, 1),
(506, 773, 56, 1908, 110, 1),
(507, 774, 56, 1910, 110, 1),
(508, 775, 56, 1912, 110, 1),
(509, 776, 56, 0, 110, 1),
(510, 777, 56, 1916, 110, 1),
(511, 768, 57, 1893, 110, 1),
(512, 769, 57, 1895, 110, 1),
(513, 770, 57, 1898, 110, 1),
(514, 771, 57, 0, 110, 1),
(515, 772, 57, 1903, 110, 1),
(516, 773, 57, 1907, 110, 1),
(517, 774, 57, 1910, 110, 1),
(518, 775, 57, 1913, 110, 1),
(519, 776, 57, 1915, 110, 1),
(520, 777, 57, 1917, 110, 1),
(521, 778, 58, 1921, 111, 1),
(522, 779, 58, 1924, 111, 1),
(523, 780, 58, 1927, 111, 1),
(524, 781, 58, 0, 111, 1),
(525, 782, 58, 1933, 111, 1),
(526, 783, 58, 1935, 111, 1),
(527, 784, 58, 1937, 111, 1),
(528, 785, 58, 1940, 111, 1),
(529, 786, 58, 1943, 111, 1),
(530, 787, 58, 1946, 111, 1),
(531, 788, 59, 1947, 112, 1),
(532, 789, 59, 1950, 112, 1),
(533, 790, 59, 1953, 112, 1),
(534, 791, 59, 0, 112, 1),
(535, 792, 59, 0, 112, 1),
(536, 793, 59, 1962, 112, 1),
(537, 794, 59, 1965, 112, 1),
(538, 795, 59, 1968, 112, 1),
(539, 796, 59, 1970, 112, 1),
(540, 797, 59, 0, 112, 1),
(541, 868, 60, 2171, 114, 1),
(542, 869, 60, 0, 114, 1),
(543, 870, 60, 2177, 114, 1),
(544, 871, 60, 0, 114, 1),
(545, 872, 60, 0, 114, 1),
(546, 873, 60, 2186, 114, 1),
(547, 874, 60, 2189, 114, 1),
(548, 875, 60, 2192, 114, 1),
(549, 876, 60, 2194, 114, 1),
(550, 877, 60, 2196, 114, 1),
(551, 868, 61, 2171, 114, 1),
(552, 869, 61, 2174, 114, 1),
(553, 870, 61, 2177, 114, 1),
(554, 871, 61, 0, 114, 1),
(555, 872, 61, 2183, 114, 1),
(556, 873, 61, 0, 114, 1),
(557, 874, 61, 0, 114, 1),
(558, 875, 61, 2192, 114, 1),
(559, 876, 61, 2194, 114, 1),
(560, 877, 61, 2196, 114, 1),
(561, 828, 62, 2059, 113, 1),
(562, 829, 62, 2062, 113, 1),
(563, 830, 62, 2065, 113, 1),
(564, 831, 62, 0, 113, 1),
(565, 832, 62, 0, 113, 1),
(566, 833, 62, 2074, 113, 1),
(567, 834, 62, 2077, 113, 1),
(568, 835, 62, 2080, 113, 1),
(569, 836, 62, 2082, 113, 1),
(570, 837, 62, 0, 113, 1),
(571, 788, 63, 1947, 112, 1),
(572, 789, 63, 0, 112, 1),
(573, 790, 63, 0, 112, 1),
(574, 791, 63, 0, 112, 1),
(575, 792, 63, 1959, 112, 1),
(576, 793, 63, 1962, 112, 1),
(577, 794, 63, 1965, 112, 1),
(578, 795, 63, 1968, 112, 1),
(579, 796, 63, 1970, 112, 1),
(580, 797, 63, 1972, 112, 1),
(581, 868, 64, 2172, 114, 1),
(582, 869, 64, 2176, 114, 1),
(583, 870, 64, 2177, 114, 1),
(584, 871, 64, 0, 114, 1),
(585, 872, 64, 2183, 114, 1),
(586, 873, 64, 2188, 114, 1),
(587, 874, 64, 0, 114, 1),
(588, 875, 64, 2192, 114, 1),
(589, 876, 64, 0, 114, 1),
(590, 877, 64, 0, 114, 1),
(591, 868, 65, 2173, 114, 1),
(592, 869, 65, 2176, 114, 1),
(593, 870, 65, 2179, 114, 1),
(594, 871, 65, 0, 114, 1),
(595, 872, 65, 2185, 114, 1),
(596, 873, 65, 2188, 114, 1),
(597, 874, 65, 2191, 114, 1),
(598, 875, 65, 2193, 114, 1),
(599, 876, 65, 2195, 114, 1),
(600, 877, 65, 2198, 114, 1),
(601, 788, 66, 1947, 112, 1),
(602, 789, 66, 1951, 112, 1),
(603, 790, 66, 1953, 112, 1),
(604, 791, 66, 1956, 112, 1),
(605, 792, 66, 1959, 112, 1),
(606, 793, 66, 1963, 112, 1),
(607, 794, 66, 1965, 112, 1),
(608, 795, 66, 1968, 112, 1),
(609, 796, 66, 1970, 112, 1),
(610, 797, 66, 1972, 112, 1),
(611, 788, 67, 1947, 112, 1),
(612, 789, 67, 1950, 112, 1),
(613, 790, 67, 1953, 112, 1),
(614, 791, 67, 1956, 112, 1),
(615, 792, 67, 1959, 112, 1),
(616, 793, 67, 1962, 112, 1),
(617, 794, 67, 1965, 112, 1),
(618, 795, 67, 1968, 112, 1),
(619, 796, 67, 1970, 112, 1),
(620, 797, 67, 1972, 112, 1),
(621, 828, 68, 0, 113, 1),
(622, 829, 68, 0, 113, 1),
(623, 830, 68, 2065, 113, 1),
(624, 831, 68, 0, 113, 1),
(625, 832, 68, 2071, 113, 1),
(626, 833, 68, 2075, 113, 1),
(627, 834, 68, 2077, 113, 1),
(628, 835, 68, 2080, 113, 1),
(629, 836, 68, 2082, 113, 1),
(630, 837, 68, 2084, 113, 1),
(631, 828, 69, 0, 113, 1),
(632, 829, 69, 2064, 113, 1),
(633, 830, 69, 2065, 113, 1),
(634, 831, 69, 0, 113, 1),
(635, 832, 69, 0, 113, 1),
(636, 833, 69, 2076, 113, 1),
(637, 834, 69, 2078, 113, 1),
(638, 835, 69, 2080, 113, 1),
(639, 836, 69, 0, 113, 1),
(640, 837, 69, 2084, 113, 1),
(641, 948, 70, 2395, 116, 1),
(642, 949, 70, 2398, 116, 1),
(643, 950, 70, 2401, 116, 1),
(644, 951, 70, 0, 116, 1),
(645, 952, 70, 0, 116, 1),
(646, 953, 70, 2410, 116, 1),
(647, 954, 70, 2413, 116, 1),
(648, 955, 70, 2416, 116, 1),
(649, 956, 70, 2418, 116, 1),
(650, 957, 70, 0, 116, 1),
(651, 828, 71, 2061, 113, 1),
(652, 829, 71, 2063, 113, 1),
(653, 830, 71, 2066, 113, 1),
(654, 831, 71, 0, 113, 1),
(655, 832, 71, 2071, 113, 1),
(656, 833, 71, 2075, 113, 1),
(657, 834, 71, 2078, 113, 1),
(658, 835, 71, 2081, 113, 1),
(659, 836, 71, 2083, 113, 1),
(660, 837, 71, 2085, 113, 1),
(661, 908, 72, 2283, 115, 1),
(662, 909, 72, 2286, 115, 1),
(663, 910, 72, 0, 115, 1),
(664, 911, 72, 0, 115, 1),
(665, 912, 72, 0, 115, 1),
(666, 913, 72, 2298, 115, 1),
(667, 914, 72, 2301, 115, 1),
(668, 915, 72, 2304, 115, 1),
(669, 916, 72, 2306, 115, 1),
(670, 917, 72, 2308, 115, 1),
(671, 948, 73, 2395, 116, 1),
(672, 949, 73, 0, 116, 1),
(673, 950, 73, 0, 116, 1),
(674, 951, 73, 0, 116, 1),
(675, 952, 73, 2407, 116, 1),
(676, 953, 73, 2410, 116, 1),
(677, 954, 73, 2413, 116, 1),
(678, 955, 73, 2416, 116, 1),
(679, 956, 73, 2418, 116, 1),
(680, 957, 73, 2420, 116, 1),
(681, 908, 74, 2283, 115, 1),
(682, 909, 74, 2286, 115, 1),
(683, 910, 74, 2289, 115, 1),
(684, 911, 74, 0, 115, 1),
(685, 912, 74, 2295, 115, 1),
(686, 913, 74, 0, 115, 1),
(687, 914, 74, 2301, 115, 1),
(688, 915, 74, 2304, 115, 1),
(689, 916, 74, 2306, 115, 1),
(690, 917, 74, 2308, 115, 1),
(691, 908, 75, 0, 115, 1),
(692, 909, 75, 2288, 115, 1),
(693, 910, 75, 2289, 115, 1),
(694, 911, 75, 0, 115, 1),
(695, 912, 75, 2295, 115, 1),
(696, 913, 75, 2300, 115, 1),
(697, 914, 75, 2302, 115, 1),
(698, 915, 75, 2304, 115, 1),
(699, 916, 75, 0, 115, 1),
(700, 917, 75, 0, 115, 1),
(701, 948, 76, 2396, 116, 1),
(702, 949, 76, 2400, 116, 1),
(703, 950, 76, 2401, 116, 1),
(704, 951, 76, 0, 116, 1),
(705, 952, 76, 0, 116, 1),
(706, 953, 76, 2412, 116, 1),
(707, 954, 76, 2414, 116, 1),
(708, 955, 76, 2416, 116, 1),
(709, 956, 76, 0, 116, 1),
(710, 957, 76, 0, 116, 1),
(711, 908, 77, 2285, 115, 1),
(712, 909, 77, 2288, 115, 1),
(713, 910, 77, 2291, 115, 1),
(714, 911, 77, 0, 115, 1),
(715, 912, 77, 2297, 115, 1),
(716, 913, 77, 2299, 115, 1),
(717, 914, 77, 2301, 115, 1),
(718, 915, 77, 2304, 115, 1),
(719, 916, 77, 2307, 115, 1),
(720, 917, 77, 2310, 115, 1),
(721, 948, 78, 2397, 116, 1),
(722, 949, 78, 2400, 116, 1),
(723, 950, 78, 2403, 116, 1),
(724, 951, 78, 0, 116, 1),
(725, 952, 78, 2409, 116, 1),
(726, 953, 78, 2411, 116, 1),
(727, 954, 78, 2413, 116, 1),
(728, 955, 78, 2416, 116, 1),
(729, 956, 78, 2419, 116, 1),
(730, 957, 78, 2422, 116, 1),
(731, 1028, 79, 2619, 118, 1),
(732, 1029, 79, 2622, 118, 1),
(733, 1030, 79, 2625, 118, 1),
(734, 1031, 79, 0, 118, 1),
(735, 1032, 79, 0, 118, 1),
(736, 1033, 79, 2634, 118, 1),
(737, 1034, 79, 2637, 118, 1),
(738, 1035, 79, 2640, 118, 1),
(739, 1036, 79, 2642, 118, 1),
(740, 1037, 79, 0, 118, 1),
(741, 1028, 80, 0, 118, 1),
(742, 1029, 80, 0, 118, 1),
(743, 1030, 80, 2625, 118, 1),
(744, 1031, 80, 0, 118, 1),
(745, 1032, 80, 2631, 118, 1),
(746, 1033, 80, 2635, 118, 1),
(747, 1034, 80, 2637, 118, 1),
(748, 1035, 80, 2640, 118, 1),
(749, 1036, 80, 2642, 118, 1),
(750, 1037, 80, 2644, 118, 1),
(751, 1028, 81, 0, 118, 1),
(752, 1029, 81, 2624, 118, 1),
(753, 1030, 81, 2625, 118, 1),
(754, 1031, 81, 0, 118, 1),
(755, 1032, 81, 0, 118, 1),
(756, 1033, 81, 2636, 118, 1),
(757, 1034, 81, 2638, 118, 1),
(758, 1035, 81, 2640, 118, 1),
(759, 1036, 81, 0, 118, 1),
(760, 1037, 81, 2644, 118, 1),
(761, 1028, 82, 2621, 118, 1),
(762, 1029, 82, 2623, 118, 1),
(763, 1030, 82, 2626, 118, 1),
(764, 1031, 82, 0, 118, 1),
(765, 1032, 82, 2631, 118, 1),
(766, 1033, 82, 2635, 118, 1),
(767, 1034, 82, 2638, 118, 1),
(768, 1035, 82, 2641, 118, 1),
(769, 1036, 82, 2643, 118, 1),
(770, 1037, 82, 2645, 118, 1),
(771, 988, 83, 2507, 117, 1),
(772, 989, 83, 0, 117, 1),
(773, 990, 83, 2513, 117, 1),
(774, 991, 83, 0, 117, 1),
(775, 992, 83, 0, 117, 1),
(776, 993, 83, 2522, 117, 1),
(777, 994, 83, 2525, 117, 1),
(778, 995, 83, 2528, 117, 1),
(779, 996, 83, 2530, 117, 1),
(780, 997, 83, 2532, 117, 1),
(781, 988, 84, 2507, 117, 1),
(782, 989, 84, 2510, 117, 1),
(783, 990, 84, 2513, 117, 1),
(784, 991, 84, 0, 117, 1),
(785, 992, 84, 2519, 117, 1),
(786, 993, 84, 0, 117, 1),
(787, 994, 84, 0, 117, 1),
(788, 995, 84, 2528, 117, 1),
(789, 996, 84, 2530, 117, 1),
(790, 997, 84, 2532, 117, 1),
(791, 988, 85, 2508, 117, 1),
(792, 989, 85, 2512, 117, 1),
(793, 990, 85, 2513, 117, 1),
(794, 991, 85, 0, 117, 1),
(795, 992, 85, 2519, 117, 1),
(796, 993, 85, 2524, 117, 1),
(797, 994, 85, 0, 117, 1),
(798, 995, 85, 2528, 117, 1),
(799, 996, 85, 0, 117, 1),
(800, 997, 85, 0, 117, 1),
(801, 988, 86, 2509, 117, 1),
(802, 989, 86, 2512, 117, 1),
(803, 990, 86, 2515, 117, 1),
(804, 991, 86, 0, 117, 1),
(805, 992, 86, 2521, 117, 1),
(806, 993, 86, 2524, 117, 1),
(807, 994, 86, 2527, 117, 1),
(808, 995, 86, 2529, 117, 1),
(809, 996, 86, 2531, 117, 1),
(810, 997, 86, 2534, 117, 1),
(811, 1068, 87, 2731, 119, 1),
(812, 1069, 87, 2734, 119, 1),
(813, 1070, 87, 2737, 119, 1),
(814, 1071, 87, 2740, 119, 1),
(815, 1072, 87, 2743, 119, 1),
(816, 1073, 87, 2746, 119, 1),
(817, 1074, 87, 2749, 119, 1),
(818, 1075, 87, 2752, 119, 1),
(819, 1076, 87, 2754, 119, 1),
(820, 1077, 87, 2756, 119, 1),
(821, 1068, 88, 2732, 119, 1),
(822, 1069, 88, 2734, 119, 1),
(823, 1070, 88, 2737, 119, 1),
(824, 1071, 88, 2740, 119, 1),
(825, 1072, 88, 2743, 119, 1),
(826, 1073, 88, 2746, 119, 1),
(827, 1074, 88, 2749, 119, 1),
(828, 1075, 88, 2752, 119, 1),
(829, 1076, 88, 2754, 119, 1),
(830, 1077, 88, 2756, 119, 1),
(831, 1068, 89, 2733, 119, 1),
(832, 1069, 89, 2734, 119, 1),
(833, 1070, 89, 2737, 119, 1),
(834, 1071, 89, 2740, 119, 1),
(835, 1072, 89, 2743, 119, 1),
(836, 1073, 89, 2746, 119, 1),
(837, 1074, 89, 2749, 119, 1),
(838, 1075, 89, 2752, 119, 1),
(839, 1076, 89, 2754, 119, 1),
(840, 1077, 89, 2756, 119, 1),
(841, 1098, 90, 2815, 120, 1),
(842, 1099, 90, 2818, 120, 1),
(843, 1100, 90, 2821, 120, 1),
(844, 1101, 90, 0, 120, 1),
(845, 1102, 90, 0, 120, 1),
(846, 1103, 90, 2830, 120, 1),
(847, 1104, 90, 2833, 120, 1),
(848, 1105, 90, 2836, 120, 1),
(849, 1106, 90, 2838, 120, 1),
(850, 1107, 90, 0, 120, 1),
(851, 1098, 91, 2815, 120, 1),
(852, 1099, 91, 0, 120, 1),
(853, 1100, 91, 0, 120, 1),
(854, 1101, 91, 0, 120, 1),
(855, 1102, 91, 2827, 120, 1),
(856, 1103, 91, 2830, 120, 1),
(857, 1104, 91, 2833, 120, 1),
(858, 1105, 91, 2836, 120, 1),
(859, 1106, 91, 2838, 120, 1),
(860, 1107, 91, 2840, 120, 1),
(861, 1098, 92, 2816, 120, 1),
(862, 1099, 92, 2820, 120, 1),
(863, 1100, 92, 2821, 120, 1),
(864, 1101, 92, 0, 120, 1),
(865, 1102, 92, 0, 120, 1),
(866, 1103, 92, 2832, 120, 1),
(867, 1104, 92, 2834, 120, 1),
(868, 1105, 92, 2836, 120, 1),
(869, 1106, 92, 0, 120, 1),
(870, 1107, 92, 0, 120, 1),
(871, 1098, 93, 2817, 120, 1),
(872, 1099, 93, 2820, 120, 1),
(873, 1100, 93, 2823, 120, 1),
(874, 1101, 93, 0, 120, 1),
(875, 1102, 93, 2829, 120, 1),
(876, 1103, 93, 2831, 120, 1),
(877, 1104, 93, 2833, 120, 1),
(878, 1105, 93, 2836, 120, 1),
(879, 1106, 93, 2839, 120, 1),
(880, 1107, 93, 2842, 120, 1),
(881, 1138, 94, 2927, 121, 1),
(882, 1139, 94, 2930, 121, 1),
(883, 1140, 94, 2933, 121, 1),
(884, 1141, 94, 2936, 121, 1),
(885, 1142, 94, 2939, 121, 1),
(886, 1143, 94, 2942, 121, 1),
(887, 1144, 94, 2945, 121, 1),
(888, 1145, 94, 2948, 121, 1),
(889, 1146, 94, 2950, 121, 1),
(890, 1147, 94, 2952, 121, 1),
(891, 1168, 95, 3011, 122, 1),
(892, 1169, 95, 3014, 122, 1),
(893, 1170, 95, 3017, 122, 1),
(894, 1171, 95, 3020, 122, 1),
(895, 1172, 95, 3023, 122, 1),
(896, 1173, 95, 3026, 122, 1),
(897, 1174, 95, 3029, 122, 1),
(898, 1175, 95, 3032, 122, 1),
(899, 1176, 95, 3034, 122, 1),
(900, 1177, 95, 3036, 122, 1),
(901, 1178, 96, 3039, 122, 1),
(902, 1179, 96, 3043, 122, 1),
(903, 1180, 96, 3045, 122, 1),
(904, 1181, 96, 3049, 122, 1),
(905, 1182, 96, 3051, 122, 1),
(906, 1183, 96, 3054, 122, 1),
(907, 1184, 96, 3057, 122, 1),
(908, 1185, 96, 3060, 122, 1),
(909, 1186, 96, 3062, 122, 1),
(910, 1187, 96, 3065, 122, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recycle_components`
--

CREATE TABLE IF NOT EXISTS `tbl_recycle_components` (
  `id` int(16) NOT NULL,
  `method_id` int(16) NOT NULL,
  `component_id` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recycle_methods`
--

CREATE TABLE IF NOT EXISTS `tbl_recycle_methods` (
  `id` int(16) NOT NULL,
  `method_code` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `game_id` int(16) DEFAULT NULL,
  `round_id` int(16) DEFAULT NULL,
  `factor_id` int(16) DEFAULT NULL,
  `factor_value` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4555 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_recycle_methods`
--

INSERT INTO `tbl_recycle_methods` (`id`, `method_code`, `game_id`, `round_id`, `factor_id`, `factor_value`) VALUES
(1, '1', 0, 1, 1, 'Method 1'),
(2, '2', 0, 1, 1, 'Method 2'),
(3, '2', 0, 1, 2, '2000'),
(4, '1', 0, 1, 3, '1000'),
(5, '1', 0, 1, 4, '1'),
(6, '2', 0, 1, 5, '2'),
(7, '2', 0, 1, 6, '50'),
(8, '2', 0, 1, 7, '20'),
(9, '1', 0, 1, 8, '30'),
(10, '1', 0, 1, 2, '2000'),
(11, '2', 0, 1, 3, '1000'),
(12, '2', 0, 1, 4, '1'),
(13, '1', 0, 1, 5, '1'),
(14, '1', 0, 1, 6, '10'),
(15, '1', 0, 1, 7, '20'),
(16, '2', 0, 1, 8, '30'),
(4098, 'a6d8665c-3cdd-4564-8602-b8de1fc8f84f', 246, 4, 8, '30'),
(4097, 'a6d8665c-3cdd-4564-8602-b8de1fc8f84f', 246, 4, 7, '20'),
(4096, 'a6d8665c-3cdd-4564-8602-b8de1fc8f84f', 246, 4, 6, '10'),
(4095, 'a6d8665c-3cdd-4564-8602-b8de1fc8f84f', 246, 4, 5, '1'),
(4094, 'a6d8665c-3cdd-4564-8602-b8de1fc8f84f', 246, 4, 4, '1'),
(4093, 'a6d8665c-3cdd-4564-8602-b8de1fc8f84f', 246, 4, 3, '1000'),
(4092, 'a6d8665c-3cdd-4564-8602-b8de1fc8f84f', 246, 4, 2, '2000'),
(4091, 'a6d8665c-3cdd-4564-8602-b8de1fc8f84f', 246, 4, 1, 'Method 1'),
(4090, 'fa201c30-74a3-4b30-9382-1a4126543301', 246, 3, 8, '30'),
(4089, 'fa201c30-74a3-4b30-9382-1a4126543301', 246, 3, 7, '20'),
(4088, 'fa201c30-74a3-4b30-9382-1a4126543301', 246, 3, 6, '50'),
(4087, 'fa201c30-74a3-4b30-9382-1a4126543301', 246, 3, 5, '2'),
(4086, 'fa201c30-74a3-4b30-9382-1a4126543301', 246, 3, 4, '1'),
(4085, 'fa201c30-74a3-4b30-9382-1a4126543301', 246, 3, 3, '1000'),
(4084, 'fa201c30-74a3-4b30-9382-1a4126543301', 246, 3, 2, '2000'),
(4083, 'fa201c30-74a3-4b30-9382-1a4126543301', 246, 3, 1, 'Method 2'),
(4082, 'baa82def-dc50-4c92-a632-3cbfe18773cd', 246, 3, 8, '30'),
(4081, 'baa82def-dc50-4c92-a632-3cbfe18773cd', 246, 3, 7, '20'),
(4080, 'baa82def-dc50-4c92-a632-3cbfe18773cd', 246, 3, 6, '10'),
(4079, 'baa82def-dc50-4c92-a632-3cbfe18773cd', 246, 3, 5, '1'),
(4078, 'baa82def-dc50-4c92-a632-3cbfe18773cd', 246, 3, 4, '1'),
(4077, 'baa82def-dc50-4c92-a632-3cbfe18773cd', 246, 3, 3, '1000'),
(4076, 'baa82def-dc50-4c92-a632-3cbfe18773cd', 246, 3, 2, '2000'),
(4075, 'baa82def-dc50-4c92-a632-3cbfe18773cd', 246, 3, 1, 'Method 1'),
(4074, '1de971d0-a146-4125-9e08-7612d2ab8e29', 246, 2, 8, '30'),
(4073, '1de971d0-a146-4125-9e08-7612d2ab8e29', 246, 2, 7, '20'),
(4072, '1de971d0-a146-4125-9e08-7612d2ab8e29', 246, 2, 6, '50'),
(4071, '1de971d0-a146-4125-9e08-7612d2ab8e29', 246, 2, 5, '2'),
(4070, '1de971d0-a146-4125-9e08-7612d2ab8e29', 246, 2, 4, '1'),
(4069, '1de971d0-a146-4125-9e08-7612d2ab8e29', 246, 2, 3, '1000'),
(4068, '1de971d0-a146-4125-9e08-7612d2ab8e29', 246, 2, 2, '2000'),
(4067, '1de971d0-a146-4125-9e08-7612d2ab8e29', 246, 2, 1, 'Method 2'),
(4066, '9147d95c-2315-498f-af8a-8d3cee50d532', 246, 2, 8, '30'),
(4065, '9147d95c-2315-498f-af8a-8d3cee50d532', 246, 2, 7, '20'),
(4064, '9147d95c-2315-498f-af8a-8d3cee50d532', 246, 2, 6, '10'),
(4063, '9147d95c-2315-498f-af8a-8d3cee50d532', 246, 2, 5, '1'),
(4062, '9147d95c-2315-498f-af8a-8d3cee50d532', 246, 2, 4, '1'),
(4061, '9147d95c-2315-498f-af8a-8d3cee50d532', 246, 2, 3, '1000'),
(4060, '9147d95c-2315-498f-af8a-8d3cee50d532', 246, 2, 2, '2000'),
(4059, '9147d95c-2315-498f-af8a-8d3cee50d532', 246, 2, 1, 'Method 1'),
(4058, '1caa11b8-47f4-44e1-a4b0-9e5994b9df7a', 246, 1, 8, '30'),
(4057, '1caa11b8-47f4-44e1-a4b0-9e5994b9df7a', 246, 1, 7, '20'),
(4056, '1caa11b8-47f4-44e1-a4b0-9e5994b9df7a', 246, 1, 6, '50'),
(4055, '1caa11b8-47f4-44e1-a4b0-9e5994b9df7a', 246, 1, 5, '2'),
(4054, '1caa11b8-47f4-44e1-a4b0-9e5994b9df7a', 246, 1, 4, '1'),
(4053, '1caa11b8-47f4-44e1-a4b0-9e5994b9df7a', 246, 1, 3, '1000'),
(4052, '1caa11b8-47f4-44e1-a4b0-9e5994b9df7a', 246, 1, 2, '2000'),
(4051, '1caa11b8-47f4-44e1-a4b0-9e5994b9df7a', 246, 1, 1, 'Method 2'),
(4050, '0b051fda-0968-4117-83cf-a1a82552457c', 246, 1, 8, '30'),
(4049, '0b051fda-0968-4117-83cf-a1a82552457c', 246, 1, 7, '20'),
(4048, '0b051fda-0968-4117-83cf-a1a82552457c', 246, 1, 6, '10'),
(4047, '0b051fda-0968-4117-83cf-a1a82552457c', 246, 1, 5, '1'),
(4046, '0b051fda-0968-4117-83cf-a1a82552457c', 246, 1, 4, '1'),
(4043, '0b051fda-0968-4117-83cf-a1a82552457c', 246, 1, 1, 'Method 1'),
(4044, '0b051fda-0968-4117-83cf-a1a82552457c', 246, 1, 2, '2000'),
(4045, '0b051fda-0968-4117-83cf-a1a82552457c', 246, 1, 3, '1000'),
(4138, 'b1f106c6-f9bd-4757-b45a-7746efbd6b2c', 247, 2, 8, '30'),
(4137, 'b1f106c6-f9bd-4757-b45a-7746efbd6b2c', 247, 2, 7, '20'),
(4136, 'b1f106c6-f9bd-4757-b45a-7746efbd6b2c', 247, 2, 6, '50'),
(4135, 'b1f106c6-f9bd-4757-b45a-7746efbd6b2c', 247, 2, 5, '2'),
(4134, 'b1f106c6-f9bd-4757-b45a-7746efbd6b2c', 247, 2, 4, '1'),
(4133, 'b1f106c6-f9bd-4757-b45a-7746efbd6b2c', 247, 2, 3, '1000'),
(4132, 'b1f106c6-f9bd-4757-b45a-7746efbd6b2c', 247, 2, 2, '2000'),
(4131, 'b1f106c6-f9bd-4757-b45a-7746efbd6b2c', 247, 2, 1, 'Method 2'),
(4130, 'c3fb8c2b-e4e6-41b7-8b28-748b17b0dd09', 247, 2, 8, '30'),
(4129, 'c3fb8c2b-e4e6-41b7-8b28-748b17b0dd09', 247, 2, 7, '20'),
(4128, 'c3fb8c2b-e4e6-41b7-8b28-748b17b0dd09', 247, 2, 6, '10'),
(4127, 'c3fb8c2b-e4e6-41b7-8b28-748b17b0dd09', 247, 2, 5, '1'),
(4126, 'c3fb8c2b-e4e6-41b7-8b28-748b17b0dd09', 247, 2, 4, '1'),
(4125, 'c3fb8c2b-e4e6-41b7-8b28-748b17b0dd09', 247, 2, 3, '1000'),
(4124, 'c3fb8c2b-e4e6-41b7-8b28-748b17b0dd09', 247, 2, 2, '2000'),
(4123, 'c3fb8c2b-e4e6-41b7-8b28-748b17b0dd09', 247, 2, 1, 'Method 1'),
(4122, 'ac2457d2-fa26-4bd8-9660-3ef83748ea81', 247, 1, 8, '30'),
(4121, 'ac2457d2-fa26-4bd8-9660-3ef83748ea81', 247, 1, 7, '20'),
(4120, 'ac2457d2-fa26-4bd8-9660-3ef83748ea81', 247, 1, 6, '50'),
(4119, 'ac2457d2-fa26-4bd8-9660-3ef83748ea81', 247, 1, 5, '2'),
(4118, 'ac2457d2-fa26-4bd8-9660-3ef83748ea81', 247, 1, 4, '1'),
(4117, 'ac2457d2-fa26-4bd8-9660-3ef83748ea81', 247, 1, 3, '1000'),
(4116, 'ac2457d2-fa26-4bd8-9660-3ef83748ea81', 247, 1, 2, '2000'),
(4115, 'ac2457d2-fa26-4bd8-9660-3ef83748ea81', 247, 1, 1, 'Method 2'),
(4114, '35b435ed-434e-4aaf-a3bf-ca8f871dafd2', 247, 1, 8, '30'),
(4113, '35b435ed-434e-4aaf-a3bf-ca8f871dafd2', 247, 1, 7, '20'),
(4112, '35b435ed-434e-4aaf-a3bf-ca8f871dafd2', 247, 1, 6, '10'),
(4111, '35b435ed-434e-4aaf-a3bf-ca8f871dafd2', 247, 1, 5, '1'),
(4110, '35b435ed-434e-4aaf-a3bf-ca8f871dafd2', 247, 1, 4, '1'),
(4109, '35b435ed-434e-4aaf-a3bf-ca8f871dafd2', 247, 1, 3, '1000'),
(4108, '35b435ed-434e-4aaf-a3bf-ca8f871dafd2', 247, 1, 2, '2000'),
(4107, '35b435ed-434e-4aaf-a3bf-ca8f871dafd2', 247, 1, 1, 'Method 1'),
(4106, 'cff6b0fa-62f3-4550-8e06-204a6487c441', 246, 4, 8, '30'),
(4105, 'cff6b0fa-62f3-4550-8e06-204a6487c441', 246, 4, 7, '20'),
(4104, 'cff6b0fa-62f3-4550-8e06-204a6487c441', 246, 4, 6, '50'),
(4103, 'cff6b0fa-62f3-4550-8e06-204a6487c441', 246, 4, 5, '2'),
(4102, 'cff6b0fa-62f3-4550-8e06-204a6487c441', 246, 4, 4, '1'),
(4099, 'cff6b0fa-62f3-4550-8e06-204a6487c441', 246, 4, 1, 'Method 2'),
(4100, 'cff6b0fa-62f3-4550-8e06-204a6487c441', 246, 4, 2, '2000'),
(4101, 'cff6b0fa-62f3-4550-8e06-204a6487c441', 246, 4, 3, '1000'),
(4178, '8444afef-7abf-458c-93b3-757d9d9c465a', 248, 1, 8, '30'),
(4177, '8444afef-7abf-458c-93b3-757d9d9c465a', 248, 1, 7, '20'),
(4176, '8444afef-7abf-458c-93b3-757d9d9c465a', 248, 1, 6, '10'),
(4175, '8444afef-7abf-458c-93b3-757d9d9c465a', 248, 1, 5, '1'),
(4174, '8444afef-7abf-458c-93b3-757d9d9c465a', 248, 1, 4, '1'),
(4173, '8444afef-7abf-458c-93b3-757d9d9c465a', 248, 1, 3, '1000'),
(4172, '8444afef-7abf-458c-93b3-757d9d9c465a', 248, 1, 2, '2000'),
(4171, '8444afef-7abf-458c-93b3-757d9d9c465a', 248, 1, 1, 'Method 1'),
(4170, '08d2351d-1426-4866-a2ca-995c7be6b188', 247, 4, 8, '30'),
(4169, '08d2351d-1426-4866-a2ca-995c7be6b188', 247, 4, 7, '20'),
(4168, '08d2351d-1426-4866-a2ca-995c7be6b188', 247, 4, 6, '50'),
(4167, '08d2351d-1426-4866-a2ca-995c7be6b188', 247, 4, 5, '2'),
(4166, '08d2351d-1426-4866-a2ca-995c7be6b188', 247, 4, 4, '1'),
(4165, '08d2351d-1426-4866-a2ca-995c7be6b188', 247, 4, 3, '1000'),
(4164, '08d2351d-1426-4866-a2ca-995c7be6b188', 247, 4, 2, '2000'),
(4163, '08d2351d-1426-4866-a2ca-995c7be6b188', 247, 4, 1, 'Method 2'),
(4162, 'aca06581-a516-40bf-9d21-ea3420fea238', 247, 4, 8, '30'),
(4161, 'aca06581-a516-40bf-9d21-ea3420fea238', 247, 4, 7, '20'),
(4160, 'aca06581-a516-40bf-9d21-ea3420fea238', 247, 4, 6, '10'),
(4159, 'aca06581-a516-40bf-9d21-ea3420fea238', 247, 4, 5, '1'),
(4158, 'aca06581-a516-40bf-9d21-ea3420fea238', 247, 4, 4, '1'),
(4157, 'aca06581-a516-40bf-9d21-ea3420fea238', 247, 4, 3, '1000'),
(4156, 'aca06581-a516-40bf-9d21-ea3420fea238', 247, 4, 2, '2000'),
(4155, 'aca06581-a516-40bf-9d21-ea3420fea238', 247, 4, 1, 'Method 1'),
(4154, '18ca028a-c920-4b59-9db3-62f269130a0e', 247, 3, 8, '30'),
(4153, '18ca028a-c920-4b59-9db3-62f269130a0e', 247, 3, 7, '20'),
(4152, '18ca028a-c920-4b59-9db3-62f269130a0e', 247, 3, 6, '50'),
(4151, '18ca028a-c920-4b59-9db3-62f269130a0e', 247, 3, 5, '2'),
(4150, '18ca028a-c920-4b59-9db3-62f269130a0e', 247, 3, 4, '1'),
(4149, '18ca028a-c920-4b59-9db3-62f269130a0e', 247, 3, 3, '1000'),
(4148, '18ca028a-c920-4b59-9db3-62f269130a0e', 247, 3, 2, '2000'),
(4147, '18ca028a-c920-4b59-9db3-62f269130a0e', 247, 3, 1, 'Method 2'),
(4146, 'c051c08a-852a-4252-b7f2-4c9510c385e8', 247, 3, 8, '30'),
(4145, 'c051c08a-852a-4252-b7f2-4c9510c385e8', 247, 3, 7, '20'),
(4144, 'c051c08a-852a-4252-b7f2-4c9510c385e8', 247, 3, 6, '10'),
(4143, 'c051c08a-852a-4252-b7f2-4c9510c385e8', 247, 3, 5, '1'),
(4142, 'c051c08a-852a-4252-b7f2-4c9510c385e8', 247, 3, 4, '1'),
(4139, 'c051c08a-852a-4252-b7f2-4c9510c385e8', 247, 3, 1, 'Method 1'),
(4140, 'c051c08a-852a-4252-b7f2-4c9510c385e8', 247, 3, 2, '2000'),
(4141, 'c051c08a-852a-4252-b7f2-4c9510c385e8', 247, 3, 3, '1000'),
(4538, '5c7e232e-88d7-4709-bac9-8fa806b22ce1', 248, 7, 8, '30'),
(4443, 'fd463f45-d8c5-4709-88f7-361e7c1152ea', 249, 1, 1, 'Method 1222'),
(4554, '5c921c4b-d482-49b3-a2dd-8c4bff870f56', 248, 4, 8, '30'),
(4553, '5c921c4b-d482-49b3-a2dd-8c4bff870f56', 248, 4, 7, '20'),
(4552, '5c921c4b-d482-49b3-a2dd-8c4bff870f56', 248, 4, 6, '50'),
(4551, '5c921c4b-d482-49b3-a2dd-8c4bff870f56', 248, 4, 5, '2'),
(4548, '5c921c4b-d482-49b3-a2dd-8c4bff870f56', 248, 4, 2, '2000'),
(4549, '5c921c4b-d482-49b3-a2dd-8c4bff870f56', 248, 4, 3, '1000'),
(4550, '5c921c4b-d482-49b3-a2dd-8c4bff870f56', 248, 4, 4, '1'),
(4547, '5c921c4b-d482-49b3-a2dd-8c4bff870f56', 248, 4, 1, 'Method 2'),
(4546, '115c5368-6b95-4136-94af-5b92c0dab974', 248, 4, 8, '30'),
(4474, '47d08d19-c617-4176-b5c0-d226c2e662f9', 248, 3, 8, '30'),
(4545, '115c5368-6b95-4136-94af-5b92c0dab974', 248, 4, 7, '20'),
(4447, 'fd463f45-d8c5-4709-88f7-361e7c1152ea', 249, 1, 5, '1'),
(4473, '47d08d19-c617-4176-b5c0-d226c2e662f9', 248, 3, 7, '20'),
(4472, '47d08d19-c617-4176-b5c0-d226c2e662f9', 248, 3, 6, '50'),
(4471, '47d08d19-c617-4176-b5c0-d226c2e662f9', 248, 3, 5, '2'),
(4470, '47d08d19-c617-4176-b5c0-d226c2e662f9', 248, 3, 4, '1'),
(4467, '47d08d19-c617-4176-b5c0-d226c2e662f9', 248, 3, 1, 'Method 2'),
(4468, '47d08d19-c617-4176-b5c0-d226c2e662f9', 248, 3, 2, '2000'),
(4469, '47d08d19-c617-4176-b5c0-d226c2e662f9', 248, 3, 3, '1000'),
(4466, 'bdf37abc-ebe4-4b39-b85f-58813a515dc7', 248, 3, 8, '30'),
(4465, 'bdf37abc-ebe4-4b39-b85f-58813a515dc7', 248, 3, 7, '20'),
(4464, 'bdf37abc-ebe4-4b39-b85f-58813a515dc7', 248, 3, 6, '10'),
(4463, 'bdf37abc-ebe4-4b39-b85f-58813a515dc7', 248, 3, 5, '1'),
(4462, 'bdf37abc-ebe4-4b39-b85f-58813a515dc7', 248, 3, 4, '1'),
(4461, 'bdf37abc-ebe4-4b39-b85f-58813a515dc7', 248, 3, 3, '1000'),
(4460, 'bdf37abc-ebe4-4b39-b85f-58813a515dc7', 248, 3, 2, '2000'),
(4459, 'bdf37abc-ebe4-4b39-b85f-58813a515dc7', 248, 3, 1, 'Method 1222dsds'),
(4282, '00f49ba6-d067-498f-9ff6-a5727393083d', 248, 2, 8, '30'),
(4281, '00f49ba6-d067-498f-9ff6-a5727393083d', 248, 2, 7, '20'),
(4280, '00f49ba6-d067-498f-9ff6-a5727393083d', 248, 2, 6, '50'),
(4279, '00f49ba6-d067-498f-9ff6-a5727393083d', 248, 2, 5, '2'),
(4277, '00f49ba6-d067-498f-9ff6-a5727393083d', 248, 2, 3, '1000'),
(4278, '00f49ba6-d067-498f-9ff6-a5727393083d', 248, 2, 4, '1'),
(4275, '00f49ba6-d067-498f-9ff6-a5727393083d', 248, 2, 1, 'Method 2'),
(4276, '00f49ba6-d067-498f-9ff6-a5727393083d', 248, 2, 2, '2000'),
(4274, 'c95814a2-0c4b-45cc-bb87-d669c0a64c2b', 248, 2, 8, '30'),
(4272, 'c95814a2-0c4b-45cc-bb87-d669c0a64c2b', 248, 2, 6, '10'),
(4273, 'c95814a2-0c4b-45cc-bb87-d669c0a64c2b', 248, 2, 7, '20'),
(4271, 'c95814a2-0c4b-45cc-bb87-d669c0a64c2b', 248, 2, 5, '1'),
(4270, 'c95814a2-0c4b-45cc-bb87-d669c0a64c2b', 248, 2, 4, '1'),
(4269, 'c95814a2-0c4b-45cc-bb87-d669c0a64c2b', 248, 2, 3, '1000'),
(4268, 'c95814a2-0c4b-45cc-bb87-d669c0a64c2b', 248, 2, 2, '2000'),
(4267, 'c95814a2-0c4b-45cc-bb87-d669c0a64c2b', 248, 2, 1, 'Method 1222'),
(4186, '9e09c6f8-326f-4f61-a52b-18ca44c5f8df', 248, 1, 8, '30'),
(4185, '9e09c6f8-326f-4f61-a52b-18ca44c5f8df', 248, 1, 7, '20'),
(4184, '9e09c6f8-326f-4f61-a52b-18ca44c5f8df', 248, 1, 6, '50'),
(4183, '9e09c6f8-326f-4f61-a52b-18ca44c5f8df', 248, 1, 5, '2'),
(4182, '9e09c6f8-326f-4f61-a52b-18ca44c5f8df', 248, 1, 4, '1'),
(4179, '9e09c6f8-326f-4f61-a52b-18ca44c5f8df', 248, 1, 1, 'Method 2'),
(4180, '9e09c6f8-326f-4f61-a52b-18ca44c5f8df', 248, 1, 2, '2000'),
(4181, '9e09c6f8-326f-4f61-a52b-18ca44c5f8df', 248, 1, 3, '1000'),
(4537, '5c7e232e-88d7-4709-bac9-8fa806b22ce1', 248, 7, 7, '20'),
(4536, '5c7e232e-88d7-4709-bac9-8fa806b22ce1', 248, 7, 6, '50'),
(4535, '5c7e232e-88d7-4709-bac9-8fa806b22ce1', 248, 7, 5, '2'),
(4446, 'fd463f45-d8c5-4709-88f7-361e7c1152ea', 249, 1, 4, '1'),
(4445, 'fd463f45-d8c5-4709-88f7-361e7c1152ea', 249, 1, 3, '1000'),
(4444, 'fd463f45-d8c5-4709-88f7-361e7c1152ea', 249, 1, 2, '2000'),
(4544, '115c5368-6b95-4136-94af-5b92c0dab974', 248, 4, 6, '10'),
(4543, '115c5368-6b95-4136-94af-5b92c0dab974', 248, 4, 5, '1'),
(4542, '115c5368-6b95-4136-94af-5b92c0dab974', 248, 4, 4, '1'),
(4539, '115c5368-6b95-4136-94af-5b92c0dab974', 248, 4, 1, 'Method 1222dsds'),
(4540, '115c5368-6b95-4136-94af-5b92c0dab974', 248, 4, 2, '2000'),
(4541, '115c5368-6b95-4136-94af-5b92c0dab974', 248, 4, 3, '1000'),
(4522, '21c04aab-fba0-4c40-ad9f-89af0aa8e588', 248, 6, 8, '30'),
(4506, '2205d949-ca27-4b44-9229-e129c54bf9b4', 248, 5, 8, '30'),
(4505, '2205d949-ca27-4b44-9229-e129c54bf9b4', 248, 5, 7, '20'),
(4504, '2205d949-ca27-4b44-9229-e129c54bf9b4', 248, 5, 6, '50'),
(4503, '2205d949-ca27-4b44-9229-e129c54bf9b4', 248, 5, 5, '2'),
(4502, '2205d949-ca27-4b44-9229-e129c54bf9b4', 248, 5, 4, '1'),
(4501, '2205d949-ca27-4b44-9229-e129c54bf9b4', 248, 5, 3, '1000'),
(4496, '6a4a8532-06bb-400e-b8b7-f6b38a9492f6', 248, 5, 6, '10'),
(4497, '6a4a8532-06bb-400e-b8b7-f6b38a9492f6', 248, 5, 7, '20'),
(4498, '6a4a8532-06bb-400e-b8b7-f6b38a9492f6', 248, 5, 8, '30'),
(4499, '2205d949-ca27-4b44-9229-e129c54bf9b4', 248, 5, 1, 'Method 2'),
(4500, '2205d949-ca27-4b44-9229-e129c54bf9b4', 248, 5, 2, '2000'),
(4458, '3296d6af-40a0-4511-9c4f-437433a8e9d8', 249, 1, 8, '30'),
(4457, '3296d6af-40a0-4511-9c4f-437433a8e9d8', 249, 1, 7, '20'),
(4456, '3296d6af-40a0-4511-9c4f-437433a8e9d8', 249, 1, 6, '50'),
(4455, '3296d6af-40a0-4511-9c4f-437433a8e9d8', 249, 1, 5, '2'),
(4454, '3296d6af-40a0-4511-9c4f-437433a8e9d8', 249, 1, 4, '1'),
(4453, '3296d6af-40a0-4511-9c4f-437433a8e9d8', 249, 1, 3, '1000'),
(4452, '3296d6af-40a0-4511-9c4f-437433a8e9d8', 249, 1, 2, '2000'),
(4451, '3296d6af-40a0-4511-9c4f-437433a8e9d8', 249, 1, 1, 'Method 2'),
(4450, 'fd463f45-d8c5-4709-88f7-361e7c1152ea', 249, 1, 8, '30'),
(4449, 'fd463f45-d8c5-4709-88f7-361e7c1152ea', 249, 1, 7, '20'),
(4448, 'fd463f45-d8c5-4709-88f7-361e7c1152ea', 249, 1, 6, '10'),
(4534, '5c7e232e-88d7-4709-bac9-8fa806b22ce1', 248, 7, 4, '1'),
(4533, '5c7e232e-88d7-4709-bac9-8fa806b22ce1', 248, 7, 3, '1000'),
(4531, '5c7e232e-88d7-4709-bac9-8fa806b22ce1', 248, 7, 1, 'Method 2'),
(4532, '5c7e232e-88d7-4709-bac9-8fa806b22ce1', 248, 7, 2, '2000'),
(4530, 'c87cb08c-3918-46b2-b37c-3ee9ef93b3e7', 248, 7, 8, '30'),
(4529, 'c87cb08c-3918-46b2-b37c-3ee9ef93b3e7', 248, 7, 7, '20'),
(4528, 'c87cb08c-3918-46b2-b37c-3ee9ef93b3e7', 248, 7, 6, '10'),
(4527, 'c87cb08c-3918-46b2-b37c-3ee9ef93b3e7', 248, 7, 5, '1'),
(4526, 'c87cb08c-3918-46b2-b37c-3ee9ef93b3e7', 248, 7, 4, '1'),
(4525, 'c87cb08c-3918-46b2-b37c-3ee9ef93b3e7', 248, 7, 3, '1000'),
(4523, 'c87cb08c-3918-46b2-b37c-3ee9ef93b3e7', 248, 7, 1, 'Method 1222'),
(4524, 'c87cb08c-3918-46b2-b37c-3ee9ef93b3e7', 248, 7, 2, '2000'),
(4521, '21c04aab-fba0-4c40-ad9f-89af0aa8e588', 248, 6, 7, '20'),
(4520, '21c04aab-fba0-4c40-ad9f-89af0aa8e588', 248, 6, 6, '50'),
(4519, '21c04aab-fba0-4c40-ad9f-89af0aa8e588', 248, 6, 5, '2'),
(4518, '21c04aab-fba0-4c40-ad9f-89af0aa8e588', 248, 6, 4, '1'),
(4514, '49d655a1-2211-446a-b6a7-0728ef900c7d', 248, 6, 8, '30'),
(4515, '21c04aab-fba0-4c40-ad9f-89af0aa8e588', 248, 6, 1, 'Method 2'),
(4517, '21c04aab-fba0-4c40-ad9f-89af0aa8e588', 248, 6, 3, '1000'),
(4516, '21c04aab-fba0-4c40-ad9f-89af0aa8e588', 248, 6, 2, '2000'),
(4513, '49d655a1-2211-446a-b6a7-0728ef900c7d', 248, 6, 7, '20'),
(4511, '49d655a1-2211-446a-b6a7-0728ef900c7d', 248, 6, 5, '1'),
(4512, '49d655a1-2211-446a-b6a7-0728ef900c7d', 248, 6, 6, '10'),
(4510, '49d655a1-2211-446a-b6a7-0728ef900c7d', 248, 6, 4, '1'),
(4509, '49d655a1-2211-446a-b6a7-0728ef900c7d', 248, 6, 3, '1000'),
(4508, '49d655a1-2211-446a-b6a7-0728ef900c7d', 248, 6, 2, '2000'),
(4507, '49d655a1-2211-446a-b6a7-0728ef900c7d', 248, 6, 1, 'Method 1222'),
(4495, '6a4a8532-06bb-400e-b8b7-f6b38a9492f6', 248, 5, 5, '1'),
(4493, '6a4a8532-06bb-400e-b8b7-f6b38a9492f6', 248, 5, 3, '1000'),
(4494, '6a4a8532-06bb-400e-b8b7-f6b38a9492f6', 248, 5, 4, '1'),
(4492, '6a4a8532-06bb-400e-b8b7-f6b38a9492f6', 248, 5, 2, '2000'),
(4491, '6a4a8532-06bb-400e-b8b7-f6b38a9492f6', 248, 5, 1, 'Method 1222');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_regions`
--

CREATE TABLE IF NOT EXISTS `tbl_regions` (
  `id` int(16) NOT NULL,
  `game_id` int(16) DEFAULT NULL,
  `round_id` int(16) DEFAULT NULL,
  `region_id` int(16) NOT NULL,
  `factor_id` int(16) NOT NULL,
  `factor_value` double(16,2) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17413 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_regions`
--

INSERT INTO `tbl_regions` (`id`, `game_id`, `round_id`, `region_id`, `factor_id`, `factor_value`) VALUES
(1, 0, 1, 1, 1, 1.00),
(2, 0, 1, 1, 2, 1.00),
(3, 0, 1, 1, 3, 1.60),
(4, 0, 1, 1, 4, 2000.00),
(5, 0, 1, 1, 5, 1.00),
(6, 0, 1, 1, 6, 1.00),
(7, 0, 1, 1, 7, 1.00),
(8, 0, 1, 1, 8, 1.00),
(9, 0, 1, 1, 9, 1.00),
(10, 0, 1, 1, 10, 0.30),
(11, 0, 1, 1, 11, 100.00),
(12, 0, 1, 1, 12, 100.00),
(13, 0, 1, 1, 13, 100.00),
(14, 0, 1, 1, 14, 0.00),
(15, 0, 1, 1, 15, 0.05),
(16, 0, 1, 2, 1, 1.00),
(17, 0, 1, 2, 2, 1.00),
(18, 0, 1, 2, 3, 1.80),
(19, 0, 1, 2, 4, 3500.00),
(20, 0, 1, 2, 5, 3.00),
(21, 0, 1, 2, 6, 3.00),
(22, 0, 1, 2, 7, 3.00),
(23, 0, 1, 2, 8, 3.00),
(24, 0, 1, 2, 9, 3.00),
(25, 0, 1, 2, 10, 0.60),
(26, 0, 1, 2, 11, 100.00),
(27, 0, 1, 2, 12, 0.00),
(28, 0, 1, 2, 13, 100.00),
(29, 0, 1, 2, 14, 100.00),
(30, 0, 1, 2, 15, 0.05),
(31, 0, 1, 3, 1, 1.00),
(32, 0, 1, 3, 2, 1.00),
(33, 0, 1, 3, 3, 1.70),
(34, 0, 1, 3, 4, 2500.00),
(35, 0, 1, 3, 5, 2.00),
(36, 0, 1, 3, 6, 2.00),
(37, 0, 1, 3, 7, 2.00),
(38, 0, 1, 3, 8, 2.00),
(39, 0, 1, 3, 9, 2.00),
(40, 0, 1, 3, 10, 0.50),
(41, 0, 1, 3, 11, 100.00),
(42, 0, 1, 3, 12, 100.00),
(43, 0, 1, 3, 13, 0.00),
(44, 0, 1, 3, 14, 100.00),
(45, 0, 1, 3, 15, 0.05),
(46, 0, 1, 4, 1, 1.00),
(47, 0, 1, 4, 2, 1.00),
(48, 0, 1, 4, 3, 2.00),
(49, 0, 1, 4, 4, 4000.00),
(50, 0, 1, 4, 5, 5.00),
(51, 0, 1, 4, 6, 5.00),
(52, 0, 1, 4, 7, 5.00),
(53, 0, 1, 4, 8, 5.00),
(54, 0, 1, 4, 9, 5.00),
(55, 0, 1, 4, 10, 0.80),
(56, 0, 1, 4, 11, 0.00),
(57, 0, 1, 4, 12, 100.00),
(58, 0, 1, 4, 13, 100.00),
(59, 0, 1, 4, 14, 100.00),
(60, 0, 1, 4, 15, 0.05),
(16620, 246, 4, 1, 15, 0.05),
(16619, 246, 4, 1, 14, 0.00),
(16618, 246, 4, 1, 13, 100.00),
(16617, 246, 4, 1, 12, 100.00),
(16616, 246, 4, 1, 11, 100.00),
(16615, 246, 4, 1, 10, 0.30),
(16614, 246, 4, 1, 9, 1.00),
(16613, 246, 4, 1, 8, 1.00),
(16612, 246, 4, 1, 7, 1.00),
(16611, 246, 4, 1, 6, 1.00),
(16610, 246, 4, 1, 5, 1.00),
(16609, 246, 4, 1, 4, 2000.00),
(16608, 246, 4, 1, 3, 1.60),
(16607, 246, 4, 1, 16, 1.00),
(16606, 246, 4, 1, 2, 1.00),
(16605, 246, 4, 1, 18, 1.00),
(16604, 246, 4, 1, 17, 1.00),
(16603, 246, 4, 1, 1, 1.00),
(16602, 246, 4, 3, 15, 0.05),
(16601, 246, 4, 3, 14, 100.00),
(16600, 246, 4, 3, 13, 0.00),
(16599, 246, 4, 3, 12, 100.00),
(16598, 246, 4, 3, 11, 100.00),
(16597, 246, 4, 3, 10, 0.50),
(16596, 246, 4, 3, 9, 2.00),
(16595, 246, 4, 3, 8, 2.00),
(16594, 246, 4, 3, 7, 2.00),
(16593, 246, 4, 3, 6, 2.00),
(16592, 246, 4, 3, 5, 2.00),
(16591, 246, 4, 3, 4, 2500.00),
(16590, 246, 4, 3, 3, 1.70),
(16589, 246, 4, 3, 16, 1.00),
(16588, 246, 4, 3, 2, 1.00),
(16587, 246, 4, 3, 18, 1.00),
(16586, 246, 4, 3, 17, 1.00),
(16585, 246, 4, 3, 1, 1.00),
(16584, 246, 4, 2, 15, 0.05),
(16583, 246, 4, 2, 14, 100.00),
(16582, 246, 4, 2, 13, 100.00),
(16581, 246, 4, 2, 12, 0.00),
(16580, 246, 4, 2, 11, 100.00),
(16579, 246, 4, 2, 10, 0.60),
(16578, 246, 4, 2, 9, 3.00),
(16577, 246, 4, 2, 8, 3.00),
(16576, 246, 4, 2, 7, 3.00),
(16575, 246, 4, 2, 6, 3.00),
(16574, 246, 4, 2, 5, 3.00),
(16573, 246, 4, 2, 4, 3500.00),
(16572, 246, 4, 2, 3, 1.80),
(16571, 246, 4, 2, 16, 1.00),
(16570, 246, 4, 2, 2, 1.00),
(16569, 246, 4, 2, 18, 1.00),
(16568, 246, 4, 2, 17, 1.00),
(16567, 246, 4, 2, 1, 1.00),
(16566, 246, 4, 4, 15, 0.05),
(16565, 246, 4, 4, 14, 100.00),
(16564, 246, 4, 4, 13, 100.00),
(16563, 246, 4, 4, 12, 100.00),
(16562, 246, 4, 4, 11, 0.00),
(16561, 246, 4, 4, 10, 0.80),
(16560, 246, 4, 4, 9, 5.00),
(16559, 246, 4, 4, 8, 5.00),
(16558, 246, 4, 4, 7, 5.00),
(16557, 246, 4, 4, 6, 5.00),
(16556, 246, 4, 4, 5, 5.00),
(16555, 246, 4, 4, 4, 4000.00),
(16554, 246, 4, 4, 3, 2.00),
(16553, 246, 4, 4, 16, 1.00),
(16552, 246, 4, 4, 2, 1.00),
(16551, 246, 4, 4, 18, 1.00),
(16550, 246, 4, 4, 17, 1.00),
(16549, 246, 4, 4, 1, 1.00),
(16548, 246, 3, 1, 15, 0.05),
(16547, 246, 3, 1, 14, 0.00),
(16546, 246, 3, 1, 13, 100.00),
(16545, 246, 3, 1, 12, 100.00),
(16544, 246, 3, 1, 11, 100.00),
(16543, 246, 3, 1, 10, 0.30),
(16542, 246, 3, 1, 9, 1.00),
(16541, 246, 3, 1, 8, 1.00),
(16540, 246, 3, 1, 7, 1.00),
(16539, 246, 3, 1, 6, 1.00),
(16538, 246, 3, 1, 5, 1.00),
(16537, 246, 3, 1, 4, 2000.00),
(16536, 246, 3, 1, 3, 1.60),
(16535, 246, 3, 1, 16, 1.00),
(16534, 246, 3, 1, 2, 1.00),
(16533, 246, 3, 1, 18, 1.00),
(16532, 246, 3, 1, 17, 1.00),
(16531, 246, 3, 1, 1, 1.00),
(16530, 246, 3, 3, 15, 0.05),
(16529, 246, 3, 3, 14, 100.00),
(16528, 246, 3, 3, 13, 0.00),
(16527, 246, 3, 3, 12, 100.00),
(16526, 246, 3, 3, 11, 100.00),
(16525, 246, 3, 3, 10, 0.50),
(16524, 246, 3, 3, 9, 2.00),
(16523, 246, 3, 3, 8, 2.00),
(16522, 246, 3, 3, 7, 2.00),
(16521, 246, 3, 3, 6, 2.00),
(16520, 246, 3, 3, 5, 2.00),
(16519, 246, 3, 3, 4, 2500.00),
(16518, 246, 3, 3, 3, 1.70),
(16517, 246, 3, 3, 16, 1.00),
(16516, 246, 3, 3, 2, 1.00),
(16515, 246, 3, 3, 18, 1.00),
(16514, 246, 3, 3, 17, 1.00),
(16513, 246, 3, 3, 1, 1.00),
(16512, 246, 3, 2, 15, 0.05),
(16511, 246, 3, 2, 14, 100.00),
(16510, 246, 3, 2, 13, 100.00),
(16509, 246, 3, 2, 12, 0.00),
(16508, 246, 3, 2, 11, 100.00),
(16507, 246, 3, 2, 10, 0.60),
(16506, 246, 3, 2, 9, 3.00),
(16505, 246, 3, 2, 8, 3.00),
(16504, 246, 3, 2, 7, 3.00),
(16503, 246, 3, 2, 6, 3.00),
(16502, 246, 3, 2, 5, 3.00),
(16501, 246, 3, 2, 4, 3500.00),
(16500, 246, 3, 2, 3, 1.80),
(16499, 246, 3, 2, 16, 1.00),
(16498, 246, 3, 2, 2, 1.00),
(16497, 246, 3, 2, 18, 1.00),
(16496, 246, 3, 2, 17, 1.00),
(16495, 246, 3, 2, 1, 1.00),
(16494, 246, 3, 4, 15, 0.05),
(16493, 246, 3, 4, 14, 100.00),
(16492, 246, 3, 4, 13, 100.00),
(16491, 246, 3, 4, 12, 100.00),
(16490, 246, 3, 4, 11, 0.00),
(16489, 246, 3, 4, 10, 0.80),
(16488, 246, 3, 4, 9, 5.00),
(16487, 246, 3, 4, 8, 5.00),
(16486, 246, 3, 4, 7, 5.00),
(16485, 246, 3, 4, 6, 5.00),
(16484, 246, 3, 4, 5, 5.00),
(16483, 246, 3, 4, 4, 4000.00),
(16482, 246, 3, 4, 3, 2.00),
(16481, 246, 3, 4, 16, 1.00),
(16480, 246, 3, 4, 2, 1.00),
(16479, 246, 3, 4, 18, 1.00),
(16478, 246, 3, 4, 17, 1.00),
(16477, 246, 3, 4, 1, 1.00),
(16476, 246, 2, 1, 15, 0.05),
(16475, 246, 2, 1, 14, 0.00),
(16474, 246, 2, 1, 13, 100.00),
(16473, 246, 2, 1, 12, 100.00),
(16472, 246, 2, 1, 11, 100.00),
(16471, 246, 2, 1, 10, 0.30),
(16470, 246, 2, 1, 9, 1.00),
(16469, 246, 2, 1, 8, 1.00),
(16468, 246, 2, 1, 7, 1.00),
(16467, 246, 2, 1, 6, 1.00),
(16466, 246, 2, 1, 5, 1.00),
(16465, 246, 2, 1, 4, 2000.00),
(16464, 246, 2, 1, 3, 1.60),
(16463, 246, 2, 1, 16, 1.00),
(16462, 246, 2, 1, 2, 1.00),
(16461, 246, 2, 1, 18, 1.00),
(16460, 246, 2, 1, 17, 1.00),
(16459, 246, 2, 1, 1, 1.00),
(16458, 246, 2, 3, 15, 0.05),
(16457, 246, 2, 3, 14, 100.00),
(16456, 246, 2, 3, 13, 0.00),
(16455, 246, 2, 3, 12, 100.00),
(16454, 246, 2, 3, 11, 100.00),
(16453, 246, 2, 3, 10, 0.50),
(16452, 246, 2, 3, 9, 2.00),
(16451, 246, 2, 3, 8, 2.00),
(16450, 246, 2, 3, 7, 2.00),
(16449, 246, 2, 3, 6, 2.00),
(16448, 246, 2, 3, 5, 2.00),
(16447, 246, 2, 3, 4, 2500.00),
(16446, 246, 2, 3, 3, 1.70),
(16445, 246, 2, 3, 16, 1.00),
(16444, 246, 2, 3, 2, 1.00),
(16443, 246, 2, 3, 18, 1.00),
(16442, 246, 2, 3, 17, 1.00),
(16441, 246, 2, 3, 1, 1.00),
(16440, 246, 2, 2, 15, 0.05),
(16439, 246, 2, 2, 14, 100.00),
(16438, 246, 2, 2, 13, 100.00),
(16437, 246, 2, 2, 12, 0.00),
(16436, 246, 2, 2, 11, 100.00),
(16435, 246, 2, 2, 10, 0.60),
(16434, 246, 2, 2, 9, 3.00),
(16433, 246, 2, 2, 8, 3.00),
(16432, 246, 2, 2, 7, 3.00),
(16431, 246, 2, 2, 6, 3.00),
(16430, 246, 2, 2, 5, 3.00),
(16429, 246, 2, 2, 4, 3500.00),
(16428, 246, 2, 2, 3, 1.80),
(16427, 246, 2, 2, 16, 1.00),
(16426, 246, 2, 2, 2, 1.00),
(16425, 246, 2, 2, 18, 1.00),
(16424, 246, 2, 2, 17, 1.00),
(16423, 246, 2, 2, 1, 1.00),
(16422, 246, 2, 4, 15, 0.05),
(16421, 246, 2, 4, 14, 100.00),
(16420, 246, 2, 4, 13, 100.00),
(16419, 246, 2, 4, 12, 100.00),
(16418, 246, 2, 4, 11, 0.00),
(16417, 246, 2, 4, 10, 0.80),
(16416, 246, 2, 4, 9, 5.00),
(16415, 246, 2, 4, 8, 5.00),
(16414, 246, 2, 4, 7, 5.00),
(16413, 246, 2, 4, 6, 5.00),
(16412, 246, 2, 4, 5, 5.00),
(16411, 246, 2, 4, 4, 4000.00),
(16410, 246, 2, 4, 3, 2.00),
(16409, 246, 2, 4, 16, 1.00),
(16408, 246, 2, 4, 2, 1.00),
(16407, 246, 2, 4, 18, 1.00),
(16406, 246, 2, 4, 17, 1.00),
(16405, 246, 2, 4, 1, 1.00),
(16404, 246, 1, 1, 15, 0.05),
(16403, 246, 1, 1, 14, 0.00),
(16402, 246, 1, 1, 13, 100.00),
(16401, 246, 1, 1, 12, 100.00),
(16400, 246, 1, 1, 11, 100.00),
(16399, 246, 1, 1, 10, 0.30),
(16398, 246, 1, 1, 9, 1.00),
(16397, 246, 1, 1, 8, 1.00),
(16396, 246, 1, 1, 7, 1.00),
(16395, 246, 1, 1, 6, 1.00),
(16394, 246, 1, 1, 5, 1.00),
(16393, 246, 1, 1, 4, 2000.00),
(16392, 246, 1, 1, 3, 1.60),
(16391, 246, 1, 1, 16, 1.00),
(16390, 246, 1, 1, 2, 1.00),
(16389, 246, 1, 1, 18, 1.00),
(16388, 246, 1, 1, 17, 1.00),
(16387, 246, 1, 1, 1, 1.00),
(16386, 246, 1, 3, 15, 0.05),
(16385, 246, 1, 3, 14, 100.00),
(16384, 246, 1, 3, 13, 0.00),
(16383, 246, 1, 3, 12, 100.00),
(16382, 246, 1, 3, 11, 100.00),
(16381, 246, 1, 3, 10, 0.50),
(16380, 246, 1, 3, 9, 2.00),
(16379, 246, 1, 3, 8, 2.00),
(16378, 246, 1, 3, 7, 2.00),
(16377, 246, 1, 3, 6, 2.00),
(16376, 246, 1, 3, 5, 2.00),
(16375, 246, 1, 3, 4, 2500.00),
(16374, 246, 1, 3, 3, 1.70),
(16373, 246, 1, 3, 16, 1.00),
(16372, 246, 1, 3, 2, 1.00),
(16371, 246, 1, 3, 18, 1.00),
(16370, 246, 1, 3, 17, 1.00),
(16369, 246, 1, 3, 1, 1.00),
(16368, 246, 1, 2, 15, 0.05),
(16367, 246, 1, 2, 14, 100.00),
(16366, 246, 1, 2, 13, 100.00),
(16365, 246, 1, 2, 12, 0.00),
(16364, 246, 1, 2, 11, 100.00),
(16363, 246, 1, 2, 10, 0.60),
(16362, 246, 1, 2, 9, 3.00),
(16361, 246, 1, 2, 8, 3.00),
(16360, 246, 1, 2, 7, 3.00),
(16359, 246, 1, 2, 6, 3.00),
(16358, 246, 1, 2, 5, 3.00),
(16357, 246, 1, 2, 4, 3500.00),
(16356, 246, 1, 2, 3, 1.80),
(16355, 246, 1, 2, 16, 1.00),
(16354, 246, 1, 2, 2, 1.00),
(16353, 246, 1, 2, 18, 1.00),
(13921, 0, 1, 1, 16, 1.00),
(13922, 0, 1, 2, 16, 1.00),
(13923, 0, 1, 3, 16, 1.00),
(13924, 0, 1, 4, 16, 1.00),
(16352, 246, 1, 2, 17, 1.00),
(16351, 246, 1, 2, 1, 1.00),
(16350, 246, 1, 4, 15, 0.05),
(16349, 246, 1, 4, 14, 100.00),
(16348, 246, 1, 4, 13, 100.00),
(16347, 246, 1, 4, 12, 100.00),
(16346, 246, 1, 4, 11, 0.00),
(16345, 246, 1, 4, 10, 0.80),
(16344, 246, 1, 4, 9, 5.00),
(16343, 246, 1, 4, 8, 5.00),
(16342, 246, 1, 4, 7, 5.00),
(16341, 246, 1, 4, 6, 5.00),
(16340, 246, 1, 4, 5, 5.00),
(16339, 246, 1, 4, 4, 4000.00),
(16338, 246, 1, 4, 3, 2.00),
(16337, 246, 1, 4, 16, 1.00),
(16336, 246, 1, 4, 2, 1.00),
(16335, 246, 1, 4, 18, 1.00),
(16334, 246, 1, 4, 17, 1.00),
(16333, 246, 1, 4, 1, 1.00),
(14444, 0, 1, 4, 18, 1.00),
(14443, 0, 1, 3, 18, 1.00),
(14442, 0, 1, 2, 18, 1.00),
(14441, 0, 1, 1, 18, 1.00),
(14440, 0, 1, 4, 17, 1.00),
(14439, 0, 1, 3, 17, 1.00),
(14438, 0, 1, 2, 17, 1.00),
(14437, 0, 1, 1, 17, 1.00),
(16836, 247, 3, 1, 15, 0.05),
(16835, 247, 3, 1, 14, 0.00),
(16834, 247, 3, 1, 13, 100.00),
(16833, 247, 3, 1, 12, 100.00),
(16832, 247, 3, 1, 11, 100.00),
(16831, 247, 3, 1, 10, 0.30),
(16830, 247, 3, 1, 9, 1.00),
(16829, 247, 3, 1, 8, 1.00),
(16828, 247, 3, 1, 7, 1.00),
(16827, 247, 3, 1, 6, 1.00),
(16826, 247, 3, 1, 5, 1.00),
(16825, 247, 3, 1, 4, 2000.00),
(16824, 247, 3, 1, 3, 1.60),
(16823, 247, 3, 1, 16, 1.00),
(16822, 247, 3, 1, 2, 1.00),
(16821, 247, 3, 1, 18, 1.00),
(16820, 247, 3, 1, 17, 1.00),
(16819, 247, 3, 1, 1, 1.00),
(16818, 247, 3, 3, 15, 0.05),
(16817, 247, 3, 3, 14, 100.00),
(16816, 247, 3, 3, 13, 0.00),
(16815, 247, 3, 3, 12, 100.00),
(16814, 247, 3, 3, 11, 100.00),
(16813, 247, 3, 3, 10, 0.50),
(16812, 247, 3, 3, 9, 2.00),
(16811, 247, 3, 3, 8, 2.00),
(16810, 247, 3, 3, 7, 2.00),
(16809, 247, 3, 3, 6, 2.00),
(16808, 247, 3, 3, 5, 2.00),
(16807, 247, 3, 3, 4, 2500.00),
(16806, 247, 3, 3, 3, 1.70),
(16805, 247, 3, 3, 16, 1.00),
(16804, 247, 3, 3, 2, 1.00),
(16803, 247, 3, 3, 18, 1.00),
(16802, 247, 3, 3, 17, 1.00),
(16801, 247, 3, 3, 1, 1.00),
(16800, 247, 3, 2, 15, 0.05),
(16799, 247, 3, 2, 14, 100.00),
(16798, 247, 3, 2, 13, 100.00),
(16797, 247, 3, 2, 12, 0.00),
(16796, 247, 3, 2, 11, 100.00),
(16795, 247, 3, 2, 10, 0.60),
(16794, 247, 3, 2, 9, 3.00),
(16793, 247, 3, 2, 8, 3.00),
(16792, 247, 3, 2, 7, 3.00),
(16791, 247, 3, 2, 6, 3.00),
(16790, 247, 3, 2, 5, 3.00),
(16789, 247, 3, 2, 4, 3500.00),
(16788, 247, 3, 2, 3, 1.80),
(16787, 247, 3, 2, 16, 1.00),
(16786, 247, 3, 2, 2, 1.00),
(16785, 247, 3, 2, 18, 1.00),
(16784, 247, 3, 2, 17, 1.00),
(16783, 247, 3, 2, 1, 1.00),
(16782, 247, 3, 4, 15, 0.05),
(16781, 247, 3, 4, 14, 100.00),
(16780, 247, 3, 4, 13, 100.00),
(16779, 247, 3, 4, 12, 100.00),
(16778, 247, 3, 4, 11, 0.00),
(16777, 247, 3, 4, 10, 0.80),
(16776, 247, 3, 4, 9, 5.00),
(16775, 247, 3, 4, 8, 5.00),
(16774, 247, 3, 4, 7, 5.00),
(16773, 247, 3, 4, 6, 5.00),
(16772, 247, 3, 4, 5, 5.00),
(16771, 247, 3, 4, 4, 4000.00),
(16770, 247, 3, 4, 3, 2.00),
(16769, 247, 3, 4, 16, 1.00),
(16768, 247, 3, 4, 2, 1.00),
(16767, 247, 3, 4, 18, 1.00),
(16766, 247, 3, 4, 17, 2.00),
(16765, 247, 3, 4, 1, 2.00),
(16764, 247, 2, 1, 15, 0.05),
(16763, 247, 2, 1, 14, 0.00),
(16762, 247, 2, 1, 13, 100.00),
(16761, 247, 2, 1, 12, 100.00),
(16760, 247, 2, 1, 11, 100.00),
(16759, 247, 2, 1, 10, 0.30),
(16758, 247, 2, 1, 9, 1.00),
(16757, 247, 2, 1, 8, 1.00),
(16756, 247, 2, 1, 7, 1.00),
(16755, 247, 2, 1, 6, 1.00),
(16754, 247, 2, 1, 5, 1.00),
(16753, 247, 2, 1, 4, 2000.00),
(16752, 247, 2, 1, 3, 1.60),
(16751, 247, 2, 1, 16, 1.00),
(16750, 247, 2, 1, 2, 1.00),
(16749, 247, 2, 1, 18, 1.00),
(16748, 247, 2, 1, 17, 1.00),
(16747, 247, 2, 1, 1, 1.00),
(16746, 247, 2, 3, 15, 0.05),
(16745, 247, 2, 3, 14, 100.00),
(16744, 247, 2, 3, 13, 0.00),
(16743, 247, 2, 3, 12, 100.00),
(16742, 247, 2, 3, 11, 100.00),
(16741, 247, 2, 3, 10, 0.50),
(16740, 247, 2, 3, 9, 2.00),
(16739, 247, 2, 3, 8, 2.00),
(16738, 247, 2, 3, 7, 2.00),
(16737, 247, 2, 3, 6, 2.00),
(16736, 247, 2, 3, 5, 2.00),
(16735, 247, 2, 3, 4, 2500.00),
(16734, 247, 2, 3, 3, 1.70),
(16733, 247, 2, 3, 16, 1.00),
(16732, 247, 2, 3, 2, 1.00),
(16731, 247, 2, 3, 18, 1.00),
(16730, 247, 2, 3, 17, 1.00),
(16729, 247, 2, 3, 1, 1.00),
(16728, 247, 2, 2, 15, 0.05),
(16727, 247, 2, 2, 14, 100.00),
(16726, 247, 2, 2, 13, 100.00),
(16725, 247, 2, 2, 12, 0.00),
(16724, 247, 2, 2, 11, 100.00),
(16723, 247, 2, 2, 10, 0.60),
(16722, 247, 2, 2, 9, 3.00),
(16721, 247, 2, 2, 8, 3.00),
(16720, 247, 2, 2, 7, 3.00),
(16719, 247, 2, 2, 6, 3.00),
(16718, 247, 2, 2, 5, 3.00),
(16717, 247, 2, 2, 4, 3500.00),
(16716, 247, 2, 2, 3, 1.80),
(16715, 247, 2, 2, 16, 1.00),
(16714, 247, 2, 2, 2, 1.00),
(16713, 247, 2, 2, 18, 1.00),
(16712, 247, 2, 2, 17, 1.00),
(16711, 247, 2, 2, 1, 1.00),
(16710, 247, 2, 4, 15, 0.05),
(16709, 247, 2, 4, 14, 100.00),
(16708, 247, 2, 4, 13, 100.00),
(16707, 247, 2, 4, 12, 100.00),
(16706, 247, 2, 4, 11, 0.00),
(16705, 247, 2, 4, 10, 0.80),
(16704, 247, 2, 4, 9, 5.00),
(16703, 247, 2, 4, 8, 5.00),
(16702, 247, 2, 4, 7, 5.00),
(16701, 247, 2, 4, 6, 5.00),
(16700, 247, 2, 4, 5, 5.00),
(16699, 247, 2, 4, 4, 4000.00),
(16698, 247, 2, 4, 3, 2.00),
(16697, 247, 2, 4, 16, 1.00),
(16696, 247, 2, 4, 2, 1.00),
(16695, 247, 2, 4, 18, 1.00),
(16694, 247, 2, 4, 17, 1.00),
(16693, 247, 2, 4, 1, 1.00),
(16692, 247, 1, 1, 15, 0.05),
(16691, 247, 1, 1, 14, 0.00),
(16690, 247, 1, 1, 13, 100.00),
(16689, 247, 1, 1, 12, 100.00),
(16688, 247, 1, 1, 11, 100.00),
(16687, 247, 1, 1, 10, 0.30),
(16686, 247, 1, 1, 9, 1.00),
(16685, 247, 1, 1, 8, 1.00),
(16684, 247, 1, 1, 7, 1.00),
(16683, 247, 1, 1, 6, 1.00),
(16682, 247, 1, 1, 5, 1.00),
(16681, 247, 1, 1, 4, 2000.00),
(16680, 247, 1, 1, 3, 1.60),
(16679, 247, 1, 1, 16, 1.00),
(16678, 247, 1, 1, 2, 1.00),
(16677, 247, 1, 1, 18, 1.00),
(16676, 247, 1, 1, 17, 1.00),
(16675, 247, 1, 1, 1, 1.00),
(16674, 247, 1, 3, 15, 0.05),
(16673, 247, 1, 3, 14, 100.00),
(16672, 247, 1, 3, 13, 0.00),
(16671, 247, 1, 3, 12, 100.00),
(16670, 247, 1, 3, 11, 100.00),
(16669, 247, 1, 3, 10, 0.50),
(16668, 247, 1, 3, 9, 2.00),
(16667, 247, 1, 3, 8, 2.00),
(16666, 247, 1, 3, 7, 2.00),
(16665, 247, 1, 3, 6, 2.00),
(16664, 247, 1, 3, 5, 2.00),
(16663, 247, 1, 3, 4, 2500.00),
(16662, 247, 1, 3, 3, 1.70),
(16661, 247, 1, 3, 16, 1.00),
(16660, 247, 1, 3, 2, 1.00),
(16659, 247, 1, 3, 18, 1.00),
(16658, 247, 1, 3, 17, 1.00),
(16657, 247, 1, 3, 1, 1.00),
(16656, 247, 1, 2, 15, 0.05),
(16655, 247, 1, 2, 14, 100.00),
(16654, 247, 1, 2, 13, 100.00),
(16653, 247, 1, 2, 12, 0.00),
(16652, 247, 1, 2, 11, 100.00),
(16651, 247, 1, 2, 10, 0.60),
(16650, 247, 1, 2, 9, 3.00),
(16649, 247, 1, 2, 8, 3.00),
(16648, 247, 1, 2, 7, 3.00),
(16647, 247, 1, 2, 6, 3.00),
(16646, 247, 1, 2, 5, 3.00),
(16645, 247, 1, 2, 4, 3500.00),
(16644, 247, 1, 2, 3, 1.80),
(16643, 247, 1, 2, 16, 1.00),
(16642, 247, 1, 2, 2, 1.00),
(16641, 247, 1, 2, 18, 1.00),
(16640, 247, 1, 2, 17, 1.00),
(16639, 247, 1, 2, 1, 1.00),
(16638, 247, 1, 4, 15, 0.05),
(16637, 247, 1, 4, 14, 100.00),
(16636, 247, 1, 4, 13, 100.00),
(16635, 247, 1, 4, 12, 100.00),
(16634, 247, 1, 4, 11, 0.00),
(16633, 247, 1, 4, 10, 0.80),
(16632, 247, 1, 4, 9, 5.00),
(16631, 247, 1, 4, 8, 5.00),
(16630, 247, 1, 4, 7, 5.00),
(16629, 247, 1, 4, 6, 5.00),
(16628, 247, 1, 4, 5, 5.00),
(16627, 247, 1, 4, 4, 4000.00),
(16626, 247, 1, 4, 3, 2.00),
(16625, 247, 1, 4, 16, 1.00),
(16624, 247, 1, 4, 2, 1.00),
(16623, 247, 1, 4, 18, 1.00),
(16622, 247, 1, 4, 17, 1.00),
(16621, 247, 1, 4, 1, 1.00),
(17052, 248, 2, 1, 15, 0.05),
(17051, 248, 2, 1, 14, 0.00),
(17050, 248, 2, 1, 13, 100.00),
(17049, 248, 2, 1, 12, 100.00),
(17048, 248, 2, 1, 11, 100.00),
(17047, 248, 2, 1, 10, 0.30),
(17046, 248, 2, 1, 9, 1.00),
(17045, 248, 2, 1, 8, 1.00),
(17044, 248, 2, 1, 7, 1.00),
(17043, 248, 2, 1, 6, 1.00),
(17042, 248, 2, 1, 5, 1.00),
(17041, 248, 2, 1, 4, 2000.00),
(17040, 248, 2, 1, 3, 1.60),
(17039, 248, 2, 1, 16, 1.00),
(17038, 248, 2, 1, 2, 1.00),
(17037, 248, 2, 1, 18, 1.00),
(17036, 248, 2, 1, 17, 1.00),
(17035, 248, 2, 1, 1, 1.00),
(17034, 248, 2, 3, 15, 0.05),
(17033, 248, 2, 3, 14, 100.00),
(17032, 248, 2, 3, 13, 0.00),
(17031, 248, 2, 3, 12, 100.00),
(17030, 248, 2, 3, 11, 100.00),
(17029, 248, 2, 3, 10, 0.50),
(17028, 248, 2, 3, 9, 2.00),
(17027, 248, 2, 3, 8, 2.00),
(17026, 248, 2, 3, 7, 2.00),
(17025, 248, 2, 3, 6, 2.00),
(17024, 248, 2, 3, 5, 2.00),
(17023, 248, 2, 3, 4, 2500.00),
(17022, 248, 2, 3, 3, 1.70),
(17021, 248, 2, 3, 16, 1.00),
(17020, 248, 2, 3, 2, 1.00),
(17019, 248, 2, 3, 18, 1.00),
(17018, 248, 2, 3, 17, 1.00),
(17017, 248, 2, 3, 1, 1.00),
(17016, 248, 2, 2, 15, 0.05),
(17015, 248, 2, 2, 14, 100.00),
(17014, 248, 2, 2, 13, 100.00),
(17013, 248, 2, 2, 12, 0.00),
(17012, 248, 2, 2, 11, 100.00),
(17011, 248, 2, 2, 10, 0.60),
(17010, 248, 2, 2, 9, 3.00),
(17009, 248, 2, 2, 8, 3.00),
(17008, 248, 2, 2, 7, 3.00),
(17007, 248, 2, 2, 6, 3.00),
(17006, 248, 2, 2, 5, 3.00),
(17005, 248, 2, 2, 4, 3500.00),
(17004, 248, 2, 2, 3, 1.80),
(17003, 248, 2, 2, 16, 1.00),
(17002, 248, 2, 2, 2, 1.00),
(17001, 248, 2, 2, 18, 1.00),
(17000, 248, 2, 2, 17, 1.00),
(16999, 248, 2, 2, 1, 1.00),
(16998, 248, 2, 4, 15, 0.05),
(16997, 248, 2, 4, 14, 100.00),
(16996, 248, 2, 4, 13, 100.00),
(16995, 248, 2, 4, 12, 100.00),
(16994, 248, 2, 4, 11, 0.00),
(16993, 248, 2, 4, 10, 0.80),
(16992, 248, 2, 4, 9, 5.00),
(16991, 248, 2, 4, 8, 5.00),
(16990, 248, 2, 4, 7, 5.00),
(16989, 248, 2, 4, 6, 5.00),
(16988, 248, 2, 4, 5, 5.00),
(16987, 248, 2, 4, 4, 4000.00),
(16986, 248, 2, 4, 3, 2.00),
(16985, 248, 2, 4, 16, 3.00),
(16984, 248, 2, 4, 2, 3.00),
(16983, 248, 2, 4, 18, 3.00),
(16982, 248, 2, 4, 17, 222.00),
(16981, 248, 2, 4, 1, 2222.00),
(16980, 248, 1, 1, 15, 0.05),
(16979, 248, 1, 1, 14, 0.00),
(16978, 248, 1, 1, 13, 100.00),
(16977, 248, 1, 1, 12, 100.00),
(16976, 248, 1, 1, 11, 100.00),
(16975, 248, 1, 1, 10, 0.30),
(16974, 248, 1, 1, 9, 1.00),
(16973, 248, 1, 1, 8, 1.00),
(16972, 248, 1, 1, 7, 1.00),
(16971, 248, 1, 1, 6, 1.00),
(16970, 248, 1, 1, 5, 1.00),
(16969, 248, 1, 1, 4, 2000.00),
(16968, 248, 1, 1, 3, 1.60),
(16967, 248, 1, 1, 16, 1.00),
(16966, 248, 1, 1, 2, 1.00),
(16965, 248, 1, 1, 18, 1.00),
(16964, 248, 1, 1, 17, 1.00),
(16963, 248, 1, 1, 1, 1.00),
(16962, 248, 1, 3, 15, 0.05),
(16961, 248, 1, 3, 14, 100.00),
(16960, 248, 1, 3, 13, 0.00),
(16959, 248, 1, 3, 12, 100.00),
(16958, 248, 1, 3, 11, 100.00),
(16957, 248, 1, 3, 10, 0.50),
(16956, 248, 1, 3, 9, 2.00),
(16955, 248, 1, 3, 8, 2.00),
(16954, 248, 1, 3, 7, 2.00),
(16953, 248, 1, 3, 6, 2.00),
(16952, 248, 1, 3, 5, 2.00),
(16951, 248, 1, 3, 4, 2500.00),
(16950, 248, 1, 3, 3, 1.70),
(16949, 248, 1, 3, 16, 1.00),
(16948, 248, 1, 3, 2, 1.00),
(16947, 248, 1, 3, 18, 1.00),
(16946, 248, 1, 3, 17, 1.00),
(16945, 248, 1, 3, 1, 1.00),
(16944, 248, 1, 2, 15, 0.05),
(16943, 248, 1, 2, 14, 100.00),
(16942, 248, 1, 2, 13, 100.00),
(16941, 248, 1, 2, 12, 0.00),
(16940, 248, 1, 2, 11, 100.00),
(16939, 248, 1, 2, 10, 0.60),
(16938, 248, 1, 2, 9, 3.00),
(16937, 248, 1, 2, 8, 3.00),
(16936, 248, 1, 2, 7, 3.00),
(16935, 248, 1, 2, 6, 3.00),
(16934, 248, 1, 2, 5, 3.00),
(16933, 248, 1, 2, 4, 3500.00),
(16932, 248, 1, 2, 3, 1.80),
(16931, 248, 1, 2, 16, 1.00),
(16930, 248, 1, 2, 2, 1.00),
(16929, 248, 1, 2, 18, 1.00),
(16928, 248, 1, 2, 17, 1.00),
(16927, 248, 1, 2, 1, 1.00),
(16926, 248, 1, 4, 15, 0.05),
(16925, 248, 1, 4, 14, 100.00),
(16924, 248, 1, 4, 13, 100.00),
(16923, 248, 1, 4, 12, 100.00),
(16922, 248, 1, 4, 11, 0.00),
(16921, 248, 1, 4, 10, 0.80),
(16920, 248, 1, 4, 9, 5.00),
(16919, 248, 1, 4, 8, 5.00),
(16918, 248, 1, 4, 7, 5.00),
(16917, 248, 1, 4, 6, 5.00),
(16916, 248, 1, 4, 5, 5.00),
(16915, 248, 1, 4, 4, 4000.00),
(16914, 248, 1, 4, 3, 2.00),
(16913, 248, 1, 4, 16, 3.00),
(16912, 248, 1, 4, 2, 3.00),
(16911, 248, 1, 4, 18, 3.00),
(16910, 248, 1, 4, 17, 1.00),
(16909, 248, 1, 4, 1, 1.00),
(16908, 247, 4, 1, 15, 0.05),
(16907, 247, 4, 1, 14, 0.00),
(16906, 247, 4, 1, 13, 100.00),
(16905, 247, 4, 1, 12, 100.00),
(16904, 247, 4, 1, 11, 100.00),
(16903, 247, 4, 1, 10, 0.30),
(16902, 247, 4, 1, 9, 1.00),
(16901, 247, 4, 1, 8, 1.00),
(16900, 247, 4, 1, 7, 1.00),
(16899, 247, 4, 1, 6, 1.00),
(16898, 247, 4, 1, 5, 1.00),
(16897, 247, 4, 1, 4, 2000.00),
(16896, 247, 4, 1, 3, 1.60),
(16895, 247, 4, 1, 16, 1.00),
(16894, 247, 4, 1, 2, 1.00),
(16893, 247, 4, 1, 18, 1.00),
(16892, 247, 4, 1, 17, 1.00),
(16891, 247, 4, 1, 1, 1.00),
(16890, 247, 4, 3, 15, 0.05),
(16889, 247, 4, 3, 14, 100.00),
(16888, 247, 4, 3, 13, 0.00),
(16887, 247, 4, 3, 12, 100.00),
(16886, 247, 4, 3, 11, 100.00),
(16885, 247, 4, 3, 10, 0.50),
(16884, 247, 4, 3, 9, 2.00),
(16883, 247, 4, 3, 8, 2.00),
(16882, 247, 4, 3, 7, 2.00),
(16881, 247, 4, 3, 6, 2.00),
(16880, 247, 4, 3, 5, 2.00),
(16879, 247, 4, 3, 4, 2500.00),
(16878, 247, 4, 3, 3, 1.70),
(16877, 247, 4, 3, 16, 1.00),
(16876, 247, 4, 3, 2, 1.00),
(16875, 247, 4, 3, 18, 1.00),
(16874, 247, 4, 3, 17, 1.00),
(16873, 247, 4, 3, 1, 1.00),
(16872, 247, 4, 2, 15, 0.05),
(16871, 247, 4, 2, 14, 100.00),
(16870, 247, 4, 2, 13, 100.00),
(16869, 247, 4, 2, 12, 0.00),
(16868, 247, 4, 2, 11, 100.00),
(16867, 247, 4, 2, 10, 0.60),
(16866, 247, 4, 2, 9, 3.00),
(16865, 247, 4, 2, 8, 3.00),
(16864, 247, 4, 2, 7, 3.00),
(16863, 247, 4, 2, 6, 3.00),
(16862, 247, 4, 2, 5, 3.00),
(16861, 247, 4, 2, 4, 3500.00),
(16860, 247, 4, 2, 3, 1.80),
(16859, 247, 4, 2, 16, 1.00),
(16858, 247, 4, 2, 2, 1.00),
(16857, 247, 4, 2, 18, 1.00),
(16856, 247, 4, 2, 17, 1.00),
(16855, 247, 4, 2, 1, 1.00),
(16854, 247, 4, 4, 15, 0.05),
(16853, 247, 4, 4, 14, 100.00),
(16852, 247, 4, 4, 13, 100.00),
(16851, 247, 4, 4, 12, 100.00),
(16850, 247, 4, 4, 11, 0.00),
(16849, 247, 4, 4, 10, 0.80),
(16848, 247, 4, 4, 9, 5.00),
(16847, 247, 4, 4, 8, 5.00),
(16846, 247, 4, 4, 7, 5.00),
(16845, 247, 4, 4, 6, 5.00),
(16844, 247, 4, 4, 5, 5.00),
(16843, 247, 4, 4, 4, 4000.00),
(16842, 247, 4, 4, 3, 2.00),
(16841, 247, 4, 4, 16, 1.00),
(16840, 247, 4, 4, 2, 1.00),
(16839, 247, 4, 4, 18, 1.00),
(16838, 247, 4, 4, 17, 2.00),
(16837, 247, 4, 4, 1, 2.00),
(17340, 248, 6, 1, 15, 0.05),
(17339, 248, 6, 1, 14, 0.00),
(17338, 248, 6, 1, 13, 100.00),
(17337, 248, 6, 1, 12, 100.00),
(17336, 248, 6, 1, 11, 100.00),
(17335, 248, 6, 1, 10, 0.30),
(17334, 248, 6, 1, 9, 1.00),
(17333, 248, 6, 1, 8, 1.00),
(17332, 248, 6, 1, 7, 1.00),
(17331, 248, 6, 1, 6, 1.00),
(17330, 248, 6, 1, 5, 1.00),
(17329, 248, 6, 1, 4, 2000.00),
(17328, 248, 6, 1, 3, 1.60),
(17327, 248, 6, 1, 16, 1.00),
(17326, 248, 6, 1, 2, 1.00),
(17325, 248, 6, 1, 18, 1.00),
(17324, 248, 6, 1, 17, 1.00),
(17323, 248, 6, 1, 1, 1.00),
(17322, 248, 6, 3, 15, 0.05),
(17321, 248, 6, 3, 14, 100.00),
(17320, 248, 6, 3, 13, 0.00),
(17319, 248, 6, 3, 12, 100.00),
(17318, 248, 6, 3, 11, 100.00),
(17317, 248, 6, 3, 10, 0.50),
(17316, 248, 6, 3, 9, 2.00),
(17315, 248, 6, 3, 8, 2.00),
(17314, 248, 6, 3, 7, 2.00),
(17313, 248, 6, 3, 6, 2.00),
(17312, 248, 6, 3, 5, 2.00),
(17311, 248, 6, 3, 4, 2500.00),
(17310, 248, 6, 3, 3, 1.70),
(17309, 248, 6, 3, 16, 1.00),
(17308, 248, 6, 3, 2, 1.00),
(17307, 248, 6, 3, 18, 1.00),
(17306, 248, 6, 3, 17, 1.00),
(17305, 248, 6, 3, 1, 1.00),
(17304, 248, 6, 2, 15, 0.05),
(17303, 248, 6, 2, 14, 100.00),
(17302, 248, 6, 2, 13, 100.00),
(17301, 248, 6, 2, 12, 0.00),
(17300, 248, 6, 2, 11, 100.00),
(17299, 248, 6, 2, 10, 0.60),
(17298, 248, 6, 2, 9, 3.00),
(17297, 248, 6, 2, 8, 3.00),
(17296, 248, 6, 2, 7, 3.00),
(17295, 248, 6, 2, 6, 3.00),
(17294, 248, 6, 2, 5, 3.00),
(17293, 248, 6, 2, 4, 3500.00),
(17292, 248, 6, 2, 3, 1.80),
(17291, 248, 6, 2, 16, 1.00),
(17290, 248, 6, 2, 2, 1.00),
(17289, 248, 6, 2, 18, 1.00),
(17288, 248, 6, 2, 17, 1.00),
(17287, 248, 6, 2, 1, 1.00),
(17286, 248, 6, 4, 15, 0.05),
(17285, 248, 6, 4, 14, 100.00),
(17284, 248, 6, 4, 13, 100.00),
(17283, 248, 6, 4, 12, 100.00),
(17282, 248, 6, 4, 11, 0.00),
(17281, 248, 6, 4, 10, 0.80),
(17280, 248, 6, 4, 9, 5.00),
(17279, 248, 6, 4, 8, 5.00),
(17278, 248, 6, 4, 7, 5.00),
(17277, 248, 6, 4, 6, 5.00),
(17276, 248, 6, 4, 5, 5.00),
(17275, 248, 6, 4, 4, 4000.00),
(17274, 248, 6, 4, 3, 2.00),
(17273, 248, 6, 4, 16, 3.00),
(17272, 248, 6, 4, 2, 3.00),
(17271, 248, 6, 4, 18, 3.00),
(17270, 248, 6, 4, 17, 222.00),
(17269, 248, 6, 4, 1, 2222.00),
(17268, 248, 5, 1, 15, 0.05),
(17267, 248, 5, 1, 14, 0.00),
(17266, 248, 5, 1, 13, 100.00),
(17265, 248, 5, 1, 12, 100.00),
(17264, 248, 5, 1, 11, 100.00),
(17263, 248, 5, 1, 10, 0.30),
(17262, 248, 5, 1, 9, 1.00),
(17261, 248, 5, 1, 8, 1.00),
(17260, 248, 5, 1, 7, 1.00),
(17259, 248, 5, 1, 6, 1.00),
(17258, 248, 5, 1, 5, 1.00),
(17257, 248, 5, 1, 4, 2000.00),
(17256, 248, 5, 1, 3, 1.60),
(17255, 248, 5, 1, 16, 1.00),
(17254, 248, 5, 1, 2, 1.00),
(17253, 248, 5, 1, 18, 1.00),
(17252, 248, 5, 1, 17, 1.00),
(17251, 248, 5, 1, 1, 1.00),
(17250, 248, 5, 3, 15, 0.05),
(17249, 248, 5, 3, 14, 100.00),
(17248, 248, 5, 3, 13, 0.00),
(17247, 248, 5, 3, 12, 100.00),
(17246, 248, 5, 3, 11, 100.00),
(17245, 248, 5, 3, 10, 0.50),
(17244, 248, 5, 3, 9, 2.00),
(17243, 248, 5, 3, 8, 2.00),
(17242, 248, 5, 3, 7, 2.00),
(17241, 248, 5, 3, 6, 2.00),
(17240, 248, 5, 3, 5, 2.00),
(17239, 248, 5, 3, 4, 2500.00),
(17238, 248, 5, 3, 3, 1.70),
(17237, 248, 5, 3, 16, 1.00),
(17236, 248, 5, 3, 2, 1.00),
(17235, 248, 5, 3, 18, 1.00),
(17234, 248, 5, 3, 17, 1.00),
(17233, 248, 5, 3, 1, 1.00),
(17232, 248, 5, 2, 15, 0.05),
(17231, 248, 5, 2, 14, 100.00),
(17230, 248, 5, 2, 13, 100.00),
(17229, 248, 5, 2, 12, 0.00),
(17228, 248, 5, 2, 11, 100.00),
(17227, 248, 5, 2, 10, 0.60),
(17226, 248, 5, 2, 9, 3.00),
(17225, 248, 5, 2, 8, 3.00),
(17224, 248, 5, 2, 7, 3.00),
(17223, 248, 5, 2, 6, 3.00),
(17222, 248, 5, 2, 5, 3.00),
(17221, 248, 5, 2, 4, 3500.00),
(17220, 248, 5, 2, 3, 1.80),
(17219, 248, 5, 2, 16, 1.00),
(17218, 248, 5, 2, 2, 1.00),
(17217, 248, 5, 2, 18, 1.00),
(17216, 248, 5, 2, 17, 1.00),
(17215, 248, 5, 2, 1, 1.00),
(17214, 248, 5, 4, 15, 0.05),
(17213, 248, 5, 4, 14, 100.00),
(17212, 248, 5, 4, 13, 100.00),
(17211, 248, 5, 4, 12, 100.00),
(17210, 248, 5, 4, 11, 0.00),
(17209, 248, 5, 4, 10, 0.80),
(17208, 248, 5, 4, 9, 5.00),
(17207, 248, 5, 4, 8, 5.00),
(17206, 248, 5, 4, 7, 5.00),
(17205, 248, 5, 4, 6, 5.00),
(17204, 248, 5, 4, 5, 5.00),
(17203, 248, 5, 4, 4, 4000.00),
(17202, 248, 5, 4, 3, 2.00),
(17201, 248, 5, 4, 16, 3.00),
(17200, 248, 5, 4, 2, 3.00),
(17199, 248, 5, 4, 18, 3.00),
(17198, 248, 5, 4, 17, 222.00),
(17197, 248, 5, 4, 1, 2222.00),
(17196, 248, 4, 1, 15, 0.05),
(17195, 248, 4, 1, 14, 0.00),
(17194, 248, 4, 1, 13, 100.00),
(17193, 248, 4, 1, 12, 100.00),
(17192, 248, 4, 1, 11, 100.00),
(17191, 248, 4, 1, 10, 0.30),
(17190, 248, 4, 1, 9, 1.00),
(17189, 248, 4, 1, 8, 1.00),
(17188, 248, 4, 1, 7, 1.00),
(17187, 248, 4, 1, 6, 1.00),
(17186, 248, 4, 1, 5, 1.00),
(17185, 248, 4, 1, 4, 2000.00),
(17184, 248, 4, 1, 3, 1.60),
(17183, 248, 4, 1, 16, 1.00),
(17182, 248, 4, 1, 2, 1.00),
(17181, 248, 4, 1, 18, 1.00),
(17180, 248, 4, 1, 17, 1.00),
(17179, 248, 4, 1, 1, 555.00),
(17178, 248, 4, 3, 15, 0.05),
(17177, 248, 4, 3, 14, 100.00),
(17176, 248, 4, 3, 13, 0.00),
(17175, 248, 4, 3, 12, 100.00),
(17174, 248, 4, 3, 11, 100.00),
(17173, 248, 4, 3, 10, 0.50),
(17172, 248, 4, 3, 9, 2.00),
(17171, 248, 4, 3, 8, 2.00),
(17170, 248, 4, 3, 7, 2.00),
(17169, 248, 4, 3, 6, 2.00),
(17168, 248, 4, 3, 5, 2.00),
(17167, 248, 4, 3, 4, 2500.00),
(17166, 248, 4, 3, 3, 1.70),
(17165, 248, 4, 3, 16, 1.00),
(17164, 248, 4, 3, 2, 1.00),
(17163, 248, 4, 3, 18, 1.00),
(17162, 248, 4, 3, 17, 1.00),
(17161, 248, 4, 3, 1, 444.00),
(17160, 248, 4, 2, 15, 0.05),
(17159, 248, 4, 2, 14, 100.00),
(17158, 248, 4, 2, 13, 100.00),
(17157, 248, 4, 2, 12, 0.00),
(17156, 248, 4, 2, 11, 100.00),
(17155, 248, 4, 2, 10, 0.60),
(17154, 248, 4, 2, 9, 3.00),
(17153, 248, 4, 2, 8, 3.00),
(17152, 248, 4, 2, 7, 3.00),
(17151, 248, 4, 2, 6, 3.00),
(17150, 248, 4, 2, 5, 3.00),
(17149, 248, 4, 2, 4, 3500.00),
(17148, 248, 4, 2, 3, 1.80),
(17147, 248, 4, 2, 16, 1.00),
(17146, 248, 4, 2, 2, 1.00),
(17145, 248, 4, 2, 18, 1.00),
(17144, 248, 4, 2, 17, 1.00),
(17143, 248, 4, 2, 1, 33333.00),
(17142, 248, 4, 4, 15, 0.05),
(17141, 248, 4, 4, 14, 100.00),
(17140, 248, 4, 4, 13, 100.00),
(17139, 248, 4, 4, 12, 100.00),
(17138, 248, 4, 4, 11, 0.00),
(17137, 248, 4, 4, 10, 0.80),
(17136, 248, 4, 4, 9, 5.00),
(17135, 248, 4, 4, 8, 5.00),
(17134, 248, 4, 4, 7, 5.00),
(17133, 248, 4, 4, 6, 5.00),
(17132, 248, 4, 4, 5, 5.00),
(17131, 248, 4, 4, 4, 4000.00),
(17130, 248, 4, 4, 3, 2.00),
(17129, 248, 4, 4, 16, 3.00),
(17128, 248, 4, 4, 2, 3.00),
(17127, 248, 4, 4, 18, 3.00),
(17126, 248, 4, 4, 17, 222.00),
(17125, 248, 4, 4, 1, 22222.00),
(17124, 248, 3, 1, 15, 0.05),
(17123, 248, 3, 1, 14, 0.00),
(17122, 248, 3, 1, 13, 100.00),
(17121, 248, 3, 1, 12, 100.00),
(17120, 248, 3, 1, 11, 100.00),
(17119, 248, 3, 1, 10, 0.30),
(17118, 248, 3, 1, 9, 1.00),
(17117, 248, 3, 1, 8, 1.00),
(17116, 248, 3, 1, 7, 1.00),
(17115, 248, 3, 1, 6, 1.00),
(17114, 248, 3, 1, 5, 1.00),
(17113, 248, 3, 1, 4, 2000.00),
(17112, 248, 3, 1, 3, 1.60),
(17111, 248, 3, 1, 16, 1.00),
(17110, 248, 3, 1, 2, 1.00),
(17109, 248, 3, 1, 18, 1.00),
(17108, 248, 3, 1, 17, 1.00),
(17107, 248, 3, 1, 1, 555.00),
(17106, 248, 3, 3, 15, 0.05),
(17105, 248, 3, 3, 14, 100.00),
(17104, 248, 3, 3, 13, 0.00),
(17103, 248, 3, 3, 12, 100.00),
(17102, 248, 3, 3, 11, 100.00),
(17101, 248, 3, 3, 10, 0.50),
(17100, 248, 3, 3, 9, 2.00),
(17099, 248, 3, 3, 8, 2.00),
(17098, 248, 3, 3, 7, 2.00),
(17097, 248, 3, 3, 6, 2.00),
(17096, 248, 3, 3, 5, 2.00),
(17095, 248, 3, 3, 4, 2500.00),
(17094, 248, 3, 3, 3, 1.70),
(17093, 248, 3, 3, 16, 1.00),
(17092, 248, 3, 3, 2, 1.00),
(17091, 248, 3, 3, 18, 1.00),
(17090, 248, 3, 3, 17, 1.00),
(17089, 248, 3, 3, 1, 444.00),
(17088, 248, 3, 2, 15, 0.05),
(17087, 248, 3, 2, 14, 100.00),
(17086, 248, 3, 2, 13, 100.00),
(17085, 248, 3, 2, 12, 0.00),
(17084, 248, 3, 2, 11, 100.00),
(17083, 248, 3, 2, 10, 0.60),
(17082, 248, 3, 2, 9, 3.00),
(17081, 248, 3, 2, 8, 3.00),
(17080, 248, 3, 2, 7, 3.00),
(17079, 248, 3, 2, 6, 3.00),
(17078, 248, 3, 2, 5, 3.00),
(17077, 248, 3, 2, 4, 3500.00),
(17076, 248, 3, 2, 3, 1.80),
(17075, 248, 3, 2, 16, 1.00),
(17074, 248, 3, 2, 2, 1.00),
(17073, 248, 3, 2, 18, 1.00),
(17072, 248, 3, 2, 17, 1.00),
(17071, 248, 3, 2, 1, 33333.00),
(17070, 248, 3, 4, 15, 0.05),
(17069, 248, 3, 4, 14, 100.00),
(17068, 248, 3, 4, 13, 100.00),
(17067, 248, 3, 4, 12, 100.00),
(17066, 248, 3, 4, 11, 0.00),
(17065, 248, 3, 4, 10, 0.80),
(17064, 248, 3, 4, 9, 5.00),
(17063, 248, 3, 4, 8, 5.00),
(17062, 248, 3, 4, 7, 5.00),
(17061, 248, 3, 4, 6, 5.00),
(17060, 248, 3, 4, 5, 5.00),
(17059, 248, 3, 4, 4, 4000.00),
(17058, 248, 3, 4, 3, 2.00),
(17057, 248, 3, 4, 16, 3.00),
(17056, 248, 3, 4, 2, 3.00),
(17055, 248, 3, 4, 18, 3.00),
(17054, 248, 3, 4, 17, 222.00),
(17053, 248, 3, 4, 1, 22222.00),
(17412, 249, 1, 1, 15, 0.05),
(17411, 249, 1, 1, 14, 0.00),
(17410, 249, 1, 1, 13, 100.00),
(17409, 249, 1, 1, 12, 100.00),
(17408, 249, 1, 1, 11, 100.00),
(17407, 249, 1, 1, 10, 0.30),
(17406, 249, 1, 1, 9, 1.00),
(17405, 249, 1, 1, 8, 1.00),
(17404, 249, 1, 1, 7, 1.00),
(17403, 249, 1, 1, 6, 1.00),
(17402, 249, 1, 1, 5, 1.00),
(17401, 249, 1, 1, 4, 2000.00),
(17400, 249, 1, 1, 3, 1.60),
(17399, 249, 1, 1, 16, 1.00),
(17398, 249, 1, 1, 2, 1.00),
(17397, 249, 1, 1, 18, 1.00),
(17396, 249, 1, 1, 17, 1.00),
(17395, 249, 1, 1, 1, 1.00),
(17394, 249, 1, 3, 15, 0.05),
(17393, 249, 1, 3, 14, 100.00),
(17392, 249, 1, 3, 13, 0.00),
(17391, 249, 1, 3, 12, 100.00),
(17390, 249, 1, 3, 11, 100.00),
(17389, 249, 1, 3, 10, 0.50),
(17388, 249, 1, 3, 9, 2.00),
(17387, 249, 1, 3, 8, 2.00),
(17386, 249, 1, 3, 7, 2.00),
(17385, 249, 1, 3, 6, 2.00),
(17384, 249, 1, 3, 5, 2.00),
(17383, 249, 1, 3, 4, 2500.00),
(17382, 249, 1, 3, 3, 1.70),
(17381, 249, 1, 3, 16, 1.00),
(17380, 249, 1, 3, 2, 1.00),
(17379, 249, 1, 3, 18, 1.00),
(17378, 249, 1, 3, 17, 1.00),
(17377, 249, 1, 3, 1, 1.00),
(17376, 249, 1, 2, 15, 0.05),
(17375, 249, 1, 2, 14, 100.00),
(17374, 249, 1, 2, 13, 100.00),
(17373, 249, 1, 2, 12, 0.00),
(17372, 249, 1, 2, 11, 100.00),
(17371, 249, 1, 2, 10, 0.60),
(17370, 249, 1, 2, 9, 3.00),
(17369, 249, 1, 2, 8, 3.00),
(17368, 249, 1, 2, 7, 3.00),
(17367, 249, 1, 2, 6, 3.00),
(17366, 249, 1, 2, 5, 3.00),
(17365, 249, 1, 2, 4, 3500.00),
(17364, 249, 1, 2, 3, 1.80),
(17363, 249, 1, 2, 16, 1.00),
(17362, 249, 1, 2, 2, 1.00),
(17361, 249, 1, 2, 18, 1.00),
(17360, 249, 1, 2, 17, 1.00),
(17359, 249, 1, 2, 1, 1.00),
(17358, 249, 1, 4, 15, 0.05),
(17357, 249, 1, 4, 14, 100.00),
(17356, 249, 1, 4, 13, 100.00),
(17355, 249, 1, 4, 12, 100.00),
(17354, 249, 1, 4, 11, 0.00),
(17353, 249, 1, 4, 10, 0.80),
(17352, 249, 1, 4, 9, 5.00),
(17351, 249, 1, 4, 8, 5.00),
(17350, 249, 1, 4, 7, 5.00),
(17349, 249, 1, 4, 6, 5.00),
(17348, 249, 1, 4, 5, 5.00),
(17347, 249, 1, 4, 4, 4000.00),
(17346, 249, 1, 4, 3, 2.00),
(17345, 249, 1, 4, 16, 1.00),
(17344, 249, 1, 4, 2, 1.00),
(17343, 249, 1, 4, 18, 1.00),
(17342, 249, 1, 4, 17, 1.00),
(17341, 249, 1, 4, 1, 1.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rounds`
--

CREATE TABLE IF NOT EXISTS `tbl_rounds` (
  `id` int(16) NOT NULL,
  `game_id` varchar(100) COLLATE utf8_bin NOT NULL,
  `round_index` int(16) NOT NULL,
  `created_by` varchar(100) COLLATE utf8_bin NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_round_settings`
--

CREATE TABLE IF NOT EXISTS `tbl_round_settings` (
  `id` int(16) NOT NULL,
  `type` varchar(100) COLLATE utf8_bin NOT NULL,
  `key` varchar(16) COLLATE utf8_bin NOT NULL,
  `value` varchar(100) COLLATE utf8_bin NOT NULL,
  `round_id` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'fk',
  `team_id` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'fk',
  `region_id` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'fk'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales`
--

CREATE TABLE IF NOT EXISTS `tbl_sales` (
  `id` int(10) NOT NULL,
  `quantity` double NOT NULL,
  `offer_price` int(10) DEFAULT NULL,
  `sale_allowance` double DEFAULT '0',
  `team_id` int(11) NOT NULL,
  `round_id` int(10) NOT NULL,
  `region_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_sales`
--

INSERT INTO `tbl_sales` (`id`, `quantity`, `offer_price`, `sale_allowance`, `team_id`, `round_id`, `region_id`, `product_id`) VALUES
(1, 2, NULL, 0, 71, 71, 4, 9),
(2, 2, NULL, 0, 71, 1, 4, 19),
(3, 1, NULL, 0, 71, 1, 4, 9),
(4, 1, 12, 0, 98, 1, 4, 35),
(5, 1, 100, 0, 98, 1, 2, 35),
(6, 1, 1000, 0, 98, 1, 3, 35),
(7, 2, 2000, 0, 99, 1, 4, 36),
(8, 2, 2000, 0, 99, 1, 2, 36),
(9, 1, 2000, 0, 99, 1, 3, 36),
(10, 1, 1000, 0, 99, 1, 1, 36),
(11, 10, 4000, 0, 115, 1, 4, 77),
(12, 6, 1000, 0, 115, 1, 4, 75),
(13, 6, 1000, 0, 115, 1, 4, 74),
(14, 6, 1000, 0, 115, 1, 4, 72),
(15, 10, 5000, 0, 115, 1, 2, 77),
(16, 6, 1000, 0, 115, 1, 2, 75),
(17, 6, 1000, 0, 115, 1, 2, 74),
(18, 6, 1000, 0, 115, 1, 2, 72),
(19, 10, 4000, 0, 115, 1, 3, 77),
(20, 6, 1000, 0, 115, 1, 3, 75),
(21, 6, 1000, 0, 115, 1, 3, 74),
(22, 6, 1000, 0, 115, 1, 3, 72),
(23, 6, 1000, 0, 115, 1, 1, 72),
(24, 6, 1000, 0, 115, 1, 1, 74),
(25, 6, 1000, 0, 115, 1, 1, 75),
(26, 20, 4000, 0, 115, 1, 1, 77),
(27, 20, 4000, 0, 116, 1, 4, 78),
(28, 20, 1000, 0, 116, 1, 4, 76),
(29, 19, 1000, 0, 116, 1, 4, 73),
(30, 15, 1000, 0, 116, 1, 4, 70),
(31, 3, 1000, 0, 116, 1, 2, 73),
(32, 5, 1000, 0, 116, 1, 2, 76),
(33, 10, 5000, 0, 116, 1, 2, 78),
(34, 8, 1000, 0, 116, 1, 2, 70),
(35, 2, 1000, 0, 116, 1, 3, 73),
(36, 6, 1000, 0, 116, 1, 3, 76),
(37, 10, 4000, 0, 116, 1, 3, 78),
(38, 8, 1000, 0, 116, 1, 3, 70),
(39, 1, 1000, 0, 116, 1, 1, 73),
(40, 7, 1000, 0, 116, 1, 1, 76),
(41, 10, 4000, 0, 116, 1, 1, 78),
(42, 8, 1000, 0, 116, 1, 1, 70),
(43, 10, 1000, 0, 117, 1, 4, 83),
(44, 10, 1000, 0, 117, 1, 4, 84),
(45, 10, 1000, 0, 117, 1, 4, 85),
(46, 10, 2500, 0, 117, 1, 4, 86),
(47, 10, 1000, 0, 117, 1, 2, 83),
(48, 10, 1000, 0, 117, 1, 2, 84),
(49, 10, 1000, 0, 117, 1, 2, 85),
(50, 10, 6700, 0, 117, 1, 2, 86),
(51, 20, 6500, 0, 117, 1, 3, 86),
(52, 20, 1000, 0, 117, 1, 3, 85),
(53, 20, 1000, 0, 117, 1, 3, 84),
(54, 20, 1000, 0, 117, 1, 3, 83),
(55, 10, 1000, 0, 117, 1, 1, 83),
(56, 10, 1000, 0, 117, 1, 1, 84),
(57, 10, 1000, 0, 117, 1, 1, 85),
(58, 10, 6700, 0, 117, 1, 1, 86),
(59, 3, 1000, 0, 118, 1, 4, 79),
(60, 3, 1000, 0, 118, 1, 4, 80),
(61, 3, 1000, 0, 118, 1, 4, 81),
(62, 5, 2500, 0, 118, 1, 4, 82),
(63, 35, 2500, 0, 118, 1, 2, 82),
(64, 15, 1000, 0, 118, 1, 2, 81),
(65, 15, 1000, 0, 118, 1, 2, 80),
(66, 15, 1000, 0, 118, 1, 2, 79),
(67, 3, 1000, 0, 118, 1, 3, 79),
(68, 3, 1000, 0, 118, 1, 3, 80),
(69, 3, 1000, 0, 118, 1, 3, 81),
(70, 5, 2500, 0, 118, 1, 3, 82),
(71, 3, 1000, 0, 118, 1, 1, 79),
(72, 3, 1000, 0, 118, 1, 1, 80),
(73, 3, 1000, 0, 118, 1, 1, 81),
(74, 5, 3000, 0, 118, 1, 1, 82),
(75, 5, 1000, 0, 121, 1, 4, 94),
(76, 5, 2000, 0, 121, 1, 2, 94),
(77, 10, 10000, 0, 122, 1, 4, 95),
(78, 10, 2000, 0, 122, 1, 3, 95);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales_data`
--

CREATE TABLE IF NOT EXISTS `tbl_sales_data` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `round_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `offer_price` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_sales_data`
--

INSERT INTO `tbl_sales_data` (`id`, `product_id`, `region_id`, `round_id`, `team_id`, `qty`, `offer_price`, `game_id`) VALUES
(15, 78, 4, 1, 116, 10, 4000, 238),
(16, 86, 4, 1, 117, 0, 2500, 238),
(17, 82, 4, 1, 118, 5, 2500, 238),
(18, 77, 4, 1, 115, 5, 4000, 238),
(19, 78, 3, 1, 116, 10, 4000, 238),
(20, 82, 3, 1, 118, 0, 2500, 238),
(21, 77, 3, 1, 115, 10, 4000, 238),
(22, 78, 1, 1, 116, 10, 4000, 238),
(23, 82, 1, 1, 118, 0, 3000, 238),
(24, 77, 1, 1, 115, 15, 4000, 238),
(25, 86, 4, 1, 117, 5, 2500, 238),
(26, 82, 4, 1, 118, 1, 2500, 238),
(27, 82, 2, 1, 118, 35, 2500, 238),
(28, 82, 3, 1, 118, 5, 2500, 238),
(29, 86, 4, 1, 117, 4, 2500, 238),
(30, 78, 4, 1, 116, 10, 4000, 238),
(31, 82, 4, 1, 118, 0, 2500, 238),
(32, 77, 4, 1, 115, 5, 4000, 238),
(33, 78, 2, 1, 116, 10, 5000, 238),
(34, 82, 2, 1, 118, 0, 2500, 238),
(35, 77, 2, 1, 115, 5, 5000, 238),
(36, 86, 3, 1, 117, 20, 6500, 238),
(37, 78, 3, 1, 116, 0, 4000, 238),
(38, 82, 3, 1, 118, 0, 2500, 238),
(39, 77, 3, 1, 115, 0, 4000, 238),
(40, 78, 1, 1, 116, 0, 4000, 238),
(41, 82, 1, 1, 118, 5, 3000, 238),
(42, 77, 1, 1, 115, 5, 4000, 238);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sale_data`
--

CREATE TABLE IF NOT EXISTS `tbl_sale_data` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sold_in_dc` int(11) DEFAULT NULL,
  `sold_in_ec1` int(11) DEFAULT NULL,
  `sold_in_ec2` int(11) DEFAULT NULL,
  `sold_in_ic` int(11) DEFAULT NULL,
  `round_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_storages`
--

CREATE TABLE IF NOT EXISTS `tbl_storages` (
  `id` int(16) NOT NULL,
  `item_type` varchar(16) COLLATE utf8_bin NOT NULL,
  `item_id` int(16) NOT NULL,
  `quantity` double NOT NULL,
  `team_id` int(16) NOT NULL,
  `region_id` int(16) DEFAULT '0',
  `status` int(1) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_storages`
--

INSERT INTO `tbl_storages` (`id`, `item_type`, `item_id`, `quantity`, `team_id`, `region_id`, `status`) VALUES
(44, '1', 1023, 120, 73, 4, NULL),
(43, '2', 9, 1, 71, 1, 1),
(42, '1', 973, 4, 71, 4, 0),
(41, '1', 967, 5, 71, 4, 0),
(40, '1', 970, 11, 71, 4, 0),
(39, '1', 968, 10, 71, 4, 0),
(38, '2', 9, 4, 71, 2, 1),
(37, '2', 19, 4, 71, 3, 1),
(36, '2', 19, 4, 71, 1, 0),
(25, '2', 9, 5, 71, 4, 1),
(28, '2', 19, 0, 71, 4, 1),
(29, '1', 969, 2, 71, 4, 0),
(30, '2', 19, 5, 71, 2, 0),
(31, '2', 9, 6, 71, 3, NULL),
(45, '1', 1026, 10, 73, 4, NULL),
(46, '1', 1030, 20, 73, 4, NULL),
(47, '1', 1034, 20, 73, 4, NULL),
(48, '1', 1036, 20, 73, 4, NULL),
(49, '1', 1039, 20, 73, 4, NULL),
(50, '1', 1041, 10, 73, 4, NULL),
(51, '1', 1045, 20, 73, 4, NULL),
(52, '1', 1046, 10, 73, 4, NULL),
(53, '1', 1049, 20, 73, 4, NULL),
(54, '1', 1029, -10, 73, 4, 1),
(55, '1', 1032, -10, 73, 4, 1),
(56, '1', 1035, -10, 73, 4, 1),
(57, '1', 1038, -10, 73, 4, 1),
(58, '1', 1044, -10, 73, 4, 1),
(59, '1', 1048, 0, 73, 4, 1),
(60, '2', 30, 1, 73, 4, 1),
(61, '2', 30, 1, 73, 2, 1),
(62, '2', 30, 1, 73, 3, 1),
(63, '2', 30, 1, 73, 1, 1),
(64, '1', 1387, 1, 97, 2, 1),
(65, '1', 1390, 1, 97, 2, 1),
(66, '1', 1394, 1, 97, 2, 1),
(67, '1', 1396, 1, 97, 2, 1),
(68, '1', 1399, 1, 97, 2, 1),
(69, '1', 1402, 1, 97, 2, 1),
(70, '1', 1405, 1, 97, 2, 1),
(71, '1', 1408, 1, 97, 2, 1),
(72, '1', 1410, 1, 97, 2, 1),
(73, '1', 1412, 1, 97, 2, 1),
(74, '1', 1415, 0, 98, 4, 1),
(75, '1', 1418, 0, 98, 4, 1),
(76, '1', 1421, 0, 98, 4, 1),
(77, '1', 1424, 0, 98, 4, 1),
(78, '1', 1427, 0, 98, 4, 1),
(79, '1', 1430, 0, 98, 4, 1),
(80, '1', 1433, 0, 98, 4, 1),
(81, '1', 1436, 0, 98, 4, 1),
(82, '1', 1438, 0, 98, 4, 1),
(83, '1', 1440, 0, 98, 4, 1),
(84, '2', 35, 7, 98, 4, 1),
(85, '2', 35, 1, 98, 2, 1),
(86, '2', 35, 1, 98, 3, 1),
(87, '2', 35, 1, 98, 1, 1),
(88, '1', 1471, 0, 99, 2, 1),
(89, '1', 1474, 10, 99, 2, 1),
(90, '1', 1477, 0, 99, 2, 1),
(91, '1', 1480, 0, 99, 2, 1),
(92, '1', 1483, 0, 99, 2, 1),
(93, '1', 1486, 0, 99, 2, 1),
(94, '1', 1489, 0, 99, 2, 1),
(95, '1', 1492, 0, 99, 2, 1),
(96, '1', 1494, 10, 99, 2, 1),
(97, '1', 1496, 0, 99, 2, 1),
(98, '2', 36, 5, 99, 2, 1),
(99, '2', 36, 1, 99, 4, 1),
(100, '2', 36, 2, 99, 3, 1),
(101, '2', 36, 2, 99, 1, 1),
(102, '1', 1695, -900, 103, 4, 1),
(103, '1', 1698, -900, 103, 4, 1),
(104, '1', 1701, -900, 103, 4, 1),
(105, '1', 1705, 100, 103, 4, 1),
(106, '1', 1707, -900, 103, 4, 1),
(107, '1', 1710, -900, 103, 4, 1),
(108, '1', 1713, -900, 103, 4, 1),
(109, '1', 1716, -900, 103, 4, 1),
(110, '1', 1718, -900, 103, 4, 1),
(111, '1', 1720, 100, 103, 4, 1),
(112, '2', 38, 1000, 103, 4, 1),
(113, '1', 1835, 0, 108, 3, 1),
(114, '1', 1836, 0, 108, 3, 1),
(115, '1', 1837, 0, 108, 3, 1),
(116, '1', 1838, 0, 108, 3, 1),
(117, '1', 1840, 0, 108, 3, 1),
(118, '1', 1841, 0, 108, 3, 1),
(119, '1', 1843, 0, 108, 3, 1),
(120, '1', 1847, 0, 108, 3, 1),
(121, '1', 1849, 0, 108, 3, 1),
(122, '1', 1850, 0, 108, 3, 1),
(123, '1', 1852, 0, 108, 3, 1),
(124, '1', 1853, 0, 108, 3, 1),
(125, '1', 1855, 0, 108, 3, 1),
(126, '1', 1856, 0, 108, 3, 1),
(127, '1', 1857, 0, 108, 3, 1),
(128, '1', 1858, 0, 108, 3, 1),
(129, '1', 1859, 0, 108, 3, 1),
(130, '1', 1860, 0, 108, 3, 1),
(131, '1', 1862, 0, 108, 3, 1),
(132, '2', 46, 50, 108, 3, 1),
(133, '2', 47, 50, 108, 3, 1),
(134, '2', 48, 50, 108, 3, 1),
(135, '2', 50, 50, 108, 3, 1),
(136, '1', 1891, 0, 110, 2, 1),
(137, '1', 1894, 0, 110, 2, 1),
(138, '1', 1897, 0, 110, 2, 1),
(139, '1', 1900, 0, 110, 2, 1),
(140, '1', 1903, 0, 110, 2, 1),
(141, '1', 1906, 0, 110, 2, 1),
(142, '1', 1909, 0, 110, 2, 1),
(143, '1', 1912, 0, 110, 2, 1),
(144, '1', 1914, 0, 110, 2, 1),
(145, '1', 1916, 0, 110, 2, 1),
(146, '1', 1892, 0, 110, 2, 1),
(147, '1', 1895, 0, 110, 2, 1),
(148, '1', 1898, 0, 110, 2, 1),
(149, '1', 1901, 0, 110, 2, 1),
(150, '1', 1904, 0, 110, 2, 1),
(151, '1', 1907, 0, 110, 2, 1),
(152, '1', 1910, 0, 110, 2, 1),
(153, '1', 1913, 0, 110, 2, 1),
(154, '1', 1915, 0, 110, 2, 1),
(155, '1', 1917, 0, 110, 2, 1),
(156, '1', 1893, 0, 110, 2, 1),
(157, '1', 1896, 0, 110, 2, 1),
(158, '1', 1899, 0, 110, 2, 1),
(159, '1', 1902, 0, 110, 2, 1),
(160, '1', 1905, 0, 110, 2, 1),
(161, '1', 1908, 0, 110, 2, 1),
(162, '1', 1911, 0, 110, 2, 1),
(163, '1', 1918, 0, 110, 2, 1),
(164, '2', 51, 50, 110, 2, 1),
(165, '2', 52, 50, 110, 2, 1),
(166, '2', 56, 50, 110, 2, 1),
(167, '2', 57, 50, 110, 2, 1),
(168, '1', 2171, 100, 114, 3, 1),
(169, '1', 2172, 50, 114, 3, 1),
(170, '1', 2173, 50, 114, 3, 1),
(171, '1', 2174, 50, 114, 3, 1),
(172, '1', 2176, 100, 114, 3, 1),
(173, '1', 2177, 150, 114, 3, 1),
(174, '1', 2179, 50, 114, 3, 1),
(175, '1', 2183, 100, 114, 3, 1),
(176, '1', 2185, 50, 114, 3, 1),
(177, '1', 2186, 50, 114, 3, 1),
(178, '1', 2188, 100, 114, 3, 1),
(179, '1', 2189, 50, 114, 3, 1),
(180, '1', 2191, 50, 114, 3, 1),
(181, '1', 2192, 150, 114, 3, 1),
(182, '1', 2193, 50, 114, 3, 1),
(183, '1', 2194, 100, 114, 3, 1),
(184, '1', 2195, 150, 114, 3, 1),
(185, '1', 2196, 100, 114, 3, 1),
(186, '1', 2198, 50, 114, 3, 1),
(187, '1', 2283, 0, 115, 1, 1),
(188, '1', 2285, 0, 115, 1, 1),
(189, '1', 2286, 0, 115, 1, 1),
(190, '1', 2288, 0, 115, 1, 1),
(191, '1', 2059, 50, 113, 2, 1),
(192, '1', 2062, 50, 113, 2, 1),
(193, '1', 2065, 150, 113, 2, 1),
(194, '1', 2068, 0, 113, 2, 1),
(195, '1', 2071, 100, 113, 2, 1),
(196, '1', 2074, 50, 113, 2, 1),
(197, '1', 2077, 100, 113, 2, 1),
(198, '1', 2080, 150, 113, 2, 1),
(199, '1', 2082, 100, 113, 2, 1),
(200, '1', 2084, 100, 113, 2, 1),
(201, '1', 2289, 0, 115, 1, 1),
(202, '1', 2291, 0, 115, 1, 1),
(203, '1', 2295, 0, 115, 1, 1),
(204, '1', 2297, 0, 115, 1, 1),
(205, '1', 2298, 0, 115, 1, 1),
(206, '1', 2299, 0, 115, 1, 1),
(207, '1', 2300, 0, 115, 1, 1),
(208, '1', 2060, 0, 113, 2, 1),
(209, '1', 2063, 50, 113, 2, 1),
(210, '1', 2066, 50, 113, 2, 1),
(211, '1', 2069, 0, 113, 2, 1),
(212, '1', 2072, 0, 113, 2, 1),
(213, '1', 2075, 100, 113, 2, 1),
(214, '1', 2078, 100, 113, 2, 1),
(215, '1', 2081, 50, 113, 2, 1),
(216, '1', 2083, 50, 113, 2, 1),
(217, '1', 2085, 50, 113, 2, 1),
(218, '1', 2301, 0, 115, 1, 1),
(219, '1', 2302, 0, 115, 1, 1),
(220, '1', 2303, 0, 115, 1, 1),
(221, '1', 2304, 0, 115, 1, 1),
(222, '1', 2061, 50, 113, 2, 1),
(223, '1', 2064, 50, 113, 2, 1),
(224, '1', 2067, 0, 113, 2, 1),
(225, '1', 2070, 0, 113, 2, 1),
(226, '1', 2073, 0, 113, 2, 1),
(227, '1', 2076, 0, 113, 2, 1),
(228, '1', 2079, 50, 113, 2, 1),
(229, '1', 2086, 0, 113, 2, 1),
(230, '1', 2305, 0, 115, 1, 1),
(231, '1', 2306, 0, 115, 1, 1),
(232, '1', 2307, 0, 115, 1, 1),
(233, '1', 2308, 0, 115, 1, 1),
(234, '1', 2310, 0, 115, 1, 1),
(235, '2', 77, 0, 115, 1, 1),
(236, '2', 75, 20, 115, 1, 1),
(237, '2', 74, 20, 115, 1, 1),
(238, '2', 72, 20, 115, 1, 1),
(239, '1', 2395, 0, 116, 4, 1),
(240, '1', 2398, 0, 116, 4, 1),
(241, '1', 2401, 0, 116, 4, 1),
(242, '1', 2407, 0, 116, 4, 1),
(243, '1', 2410, 0, 116, 4, 1),
(244, '1', 2413, 0, 116, 4, 1),
(245, '1', 2416, 0, 116, 4, 1),
(246, '1', 2418, 0, 116, 4, 1),
(247, '1', 2420, 0, 116, 4, 1),
(248, '1', 2396, 0, 116, 4, 1),
(249, '1', 2400, 0, 116, 4, 1),
(250, '1', 2403, 0, 116, 4, 1),
(251, '1', 2409, 0, 116, 4, 1),
(252, '1', 2411, 0, 116, 4, 1),
(253, '1', 2414, 0, 116, 4, 1),
(254, '1', 2419, 0, 116, 4, 1),
(255, '1', 2422, 0, 116, 4, 1),
(256, '1', 2397, 0, 116, 4, 1),
(257, '1', 2412, 0, 116, 4, 1),
(258, '2', 70, 20, 116, 4, 1),
(259, '2', 73, 20, 116, 4, 1),
(260, '2', 76, 20, 116, 4, 1),
(261, '2', 78, 0, 116, 4, 1),
(262, '2', 70, 10, 116, 2, 1),
(263, '2', 72, 10, 115, 4, 1),
(264, '2', 72, 10, 115, 2, 1),
(265, '2', 72, 10, 115, 3, 1),
(266, '2', 74, 10, 115, 4, 1),
(267, '2', 74, 10, 115, 2, 1),
(268, '2', 74, 10, 115, 3, 1),
(269, '2', 75, 10, 115, 4, 1),
(270, '2', 77, 0, 115, 4, 1),
(271, '2', 75, 10, 115, 2, 1),
(272, '2', 77, 5, 115, 2, 1),
(273, '2', 78, 0, 116, 2, 1),
(274, '2', 76, 10, 116, 2, 1),
(275, '2', 73, 10, 116, 2, 1),
(276, '2', 70, 10, 116, 3, 1),
(277, '2', 75, 10, 115, 3, 1),
(278, '2', 77, 0, 115, 3, 1),
(279, '2', 78, 0, 116, 3, 1),
(280, '2', 76, 10, 116, 3, 1),
(281, '2', 73, 10, 116, 3, 1),
(282, '2', 70, 10, 116, 1, 1),
(283, '2', 78, 0, 116, 1, 1),
(284, '2', 76, 10, 116, 1, 1),
(285, '2', 73, 10, 116, 1, 1),
(286, '1', 2619, 0, 118, 2, 1),
(287, '1', 2622, 0, 118, 2, 1),
(288, '1', 2625, 0, 118, 2, 1),
(289, '1', 2628, 0, 118, 2, 1),
(290, '1', 2631, 0, 118, 2, 1),
(291, '1', 2634, 0, 118, 2, 1),
(292, '1', 2637, 0, 118, 2, 1),
(293, '1', 2640, 0, 118, 2, 1),
(294, '1', 2642, 0, 118, 2, 1),
(295, '1', 2644, 0, 118, 2, 1),
(296, '1', 2620, 0, 118, 2, 1),
(297, '1', 2623, 0, 118, 2, 1),
(298, '1', 2626, 0, 118, 2, 1),
(299, '1', 2629, 0, 118, 2, 1),
(300, '1', 2632, 0, 118, 2, 1),
(301, '1', 2635, 0, 118, 2, 1),
(302, '1', 2638, 0, 118, 2, 1),
(303, '1', 2641, 0, 118, 2, 1),
(304, '1', 2643, 0, 118, 2, 1),
(305, '1', 2645, 0, 118, 2, 1),
(306, '1', 2621, 0, 118, 2, 1),
(307, '1', 2624, 0, 118, 2, 1),
(308, '1', 2627, 0, 118, 2, 1),
(309, '1', 2630, 0, 118, 2, 1),
(310, '1', 2633, 0, 118, 2, 1),
(311, '1', 2636, 0, 118, 2, 1),
(312, '1', 2639, 0, 118, 2, 1),
(313, '1', 2646, 0, 118, 2, 1),
(314, '2', 79, 35, 118, 2, 1),
(315, '2', 80, 35, 118, 2, 1),
(316, '2', 81, 35, 118, 2, 1),
(317, '2', 82, 0, 118, 2, 1),
(318, '1', 2507, 0, 117, 3, 1),
(319, '1', 2508, 0, 117, 3, 1),
(320, '1', 2509, 0, 117, 3, 1),
(321, '1', 2510, 0, 117, 3, 1),
(322, '1', 2512, 0, 117, 3, 1),
(323, '1', 2513, 0, 117, 3, 1),
(324, '1', 2515, 0, 117, 3, 1),
(325, '1', 2519, 0, 117, 3, 1),
(326, '1', 2521, 0, 117, 3, 1),
(327, '1', 2522, 0, 117, 3, 1),
(328, '1', 2524, 0, 117, 3, 1),
(329, '1', 2525, 0, 117, 3, 1),
(330, '1', 2527, 0, 117, 3, 1),
(331, '1', 2528, 0, 117, 3, 1),
(332, '1', 2529, 0, 117, 3, 1),
(333, '2', 82, -1, 118, 4, 1),
(334, '2', 81, 5, 118, 4, 1),
(335, '2', 80, 5, 118, 4, 1),
(336, '2', 79, 5, 118, 4, 1),
(337, '1', 2530, 0, 117, 3, 1),
(338, '1', 2531, 0, 117, 3, 1),
(339, '1', 2532, 0, 117, 3, 1),
(340, '1', 2534, 0, 117, 3, 1),
(341, '2', 83, 20, 117, 3, 1),
(342, '2', 84, 20, 117, 3, 1),
(343, '2', 85, 20, 117, 3, 1),
(344, '2', 86, 0, 117, 3, 1),
(345, '2', 86, 1, 117, 4, 1),
(346, '2', 85, 10, 117, 4, 1),
(347, '2', 84, 10, 117, 4, 1),
(348, '2', 83, 10, 117, 4, 1),
(349, '2', 86, 10, 117, 2, 1),
(350, '2', 85, 10, 117, 2, 1),
(351, '2', 84, 10, 117, 2, 1),
(352, '2', 83, 10, 117, 2, 1),
(353, '2', 86, 10, 117, 1, 1),
(354, '2', 85, 10, 117, 1, 1),
(355, '2', 84, 10, 117, 1, 1),
(356, '2', 83, 10, 117, 1, 1),
(357, '1', 2731, 0, 119, 4, 1),
(358, '1', 2734, 0, 119, 4, 1),
(359, '1', 2737, 0, 119, 4, 1),
(360, '1', 2740, 0, 119, 4, 1),
(361, '1', 2743, 0, 119, 4, 1),
(362, '1', 2746, 0, 119, 4, 1),
(363, '1', 2749, 0, 119, 4, 1),
(364, '1', 2752, 0, 119, 4, 1),
(365, '1', 2754, 0, 119, 4, 1),
(366, '1', 2756, 0, 119, 4, 1),
(367, '1', 2732, 0, 119, 4, 1),
(368, '1', 2733, 0, 119, 4, 1),
(369, '2', 87, 50, 119, 4, 1),
(370, '2', 88, 50, 119, 4, 1),
(371, '2', 89, 50, 119, 4, 1),
(372, '1', 2815, 0, 120, 4, 1),
(373, '1', 2818, 0, 120, 4, 1),
(374, '1', 2821, 0, 120, 4, 1),
(375, '1', 2827, 0, 120, 4, 1),
(376, '1', 2830, 0, 120, 4, 1),
(377, '1', 2833, 0, 120, 4, 1),
(378, '1', 2836, 0, 120, 4, 1),
(379, '1', 2838, 0, 120, 4, 1),
(380, '1', 2840, 0, 120, 4, 1),
(381, '1', 2816, 0, 120, 4, 1),
(382, '1', 2820, 0, 120, 4, 1),
(383, '1', 2823, 0, 120, 4, 1),
(384, '1', 2829, 0, 120, 4, 1),
(385, '1', 2831, 0, 120, 4, 1),
(386, '1', 2834, 0, 120, 4, 1),
(387, '1', 2839, 0, 120, 4, 1),
(388, '1', 2842, 0, 120, 4, 1),
(389, '1', 2817, 0, 120, 4, 1),
(390, '1', 2832, 0, 120, 4, 1),
(391, '2', 90, 50, 120, 4, 1),
(392, '2', 91, 50, 120, 4, 1),
(393, '2', 92, 50, 120, 4, 1),
(394, '2', 93, 50, 120, 4, 1),
(395, '2', 82, 0, 118, 3, 1),
(396, '2', 81, 5, 118, 3, 1),
(397, '2', 80, 5, 118, 3, 1),
(398, '2', 79, 5, 118, 3, 1),
(399, '2', 82, 0, 118, 1, 1),
(400, '2', 81, 5, 118, 1, 1),
(401, '2', 80, 5, 118, 1, 1),
(402, '2', 79, 5, 118, 1, 1),
(403, '1', 2927, 0, 121, 4, 1),
(404, '1', 2930, 0, 121, 4, 1),
(405, '1', 2933, 0, 121, 4, 1),
(406, '1', 2936, 0, 121, 4, 1),
(407, '1', 2939, 0, 121, 4, 1),
(408, '1', 2942, 0, 121, 4, 1),
(409, '1', 2945, 0, 121, 4, 1),
(410, '1', 2948, 0, 121, 4, 1),
(411, '1', 2950, 0, 121, 4, 1),
(412, '1', 2952, 0, 121, 4, 1),
(413, '2', 94, 5, 121, 4, 1),
(414, '2', 94, 5, 121, 2, 1),
(415, '1', 3011, 0, 122, 4, 1),
(416, '1', 3014, 0, 122, 4, 1),
(417, '1', 3017, 0, 122, 4, 1),
(418, '1', 3020, 0, 122, 4, 1),
(419, '1', 3023, 0, 122, 4, 1),
(420, '1', 3026, 0, 122, 4, 1),
(421, '1', 3029, 0, 122, 4, 1),
(422, '1', 3032, 0, 122, 4, 1),
(423, '1', 3034, 0, 122, 4, 1),
(424, '1', 3036, 0, 122, 4, 1),
(425, '2', 95, 90, 122, 4, 1),
(426, '2', 95, 10, 122, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_teams`
--

CREATE TABLE IF NOT EXISTS `tbl_teams` (
  `id` int(16) NOT NULL,
  `name` varchar(255) COLLATE utf32_bin NOT NULL,
  `color` varchar(255) COLLATE utf32_bin NOT NULL,
  `current_step` int(16) NOT NULL DEFAULT '1',
  `current_round` int(16) NOT NULL DEFAULT '1',
  `round_status` int(1) DEFAULT '0',
  `region_id` int(16) NOT NULL,
  `game_id` int(16) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf32 COLLATE=utf32_bin;

--
-- Dumping data for table `tbl_teams`
--

INSERT INTO `tbl_teams` (`id`, `name`, `color`, `current_step`, `current_round`, `round_status`, `region_id`, `game_id`) VALUES
(96, 'ic teamn', '24CCFF', 1, 1, 0, 4, 229),
(97, 'ec1', '40FFBF', 6, 1, 2, 2, 229),
(98, 'aaaa', '4DA6FF', 7, 1, 2, 4, 230),
(99, 'bbbbb', '42FFAD', 7, 1, 2, 2, 230),
(100, 'dsds123', 'BF5EFF', 1, 1, 2, 2, 230),
(101, 'ssss', 'FF7575', 1, 1, 2, 4, 230),
(102, 'dasdasd', 'FF474E', 2, 1, 2, 4, 230),
(103, 'team 1', 'FFA41C', 5, 1, 1, 4, 234),
(126, 'team test', 'FF4F19', 1, 0, 0, 4, 246),
(127, 'ssss', 'F0FF1C', 1, 4, 0, 4, 247);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_team_action_records`
--

CREATE TABLE IF NOT EXISTS `tbl_team_action_records` (
  `id` int(16) NOT NULL,
  `key` varchar(16) COLLATE utf8_bin NOT NULL,
  `value` varchar(100) COLLATE utf8_bin NOT NULL,
  `game_id` int(16) NOT NULL COMMENT 'fk',
  `round_id` int(16) NOT NULL,
  `team_id` int(16) NOT NULL COMMENT 'fk',
  `region_id` int(16) DEFAULT NULL COMMENT 'fk',
  `product_id` int(16) DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  `created_date` datetime DEFAULT NULL,
  `new_value` int(16) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=427 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_team_action_records`
--

INSERT INTO `tbl_team_action_records` (`id`, `key`, `value`, `game_id`, `round_id`, `team_id`, `region_id`, `product_id`, `description`, `created_date`, `new_value`) VALUES
(55, '1', '-900', 220, 1, 71, 0, NULL, 'Payment for purchasing component.', '2015-10-01 00:00:00', NULL),
(54, '5', '-1', 220, 1, 71, 0, 19, 'Manufacture products', '2015-10-01 00:00:00', NULL),
(53, '5', '-1', 220, 1, 71, 0, 19, 'Manufacture products', '2015-10-01 00:00:00', NULL),
(52, '1', '--3000', 220, 1, 71, 0, NULL, 'Paymnent for product transport.', '2015-09-30 00:00:00', NULL),
(50, '1', '--3000', 220, 1, 71, 0, NULL, 'Paymnent for product transport.', '2015-09-30 00:00:00', NULL),
(51, '1', '--3000', 220, 1, 71, 0, NULL, 'Paymnent for product transport.', '2015-09-30 00:00:00', NULL),
(49, '1', '--3000', 220, 1, 71, 0, NULL, 'Paymnent for product transport.', '2015-09-30 00:00:00', NULL),
(47, '1', '-3000', 220, 1, 71, 0, NULL, 'Paymnent for product transport.', '2015-09-30 00:00:00', NULL),
(48, '1', '-0', 220, 1, 71, 0, NULL, 'Paymnent for product transport.', '2015-09-30 00:00:00', NULL),
(46, '1', '-3000', 220, 1, 71, 0, NULL, 'Paymnent for product transport.', '2015-09-30 00:00:00', NULL),
(45, '1', '-8000', 220, 1, 71, 0, NULL, 'Paymnent for product transport.', '2015-09-30 00:00:00', NULL),
(44, '1', '-150', 220, 1, 71, 0, NULL, 'Payment for purchasing component.', '2015-09-30 00:00:00', NULL),
(43, '1', '-60', 220, 1, 71, 0, NULL, 'Payment for purchasing component.', '2015-09-30 00:00:00', NULL),
(42, '1', '-1060', 220, 1, 71, 0, NULL, 'Paymnent for manufacturing product.', '2015-09-30 00:00:00', NULL),
(41, '5', '2', 220, 1, 71, 4, 19, 'Manufacture products.', '2015-09-30 00:00:00', NULL),
(40, '1', '-530', 220, 1, 71, 0, NULL, 'Paymnent for manufacturing product.', '2015-09-30 00:00:00', NULL),
(39, '5', '1', 220, 1, 71, 4, 19, 'Manufacture products.', '2015-09-30 00:00:00', NULL),
(38, '1', '-530', 220, 1, 71, 0, NULL, 'Paymnent for manufacturing product.', '2015-09-30 00:00:00', NULL),
(37, '5', '1', 220, 1, 71, 4, 19, 'Manufacture products.', '2015-09-30 00:00:00', NULL),
(36, '1', '-1060', 220, 1, 71, 0, NULL, 'Paymnent for manufacturing product.', '2015-09-30 00:00:00', NULL),
(35, '5', '2', 220, 1, 71, 4, 19, 'Manufacture products.', '2015-09-30 00:00:00', NULL),
(34, '1', '-530', 220, 1, 71, 0, NULL, 'Paymnent for manufacturing product.', '2015-09-30 00:00:00', NULL),
(33, '5', '1', 220, 1, 71, 4, 19, 'Manufacture products.', '2015-09-30 00:00:00', NULL),
(56, '5', '-1', 220, 1, 71, 0, 19, 'Manufacture products', '2015-10-01 00:00:00', NULL),
(57, '5', '-1', 220, 1, 71, 0, 19, 'Manufacture products', '2015-10-01 00:00:00', NULL),
(58, '1', '--53000', 220, 1, 71, 0, 0, 'Paymnent for manufacturing product', '2015-10-01 00:00:00', NULL),
(59, '1', '-30', 220, 1, 71, 0, NULL, 'Payment for purchasing component.', '2015-10-01 00:00:00', NULL),
(60, '1', '-60', 220, 1, 71, 0, NULL, 'Payment for purchasing component.', '2015-10-01 00:00:00', NULL),
(61, '1', '-980', 220, 1, 71, 0, NULL, 'Payment for purchasing component.', '2015-10-01 00:00:00', NULL),
(62, '1', '--3000', 220, 1, 71, 0, 0, 'Paymnent for product transport.', '2015-10-01 00:00:00', NULL),
(63, '1', '--3000', 220, 1, 71, 0, 0, 'Paymnent for product transport.', '2015-10-01 00:00:00', NULL),
(64, '1', '--9', 220, 1, 71, 0, 0, 'Paymnent for product transport.', '2015-10-01 00:00:00', NULL),
(65, '1', '--9000', 220, 1, 71, 0, 0, 'Paymnent for product transport.', '2015-10-01 00:00:00', NULL),
(66, '1', '-4830', 223, 1, 73, 0, NULL, 'Paymnent for developing new product.', '2015-10-01 00:00:00', NULL),
(67, '1', '-5785', 223, 1, 73, 0, NULL, 'Paymnent for developing new product.', '2015-10-01 00:00:00', NULL),
(68, '1', '-5035', 223, 1, 73, 0, NULL, 'Paymnent for developing new product.', '2015-10-01 00:00:00', NULL),
(69, '1', '-5255', 223, 1, 73, 0, NULL, 'Paymnent for developing new product.', '2015-10-01 00:00:00', 90206),
(70, '1', '-4785', 223, 1, 73, 0, NULL, 'Paymnent for developing new product.', '2015-10-01 00:00:00', 85421),
(71, '1', '-4810', 223, 1, 73, 0, NULL, 'Paymnent for developing new product.', '2015-10-01 00:00:00', 70921),
(72, '1', '-5900', 223, 1, 73, 0, NULL, 'Paymnent for developing new product.', '2015-10-01 00:00:00', 65021),
(73, '1', '-300', 223, 1, 73, 0, NULL, 'Payment for purchasing component.', '2015-10-01 00:00:00', NULL),
(74, '1', '-3000', 223, 1, 73, 0, NULL, 'Payment for purchasing component.', '2015-10-01 00:00:00', NULL),
(75, '1', '-21000', 223, 1, 73, 0, NULL, 'Payment for purchasing component.', '2015-10-01 00:00:00', 40721),
(76, '1', '-21000', 223, 1, 73, 0, NULL, 'Payment for purchasing component.', '2015-10-01 00:00:00', 19721),
(77, '1', '-4765', 223, 1, 73, 0, NULL, 'Paymnent for developing new product.', '2015-10-01 00:00:00', 14956),
(78, '1', '-6125', 223, 1, 73, 0, NULL, 'Payment for purchasing component.', '2015-10-01 00:00:00', 8831),
(79, '5', '-1', 223, 1, 73, 0, 30, 'Manufacture products', '2015-10-01 00:00:00', NULL),
(80, '1', '--562', 223, 1, 73, 0, 0, 'Paymnent for manufacturing product.', '2015-10-01 00:00:00', NULL),
(81, '5', '-2', 223, 1, 73, 0, 30, 'Manufacture products', '2015-10-01 00:00:00', NULL),
(82, '1', '--1123', 223, 1, 73, 0, 0, 'Paymnent for manufacturing product.', '2015-10-01 00:00:00', NULL),
(83, '5', '3', 223, 1, 73, 0, 30, 'Manufacture products', '2015-10-01 00:00:00', NULL),
(84, '1', '-1685', 223, 1, 73, 0, 0, 'Paymnent for manufacturing product.', '2015-10-01 00:00:00', NULL),
(85, '5', '2', 223, 1, 73, 0, 30, 'Manufacture products', '2015-10-01 00:00:00', NULL),
(86, '1', '-1123', 223, 1, 73, 0, 0, 'Paymnent for manufacturing product.', '2015-10-01 00:00:00', NULL),
(87, '5', '2', 223, 1, 73, 0, 30, 'Manufacture products', '2015-10-01 00:00:00', NULL),
(88, '1', '-1123', 223, 1, 73, 0, 0, 'Paymnent for manufacturing product.', '2015-10-01 00:00:00', NULL),
(89, '5', '1', 223, 1, 73, 0, 30, 'Manufacture products', '2015-10-01 00:00:00', NULL),
(90, '1', '-562', 223, 1, 73, 0, 0, 'Paymnent for manufacturing product.', '2015-10-01 00:00:00', NULL),
(91, '5', '1', 223, 1, 73, 0, 30, 'Manufacture products', '2015-10-01 00:00:00', NULL),
(92, '1', '-562', 223, 1, 73, 0, 0, 'Paymnent for manufacturing product.', '2015-10-01 00:00:00', NULL),
(93, '5', '2', 223, 1, 73, 0, 30, 'Manufacture products', '2015-10-01 00:00:00', NULL),
(94, '1', '-1123', 223, 1, 73, 0, 0, 'Paymnent for manufacturing product.', '2015-10-01 00:00:00', NULL),
(95, '1', '-200', 223, 1, 73, 0, 0, 'Paymnent for product transport.', '2015-10-01 00:00:00', NULL),
(96, '1', '-300', 223, 1, 73, 0, 0, 'Paymnent for product transport.', '2015-10-01 00:00:00', NULL),
(97, '1', '-400', 223, 1, 73, 0, 0, 'Paymnent for product transport.', '2015-10-01 00:00:00', NULL),
(98, '1', '0', 223, 1, 73, 0, 0, 'Paymnent for product transport.', '2015-10-01 00:00:00', NULL),
(99, '1', '0', 223, 1, 73, 0, 0, 'Paymnent for product transport.', '2015-10-01 00:00:00', NULL),
(100, '1', '0', 223, 1, 73, 0, 0, 'Paymnent for product transport.', '2015-10-01 00:00:00', NULL),
(101, '1', '0', 223, 1, 73, 0, 0, 'Paymnent for product transport.', '2015-10-01 00:00:00', NULL),
(102, '1', '-5370', 223, 1, 77, 0, NULL, 'Paymnent for developing new product.', '2015-10-02 00:00:00', 5741),
(103, '1', '-5610', 223, 1, 77, 0, NULL, 'Paymnent for developing new product.', '2015-10-03 00:00:00', 131),
(104, '1', '-5565', 222, 1, 78, 0, NULL, 'Paymnent for developing new product.', '2015-10-04 00:00:00', 1105546),
(105, '1', '-5305', 222, 1, 78, 0, NULL, 'Paymnent for developing new product.', '2015-10-05 00:00:00', 1100241),
(106, '1', '-4960', 229, 1, 97, 0, NULL, 'Paymnent for developing new product.', '2015-10-07 00:00:00', 19995040),
(107, '1', '-1375', 229, 1, 97, 0, NULL, 'Payment for purchasing component.', '2015-10-07 00:00:00', 19993665),
(108, '1', '-4935', 230, 1, 98, 0, NULL, 'Paymnent for developing new product.', '2015-10-07 00:00:00', 19995065),
(109, '1', '-12250', 230, 1, 98, 0, NULL, 'Payment for purchasing component.', '2015-10-07 00:00:00', 19982815),
(110, '5', '10', 230, 1, 98, 0, 35, 'Manufacture products', '2015-10-07 00:00:00', 0),
(111, '1', '-23793', 230, 1, 98, 0, 0, 'Paymnent for manufacturing product.', '2015-10-07 00:00:00', 0),
(112, '1', '-20', 230, 1, 98, 0, 0, 'Paymnent for product transport.', '2015-10-07 00:00:00', 0),
(113, '1', '-20', 230, 1, 98, 0, 0, 'Paymnent for product transport.', '2015-10-07 00:00:00', 0),
(114, '1', '-20', 230, 1, 98, 0, 0, 'Paymnent for product transport.', '2015-10-07 00:00:00', 0),
(115, '1', '-5160', 230, 1, 99, 0, NULL, 'Paymnent for developing new product.', '2015-10-07 00:00:00', 19994840),
(116, '1', '-12250', 230, 1, 99, 0, NULL, 'Payment for purchasing component.', '2015-10-07 00:00:00', 19982590),
(117, '5', '10', 230, 1, 99, 0, 36, 'Manufacture products', '2015-10-07 00:00:00', 0),
(118, '1', '-23793', 230, 1, 99, 0, 0, 'Paymnent for manufacturing product.', '2015-10-07 00:00:00', 0),
(119, '1', '-1', 230, 1, 99, 0, 0, 'Paymnent for product transport.', '2015-10-07 00:00:00', 0),
(120, '1', '-40', 230, 1, 99, 0, 0, 'Paymnent for product transport.', '2015-10-07 00:00:00', 0),
(121, '1', '-40', 230, 1, 99, 0, 0, 'Paymnent for product transport.', '2015-10-07 00:00:00', 0),
(122, '1', '-5300', 230, 1, 102, 0, NULL, 'Paymnent for developing new product.', '2015-10-07 00:00:00', 19994700),
(123, '1', '-2645', 234, 1, 103, 0, NULL, 'Paymnent for developing new product.', '2015-10-13 00:00:00', 19997355),
(124, '1', '-133500', 234, 1, 103, 0, NULL, 'Payment for purchasing component.', '2015-10-13 00:00:00', 19863855),
(125, '5', '1000', 234, 1, 103, 0, 38, 'Manufacture products', '2015-10-13 00:00:00', 0),
(126, '1', '-6276400', 234, 1, 103, 0, 0, 'Paymnent for manufacturing product.', '2015-10-13 00:00:00', 0),
(127, '1', '-6465', 237, 1, 106, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 1493535),
(128, '1', '-4155', 237, 1, 107, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 845845),
(129, '1', '-4055', 237, 1, 104, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 995945),
(130, '1', '-4535', 237, 1, 107, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 841310),
(131, '1', '-4315', 237, 1, 104, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 991630),
(132, '1', '-4305', 237, 1, 104, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 987325),
(133, '1', '-4055', 237, 1, 105, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 795945),
(134, '1', '-4315', 237, 1, 108, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 1495685),
(135, '1', '-4475', 237, 1, 108, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 1491210),
(136, '1', '-4405', 237, 1, 108, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 1486805),
(137, '1', '-6950', 237, 1, 104, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 980375),
(138, '1', '-7330', 237, 1, 108, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 1479475),
(139, '1', '-3000', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1476475),
(140, '1', '-4055', 237, 1, 110, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 795945),
(141, '1', '-2500', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1473975),
(142, '1', '-3750', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1470225),
(143, '1', '-2000', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1468225),
(144, '1', '-20000', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1448225),
(145, '1', '-30000', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1418225),
(146, '1', '-60000', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1358225),
(147, '1', '-20000', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1338225),
(148, '1', '-30000', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1308225),
(149, '1', '-1000', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1307225),
(150, '1', '-15500', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1291725),
(151, '1', '-3000', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1288725),
(152, '1', '-11500', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1277225),
(153, '1', '-15000', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1262225),
(154, '1', '-10000', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1252225),
(155, '1', '-10500', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1241725),
(156, '1', '-8500', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1233225),
(157, '1', '-30000', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1203225),
(158, '1', '-4510', 237, 1, 110, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 791435),
(159, '1', '-50000', 237, 1, 108, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1153225),
(160, '5', '50', 237, 1, 108, 0, 46, 'Manufacture products', '2015-10-15 00:00:00', 0),
(161, '1', '-29000', 237, 1, 108, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(162, '5', '50', 237, 1, 108, 0, 47, 'Manufacture products', '2015-10-15 00:00:00', 0),
(163, '1', '-29000', 237, 1, 108, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(164, '5', '50', 237, 1, 108, 0, 48, 'Manufacture products', '2015-10-15 00:00:00', 0),
(165, '1', '-29000', 237, 1, 108, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(166, '5', '50', 237, 1, 108, 0, 50, 'Manufacture products', '2015-10-15 00:00:00', 0),
(167, '1', '-29000', 237, 1, 108, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(168, '1', '-4055', 237, 1, 111, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 995945),
(169, '1', '-4315', 237, 1, 111, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 991630),
(170, '1', '-4305', 237, 1, 111, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 987325),
(171, '1', '-4555', 237, 1, 110, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 786880),
(172, '1', '-5300', 237, 1, 110, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 781580),
(173, '1', '-116000', 237, 1, 110, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 665580),
(174, '1', '-83500', 237, 1, 110, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 582080),
(175, '1', '-21500', 237, 1, 110, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 560580),
(176, '5', '50', 237, 1, 110, 0, 51, 'Manufacture products', '2015-10-15 00:00:00', 0),
(177, '1', '-34000', 237, 1, 110, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(178, '5', '', 237, 1, 110, 0, 52, 'Manufacture products', '2015-10-15 00:00:00', 0),
(179, '1', '-', 237, 1, 110, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(180, '5', '', 237, 1, 110, 0, 56, 'Manufacture products', '2015-10-15 00:00:00', 0),
(181, '1', '-', 237, 1, 110, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(182, '5', '50', 237, 1, 110, 0, 57, 'Manufacture products', '2015-10-15 00:00:00', 0),
(183, '1', '-34000', 237, 1, 110, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(184, '5', '50', 237, 1, 110, 0, 56, 'Manufacture products', '2015-10-15 00:00:00', 0),
(185, '1', '-34000', 237, 1, 110, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(186, '5', '50', 237, 1, 110, 0, 52, 'Manufacture products', '2015-10-15 00:00:00', 0),
(187, '1', '-34000', 237, 1, 110, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(188, '1', '-6950', 237, 1, 111, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 980375),
(189, '1', '-4055', 238, 1, 112, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 995945),
(190, '1', '-4315', 238, 1, 114, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 1495685),
(191, '1', '-4475', 238, 1, 114, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 1491210),
(192, '1', '-4055', 238, 1, 113, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 795945),
(193, '1', '-4315', 238, 1, 112, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 991630),
(194, '1', '-4405', 238, 1, 114, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 1486805),
(195, '1', '-7330', 238, 1, 114, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 1479475),
(196, '1', '-4830', 238, 1, 112, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 986800),
(197, '1', '-3000', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1476475),
(198, '1', '-4785', 238, 1, 112, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 982015),
(199, '1', '-2500', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1473975),
(200, '1', '-3750', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1470225),
(201, '1', '-4510', 238, 1, 113, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 791435),
(202, '1', '-2000', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1468225),
(203, '1', '-20000', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1448225),
(204, '1', '-30000', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1418225),
(205, '1', '-60000', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1358225),
(206, '1', '-20000', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1338225),
(207, '1', '-30000', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1308225),
(208, '1', '-1000', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1307225),
(209, '1', '-15500', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1291725),
(210, '1', '-3000', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1288725),
(211, '1', '-11500', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1277225),
(212, '1', '-15000', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1262225),
(213, '1', '-10000', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1252225),
(214, '1', '-10500', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1241725),
(215, '1', '-8500', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1233225),
(216, '1', '-0', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1233225),
(217, '1', '-30000', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1203225),
(218, '1', '-50000', 238, 1, 114, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1153225),
(219, '1', '-4555', 238, 1, 113, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 786880),
(220, '1', '-4055', 238, 1, 116, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 995945),
(221, '1', '-5300', 238, 1, 113, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 781580),
(222, '1', '-4155', 238, 1, 115, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 845845),
(223, '1', '-4315', 238, 1, 116, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 991630),
(224, '1', '-4535', 238, 1, 115, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 841310),
(225, '1', '-4455', 238, 1, 115, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 836855),
(226, '1', '-4305', 238, 1, 116, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 987325),
(227, '1', '-6950', 238, 1, 115, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 829905),
(228, '1', '-6950', 238, 1, 116, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 980375),
(229, '1', '-3000', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 826905),
(230, '1', '-3750', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 823155),
(231, '1', '-4000', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 819155),
(232, '1', '-20000', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 799155),
(233, '1', '-116000', 238, 1, 113, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 665580),
(234, '1', '-20000', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 779155),
(235, '1', '-60000', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 719155),
(236, '1', '-20000', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 699155),
(237, '1', '-30000', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 669155),
(238, '1', '-1000', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 668155),
(239, '1', '-2250', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 665905),
(240, '1', '-7750', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 658155),
(241, '1', '-83500', 238, 1, 113, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 582080),
(242, '1', '-9000', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 649155),
(243, '1', '-5000', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 644155),
(244, '1', '-20000', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 624155),
(245, '1', '-25250', 238, 1, 113, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 556830),
(246, '1', '-10500', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 613655),
(247, '1', '-8500', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 605155),
(248, '1', '-30000', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 575155),
(249, '1', '-50000', 238, 1, 115, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 525155),
(250, '5', '50', 238, 1, 115, 0, 77, 'Manufacture products', '2015-10-15 00:00:00', 0),
(251, '1', '-26000', 238, 1, 115, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(252, '5', '50', 238, 1, 115, 0, 75, 'Manufacture products', '2015-10-15 00:00:00', 0),
(253, '1', '-26000', 238, 1, 115, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(254, '5', '50', 238, 1, 115, 0, 74, 'Manufacture products', '2015-10-15 00:00:00', 0),
(255, '1', '-26000', 238, 1, 115, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(256, '5', '50', 238, 1, 115, 0, 72, 'Manufacture products', '2015-10-15 00:00:00', 0),
(257, '1', '-26000', 238, 1, 115, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(258, '1', '-91500', 238, 1, 116, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 888875),
(259, '1', '-178250', 238, 1, 116, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 710625),
(260, '1', '-11500', 238, 1, 116, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 699125),
(261, '1', '-4055', 238, 1, 118, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 795945),
(262, '5', '50', 238, 1, 116, 0, 70, 'Manufacture products', '2015-10-15 00:00:00', 0),
(263, '1', '-50000', 238, 1, 116, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(264, '5', '50', 238, 1, 116, 0, 73, 'Manufacture products', '2015-10-15 00:00:00', 0),
(265, '1', '-50000', 238, 1, 116, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(266, '5', '50', 238, 1, 116, 0, 76, 'Manufacture products', '2015-10-15 00:00:00', 0),
(267, '1', '-50000', 238, 1, 116, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(268, '5', '50', 238, 1, 116, 0, 78, 'Manufacture products', '2015-10-15 00:00:00', 0),
(269, '1', '-50000', 238, 1, 116, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(270, '1', '-4510', 238, 1, 118, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 791435),
(271, '1', '-4555', 238, 1, 118, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 786880),
(272, '1', '-1000', 238, 1, 116, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 498125),
(273, '1', '-1000', 238, 1, 115, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 420155),
(274, '1', '-1000', 238, 1, 115, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 419155),
(275, '1', '-1000', 238, 1, 115, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 418155),
(276, '1', '-1000', 238, 1, 115, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 417155),
(277, '1', '-1000', 238, 1, 115, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 416155),
(278, '1', '-1000', 238, 1, 115, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 415155),
(279, '1', '-5300', 238, 1, 118, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 781580),
(280, '1', '-2000', 238, 1, 115, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 413155),
(281, '1', '-2000', 238, 1, 115, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 411155),
(282, '1', '-4000', 238, 1, 116, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 494125),
(283, '1', '-2000', 238, 1, 115, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 409155),
(284, '1', '-4000', 238, 1, 116, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 490125),
(285, '1', '-3000', 238, 1, 116, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 487125),
(286, '1', '-116000', 238, 1, 118, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 665580),
(287, '1', '-83500', 238, 1, 118, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 582080),
(288, '1', '-21500', 238, 1, 118, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 560580),
(289, '1', '-4315', 238, 1, 117, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 1495685),
(290, '5', '50', 238, 1, 118, 0, 79, 'Manufacture products', '2015-10-15 00:00:00', 0),
(291, '1', '-34000', 238, 1, 118, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(292, '5', '50', 238, 1, 118, 0, 80, 'Manufacture products', '2015-10-15 00:00:00', 0),
(293, '1', '-34000', 238, 1, 118, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(294, '5', '50', 238, 1, 118, 0, 81, 'Manufacture products', '2015-10-15 00:00:00', 0),
(295, '1', '-34000', 238, 1, 118, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(296, '1', '-4475', 238, 1, 117, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 1491210),
(297, '5', '50', 238, 1, 118, 0, 82, 'Manufacture products', '2015-10-15 00:00:00', 0),
(298, '1', '-34000', 238, 1, 118, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(299, '1', '-4405', 238, 1, 117, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 1486805),
(300, '1', '-7330', 238, 1, 117, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 1479475),
(301, '1', '-3000', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1476475),
(302, '1', '-2500', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1473975),
(303, '1', '-3750', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1470225),
(304, '1', '-2000', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1468225),
(305, '1', '-20000', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1448225),
(306, '1', '-30000', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1418225),
(307, '1', '-60000', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1358225),
(308, '1', '-20000', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1338225),
(309, '1', '-30000', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1308225),
(310, '1', '-1000', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1307225),
(311, '1', '-15500', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1291725),
(312, '1', '-3000', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1288725),
(313, '1', '-11500', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1277225),
(314, '1', '-15000', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1262225),
(315, '1', '-10000', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1252225),
(316, '1', '-2000', 238, 1, 118, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 422580),
(317, '1', '-10500', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1241725),
(318, '1', '-8500', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1233225),
(319, '1', '-30000', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1203225),
(320, '1', '-50000', 238, 1, 117, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 1153225),
(321, '5', '50', 238, 1, 117, 0, 83, 'Manufacture products', '2015-10-15 00:00:00', 0),
(322, '1', '-29000', 238, 1, 117, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(323, '5', '50', 238, 1, 117, 0, 84, 'Manufacture products', '2015-10-15 00:00:00', 0),
(324, '1', '-29000', 238, 1, 117, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(325, '5', '50', 238, 1, 117, 0, 85, 'Manufacture products', '2015-10-15 00:00:00', 0),
(326, '1', '-29000', 238, 1, 117, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(327, '5', '50', 238, 1, 117, 0, 86, 'Manufacture products', '2015-10-15 00:00:00', 0),
(328, '1', '-29000', 238, 1, 117, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(329, '1', '-4000', 238, 1, 117, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 1033225),
(330, '1', '-4000', 238, 1, 117, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 1029225),
(331, '1', '-4000', 238, 1, 117, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 1025225),
(332, '1', '-4785', 239, 1, 119, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 995215),
(333, '1', '-4805', 239, 1, 119, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 990410),
(334, '1', '-4830', 239, 1, 119, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 985580),
(335, '1', '-185250', 239, 1, 119, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 800330),
(336, '1', '-2500', 239, 1, 119, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 797830),
(337, '1', '-3750', 239, 1, 119, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 794080),
(338, '5', '50', 239, 1, 119, 0, 87, 'Manufacture products', '2015-10-15 00:00:00', 0),
(339, '1', '-53000', 239, 1, 119, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(340, '5', '50', 239, 1, 119, 0, 88, 'Manufacture products', '2015-10-15 00:00:00', 0),
(341, '1', '-53000', 239, 1, 119, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(342, '5', '50', 239, 1, 119, 0, 89, 'Manufacture products', '2015-10-15 00:00:00', 0),
(343, '1', '-53000', 239, 1, 119, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(344, '1', '-4055', 240, 1, 120, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 995945),
(345, '1', '-4315', 240, 1, 120, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 991630),
(346, '1', '-4305', 240, 1, 120, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 987325),
(347, '1', '-6950', 240, 1, 120, 0, NULL, 'Paymnent for developing new product.', '2015-10-15 00:00:00', 980375),
(348, '1', '-91500', 240, 1, 120, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 888875),
(349, '1', '-178250', 240, 1, 120, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 710625),
(350, '1', '-11500', 240, 1, 120, 0, NULL, 'Payment for purchasing component.', '2015-10-15 00:00:00', 699125),
(351, '5', '50', 240, 1, 120, 0, 90, 'Manufacture products', '2015-10-15 00:00:00', 0),
(352, '1', '-50000', 240, 1, 120, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(353, '5', '50', 240, 1, 120, 0, 91, 'Manufacture products', '2015-10-15 00:00:00', 0),
(354, '1', '-50000', 240, 1, 120, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(355, '5', '50', 240, 1, 120, 0, 92, 'Manufacture products', '2015-10-15 00:00:00', 0),
(356, '1', '-50000', 240, 1, 120, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(357, '5', '50', 240, 1, 120, 0, 93, 'Manufacture products', '2015-10-15 00:00:00', 0),
(358, '1', '-50000', 240, 1, 120, 0, 0, 'Paymnent for manufacturing product.', '2015-10-15 00:00:00', 0),
(359, '1', '-2000', 238, 1, 118, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 420580),
(360, '1', '-2000', 238, 1, 118, 0, 0, 'Paymnent for product transport.', '2015-10-15 00:00:00', 418580),
(361, '1', '40000', 238, 1, 116, 0, 78, 'Add money for sale of Product14', '2015-10-15 00:00:00', 527125),
(362, '1', '0', 238, 1, 117, 0, 86, 'Add money for sale of 34', '2015-10-15 00:00:00', 1025225),
(363, '1', '12500', 238, 1, 118, 0, 82, 'Add money for sale of 24', '2015-10-15 00:00:00', 431080),
(364, '1', '20000', 238, 1, 115, 0, 77, 'Add money for sale of 44', '2015-10-15 00:00:00', 429155),
(365, '1', '40000', 238, 1, 116, 0, 78, 'Add money for sale of Product14', '2015-10-15 00:00:00', 567125),
(366, '1', '0', 238, 1, 118, 0, 82, 'Add money for sale of 24', '2015-10-15 00:00:00', 431080),
(367, '1', '40000', 238, 1, 115, 0, 77, 'Add money for sale of 44', '2015-10-15 00:00:00', 469155),
(368, '1', '40000', 238, 1, 116, 0, 78, 'Add money for sale of Product14', '2015-10-15 00:00:00', 607125),
(369, '1', '0', 238, 1, 118, 0, 82, 'Add money for sale of 24', '2015-10-15 00:00:00', 431080),
(370, '1', '60000', 238, 1, 115, 0, 77, 'Add money for sale of 44', '2015-10-15 00:00:00', 529155),
(371, '1', '12500', 238, 1, 117, 0, 86, 'Add money for sale of 34', '2015-10-15 00:00:00', 1037725),
(372, '1', '2500', 238, 1, 118, 0, 82, 'Add money for sale of 24', '2015-10-15 00:00:00', 433580),
(373, '1', '87500', 238, 1, 118, 0, 82, 'Add money for sale of 24', '2015-10-15 00:00:00', 521080),
(374, '1', '12500', 238, 1, 118, 0, 82, 'Add money for sale of 24', '2015-10-15 00:00:00', 533580),
(375, '1', '10000', 238, 1, 117, 0, 86, 'Add money for sale of 34', '2015-10-15 00:00:00', 1047725),
(376, '1', '40000', 238, 1, 116, 0, 78, 'Add money for sale of Product14', '2015-10-15 00:00:00', 647125),
(377, '1', '0', 238, 1, 118, 0, 82, 'Add money for sale of 24', '2015-10-15 00:00:00', 533580),
(378, '1', '20000', 238, 1, 115, 0, 77, 'Add money for sale of 44', '2015-10-15 00:00:00', 549155),
(379, '1', '50000', 238, 1, 116, 0, 78, 'Add money for sale of Product14', '2015-10-15 00:00:00', 697125),
(380, '1', '0', 238, 1, 118, 0, 82, 'Add money for sale of 24', '2015-10-15 00:00:00', 533580),
(381, '1', '25000', 238, 1, 115, 0, 77, 'Add money for sale of 44', '2015-10-15 00:00:00', 574155),
(382, '1', '130000', 238, 1, 117, 0, 86, 'Add money for sale of 34', '2015-10-15 00:00:00', 1177725),
(383, '1', '0', 238, 1, 116, 0, 78, 'Add money for sale of Product14', '2015-10-15 00:00:00', 697125),
(384, '1', '0', 238, 1, 118, 0, 82, 'Add money for sale of 24', '2015-10-15 00:00:00', 533580),
(385, '1', '0', 238, 1, 115, 0, 77, 'Add money for sale of 44', '2015-10-15 00:00:00', 574155),
(386, '1', '0', 238, 1, 116, 0, 78, 'Add money for sale of Product14', '2015-10-15 00:00:00', 697125),
(387, '1', '15000', 238, 1, 118, 0, 82, 'Add money for sale of 24', '2015-10-15 00:00:00', 548580),
(388, '1', '20000', 238, 1, 115, 0, 77, 'Add money for sale of 44', '2015-10-15 00:00:00', 594155),
(389, '1', '10', 238, 1, 117, 0, 0, 'Improvement modification of round 1 from Game Master', '2015-10-15 00:00:00', 1177735),
(390, '2', '100', 238, 1, 116, 0, 0, '', '2015-10-15 00:00:00', 200),
(391, '3', '100', 238, 1, 116, 0, 0, '', '2015-10-15 00:00:00', 200),
(392, '4', '100', 238, 1, 116, 0, 0, '', '2015-10-15 00:00:00', 200),
(393, '1', '-500000', 238, 1, 116, 0, 0, '', '2015-10-15 00:00:00', 197125),
(394, '2', '-50', 238, 1, 116, 0, 0, '', '2015-10-15 00:00:00', 150),
(395, '1', '-500000', 238, 1, 118, 0, 0, '', '2015-10-15 00:00:00', 48580),
(396, '2', '-90', 238, 1, 118, 0, 0, '', '2015-10-15 00:00:00', -10),
(397, '3', '20', 238, 1, 118, 0, 0, '', '2015-10-15 00:00:00', 100),
(398, '4', '20', 238, 1, 118, 0, 0, '', '2015-10-15 00:00:00', 100),
(399, '1', '-4785', 241, 1, 121, 0, NULL, 'Paymnent for developing new product.', '2015-10-21 00:00:00', 19995215),
(400, '1', '-8500', 241, 1, 121, 0, NULL, 'Payment for purchasing component.', '2015-10-21 00:00:00', 19986715),
(401, '1', '-4050', 241, 1, 121, 0, NULL, 'Payment for purchasing component.', '2015-10-21 00:00:00', 19982665),
(402, '5', '10', 241, 1, 121, 0, 94, 'Manufacture products', '2015-10-21 00:00:00', 0),
(403, '1', '-10600', 241, 1, 121, 0, 0, 'Paymnent for manufacturing product.', '2015-10-21 00:00:00', 0),
(404, '1', '-500', 241, 1, 121, 0, 0, 'Paymnent for product transport.', '2015-10-21 00:00:00', 19971565),
(405, '1', '-4785', 242, 1, 122, 0, NULL, 'Paymnent for developing new product.', '2015-10-21 00:00:00', 19995215),
(406, '1', '-125500', 242, 1, 122, 0, NULL, 'Payment for purchasing component.', '2015-10-21 00:00:00', 19869715),
(407, '5', '100', 242, 1, 122, 0, 95, 'Manufacture products', '2015-10-21 00:00:00', 0),
(408, '1', '-106000', 242, 1, 122, 0, 0, 'Paymnent for manufacturing product.', '2015-10-21 00:00:00', 0),
(409, '1', '-1000', 242, 1, 122, 0, 0, 'Paymnent for product transport.', '2015-10-21 00:00:00', 19762715),
(410, '1', '-5205', 242, 2, 122, 0, NULL, 'Paymnent for developing new product.', '2015-10-21 00:00:00', 19757510),
(411, '1', '1000', 242, 3, 122, 0, 0, 'âsas', '2015-10-21 00:00:00', 1000),
(412, '3', '10', 242, 3, 122, 0, 0, 'âsas', '2015-10-21 00:00:00', 10),
(413, '1', '1000', 242, 3, 122, 0, 0, 'âsas', '2015-10-21 00:00:00', 19758510),
(414, '3', '10', 242, 3, 122, 0, 0, 'âsas', '2015-10-21 00:00:00', 60),
(415, '1', '1000', 243, 2, 124, 0, 0, '', '2015-10-21 00:00:00', 20001000),
(416, '3', '10', 243, 2, 124, 0, 0, '', '2015-10-21 00:00:00', 60),
(417, '3', '10', 243, 3, 124, 0, 0, '', '2015-10-21 00:00:00', 60),
(418, '3', '10', 243, 3, 124, 0, 0, '', '2015-10-21 00:00:00', 70),
(419, '1', '1000', 243, 3, 124, 0, 0, '', '2015-10-21 00:00:00', 20002000),
(420, '3', '10', 243, 3, 124, 0, 0, '', '2015-10-21 00:00:00', 110),
(421, '1', '1000', 243, 3, 124, 0, 0, '', '2015-10-21 00:00:00', 20003000),
(422, '3', '10', 243, 3, 124, 0, 0, '', '2015-10-21 00:00:00', 120),
(423, '1', '1000', 243, 3, 124, 0, 0, '', '2015-10-21 00:00:00', 20004000),
(424, '3', '10', 243, 3, 124, 0, 0, '', '2015-10-21 00:00:00', 130),
(425, '1', '1000000', 245, 1, 125, 0, 0, '', '2015-10-21 00:00:00', 21000000),
(426, '3', '10', 245, 1, 125, 0, 0, '', '2015-10-21 00:00:00', 60);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_team_factors`
--

CREATE TABLE IF NOT EXISTS `tbl_team_factors` (
  `id` int(16) NOT NULL,
  `round_id` int(16) NOT NULL COMMENT 'fk',
  `team_id` int(16) NOT NULL COMMENT 'fk',
  `factor_id` int(16) NOT NULL,
  `factor_value` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2157 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_team_factors`
--

INSERT INTO `tbl_team_factors` (`id`, `round_id`, `team_id`, `factor_id`, `factor_value`) VALUES
(95, 1, 0, 12, '500'),
(94, 1, 0, 11, '30'),
(93, 1, 0, 10, '3000'),
(1015, 1, 100, 8, '5000'),
(1014, 1, 100, 7, '5000'),
(1008, 1, 100, 1, '20000000'),
(1007, 2, 99, 12, '500'),
(1006, 2, 99, 11, '30'),
(1005, 2, 99, 10, '3000'),
(1004, 1, 99, 12, '500'),
(1003, 1, 99, 11, '30'),
(1002, 1, 99, 10, '3000'),
(1001, 1, 99, 9, '5000'),
(999, 1, 99, 7, '5000'),
(998, 1, 99, 6, '5000'),
(997, 1, 99, 5, '1000'),
(996, 1, 99, 4, '50'),
(995, 1, 99, 3, '50'),
(1013, 1, 100, 6, '5000'),
(1012, 1, 100, 5, '1000'),
(1011, 1, 100, 4, '50'),
(1010, 1, 100, 3, '50'),
(1009, 1, 100, 2, '50'),
(1000, 1, 99, 8, '5000'),
(994, 1, 99, 2, '50'),
(993, 1, 99, 1, '19958716'),
(992, 2, 98, 12, '500'),
(991, 2, 98, 11, '30'),
(990, 2, 98, 10, '3000'),
(989, 1, 98, 12, '500'),
(988, 1, 98, 11, '30'),
(987, 1, 98, 10, '3000'),
(986, 1, 98, 9, '5000'),
(985, 1, 98, 8, '5000'),
(984, 1, 98, 7, '5000'),
(983, 1, 98, 6, '5000'),
(982, 1, 98, 5, '1000'),
(981, 1, 98, 4, '50'),
(980, 1, 98, 3, '50'),
(979, 1, 98, 2, '50'),
(963, 1, 96, 10, '3000'),
(962, 1, 96, 9, '5000'),
(961, 1, 96, 8, '5000'),
(960, 1, 96, 7, '5000'),
(959, 1, 96, 6, '5000'),
(958, 1, 96, 5, '1000'),
(957, 1, 96, 4, '50'),
(956, 1, 96, 3, '50'),
(955, 1, 96, 2, '50'),
(954, 1, 96, 1, '20000000'),
(973, 1, 97, 8, '5000'),
(972, 1, 97, 7, '5000'),
(971, 1, 97, 6, '5000'),
(970, 1, 97, 5, '1000'),
(969, 1, 97, 4, '50'),
(968, 1, 97, 3, '50'),
(967, 1, 97, 2, '50'),
(978, 1, 98, 1, '19958962'),
(977, 1, 97, 12, '500'),
(976, 1, 97, 11, '30'),
(975, 1, 97, 10, '3000'),
(974, 1, 97, 9, '5000'),
(966, 1, 97, 1, '19993665'),
(965, 1, 96, 12, '500'),
(964, 1, 96, 11, '30'),
(1023, 1, 101, 1, '20000000'),
(1022, 2, 100, 12, '500'),
(1021, 2, 100, 11, '30'),
(1020, 2, 100, 10, '3000'),
(1019, 1, 100, 12, '500'),
(1018, 1, 100, 11, '30'),
(1017, 1, 100, 10, '3000'),
(1016, 1, 100, 9, '5000'),
(1030, 1, 101, 8, '5000'),
(1029, 1, 101, 7, '5000'),
(1028, 1, 101, 6, '5000'),
(1027, 1, 101, 5, '1000'),
(1026, 1, 101, 4, '50'),
(1025, 1, 101, 3, '50'),
(1024, 1, 101, 2, '50'),
(1037, 2, 101, 12, '500'),
(1036, 2, 101, 11, '30'),
(1035, 2, 101, 10, '3000'),
(1034, 1, 101, 12, '500'),
(1033, 1, 101, 11, '30'),
(1032, 1, 101, 10, '3000'),
(1031, 1, 101, 9, '5000'),
(1043, 1, 102, 6, '5000'),
(1042, 1, 102, 5, '1000'),
(1041, 1, 102, 4, '50'),
(1040, 1, 102, 3, '50'),
(1039, 1, 102, 2, '50'),
(1038, 1, 102, 1, '19994700'),
(1052, 2, 102, 12, '500'),
(1051, 2, 102, 11, '30'),
(1050, 2, 102, 10, '3000'),
(1049, 1, 102, 12, '500'),
(1048, 1, 102, 11, '30'),
(1047, 1, 102, 10, '3000'),
(1046, 1, 102, 9, '5000'),
(1045, 1, 102, 8, '5000'),
(1044, 1, 102, 7, '5000'),
(933, 1, 0, 1, '20000000'),
(934, 1, 0, 2, '50'),
(935, 1, 0, 3, '50'),
(936, 1, 0, 4, '50'),
(937, 1, 0, 5, '1000'),
(938, 1, 0, 6, '5000'),
(939, 1, 0, 7, '5000'),
(940, 1, 0, 8, '5000'),
(941, 1, 0, 9, '5000'),
(1053, 1, 103, 1, '13587455'),
(1054, 1, 103, 2, '50'),
(1055, 1, 103, 3, '50'),
(1056, 1, 103, 4, '50'),
(1057, 1, 103, 5, '1000'),
(1058, 1, 103, 6, '5000'),
(1059, 1, 103, 7, '5000'),
(1060, 1, 103, 8, '5000'),
(1061, 1, 103, 9, '5000'),
(1062, 1, 103, 10, '400'),
(1063, 1, 103, 11, '30'),
(1064, 1, 103, 12, '500'),
(1157, 1, 111, 9, '5000'),
(1156, 1, 111, 8, '5000'),
(1155, 1, 111, 7, '5000'),
(1154, 1, 111, 6, '5000'),
(1153, 1, 111, 5, '1000'),
(1152, 1, 111, 4, '100'),
(1151, 1, 111, 3, '100'),
(1150, 1, 111, 2, '100'),
(1149, 1, 111, 1, '980375'),
(1145, 1, 110, 9, '5000'),
(1144, 1, 110, 8, '5000'),
(1143, 1, 110, 7, '5000'),
(1142, 1, 110, 6, '5000'),
(1141, 1, 110, 5, '1000'),
(1140, 1, 110, 4, '80'),
(1139, 1, 110, 3, '80'),
(1138, 1, 110, 2, '80'),
(1137, 1, 110, 1, '424580'),
(1121, 1, 108, 9, '5000'),
(1120, 1, 108, 8, '5000'),
(1119, 1, 108, 7, '5000'),
(1118, 1, 108, 6, '5000'),
(1117, 1, 108, 5, '1000'),
(1116, 1, 108, 4, '120'),
(1115, 1, 108, 3, '120'),
(1114, 1, 108, 2, '120'),
(1113, 1, 108, 1, '1037225'),
(1133, 1, 109, 9, '5000'),
(1132, 1, 109, 8, '5000'),
(1131, 1, 109, 7, '5000'),
(1130, 1, 109, 6, '5000'),
(1129, 1, 109, 5, '1000'),
(1128, 1, 109, 4, '50'),
(1127, 1, 109, 3, '50'),
(1126, 1, 109, 2, '50'),
(1125, 1, 109, 1, '850000'),
(1122, 1, 108, 10, '3000'),
(1123, 1, 108, 11, '30'),
(1124, 1, 108, 12, '500'),
(1134, 1, 109, 10, '3000'),
(1135, 1, 109, 11, '30'),
(1136, 1, 109, 12, '500'),
(1146, 1, 110, 10, '3000'),
(1147, 1, 110, 11, '30'),
(1148, 1, 110, 12, '500'),
(1158, 1, 111, 10, '3000'),
(1159, 1, 111, 11, '30'),
(1160, 1, 111, 12, '500'),
(1261, 3, 116, 11, '30'),
(1260, 3, 116, 10, '3000'),
(1259, 2, 116, 12, '500'),
(1258, 2, 116, 11, '30'),
(1257, 2, 116, 10, '3000'),
(1256, 1, 116, 12, '500'),
(1255, 1, 116, 11, '30'),
(1254, 1, 116, 10, '3000'),
(1253, 1, 116, 9, '6000'),
(1252, 1, 116, 8, '6000'),
(1251, 1, 116, 7, '6000'),
(1250, 1, 116, 6, '6000'),
(1249, 1, 116, 5, '2000'),
(1248, 1, 116, 4, '200'),
(1247, 1, 116, 3, '200'),
(1246, 1, 116, 2, '150'),
(1245, 1, 116, 1, '197125'),
(1303, 3, 118, 11, '30'),
(1302, 3, 118, 10, '3000'),
(1301, 2, 118, 12, '500'),
(1300, 2, 118, 11, '30'),
(1299, 2, 118, 10, '3000'),
(1298, 1, 118, 12, '500'),
(1297, 1, 118, 11, '30'),
(1296, 1, 118, 10, '3000'),
(1295, 1, 118, 9, '5000'),
(1294, 1, 118, 8, '5000'),
(1293, 1, 118, 7, '5000'),
(1292, 1, 118, 6, '5000'),
(1291, 1, 118, 5, '500'),
(1290, 1, 118, 4, '100'),
(1289, 1, 118, 3, '100'),
(1288, 1, 118, 2, '-10'),
(1287, 1, 118, 1, '48580'),
(1282, 3, 117, 11, '30'),
(1281, 3, 117, 10, '3000'),
(1280, 2, 117, 12, '500'),
(1279, 2, 117, 11, '30'),
(1278, 2, 117, 10, '3000'),
(1277, 1, 117, 12, '500'),
(1276, 1, 117, 11, '30'),
(1275, 1, 117, 10, '3000'),
(1274, 1, 117, 9, '5000'),
(1273, 1, 117, 8, '5000'),
(1272, 1, 117, 7, '5000'),
(1271, 1, 117, 6, '5000'),
(1270, 1, 117, 5, '1000'),
(1269, 1, 117, 4, '120'),
(1268, 1, 117, 3, '120'),
(1267, 1, 117, 2, '120'),
(1266, 1, 117, 1, '1177735'),
(1224, 1, 115, 1, '594155'),
(1225, 1, 115, 2, '50'),
(1226, 1, 115, 3, '50'),
(1227, 1, 115, 4, '50'),
(1228, 1, 115, 5, '1000'),
(1229, 1, 115, 6, '5000'),
(1230, 1, 115, 7, '5000'),
(1231, 1, 115, 8, '5000'),
(1232, 1, 115, 9, '5000'),
(1233, 1, 115, 10, '3000'),
(1234, 1, 115, 11, '30'),
(1235, 1, 115, 12, '500'),
(1236, 2, 115, 10, '3000'),
(1237, 2, 115, 11, '30'),
(1238, 2, 115, 12, '500'),
(1239, 3, 115, 10, '3000'),
(1240, 3, 115, 11, '30'),
(1241, 3, 115, 12, '500'),
(1242, 4, 115, 10, '3000'),
(1243, 4, 115, 11, '30'),
(1244, 4, 115, 12, '500'),
(1262, 3, 116, 12, '500'),
(1263, 4, 116, 10, '3000'),
(1264, 4, 116, 11, '30'),
(1265, 4, 116, 12, '500'),
(1283, 3, 117, 12, '500'),
(1284, 4, 117, 10, '3000'),
(1285, 4, 117, 11, '30'),
(1286, 4, 117, 12, '500'),
(1304, 3, 118, 12, '500'),
(1305, 4, 118, 10, '3000'),
(1306, 4, 118, 11, '30'),
(1307, 4, 118, 12, '500'),
(1308, 1, 119, 1, '635080'),
(1309, 1, 119, 2, '50'),
(1310, 1, 119, 3, '50'),
(1311, 1, 119, 4, '50'),
(1312, 1, 119, 5, '1000'),
(1313, 1, 119, 6, '5000'),
(1314, 1, 119, 7, '5000'),
(1315, 1, 119, 8, '5000'),
(1316, 1, 119, 9, '5000'),
(1317, 1, 119, 10, '3000'),
(1318, 1, 119, 11, '30'),
(1319, 1, 119, 12, '500'),
(1320, 2, 119, 10, '3000'),
(1321, 2, 119, 11, '30'),
(1322, 2, 119, 12, '500'),
(1323, 3, 119, 10, '3000'),
(1324, 3, 119, 11, '30'),
(1325, 3, 119, 12, '500'),
(1326, 1, 120, 1, '499125'),
(1327, 1, 120, 2, '100'),
(1328, 1, 120, 3, '100'),
(1329, 1, 120, 4, '100'),
(1330, 1, 120, 5, '1000'),
(1331, 1, 120, 6, '5000'),
(1332, 1, 120, 7, '5000'),
(1333, 1, 120, 8, '5000'),
(1334, 1, 120, 9, '5000'),
(1335, 1, 120, 10, '3000'),
(1336, 1, 120, 11, '30'),
(1337, 1, 120, 12, '500'),
(1338, 2, 120, 10, '3000'),
(1339, 2, 120, 11, '30'),
(1340, 2, 120, 12, '500'),
(1341, 3, 120, 10, '3000'),
(1342, 3, 120, 11, '30'),
(1343, 3, 120, 12, '500'),
(1344, 4, 120, 10, '3000'),
(1345, 4, 120, 11, '30'),
(1346, 4, 120, 12, '500'),
(1347, 1, 121, 1, '19971565'),
(1348, 1, 121, 2, '50'),
(1349, 1, 121, 3, '50'),
(1350, 1, 121, 4, '50'),
(1351, 1, 121, 5, '1000'),
(1352, 1, 121, 6, '5000'),
(1353, 1, 121, 7, '5000'),
(1354, 1, 121, 8, '5000'),
(1355, 1, 121, 9, '5000'),
(1356, 1, 121, 10, '3000'),
(1357, 1, 121, 11, '30'),
(1358, 1, 121, 12, '500'),
(1359, 2, 121, 10, '3000'),
(1360, 2, 121, 11, '30'),
(1361, 2, 121, 12, '500'),
(1362, 3, 121, 10, '3000'),
(1363, 3, 121, 11, '30'),
(1364, 3, 121, 12, '500'),
(1365, 1, 122, 1, '19757510'),
(1366, 1, 122, 2, '50'),
(1367, 1, 122, 3, '50'),
(1368, 1, 122, 4, '50'),
(1369, 1, 122, 5, '1000'),
(1370, 1, 122, 6, '5000'),
(1371, 1, 122, 7, '5000'),
(1372, 1, 122, 8, '5000'),
(1373, 1, 122, 9, '5000'),
(1374, 1, 122, 10, '3000'),
(1375, 1, 122, 11, '30'),
(1376, 1, 122, 12, '500'),
(1377, 2, 122, 10, '3000'),
(1378, 2, 122, 11, '30'),
(1379, 2, 122, 12, '500'),
(1380, 3, 122, 10, '3000'),
(1381, 3, 122, 11, '30'),
(1382, 3, 122, 12, '500'),
(1383, 2, 122, 1, '19758510'),
(1384, 2, 122, 2, '50'),
(1385, 2, 122, 3, '60'),
(1386, 2, 122, 4, '50'),
(1387, 2, 122, 5, '1000'),
(1388, 2, 122, 6, '5000'),
(1389, 2, 122, 7, '5000'),
(1390, 2, 122, 8, '5000'),
(1391, 2, 122, 9, '5000'),
(1392, 2, 122, 10, '3000'),
(1393, 2, 122, 11, '30'),
(1394, 2, 122, 12, '500'),
(1395, 3, 122, 10, '3000'),
(1396, 3, 122, 11, '30'),
(1397, 3, 122, 12, '500'),
(1398, 3, 122, 1, '19757510'),
(1399, 3, 122, 2, '50'),
(1400, 3, 122, 3, '50'),
(1401, 3, 122, 4, '50'),
(1402, 3, 122, 5, '1000'),
(1403, 3, 122, 6, '5000'),
(1404, 3, 122, 7, '5000'),
(1405, 3, 122, 8, '5000'),
(1406, 3, 122, 9, '5000'),
(1407, 3, 122, 10, '3000'),
(1408, 3, 122, 11, '30'),
(1409, 3, 122, 12, '500'),
(1410, 0, 122, 1, '19757510'),
(1411, 0, 122, 2, '50'),
(1412, 0, 122, 3, '50'),
(1413, 0, 122, 4, '50'),
(1414, 0, 122, 5, '1000'),
(1415, 0, 122, 6, '5000'),
(1416, 0, 122, 7, '5000'),
(1417, 0, 122, 8, '5000'),
(1418, 0, 122, 9, '5000'),
(1419, 0, 122, 10, '3000'),
(1420, 0, 122, 11, '30'),
(1421, 0, 122, 12, '500'),
(1422, 0, 122, 10, '3000'),
(1423, 0, 122, 11, '30'),
(1424, 0, 122, 12, '500'),
(1425, 0, 122, 10, '3000'),
(1426, 0, 122, 11, '30'),
(1427, 0, 122, 12, '500'),
(1428, 0, 122, 1, '19757510'),
(1429, 0, 122, 2, '50'),
(1430, 0, 122, 3, '50'),
(1431, 0, 122, 4, '50'),
(1432, 0, 122, 5, '1000'),
(1433, 0, 122, 6, '5000'),
(1434, 0, 122, 7, '5000'),
(1435, 0, 122, 8, '5000'),
(1436, 0, 122, 9, '5000'),
(1437, 0, 122, 10, '3000'),
(1438, 0, 122, 11, '30'),
(1439, 0, 122, 12, '500'),
(1440, 0, 122, 10, '3000'),
(1441, 0, 122, 11, '30'),
(1442, 0, 122, 12, '500'),
(1443, 0, 122, 1, '19757510'),
(1444, 0, 122, 2, '50'),
(1445, 0, 122, 3, '50'),
(1446, 0, 122, 4, '50'),
(1447, 0, 122, 5, '1000'),
(1448, 0, 122, 6, '5000'),
(1449, 0, 122, 7, '5000'),
(1450, 0, 122, 8, '5000'),
(1451, 0, 122, 9, '5000'),
(1452, 0, 122, 10, '3000'),
(1453, 0, 122, 11, '30'),
(1454, 0, 122, 12, '500'),
(1455, 0, 122, 1, '19757510'),
(1456, 0, 122, 2, '50'),
(1457, 0, 122, 3, '50'),
(1458, 0, 122, 4, '50'),
(1459, 0, 122, 5, '1000'),
(1460, 0, 122, 6, '5000'),
(1461, 0, 122, 7, '5000'),
(1462, 0, 122, 8, '5000'),
(1463, 0, 122, 9, '5000'),
(1464, 0, 122, 10, '3000'),
(1465, 0, 122, 11, '30'),
(1466, 0, 122, 12, '500'),
(1467, 0, 122, 10, '3000'),
(1468, 0, 122, 11, '30'),
(1469, 0, 122, 12, '500'),
(1470, 0, 122, 10, '3000'),
(1471, 0, 122, 11, '30'),
(1472, 0, 122, 12, '500'),
(1473, 0, 122, 1, '19757510'),
(1474, 0, 122, 2, '50'),
(1475, 0, 122, 3, '50'),
(1476, 0, 122, 4, '50'),
(1477, 0, 122, 5, '1000'),
(1478, 0, 122, 6, '5000'),
(1479, 0, 122, 7, '5000'),
(1480, 0, 122, 8, '5000'),
(1481, 0, 122, 9, '5000'),
(1482, 0, 122, 10, '3000'),
(1483, 0, 122, 11, '30'),
(1484, 0, 122, 12, '500'),
(1485, 0, 122, 10, '3000'),
(1486, 0, 122, 11, '30'),
(1487, 0, 122, 12, '500'),
(1488, 0, 122, 1, '19757510'),
(1489, 0, 122, 2, '50'),
(1490, 0, 122, 3, '50'),
(1491, 0, 122, 4, '50'),
(1492, 0, 122, 5, '1000'),
(1493, 0, 122, 6, '5000'),
(1494, 0, 122, 7, '5000'),
(1495, 0, 122, 8, '5000'),
(1496, 0, 122, 9, '5000'),
(1497, 0, 122, 10, '3000'),
(1498, 0, 122, 11, '30'),
(1499, 0, 122, 12, '500'),
(1500, 0, 122, 1, '19757510'),
(1501, 0, 122, 2, '50'),
(1502, 0, 122, 3, '50'),
(1503, 0, 122, 4, '50'),
(1504, 0, 122, 5, '1000'),
(1505, 0, 122, 6, '5000'),
(1506, 0, 122, 7, '5000'),
(1507, 0, 122, 8, '5000'),
(1508, 0, 122, 9, '5000'),
(1509, 0, 122, 10, '3000'),
(1510, 0, 122, 11, '30'),
(1511, 0, 122, 12, '500'),
(1512, 0, 122, 10, '3000'),
(1513, 0, 122, 11, '30'),
(1514, 0, 122, 12, '500'),
(1515, 0, 122, 10, '3000'),
(1516, 0, 122, 11, '30'),
(1517, 0, 122, 12, '500'),
(1518, 0, 122, 1, '19757510'),
(1519, 0, 122, 2, '50'),
(1520, 0, 122, 3, '50'),
(1521, 0, 122, 4, '50'),
(1522, 0, 122, 5, '1000'),
(1523, 0, 122, 6, '5000'),
(1524, 0, 122, 7, '5000'),
(1525, 0, 122, 8, '5000'),
(1526, 0, 122, 9, '5000'),
(1527, 0, 122, 10, '3000'),
(1528, 0, 122, 11, '30'),
(1529, 0, 122, 12, '500'),
(1530, 0, 122, 10, '3000'),
(1531, 0, 122, 11, '30'),
(1532, 0, 122, 12, '500'),
(1533, 0, 122, 1, '19757510'),
(1534, 0, 122, 2, '50'),
(1535, 0, 122, 3, '50'),
(1536, 0, 122, 4, '50'),
(1537, 0, 122, 5, '1000'),
(1538, 0, 122, 6, '5000'),
(1539, 0, 122, 7, '5000'),
(1540, 0, 122, 8, '5000'),
(1541, 0, 122, 9, '5000'),
(1542, 0, 122, 10, '3000'),
(1543, 0, 122, 11, '30'),
(1544, 0, 122, 12, '500'),
(1545, 0, 122, 1, '19757510'),
(1546, 0, 122, 2, '50'),
(1547, 0, 122, 3, '50'),
(1548, 0, 122, 4, '50'),
(1549, 0, 122, 5, '1000'),
(1550, 0, 122, 6, '5000'),
(1551, 0, 122, 7, '5000'),
(1552, 0, 122, 8, '5000'),
(1553, 0, 122, 9, '5000'),
(1554, 0, 122, 10, '3000'),
(1555, 0, 122, 11, '30'),
(1556, 0, 122, 12, '500'),
(1557, 0, 122, 10, '3000'),
(1558, 0, 122, 11, '30'),
(1559, 0, 122, 12, '500'),
(1560, 0, 122, 10, '3000'),
(1561, 0, 122, 11, '30'),
(1562, 0, 122, 12, '500'),
(1563, 0, 122, 1, '19757510'),
(1564, 0, 122, 2, '50'),
(1565, 0, 122, 3, '50'),
(1566, 0, 122, 4, '50'),
(1567, 0, 122, 5, '1000'),
(1568, 0, 122, 6, '5000'),
(1569, 0, 122, 7, '5000'),
(1570, 0, 122, 8, '5000'),
(1571, 0, 122, 9, '5000'),
(1572, 0, 122, 10, '3000'),
(1573, 0, 122, 11, '30'),
(1574, 0, 122, 12, '500'),
(1575, 0, 122, 10, '3000'),
(1576, 0, 122, 11, '30'),
(1577, 0, 122, 12, '500'),
(1578, 0, 122, 1, '19757510'),
(1579, 0, 122, 2, '50'),
(1580, 0, 122, 3, '50'),
(1581, 0, 122, 4, '50'),
(1582, 0, 122, 5, '1000'),
(1583, 0, 122, 6, '5000'),
(1584, 0, 122, 7, '5000'),
(1585, 0, 122, 8, '5000'),
(1586, 0, 122, 9, '5000'),
(1587, 0, 122, 10, '3000'),
(1588, 0, 122, 11, '30'),
(1589, 0, 122, 12, '500'),
(1590, 0, 122, 1, '19757510'),
(1591, 0, 122, 2, '50'),
(1592, 0, 122, 3, '50'),
(1593, 0, 122, 4, '50'),
(1594, 0, 122, 5, '1000'),
(1595, 0, 122, 6, '5000'),
(1596, 0, 122, 7, '5000'),
(1597, 0, 122, 8, '5000'),
(1598, 0, 122, 9, '5000'),
(1599, 0, 122, 10, '3000'),
(1600, 0, 122, 11, '30'),
(1601, 0, 122, 12, '500'),
(1602, 0, 122, 10, '3000'),
(1603, 0, 122, 11, '30'),
(1604, 0, 122, 12, '500'),
(1605, 0, 122, 10, '3000'),
(1606, 0, 122, 11, '30'),
(1607, 0, 122, 12, '500'),
(1608, 0, 122, 1, '19757510'),
(1609, 0, 122, 2, '50'),
(1610, 0, 122, 3, '50'),
(1611, 0, 122, 4, '50'),
(1612, 0, 122, 5, '1000'),
(1613, 0, 122, 6, '5000'),
(1614, 0, 122, 7, '5000'),
(1615, 0, 122, 8, '5000'),
(1616, 0, 122, 9, '5000'),
(1617, 0, 122, 10, '3000'),
(1618, 0, 122, 11, '30'),
(1619, 0, 122, 12, '500'),
(1620, 0, 122, 10, '3000'),
(1621, 0, 122, 11, '30'),
(1622, 0, 122, 12, '500'),
(1623, 0, 122, 1, '19757510'),
(1624, 0, 122, 2, '50'),
(1625, 0, 122, 3, '50'),
(1626, 0, 122, 4, '50'),
(1627, 0, 122, 5, '1000'),
(1628, 0, 122, 6, '5000'),
(1629, 0, 122, 7, '5000'),
(1630, 0, 122, 8, '5000'),
(1631, 0, 122, 9, '5000'),
(1632, 0, 122, 10, '3000'),
(1633, 0, 122, 11, '30'),
(1634, 0, 122, 12, '500'),
(1635, 0, 122, 1, '19757510'),
(1636, 0, 122, 2, '50'),
(1637, 0, 122, 3, '50'),
(1638, 0, 122, 4, '50'),
(1639, 0, 122, 5, '1000'),
(1640, 0, 122, 6, '5000'),
(1641, 0, 122, 7, '5000'),
(1642, 0, 122, 8, '5000'),
(1643, 0, 122, 9, '5000'),
(1644, 0, 122, 10, '3000'),
(1645, 0, 122, 11, '30'),
(1646, 0, 122, 12, '500'),
(1647, 0, 122, 10, '3000'),
(1648, 0, 122, 11, '30'),
(1649, 0, 122, 12, '500'),
(1650, 0, 122, 10, '3000'),
(1651, 0, 122, 11, '30'),
(1652, 0, 122, 12, '500'),
(1653, 0, 122, 1, '19757510'),
(1654, 0, 122, 2, '50'),
(1655, 0, 122, 3, '50'),
(1656, 0, 122, 4, '50'),
(1657, 0, 122, 5, '1000'),
(1658, 0, 122, 6, '5000'),
(1659, 0, 122, 7, '5000'),
(1660, 0, 122, 8, '5000'),
(1661, 0, 122, 9, '5000'),
(1662, 0, 122, 10, '3000'),
(1663, 0, 122, 11, '30'),
(1664, 0, 122, 12, '500'),
(1665, 0, 122, 10, '3000'),
(1666, 0, 122, 11, '30'),
(1667, 0, 122, 12, '500'),
(1668, 0, 122, 1, '19757510'),
(1669, 0, 122, 2, '50'),
(1670, 0, 122, 3, '50'),
(1671, 0, 122, 4, '50'),
(1672, 0, 122, 5, '1000'),
(1673, 0, 122, 6, '5000'),
(1674, 0, 122, 7, '5000'),
(1675, 0, 122, 8, '5000'),
(1676, 0, 122, 9, '5000'),
(1677, 0, 122, 10, '3000'),
(1678, 0, 122, 11, '30'),
(1679, 0, 122, 12, '500'),
(1680, 0, 122, 1, '19757510'),
(1681, 0, 122, 2, '50'),
(1682, 0, 122, 3, '50'),
(1683, 0, 122, 4, '50'),
(1684, 0, 122, 5, '1000'),
(1685, 0, 122, 6, '5000'),
(1686, 0, 122, 7, '5000'),
(1687, 0, 122, 8, '5000'),
(1688, 0, 122, 9, '5000'),
(1689, 0, 122, 10, '3000'),
(1690, 0, 122, 11, '30'),
(1691, 0, 122, 12, '500'),
(1692, 0, 122, 10, '3000'),
(1693, 0, 122, 11, '30'),
(1694, 0, 122, 12, '500'),
(1695, 0, 122, 10, '3000'),
(1696, 0, 122, 11, '30'),
(1697, 0, 122, 12, '500'),
(1698, 0, 122, 1, '19757510'),
(1699, 0, 122, 2, '50'),
(1700, 0, 122, 3, '50'),
(1701, 0, 122, 4, '50'),
(1702, 0, 122, 5, '1000'),
(1703, 0, 122, 6, '5000'),
(1704, 0, 122, 7, '5000'),
(1705, 0, 122, 8, '5000'),
(1706, 0, 122, 9, '5000'),
(1707, 0, 122, 10, '3000'),
(1708, 0, 122, 11, '30'),
(1709, 0, 122, 12, '500'),
(1710, 0, 122, 10, '3000'),
(1711, 0, 122, 11, '30'),
(1712, 0, 122, 12, '500'),
(1713, 0, 122, 1, '19757510'),
(1714, 0, 122, 2, '50'),
(1715, 0, 122, 3, '50'),
(1716, 0, 122, 4, '50'),
(1717, 0, 122, 5, '1000'),
(1718, 0, 122, 6, '5000'),
(1719, 0, 122, 7, '5000'),
(1720, 0, 122, 8, '5000'),
(1721, 0, 122, 9, '5000'),
(1722, 0, 122, 10, '3000'),
(1723, 0, 122, 11, '30'),
(1724, 0, 122, 12, '500'),
(1725, 1, 123, 1, '20000000'),
(1726, 1, 123, 2, '50'),
(1727, 1, 123, 3, '50'),
(1728, 1, 123, 4, '50'),
(1729, 1, 123, 5, '1000'),
(1730, 1, 123, 6, '5000'),
(1731, 1, 123, 7, '5000'),
(1732, 1, 123, 8, '5000'),
(1733, 1, 123, 9, '5000'),
(1734, 1, 123, 10, '3000'),
(1735, 1, 123, 11, '30'),
(1736, 1, 123, 12, '500'),
(1737, 2, 123, 10, '3000'),
(1738, 2, 123, 11, '30'),
(1739, 2, 123, 12, '500'),
(1740, 3, 123, 10, '3000'),
(1741, 3, 123, 11, '30'),
(1742, 3, 123, 12, '500'),
(1743, 1, 124, 1, '20001000'),
(1744, 1, 124, 2, '50'),
(1745, 1, 124, 3, '60'),
(1746, 1, 124, 4, '50'),
(1747, 1, 124, 5, '1000'),
(1748, 1, 124, 6, '5000'),
(1749, 1, 124, 7, '5000'),
(1750, 1, 124, 8, '5000'),
(1751, 1, 124, 9, '5000'),
(1752, 1, 124, 10, '3000'),
(1753, 1, 124, 11, '30'),
(1754, 1, 124, 12, '500'),
(1755, 2, 124, 10, '3000'),
(1756, 2, 124, 11, '30'),
(1757, 2, 124, 12, '500'),
(1758, 3, 124, 10, '3000'),
(1759, 3, 124, 11, '30'),
(1760, 3, 124, 12, '500'),
(1761, 4, 124, 10, '3000'),
(1762, 4, 124, 11, '30'),
(1763, 4, 124, 12, '500'),
(1764, 2, 124, 1, '20004000'),
(1765, 2, 124, 2, '50'),
(1766, 2, 124, 3, '130'),
(1767, 2, 124, 4, '50'),
(1768, 2, 124, 5, '1000'),
(1769, 2, 124, 6, '5000'),
(1770, 2, 124, 7, '5000'),
(1771, 2, 124, 8, '5000'),
(1772, 2, 124, 9, '5000'),
(1773, 2, 124, 10, '3000'),
(1774, 2, 124, 11, '30'),
(1775, 2, 124, 12, '500'),
(1776, 3, 124, 10, '3000'),
(1777, 3, 124, 11, '30'),
(1778, 3, 124, 12, '500'),
(1779, 3, 124, 1, '20000000'),
(1780, 3, 124, 2, '50'),
(1781, 3, 124, 3, '50'),
(1782, 3, 124, 4, '50'),
(1783, 3, 124, 5, '1000'),
(1784, 3, 124, 6, '5000'),
(1785, 3, 124, 7, '5000'),
(1786, 3, 124, 8, '5000'),
(1787, 3, 124, 9, '5000'),
(1788, 3, 124, 10, '3000'),
(1789, 3, 124, 11, '30'),
(1790, 3, 124, 12, '500'),
(1791, 3, 124, 10, '3000'),
(1792, 3, 124, 11, '30'),
(1793, 3, 124, 12, '500'),
(1794, 3, 124, 1, '20000000'),
(1795, 3, 124, 2, '50'),
(1796, 3, 124, 3, '60'),
(1797, 3, 124, 4, '50'),
(1798, 3, 124, 5, '1000'),
(1799, 3, 124, 6, '5000'),
(1800, 3, 124, 7, '5000'),
(1801, 3, 124, 8, '5000'),
(1802, 3, 124, 9, '5000'),
(1803, 3, 124, 10, '3000'),
(1804, 3, 124, 11, '30'),
(1805, 3, 124, 12, '500'),
(1806, 3, 124, 10, '3000'),
(1807, 3, 124, 11, '30'),
(1808, 3, 124, 12, '500'),
(1809, 3, 124, 1, '20000000'),
(1810, 3, 124, 2, '50'),
(1811, 3, 124, 3, '70'),
(1812, 3, 124, 4, '50'),
(1813, 3, 124, 5, '1000'),
(1814, 3, 124, 6, '5000'),
(1815, 3, 124, 7, '5000'),
(1816, 3, 124, 8, '5000'),
(1817, 3, 124, 9, '5000'),
(1818, 3, 124, 10, '3000'),
(1819, 3, 124, 11, '30'),
(1820, 3, 124, 12, '500'),
(1821, 3, 124, 10, '3000'),
(1822, 3, 124, 11, '30'),
(1823, 3, 124, 12, '500'),
(1824, 3, 124, 1, '20000000'),
(1825, 3, 124, 2, '50'),
(1826, 3, 124, 3, '80'),
(1827, 3, 124, 4, '50'),
(1828, 3, 124, 5, '1000'),
(1829, 3, 124, 6, '5000'),
(1830, 3, 124, 7, '5000'),
(1831, 3, 124, 8, '5000'),
(1832, 3, 124, 9, '5000'),
(1833, 3, 124, 10, '3000'),
(1834, 3, 124, 11, '30'),
(1835, 3, 124, 12, '500'),
(1836, 3, 124, 10, '3000'),
(1837, 3, 124, 11, '30'),
(1838, 3, 124, 12, '500'),
(1839, 3, 124, 1, '20000000'),
(1840, 3, 124, 2, '50'),
(1841, 3, 124, 3, '90'),
(1842, 3, 124, 4, '50'),
(1843, 3, 124, 5, '1000'),
(1844, 3, 124, 6, '5000'),
(1845, 3, 124, 7, '5000'),
(1846, 3, 124, 8, '5000'),
(1847, 3, 124, 9, '5000'),
(1848, 3, 124, 10, '3000'),
(1849, 3, 124, 11, '30'),
(1850, 3, 124, 12, '500'),
(1851, 3, 124, 10, '3000'),
(1852, 3, 124, 11, '30'),
(1853, 3, 124, 12, '500'),
(1854, 3, 124, 1, '20000000'),
(1855, 3, 124, 2, '50'),
(1856, 3, 124, 3, '100'),
(1857, 3, 124, 4, '50'),
(1858, 3, 124, 5, '1000'),
(1859, 3, 124, 6, '5000'),
(1860, 3, 124, 7, '5000'),
(1861, 3, 124, 8, '5000'),
(1862, 3, 124, 9, '5000'),
(1863, 3, 124, 10, '3000'),
(1864, 3, 124, 11, '30'),
(1865, 3, 124, 12, '500'),
(1866, 3, 124, 10, '3000'),
(1867, 3, 124, 11, '30'),
(1868, 3, 124, 12, '500'),
(1869, 3, 124, 1, '20001000'),
(1870, 3, 124, 2, '50'),
(1871, 3, 124, 3, '100'),
(1872, 3, 124, 4, '50'),
(1873, 3, 124, 5, '1000'),
(1874, 3, 124, 6, '5000'),
(1875, 3, 124, 7, '5000'),
(1876, 3, 124, 8, '5000'),
(1877, 3, 124, 9, '5000'),
(1878, 3, 124, 10, '3000'),
(1879, 3, 124, 11, '30'),
(1880, 3, 124, 12, '500'),
(1881, 3, 124, 10, '3000'),
(1882, 3, 124, 11, '30'),
(1883, 3, 124, 12, '500'),
(1884, 3, 124, 1, '20002000'),
(1885, 3, 124, 2, '50'),
(1886, 3, 124, 3, '110'),
(1887, 3, 124, 4, '50'),
(1888, 3, 124, 5, '1000'),
(1889, 3, 124, 6, '5000'),
(1890, 3, 124, 7, '5000'),
(1891, 3, 124, 8, '5000'),
(1892, 3, 124, 9, '5000'),
(1893, 3, 124, 10, '3000'),
(1894, 3, 124, 11, '30'),
(1895, 3, 124, 12, '500'),
(1896, 3, 124, 10, '3000'),
(1897, 3, 124, 11, '30'),
(1898, 3, 124, 12, '500'),
(1899, 3, 124, 1, '20003000'),
(1900, 3, 124, 2, '50'),
(1901, 3, 124, 3, '120'),
(1902, 3, 124, 4, '50'),
(1903, 3, 124, 5, '1000'),
(1904, 3, 124, 6, '5000'),
(1905, 3, 124, 7, '5000'),
(1906, 3, 124, 8, '5000'),
(1907, 3, 124, 9, '5000'),
(1908, 3, 124, 10, '3000'),
(1909, 3, 124, 11, '30'),
(1910, 3, 124, 12, '500'),
(1911, 1, 125, 1, '20000000'),
(1912, 1, 125, 2, '50'),
(1913, 1, 125, 3, '50'),
(1914, 1, 125, 4, '50'),
(1915, 1, 125, 5, '1000'),
(1916, 1, 125, 6, '5000'),
(1917, 1, 125, 7, '5000'),
(1918, 1, 125, 8, '5000'),
(1919, 1, 125, 9, '5000'),
(1920, 1, 125, 10, '3000'),
(1921, 1, 125, 11, '30'),
(1922, 1, 125, 12, '500'),
(1923, 2, 125, 10, '3000'),
(1924, 2, 125, 11, '30'),
(1925, 2, 125, 12, '500'),
(1926, 3, 125, 10, '3000'),
(1927, 3, 125, 11, '30'),
(1928, 3, 125, 12, '500'),
(1929, 4, 125, 10, '3000'),
(1930, 4, 125, 11, '30'),
(1931, 4, 125, 12, '500'),
(1932, 5, 125, 10, '3000'),
(1933, 5, 125, 11, '30'),
(1934, 5, 125, 12, '500'),
(1935, 2, 125, 1, '21000000'),
(1936, 2, 125, 2, '50'),
(1937, 2, 125, 3, '60'),
(1938, 2, 125, 4, '50'),
(1939, 2, 125, 5, '1000'),
(1940, 2, 125, 6, '5000'),
(1941, 2, 125, 7, '5000'),
(1942, 2, 125, 8, '5000'),
(1943, 2, 125, 9, '5000'),
(1944, 2, 125, 10, '3000'),
(1945, 2, 125, 11, '30'),
(1946, 2, 125, 12, '500'),
(1947, 2, 125, 1, '21000000'),
(1948, 2, 125, 2, '50'),
(1949, 2, 125, 3, '60'),
(1950, 2, 125, 4, '50'),
(1951, 2, 125, 5, '1000'),
(1952, 2, 125, 6, '5000'),
(1953, 2, 125, 7, '5000'),
(1954, 2, 125, 8, '5000'),
(1955, 2, 125, 9, '5000'),
(1956, 2, 125, 10, '3000'),
(1957, 2, 125, 11, '30'),
(1958, 2, 125, 12, '500'),
(1959, 1, 126, 1, '20000000'),
(1960, 1, 126, 2, '50'),
(1961, 1, 126, 3, '50'),
(1962, 1, 126, 4, '50'),
(1963, 1, 126, 5, '1000'),
(1964, 1, 126, 6, '5000'),
(1965, 1, 126, 7, '5000'),
(1966, 1, 126, 8, '5000'),
(1967, 1, 126, 9, '5000'),
(1968, 1, 126, 10, '3000'),
(1969, 1, 126, 11, '30'),
(1970, 1, 126, 12, '500'),
(1971, 2, 126, 10, '3000'),
(1972, 2, 126, 11, '30'),
(1973, 2, 126, 12, '500'),
(1974, 3, 126, 10, '3000'),
(1975, 3, 126, 11, '30'),
(1976, 3, 126, 12, '500'),
(1977, 4, 126, 10, '3000'),
(1978, 4, 126, 11, '30'),
(1979, 4, 126, 12, '500'),
(1980, 2, 126, 1, '20000000'),
(1981, 2, 126, 2, '50'),
(1982, 2, 126, 3, '50'),
(1983, 2, 126, 4, '50'),
(1984, 2, 126, 5, '1000'),
(1985, 2, 126, 6, '5000'),
(1986, 2, 126, 7, '5000'),
(1987, 2, 126, 8, '5000'),
(1988, 2, 126, 9, '5000'),
(1989, 2, 126, 10, '3000'),
(1990, 2, 126, 11, '30'),
(1991, 2, 126, 12, '500'),
(1992, 3, 126, 10, '3000'),
(1993, 3, 126, 11, '30'),
(1994, 3, 126, 12, '500'),
(1995, 3, 126, 1, '20000000'),
(1996, 3, 126, 2, '50'),
(1997, 3, 126, 3, '50'),
(1998, 3, 126, 4, '50'),
(1999, 3, 126, 5, '1000'),
(2000, 3, 126, 6, '5000'),
(2001, 3, 126, 7, '5000'),
(2002, 3, 126, 8, '5000'),
(2003, 3, 126, 9, '5000'),
(2004, 3, 126, 10, '3000'),
(2005, 3, 126, 11, '30'),
(2006, 3, 126, 12, '500'),
(2007, 4, 126, 10, '3000'),
(2008, 4, 126, 11, '30'),
(2009, 4, 126, 12, '500'),
(2010, 4, 126, 10, '3000'),
(2011, 4, 126, 11, '30'),
(2012, 4, 126, 12, '500'),
(2013, 4, 126, 1, '20000000'),
(2014, 4, 126, 2, '50'),
(2015, 4, 126, 3, '50'),
(2016, 4, 126, 4, '50'),
(2017, 4, 126, 5, '1000'),
(2018, 4, 126, 6, '5000'),
(2019, 4, 126, 7, '5000'),
(2020, 4, 126, 8, '5000'),
(2021, 4, 126, 9, '5000'),
(2022, 4, 126, 10, '3000'),
(2023, 4, 126, 11, '30'),
(2024, 4, 126, 12, '500'),
(2025, 0, 126, 1, '20000000'),
(2026, 0, 126, 2, '50'),
(2027, 0, 126, 3, '50'),
(2028, 0, 126, 4, '50'),
(2029, 0, 126, 5, '1000'),
(2030, 0, 126, 6, '5000'),
(2031, 0, 126, 7, '5000'),
(2032, 0, 126, 8, '5000'),
(2033, 0, 126, 9, '5000'),
(2034, 0, 126, 10, '3000'),
(2035, 0, 126, 11, '30'),
(2036, 0, 126, 12, '500'),
(2037, 0, 126, 10, '3000'),
(2038, 0, 126, 11, '30'),
(2039, 0, 126, 12, '500'),
(2040, 0, 126, 10, '3000'),
(2041, 0, 126, 11, '30'),
(2042, 0, 126, 12, '500'),
(2043, 0, 126, 10, '3000'),
(2044, 0, 126, 11, '30'),
(2045, 0, 126, 12, '500'),
(2046, 0, 126, 1, '20000000'),
(2047, 0, 126, 2, '50'),
(2048, 0, 126, 3, '50'),
(2049, 0, 126, 4, '50'),
(2050, 0, 126, 5, '1000'),
(2051, 0, 126, 6, '5000'),
(2052, 0, 126, 7, '5000'),
(2053, 0, 126, 8, '5000'),
(2054, 0, 126, 9, '5000'),
(2055, 0, 126, 10, '3000'),
(2056, 0, 126, 11, '30'),
(2057, 0, 126, 12, '500'),
(2058, 0, 126, 10, '3000'),
(2059, 0, 126, 11, '30'),
(2060, 0, 126, 12, '500'),
(2061, 0, 126, 1, '20000000'),
(2062, 0, 126, 2, '50'),
(2063, 0, 126, 3, '50'),
(2064, 0, 126, 4, '50'),
(2065, 0, 126, 5, '1000'),
(2066, 0, 126, 6, '5000'),
(2067, 0, 126, 7, '5000'),
(2068, 0, 126, 8, '5000'),
(2069, 0, 126, 9, '5000'),
(2070, 0, 126, 10, '3000'),
(2071, 0, 126, 11, '30'),
(2072, 0, 126, 12, '500'),
(2073, 0, 126, 10, '3000'),
(2074, 0, 126, 11, '30'),
(2075, 0, 126, 12, '500'),
(2076, 0, 126, 10, '3000'),
(2077, 0, 126, 11, '30'),
(2078, 0, 126, 12, '500'),
(2079, 0, 126, 1, '20000000'),
(2080, 0, 126, 2, '50'),
(2081, 0, 126, 3, '50'),
(2082, 0, 126, 4, '50'),
(2083, 0, 126, 5, '1000'),
(2084, 0, 126, 6, '5000'),
(2085, 0, 126, 7, '5000'),
(2086, 0, 126, 8, '5000'),
(2087, 0, 126, 9, '5000'),
(2088, 0, 126, 10, '3000'),
(2089, 0, 126, 11, '30'),
(2090, 0, 126, 12, '500'),
(2091, 1, 127, 1, '20000000'),
(2092, 1, 127, 2, '50'),
(2093, 1, 127, 3, '50'),
(2094, 1, 127, 4, '50'),
(2095, 1, 127, 5, '1000'),
(2096, 1, 127, 6, '5000'),
(2097, 1, 127, 7, '5000'),
(2098, 1, 127, 8, '5000'),
(2099, 1, 127, 9, '5000'),
(2100, 1, 127, 10, '3000'),
(2101, 1, 127, 11, '30'),
(2102, 1, 127, 12, '500'),
(2103, 2, 127, 10, '3000'),
(2104, 2, 127, 11, '30'),
(2105, 2, 127, 12, '500'),
(2106, 3, 127, 10, '3000'),
(2107, 3, 127, 11, '30'),
(2108, 3, 127, 12, '500'),
(2109, 4, 127, 10, '3000'),
(2110, 4, 127, 11, '30'),
(2111, 4, 127, 12, '500'),
(2112, 2, 127, 1, '20000000'),
(2113, 2, 127, 2, '50'),
(2114, 2, 127, 3, '50'),
(2115, 2, 127, 4, '50'),
(2116, 2, 127, 5, '1000'),
(2117, 2, 127, 6, '5000'),
(2118, 2, 127, 7, '5000'),
(2119, 2, 127, 8, '5000'),
(2120, 2, 127, 9, '5000'),
(2121, 2, 127, 10, '3000'),
(2122, 2, 127, 11, '30'),
(2123, 2, 127, 12, '500'),
(2124, 3, 127, 10, '3000'),
(2125, 3, 127, 11, '30'),
(2126, 3, 127, 12, '500'),
(2127, 3, 127, 1, '20000000'),
(2128, 3, 127, 2, '50'),
(2129, 3, 127, 3, '50'),
(2130, 3, 127, 4, '50'),
(2131, 3, 127, 5, '1000'),
(2132, 3, 127, 6, '5000'),
(2133, 3, 127, 7, '5000'),
(2134, 3, 127, 8, '5000'),
(2135, 3, 127, 9, '5000'),
(2136, 3, 127, 10, '3000'),
(2137, 3, 127, 11, '30'),
(2138, 3, 127, 12, '500'),
(2139, 4, 127, 10, '3000'),
(2140, 4, 127, 11, '30'),
(2141, 4, 127, 12, '500'),
(2142, 4, 127, 10, '3000'),
(2143, 4, 127, 11, '30'),
(2144, 4, 127, 12, '500'),
(2145, 4, 127, 1, '20000000'),
(2146, 4, 127, 2, '50'),
(2147, 4, 127, 3, '50'),
(2148, 4, 127, 4, '50'),
(2149, 4, 127, 5, '1000'),
(2150, 4, 127, 6, '5000'),
(2151, 4, 127, 7, '5000'),
(2152, 4, 127, 8, '5000'),
(2153, 4, 127, 9, '5000'),
(2154, 4, 127, 10, '3000'),
(2155, 4, 127, 11, '30'),
(2156, 4, 127, 12, '500');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_team_region_factors`
--

CREATE TABLE IF NOT EXISTS `tbl_team_region_factors` (
  `id` int(6) NOT NULL,
  `region_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `factory_capacity` int(11) NOT NULL,
  `storage_capacity_ic` int(11) NOT NULL,
  `storage_capacity_ec1` int(11) DEFAULT NULL,
  `storage_capacity_ec2` int(11) DEFAULT NULL,
  `storage_capacity_dc` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_team_region_factors`
--

INSERT INTO `tbl_team_region_factors` (`id`, `region_id`, `team_id`, `factory_capacity`, `storage_capacity_ic`, `storage_capacity_ec1`, `storage_capacity_ec2`, `storage_capacity_dc`) VALUES
(1, 1, 3, 1111, 1111, NULL, NULL, NULL),
(2, 2, 3, 0, 1111222, NULL, NULL, NULL),
(3, 3, 3, 0, 3232, NULL, NULL, NULL),
(4, 4, 3, 0, 12121, NULL, NULL, NULL),
(5, 1, 10, 111, 111, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_team_result_records`
--

CREATE TABLE IF NOT EXISTS `tbl_team_result_records` (
  `id` int(16) NOT NULL,
  `money` int(16) NOT NULL,
  `eco_credit` int(16) NOT NULL,
  `so_credit` int(16) NOT NULL,
  `me_credit` int(16) NOT NULL,
  `team_id` int(16) NOT NULL COMMENT 'fk',
  `round_id` int(16) NOT NULL COMMENT 'fk'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_team_result_records`
--

INSERT INTO `tbl_team_result_records` (`id`, `money`, `eco_credit`, `so_credit`, `me_credit`, `team_id`, `round_id`) VALUES
(8, 0, 22222, 3333, 44444, 3, 0),
(7, 2222, 22222, 33333, 44444, 4, 0),
(9, 23132, 1212, 1212, 212, 7, 0),
(10, 1111, 111, 111, 111, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transport_costs`
--

CREATE TABLE IF NOT EXISTS `tbl_transport_costs` (
  `id` int(16) NOT NULL,
  `from_region_id` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'fk',
  `to_region_id` varchar(16) COLLATE utf8_bin NOT NULL COMMENT 'fk',
  `cost` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id` int(16) NOT NULL,
  `account` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `role` int(16) NOT NULL,
  `team_id` int(16) NOT NULL COMMENT 'fk',
  `user_type` int(1) DEFAULT NULL,
  `avarta_link` varchar(100) COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `account`, `password`, `name`, `email`, `role`, `team_id`, `user_type`, `avarta_link`) VALUES
(1, 'master', '123456', 'Game Master', 'gpem2014_phuc.dh@student.vgu.edu.vn', 1, 0, 1, NULL),
(63, 'demo', '123456', 'demo', 'phucsystem@gmail.com', 1, 126, 2, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  ADD PRIMARY KEY (`affiliate_id`);

--
-- Indexes for table `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  ADD PRIMARY KEY (`affiliate_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  ADD PRIMARY KEY (`affiliate_transaction_id`);

--
-- Indexes for table `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Indexes for table `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Indexes for table `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Indexes for table `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Indexes for table `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Indexes for table `oc_banner_image_description`
--
ALTER TABLE `oc_banner_image_description`
  ADD PRIMARY KEY (`banner_image_id`,`language_id`);

--
-- Indexes for table `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Indexes for table `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Indexes for table `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Indexes for table `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Indexes for table `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Indexes for table `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `oc_customer_ban_ip`
--
ALTER TABLE `oc_customer_ban_ip`
  ADD PRIMARY KEY (`customer_ban_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Indexes for table `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Indexes for table `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Indexes for table `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Indexes for table `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Indexes for table `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Indexes for table `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Indexes for table `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Indexes for table `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Indexes for table `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Indexes for table `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Indexes for table `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Indexes for table `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Indexes for table `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Indexes for table `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Indexes for table `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Indexes for table `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Indexes for table `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Indexes for table `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Indexes for table `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Indexes for table `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Indexes for table `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Indexes for table `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Indexes for table `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Indexes for table `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Indexes for table `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Indexes for table `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indexes for table `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Indexes for table `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  ADD PRIMARY KEY (`order_custom_field_id`);

--
-- Indexes for table `oc_order_fraud`
--
ALTER TABLE `oc_order_fraud`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Indexes for table `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indexes for table `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`);

--
-- Indexes for table `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Indexes for table `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Indexes for table `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Indexes for table `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Indexes for table `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Indexes for table `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Indexes for table `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Indexes for table `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Indexes for table `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Indexes for table `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Indexes for table `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Indexes for table `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Indexes for table `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Indexes for table `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Indexes for table `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Indexes for table `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Indexes for table `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Indexes for table `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Indexes for table `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Indexes for table `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Indexes for table `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Indexes for table `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Indexes for table `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Indexes for table `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Indexes for table `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  ADD PRIMARY KEY (`url_alias_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Indexes for table `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Indexes for table `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Indexes for table `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Indexes for table `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Indexes for table `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Indexes for table `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Indexes for table `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Indexes for table `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- Indexes for table `tbl_components`
--
ALTER TABLE `tbl_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_component_materials`
--
ALTER TABLE `tbl_component_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_customer_factors`
--
ALTER TABLE `tbl_customer_factors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_events`
--
ALTER TABLE `tbl_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_game`
--
ALTER TABLE `tbl_game`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_game_allowances`
--
ALTER TABLE `tbl_game_allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_game_setting`
--
ALTER TABLE `tbl_game_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_improvement`
--
ALTER TABLE `tbl_improvement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_market_inforrmations`
--
ALTER TABLE `tbl_market_inforrmations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_players`
--
ALTER TABLE `tbl_players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product_components`
--
ALTER TABLE `tbl_product_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_recycle_components`
--
ALTER TABLE `tbl_recycle_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_recycle_methods`
--
ALTER TABLE `tbl_recycle_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_regions`
--
ALTER TABLE `tbl_regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_rounds`
--
ALTER TABLE `tbl_rounds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_round_settings`
--
ALTER TABLE `tbl_round_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sales_data`
--
ALTER TABLE `tbl_sales_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sale_data`
--
ALTER TABLE `tbl_sale_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_storages`
--
ALTER TABLE `tbl_storages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_teams`
--
ALTER TABLE `tbl_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_team_action_records`
--
ALTER TABLE `tbl_team_action_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_team_factors`
--
ALTER TABLE `tbl_team_factors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_team_region_factors`
--
ALTER TABLE `tbl_team_region_factors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_team_result_records`
--
ALTER TABLE `tbl_team_result_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_transport_costs`
--
ALTER TABLE `tbl_transport_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  MODIFY `affiliate_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  MODIFY `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  MODIFY `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=258;
--
-- AUTO_INCREMENT for table `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_customer_ban_ip`
--
ALTER TABLE `oc_customer_ban_ip`
  MODIFY `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=428;
--
-- AUTO_INCREMENT for table `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  MODIFY `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=441;
--
-- AUTO_INCREMENT for table `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2352;
--
-- AUTO_INCREMENT for table `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=227;
--
-- AUTO_INCREMENT for table `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=546;
--
-- AUTO_INCREMENT for table `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=440;
--
-- AUTO_INCREMENT for table `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=284;
--
-- AUTO_INCREMENT for table `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  MODIFY `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=844;
--
-- AUTO_INCREMENT for table `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4225;
--
-- AUTO_INCREMENT for table `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT for table `tbl_components`
--
ALTER TABLE `tbl_components`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1398;
--
-- AUTO_INCREMENT for table `tbl_component_materials`
--
ALTER TABLE `tbl_component_materials`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3655;
--
-- AUTO_INCREMENT for table `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_customer_factors`
--
ALTER TABLE `tbl_customer_factors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17488;
--
-- AUTO_INCREMENT for table `tbl_events`
--
ALTER TABLE `tbl_events`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=208;
--
-- AUTO_INCREMENT for table `tbl_game`
--
ALTER TABLE `tbl_game`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=250;
--
-- AUTO_INCREMENT for table `tbl_game_allowances`
--
ALTER TABLE `tbl_game_allowances`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_game_setting`
--
ALTER TABLE `tbl_game_setting`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_improvement`
--
ALTER TABLE `tbl_improvement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_market_inforrmations`
--
ALTER TABLE `tbl_market_inforrmations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_players`
--
ALTER TABLE `tbl_players`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `tbl_product_components`
--
ALTER TABLE `tbl_product_components`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=911;
--
-- AUTO_INCREMENT for table `tbl_recycle_components`
--
ALTER TABLE `tbl_recycle_components`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_recycle_methods`
--
ALTER TABLE `tbl_recycle_methods`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4555;
--
-- AUTO_INCREMENT for table `tbl_regions`
--
ALTER TABLE `tbl_regions`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17413;
--
-- AUTO_INCREMENT for table `tbl_rounds`
--
ALTER TABLE `tbl_rounds`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `tbl_round_settings`
--
ALTER TABLE `tbl_round_settings`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `tbl_sales_data`
--
ALTER TABLE `tbl_sales_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `tbl_sale_data`
--
ALTER TABLE `tbl_sale_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_storages`
--
ALTER TABLE `tbl_storages`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=427;
--
-- AUTO_INCREMENT for table `tbl_teams`
--
ALTER TABLE `tbl_teams`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=128;
--
-- AUTO_INCREMENT for table `tbl_team_action_records`
--
ALTER TABLE `tbl_team_action_records`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=427;
--
-- AUTO_INCREMENT for table `tbl_team_factors`
--
ALTER TABLE `tbl_team_factors`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2157;
--
-- AUTO_INCREMENT for table `tbl_team_region_factors`
--
ALTER TABLE `tbl_team_region_factors`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_team_result_records`
--
ALTER TABLE `tbl_team_result_records`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_transport_costs`
--
ALTER TABLE `tbl_transport_costs`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=64;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
