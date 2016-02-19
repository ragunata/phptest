-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2015 at 06:39 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hobitel`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE IF NOT EXISTS `activities` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `created`, `modified`, `name`, `alias`, `is_active`) VALUES
(1, '2015-01-09 03:06:24', '2015-01-09 03:06:55', 'Skiing', 'skiing', 1),
(2, '2015-01-09 03:06:34', '2015-01-09 03:07:00', 'Mountain climbing', 'mountain-climbing', 1),
(3, '2015-01-09 03:07:27', '2015-01-09 03:07:27', 'driving', 'driving', 1),
(4, '2015-01-09 03:07:39', '2015-01-09 03:07:39', 'trekking', 'trekking', 1),
(5, '2015-01-09 03:07:51', '2015-01-09 03:07:51', 'boating', 'boating', 1),
(6, '2015-01-09 03:08:53', '2015-01-09 03:08:53', 'Beach', 'beach', 1),
(7, '2015-01-09 03:09:01', '2015-01-09 03:09:01', 'Resort', 'resort', 1),
(8, '2015-01-09 03:09:06', '2015-01-09 03:09:06', 'Airport', 'airport', 1),
(9, '2015-01-09 03:09:14', '2015-01-09 03:09:14', 'railway station', 'railway-station', 1),
(10, '2015-01-09 03:09:24', '2015-01-09 03:09:24', 'it park', 'it-park', 1),
(11, '2015-01-09 03:09:46', '2015-01-09 03:09:46', 'cricket statium', 'cricket-statium', 1),
(12, '2015-01-09 03:09:55', '2015-01-09 03:09:55', 'football court', 'football-court', 1),
(13, '2015-01-09 03:10:04', '2015-01-09 03:10:04', 'park', 'park', 1),
(14, '2015-04-29 11:41:32', '2015-04-29 11:41:32', 'sear test', 'sear-test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `activity_cities`
--

CREATE TABLE IF NOT EXISTS `activity_cities` (
`id` bigint(20) NOT NULL,
  `activity_id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `city_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE IF NOT EXISTS `activity_logs` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `user_type` int(11) NOT NULL COMMENT '1-Admin,2-Hotel user,3-Site user',
  `model` int(11) NOT NULL COMMENT 'Modules',
  `model_id` bigint(11) NOT NULL COMMENT 'auto increament id of the model',
  `action` varchar(255) NOT NULL COMMENT 'performance for the log. Ex: Add/Edit/Change password',
  `comments` varchar(255) NOT NULL COMMENT 'description of the log',
  `ip` varchar(255) NOT NULL,
  `browser_info` text NOT NULL,
  `is_deleted` tinyint(1) NOT NULL COMMENT '1-Deleted'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE IF NOT EXISTS `amenities` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_dir` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_info` text COLLATE utf8_unicode_ci NOT NULL,
  `iconic_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hotel_mapped_count` bigint(11) NOT NULL COMMENT 'Total count of all hotels mapped',
  `offer_mapped_count` bigint(11) NOT NULL COMMENT 'Total count of all offer mapped',
  `is_featured` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT '1-Active,0-Inactive'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=42 ;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `created`, `modified`, `name`, `alias`, `image_name`, `image_dir`, `image_info`, `iconic_code`, `hotel_mapped_count`, `offer_mapped_count`, `is_featured`, `is_active`) VALUES
(1, '2015-01-09 01:39:56', '2015-01-09 01:39:56', 'Laundry', 'laundry', 'laundry.png', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"laundry.png";s:9:"file_type";s:9:"image/png";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:67:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/laundry.png";s:8:"raw_name";s:7:"laundry";s:9:"orig_name";s:11:"laundry.png";s:11:"client_name";s:11:"laundry.png";s:8:"file_ext";s:4:".png";s:9:"file_size";d:4.339999999999999857891452847979962825775146484375;s:8:"is_image";b:1;s:11:"image_width";i:29;s:12:"image_height";i:37;s:10:"image_type";s:3:"png";s:14:"image_size_str";s:22:"width="29" height="37"";}}', '', 5, 0, 0, 1),
(2, '2015-01-09 01:48:57', '2015-01-09 01:48:57', 'Resort', 'resort', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 4, 0, 0, 1),
(3, '2015-01-09 01:49:20', '2015-01-09 01:49:20', 'Private Beach', 'private-beach', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 5, 0, 0, 1),
(4, '2015-01-09 01:49:28', '2015-01-09 01:49:28', 'Terrace Theatre', 'terrace-theatre', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 4, 0, 0, 1),
(5, '2015-01-09 01:49:38', '2015-01-09 01:49:38', 'Swimming Pool', 'swimming-pool', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 6, 0, 0, 1),
(6, '2015-01-09 01:49:47', '2015-01-09 01:49:47', 'Social Lounge', 'social-lounge', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 5, 0, 0, 1),
(7, '2015-01-09 01:49:59', '2015-01-09 01:49:59', 'Garden', 'garden', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 4, 0, 0, 1),
(8, '2015-01-09 01:50:42', '2015-01-09 01:50:42', 'dining', 'dining', 'dining.png', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:10:"dining.png";s:9:"file_type";s:9:"image/png";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:66:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/dining.png";s:8:"raw_name";s:6:"dining";s:9:"orig_name";s:10:"dining.png";s:11:"client_name";s:10:"dining.png";s:8:"file_ext";s:4:".png";s:9:"file_size";d:3.95999999999999996447286321199499070644378662109375;s:8:"is_image";b:1;s:11:"image_width";i:34;s:12:"image_height";i:33;s:10:"image_type";s:3:"png";s:14:"image_size_str";s:22:"width="34" height="33"";}}', '', 5, 0, 0, 1),
(9, '2015-01-09 01:51:01', '2015-01-09 01:51:01', 'fride-microwave', 'fride-microwave', 'fride-microwave.png', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:19:"fride-microwave.png";s:9:"file_type";s:9:"image/png";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:75:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/fride-microwave.png";s:8:"raw_name";s:15:"fride-microwave";s:9:"orig_name";s:19:"fride-microwave.png";s:11:"client_name";s:19:"fride-microwave.png";s:8:"file_ext";s:4:".png";s:9:"file_size";d:3.12999999999999989341858963598497211933135986328125;s:8:"is_image";b:1;s:11:"image_width";i:32;s:12:"image_height";i:33;s:10:"image_type";s:3:"png";s:14:"image_size_str";s:22:"width="32" height="33"";}}', '', 2, 0, 0, 1),
(10, '2015-01-09 01:51:17', '2015-01-09 01:51:17', 'gym', 'gym', 'gym.png', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:7:"gym.png";s:9:"file_type";s:9:"image/png";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:63:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/gym.png";s:8:"raw_name";s:3:"gym";s:9:"orig_name";s:7:"gym.png";s:11:"client_name";s:7:"gym.png";s:8:"file_ext";s:4:".png";s:9:"file_size";d:3.560000000000000053290705182007513940334320068359375;s:8:"is_image";b:1;s:11:"image_width";i:40;s:12:"image_height";i:34;s:10:"image_type";s:3:"png";s:14:"image_size_str";s:22:"width="40" height="34"";}}', '', 4, 0, 0, 1),
(11, '2015-01-09 01:51:39', '2015-01-09 01:51:39', 'Hair saloon', 'hair-saloon', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 2, 0, 0, 1),
(12, '2015-01-09 01:52:11', '2015-01-09 01:52:11', 'spa and beauty', 'spa-and-beauty', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 6, 0, 0, 1),
(13, '2015-01-09 01:52:31', '2015-01-09 01:52:31', 'swimming', 'swimming', 'swimming.png', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"swimming.png";s:9:"file_type";s:9:"image/png";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:68:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/swimming.png";s:8:"raw_name";s:8:"swimming";s:9:"orig_name";s:12:"swimming.png";s:11:"client_name";s:12:"swimming.png";s:8:"file_ext";s:4:".png";s:9:"file_size";d:3.75;s:8:"is_image";b:1;s:11:"image_width";i:40;s:12:"image_height";i:34;s:10:"image_type";s:3:"png";s:14:"image_size_str";s:22:"width="40" height="34"";}}', '', 0, 0, 0, 1),
(14, '2015-01-09 01:52:51', '2015-01-09 01:52:51', 'wi-fi', 'wi-fi', 'wi-fi.png', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:9:"wi-fi.png";s:9:"file_type";s:9:"image/png";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:65:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/wi-fi.png";s:8:"raw_name";s:5:"wi-fi";s:9:"orig_name";s:9:"wi-fi.png";s:11:"client_name";s:9:"wi-fi.png";s:8:"file_ext";s:4:".png";s:9:"file_size";d:3.20000000000000017763568394002504646778106689453125;s:8:"is_image";b:1;s:11:"image_width";i:29;s:12:"image_height";i:28;s:10:"image_type";s:3:"png";s:14:"image_size_str";s:22:"width="29" height="28"";}}', '', 4, 0, 0, 1),
(15, '2015-01-09 02:20:55', '2015-01-09 02:20:55', 'Hair dryer', 'hair-dryer', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 0, 0, 0, 1),
(16, '2015-01-09 02:58:07', '2015-01-09 02:58:07', 'Health and leisure', 'health-and-leisure', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 2, 0, 0, 1),
(17, '2015-01-09 02:58:30', '2015-01-09 02:58:30', 'pub', 'pub', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 0, 0, 0, 1),
(18, '2015-01-09 02:58:46', '2015-01-09 02:58:46', 'travel desk', 'travel-desk', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 0, 0, 0, 1),
(19, '2015-01-09 02:59:11', '2015-01-09 02:59:11', 'fitness centre', 'fitness-centre', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 0, 0, 0, 1),
(20, '2015-01-09 03:00:52', '2015-01-09 03:00:52', 'air-conditioned', 'air-conditioned', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 1, 0, 0, 1),
(21, '2015-01-09 03:01:08', '2015-01-09 03:01:08', 'reading light', 'reading-light', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 1, 0, 0, 1),
(22, '2015-01-09 03:01:30', '2015-01-09 03:01:30', 'walk-In closet', 'walk-in-closet', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 1, 0, 0, 1),
(23, '2015-01-09 03:01:50', '2015-01-09 03:01:50', 'luxury Collection', 'luxury-collection', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 2, 0, 0, 1),
(24, '2015-01-09 03:02:15', '2015-01-09 03:02:15', 'satellite channels', 'satellite-channels', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 2, 0, 0, 1),
(25, '2015-01-09 03:02:50', '2015-01-09 03:02:50', 'wake-up service', 'wake-up-service', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 0, 0, 0, 1),
(26, '2015-01-09 03:03:01', '2015-01-09 03:03:01', 'Jogging map', 'jogging-map', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 1, 0, 0, 1),
(27, '2015-01-09 03:03:25', '2015-01-09 03:03:25', 'baby bottle warmer', 'baby-bottle-warmer', '', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:0:"";s:9:"file_type";s:0:"";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:9:"full_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/amneties/";s:8:"raw_name";s:0:"";s:9:"orig_name";s:0:"";s:11:"client_name";s:0:"";s:8:"file_ext";s:0:"";s:9:"file_size";s:0:"";s:8:"is_image";b:0;s:11:"image_width";s:0:"";s:12:"image_height";s:0:"";s:10:"image_type";s:0:"";s:14:"image_size_str";s:0:"";}}', '', 0, 0, 0, 1),
(28, '2015-01-13 11:29:43', '2015-01-13 11:34:47', 'bar', 'bar', 'ima.jpg', 'app_data/amneties/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:7:"ima.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/amneties/";s:9:"full_path";s:55:"/home/development/php/hobitel/app_data/amneties/ima.jpg";s:8:"raw_name";s:3:"ima";s:9:"orig_name";s:7:"ima.jpg";s:11:"client_name";s:7:"ima.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:57.93999999999999772626324556767940521240234375;s:8:"is_image";b:1;s:11:"image_width";i:800;s:12:"image_height";i:1204;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="800" height="1204"";}}', '', 1, 0, 0, 1),
(29, '2015-01-20 07:55:14', '2015-01-20 07:55:14', '6y car wash', '6y-car-wash', '', '', '', '', 0, 0, 0, 0),
(30, '2015-01-20 07:56:43', '2015-01-20 07:56:43', 'Shark feeding', 'shark-feeding', '', '', '', '', 0, 0, 0, 0),
(36, '2015-02-17 02:34:15', '2015-02-17 02:34:15', 'Air-cooler', 'air-cooler', '', '', '', '', 0, 0, 0, 0),
(38, '2015-02-23 10:45:20', '2015-02-23 10:45:20', 'Disco', 'disco', '', '', '', '', 1, 0, 0, 0),
(40, '2015-02-23 11:35:43', '2015-02-23 12:14:51', 'Club', 'club', '', '', '', '', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `amenity_request`
--

CREATE TABLE IF NOT EXISTS `amenity_request` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `amenity_id` bigint(20) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `request_type` tinyint(1) NOT NULL COMMENT '1-offer 2 -hotel',
  `status` tinyint(1) NOT NULL COMMENT '0-inactive,1-Active'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE IF NOT EXISTS `areas` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `pincode` int(11) NOT NULL,
  `latitude` float(10,6) NOT NULL,
  `longtitude` float(10,6) NOT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT '1-Active,0-Inactive'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `created`, `modified`, `name`, `alias`, `city_id`, `state_id`, `country_id`, `pincode`, `latitude`, `longtitude`, `is_active`) VALUES
(1, '2015-01-09 03:15:41', '2015-01-09 03:15:41', 'nungambakkam', '', 201, 128, 4, 0, 13.081604, 80.275185, 1),
(2, '2015-01-12 03:21:31', '2015-01-12 03:21:31', 'Bell Gardens', '', 15, 5, 5, 0, 34.052235, -118.243683, 1),
(3, '2015-01-12 03:57:01', '2015-01-12 03:57:01', 'Mortemart', '', 1423, 598, 3, 0, 45.833618, 1.261105, 1),
(4, '2015-01-31 12:46:19', '2015-01-31 12:46:19', 'Ice District', '', 4008, 1061, 5, 0, 61.321388, -149.567780, 1),
(5, '2015-02-16 12:20:44', '2015-02-16 12:20:44', 'Kodambakkam', '', 201, 128, 4, 0, 13.082680, 80.270721, 1);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_dir` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_info` text COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL COMMENT 'order by show the records',
  `is_active` tinyint(1) NOT NULL COMMENT '1-Active,0-Inactive'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `created`, `modified`, `name`, `image_name`, `image_dir`, `image_info`, `priority`, `is_active`) VALUES
(1, '2015-03-14 10:39:54', '0000-00-00 00:00:00', 'gdfgdfgdf', '2.jpg', 'app_data/banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:5:"2.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:55:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/banners/";s:9:"full_path";s:60:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/banners/2.jpg";s:8:"raw_name";s:1:"2";s:9:"orig_name";s:5:"2.jpg";s:11:"client_name";s:5:"2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:209.979999999999989768184605054557323455810546875;s:8:"is_image";b:1;s:11:"image_width";i:1800;s:12:"image_height";i:700;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1800" height="700"";}}', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE IF NOT EXISTS `bids` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `offer_id` bigint(20) NOT NULL,
  `bid_amount` double(10,2) NOT NULL,
  `bid_value` double(10,2) NOT NULL,
  `bid_status` tinyint(1) NOT NULL COMMENT '1- booked, 2- dropped, 3-Lost, 4-Buyed, 5-Cancelled(After Buy),6-Cancelled',
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `browser_info` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`id`, `created`, `modified`, `user_id`, `offer_id`, `bid_amount`, `bid_value`, `bid_status`, `ip`, `browser_info`, `is_active`) VALUES
(1, '2015-05-14 08:57:13', '2015-05-14 10:30:02', 6, 3, 98.00, 610.00, 0, '', '', 1),
(3, '2015-05-14 10:29:24', '2015-05-14 10:29:49', 6, 19, 4575.00, 453.00, 0, '', '', 1),
(4, '2015-05-14 10:54:10', '2015-05-14 10:54:28', 6, 7, 450.00, 122.00, 0, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `calendar_events`
--

CREATE TABLE IF NOT EXISTS `calendar_events` (
`id` bigint(11) NOT NULL,
  `created` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` float NOT NULL,
  `longtitude` float NOT NULL,
  `center_of_city` bigint(20) NOT NULL,
  `featured_city` tinyint(1) NOT NULL COMMENT '1-Featured City,0-No Featured',
  `priority` int(100) NOT NULL,
  `activity_id` text COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `population` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_dir` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_home_city` tinyint(1) NOT NULL,
  `is_home` tinyint(1) NOT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT '1-Active,0-Inactive'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=79681 ;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `created`, `modified`, `name`, `alias`, `state_id`, `country_id`, `code`, `latitude`, `longtitude`, `center_of_city`, `featured_city`, `priority`, `activity_id`, `currency`, `population`, `language`, `city_image`, `image_dir`, `is_home_city`, `is_home`, `is_completed`, `is_active`) VALUES
(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mountain View', '', 5, 5, '', 37.42, -122.06, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Beijing', '', 6, 2, '', 39.93, 116.39, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ackworth', '', 9, 5, '', 41.36, -93.43, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Far Rockaway', '', 10, 5, '', 40.61, -73.79, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hebei', '', 11, 2, '', 39.89, 115.28, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Los Angeles', '', 5, 5, '', 34.04, -118.25, 0, 1, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nanjing', '', 12, 2, '', 32.06, 118.78, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(18, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sunnyvale', '', 5, 5, '', 37.42, -122.01, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(20, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Newark', '', 14, 5, '', 40.74, -74.17, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Malden', '', 15, 5, '', 42.43, -71.05, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Trumbull', '', 16, 5, '', 41.26, -73.21, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Guangzhou', '', 17, 2, '', 23.12, 113.25, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cupertino', '', 5, 5, '', 37.3, -122.09, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fort Lauderdale', '', 19, 5, '', 26.1, -80.27, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'South Amboy', '', 14, 5, '', 40.48, -74.29, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Keller', '', 24, 5, '', 32.93, -97.25, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(34, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Long Island City', '', 10, 5, '', 40.74, -73.94, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(38, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Brooklyn', '', 10, 5, '', 40.69, -73.99, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(39, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Army Post Office', '', 28, 5, '', 56, -100, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mesquite', '', 24, 5, '', 32.76, -96.61, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(44, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mc Minnville', '', 32, 5, '', 35.65, -85.73, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(45, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Flatwoods', '', 33, 5, '', 38.5, -82.73, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(46, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saint-maur-des-fossaos', '', 34, 3, '', 48.8, 2.5, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(47, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bogart', '', 35, 5, '', 33.91, -83.52, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(48, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cedar Hill', '', 24, 5, '', 32.59, -96.97, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saeo Gonasalo', '', 37, 1, '', -22.8, -43.03, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Levittown', '', 10, 5, '', 40.72, -73.52, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(53, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cornelia', '', 35, 5, '', 34.5, -83.58, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(61, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Des Plaines', '', 44, 5, '', 42, -87.9, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(63, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fortaleza', '', 46, 1, '', -3.32, -41.42, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(64, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Denver', '', 47, 5, '', 39.75, -105, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(65, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shenzhen', '', 17, 2, '', 22.53, 114.13, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wenzhou', '', 48, 2, '', 28.02, 120.65, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(67, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Riverton', '', 49, 5, '', 40.48, -112.01, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(72, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shenyang', '', 52, 2, '', 41.79, 123.43, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(77, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gurgaon', '', 56, 4, '', 28.47, 77.03, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(78, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Glen Burnie', '', 57, 5, '', 39.16, -76.6, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(81, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Miami', '', 19, 5, '', 25.81, -80.24, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(83, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chicago', '', 44, 5, '', 41.88, -87.63, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(87, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shanghai', '', 62, 2, '', 31, 121.41, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(90, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tianjin', '', 64, 2, '', 39.14, 117.18, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(99, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Evansdale', '', 9, 5, '', 42.49, -92.29, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(102, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Houston', '', 24, 5, '', 29.8, -95.42, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(106, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dongguan', '', 17, 2, '', 23.05, 113.74, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(107, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anderson', '', 72, 5, '', 34.48, -82.68, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(108, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bozeman', '', 73, 5, '', 45.71, -111.06, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(112, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Marksville', '', 76, 5, '', 31.18, -92.02, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(113, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Xiamen', '', 77, 2, '', 24.47, 118.09, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(114, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Billerica', '', 15, 5, '', 42.55, -71.26, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(116, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Florianaspolis', '', 78, 1, '', -27.58, -48.57, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(118, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vitasria', '', 80, 1, '', -20.32, -40.35, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(121, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Memphis', '', 32, 5, '', 35.03, -89.78, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(125, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Seattle', '', 84, 5, '', 47.58, -122.3, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(126, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hyderabad', '', 85, 4, '', 17.38, 78.47, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(128, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Prospect', '', 87, 5, '', 40.9, -80.08, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(132, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nanning', '', 90, 2, '', 22.82, 108.32, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(133, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bellevue', '', 84, 5, '', 47.6, -122.16, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(135, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Apollo Beach', '', 19, 5, '', 27.77, -82.41, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(138, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Elgin', '', 44, 5, '', 42.03, -88.3, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(139, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cherryville', '', 93, 5, '', 35.39, -81.39, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(141, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jiazhuang', '', 94, 2, '', 37.26, 117.08, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(144, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chongqing', '', 97, 2, '', 29.56, 106.55, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(145, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jinan', '', 94, 2, '', 36.67, 117, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(146, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Grand Blanc', '', 98, 5, '', 42.92, -83.65, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(147, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4iana', '', 87, 5, '', 40.62, -79.15, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(148, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wuhan', '', 99, 2, '', 30.58, 114.27, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(149, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Delhi', '', 100, 4, '', 28.67, 77.22, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(150, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Morrilton', '', 101, 5, '', 35.17, -92.74, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(154, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sharon', '', 15, 5, '', 42.11, -71.18, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(155, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pompton Lakes', '', 14, 5, '', 41, -74.28, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(158, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Eau Claire', '', 107, 5, '', 44.79, -91.54, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(160, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saint Petersburg', '', 19, 5, '', 27.63, -82.7, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(162, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hangzhou', '', 48, 2, '', 30.26, 120.17, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(165, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mount Holly', '', 14, 5, '', 39.99, -74.79, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(166, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'G4ou', '', 112, 3, '', 44.63, 1.27, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(167, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chaoyang', '', 52, 2, '', 41.57, 120.46, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(174, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Daqing', '', 52, 2, '', 41.72, 123.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(176, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Meulan', '', 116, 3, '', 49.02, 1.9, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(184, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Salvador', '', 121, 1, '', -12.98, -38.52, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(187, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Atlanta', '', 35, 5, '', 33.8, -84.39, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(188, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Harbin', '', 123, 2, '', 45.75, 126.65, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(190, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hopkins', '', 72, 5, '', 33.91, -80.83, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(197, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Paris', '', 101, 5, '', 35.28, -93.72, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(198, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cary', '', 93, 5, '', 35.78, -78.82, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Southgate', '', 98, 5, '', 42.21, -83.21, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(201, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chennai', '', 128, 4, '', 11.1271, 78.6569, 0, 1, 0, '7,14,4', '', '', '', '', '', 0, 0, 0, 1),
(202, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Viola', '', 101, 5, '', 36.38, -92, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(203, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Euclid', '', 129, 5, '', 41.57, -81.53, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(204, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Benton', '', 101, 5, '', 34.59, -92.67, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(208, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rio Rancho', '', 132, 5, '', 35.25, -106.72, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(210, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hutchinson', '', 133, 5, '', 38.13, -97.93, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(212, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Montgomery', '', 87, 5, '', 41.18, -76.95, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(213, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Colorado Springs', '', 47, 5, '', 38.83, -104.74, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(214, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Moriarty', '', 132, 5, '', 34.96, -106, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(218, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vail', '', 47, 5, '', 39.64, -106.32, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(221, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sandy', '', 136, 5, '', 45.38, -122.18, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(223, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fennville', '', 98, 5, '', 42.57, -86.11, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(224, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Agra', '', 138, 4, '', 27.18, 78.02, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(227, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kearney', '', 140, 5, '', 40.76, -99.02, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(230, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kittanning', '', 87, 5, '', 40.81, -79.42, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(233, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ripley', '', 143, 5, '', 38.79, -81.68, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(234, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Norwood', '', 15, 5, '', 42.18, -71.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(238, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alexandria', '', 144, 5, '', 38.81, -77.13, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(244, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Richmond', '', 144, 5, '', 37.54, -77.48, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(245, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Belton', '', 145, 5, '', 38.78, -94.55, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(250, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Laurel', '', 148, 5, '', 31.7, -89.11, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(252, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lolo', '', 73, 5, '', 46.73, -114.36, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(253, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Peoria', '', 44, 5, '', 40.69, -89.59, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(257, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Iowa City', '', 9, 5, '', 41.64, -91.46, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(258, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pawtucket', '', 151, 5, '', 41.87, -71.39, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(259, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Madison', '', 107, 5, '', 43.07, -89.39, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(260, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Toledo', '', 129, 5, '', 41.71, -83.54, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(269, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Woodbridge', '', 144, 5, '', 38.65, -77.31, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(270, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Suzhou', '', 12, 2, '', 31.31, 120.62, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(272, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saeo Paulo', '', 155, 1, '', -23.53, -46.62, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(273, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Henan', '', 156, 2, '', 37.9, 112.19, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(276, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lishui', '', 48, 2, '', 28.11, 119.56, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(278, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bangalore', '', 160, 4, '', 12.98, 77.58, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(280, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Zhongxin', '', 161, 2, '', 26.97, 109.77, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(283, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rolla', '', 145, 5, '', 37.93, -91.78, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(285, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shelby', '', 93, 5, '', 35.36, -81.57, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(286, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Carbondale', '', 47, 5, '', 39.18, -107.23, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(287, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Decatur', '', 35, 5, '', 33.69, -84.25, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(290, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Baltimore', '', 57, 5, '', 39.34, -76.69, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(291, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kokomo', '', 163, 5, '', 40.44, -86.09, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(296, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Broken Arrow', '', 164, 5, '', 36.06, -95.81, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(300, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Taiyaaan', '', 156, 2, '', 37.73, 112.47, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(312, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Raleigh', '', 93, 5, '', 35.93, -78.72, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(313, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Greenville', '', 72, 5, '', 34.86, -82.25, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(317, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saint Paul', '', 175, 5, '', 45.07, -93.19, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(318, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fort Mitchell', '', 176, 5, '', 32.29, -84.97, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(319, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Akron', '', 129, 5, '', 41.07, -81.54, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(321, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Zhongyuan', '', 178, 2, '', 19.14, 110.48, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(327, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Stamford', '', 16, 5, '', 41.08, -73.54, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(328, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Phoenix', '', 181, 5, '', 33.43, -112.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(330, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Viroflay', '', 34, 3, '', 48.8, 2.17, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(331, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chengdu', '', 182, 2, '', 30.67, 104.07, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(332, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Putian', '', 77, 2, '', 25.44, 119.01, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(334, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'New Palestine', '', 163, 5, '', 39.73, -85.89, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(336, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Caldwell', '', 129, 5, '', 39.73, -81.51, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(337, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dundalk', '', 57, 5, '', 39.26, -76.5, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(340, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Minneapolis', '', 175, 5, '', 45.03, -93.3, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(344, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Brookings', '', 186, 5, '', 44.33, -96.81, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(348, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Las Cruces', '', 132, 5, '', 32.35, -106.77, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(349, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mumbai', '', 187, 4, '', 18.98, 72.83, 0, 1, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(362, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Las Vegas', '', 192, 5, '', 36.08, -115.09, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(366, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fuzhou', '', 77, 2, '', 26.06, 119.31, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(367, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hazelwood', '', 145, 5, '', 38.79, -90.38, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(368, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Moncks Corner', '', 72, 5, '', 33.12, -80.04, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(372, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Xian', '', 11, 2, '', 40.29, 117.65, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(374, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bothell', '', 84, 5, '', 47.84, -122.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(376, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Changge', '', 196, 2, '', 34.22, 113.77, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(378, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Qingdao', '', 94, 2, '', 36.1, 120.37, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(379, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gilbert', '', 181, 5, '', 33.32, -111.76, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(392, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sioux Falls', '', 186, 5, '', 43.52, -96.73, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(398, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jinhua', '', 48, 2, '', 29.11, 119.65, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(400, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Richmond', '', 33, 5, '', 37.77, -84.3, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(404, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Thana', '', 187, 4, '', 19.2, 72.97, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(405, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Thiruvananthapuram', '', 206, 4, '', 8.51, 76.96, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(408, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Huntsville', '', 176, 5, '', 34.64, -86.75, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(410, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Carter Lake', '', 9, 5, '', 41.29, -95.92, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(411, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tupelo', '', 148, 5, '', 34.22, -88.77, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(413, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Menomonie', '', 107, 5, '', 44.85, -92, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(422, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Weare', '', 215, 5, '', 43.08, -71.72, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(427, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Amite', '', 76, 5, '', 30.73, -90.61, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(428, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Norfolk', '', 144, 5, '', 36.89, -76.27, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(432, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Portland', '', 218, 5, '', 43.69, -70.29, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(439, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Honolulu', '', 220, 5, '', 21.3, -157.79, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(443, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Overland Park', '', 133, 5, '', 38.92, -94.7, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(452, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Durg', '', 225, 4, '', 21.18, 81.28, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(456, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Williamston', '', 98, 5, '', 42.68, -84.27, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(459, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tempe', '', 181, 5, '', 33.44, -111.92, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(460, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kennewick', '', 84, 5, '', 46.08, -119.09, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(463, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Birmingham', '', 176, 5, '', 33.51, -86.8, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(477, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Coquille', '', 136, 5, '', 43.2, -124.12, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(479, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hefei', '', 236, 2, '', 31.86, 117.28, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(480, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gardnerville', '', 192, 5, '', 38.92, -119.8, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(483, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Changsha', '', 161, 2, '', 28.18, 113.11, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(485, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Salt Lake City', '', 49, 5, '', 40.71, -111.86, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(491, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Quitman', '', 76, 5, '', 32.35, -92.72, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(493, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'W4sor', '', 16, 5, '', 41.86, -72.68, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(498, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Paris', '', 34, 3, '', 48.87, 2.33, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(503, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fort Wayne', '', 163, 5, '', 40.98, -85.12, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(505, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Moulton', '', 176, 5, '', 34.46, -87.3, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(510, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sierra Vista', '', 181, 5, '', 31.59, -110.17, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(511, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Valparaiso', '', 163, 5, '', 41.46, -87.14, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(518, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Washington', '', 249, 5, '', 38.91, -77.08, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(527, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gatlinburg', '', 32, 5, '', 35.67, -83.46, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(530, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dover', '', 254, 5, '', 39.16, -75.49, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(533, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lexington', '', 33, 5, '', 37.99, -84.49, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(536, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Olney', '', 57, 5, '', 39.15, -77.08, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(548, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Calcutta', '', 258, 4, '', 22.57, 88.37, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(551, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Knoxville', '', 32, 5, '', 36.06, -83.91, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(567, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nasik', '', 187, 4, '', 19.98, 73.8, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(578, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'New Delhi', '', 100, 4, '', 28.6, 77.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(582, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Xian', '', 268, 2, '', 34.26, 108.94, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(597, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3ziers Bottom', '', 143, 5, '', 38.6, -82.03, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(599, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pune', '', 187, 4, '', 18.53, 73.87, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(601, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4ore', '', 274, 4, '', 22.72, 75.83, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(622, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Foshan', '', 17, 2, '', 23.03, 113.12, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(625, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ahmadabad', '', 284, 4, '', 23.03, 72.62, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(631, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lawrence', '', 133, 5, '', 39.04, -95.21, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(642, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'New Orleans', '', 76, 5, '', 29.96, -90.08, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(647, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Columbia', '', 145, 5, '', 39.04, -92.27, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(655, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lucknow', '', 138, 4, '', 26.85, 80.92, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(660, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Waukesha', '', 107, 5, '', 42.94, -88.3, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(667, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Belfort', '', 296, 3, '', 47.63, 6.87, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(683, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bhopal', '', 274, 4, '', 23.27, 77.4, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(690, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Middleton', '', 305, 5, '', 43.74, -116.58, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(691, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jaipur', '', 306, 4, '', 26.92, 75.82, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(692, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tiruchchirappalli', '', 128, 4, '', 10.81, 78.69, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(695, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lenexa', '', 133, 5, '', 38.95, -94.75, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(696, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hulun', '', 307, 2, '', 49.2, 119.7, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(711, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Strasbourg', '', 315, 3, '', 48.58, 7.75, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(712, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pahala', '', 220, 5, '', 19.2, -155.5, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(718, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cuttack', '', 317, 4, '', 20.5, 85.83, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(722, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Visakhapatnam', '', 85, 4, '', 17.7, 83.3, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(723, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pocatello', '', 305, 5, '', 42.91, -112.4, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(735, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vanceburg', '', 33, 5, '', 38.51, -83.41, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(739, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bristol', '', 16, 5, '', 41.68, -72.94, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(748, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rajkot', '', 284, 4, '', 22.3, 70.78, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(752, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Meerut', '', 138, 4, '', 28.98, 77.7, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(771, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Muzaffarnagar', '', 138, 4, '', 29.47, 77.68, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(776, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Changchun', '', 334, 2, '', 43.88, 125.32, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(780, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Suri', '', 258, 4, '', 23.92, 87.53, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(784, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vijayawada', '', 85, 4, '', 16.52, 80.62, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(788, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saint Cloud', '', 175, 5, '', 45.49, -94.23, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(801, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Madurai', '', 128, 4, '', 9.93, 78.12, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(803, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ewa Beach', '', 220, 5, '', 21.35, -158.02, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(811, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vadodara', '', 284, 4, '', 22.3, 73.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(830, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ranchi', '', 355, 4, '', 23.35, 85.33, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(848, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chandigarh', '', 363, 4, '', 30.74, 76.79, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(858, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Montrouge', '', 34, 3, '', 48.82, 2.32, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(861, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tulsa', '', 164, 5, '', 36.14, -95.94, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(867, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Newalla', '', 164, 5, '', 35.35, -97.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(878, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ludhiana', '', 377, 4, '', 30.9, 75.85, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(907, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Surat', '', 284, 4, '', 20.97, 72.9, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(909, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Karimnagar', '', 85, 4, '', 18.43, 79.15, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(923, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hillsboro', '', 136, 5, '', 45.51, -122.94, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(930, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Thanjavur', '', 128, 4, '', 10.8, 79.15, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(947, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sa¨te', '', 409, 3, '', 43.4, 3.68, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(952, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kapurthala', '', 377, 4, '', 31.38, 75.38, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(960, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Silchar', '', 416, 4, '', 24.82, 92.8, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(987, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bourges', '', 431, 3, '', 47.08, 2.4, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(988, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Zhengzhou', '', 196, 2, '', 34.68, 113.53, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(994, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Portland', '', 136, 5, '', 45.59, -122.71, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1018, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bhubaneswar', '', 317, 4, '', 20.23, 85.83, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1044, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Keaau', '', 220, 5, '', 19.58, -155.02, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1047, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tours', '', 431, 3, '', 47.38, 0.68, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1060, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Faridabad', '', 56, 4, '', 28.43, 77.32, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1063, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jacarea­', '', 155, 1, '', -23.32, -45.97, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1068, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Celles-sur-ource', '', 469, 3, '', 48.08, 4.4, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1072, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Traobeurden', '', 471, 3, '', 48.77, -3.57, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1088, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Haora', '', 258, 4, '', 22.59, 88.31, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1121, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sacy-le-grand', '', 116, 3, '', 49.35, 2.55, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1126, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Langfang', '', 11, 2, '', 39.51, 116.69, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1157, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lamorlaye', '', 116, 3, '', 49.15, 2.43, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1163, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Brewer', '', 218, 5, '', 44.78, -68.74, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1197, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Niederroedern', '', 315, 3, '', 48.9, 8.05, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1214, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Beauvais', '', 116, 3, '', 49.43, 2.08, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1221, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kolkata', '', 258, 4, '', 22.57, 88.37, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1242, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lyon', '', 544, 3, '', 45.75, 4.85, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1257, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Henderson', '', 192, 5, '', 36.03, -115.07, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1258, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Coursan', '', 409, 3, '', 43.23, 3.07, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1275, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Zudausques', '', 555, 3, '', 50.75, 2.15, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1279, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nancy', '', 556, 3, '', 48.68, 6.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1288, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Piracicaba', '', 155, 1, '', -22.72, -47.63, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1291, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Porto Alegre', '', 561, 1, '', -30.03, -51.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1293, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nogent-le-roi', '', 431, 3, '', 48.65, 1.53, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1297, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Grillon', '', 563, 3, '', 44.4, 4.93, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1300, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Haryana', '', 56, 4, '', 29.62, 76.98, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1345, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rennes', '', 471, 3, '', 48.08, -1.68, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1353, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cuzieu', '', 544, 3, '', 45.62, 4.27, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1361, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Haikou', '', 178, 2, '', 20.05, 110.34, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1364, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tassin-la-demi-lune', '', 544, 3, '', 45.77, 4.78, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1372, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cuers', '', 563, 3, '', 43.23, 6.07, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1374, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Belo Horizonte', '', 586, 1, '', -19.92, -43.93, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1376, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kota', '', 306, 4, '', 25.18, 75.83, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1380, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mieussy', '', 544, 3, '', 46.15, 6.53, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1390, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Amritsar', '', 377, 4, '', 31.63, 74.87, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1393, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kochi', '', 206, 4, '', 9.97, 76.23, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1410, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bauru', '', 155, 1, '', -22.32, -49.07, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1418, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Circle Pines', '', 175, 5, '', 45.17, -93.12, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1423, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limoges', '', 598, 3, '', 45.85, 1.25, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1432, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Guiyang', '', 600, 2, '', 26.58, 106.72, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1479, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lille', '', 555, 3, '', 50.63, 3.07, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1506, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Martigues', '', 563, 3, '', 43.4, 5.05, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1507, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fleury-les-au1is', '', 431, 3, '', 47.93, 1.92, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1523, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aubevoye', '', 635, 3, '', 49.15, 1.33, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1533, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Thalassery', '', 206, 4, '', 11.75, 75.49, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1575, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angoulaeme', '', 649, 3, '', 45.65, 0.15, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1584, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Guwahati', '', 416, 4, '', 26.18, 91.73, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1611, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kannur', '', 206, 4, '', 11.87, 75.37, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1618, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pauvres', '', 469, 3, '', 49.42, 4.5, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1627, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dubois', '', 667, 5, '', 43.49, -109.64, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1641, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mangaluru', '', 160, 4, '', 12.86, 74.84, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1659, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wilmington', '', 254, 5, '', 39.72, -75.53, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1662, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Beausoleil', '', 563, 3, '', 43.75, 7.43, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1663, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vapi', '', 676, 4, '', 20.37, 72.9, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1686, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bruguia¨res', '', 112, 3, '', 43.73, 1.42, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1687, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Olive 1nch', '', 148, 5, '', 34.92, -89.82, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1713, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wheeling', '', 143, 5, '', 40.06, -80.64, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1758, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Joinville', '', 78, 1, '', -26.3, -48.83, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1760, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Raymond', '', 215, 5, '', 43.03, -71.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1761, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Altamira', '', 701, 1, '', -3.2, -52.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1763, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nashua', '', 215, 5, '', 42.73, -71.46, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1770, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Valady', '', 112, 3, '', 44.45, 2.43, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1778, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Taizhou', '', 12, 2, '', 32.49, 119.91, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1786, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lisieux', '', 708, 3, '', 49.15, 0.23, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1789, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hampstead', '', 215, 5, '', 42.88, -71.17, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1822, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sigean', '', 409, 3, '', 43.03, 2.98, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1851, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rio De Janeiro', '', 37, 1, '', -22.9, -43.23, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1856, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Patna', '', 728, 4, '', 25.6, 85.12, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1857, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Laruscade', '', 729, 3, '', 45.12, -0.33, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1867, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Niterasi', '', 37, 1, '', -22.88, -43.09, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1899, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saeo Leopoldo', '', 561, 1, '', -29.77, -51.15, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1902, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Biddeford', '', 218, 5, '', 43.5, -70.49, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1906, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Balma', '', 112, 3, '', 43.62, 1.5, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1908, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Le Recoux', '', 409, 3, '', 44.33, 3.15, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1917, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dewas', '', 274, 4, '', 22.97, 76.07, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1939, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'La Chapelle', '', 469, 3, '', 48.33, 4.05, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1976, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fernley', '', 192, 5, '', 39.67, -119.07, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(1982, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Camps', '', 598, 3, '', 44.98, 2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2003, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Delhi Paharganj', '', 100, 4, '', 28.62, 77.22, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2007, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lambersart', '', 555, 3, '', 50.65, 3.03, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2022, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dole', '', 296, 3, '', 47.1, 5.5, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2026, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Irati', '', 773, 1, '', -25.48, -50.65, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2067, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Arras', '', 555, 3, '', 50.28, 2.78, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2103, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Brive-la-gaillarde', '', 598, 3, '', 45.15, 1.53, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2133, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Servilly', '', 798, 3, '', 46.28, 3.6, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2182, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Baltic', '', 186, 5, '', 43.74, -96.76, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2188, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ol4a', '', 808, 1, '', -8.02, -34.85, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2194, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yellapur', '', 160, 4, '', 14.97, 74.72, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2209, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Berwick', '', 218, 5, '', 43.3, -70.84, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2221, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Norman', '', 164, 5, '', 35.25, -97.46, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2235, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Metzeral', '', 315, 3, '', 48.02, 7.07, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2240, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Claymont', '', 254, 5, '', 39.8, -75.46, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2274, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Angers', '', 822, 3, '', 47.47, -0.55, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2285, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sandpoint', '', 305, 5, '', 48.34, -116.45, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2290, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Uberlacndia', '', 586, 1, '', -18.92, -48.3, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2338, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Boise', '', 305, 5, '', 43.55, -116.29, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2372, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Manaus', '', 838, 1, '', -3.11, -60.03, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2374, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sonipat', '', 56, 4, '', 28.98, 77.02, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2385, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Laramie', '', 667, 5, '', 41.43, -105.52, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2395, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Besanason', '', 296, 3, '', 47.25, 6.03, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2400, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1sa­lia', '', 842, 1, '', -15.78, -47.92, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2456, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saeo Josao', '', 78, 1, '', -27.63, -48.65, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2526, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jackson', '', 148, 5, '', 32.33, -90.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2568, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Santa Fe', '', 132, 5, '', 35.68, -105.96, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2681, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rezonville', '', 556, 3, '', 49.1, 6, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2725, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ogden', '', 49, 5, '', 41.22, -111.97, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2741, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fleet Post Office', '', 28, 5, '', 57, -100, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2766, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Orem', '', 49, 5, '', 40.29, -111.72, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2864, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jandun', '', 469, 3, '', 49.65, 4.55, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2908, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Blumenau', '', 78, 1, '', -26.93, -49.05, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2973, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bismarck', '', 924, 5, '', 46.82, -100.71, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(2990, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Prigonrieux', '', 729, 3, '', 44.85, 0.4, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3024, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Baodaoe', '', 471, 3, '', 48.18, -1.95, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1);
INSERT INTO `cities` (`id`, `created`, `modified`, `name`, `alias`, `state_id`, `country_id`, `code`, `latitude`, `longtitude`, `center_of_city`, `featured_city`, `priority`, `activity_id`, `currency`, `population`, `language`, `city_image`, `image_dir`, `is_home_city`, `is_home`, `is_completed`, `is_active`) VALUES
(3029, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Clermont-ferrand', '', 798, 3, '', 45.78, 3.08, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3045, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lincoln', '', 140, 5, '', 40.83, -96.67, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3057, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Woonsocket', '', 186, 5, '', 44.05, -98.3, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3071, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Guaorande', '', 822, 3, '', 47.33, -2.43, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3073, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Curitiba', '', 773, 1, '', -25.42, -49.25, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3079, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Recife', '', 808, 1, '', -8.05, -34.9, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3082, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Auxerre', '', 937, 3, '', 47.8, 3.57, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3093, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jaboataeo', '', 808, 1, '', -8.12, -35.02, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3104, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Omaha', '', 140, 5, '', 41.29, -96.17, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3107, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cariacica', '', 80, 1, '', -20.27, -40.42, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3122, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anshan', '', 52, 2, '', 41.12, 122.99, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3145, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Metz', '', 556, 3, '', 49.13, 6.17, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3162, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Belaom', '', 701, 1, '', -1.45, -48.48, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3202, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Zaozhuang', '', 94, 2, '', 34.86, 117.55, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3239, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kalispell', '', 73, 5, '', 48.2, -114.39, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3253, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Beatrice', '', 140, 5, '', 40.26, -96.71, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3275, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jackson', '', 667, 5, '', 43.46, -110.51, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3281, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ferrisburg', '', 959, 5, '', 44.21, -73.22, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3324, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Scott Depot', '', 143, 5, '', 38.45, -81.89, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3397, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Westerly', '', 151, 5, '', 41.36, -71.8, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3400, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Goiacnia', '', 970, 1, '', -16.67, -49.27, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3416, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jalandhar', '', 377, 4, '', 31.33, 75.58, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3514, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mulhouse', '', 315, 3, '', 47.75, 7.33, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3568, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jilin', '', 334, 2, '', 43.85, 126.56, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3620, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Valdoie', '', 296, 3, '', 47.67, 6.85, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3668, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shimla', '', 1008, 4, '', 31.1, 77.17, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3682, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nagar', '', 306, 4, '', 27.43, 77.1, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3685, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aracaju', '', 1011, 1, '', -10.92, -37.07, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3778, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Itaboraa­', '', 37, 1, '', -22.75, -42.87, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3792, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Guipavas', '', 471, 3, '', 48.43, -4.4, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3893, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Daman', '', 676, 4, '', 20.42, 72.85, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3897, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Camden Wyoming', '', 254, 5, '', 39.08, -75.61, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(3991, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nantes', '', 822, 3, '', 47.22, -1.55, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4008, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Eagle River', '', 1061, 5, '', 61.21, -149.26, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4017, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Montreuil-bellay', '', 822, 3, '', 47.13, -0.15, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4046, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Juziers', '', 635, 3, '', 49, 1.85, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4071, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Flers', '', 708, 3, '', 48.75, -0.57, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4087, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Raipur', '', 225, 4, '', 21.23, 81.63, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4103, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Viamaeo', '', 561, 1, '', -30.08, -51.03, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4116, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saint-pierre-du-palais', '', 649, 3, '', 45.17, -0.15, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4158, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chalon-sur-saane', '', 937, 3, '', 46.78, 4.85, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4166, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hebei', '', 6, 2, '', 39.82, 115.94, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4219, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Woonsocket', '', 151, 5, '', 42, -71.49, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4274, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rouen', '', 635, 3, '', 49.43, 1.08, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4282, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gillette', '', 667, 5, '', 43.9, -105.55, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4290, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rai', '', 708, 3, '', 48.75, 0.58, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4324, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ponta Porae', '', 1102, 1, '', -22.53, -55.72, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4331, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bellaeme', '', 708, 3, '', 48.37, 0.57, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4370, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Le Havre', '', 635, 3, '', 49.5, 0.13, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4384, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Beawar', '', 306, 4, '', 26.1, 74.32, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4435, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hombourg-haut', '', 556, 3, '', 49.13, 6.77, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4446, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dijon', '', 937, 3, '', 47.32, 5.02, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4490, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lamarche-sur-saane', '', 937, 3, '', 47.27, 5.38, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4533, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gulbarga', '', 160, 4, '', 17.33, 76.83, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4674, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lajeado', '', 561, 1, '', -29.45, -51.97, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4717, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Livingston', '', 73, 5, '', 45.71, -110.54, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4795, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Seward', '', 1061, 5, '', 60.06, -149.34, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4810, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Providence', '', 151, 5, '', 41.83, -71.4, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4820, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Caruaru', '', 808, 1, '', -8.28, -35.97, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4827, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Castelo', '', 80, 1, '', -20.6, -41.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4894, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ychoux', '', 729, 3, '', 44.33, -0.95, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4912, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Marsac', '', 729, 3, '', 45.05, -0.68, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4958, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Juneau', '', 1061, 5, '', 58.58, -134.77, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4977, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Paranoai', '', 842, 1, '', -15.83, -47.82, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(4978, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Perpezac-le-noir', '', 598, 3, '', 45.32, 1.55, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(5012, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Issoire', '', 798, 3, '', 45.55, 3.25, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(5119, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Thouars', '', 649, 3, '', 46.97, -0.22, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(5152, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kunming', '', 1178, 2, '', 25.04, 102.72, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(5273, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Beihai', '', 90, 2, '', 21.48, 109.1, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(5436, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fairbanks', '', 1061, 5, '', 64.82, -147.72, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(5483, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saint-julien-l''ars', '', 649, 3, '', 46.55, 0.5, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(5496, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wuxi', '', 12, 2, '', 31.58, 120.29, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(5510, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dehra Dun', '', 1200, 4, '', 30.32, 78.03, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(5537, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shillong', '', 1203, 4, '', 25.58, 91.87, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(5602, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chambre', '', 798, 3, '', 45.2, 2.37, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(5713, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cachoeiro De Itapemirim', '', 80, 1, '', -20.85, -41.1, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(5809, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nanchang', '', 1231, 2, '', 28.55, 115.93, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(5936, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Londrina', '', 773, 1, '', -23.3, -51.15, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(6013, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lyndonville', '', 959, 5, '', 44.53, -72.05, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(6122, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sibsagar', '', 416, 4, '', 26.98, 94.63, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(6246, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Barre', '', 959, 5, '', 44.18, -72.47, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(6325, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Natal', '', 1269, 1, '', -5.78, -35.22, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(6409, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kumar', '', 1008, 4, '', 33.03, 76.45, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(6537, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Contagem', '', 586, 1, '', -19.92, -44.1, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(6724, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Caja zeiras', '', 1293, 1, '', -6.9, -38.57, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(6780, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Simaµes', '', 1297, 1, '', -7.6, -40.82, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(6781, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Qinghai', '', 600, 2, '', 25.81, 106.07, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(6868, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shangdi', '', 77, 2, '', 26.13, 117.98, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(6906, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Devils Lake', '', 924, 5, '', 48.14, -98.89, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(6988, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lanzhou', '', 1310, 2, '', 36.06, 103.79, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(7006, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jatni', '', 317, 4, '', 20.17, 85.7, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(7024, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kundan', '', 1312, 4, '', 33.8, 74.26, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(7055, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hubei', '', 1231, 2, '', 26.89, 114.53, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(7105, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jamshedpur', '', 355, 4, '', 22.8, 86.18, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(7235, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Teresina', '', 1297, 1, '', -5.08, -42.82, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(7251, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Colva', '', 1334, 4, '', 15.27, 73.92, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(7311, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saeo Lua­s', '', 1335, 1, '', -2.52, -44.27, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(7349, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Itabira', '', 586, 1, '', -19.62, -43.22, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(7496, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shelburne', '', 959, 5, '', 44.4, -73.21, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(7688, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'West Fargo', '', 924, 5, '', 46.89, -96.93, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(7720, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fargo', '', 924, 5, '', 46.93, -96.83, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(7747, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Uniaeo Da Victoria', '', 773, 1, '', -26.22, -51.08, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(8089, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Parto Seguro', '', 121, 1, '', -16.43, -39.08, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(8200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Barpeta', '', 416, 4, '', 26.32, 91, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(8304, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Solon', '', 1008, 4, '', 30.92, 77.12, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(8479, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Haldwani', '', 1200, 4, '', 29.22, 79.52, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(8747, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Campina Grande', '', 1293, 1, '', -7.22, -35.88, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(8828, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Joaeo Pessoa', '', 1293, 1, '', -7.12, -34.87, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(8881, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Campo Grande', '', 1102, 1, '', -20.45, -54.62, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(9077, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jiaozuo', '', 196, 2, '', 35.24, 113.23, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(9299, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tongzhou', '', 6, 2, '', 39.91, 116.6, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(9322, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Udhampur', '', 1312, 4, '', 32.93, 75.13, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(9417, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Panaji', '', 1334, 4, '', 15.48, 73.83, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(9446, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Muzaffarpur', '', 728, 4, '', 26.12, 85.4, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(9548, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rondonaspolis', '', 1457, 1, '', -16.47, -54.63, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(10162, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ajaccio', '', 1483, 3, '', 41.92, 8.73, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(10196, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Itanagar', '', 1334, 4, '', 27.1, 93.62, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(10354, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Beg5rai', '', 728, 4, '', 25.42, 86.13, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(10358, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jaypur', '', 317, 4, '', 18.85, 82.58, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(10739, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Crato', '', 46, 1, '', -7.23, -39.38, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(10936, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Guarabira', '', 1293, 1, '', -6.85, -35.48, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(11046, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Biguglia', '', 1483, 3, '', 42.62, 9.42, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(11180, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tabuleiro Do Norte', '', 46, 1, '', -5.25, -38.12, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(12462, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jiujiang', '', 1231, 2, '', 29.62, 115.88, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(12661, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Madgaon', '', 1334, 4, '', 15.3, 73.95, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(12805, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Maceias', '', 1568, 1, '', -9.67, -35.72, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(13310, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bhilai', '', 225, 4, '', 21.22, 81.43, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(13326, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rishikesh', '', 1200, 4, '', 30.12, 78.32, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(13333, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Haridwar', '', 1200, 4, '', 29.97, 78.17, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(13413, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Murici', '', 1568, 1, '', -9.32, -35.93, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(13597, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pondicherry', '', 1596, 4, '', 11.93, 79.83, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(13652, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anaipolis', '', 970, 1, '', -16.33, -48.97, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(13669, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lichuan', '', 99, 2, '', 30.3, 108.85, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(13687, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Juazeiro Do Norte', '', 46, 1, '', -7.2, -39.33, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(13749, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Furiani', '', 1483, 3, '', 42.65, 9.42, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(13880, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Macau', '', 1269, 1, '', -5.12, -36.63, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(13884, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Xianyang', '', 268, 2, '', 34.34, 108.71, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(14005, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hunyuan', '', 156, 2, '', 39.7, 113.68, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(14628, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Speloncato', '', 1483, 3, '', 42.57, 8.97, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(15367, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Imphal', '', 1654, 4, '', 24.82, 93.95, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(15812, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jammu', '', 1312, 4, '', 32.73, 74.87, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(15961, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Salvador', '', 1673, 1, '', -10.17, -48.87, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(16094, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anan4eua', '', 701, 1, '', -1.37, -48.38, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(16190, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fengtai', '', 6, 2, '', 39.85, 116.27, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(16259, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hengyang', '', 161, 2, '', 26.89, 112.61, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(16264, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ujjain', '', 274, 4, '', 23.18, 75.77, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(16275, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dhanbad', '', 355, 4, '', 23.8, 86.45, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(16378, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Itabuna', '', 121, 1, '', -14.8, -39.27, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(17737, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bonfim', '', 1714, 1, '', 3.08, -59.95, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(17979, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yalongwan', '', 178, 2, '', 18.23, 109.7, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(18098, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Luziacnia', '', 970, 1, '', -16.25, -47.93, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(18197, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ji-paranai', '', 1723, 1, '', -10.83, -61.97, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(18611, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bokaro', '', 355, 4, '', 23.78, 85.97, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(18695, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Liaohe', '', 307, 2, '', 43.73, 122.3, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(18796, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lhasa', '', 1736, 2, '', 29.65, 91.1, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(18997, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yuzhou', '', 196, 2, '', 34.16, 113.46, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(19012, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yinchuan', '', 1741, 2, '', 38.47, 106.27, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(19021, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tongji', '', 182, 2, '', 31.18, 103.5, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(19030, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jingzhou', '', 99, 2, '', 30.35, 112.19, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(19032, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Camaasari', '', 121, 1, '', -12.48, -38.22, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(19039, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Enshi', '', 99, 2, '', 30.3, 109.48, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(19061, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kaitai', '', 600, 2, '', 26.23, 109.13, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(19239, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'aeraamqi', '', 1751, 2, '', 43.8, 87.58, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(19263, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Delhi Sabzimandi', '', 100, 4, '', 28.68, 77.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(19269, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Huangzhong', '', 1753, 2, '', 36.5, 101.6, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(19498, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Liaoyaaan', '', 334, 2, '', 43.51, 123.51, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(19523, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yaannan', '', 1178, 2, '', 25.48, 100.58, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(19552, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1zlacndia', '', 842, 1, '', -15.68, -48.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(19955, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Samastipur', '', 728, 4, '', 25.85, 85.78, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(20013, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fortaleza', '', 1673, 1, '', -5.98, -48.13, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(20245, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Baotou', '', 178, 2, '', 18.33, 109.53, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(20337, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nanping', '', 97, 2, '', 29.09, 106.99, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(20370, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jiahe', '', 161, 2, '', 25.55, 112.25, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(20435, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ning', '', 1310, 2, '', 35.5, 107.92, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(20537, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mandi', '', 1008, 4, '', 31.72, 76.92, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(20756, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mudanjiang', '', 123, 2, '', 44.58, 129.6, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(20908, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chaaan', '', 90, 2, '', 25.95, 111.07, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(20937, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Baodi', '', 64, 2, '', 39.72, 117.3, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(21166, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aizawl', '', 1791, 4, '', 23.72, 92.72, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(21220, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Srinagar', '', 1312, 4, '', 34.09, 74.8, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(21470, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kashi', '', 1751, 2, '', 39.45, 75.98, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(21536, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Japoatae', '', 1011, 1, '', -10.33, -36.8, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(21544, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Itumbiara', '', 970, 1, '', -18.42, -49.22, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(21578, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Youyi', '', 123, 2, '', 46.78, 131.81, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(21700, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mianyang', '', 182, 2, '', 31.47, 104.77, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(21729, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Longnan', '', 1231, 2, '', 24.9, 114.78, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(22243, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shannan', '', 268, 2, '', 33.53, 110.87, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(22740, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saeo Bernardo', '', 1335, 1, '', -3.37, -42.4, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(22772, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fenghua', '', 334, 2, '', 43.3, 124.33, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(22793, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yongkang', '', 156, 2, '', 37.63, 112.59, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(23243, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tianheng', '', 90, 2, '', 22.49, 110.04, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(23889, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wuwei', '', 1310, 2, '', 37.93, 102.64, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(24182, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Palmas', '', 1673, 1, '', -10.22, -48.28, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(24533, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Baoding', '', 11, 2, '', 38.85, 115.49, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(24777, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tefao', '', 838, 1, '', -3.37, -64.7, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(24819, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Xiangshan', '', 182, 2, '', 31.04, 105.19, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(25071, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Haiyan', '', 1753, 2, '', 36.89, 101, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(25097, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nova Ola­mpia', '', 1457, 1, '', -14.82, -57.33, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(25359, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Silvassa', '', 1846, 4, '', 20.27, 73.02, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(25466, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lasa', '', 1736, 2, '', 29.65, 91.1, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(25778, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Huhehot', '', 307, 2, '', 40.81, 111.65, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(25784, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Karaikal', '', 1596, 4, '', 10.92, 79.83, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(25786, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Korba', '', 225, 4, '', 22.35, 82.68, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(26150, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Santo Antanio', '', 1269, 1, '', -6.3, -35.45, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(26530, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shizuishan', '', 1741, 2, '', 39.04, 106.4, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(26916, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Xining', '', 1753, 2, '', 36.62, 101.77, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(26930, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Xinyuan', '', 1751, 2, '', 43.45, 83.15, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(26936, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fengxiang', '', 268, 2, '', 34.52, 107.39, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(28156, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hong', '', 1874, 4, '', 27.57, 93.85, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(28562, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gannan', '', 123, 2, '', 47.91, 123.5, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(29140, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dong', '', 1178, 2, '', 28.5, 98.87, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(29678, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Santa Isabel Do Parai', '', 701, 1, '', -1.27, -48.18, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(29818, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cuiabai', '', 1457, 1, '', -15.58, -56.08, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(30811, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jiayuguan', '', 1310, 2, '', 39.82, 98.3, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(31103, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Parnaa­ba', '', 1297, 1, '', -2.91, -41.77, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(32167, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pudong', '', 62, 2, '', 31.24, 121.5, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(32668, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Agartala', '', 1918, 4, '', 23.84, 91.28, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(33109, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saeo Josao De Ribamar', '', 1335, 1, '', -2.55, -44.05, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(33154, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ceilacndia', '', 842, 1, '', -15.82, -48.12, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(34046, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Marechal Deodoro', '', 1568, 1, '', -9.72, -35.9, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(34232, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kaiyuan', '', 1178, 2, '', 23.71, 103.25, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(34757, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Taiping', '', 97, 2, '', 29.9, 106.04, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(35007, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Eldorado', '', 1102, 1, '', -23.78, -54.32, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(35293, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wuma', '', 600, 2, '', 27.64, 106.25, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(35792, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Parto Velho', '', 1723, 1, '', -8.77, -63.9, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(37024, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jing', '', 1751, 2, '', 44.65, 82.83, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(37198, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Daan', '', 97, 2, '', 29.38, 106.01, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(41443, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Huochezhan', '', 1741, 2, '', 38.96, 106.47, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(41456, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Zhangpu', '', 236, 2, '', 32.76, 118.79, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(41651, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shou', '', 236, 2, '', 32.57, 116.77, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(41664, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Xiangyang', '', 236, 2, '', 29.93, 117.94, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(41822, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kecheng', '', 1753, 2, '', 37.08, 97.69, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(41856, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lang', '', 1736, 2, '', 29.05, 93.2, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(41872, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Putuo', '', 62, 2, '', 31.24, 121.42, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(41885, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yuan', '', 62, 2, '', 31.53, 121.84, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(41907, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jianming', '', 64, 2, '', 39, 117.31, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(47012, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tanggu', '', 64, 2, '', 39.02, 117.65, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(62773, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tongliao', '', 307, 2, '', 43.61, 122.27, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(62786, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Huibei', '', 1741, 2, '', 38.98, 106.65, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(63095, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nima', '', 1736, 2, '', 31.92, 87.88, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(63323, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lagarto', '', 1011, 1, '', -10.9, -37.68, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(63341, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rio Verde De Mato Grosso', '', 1102, 1, '', -18.93, -54.87, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(64681, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saeo Miguel Dos Campos', '', 1568, 1, '', -9.78, -36.08, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66383, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Saeo Paulo', '', 2113, 1, '', -23.53, -46.62, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66490, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mercaes', '', 2116, 1, '', -9.52, -68.7, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66621, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cacoal', '', 1723, 1, '', -11.5, -61.42, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66622, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rio 1nco', '', 2116, 1, '', -9.97, -67.8, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66623, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ariquemes', '', 1723, 1, '', -9.93, -63.07, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66654, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Imperatriz', '', 1335, 1, '', -5.53, -47.48, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66696, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Barra Do Garasas', '', 1457, 1, '', -15.88, -52.25, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66701, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mossoras', '', 1269, 1, '', -5.19, -37.34, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66702, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Macapai', '', 2113, 1, '', 0.03, -51.05, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66713, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Paidua', '', 838, 1, '', -7.33, -62.92, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66726, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Caracaraa­', '', 1714, 1, '', 1.83, -61.13, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66727, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Boa Vista', '', 1714, 1, '', 2.82, -60.67, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66739, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Araguaa­na', '', 1673, 1, '', -7.16, -48.06, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66741, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Cocal', '', 1297, 1, '', -3.47, -41.57, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66752, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jaolia', '', 838, 1, '', -1.62, -67.98, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(66936, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Oiapoque', '', 2113, 1, '', 3.83, -51.83, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(67011, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Consolaasaeo', '', 1714, 1, '', 3.93, -60.98, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(75883, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gangtok', '', 2320, 4, '', 27.33, 88.62, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(79675, '2015-02-24 05:19:50', '2015-02-24 05:19:50', 'Leipzig', '', 2372, 6, '', 51.1045, 13.2017, 0, 0, 0, '8,6,5', '', '', '', '', '', 0, 0, 0, 1),
(79131, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Minas Gerais', '', 2116, 1, '', -8.97, -72.78, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(79674, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Washington D.c', '', 249, 5, '', 38.9, -77.04, 0, 0, 0, '', '', '', '', '', '', 0, 0, 0, 1),
(79676, '2015-02-24 05:20:10', '2015-02-24 05:20:10', 'Pirna', '', 2372, 6, '', 51.1045, 13.2017, 0, 1, 0, '8,6,5', '', '', '', '', '', 0, 0, 0, 1),
(79677, '2015-02-24 05:20:34', '2015-02-24 05:20:34', 'Freiberg', '', 2372, 6, '', 52.52, 13.405, 0, 1, 0, '8,6,5', '', '', '', '', '', 0, 0, 0, 1),
(79678, '2015-02-24 05:24:54', '2015-02-24 05:24:54', 'Halle', '', 2372, 6, '', 51.1045, 13.2017, 0, 1, 0, '0', '', '', '', '', '', 0, 0, 0, 1),
(79679, '2015-02-24 05:25:41', '2015-02-24 05:25:41', 'Hamburg', '', 2373, 6, '', 53.5511, 9.99368, 0, 1, 0, '8,6,5', 'INR', '400000', 'English', 'maxresdefault.jpg', 'app_data/cities/', 1, 0, 0, 1),
(79680, '2015-02-24 05:39:19', '2015-02-24 05:39:19', 'Berlin', '', 2371, 6, '', 52.52, 13.405, 0, 1, 0, '7,1,4', 'Dollar ($)', '450', 'Hindi', 'city.jpg', 'app_data/cities/', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `city_images`
--

CREATE TABLE IF NOT EXISTS `city_images` (
`id` bigint(20) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `image_dir` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `city_images`
--

INSERT INTO `city_images` (`id`, `city_id`, `name`, `image_name`, `image_dir`) VALUES
(20, 79679, 'dfsdfs', '2011-cars-images-audi-r8-tdi-le-mans-041.jpg', 'app_data/cities_images/'),
(21, 79679, 'Animal 7', '1_mercedes_car_wallpaper.jpg', 'app_data/cities_images/'),
(22, 79679, 'aaf', 'index6.jpeg', 'app_data/cities_images/'),
(23, 79679, 'bvcvb', '1389273137_nice_car_hd_wallpaper.jpg', 'app_data/cities_images/'),
(24, 79679, 'hfdhg', 'New_cool_cars_wallpapers.jpg', 'app_data/cities_images/'),
(25, 79679, 'weqwe', 'url.jpeg', 'app_data/cities_images/'),
(26, 79679, 'sdfsdf', '1343601.jpg', 'app_data/cities_images/'),
(27, 79679, 'Final ss', 't1f9d4d_2014-ferrari-f1.jpg', 'app_data/cities_images/');

-- --------------------------------------------------------

--
-- Table structure for table `ci_cookies`
--

CREATE TABLE IF NOT EXISTS `ci_cookies` (
`id` int(11) NOT NULL,
  `cookie_id` varchar(255) DEFAULT NULL,
  `netid` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `orig_page_requested` varchar(120) DEFAULT NULL,
  `php_session_id` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_types`
--

CREATE TABLE IF NOT EXISTS `class_types` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `hotel_star_rate` tinyint(1) NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hotel_mapped_count` bigint(20) NOT NULL COMMENT 'Total count of all hotels mapped the class',
  `is_active` tinyint(1) NOT NULL COMMENT '1-Active,0-Inactive'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `class_types`
--

INSERT INTO `class_types` (`id`, `created`, `modified`, `name`, `hotel_star_rate`, `alias`, `hotel_mapped_count`, `is_active`) VALUES
(1, '2015-01-09 03:12:33', '2015-01-09 03:12:33', '1 star', 1, '1-star', 1, 1),
(2, '2015-01-09 03:12:45', '2015-01-09 03:12:45', '2 Star', 2, '2-star', 1, 1),
(3, '2015-01-09 03:12:54', '2015-01-09 03:12:54', '3 Star', 3, '3-star', 2, 1),
(4, '2015-01-09 03:13:03', '2015-01-09 03:13:03', '4 Star', 4, '4-star', 5, 1),
(5, '2015-01-09 03:13:13', '2015-01-09 03:13:13', '5 Star', 5, '5-star', 1, 1),
(6, '2015-01-21 11:48:28', '2015-01-21 11:48:38', '7 Star', 6, '6-star', 2, 1),
(7, '2015-01-21 04:22:15', '2015-01-21 04:22:37', '6 Star', 7, '7-star', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
`id` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state_type` int(2) DEFAULT NULL COMMENT '1-state 2- country',
  `state_count` int(11) NOT NULL,
  `city_count` int(11) NOT NULL,
  `area_count` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT '1-Active,0-Inactive'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `created`, `modified`, `name`, `alias`, `code`, `state_type`, `state_count`, `city_count`, `area_count`, `is_active`) VALUES
(1, '2015-01-09 10:08:12', '2015-01-09 16:08:12', 'Brazil', '', 'BRA', NULL, 0, 0, 0, 1),
(2, '2015-01-09 09:08:12', '2015-01-09 16:08:12', 'China', '', 'CHN', NULL, 0, 0, 0, 1),
(3, '2015-01-09 08:08:12', '2015-01-09 16:08:12', 'France', '', 'FRA', NULL, 0, 0, 1, 1),
(4, '2015-01-09 09:08:12', '2015-01-09 16:08:12', 'India', '', 'IND', NULL, 0, 0, 2, 1),
(5, '2015-01-09 11:08:12', '2015-01-09 16:08:12', 'USA', '', 'USA', NULL, 0, 0, 2, 1),
(6, '2015-01-20 03:45:48', '2015-01-20 03:45:48', 'Germany', '', 'GER', 2, 8, 6, 0, 1),
(7, '2015-01-21 11:04:42', '2015-01-21 11:04:42', 'Indonesia', '', 'INO', 1, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cron_datas`
--

CREATE TABLE IF NOT EXISTS `cron_datas` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `notification_type` tinyint(1) NOT NULL COMMENT '1-wishlist offer,2-new offers',
  `offer_id` bigint(20) NOT NULL DEFAULT '0',
  `hotel_id` bigint(20) NOT NULL DEFAULT '0',
  `sending_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-no process,1-success,2-fail '
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `cron_datas`
--

INSERT INTO `cron_datas` (`id`, `created`, `modified`, `notification_type`, `offer_id`, `hotel_id`, `sending_status`) VALUES
(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 1, 5, 0),
(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 2, 5, 0),
(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3, 5, 1),
(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 4, 5, 0),
(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 5, 4, 0),
(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 6, 2, 0),
(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 7, 2, 0),
(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 8, 2, 0),
(9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 9, 2, 0),
(10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 10, 7, 0),
(11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 11, 3, 0),
(12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 12, 8, 0),
(13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 14, 9, 0),
(14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 17, 2, 0),
(16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 19, 2, 0),
(17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 19, 1, 0),
(18, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 19, 1, 0),
(19, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 19, 1, 0),
(20, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 19, 1, 0),
(21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 21, 2, 0),
(22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 20, 2, 0),
(23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 21, 2, 0),
(24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 21, 2, 0),
(25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 21, 2, 0),
(26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 4, 1, 1),
(27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 40, 2, 0),
(28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 46, 2, 0),
(29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 47, 2, 0),
(30, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 48, 2, 0),
(31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 46, 1, 0),
(32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 46, 1, 0),
(33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 46, 1, 0),
(34, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 46, 1, 0),
(35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 46, 1, 0),
(36, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, 46, 1, 0),
(37, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 48, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cron_mail_notification`
--

CREATE TABLE IF NOT EXISTS `cron_mail_notification` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `to_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `from_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `is_sent` tinyint(1) NOT NULL COMMENT '1-Waiting to send,0-already sent'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cron_mail_notification`
--

INSERT INTO `cron_mail_notification` (`id`, `created`, `to_email`, `from_email`, `subject`, `message`, `is_sent`) VALUES
(1, '2015-05-07 12:47:25', 'john@gmail.com', 'grandhoteldream@gmail.com', 'Hobitel - New Offer notification', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n	<head>\n	   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\n	   <title>Hobitel.com : Mailer</title>\n	</head>\n	<body>\n		<table width="100%" border="0" cellspacing="0" cellpadding="0">\n		   <tr>\n				<td align="center" valign="top">\n					 <table width="550" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">\n						   <tr bgcolor="#ffffff;">\n							   <td align="center" valign="top" style="border:1px solid #ccc;background:#000;padding:10px 20px"><a href="http://192.168.1.63/hobitel/trunk/hobitel/"><img src="http://192.168.1.63/hobitel/trunk/hobitel/assets/img/admin/logo.png" alt=""/></a></td>\n							</tr>\n							<tr>\n	<td align="left" valign="top" style="padding-left:20px;padding-top:20px;padding-bottom:20px;border:1px solid #ccc;border-width:0px 1px 0px 1px;font:normal 12px Tahoma;">\n		Dear <span style="font-weight:bold;">John</span>, <br/><br/>\n		Grand Hotel Dream added an new offer. [Garland Festival in Hawaii]<br/><br/>\n		<a href="http://192.168.1.63/hobitel/trunk/hobitel/home/offer_view/Garland-Festival-in-Hawaii/3">Click to View Offer </a>\n		<br/>\n	 <br/>\n	 Thanks<br/>\n	 <br/>\n	 Sigin into <a href="http://192.168.1.63/hobitel/trunk/hobitel/login">hobitel</a>	</td>        \n</tr>							<tr><td style="padding-left:20px;padding-top:0px;padding-bottom:20px;padding-right:20px;border:1px solid #ccc;border-width:0px 1px 1px 1px;font:normal 12px Tahoma;">\n							<span style="display:block;background:#ccc;height:1px;margin-bottom:20px;"></span>\n							<strong>Thanks & Regards,</strong> </br></br></br><span style="color: #8c9398;font-weight: bold;display:block;margin-top:10px;">Hobitel Support Team</span> </td></tr>\n				  </table>\n			  </td>\n		  </tr>\n	   </table>\n	</body>\n</html>', 1),
(2, '2015-05-07 12:47:26', 'john@gmail.com', 'admin@hobitel.com', 'Hobitel - Wishlist Offer Purchased notification', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml">\n	<head>\n	   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\n	   <title>Hobitel.com : Mailer</title>\n	</head>\n	<body>\n		<table width="100%" border="0" cellspacing="0" cellpadding="0">\n		   <tr>\n				<td align="center" valign="top">\n					 <table width="550" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">\n						   <tr bgcolor="#ffffff;">\n							   <td align="center" valign="top" style="border:1px solid #ccc;background:#000;padding:10px 20px"><a href="http://192.168.1.63/hobitel/trunk/hobitel/"><img src="http://192.168.1.63/hobitel/trunk/hobitel/assets/img/admin/logo.png" alt=""/></a></td>\n							</tr>\n							<tr>\n	<td align="left" valign="top" style="padding-left:20px;padding-top:20px;padding-bottom:20px;border:1px solid #ccc;border-width:0px 1px 0px 1px;font:normal 12px Tahoma;">\n		Dear <span style="font-weight:bold;">John</span>, <br/><br/>\n		Your added an offer [Germany National Festival for 2 Days] in wishlist that to be purchased.sorry for the inconvenience.<br/><br/>\n	 <br/>\n	 Thanks<br/>\n	 <br/>\n	 Sigin into <a href="http://192.168.1.63/hobitel/trunk/hobitel/login">hobitel</a>	</td>        \n</tr>							<tr><td style="padding-left:20px;padding-top:0px;padding-bottom:20px;padding-right:20px;border:1px solid #ccc;border-width:0px 1px 1px 1px;font:normal 12px Tahoma;">\n							<span style="display:block;background:#ccc;height:1px;margin-bottom:20px;"></span>\n							<strong>Thanks & Regards,</strong> </br></br></br><span style="color: #8c9398;font-weight: bold;display:block;margin-top:10px;">Hobitel Support Team</span> </td></tr>\n				  </table>\n			  </td>\n		  </tr>\n	   </table>\n	</body>\n</html>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
`id` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `currency_html_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` double NOT NULL COMMENT 'value is equal to 1 Euro',
  `is_default` tinyint(1) NOT NULL COMMENT '1-Default currency type',
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `created`, `modified`, `name`, `alias`, `country_code`, `currency_symbol`, `currency_html_code`, `value`, `is_default`, `is_active`) VALUES
(1, '2014-10-03 03:25:55', '2014-10-03 03:25:55', 'EURO', 'EURO', 'EUR', '€', '&euro;', 1, 1, 1),
(2, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Japanese Yen', 'japanese-yen', 'JPY', '¥', '&yen;', 128.9, 0, 1),
(3, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Bulgarian Lev', 'bulgarian-lev', 'BGN', 'лв', 'лв', 1.9558, 0, 0),
(4, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Czech Republic Koruna', 'czech-republic-koruna', 'CZK', 'Kč', 'Kč', 27.183, 0, 0),
(5, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Danish Krone', 'danish-krone', 'DKK', 'kr', 'kr', 7.4614, 0, 0),
(6, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Hungarian Forint', 'hungarian-forint', 'HUF', 'Ft', 'Ft', 304.12, 0, 0),
(7, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Polish Zloty', 'polish-zloty', 'PLN', 'zł', 'zł', 4.1392, 0, 0),
(8, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Romanian Leu', 'romanian-leu', 'RON', 'lei', 'lei', 4.4415, 0, 0),
(9, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Swedish Krona', 'swedish-krona', 'SEK', 'kr', 'kr', 9.1769, 0, 0),
(10, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Norwegian Krone', 'norwegian-krone', 'NOK', 'kr', 'kr', 8.7915, 0, 0),
(11, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Croatian Kuna', 'croatian-kuna', 'HRK', 'kn', 'kn', 7.6466, 0, 0),
(12, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Russian Ruble', 'russian-ruble', 'RUB', 'руб', 'руб', 65.7556, 0, 0),
(13, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Turkish Lira', 'turkish-lira', 'TRY', 'TRY', 'TRY', 2.7784, 0, 0),
(14, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Chinese Yuan', 'chinese-yuan', 'CNY', '¥', 'CNY', 6.6468, 0, 0),
(15, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Indian Rupee ', 'indian-rupee', 'INR', 'Rs', 'Rs', 66.7156, 0, 1),
(16, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Albanian Lek', 'albanian-lek', 'ALL', 'Lek', 'Lek', 1, 0, 0),
(17, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Italian Lira', 'italian-lira', 'ITL', 'ITL', 'ITL', 1, 0, 0),
(18, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Spanish', 'spanish', 'EUR', '€', '&euro;', 1, 0, 0),
(19, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'Saudi Riyal - Arabic', 'saudi-riyal-arabic', 'SAR', 'SAR', 'SAR', 1, 0, 0),
(20, '2014-10-01 12:53:21', '2014-10-01 12:53:21', 'French Franc', 'french-franc', 'EUR', '€', '&euro;', 1, 0, 0),
(21, '2014-10-01 12:53:21', '2014-10-01 12:53:21', 'German Mark', 'german-mark', 'EUR', '€', '&euro;', 1, 0, 0),
(22, '2014-10-01 12:53:21', '2014-10-01 12:53:21', 'Portuguese', 'portuguese', 'EUR', '€', '&euro;', 1, 0, 0),
(23, '2014-10-01 12:53:21', '2014-10-01 12:53:21', 'Slovenian', 'slovenian', 'EUR', '€', '&euro;', 1, 0, 0),
(24, '2014-10-01 00:00:00', '2014-10-01 00:00:00', 'Dutch', 'dutch', 'EUR', '€', '&euro;', 1, 0, 0),
(25, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'US Dollar', 'us-dollar', 'USD', '$', '$', 1.0635, 0, 1),
(26, '2015-03-18 12:31:42', '2015-03-18 12:31:42', 'United Kingdom', 'united-kingdom', 'GBP', '', '', 0.71995, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
`id` int(11) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `from` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reply_to` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_content` text COLLATE utf8_unicode_ci,
  `email_variables` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_html` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Site Email Templates' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE IF NOT EXISTS `genders` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `title` varchar(250) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT '1-Active,0-Inactive'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `created`, `modified`, `title`, `alias`, `is_active`) VALUES
(1, '2014-10-03 00:00:00', '2014-10-03 00:00:00', 'Male', 'male', 1),
(2, '2014-10-03 00:00:00', '2014-10-03 00:00:00', 'Female', 'female', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE IF NOT EXISTS `hotels` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `plan_id` tinyint(1) NOT NULL,
  `plan_start_date` date NOT NULL,
  `plan_expiry_date` date NOT NULL,
  `auction_limit` int(11) NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `zipcode` int(11) NOT NULL,
  `mobile_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone_code` varchar(25) NOT NULL,
  `telephone_number` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `miles_from` varchar(255) NOT NULL,
  `miles_location` varchar(255) NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `longitude` varchar(30) NOT NULL,
  `rating` float NOT NULL,
  `description` text NOT NULL,
  `hotel_url` varchar(255) NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `viewed_count` bigint(20) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `created`, `modified`, `hotel_id`, `plan_id`, `plan_start_date`, `plan_expiry_date`, `auction_limit`, `name`, `class_id`, `address`, `zipcode`, `mobile_number`, `phone_code`, `telephone_number`, `miles_from`, `miles_location`, `latitude`, `longitude`, `rating`, `description`, `hotel_url`, `meta_keywords`, `meta_description`, `viewed_count`) VALUES
(1, '2015-02-24 05:43:29', '2015-04-21 10:40:43', 2, 2, '2015-02-24', '2015-08-23', 50, 'Hotel Zoo Berlin', 6, 'Hotel Zoo , Albusstraße, Berlin, Germany', 0, '9791447542', '', '044 4578 1679', '15', 'Berlin Schonefeld Airport', '52.503838', '13.329198', 0, 'Hello', '', '', '', 16),
(13, '2015-04-21 01:09:38', '0000-00-00 00:00:00', 29, 1, '2015-04-21', '2015-09-18', 10, 'New  Hotel', 0, 'sfdsdfsdf', 0, '0', '', '5545454555', '', '', '', '', 0, '', '', '', '', 0),
(2, '2015-02-24 05:45:47', '2015-02-24 09:30:34', 3, 2, '2015-02-24', '2015-08-23', 50, 'Steigenberger Frankfurter Hof', 5, 'Am Kaiserplatz\n60311 Frankfurt am Main, Freiberg - Gemany', 0, '9791447542', '', '044 0456 4234', '2.2', 'Saxony Villa Road', '50.110411', '8.675959', 3, 'This 19th-century hotel is just a 5-minute walk from Frankfurt''s Old Town and Opera. It includes Michelin-star cuisine and a large spa providing massages and beauty treatments.\nThe elegant rooms at the 5-star Steigenberger Frankfurter Hof feature traditional and modern design as well as satellite TV and free Wi-Fi. Bathrobes, toiletries and a hairdryer are provided in the private bathrooms.\nA Turkish bath and a traditional barber‘s shop are featured in the Frankfurter Hof’s Urban Spa. Guests can choose from a selection of massages, or indulge themselves with a luxurious beauty treatment.\nRestaurant Francais prepares award-winning meals, and an assortment of snacks and regional dishes are served in Oscar’s restaurant. Japanese cuisine can be enjoyed in the hotel’s Restaurant IROHA.\nWilly-Brandt-Platz Station is just outside the Frankfurter Hof, and provides connections to 5 different U-Bahn (subway) lines. Frankfurt Central Train Station is just 1 stop away.\nFrankfurt City Center (Old Town) is a great choice for travelers interested in tranquility, electronics shopping and cafes.', '', '', '', 9),
(3, '2015-02-24 05:49:16', '2015-02-24 05:49:16', 4, 2, '2015-02-24', '2015-08-23', 50, 'The Westin Grand', 4, '', 0, '9791447585', '', '044 0123 7894', '11.2', 'Frankfurt Trade Fair', '', '', 0, 'This 4-star hotel is in a 100-year-old building beside Frankfurt Central Train Station. It offers free Wi-Fi, full breakfasts, and soundproofed rooms with free minibar.\n\nAll spacious, brightly decorated rooms at the Hotel Monopol Frankfurt feature satellite TV, a desk, and a private bathroom. The free minibar is restocked every day.\n\nInternational dishes and seasonal specialties are served in the Metropol’s restaurant. In the afternoons, guests can enjoy free coffee and cake in the lobby.\n\nFree calls to local landlines and free sewing services are offered by the Monopol Frankfurt. Guests can reserve the business facilities for up to 4 hours at no extra cost.\n\nThe Messe Frankfurt Exhibition Center is half a mile from the Monopol Hotel. Frankfurt Airport is only 15 minutes by S-Bahn train.\n\nGutleutviertel is a great choice for travelers interested in parks, convenient public transportation and architecture.', '', '', '', 3),
(4, '2015-02-24 05:51:17', '2015-02-24 06:00:38', 5, 2, '2015-02-24', '2015-08-23', 50, 'Grand Hotel Dream', 4, 'Konrad-Adenauer-Str. 7, Frankfurt City Center (Old Town), 60313 Frankfurt, Germany', 0, '9791447542', '', '044 4561 1456', '6.8', 'Berlin Schonefeld Airport', '50.114296', '8.690491', 5, 'This 19th-century hotel is just a 5-minute walk from Frankfurt''s Old Town and Opera. It includes Michelin-star cuisine and a large spa providing massages and beauty treatments.\nThe elegant rooms at the 5-star Steigenberger Frankfurter Hof feature traditional and modern design as well as satellite TV and free Wi-Fi. Bathrobes, toiletries and a hairdryer are provided in the private bathrooms.\nA Turkish bath and a traditional barber‘s shop are featured in the Frankfurter Hof’s Urban Spa. Guests can choose from a selection of massages, or indulge themselves with a luxurious beauty treatment.', '', '', '', 32),
(5, '2015-02-24 05:51:17', '2015-02-24 06:00:38', 1, 2, '2015-02-24', '2015-08-23', 50, 'Admin', 4, '', 0, '9791447542', '', '044 4561 1456', '6.8', '', '50.114296', '8.690491', 0, '', '', '', '', 5),
(6, '2015-02-24 09:02:42', '2015-02-24 09:28:45', 7, 2, '2015-02-24', '2015-08-23', 50, 'ITC Grand Central', 3, 'Mumbai', 0, '988992978', '', '54898989', '10', 'Mumbai Airport', '18.998605', '72.838443', 0, 'Located amidst the business & recreational centers in Parel, ITC Grand Central is a luxury hotel that is inspired by the British Colonial architecture of old Bombay. Guests can enjoy the best of Indian fine-dining & a host of authentic world cuisines at Kebabs and Kurries, Shanghai Club & Hornbys Pavilion. For informal business meeting or a casual sit back with friends, Fredericks Lounge is the perfect place. Dublin The Irish Bar, serves gourmet snacks, rare selection of the finest malts, ales & cigars.\nCorporate travelers are facilitated with six elegant and spacious conference and banqueting suites that are equipped with high-speed Internet access & latest audio visual equipment. To rejuvenate your mind, body and soul, Kaya Kalp, the spa offers an array of hair and beauty services. You can also avail western style therapies that use natural luxurious products to deliver the desired effects.', '', '', '', 5),
(7, '2015-02-24 09:48:15', '2015-02-24 10:38:34', 8, 3, '2015-02-24', '2015-08-23', 10, 'Hotel Continental', 4, 'Continental Hotel\n36-42 Norfolk Square\nLondon W2 1RT', 0, '9791447542', '', '044 45612 3234', '4.5', 'Berlin Schonefeld Airport', '51.516522', '-0.173106', 0, 'Unwind in the lap of sophistication at Aleenta Resort & Spa Hua Hin Pranburi, the ultimate secluded getaway overlooking the Gulf of Thailand, and home to a nature-inspired spa, modern Thai and international cuisine and beautiful sunrises.\nThis is a tropical paradise surrounded by sand, sea and swaying palms. Aleenta Resort & Spa’s 22 suites are in a superb collection of villas, some with pretty thatched roofs and others with a rooftop deck. Pool Suites have their own private plunge pools while Ocean View Suites are just steps from the sea.', '', '', '', 1),
(8, '2015-02-24 10:18:21', '2015-03-23 02:35:25', 9, 3, '2015-02-24', '2015-08-23', 100, 'Novotel Berlin Am Tiergarten', 3, '10623 Berlin, Germany', 0, '854587899', '', '6898988789', '15', 'Railway station', '52.514351', '13.332227', 0, '#35 Family Hotel in Berlin\r\n#43 Luxury Hotel in Berlin\r\n#46 Business Hotel in Berlin\r\n#48 Romantic Hotel in Berlin', '', '', '', 1),
(9, '2015-03-23 10:54:40', '2015-03-23 10:54:40', 16, 3, '2015-03-23', '2015-09-19', 100, 'sdfsdf', 2, '', 0, '', '', '', '', '', '', '', 0, '', '', '', '', 1),
(10, '2015-04-06 12:32:59', '0000-00-00 00:00:00', 19, 1, '2015-04-06', '2015-09-03', 10, 'sfdsdf', 0, 'sdfsdf', 0, '0', '', '45454545', '', '', '', '', 0, '', '', '', '', 0),
(11, '2015-04-06 12:54:47', '0000-00-00 00:00:00', 20, 1, '2015-04-06', '2015-09-03', 10, 'sdfsdfs', 0, 'sdfsdf', 0, '0', '', '454545', '', '', '', '', 0, '', '', '', '', 0),
(12, '2015-04-07 07:42:25', '0000-00-00 00:00:00', 27, 1, '2015-04-07', '2015-09-04', 10, 'sophieem', 0, 'sdfsdf', 0, '0', '', '989959596', '', '', '', '', 0, '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_amenities`
--

CREATE TABLE IF NOT EXISTS `hotel_amenities` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `amenity_id` int(11) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=155 ;

--
-- Dumping data for table `hotel_amenities`
--

INSERT INTO `hotel_amenities` (`id`, `created`, `modified`, `hotel_id`, `amenity_id`, `is_featured`, `is_active`) VALUES
(18, '2015-02-24 06:01:37', '2015-02-24 06:01:37', 5, 1, 1, 1),
(17, '2015-02-24 06:01:37', '2015-02-24 06:01:37', 5, 2, 1, 1),
(16, '2015-02-24 06:01:37', '2015-02-24 06:01:37', 5, 3, 1, 1),
(15, '2015-02-24 06:01:37', '2015-02-24 06:01:37', 5, 4, 0, 1),
(14, '2015-02-24 06:01:37', '2015-02-24 06:01:37', 5, 5, 1, 1),
(13, '2015-02-24 06:01:37', '2015-02-24 06:01:37', 5, 6, 0, 1),
(12, '2015-02-24 06:01:37', '2015-02-24 06:01:37', 5, 8, 0, 1),
(11, '2015-02-24 06:01:37', '2015-02-24 06:01:37', 5, 7, 1, 1),
(10, '2015-02-24 06:01:37', '2015-02-24 06:01:37', 5, 14, 0, 1),
(19, '2015-02-24 06:40:33', '2015-02-24 06:40:33', 4, 24, 0, 1),
(20, '2015-02-24 06:40:33', '2015-02-24 06:40:33', 4, 22, 1, 1),
(21, '2015-02-24 06:40:33', '2015-02-24 06:40:33', 4, 16, 1, 1),
(22, '2015-02-24 06:40:33', '2015-02-24 06:40:33', 4, 12, 0, 1),
(23, '2015-02-24 06:40:33', '2015-02-24 06:40:33', 4, 3, 0, 1),
(24, '2015-02-24 06:40:33', '2015-02-24 06:40:33', 4, 13, 0, 1),
(25, '2015-02-24 06:40:33', '2015-02-24 06:40:33', 4, 10, 0, 1),
(26, '2015-02-24 06:40:33', '2015-02-24 06:40:33', 4, 1, 1, 1),
(53, '2015-02-24 09:04:29', '2015-02-24 09:04:29', 7, 5, 1, 1),
(154, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 1, 0, 1),
(52, '2015-02-24 09:04:29', '2015-02-24 09:04:29', 7, 38, 0, 1),
(51, '2015-02-24 09:04:29', '2015-02-24 09:04:29', 7, 12, 0, 1),
(54, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 3, 1, 1),
(55, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 4, 0, 1),
(56, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 2, 0, 1),
(57, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 1, 0, 1),
(58, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 9, 0, 1),
(59, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 10, 0, 1),
(60, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 12, 0, 1),
(61, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 11, 0, 1),
(62, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 8, 0, 1),
(63, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 6, 0, 1),
(64, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 7, 1, 1),
(65, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 5, 1, 1),
(95, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 2, 0, 1),
(94, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 1, 0, 1),
(93, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 3, 0, 1),
(92, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 7, 0, 1),
(91, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 5, 0, 1),
(90, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 6, 0, 1),
(89, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 4, 0, 1),
(88, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 12, 0, 1),
(87, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 11, 0, 1),
(86, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 9, 0, 1),
(85, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 10, 0, 1),
(84, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 8, 0, 1),
(101, '2015-03-23 02:35:25', '2015-03-23 02:35:25', 9, 12, 0, 1),
(100, '2015-03-23 02:35:25', '2015-03-23 02:35:25', 9, 8, 0, 1),
(99, '2015-03-23 02:35:25', '2015-03-23 02:35:25', 9, 5, 0, 1),
(98, '2015-03-23 02:35:25', '2015-03-23 02:35:25', 9, 24, 0, 1),
(97, '2015-03-23 02:35:25', '2015-03-23 02:35:25', 9, 6, 0, 1),
(96, '2015-03-23 02:35:25', '2015-03-23 02:35:25', 9, 20, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_banners`
--

CREATE TABLE IF NOT EXISTS `hotel_banners` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hotel_id` bigint(11) NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_dir` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_info` text COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL COMMENT 'order by show records',
  `banner_type` tinyint(1) NOT NULL,
  `is_display` tinyint(1) NOT NULL,
  `is_top_banner` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL COMMENT '1-Deleted',
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=86 ;

--
-- Dumping data for table `hotel_banners`
--

INSERT INTO `hotel_banners` (`id`, `created`, `modified`, `name`, `hotel_id`, `image_name`, `image_dir`, `image_info`, `priority`, `banner_type`, `is_display`, `is_top_banner`, `is_deleted`, `is_active`) VALUES
(1, '2015-02-24 06:02:35', '2015-02-24 06:02:35', '', 5, 'image2.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:10:"image2.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:63:"/home/development/php/hobitel/app_data/hotel_banners/image2.jpg";s:8:"raw_name";s:6:"image2";s:9:"orig_name";s:10:"image2.jpg";s:11:"client_name";s:10:"image2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:25.129999999999999005240169935859739780426025390625;s:8:"is_image";b:1;s:11:"image_width";i:302;s:12:"image_height";i:352;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="302" height="352"";}}', 0, 0, 1, 0, 0, 0),
(2, '2015-02-24 06:03:23', '2015-02-24 06:03:23', 'Hotel Inner Romms', 5, 'hotel1.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:10:"hotel1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:63:"/home/development/php/hobitel/app_data/hotel_banners/hotel1.jpg";s:8:"raw_name";s:6:"hotel1";s:9:"orig_name";s:10:"hotel1.jpg";s:11:"client_name";s:10:"hotel1.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:34.85000000000000142108547152020037174224853515625;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 2, 0, 0, 0, 0, 0),
(3, '2015-02-24 06:03:49', '2015-02-24 06:03:49', 'Hotel Front End', 5, 'hotel3.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:10:"hotel3.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:63:"/home/development/php/hobitel/app_data/hotel_banners/hotel3.jpg";s:8:"raw_name";s:6:"hotel3";s:9:"orig_name";s:10:"hotel3.jpg";s:11:"client_name";s:10:"hotel3.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:41.85000000000000142108547152020037174224853515625;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 3, 0, 0, 0, 0, 0),
(4, '2015-02-24 06:04:34', '2015-02-24 06:04:34', 'Hotel Balcony', 5, 'image21.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"image21.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:64:"/home/development/php/hobitel/app_data/hotel_banners/image21.jpg";s:8:"raw_name";s:7:"image21";s:9:"orig_name";s:10:"image2.jpg";s:11:"client_name";s:10:"image2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:25.129999999999999005240169935859739780426025390625;s:8:"is_image";b:1;s:11:"image_width";i:302;s:12:"image_height";i:352;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="302" height="352"";}}', 1, 0, 0, 0, 0, 0),
(5, '2015-02-24 06:04:50', '2015-02-24 06:04:50', '4', 5, 'image5.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:10:"image5.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:63:"/home/development/php/hobitel/app_data/hotel_banners/image5.jpg";s:8:"raw_name";s:6:"image5";s:9:"orig_name";s:10:"image5.jpg";s:11:"client_name";s:10:"image5.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:30.0799999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 4, 0, 0, 0, 0, 0),
(6, '2015-02-24 06:04:58', '2015-02-24 06:04:58', '5', 5, 'hotel5.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:10:"hotel5.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:63:"/home/development/php/hobitel/app_data/hotel_banners/hotel5.jpg";s:8:"raw_name";s:6:"hotel5";s:9:"orig_name";s:10:"hotel5.jpg";s:11:"client_name";s:10:"hotel5.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:33.25999999999999801048033987171947956085205078125;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 5, 0, 0, 0, 0, 0),
(7, '2015-02-24 06:05:56', '2015-02-24 06:05:56', '6', 5, 'hotel7.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:10:"hotel7.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:63:"/home/development/php/hobitel/app_data/hotel_banners/hotel7.jpg";s:8:"raw_name";s:6:"hotel7";s:9:"orig_name";s:10:"hotel7.jpg";s:11:"client_name";s:10:"hotel7.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:35.38000000000000255795384873636066913604736328125;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 6, 0, 0, 0, 0, 0),
(8, '2015-02-24 06:41:54', '2015-02-24 06:41:54', '', 4, '40718803.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"40718803.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:65:"/home/development/php/hobitel/app_data/hotel_banners/40718803.jpg";s:8:"raw_name";s:8:"40718803";s:9:"orig_name";s:12:"40718803.jpg";s:11:"client_name";s:12:"40718803.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:152.18000000000000682121026329696178436279296875;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 0, 0, 1, 0, 0, 0),
(9, '2015-02-24 06:43:15', '2015-02-24 06:43:15', '', 4, 'Aussen1.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"Aussen1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:64:"/home/development/php/hobitel/app_data/hotel_banners/Aussen1.jpg";s:8:"raw_name";s:7:"Aussen1";s:9:"orig_name";s:11:"Aussen1.jpg";s:11:"client_name";s:11:"Aussen1.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:184.710000000000007958078640513122081756591796875;s:8:"is_image";b:1;s:11:"image_width";i:1600;s:12:"image_height";i:784;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1600" height="784"";}}', 0, 0, 0, 1, 0, 0),
(10, '2015-02-24 06:44:38', '2015-02-24 06:44:38', 'My gallery 1', 4, 'url.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:7:"url.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:60:"/home/development/php/hobitel/app_data/hotel_banners/url.jpg";s:8:"raw_name";s:3:"url";s:9:"orig_name";s:7:"url.jpg";s:11:"client_name";s:7:"url.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:1700.59999999999990905052982270717620849609375;s:8:"is_image";b:1;s:11:"image_width";i:1200;s:12:"image_height";i:1600;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1200" height="1600"";}}', 1, 0, 0, 0, 0, 0),
(11, '2015-02-24 06:44:49', '2015-02-24 06:44:49', 'My gallery 2', 4, 'Westin-Grand-Cayman-Sundeck.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:31:"Westin-Grand-Cayman-Sundeck.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:84:"/home/development/php/hobitel/app_data/hotel_banners/Westin-Grand-Cayman-Sundeck.jpg";s:8:"raw_name";s:27:"Westin-Grand-Cayman-Sundeck";s:9:"orig_name";s:31:"Westin-Grand-Cayman-Sundeck.jpg";s:11:"client_name";s:31:"Westin-Grand-Cayman-Sundeck.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:777.779999999999972715158946812152862548828125;s:8:"is_image";b:1;s:11:"image_width";i:1500;s:12:"image_height";i:1125;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1500" height="1125"";}}', 2, 0, 0, 0, 0, 0),
(12, '2015-02-24 06:45:32', '2015-02-24 06:45:32', 'My gallery 3', 4, 'Caymans-068.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:15:"Caymans-068.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:68:"/home/development/php/hobitel/app_data/hotel_banners/Caymans-068.jpg";s:8:"raw_name";s:11:"Caymans-068";s:9:"orig_name";s:15:"Caymans-068.jpg";s:11:"client_name";s:15:"Caymans-068.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:3622.239999999999781721271574497222900390625;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 3, 0, 0, 0, 0, 0),
(14, '2015-02-24 06:57:27', '2015-02-24 06:57:27', '', 5, 'Downtown-Boston.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:19:"Downtown-Boston.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:72:"/home/development/php/hobitel/app_data/hotel_banners/Downtown-Boston.jpg";s:8:"raw_name";s:15:"Downtown-Boston";s:9:"orig_name";s:19:"Downtown-Boston.jpg";s:11:"client_name";s:19:"Downtown-Boston.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:285;s:8:"is_image";b:1;s:11:"image_width";i:1920;s:12:"image_height";i:1080;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1920" height="1080"";}}', 0, 0, 0, 1, 0, 0),
(85, '2015-05-19 15:33:10', '2015-05-19 15:33:10', 'sfdsdf', 2, 'bg-ing-new.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:14:"bg-ing-new.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:61:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/";s:9:"full_path";s:75:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/bg-ing-new.jpg";s:8:"raw_name";s:10:"bg-ing-new";s:9:"orig_name";s:14:"bg-ing-new.jpg";s:11:"client_name";s:14:"bg-ing-new.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:2326.9600000000000363797880709171295166015625;s:8:"is_image";b:1;s:11:"image_width";i:1920;s:12:"image_height";i:1189;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1920" height="1189"";}}', 4, 3, 0, 0, 0, 1),
(23, '2015-02-24 09:07:01', '2015-02-24 09:07:01', '', 7, 'GCHLeadImage1-1700x999.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:26:"GCHLeadImage1-1700x999.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:79:"/home/development/php/hobitel/app_data/hotel_banners/GCHLeadImage1-1700x999.jpg";s:8:"raw_name";s:22:"GCHLeadImage1-1700x999";s:9:"orig_name";s:26:"GCHLeadImage1-1700x999.jpg";s:11:"client_name";s:26:"GCHLeadImage1-1700x999.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:344.82999999999998408384271897375583648681640625;s:8:"is_image";b:1;s:11:"image_width";i:1700;s:12:"image_height";i:999;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1700" height="999"";}}', 0, 0, 0, 1, 0, 0),
(24, '2015-02-24 09:07:30', '2015-02-24 09:07:30', '', 7, 'url1.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:61:"/home/development/php/hobitel/app_data/hotel_banners/url1.jpg";s:8:"raw_name";s:4:"url1";s:9:"orig_name";s:7:"url.jpg";s:11:"client_name";s:7:"url.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:215.3600000000000136424205265939235687255859375;s:8:"is_image";b:1;s:11:"image_width";i:987;s:12:"image_height";i:1000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="987" height="1000"";}}', 0, 0, 1, 0, 0, 0),
(25, '2015-02-24 09:10:21', '2015-02-24 09:10:21', 'Home banner', 7, '8465188822_7b4946655a.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:25:"8465188822_7b4946655a.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:78:"/home/development/php/hobitel/app_data/hotel_banners/8465188822_7b4946655a.jpg";s:8:"raw_name";s:21:"8465188822_7b4946655a";s:9:"orig_name";s:25:"8465188822_7b4946655a.jpg";s:11:"client_name";s:25:"8465188822_7b4946655a.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:140.229999999999989768184605054557323455810546875;s:8:"is_image";b:1;s:11:"image_width";i:500;s:12:"image_height";i:387;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="500" height="387"";}}', 1, 0, 0, 0, 0, 0),
(26, '2015-02-24 09:10:31', '2015-02-24 09:10:31', 'Pub', 7, 'pub.JPG', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:7:"pub.JPG";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:60:"/home/development/php/hobitel/app_data/hotel_banners/pub.JPG";s:8:"raw_name";s:3:"pub";s:9:"orig_name";s:7:"pub.JPG";s:11:"client_name";s:7:"pub.JPG";s:8:"file_ext";s:4:".JPG";s:9:"file_size";d:165.759999999999990905052982270717620849609375;s:8:"is_image";b:1;s:11:"image_width";i:1200;s:12:"image_height";i:800;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1200" height="800"";}}', 2, 0, 0, 0, 0, 0),
(27, '2015-02-24 09:10:42', '2015-02-24 09:10:42', 'Dinner', 7, 'url2.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url2.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:61:"/home/development/php/hobitel/app_data/hotel_banners/url2.jpg";s:8:"raw_name";s:4:"url2";s:9:"orig_name";s:8:"url2.jpg";s:11:"client_name";s:8:"url2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:290.240000000000009094947017729282379150390625;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 3, 0, 0, 0, 0, 0),
(28, '2015-02-24 09:11:18', '2015-02-24 09:11:18', 'Facilities', 7, 'itc-grand-central-luxur.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:27:"itc-grand-central-luxur.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:80:"/home/development/php/hobitel/app_data/hotel_banners/itc-grand-central-luxur.jpg";s:8:"raw_name";s:23:"itc-grand-central-luxur";s:9:"orig_name";s:27:"itc-grand-central-luxur.jpg";s:11:"client_name";s:27:"itc-grand-central-luxur.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:183.31000000000000227373675443232059478759765625;s:8:"is_image";b:1;s:11:"image_width";i:1400;s:12:"image_height";i:780;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1400" height="780"";}}', 4, 0, 0, 0, 0, 0),
(30, '2015-02-24 09:20:00', '2015-02-24 09:20:00', '', 3, 'image8.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:10:"image8.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:63:"/home/development/php/hobitel/app_data/hotel_banners/image8.jpg";s:8:"raw_name";s:6:"image8";s:9:"orig_name";s:10:"image8.jpg";s:11:"client_name";s:10:"image8.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:25.410000000000000142108547152020037174224853515625;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 0, 0, 1, 0, 0, 0),
(31, '2015-02-24 09:20:29', '2015-02-24 09:20:29', '1', 3, 'patong-beach-hotel.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:22:"patong-beach-hotel.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:75:"/home/development/php/hobitel/app_data/hotel_banners/patong-beach-hotel.jpg";s:8:"raw_name";s:18:"patong-beach-hotel";s:9:"orig_name";s:22:"patong-beach-hotel.jpg";s:11:"client_name";s:22:"patong-beach-hotel.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:56.49000000000000198951966012828052043914794921875;s:8:"is_image";b:1;s:11:"image_width";i:550;s:12:"image_height";i:412;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="550" height="412"";}}', 1, 0, 0, 0, 0, 0),
(32, '2015-02-24 09:21:00', '2015-02-24 09:21:00', '2', 3, 'samsng.png', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:10:"samsng.png";s:9:"file_type";s:9:"image/png";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:63:"/home/development/php/hobitel/app_data/hotel_banners/samsng.png";s:8:"raw_name";s:6:"samsng";s:9:"orig_name";s:10:"samsng.png";s:11:"client_name";s:10:"samsng.png";s:8:"file_ext";s:4:".png";s:9:"file_size";d:353.45999999999997953636921010911464691162109375;s:8:"is_image";b:1;s:11:"image_width";i:1937;s:12:"image_height";i:2811;s:10:"image_type";s:3:"png";s:14:"image_size_str";s:26:"width="1937" height="2811"";}}', 2, 0, 0, 0, 0, 0),
(33, '2015-02-24 09:21:17', '2015-02-24 09:21:17', '3', 3, 'images_(22).jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:15:"images_(22).jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:68:"/home/development/php/hobitel/app_data/hotel_banners/images_(22).jpg";s:8:"raw_name";s:11:"images_(22)";s:9:"orig_name";s:15:"images_(22).jpg";s:11:"client_name";s:15:"images (22).jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:17.230000000000000426325641456060111522674560546875;s:8:"is_image";b:1;s:11:"image_width";i:179;s:12:"image_height";i:281;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="179" height="281"";}}', 3, 0, 0, 0, 0, 0),
(34, '2015-02-24 09:21:26', '2015-02-24 09:21:26', '4', 3, 'images_(22)1.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:16:"images_(22)1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:69:"/home/development/php/hobitel/app_data/hotel_banners/images_(22)1.jpg";s:8:"raw_name";s:12:"images_(22)1";s:9:"orig_name";s:15:"images_(22).jpg";s:11:"client_name";s:15:"images (22).jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:17.230000000000000426325641456060111522674560546875;s:8:"is_image";b:1;s:11:"image_width";i:179;s:12:"image_height";i:281;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="179" height="281"";}}', 4, 0, 0, 0, 0, 0),
(35, '2015-02-24 09:21:36', '2015-02-24 09:21:36', '5', 3, 'patong-beach-hotel1.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:23:"patong-beach-hotel1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:76:"/home/development/php/hobitel/app_data/hotel_banners/patong-beach-hotel1.jpg";s:8:"raw_name";s:19:"patong-beach-hotel1";s:9:"orig_name";s:22:"patong-beach-hotel.jpg";s:11:"client_name";s:22:"patong-beach-hotel.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:56.49000000000000198951966012828052043914794921875;s:8:"is_image";b:1;s:11:"image_width";i:550;s:12:"image_height";i:412;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="550" height="412"";}}', 5, 0, 0, 0, 0, 0),
(36, '2015-02-24 09:22:20', '2015-02-24 09:22:20', '6', 3, 'hotel71.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"hotel71.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:64:"/home/development/php/hobitel/app_data/hotel_banners/hotel71.jpg";s:8:"raw_name";s:7:"hotel71";s:9:"orig_name";s:10:"hotel7.jpg";s:11:"client_name";s:10:"hotel7.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:35.38000000000000255795384873636066913604736328125;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 6, 0, 0, 0, 0, 0),
(39, '2015-02-24 10:14:29', '2015-02-24 10:14:29', '', 8, 'ambassador_herosquarenew.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:28:"ambassador_herosquarenew.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:81:"/home/development/php/hobitel/app_data/hotel_banners/ambassador_herosquarenew.jpg";s:8:"raw_name";s:24:"ambassador_herosquarenew";s:9:"orig_name";s:28:"ambassador_herosquarenew.jpg";s:11:"client_name";s:28:"ambassador_herosquarenew.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:39.0799999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:300;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="300"";}}', 0, 0, 1, 0, 0, 0),
(40, '2015-02-24 10:14:48', '2015-02-24 10:14:48', '133 edit', 8, 'akyramanor_hucnxam_herosquare.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:33:"akyramanor_hucnxam_herosquare.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:86:"/home/development/php/hobitel/app_data/hotel_banners/akyramanor_hucnxam_herosquare.jpg";s:8:"raw_name";s:29:"akyramanor_hucnxam_herosquare";s:9:"orig_name";s:33:"akyramanor_hucnxam_herosquare.jpg";s:11:"client_name";s:33:"akyramanor_hucnxam_herosquare.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:26.949999999999999289457264239899814128875732421875;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:300;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="300"";}}', 1, 0, 0, 0, 0, 0),
(41, '2015-02-24 10:14:57', '2015-02-24 10:14:57', '2 editss', 8, 'food1.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:9:"food1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:62:"/home/development/php/hobitel/app_data/hotel_banners/food1.jpg";s:8:"raw_name";s:5:"food1";s:9:"orig_name";s:9:"food1.jpg";s:11:"client_name";s:9:"food1.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:57.5;s:8:"is_image";b:1;s:11:"image_width";i:390;s:12:"image_height";i:390;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="390" height="390"";}}', 2, 0, 0, 0, 0, 0),
(51, '2015-03-11 13:53:50', '2015-03-11 13:53:50', '', 8, 'url22.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:9:"url22.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:61:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/";s:9:"full_path";s:70:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/url22.jpg";s:8:"raw_name";s:5:"url22";s:9:"orig_name";s:8:"url2.jpg";s:11:"client_name";s:8:"url2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:2209.71999999999979991116560995578765869140625;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 0, 0, 0, 1, 0, 0),
(43, '2015-02-24 10:15:18', '2015-02-24 10:15:18', '4 sss', 8, 'france-hotel1.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:17:"france-hotel1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:70:"/home/development/php/hobitel/app_data/hotel_banners/france-hotel1.jpg";s:8:"raw_name";s:13:"france-hotel1";s:9:"orig_name";s:16:"france-hotel.jpg";s:11:"client_name";s:16:"france-hotel.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:153.1100000000000136424205265939235687255859375;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:560;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="560"";}}', 4, 0, 0, 0, 0, 0),
(44, '2015-02-24 10:26:56', '2015-02-24 10:26:56', '', 9, 'display.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"display.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:64:"/home/development/php/hobitel/app_data/hotel_banners/display.jpg";s:8:"raw_name";s:7:"display";s:9:"orig_name";s:11:"display.jpg";s:11:"client_name";s:11:"display.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:171;s:8:"is_image";b:1;s:11:"image_width";i:2048;s:12:"image_height";i:828;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="2048" height="828"";}}', 0, 0, 0, 1, 0, 0),
(45, '2015-02-24 10:31:19', '2015-02-24 10:31:19', '', 9, 'dis.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:7:"dis.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:60:"/home/development/php/hobitel/app_data/hotel_banners/dis.jpg";s:8:"raw_name";s:3:"dis";s:9:"orig_name";s:7:"dis.jpg";s:11:"client_name";s:7:"dis.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:182.590000000000003410605131648480892181396484375;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 0, 0, 1, 0, 0, 0),
(46, '2015-02-24 10:31:33', '2015-02-24 10:31:33', 'Gallery edit', 9, 'logo.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"logo.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:61:"/home/development/php/hobitel/app_data/hotel_banners/logo.jpg";s:8:"raw_name";s:4:"logo";s:9:"orig_name";s:8:"logo.jpg";s:11:"client_name";s:8:"logo.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:152.490000000000009094947017729282379150390625;s:8:"is_image";b:1;s:11:"image_width";i:346;s:12:"image_height";i:260;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="346" height="260"";}}', 1, 0, 0, 0, 0, 0),
(47, '2015-02-24 10:32:32', '2015-02-24 10:32:32', 'Gallery 2 edits2', 9, 'url3.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url3.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:61:"/home/development/php/hobitel/app_data/hotel_banners/url3.jpg";s:8:"raw_name";s:4:"url3";s:9:"orig_name";s:7:"url.jpg";s:11:"client_name";s:7:"url.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:352.8799999999999954525264911353588104248046875;s:8:"is_image";b:1;s:11:"image_width";i:2000;s:12:"image_height";i:1333;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="2000" height="1333"";}}', 2, 0, 0, 0, 0, 0),
(48, '2015-02-24 10:32:44', '2015-02-24 10:32:44', 'Gallery 3', 9, '15319607.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"15319607.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:65:"/home/development/php/hobitel/app_data/hotel_banners/15319607.jpg";s:8:"raw_name";s:8:"15319607";s:9:"orig_name";s:12:"15319607.jpg";s:11:"client_name";s:12:"15319607.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:93.7999999999999971578290569595992565155029296875;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 3, 0, 0, 0, 0, 0),
(49, '2015-02-24 10:33:06', '2015-02-24 10:33:06', 'Gallery3', 9, 'url21.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:9:"url21.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:53:"/home/development/php/hobitel/app_data/hotel_banners/";s:9:"full_path";s:62:"/home/development/php/hobitel/app_data/hotel_banners/url21.jpg";s:8:"raw_name";s:5:"url21";s:9:"orig_name";s:8:"url2.jpg";s:11:"client_name";s:8:"url2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:2209.71999999999979991116560995578765869140625;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 4, 0, 0, 0, 0, 0),
(50, '2015-03-11 12:52:39', '2015-03-11 12:52:39', '', 8, '153196071.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:13:"153196071.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:61:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/";s:9:"full_path";s:74:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/153196071.jpg";s:8:"raw_name";s:9:"153196071";s:9:"orig_name";s:12:"15319607.jpg";s:11:"client_name";s:12:"15319607.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:93.7999999999999971578290569595992565155029296875;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 0, 0, 1, 0, 0, 0),
(52, '2015-03-11 15:22:33', '2015-03-11 15:22:33', 'dfdgfd', 8, '153196072.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:13:"153196072.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:61:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/";s:9:"full_path";s:74:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/153196072.jpg";s:8:"raw_name";s:9:"153196072";s:9:"orig_name";s:12:"15319607.jpg";s:11:"client_name";s:12:"15319607.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:93.7999999999999971578290569595992565155029296875;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 2, 0, 0, 0, 0, 0),
(83, '2015-05-19 15:29:19', '2015-05-19 15:29:19', 'sdfs', 2, 'Aussen1.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"Aussen1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:61:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/";s:9:"full_path";s:72:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/Aussen1.jpg";s:8:"raw_name";s:7:"Aussen1";s:9:"orig_name";s:11:"Aussen1.jpg";s:11:"client_name";s:11:"Aussen1.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:184.710000000000007958078640513122081756591796875;s:8:"is_image";b:1;s:11:"image_width";i:1600;s:12:"image_height";i:784;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1600" height="784"";}}', 3, 3, 0, 0, 0, 1),
(84, '2015-05-19 15:32:58', '2015-05-19 15:32:58', '', 2, '10.17_.12-Westin-Grand-Central-1_1.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:38:"10.17_.12-Westin-Grand-Central-1_1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:61:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/";s:9:"full_path";s:99:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/10.17_.12-Westin-Grand-Central-1_1.jpg";s:8:"raw_name";s:34:"10.17_.12-Westin-Grand-Central-1_1";s:9:"orig_name";s:37:"10.17_.12-Westin-Grand-Central-1_.jpg";s:11:"client_name";s:37:"10.17_.12-Westin-Grand-Central-1_.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:72.8299999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:270;s:12:"image_height";i:170;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="270" height="170"";}}', 0, 1, 1, 0, 0, 1),
(80, '2015-05-07 08:02:16', '2015-05-07 08:02:16', '', 2, '40718803.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"40718803.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:61:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/";s:9:"full_path";s:73:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/40718803.jpg";s:8:"raw_name";s:8:"40718803";s:9:"orig_name";s:12:"40718803.jpg";s:11:"client_name";s:12:"40718803.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:152.18000000000000682121026329696178436279296875;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 0, 2, 0, 1, 0, 1),
(81, '2015-05-07 08:02:26', '2015-05-07 08:02:26', 'sssss33', 2, 'rock_climbing_sport_adventure_wallpaper_hd-2.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:48:"rock_climbing_sport_adventure_wallpaper_hd-2.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:61:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/";s:9:"full_path";s:109:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/rock_climbing_sport_adventure_wallpaper_hd-2.jpg";s:8:"raw_name";s:44:"rock_climbing_sport_adventure_wallpaper_hd-2";s:9:"orig_name";s:48:"rock_climbing_sport_adventure_wallpaper_hd-2.jpg";s:11:"client_name";s:48:"rock_climbing_sport_adventure_wallpaper_hd-2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:218.1399999999999863575794734060764312744140625;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:680;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="680"";}}', 2, 3, 0, 0, 0, 1),
(82, '2015-05-07 08:05:37', '2015-05-07 08:05:37', 'ttttssss', 2, '10.17_.12-Westin-Grand-Central-1_.jpg', 'app_data/hotel_banners/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:37:"10.17_.12-Westin-Grand-Central-1_.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:61:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/";s:9:"full_path";s:98:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/hotel_banners/10.17_.12-Westin-Grand-Central-1_.jpg";s:8:"raw_name";s:33:"10.17_.12-Westin-Grand-Central-1_";s:9:"orig_name";s:37:"10.17_.12-Westin-Grand-Central-1_.jpg";s:11:"client_name";s:37:"10.17_.12-Westin-Grand-Central-1_.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:72.8299999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:270;s:12:"image_height";i:170;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="270" height="170"";}}', 6, 3, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_comments`
--

CREATE TABLE IF NOT EXISTS `hotel_comments` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `negative_comments` text COLLATE utf8_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `browser_info` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `hotel_comments`
--

INSERT INTO `hotel_comments` (`id`, `created`, `modified`, `user_id`, `hotel_id`, `title`, `comments`, `negative_comments`, `rating`, `ip`, `browser_info`, `is_active`) VALUES
(10, '2015-05-12 04:45:27', '0000-00-00 00:00:00', 6, 5, 'erer dsf sfdsdf', 'sdfsd', 'sdfsdfs', 5, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_follows`
--

CREATE TABLE IF NOT EXISTS `hotel_follows` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hotel_follows`
--

INSERT INTO `hotel_follows` (`id`, `created`, `modified`, `user_id`, `hotel_id`, `is_active`) VALUES
(1, '2015-02-24 06:46:31', '0000-00-00 00:00:00', 6, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_likes_dislikes`
--

CREATE TABLE IF NOT EXISTS `hotel_likes_dislikes` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1-Like,2-Dislike',
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hotel_likes_dislikes`
--

INSERT INTO `hotel_likes_dislikes` (`id`, `created`, `modified`, `user_id`, `hotel_id`, `type`, `is_active`) VALUES
(1, '2015-02-24 06:46:51', '2015-05-05 10:35:14', 6, 5, 1, 1),
(2, '2015-05-07 03:45:44', '0000-00-00 00:00:00', 6, 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_plans`
--

CREATE TABLE IF NOT EXISTS `hotel_plans` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `plan_id` tinyint(1) NOT NULL,
  `plan_start_date` date NOT NULL,
  `plan_expiry_date` date NOT NULL,
  `auction_limit` int(11) NOT NULL,
  `no_of_days` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1-Active,0-Previous/Expired'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `hotel_plans`
--

INSERT INTO `hotel_plans` (`id`, `created`, `hotel_id`, `plan_id`, `plan_start_date`, `plan_expiry_date`, `auction_limit`, `no_of_days`, `status`) VALUES
(1, '2015-02-24 05:43:29', 2, 2, '2015-02-24', '2015-08-23', 50, 180, 1),
(2, '2015-02-24 05:45:47', 3, 2, '2015-02-24', '2015-08-23', 50, 180, 1),
(3, '2015-02-24 05:49:16', 4, 2, '2015-02-24', '2015-08-23', 50, 180, 1),
(4, '2015-02-24 05:51:17', 5, 2, '2015-02-24', '2015-08-23', 50, 180, 1),
(5, '2015-02-24 09:02:42', 7, 2, '2015-02-24', '2015-08-23', 50, 180, 1),
(6, '2015-02-24 09:48:15', 8, 1, '2015-02-24', '2042-07-11', 10, 9999, 1),
(7, '2015-02-24 10:18:21', 9, 3, '2015-02-24', '2015-08-23', 100, 180, 1),
(8, '2015-03-23 10:54:40', 16, 3, '2015-03-23', '2015-09-19', 100, 180, 1),
(9, '2015-04-06 12:32:59', 19, 1, '2015-04-06', '2015-09-03', 10, 150, 1),
(10, '2015-04-06 12:54:47', 20, 1, '2015-04-06', '2015-09-03', 10, 150, 1),
(11, '2015-04-07 07:42:25', 27, 1, '2015-04-07', '2015-09-04', 10, 150, 1),
(12, '2015-04-21 01:09:38', 29, 1, '2015-04-21', '2015-09-18', 10, 150, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_social_accounts`
--

CREATE TABLE IF NOT EXISTS `hotel_social_accounts` (
`id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `facebook_url` varchar(255) NOT NULL,
  `twitter_url` varchar(255) NOT NULL,
  `pinterest_url` varchar(255) NOT NULL,
  `foursquare_url` varchar(255) NOT NULL,
  `skype_name` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `hotel_social_accounts`
--

INSERT INTO `hotel_social_accounts` (`id`, `user_id`, `facebook_url`, `twitter_url`, `pinterest_url`, `foursquare_url`, `skype_name`) VALUES
(1, 2, 's', '', '', '', ''),
(2, 5, '', '', '', '', ''),
(3, 3, '', '', '', '', ''),
(4, 7, '', '', '', '', ''),
(5, 8, '', '', '', '', ''),
(6, 9, '', '', '', '', ''),
(7, 19, '', '', '', '', ''),
(8, 20, '', '', '', '', ''),
(9, 27, '', '', '', '', ''),
(10, 29, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_suitables`
--

CREATE TABLE IF NOT EXISTS `hotel_suitables` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `suitable_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=252 ;

--
-- Dumping data for table `hotel_suitables`
--

INSERT INTO `hotel_suitables` (`id`, `created`, `modified`, `hotel_id`, `suitable_id`, `is_active`) VALUES
(6, '2015-02-24 06:01:37', '2015-02-24 06:01:37', 5, 1, 1),
(5, '2015-02-24 06:01:37', '2015-02-24 06:01:37', 5, 5, 1),
(4, '2015-02-24 06:01:37', '2015-02-24 06:01:37', 5, 10, 1),
(7, '2015-02-24 06:40:33', '2015-02-24 06:40:33', 4, 16, 1),
(8, '2015-02-24 06:40:33', '2015-02-24 06:40:33', 4, 13, 1),
(9, '2015-02-24 06:40:33', '2015-02-24 06:40:33', 4, 11, 1),
(10, '2015-02-24 06:40:33', '2015-02-24 06:40:33', 4, 7, 1),
(11, '2015-02-24 06:40:33', '2015-02-24 06:40:33', 4, 1, 1),
(251, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 15, 1),
(250, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 12, 1),
(249, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 5, 1),
(248, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 6, 1),
(247, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 10, 1),
(246, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 4, 1),
(245, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 3, 1),
(244, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 2, 1),
(243, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 1, 1),
(242, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 8, 1),
(241, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 7, 1),
(37, '2015-02-24 09:04:29', '2015-02-24 09:04:29', 7, 8, 1),
(36, '2015-02-24 09:04:29', '2015-02-24 09:04:29', 7, 1, 1),
(38, '2015-02-24 09:04:29', '2015-02-24 09:04:29', 7, 11, 1),
(39, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 5, 1),
(40, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 6, 1),
(41, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 10, 1),
(42, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 2, 1),
(43, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 13, 1),
(44, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 9, 1),
(45, '2015-02-24 09:18:34', '2015-02-24 09:18:34', 3, 1, 1),
(65, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 1, 1),
(64, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 5, 1),
(63, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 6, 1),
(62, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 10, 1),
(61, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 14, 1),
(60, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 15, 1),
(59, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 16, 1),
(58, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 12, 1),
(57, '2015-02-24 10:22:46', '2015-02-24 10:22:46', 8, 11, 1),
(240, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 16, 1),
(239, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 18, 1),
(238, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 17, 1),
(237, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 13, 1),
(236, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 14, 1),
(235, '2015-04-22 08:06:40', '2015-04-22 08:06:40', 2, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `language_code` varchar(255) NOT NULL,
  `folder_name` varchar(255) NOT NULL,
  `dir_name` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `created`, `modified`, `name`, `alias`, `language_code`, `folder_name`, `dir_name`, `is_default`, `is_active`) VALUES
(1, '2015-03-17 00:00:00', '2015-03-17 00:00:00', 'english', 'english', 'eng', 'english', 'apllications/languages/english', 1, 1),
(2, '2015-03-17 11:43:41', '2015-03-20 05:46:37', 'German', 'german', 'ger', 'german', 'application/language/german', 0, 1),
(3, '2015-03-17 11:43:41', '2015-03-17 11:45:03', 'french', 'french', 'fre', 'french', 'application/language/french', 0, 0),
(4, '2015-03-17 11:43:41', '2015-03-17 11:46:42', 'spanish', 'spanish', 'spa', 'spanish', 'application/language/spanish', 0, 0),
(6, '2015-03-20 05:46:59', '2015-03-20 05:48:17', 'Hindi', 'hindi', 'hin', 'hindi', 'application/language/hindi', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `from_user_id` bigint(20) NOT NULL,
  `to_user_id` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `is_main` tinyint(1) NOT NULL COMMENT '0-New Message, else relative atuo increament reply messages',
  `ip` int(11) NOT NULL,
  `from_delete` tinyint(1) NOT NULL COMMENT '1-Deleted',
  `to_delete` tinyint(1) NOT NULL COMMENT '1-Deleted',
  `is_read` tinyint(1) NOT NULL COMMENT '1-readed',
  `is_active` tinyint(1) NOT NULL COMMENT '1-Active,0-Admin Deleted',
  `is_high_important` tinyint(1) NOT NULL,
  `message_type` tinyint(1) NOT NULL COMMENT '1- Message 2- Notification'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `created`, `from_user_id`, `to_user_id`, `message`, `is_main`, `ip`, `from_delete`, `to_delete`, `is_read`, `is_active`, `is_high_important`, `message_type`) VALUES
(1, '2015-05-07 01:16:27', 6, 2, 'sdfsfsdfsf', 0, 0, 0, 1, 1, 1, 0, 1),
(2, '2015-05-07 01:28:54', 2, 6, 'sdfsdf', 0, 0, 0, 0, 1, 1, 0, 1),
(3, '2015-05-07 01:37:52', 2, 6, 'sdfsdfsdf', 0, 0, 0, 0, 1, 1, 0, 1),
(4, '2015-05-07 01:44:56', 6, 2, 'sdfsdf', 0, 0, 0, 0, 1, 1, 0, 1),
(5, '2015-05-07 03:50:33', 2, 6, 'sdfsdf', 0, 0, 0, 0, 1, 1, 1, 1),
(6, '2015-05-07 04:18:08', 6, 2, 'sfsdfsdf', 0, 0, 0, 1, 1, 1, 0, 1),
(7, '2015-05-07 04:19:28', 6, 2, 'hhhhhhhhhhh', 0, 0, 0, 1, 1, 1, 1, 1),
(8, '2015-05-07 04:34:05', 2, 6, 'sfsdfs', 0, 0, 0, 0, 1, 1, 1, 1),
(9, '2015-05-07 04:35:57', 2, 6, 'sfdsdf', 0, 0, 0, 0, 1, 1, 1, 1),
(10, '2015-05-08 07:59:04', 2, 6, 'fdsfdsf', 0, 0, 0, 0, 1, 1, 1, 1),
(11, '2015-05-08 10:44:40', 2, 6, 'At ut nonummy, sociis eleifend consectetuer. Tortor consectetuer, felis mauris rutrum curabitur hendrerit Vehicula cursus nostra nullam auctor tempus adipiscing porta etiam dictum vivamus urna porta tellus.\n\nParturient Curae; quis cubilia mus pretium justo nibh rutrum proin porttitor aptent aliquam. Dui fermentum faucibus Hac odio rutrum venenatis placerat, aliquam auctor.', 0, 0, 0, 0, 1, 1, 1, 1),
(12, '2015-05-08 11:02:37', 6, 2, 'sdf', 11, 0, 0, 1, 1, 1, 0, 1),
(13, '2015-05-08 12:20:56', 2, 6, 'dfsdf', 1, 0, 0, 0, 0, 1, 0, 1),
(14, '2015-05-08 01:33:09', 2, 6, 'sdfsdfsdf', 0, 0, 0, 0, 1, 1, 0, 1),
(15, '2015-05-08 01:38:14', 2, 6, 'sdfsdf', 0, 0, 0, 0, 1, 1, 0, 1),
(16, '2015-05-08 02:01:08', 6, 2, 'dgdfg dfg dfgdfg ', 0, 0, 0, 0, 1, 1, 1, 1),
(17, '2015-05-13 02:34:54', 6, 2, 'sfsdf', 0, 0, 0, 0, 1, 1, 0, 1),
(18, '2015-05-14 10:58:33', 6, 2, 'sfsd', 0, 0, 0, 0, 1, 1, 0, 1),
(19, '2015-05-14 11:01:22', 6, 2, 'sdfs', 0, 0, 0, 0, 1, 1, 0, 1),
(20, '2015-05-14 11:04:06', 6, 2, 'sdf', 0, 0, 0, 0, 1, 1, 0, 1),
(21, '2015-05-14 11:04:33', 6, 2, 'sdf', 0, 0, 0, 0, 1, 1, 0, 1),
(22, '2015-05-19 04:04:53', 6, 2, 'Hello  World Issue', 0, 0, 0, 0, 1, 1, 1, 1),
(23, '2015-05-19 04:05:36', 6, 2, 'sdfsdfsdf', 0, 0, 0, 0, 1, 1, 0, 1),
(24, '2015-05-19 04:06:20', 6, 2, 'sdfsdf', 0, 0, 0, 0, 1, 1, 0, 1),
(25, '2015-05-19 04:09:39', 2, 6, 'sdfsdf', 0, 0, 0, 0, 1, 1, 1, 1),
(26, '2015-05-19 04:14:46', 6, 2, 'new', 0, 0, 0, 0, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `link_id` varchar(255) NOT NULL COMMENT 'primary key for offer,hotel,orders ID',
  `from_user_id` bigint(20) NOT NULL,
  `to_user_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `ip` varchar(255) NOT NULL,
  `from_delete` tinyint(1) NOT NULL COMMENT '1-Deleted',
  `to_delete` tinyint(1) NOT NULL COMMENT '1-Deleted',
  `is_read` tinyint(1) NOT NULL COMMENT '1-readed',
  `is_active` tinyint(1) NOT NULL COMMENT '1-Active,0-Admin Deleted',
  `notify_type` tinyint(1) NOT NULL COMMENT '1 - Wishlist, 2 - Hotel Following, 3- Buy Offer, 4- Likes'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=72 ;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `created`, `link_id`, `from_user_id`, `to_user_id`, `title`, `message`, `ip`, `from_delete`, `to_delete`, `is_read`, `is_active`, `notify_type`) VALUES
(1, '2015-02-24 06:46:31', '5', 6, 5, 'Hotel Follow', 'This user has followed your hotel', '180.151.61.235', 0, 0, 1, 1, 2),
(2, '2015-02-24 06:46:51', '5', 6, 5, 'Like', 'This user has liked your hotel', '180.151.61.235', 0, 0, 1, 1, 4),
(3, '2015-03-21 08:08:57', '18', 6, 2, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(4, '2015-03-21 08:10:16', '18', 6, 2, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(5, '2015-03-21 08:10:31', '18', 6, 2, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(6, '2015-03-21 08:10:54', '18', 6, 2, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(7, '2015-03-21 08:17:26', '18', 6, 2, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(8, '2015-03-21 08:17:45', '18', 6, 2, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(9, '2015-03-21 08:17:49', '18', 6, 2, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(10, '2015-03-21 08:18:27', '18', 6, 2, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(11, '2015-03-21 08:18:55', '18', 6, 2, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(12, '2015-03-21 08:19:25', '18', 6, 2, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(13, '2015-03-21 08:20:01', '18', 6, 2, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(14, '2015-03-21 08:20:20', '18', 6, 2, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(15, '2015-03-21 08:20:46', '18', 6, 2, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(16, '2015-03-21 08:20:59', '18', 6, 2, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(17, '2015-03-21 08:21:24', '18', 6, 2, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(18, '2015-03-21 08:21:46', '18', 6, 2, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(19, '2015-03-21 08:22:15', '18', 6, 2, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(20, '2015-03-21 08:22:43', '18', 6, 2, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.112', 0, 1, 0, 1, 1),
(21, '2015-04-30 12:28:16', '3', 6, 5, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(22, '2015-04-30 12:33:07', '3', 6, 5, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(23, '2015-04-30 12:33:27', '3', 6, 5, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(24, '2015-04-30 12:48:52', '4', 6, 5, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(25, '2015-04-30 12:50:07', '4', 6, 5, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(26, '2015-04-30 12:50:20', '8', 6, 2, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 1, 1, 1, 1),
(27, '2015-04-30 01:19:13', '4', 6, 5, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(28, '2015-04-30 01:19:23', '4', 6, 5, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(29, '2015-04-30 01:20:29', '4', 6, 5, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(30, '2015-04-30 01:20:34', '4', 6, 5, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(31, '2015-04-30 01:21:18', '4', 6, 5, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(32, '2015-04-30 01:22:16', '21', 6, 2, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 0, 1, 1, 1),
(33, '2015-04-30 01:22:20', '21', 6, 2, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.63', 0, 1, 1, 1, 1),
(34, '2015-04-30 01:22:28', '21', 6, 2, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 1, 1, 1, 1),
(35, '2015-04-30 01:25:06', '3', 6, 5, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(36, '2015-04-30 01:26:04', '3', 6, 5, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(37, '2015-04-30 01:26:14', '4', 6, 5, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(38, '2015-04-30 01:26:22', '8', 6, 2, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.63', 0, 0, 1, 1, 1),
(39, '2015-04-30 01:26:30', '8', 6, 2, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 1, 1, 1, 1),
(40, '2015-04-30 01:29:19', '3', 6, 5, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(41, '2015-04-30 01:34:05', '3', 6, 5, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(42, '2015-04-30 01:36:06', '4', 6, 5, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(43, '2015-04-30 01:36:14', '4', 6, 5, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(44, '2015-04-30 01:36:20', '4', 6, 5, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(45, '2015-04-30 01:36:49', '3', 6, 5, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(46, '2015-04-30 01:39:05', '3', 6, 5, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(47, '2015-04-30 01:39:10', '3', 6, 5, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(48, '2015-04-30 02:18:29', '3', 6, 5, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(49, '2015-04-30 02:18:33', '3', 6, 5, 'Wishlist', 'This user has removed your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(50, '2015-05-04 01:50:54', '3', 6, 3, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(51, '2015-05-04 01:52:31', '3', 6, 3, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(52, '2015-05-05 10:34:39', '3', 6, 5, 'Wishlist', 'This user has added your offer in their wishlist', '192.168.1.63', 0, 0, 0, 1, 1),
(53, '2015-05-05 10:35:12', '5', 6, 5, 'Unlike', 'This user has unliked your hotel', '192.168.1.63', 0, 0, 0, 1, 5),
(54, '2015-05-05 10:35:14', '5', 6, 5, 'Like', 'This user has liked your hotel', '192.168.1.63', 0, 0, 0, 1, 4),
(55, '2015-05-07 12:47:25', '3', 5, 6, 'New Offers', 'This Hotel added a new offer<br/>-Garland Festival in Hawaii', '192.168.1.63', 0, 0, 1, 1, 8),
(56, '2015-05-07 12:47:26', '4', 1, 6, 'Purchased', 'Your added wishlist offer as been sold out<br/>-Germany National Festival for 2 Days', '192.168.1.63', 0, 0, 1, 1, 7),
(58, '2015-05-12 03:19:37', '5', 6, 5, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(57, '2015-05-07 03:45:44', '4', 6, 4, 'Like', 'This user has liked your hotel', '192.168.1.63', 0, 0, 0, 1, 4),
(59, '2015-05-12 03:28:24', '5', 6, 5, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(60, '2015-05-12 03:28:49', '5', 6, 5, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(61, '2015-05-12 03:33:12', '5', 6, 5, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(62, '2015-05-12 03:40:33', '5', 6, 5, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(63, '2015-05-12 03:47:27', '5', 6, 5, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(64, '2015-05-12 03:48:28', '5', 6, 5, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(65, '2015-05-12 03:49:53', '5', 6, 5, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(66, '2015-05-12 03:51:19', '5', 6, 5, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(67, '2015-05-12 03:52:05', '5', 6, 5, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(68, '2015-05-12 03:54:14', '5', 6, 5, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(69, '2015-05-12 04:10:27', '5', 6, 5, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(70, '2015-05-12 04:44:43', '5', 6, 5, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6),
(71, '2015-05-12 04:45:27', '5', 6, 5, 'Review', 'This user has review your hotel', '192.168.1.63', 0, 0, 0, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE IF NOT EXISTS `offers` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `offer_type` tinyint(1) NOT NULL COMMENT '1- Normal offer,2-Slump rate,3-bidding',
  `offer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `msrp_price` double(10,2) NOT NULL COMMENT 'hotel user fixed a amount for all type of offer',
  `offer_price` double(10,2) NOT NULL,
  `reduction_price` double(10,2) NOT NULL COMMENT 'only for slump rate (type:2)',
  `current_rate` double(10,2) NOT NULL COMMENT 'updating current price',
  `current_update_time` datetime NOT NULL,
  `price_limit` double(10,2) NOT NULL,
  `bidding_start_amount` double(10,2) NOT NULL,
  `time_interval` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'only for slump rate (type:2) (x,y)X-reduction type[Days,Hours,Mins],Y-Timings',
  `offer_start_date` datetime NOT NULL,
  `offer_end_date` datetime NOT NULL,
  `booking_start_date` datetime NOT NULL,
  `booking_end_date` datetime NOT NULL,
  `cancel_last_date` datetime NOT NULL,
  `no_of_persons` int(11) NOT NULL,
  `price_comparisions` text COLLATE utf8_unicode_ci NOT NULL,
  `room_types` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `room_view_types` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `viewed_count` bigint(20) NOT NULL,
  `booking_status` tinyint(1) NOT NULL COMMENT '1-Booked,0-Others',
  `bid_cron_status` tinyint(1) NOT NULL COMMENT '0-Process,1-Cron \r\n\r\nUpdatable',
  `is_published` tinyint(1) NOT NULL COMMENT '0-Drafs,1-Published',
  `is_active` tinyint(1) NOT NULL COMMENT '1-Active,0-Inactive',
  `is_home` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=49 ;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `created`, `modified`, `hotel_id`, `offer_type`, `offer_name`, `description`, `msrp_price`, `offer_price`, `reduction_price`, `current_rate`, `current_update_time`, `price_limit`, `bidding_start_amount`, `time_interval`, `offer_start_date`, `offer_end_date`, `booking_start_date`, `booking_end_date`, `cancel_last_date`, `no_of_persons`, `price_comparisions`, `room_types`, `room_view_types`, `viewed_count`, `booking_status`, `bid_cron_status`, `is_published`, `is_active`, `is_home`) VALUES
(1, '2015-02-24 06:10:08', '2015-02-24 06:39:16', 5, 1, 'Tomorrowland Festival on Germany for 1 week', 'This historic, 4-star hotel in central Munich offers rooms with free Wi-Fi, and a rich breakfast buffet every day. Marienplatz Square is just a 5-minute walk away.\nAll of the classically furnished rooms at the family-run Hotel Torbräu feature satellite TV and a modern bathroom with hairdryer. All rooms are completely non-smoking.\nThe Schapeau restaurant offers fine cuisine made with regional products. Guests can also relax in the bar here.\nThe Isartor S-Bahn Train Station is only 100 yards from the Hotel Torbräu. Trains provide quick connections to the Messe Exhibition Centre and Munich Airport.', 88.00, 30.50, 0.00, 56.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-04-29 00:00:00', '2015-04-30 00:00:00', '2015-04-02 11:11:00', '2015-04-22 11:11:00', '2015-04-23 00:00:00', 1, 'a:14:{s:6:"site_1";s:0:"";s:6:"site_2";s:0:"";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 53, 0, 0, 1, 1, 1),
(2, '2015-02-24 06:16:33', '2015-02-24 06:23:07', 5, 2, 'Luxurious 3 days  at Grand Hyatt', 'This non-smoking hotel is on the corner of the Zeil shopping street in central Frankfurt. It features 3 restaurants, a 24-hour gym and a large spa with an indoor swimming pool. Wi-Fi is free in the lobby, restaurant and bar.\nJust 2.5 miles from Frankfurt Trade Fair, Westin Grand Frankfurt provides spacious and air-conditioned rooms and suites. All rooms feature modern décor, a flat-screen TV and a heated bathroom floor.\nThe Westin Grand''s Emotion Spa showcases a sauna area as well as luxurious health and beauty treatments. The heated pool offers panoramic views of Frankfurt’s Old Town district.', 99.00, 0.00, 2.00, 45.00, '2015-05-06 16:35:47', 99.00, 45.00, '3,34', '2015-05-06 00:00:00', '2015-05-09 00:00:00', '2015-04-08 11:18:00', '2015-04-30 11:18:00', '2015-05-01 00:00:00', 3, 'a:14:{s:6:"site_1";s:3:"167";s:6:"site_2";s:3:"150";s:6:"site_3";s:3:"145";s:6:"site_4";s:3:"135";s:6:"site_5";s:3:"120";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 13, 0, 0, 1, 1, 1),
(3, '2015-02-24 06:24:39', '2015-04-30 07:07:04', 5, 3, 'Garland Festival in Hawaii', 'This non-smoking hotel is on the corner of the Zeil shopping street in central Frankfurt. It features 3 restaurants, a 24-hour gym and a large spa with an indoor swimming pool. Wi-Fi is free in the lobby, restaurant and bar.\r\n\r\nJust 2.5 miles from Frankfurt Trade Fair, Westin Grand Frankfurt provides spacious and air-conditioned rooms and suites. All rooms feature modern décor, a flat-screen TV and a heated bathroom floor.\r\n\r\nThe Westin Grand''s Emotion Spa showcases a sauna area as well as luxurious health and beauty treatments. The heated pool offers panoramic views of Frankfurt’s Old Town district.', 98.00, 0.00, 0.00, 610.00, '0000-00-00 00:00:00', 0.00, 55.00, '0', '2015-05-30 00:00:00', '2015-05-31 00:00:00', '2015-04-30 10:36:00', '2015-05-27 10:36:00', '2015-05-28 00:00:00', 2, 'a:14:{s:6:"site_1";s:3:"156";s:6:"site_2";s:3:"123";s:6:"site_3";s:3:"159";s:6:"site_4";s:3:"120";s:6:"site_5";s:3:"145";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '7', '1', 125, 0, 0, 1, 1, 1),
(4, '2015-02-24 06:30:39', '2015-04-30 06:37:57', 5, 1, 'Germany National Festival for 2 Days', 'Grand Hotel Frankfurt City has elegant, soundproof rooms with flat-screen TV and laptop safe. They all feature glass shower cubicles.\r\n\r\nGrill specialties, seafood, and wok dishes are only some of the options at the Fleming’s Club restaurant. The summer terrace provides panoramic views. The bar and business lounge are also on the 7th floor.\r\n\r\nGuests staying at Fleming’s Frankfurt City are welcome to use the Finnish sauna, aromatherapy steam room, and spacious gym.', 155.00, 50.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-05-03 00:00:00', '2015-05-03 00:00:00', '2015-04-30 10:07:00', '2015-05-01 10:07:00', '2015-05-01 00:00:00', 2, 'a:14:{s:6:"site_1";s:3:"250";s:6:"site_2";s:3:"230";s:6:"site_3";s:3:"186";s:6:"site_4";s:3:"170";s:6:"site_5";s:3:"185";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '6', '1', 15, 1, 0, 1, 1, 0),
(5, '2015-02-24 07:04:53', '2015-02-24 07:11:20', 4, 2, 'Holiday Inn Express Munich Airport - Schwaig-Oberding', 'TRYP by Wyndham Berlin City East hotel offers smart, comfortable 3-star accommodation in the quiet Lichtenberg district of Berlin. The hotel has convenient free parking as well as complimentary wi-fi throughout. Stay in one of the excellent rooms where you’ll have air conditioning, TV and a hairdryer. Before you head out, enjoy a generous buffet breakfast, and in the evening sit outside in the beer garden where you can also enjoy one of the seasonal dishes served at the restaurant.', 89.00, 0.00, 5.00, 4501.00, '2015-05-06 17:02:47', 50.00, 80.00, '1,3', '2015-03-18 00:00:00', '2015-03-20 00:00:00', '2015-02-24 11:58:00', '2015-03-10 12:00:00', '2015-03-10 00:00:00', 3, 'a:14:{s:6:"site_1";s:2:"90";s:6:"site_2";s:2:"85";s:6:"site_3";s:2:"89";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 2, 0, 0, 1, 1, 0),
(6, '2015-02-24 07:24:29', '2015-02-24 07:28:54', 2, 1, 'Romance in Berlin Package', 'The five star hotel InterContinental Berchtesgaden Resort is located close to the Bavarian/Austrian border 150 km from Munich and 33 km from Salzburg. Germanys first mountain resort lies 1000 metres above sea level on the Eckerbichl.\n\nThe breathtaking views over the district around Salzburg and the legendary Mount Watzmann are what make this area one of the most beautiful throughout the Bavarian Alps. \n\nThe Alpine National Park and other such highlights of the area such as Lake Konigsee make this area one of the most attractive holiday regions in the whole of western Europe', 145.00, 45.00, 0.00, 4501.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-03-05 00:00:00', '2015-04-04 00:00:00', '2015-02-24 12:26:00', '2015-03-04 12:26:00', '2015-03-04 00:00:00', 2, 'a:14:{s:6:"site_1";s:3:"186";s:6:"site_2";s:3:"179";s:6:"site_3";s:3:"189";s:6:"site_4";s:3:"155";s:6:"site_5";s:3:"878";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 0, 0, 0, 1, 1, 0),
(7, '2015-02-24 08:44:05', '2015-02-24 08:45:52', 2, 3, 'Valentine''s Day Special Offers', 'Escape to Chantilly and rejuvenate in love at the Auberge du Jeu de Paume. Enjoy a night in a double room decorated with rose petals and some sweets. Savor the continental breakfast in room.\n\nRelax in our Spa Valmont (swimming pool, hammam, sauna and gym). Taste a romantic dinner at Le Jardin d''Hiver and the next day enjoy a romantic walk in the park of the Chateau de Chantilly.', 450.00, 0.00, 0.00, 122.00, '0000-00-00 00:00:00', 0.00, 120.00, '0', '2015-06-17 00:00:00', '2015-06-19 00:00:00', '2015-05-09 13:45:00', '2015-06-09 13:45:00', '2015-06-10 00:00:00', 3, 'a:14:{s:6:"site_1";s:3:"500";s:6:"site_2";s:3:"440";s:6:"site_3";s:3:"600";s:6:"site_4";s:3:"460";s:6:"site_5";s:3:"390";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 15, 0, 0, 1, 1, 0),
(8, '2015-02-24 08:50:44', '2015-04-30 06:31:53', 2, 2, 'Honey Moon Special Damaka', 'Celebrate your love at the Hotel du Louvre, a Hyatt Hotel with this package featuring a bottle of Champagne, roses, sweets, in-room breakfast for 2, and late check-out at 2 pm.\r\n\r\nThe stay comprises a VIP in-room welcome (with roses, chocolates, champagne and candles), a night in one of the apartments, delicious and plentiful breakfasts served in your apartment, a romantic dinner for two, prepared according to your wishes by a talented chef, and a one-hour chauffeur-driven limousine tour of Paris by night.', 500.00, 0.00, 20.00, 150.00, '2015-05-20 14:06:41', 499.00, 150.00, '2,10', '2015-05-29 00:00:00', '2015-05-30 00:00:00', '2015-04-30 10:01:00', '2015-05-12 10:01:00', '2015-05-13 00:00:00', 1, 'a:14:{s:6:"site_1";s:3:"700";s:6:"site_2";s:3:"790";s:6:"site_3";s:3:"450";s:6:"site_4";s:4:"1000";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '6,1,3,2', '2,5', 15, 0, 0, 1, 1, 0),
(9, '2015-02-24 08:57:35', '2015-02-24 09:00:07', 2, 1, 'Holiday Special Combo', 'This 3-star superior hotel is just half a mile from Frankfurt am Main Airport Terminal 2. It features a 24-hour front desk with live flight information, soundproof windows, and free Wi-Fi in public areas.\n\nThe modern rooms at the Meininger Hotel Frankfurt Main/Airport have a flat-screen TV and an iPod dock. A hairdryer is provided in the private bathroom.\n\nGuests can prepare meals in the shared kitchen, and light snacks and drinks can be ordered at the bar.\n\nFrankfurt am Main Flughafen Fernbahnhof Train Station is just under 1 mile from the hotel, and the center of Frankfurt is a 15-minute drive away. The hotel offers a free shuttle service from the airport to the hotel.', 600.00, 120.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-03-26 00:00:00', '2015-03-27 00:00:00', '2015-02-24 13:59:00', '2015-03-12 13:59:00', '2015-03-13 00:00:00', 4, 'a:14:{s:6:"site_1";s:4:"1200";s:6:"site_2";s:3:"800";s:6:"site_3";s:3:"900";s:6:"site_4";s:3:"950";s:6:"site_5";s:3:"850";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 1, 0, 0, 1, 1, 0),
(10, '2015-02-24 09:16:39', '2015-02-24 09:21:51', 7, 3, 'Standard Double Room', 'Corporate travelers are facilitated with six elegant and spacious conference and banqueting suites that are equipped with high-speed Internet access & latest audio visual equipment. To rejuvenate your mind, body and soul, Kaya Kalp, the spa offers an array of hair and beauty services. You can also avail western style therapies that use natural luxurious products to deliver the desired effects', 48.00, 0.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 25.00, '0', '2015-03-06 00:00:00', '2015-03-07 00:00:00', '2015-02-24 14:18:00', '2015-03-03 14:18:00', '2015-03-04 00:00:00', 4, 'a:14:{s:6:"site_1";s:0:"";s:6:"site_2";s:0:"";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 2, 0, 0, 1, 1, 0),
(11, '2015-02-24 09:33:24', '2015-02-24 09:36:31', 3, 1, 'AKARYN SAMUI RESORT  SPA', 'An indulgent private pool and terrace in every villa\nAuthentic Thai cooking classes with ingredients chosen from a local market\n\n‘Beach pampering service’ involves fresh cucumber slices for eyes and sunglasses cleaned, as well as complimentary treats', 440.00, 120.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-03-03 00:00:00', '2015-03-07 00:00:00', '2015-02-24 14:36:00', '2015-02-28 14:36:00', '2015-02-28 00:00:00', 3, 'a:14:{s:6:"site_1";s:3:"700";s:6:"site_2";s:3:"600";s:6:"site_3";s:3:"780";s:6:"site_4";s:3:"900";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 1, 0, 0, 1, 1, 0),
(12, '2015-02-24 10:19:11', '2015-02-24 10:23:11', 8, 1, 'Special Holiday pack', 'Unwind in the lap of sophistication at Aleenta Resort & Spa Hua Hin Pranburi, the ultimate secluded getaway overlooking the Gulf of Thailand, and home to a nature-inspired spa, modern Thai and international cuisine and beautiful sunrises.\n\n\nThis is a tropical paradise surrounded by sand, sea and swaying palms. Aleenta Resort & Spa’s 22 suites are in a superb collection of villas, some with pretty thatched roofs and others with a rooftop deck. Pool Suites have their own private plunge pools while Ocean View Suites are just steps from the sea.', 320.00, 180.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-03-10 00:00:00', '2015-03-13 00:00:00', '2015-02-24 15:22:00', '2015-02-28 15:22:00', '2015-02-28 00:00:00', 1, 'a:14:{s:6:"site_1";s:3:"450";s:6:"site_2";s:3:"500";s:6:"site_3";s:3:"475";s:6:"site_4";s:3:"600";s:6:"site_5";s:3:"550";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 0, 0, 0, 1, 1, 0),
(13, '2015-02-24 10:34:55', '0000-00-00 00:00:00', 8, 2, 'Germany- Berlin Holiday Packages', 'All rooms at the Savoy Hotel include cable TV, bathroom products and a free bottle of mineral water upon arrival. Free Wi-Fi is available in all areas of the hotel.\n\nA breakfast buffet can be booked at the Savoy Hotel, and free cake is served in the afternoons. Guests can enjoy drinks at the bar or outside on the terrace.\n\nThe Savoy’s health center is on the top floor. It features a small fitness area, spa area with indoor pool and relaxation room. Massages are also available.\n\nBahnhofsviertel is a great choice for travelers interested in atmosphere, botanical garden and opera.', 500.00, 0.00, 5.00, 400.00, '2015-03-11 16:26:51', 500.00, 400.00, '3,40', '2015-03-11 00:00:00', '2015-03-14 00:00:00', '2015-02-24 15:38:00', '2015-02-28 15:38:00', '2015-02-28 00:00:00', 2, 'a:14:{s:6:"site_1";s:3:"790";s:6:"site_2";s:3:"560";s:6:"site_3";s:3:"589";s:6:"site_4";s:3:"670";s:6:"site_5";s:3:"850";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 0, 0, 0, 0, 0, 0),
(14, '2015-02-24 10:37:25', '2015-03-13 05:45:22', 9, 1, 'Best wester Premier Hotel offer', 'you visited for a short break with teenage children and paid a very good rate for two rooms through an on line booking site. The rooms are spacious, very comfortable beds and good bathrooms with big shower cubicles and plenty of hot water. The hotel was quiet and no sleep disturbance even though we were told that a function was taking place. \r\n\r\nI loved the way the rooms are built around an atrium, gives a nice atmosphere. Breakfast was grea, lots of variety, bar/loung very nice and very helpful staff all round. It is only a couple of minutes from the nearest UBahn so very convenient for travelling around the city', 35.00, 29.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-04-02 00:00:00', '2015-04-04 00:00:00', '2015-03-16 14:00:00', '2015-03-25 15:00:00', '2015-03-29 00:00:00', 2, 'a:14:{s:6:"site_1";s:0:"";s:6:"site_2";s:0:"";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 0, 0, 0, 1, 1, 0),
(15, '2015-03-11 12:55:10', '0000-00-00 00:00:00', 8, 1, 'Test', 'gdfdgdffffffffffdfgdfg dgfdfg', 4589.00, 154.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-03-24 00:00:00', '2015-03-31 00:00:00', '2015-03-11 17:24:00', '2015-03-16 17:24:00', '2015-03-16 00:00:00', 2, 'a:14:{s:6:"site_1";s:0:"";s:6:"site_2";s:0:"";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 0, 0, 0, 0, 0, 0),
(16, '2015-03-11 12:55:10', '0000-00-00 00:00:00', 8, 1, 'Test', 'gdfdgdffffffffffdfgdfg dgfdfg', 4589.00, 154.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-03-24 00:00:00', '2015-03-31 00:00:00', '2015-03-11 17:24:00', '2015-03-16 17:24:00', '2015-03-16 00:00:00', 2, 'a:14:{s:6:"site_1";s:0:"";s:6:"site_2";s:0:"";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 0, 0, 0, 0, 0, 0),
(17, '2015-03-12 12:34:35', '2015-03-12 12:35:42', 2, 1, 'New offer', 'One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin.\r\n\r\nHe lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.\r\n\r\nThe bedding was hardly able to cover it and seemed ready to slide off any moment.\r\n\r\nHis many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked. "What''s happened to me? " he thought. It wasn''t a dream. His room, a proper human', 4857.00, 1455.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-03-30 00:00:00', '2015-03-31 00:00:00', '2015-03-16 17:03:00', '2015-03-18 17:03:00', '2015-03-18 00:00:00', 2, 'a:14:{s:6:"site_1";s:0:"";s:6:"site_2";s:0:"";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 0, 0, 0, 1, 1, 0),
(33, '2015-04-30 06:29:41', '2015-05-06 05:40:50', 2, 1, 'Holiday Special Combo333', 'This 3-star superior hotel is just half a mile from Frankfurt am Main Airport Terminal 2. It features a 24-hour front desk with live flight information, soundproof windows, and free Wi-Fi in public areas.\r\n\r\nThe modern rooms at the Meininger Hotel Frankfurt Main/Airport have a flat-screen TV and an iPod dock. A hairdryer is provided in the private bathroom.\r\n\r\nGuests can prepare meals in the shared kitchen, and light snacks and drinks can be ordered at the bar.\r\n\r\nFrankfurt am Main Flughafen Fernbahnhof Train Station is just under 1 mile from the hotel, and the center of Frankfurt is a 15-minute drive away. The hotel offers a free shuttle service from the airport to the hotel.', 600.00, 120.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-05-23 00:00:00', '2015-05-24 00:00:00', '2015-04-22 19:28:00', '2015-05-13 10:18:00', '2015-05-13 00:00:00', 4, 'a:14:{s:6:"site_1";s:4:"1200";s:6:"site_2";s:3:"800";s:6:"site_3";s:3:"900";s:6:"site_4";s:3:"950";s:6:"site_5";s:3:"850";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '5', '2', 5, 0, 0, 1, 1, 0),
(19, '2015-03-13 06:57:15', '2015-04-22 10:19:57', 2, 3, 'My edit offer2', 'sdfsdfsdfs', 4575.00, 0.00, 0.00, 453.00, '0000-00-00 00:00:00', 0.00, 451.00, '0', '2015-05-25 00:00:00', '2015-05-26 00:00:00', '2015-05-13 11:26:00', '2015-05-20 05:26:00', '2015-05-21 00:00:00', 2, 'a:14:{s:6:"site_1";s:0:"";s:6:"site_2";s:0:"";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '5,3', '1,5', 24, 0, 0, 1, 1, 0),
(20, '2015-03-28 07:58:02', '2015-05-20 10:41:44', 2, 1, 'Room types test offer', 'Room types test description', 750.00, 452.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, ',', '2015-06-26 00:00:00', '2015-06-27 00:00:00', '2015-05-20 14:10:00', '2015-06-17 14:10:00', '2015-06-17 00:00:00', 2, 'a:14:{s:6:"site_1";s:0:"";s:6:"site_2";s:0:"";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '6,1', '1,2', 0, 0, 0, 1, 1, 0),
(21, '2015-04-22 10:26:22', '2015-04-24 11:42:15', 2, 3, 'Test Bid', 'Test', 8500.00, 0.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 4500.00, '0', '2015-05-27 00:00:00', '2015-05-28 00:00:00', '2015-05-07 13:55:00', '2015-05-30 13:55:00', '2015-05-30 00:00:00', 3, 'a:14:{s:6:"site_1";s:0:"";s:6:"site_2";s:0:"";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '4', '2', 17, 0, 0, 1, 1, 0),
(31, '2015-04-22 03:35:00', '2015-04-29 08:22:31', 2, 1, 'Holiday Special Combo', 'This 3-star superior hotel is just half a mile from Frankfurt am Main Airport Terminal 2. It features a 24-hour front desk with live flight information, soundproof windows, and free Wi-Fi in public areas.\r\n\r\nThe modern rooms at the Meininger Hotel Frankfurt Main/Airport have a flat-screen TV and an iPod dock. A hairdryer is provided in the private bathroom.\r\n\r\nGuests can prepare meals in the shared kitchen, and light snacks and drinks can be ordered at the bar.\r\n\r\nFrankfurt am Main Flughafen Fernbahnhof Train Station is just under 1 mile from the hotel, and the center of Frankfurt is a 15-minute drive away. The hotel offers a free shuttle service from the airport to the hotel.', 600.00, 120.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-05-23 00:00:00', '2015-05-24 00:00:00', '2015-04-22 19:28:00', '2015-05-13 10:18:00', '2015-05-13 00:00:00', 4, 'a:14:{s:6:"site_1";s:4:"1200";s:6:"site_2";s:3:"800";s:6:"site_3";s:3:"900";s:6:"site_4";s:3:"950";s:6:"site_5";s:3:"850";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '5', '2', 34, 0, 0, 1, 1, 0),
(32, '2015-04-28 05:59:16', '2015-04-28 05:59:16', 2, 3, 'Test Bid', 'Test', 8500.00, 0.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 4500.00, '0', '2015-06-01 00:00:00', '2015-06-03 00:00:00', '2015-05-05 13:55:00', '2015-05-21 13:55:00', '2015-05-21 00:00:00', 3, 'a:14:{s:6:"site_1";s:0:"";s:6:"site_2";s:0:"";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '4,7', '2', 4, 0, 0, 1, 1, 0),
(34, '2015-04-30 06:29:50', '2015-04-30 06:30:20', 2, 1, 'Holiday Special Combo2', 'This 3-star superior hotel is just half a mile from Frankfurt am Main Airport Terminal 2. It features a 24-hour front desk with live flight information, soundproof windows, and free Wi-Fi in public areas.\r\n\r\nThe modern rooms at the Meininger Hotel Frankfurt Main/Airport have a flat-screen TV and an iPod dock. A hairdryer is provided in the private bathroom.\r\n\r\nGuests can prepare meals in the shared kitchen, and light snacks and drinks can be ordered at the bar.\r\n\r\nFrankfurt am Main Flughafen Fernbahnhof Train Station is just under 1 mile from the hotel, and the center of Frankfurt is a 15-minute drive away. The hotel offers a free shuttle service from the airport to the hotel.', 600.00, 120.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-05-23 00:00:00', '2015-05-24 00:00:00', '2015-04-22 19:28:00', '2015-05-13 10:18:00', '2015-05-13 00:00:00', 4, 'a:14:{s:6:"site_1";s:4:"1200";s:6:"site_2";s:3:"800";s:6:"site_3";s:3:"900";s:6:"site_4";s:3:"950";s:6:"site_5";s:3:"850";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '5', '2', 4, 0, 0, 1, 1, 0),
(35, '2015-04-30 06:29:56', '2015-04-30 06:30:08', 2, 1, 'Holiday Special Combo1', 'This 3-star superior hotel is just half a mile from Frankfurt am Main Airport Terminal 2. It features a 24-hour front desk with live flight information, soundproof windows, and free Wi-Fi in public areas.\r\n\r\nThe modern rooms at the Meininger Hotel Frankfurt Main/Airport have a flat-screen TV and an iPod dock. A hairdryer is provided in the private bathroom.\r\n\r\nGuests can prepare meals in the shared kitchen, and light snacks and drinks can be ordered at the bar.\r\n\r\nFrankfurt am Main Flughafen Fernbahnhof Train Station is just under 1 mile from the hotel, and the center of Frankfurt is a 15-minute drive away. The hotel offers a free shuttle service from the airport to the hotel.', 600.00, 120.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-05-23 00:00:00', '2015-05-24 00:00:00', '2015-04-22 19:28:00', '2015-05-13 10:18:00', '2015-05-13 00:00:00', 4, 'a:14:{s:6:"site_1";s:4:"1200";s:6:"site_2";s:3:"800";s:6:"site_3";s:3:"900";s:6:"site_4";s:3:"950";s:6:"site_5";s:3:"850";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '5', '2', 2, 0, 0, 1, 1, 0),
(36, '2015-04-30 06:31:11', '2015-05-07 10:40:58', 2, 3, 'Test Bid44', 'Test', 8500.00, 0.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 4500.00, '0', '2015-05-27 00:00:00', '2015-05-28 00:00:00', '2015-04-22 13:55:00', '2015-05-23 13:55:00', '2015-05-24 00:00:00', 3, 'a:14:{s:6:"site_1";s:0:"";s:6:"site_2";s:0:"";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '7,4', '2', 19, 0, 0, 1, 1, 0),
(37, '2015-04-30 06:37:20', '2015-04-30 06:37:20', 5, 2, 'Luxurious 3 days  at Grand Hyatt', 'This non-smoking hotel is on the corner of the Zeil shopping street in central Frankfurt. It features 3 restaurants, a 24-hour gym and a large spa with an indoor swimming pool. Wi-Fi is free in the lobby, restaurant and bar.\nJust 2.5 miles from Frankfurt Trade Fair, Westin Grand Frankfurt provides spacious and air-conditioned rooms and suites. All rooms feature modern décor, a flat-screen TV and a heated bathroom floor.\nThe Westin Grand''s Emotion Spa showcases a sauna area as well as luxurious health and beauty treatments. The heated pool offers panoramic views of Frankfurt’s Old Town district.', 99.00, 0.00, 2.00, 45.00, '2015-05-12 19:01:46', 99.00, 45.00, '2,7', '2015-05-06 00:00:00', '2015-05-09 00:00:00', '2015-04-08 11:18:00', '2015-04-30 11:18:00', '2015-05-01 00:00:00', 3, 'a:14:{s:6:"site_1";s:3:"167";s:6:"site_2";s:3:"150";s:6:"site_3";s:3:"145";s:6:"site_4";s:3:"135";s:6:"site_5";s:3:"120";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 0, 0, 0, 1, 1, 1),
(38, '2015-04-30 06:38:30', '2015-04-30 06:38:30', 5, 2, 'Luxurious 3 days  at Grand Hyatt', 'This non-smoking hotel is on the corner of the Zeil shopping street in central Frankfurt. It features 3 restaurants, a 24-hour gym and a large spa with an indoor swimming pool. Wi-Fi is free in the lobby, restaurant and bar.\nJust 2.5 miles from Frankfurt Trade Fair, Westin Grand Frankfurt provides spacious and air-conditioned rooms and suites. All rooms feature modern décor, a flat-screen TV and a heated bathroom floor.\nThe Westin Grand''s Emotion Spa showcases a sauna area as well as luxurious health and beauty treatments. The heated pool offers panoramic views of Frankfurt’s Old Town district.', 99.00, 0.00, 2.00, 45.00, '2015-05-20 18:42:30', 99.00, 45.00, '3,10', '2015-06-06 00:00:00', '2015-06-09 00:00:00', '2015-05-16 11:18:00', '2015-05-30 11:18:00', '2015-05-30 00:00:00', 3, 'a:14:{s:6:"site_1";s:3:"167";s:6:"site_2";s:3:"150";s:6:"site_3";s:3:"145";s:6:"site_4";s:3:"135";s:6:"site_5";s:3:"120";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '', '', 2, 0, 0, 1, 1, 1),
(39, '2015-04-30 06:47:34', '2015-04-30 06:47:34', 5, 1, 'Germany National Festival for 2 Days', 'Grand Hotel Frankfurt City has elegant, soundproof rooms with flat-screen TV and laptop safe. They all feature glass shower cubicles.\r\n\r\nGrill specialties, seafood, and wok dishes are only some of the options at the Fleming’s Club restaurant. The summer terrace provides panoramic views. The bar and business lounge are also on the 7th floor.\r\n\r\nGuests staying at Fleming’s Frankfurt City are welcome to use the Finnish sauna, aromatherapy steam room, and spacious gym.', 155.00, 50.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, '0', '2015-06-17 00:00:00', '2015-06-19 00:00:00', '2015-05-12 10:07:00', '2015-06-09 10:07:00', '2015-06-10 00:00:00', 2, 'a:14:{s:6:"site_1";s:3:"250";s:6:"site_2";s:3:"230";s:6:"site_3";s:3:"186";s:6:"site_4";s:3:"170";s:6:"site_5";s:3:"185";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '6', '1', 2, 0, 0, 1, 1, 0),
(40, '2015-05-11 11:42:50', '2015-05-11 12:33:02', 2, 2, 'Test Slump offer nwe', 'sdfsdf', 4500.00, 0.00, 350.00, 3150.00, '2015-05-20 18:42:30', 3000.00, 4200.00, '3,10', '2015-06-17 00:00:00', '2015-06-18 00:00:00', '2015-05-11 15:12:00', '2015-06-10 15:12:00', '2015-06-10 00:00:00', 3, 'a:14:{s:6:"site_1";s:3:"145";s:6:"site_2";s:3:"458";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '6', '1', 15, 0, 0, 1, 1, 1),
(44, '2015-05-11 03:47:16', '2015-05-11 03:47:16', 2, 2, 'Test Slump offer nwe', 'sdfsdf', 4500.00, 0.00, 350.00, 3150.00, '2015-05-20 12:11:59', 3000.00, 4200.00, '3,57', '2015-06-17 00:00:00', '2015-06-18 00:00:00', '2015-05-11 15:12:00', '2015-05-14 15:12:00', '2015-05-14 00:00:00', 3, 'a:14:{s:6:"site_1";s:3:"145";s:6:"site_2";s:3:"458";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '6', '1', 0, 0, 0, 0, 1, 0),
(43, '2015-05-11 03:45:52', '2015-05-11 03:45:52', 2, 2, 'Test Slump offer nwe', 'sdfsdf', 4500.00, 0.00, 350.00, 3150.00, '2015-05-20 12:11:59', 3000.00, 4200.00, '3,57', '2015-06-17 00:00:00', '2015-06-18 00:00:00', '2015-05-11 15:12:00', '2015-05-14 15:12:00', '2015-05-14 00:00:00', 3, 'a:14:{s:6:"site_1";s:3:"145";s:6:"site_2";s:3:"458";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '6', '1', 0, 0, 0, 0, 1, 0),
(45, '2015-05-18 02:00:18', '0000-00-00 00:00:00', 2, 2, 'dsfsdf', 'dfsfsdf', 8788.00, 0.00, 250.00, 4250.00, '2015-05-20 12:11:59', 4200.00, 8500.00, '2,7', '2015-06-23 00:00:00', '2015-06-25 00:00:00', '2015-05-18 17:29:00', '2015-05-20 17:29:00', '2015-06-22 00:00:00', 2, 'a:14:{s:6:"site_1";s:0:"";s:6:"site_2";s:0:"";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '6', '1', 0, 0, 0, 0, 0, 0),
(46, '2015-05-20 08:41:59', '2015-05-20 10:38:02', 2, 2, 'My Slump Offer', 'sdfsdf', 4500.00, 0.00, 350.00, 3150.00, '2015-05-20 15:19:02', 3000.00, 4200.00, '3,10', '2015-06-17 00:00:00', '2015-06-18 00:00:00', '2015-05-11 15:12:00', '2015-06-10 15:12:00', '2015-06-10 00:00:00', 3, 'a:14:{s:6:"site_1";s:3:"145";s:6:"site_2";s:3:"458";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '6', '1', 48, 0, 0, 1, 1, 0),
(47, '2015-05-20 10:42:22', '2015-05-20 10:42:39', 2, 1, 'Offer Buy test offer', 'Room types test description', 750.00, 452.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, ',', '2015-06-26 00:00:00', '2015-06-27 00:00:00', '2015-05-20 14:10:00', '2015-06-17 14:10:00', '2015-06-17 00:00:00', 2, 'a:14:{s:6:"site_1";s:0:"";s:6:"site_2";s:0:"";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '6,1', '1,2', 1, 0, 0, 1, 1, 0),
(48, '2015-05-20 10:42:52', '2015-05-20 10:43:09', 2, 1, 'Offer Buy test offer 2', 'Room types test description', 750.00, 452.00, 0.00, 0.00, '0000-00-00 00:00:00', 0.00, 0.00, ',', '2015-06-26 00:00:00', '2015-06-27 00:00:00', '2015-05-20 14:10:00', '2015-06-17 14:10:00', '2015-06-17 00:00:00', 2, 'a:14:{s:6:"site_1";s:0:"";s:6:"site_2";s:0:"";s:6:"site_3";s:0:"";s:6:"site_4";s:0:"";s:6:"site_5";s:0:"";s:6:"site_6";s:0:"";s:6:"site_7";s:0:"";s:6:"site_8";s:0:"";s:6:"site_9";s:0:"";s:7:"site_10";s:0:"";s:7:"site_11";s:0:"";s:7:"site_12";s:0:"";s:7:"site_13";s:0:"";s:7:"site_14";s:0:"";}', '6,1', '1,2', 1, 1, 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `offer_amenities`
--

CREATE TABLE IF NOT EXISTS `offer_amenities` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `offer_id` bigint(20) NOT NULL,
  `amenity_id` int(11) NOT NULL,
  `is_featured` tinyint(1) NOT NULL COMMENT '1-Featured,0-None',
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=255 ;

--
-- Dumping data for table `offer_amenities`
--

INSERT INTO `offer_amenities` (`id`, `created`, `modified`, `offer_id`, `amenity_id`, `is_featured`, `is_active`) VALUES
(1, '2015-02-24 06:10:34', '2015-02-24 06:10:34', 1, 7, 1, 1),
(2, '2015-02-24 06:10:34', '2015-02-24 06:10:34', 1, 4, 1, 1),
(3, '2015-02-24 06:10:34', '2015-02-24 06:10:34', 1, 8, 1, 1),
(4, '2015-02-24 06:10:34', '2015-02-24 06:10:34', 1, 3, 0, 1),
(5, '2015-02-24 06:10:34', '2015-02-24 06:10:34', 1, 6, 1, 1),
(6, '2015-02-24 06:10:34', '2015-02-24 06:10:34', 1, 2, 0, 1),
(7, '2015-02-24 06:10:34', '2015-02-24 06:10:34', 1, 14, 1, 1),
(8, '2015-02-24 06:10:34', '2015-02-24 06:10:34', 1, 5, 0, 1),
(9, '2015-02-24 06:10:34', '2015-02-24 06:10:34', 1, 1, 0, 1),
(10, '2015-02-24 06:16:59', '2015-02-24 06:16:59', 2, 14, 1, 1),
(11, '2015-02-24 06:16:59', '2015-02-24 06:16:59', 2, 5, 1, 1),
(12, '2015-02-24 06:16:59', '2015-02-24 06:16:59', 2, 6, 1, 1),
(13, '2015-02-24 06:16:59', '2015-02-24 06:16:59', 2, 8, 1, 1),
(14, '2015-02-24 06:16:59', '2015-02-24 06:16:59', 2, 7, 1, 1),
(15, '2015-02-24 06:16:59', '2015-02-24 06:16:59', 2, 4, 1, 1),
(16, '2015-02-24 06:16:59', '2015-02-24 06:16:59', 2, 3, 1, 1),
(17, '2015-02-24 06:16:59', '2015-02-24 06:16:59', 2, 2, 1, 1),
(18, '2015-02-24 06:16:59', '2015-02-24 06:16:59', 2, 1, 1, 1),
(19, '2015-02-24 06:24:59', '2015-02-24 06:24:59', 3, 8, 0, 1),
(20, '2015-02-24 06:24:59', '2015-02-24 06:24:59', 3, 6, 0, 1),
(21, '2015-02-24 06:24:59', '2015-02-24 06:24:59', 3, 7, 1, 1),
(22, '2015-02-24 06:24:59', '2015-02-24 06:24:59', 3, 4, 1, 1),
(23, '2015-02-24 06:24:59', '2015-02-24 06:24:59', 3, 3, 0, 1),
(24, '2015-02-24 06:24:59', '2015-02-24 06:24:59', 3, 2, 1, 1),
(25, '2015-02-24 06:24:59', '2015-02-24 06:24:59', 3, 1, 0, 1),
(26, '2015-02-24 06:31:10', '2015-02-24 06:31:10', 4, 14, 0, 1),
(27, '2015-02-24 06:31:10', '2015-02-24 06:31:10', 4, 8, 0, 1),
(28, '2015-02-24 06:31:10', '2015-02-24 06:31:10', 4, 5, 1, 1),
(29, '2015-02-24 06:31:10', '2015-02-24 06:31:10', 4, 6, 0, 1),
(30, '2015-02-24 06:31:10', '2015-02-24 06:31:10', 4, 7, 0, 1),
(31, '2015-02-24 06:31:10', '2015-02-24 06:31:10', 4, 4, 1, 1),
(32, '2015-02-24 06:31:10', '2015-02-24 06:31:10', 4, 3, 0, 1),
(33, '2015-02-24 06:31:10', '2015-02-24 06:31:10', 4, 2, 0, 1),
(34, '2015-02-24 06:31:10', '2015-02-24 06:31:10', 4, 1, 1, 1),
(35, '2015-02-24 07:05:14', '2015-02-24 07:05:14', 5, 1, 0, 1),
(36, '2015-02-24 07:05:14', '2015-02-24 07:05:14', 5, 12, 1, 1),
(37, '2015-02-24 07:05:14', '2015-02-24 07:05:14', 5, 13, 1, 1),
(38, '2015-02-24 07:05:14', '2015-02-24 07:05:14', 5, 24, 0, 1),
(58, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 1, 1, 1),
(57, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 6, 1, 1),
(56, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 10, 0, 1),
(55, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 2, 1, 1),
(54, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 5, 1, 1),
(53, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 12, 0, 1),
(52, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 3, 1, 1),
(51, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 4, 1, 1),
(50, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 8, 0, 1),
(49, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 7, 0, 1),
(59, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 5, 0, 1),
(60, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 6, 0, 1),
(61, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 4, 1, 1),
(62, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 8, 1, 1),
(63, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 7, 1, 1),
(64, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 3, 1, 1),
(65, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 2, 1, 1),
(66, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 1, 1, 1),
(158, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 1, 0, 1),
(157, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 2, 0, 1),
(156, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 3, 0, 1),
(155, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 4, 0, 1),
(154, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 5, 0, 1),
(153, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 6, 0, 1),
(152, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 7, 0, 1),
(151, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 8, 0, 1),
(150, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 12, 0, 1),
(76, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 3, 1, 1),
(77, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 8, 1, 1),
(78, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 4, 1, 1),
(79, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 7, 1, 1),
(80, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 5, 1, 1),
(81, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 12, 0, 1),
(82, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 10, 1, 1),
(83, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 6, 1, 1),
(84, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 1, 1, 1),
(85, '2015-02-24 09:16:52', '2015-02-24 09:16:52', 10, 12, 0, 1),
(86, '2015-02-24 09:16:52', '2015-02-24 09:16:52', 10, 5, 1, 1),
(87, '2015-02-24 09:33:47', '2015-02-24 09:33:47', 11, 9, 1, 1),
(88, '2015-02-24 09:33:47', '2015-02-24 09:33:47', 11, 10, 0, 1),
(89, '2015-02-24 09:33:47', '2015-02-24 09:33:47', 11, 12, 0, 1),
(90, '2015-02-24 09:33:47', '2015-02-24 09:33:47', 11, 11, 0, 1),
(91, '2015-02-24 09:33:47', '2015-02-24 09:33:47', 11, 1, 1, 1),
(92, '2015-02-24 09:33:47', '2015-02-24 09:33:47', 11, 2, 1, 1),
(93, '2015-02-24 09:33:47', '2015-02-24 09:33:47', 11, 4, 0, 1),
(94, '2015-02-24 09:33:47', '2015-02-24 09:33:47', 11, 3, 1, 1),
(95, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 1, 1, 1),
(96, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 6, 0, 1),
(97, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 9, 0, 1),
(98, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 10, 0, 1),
(99, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 4, 1, 1),
(100, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 3, 1, 1),
(101, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 7, 1, 1),
(102, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 12, 0, 1),
(103, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 8, 0, 1),
(104, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 10, 0, 1),
(105, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 4, 0, 1),
(106, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 3, 1, 1),
(107, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 6, 0, 1),
(108, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 1, 1, 1),
(109, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 9, 0, 1),
(110, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 11, 0, 1),
(111, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 5, 1, 1),
(112, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 2, 1, 1),
(113, '2015-02-24 10:37:36', '2015-02-24 10:37:36', 14, 12, 0, 1),
(114, '2015-02-24 10:37:36', '2015-02-24 10:37:36', 14, 24, 1, 1),
(115, '2015-02-24 10:37:36', '2015-02-24 10:37:36', 14, 20, 1, 1),
(116, '2015-03-12 12:35:30', '2015-03-12 12:35:30', 17, 2, 0, 1),
(117, '2015-03-12 12:35:30', '2015-03-12 12:35:30', 17, 3, 1, 1),
(118, '2015-03-12 12:35:30', '2015-03-12 12:35:30', 17, 5, 1, 1),
(119, '2015-03-12 12:35:30', '2015-03-12 12:35:30', 17, 6, 0, 1),
(179, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 7, 1, 1),
(178, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 4, 1, 1),
(177, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 8, 1, 1),
(169, '2015-04-22 10:20:00', '2015-04-22 10:20:00', 19, 1, 1, 1),
(165, '2015-03-28 07:58:36', '2015-03-28 07:58:36', 20, 6, 0, 1),
(166, '2015-03-28 07:58:36', '2015-03-28 07:58:36', 20, 5, 0, 1),
(167, '2015-03-28 07:58:36', '2015-03-28 07:58:36', 20, 2, 1, 1),
(168, '2015-03-28 07:58:36', '2015-03-28 07:58:36', 20, 1, 0, 1),
(176, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 3, 1, 1),
(180, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 5, 1, 1),
(181, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 12, 0, 1),
(182, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 10, 1, 1),
(183, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 6, 1, 1),
(184, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 1, 1, 1),
(185, '2015-04-24 11:29:25', '2015-04-24 11:29:25', 21, 1, 0, 1),
(186, '2015-04-28 05:59:16', '2015-04-28 05:59:16', 32, 1, 0, 1),
(187, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 7, 1, 1),
(188, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 4, 1, 1),
(189, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 8, 1, 1),
(190, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 3, 1, 1),
(191, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 5, 1, 1),
(192, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 12, 0, 1),
(193, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 10, 1, 1),
(194, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 6, 1, 1),
(195, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 1, 1, 1),
(196, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 7, 1, 1),
(197, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 4, 1, 1),
(198, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 8, 1, 1),
(199, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 3, 1, 1),
(200, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 5, 1, 1),
(201, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 12, 0, 1),
(202, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 10, 1, 1),
(203, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 6, 1, 1),
(204, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 1, 1, 1),
(205, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 7, 1, 1),
(206, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 4, 1, 1),
(207, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 8, 1, 1),
(208, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 3, 1, 1),
(209, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 5, 1, 1),
(210, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 12, 0, 1),
(211, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 10, 1, 1),
(212, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 6, 1, 1),
(213, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 1, 1, 1),
(214, '2015-04-30 06:31:11', '2015-04-30 06:31:11', 36, 1, 0, 1),
(215, '2015-04-30 06:37:20', '2015-04-30 06:37:20', 37, 14, 1, 1),
(216, '2015-04-30 06:37:20', '2015-04-30 06:37:20', 37, 5, 1, 1),
(217, '2015-04-30 06:37:20', '2015-04-30 06:37:20', 37, 6, 1, 1),
(218, '2015-04-30 06:37:20', '2015-04-30 06:37:20', 37, 8, 1, 1),
(219, '2015-04-30 06:37:20', '2015-04-30 06:37:20', 37, 7, 1, 1),
(220, '2015-04-30 06:37:20', '2015-04-30 06:37:20', 37, 4, 1, 1),
(221, '2015-04-30 06:37:20', '2015-04-30 06:37:20', 37, 3, 1, 1),
(222, '2015-04-30 06:37:20', '2015-04-30 06:37:20', 37, 2, 1, 1),
(223, '2015-04-30 06:37:20', '2015-04-30 06:37:20', 37, 1, 1, 1),
(224, '2015-04-30 06:38:30', '2015-04-30 06:38:30', 38, 14, 1, 1),
(225, '2015-04-30 06:38:30', '2015-04-30 06:38:30', 38, 5, 1, 1),
(226, '2015-04-30 06:38:30', '2015-04-30 06:38:30', 38, 6, 1, 1),
(227, '2015-04-30 06:38:30', '2015-04-30 06:38:30', 38, 8, 1, 1),
(228, '2015-04-30 06:38:30', '2015-04-30 06:38:30', 38, 7, 1, 1),
(229, '2015-04-30 06:38:30', '2015-04-30 06:38:30', 38, 4, 1, 1),
(230, '2015-04-30 06:38:30', '2015-04-30 06:38:30', 38, 3, 1, 1),
(231, '2015-04-30 06:38:30', '2015-04-30 06:38:30', 38, 2, 1, 1),
(232, '2015-04-30 06:38:30', '2015-04-30 06:38:30', 38, 1, 1, 1),
(233, '2015-04-30 06:47:34', '2015-04-30 06:47:34', 39, 14, 0, 1),
(234, '2015-04-30 06:47:34', '2015-04-30 06:47:34', 39, 8, 0, 1),
(235, '2015-04-30 06:47:34', '2015-04-30 06:47:34', 39, 5, 1, 1),
(236, '2015-04-30 06:47:34', '2015-04-30 06:47:34', 39, 6, 0, 1),
(237, '2015-04-30 06:47:34', '2015-04-30 06:47:34', 39, 7, 0, 1),
(238, '2015-04-30 06:47:34', '2015-04-30 06:47:34', 39, 4, 1, 1),
(239, '2015-04-30 06:47:34', '2015-04-30 06:47:34', 39, 3, 0, 1),
(240, '2015-04-30 06:47:34', '2015-04-30 06:47:34', 39, 2, 0, 1),
(241, '2015-04-30 06:47:34', '2015-04-30 06:47:34', 39, 1, 1, 1),
(242, '2015-05-11 11:43:10', '2015-05-11 11:43:10', 40, 1, 1, 1),
(245, '2015-05-11 03:47:16', '2015-05-11 03:47:16', 44, 1, 1, 1),
(244, '2015-05-11 03:45:52', '2015-05-11 03:45:52', 43, 1, 1, 1),
(246, '2015-05-20 08:41:59', '2015-05-20 08:41:59', 46, 1, 1, 1),
(247, '2015-05-20 10:42:22', '2015-05-20 10:42:22', 47, 6, 0, 1),
(248, '2015-05-20 10:42:22', '2015-05-20 10:42:22', 47, 5, 0, 1),
(249, '2015-05-20 10:42:22', '2015-05-20 10:42:22', 47, 2, 1, 1),
(250, '2015-05-20 10:42:22', '2015-05-20 10:42:22', 47, 1, 0, 1),
(251, '2015-05-20 10:42:52', '2015-05-20 10:42:52', 48, 6, 0, 1),
(252, '2015-05-20 10:42:52', '2015-05-20 10:42:52', 48, 5, 0, 1),
(253, '2015-05-20 10:42:52', '2015-05-20 10:42:52', 48, 2, 1, 1),
(254, '2015-05-20 10:42:52', '2015-05-20 10:42:52', 48, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `offer_banners`
--

CREATE TABLE IF NOT EXISTS `offer_banners` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `offer_id` bigint(11) NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_dir` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_info` text COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL COMMENT 'order by show records',
  `banner_type` bigint(20) NOT NULL,
  `is_display` tinyint(1) NOT NULL,
  `is_top_banner` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL COMMENT '1-Deleted',
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=196 ;

--
-- Dumping data for table `offer_banners`
--

INSERT INTO `offer_banners` (`id`, `created`, `modified`, `name`, `offer_id`, `image_name`, `image_dir`, `image_info`, `priority`, `banner_type`, `is_display`, `is_top_banner`, `is_deleted`, `is_active`) VALUES
(165, '2015-04-30 06:37:20', '2015-04-30 06:37:20', '', 37, 'Caymans-0681.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:16:"Caymans-0681.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:72:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Caymans-0681.jpg";s:8:"raw_name";s:12:"Caymans-0681";s:9:"orig_name";s:15:"Caymans-068.jpg";s:11:"client_name";s:15:"Caymans-068.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:3622.239999999999781721271574497222900390625;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 0, 1, 1, 0, 0, 1),
(173, '2015-05-07 07:56:41', '2015-05-07 07:56:41', '', 36, 'Westin-Grand-Cayman-Sundeck.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:31:"Westin-Grand-Cayman-Sundeck.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:87:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Westin-Grand-Cayman-Sundeck.jpg";s:8:"raw_name";s:27:"Westin-Grand-Cayman-Sundeck";s:9:"orig_name";s:31:"Westin-Grand-Cayman-Sundeck.jpg";s:11:"client_name";s:31:"Westin-Grand-Cayman-Sundeck.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:777.779999999999972715158946812152862548828125;s:8:"is_image";b:1;s:11:"image_width";i:1500;s:12:"image_height";i:1125;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1500" height="1125"";}}', 0, 1, 1, 0, 0, 1),
(164, '2015-04-30 06:37:20', '2015-04-30 06:37:20', '', 37, 'rock_climbing_sport_adventure_wallpaper_hd-2.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:48:"rock_climbing_sport_adventure_wallpaper_hd-2.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:104:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/rock_climbing_sport_adventure_wallpaper_hd-2.jpg";s:8:"raw_name";s:44:"rock_climbing_sport_adventure_wallpaper_hd-2";s:9:"orig_name";s:48:"rock_climbing_sport_adventure_wallpaper_hd-2.jpg";s:11:"client_name";s:48:"rock_climbing_sport_adventure_wallpaper_hd-2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:218.1399999999999863575794734060764312744140625;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:680;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="680"";}}', 0, 2, 0, 1, 0, 1),
(160, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 'dfsdfsdf', 35, 'url2.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url2.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:64:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/url2.jpg";s:8:"raw_name";s:4:"url2";s:9:"orig_name";s:8:"url2.jpg";s:11:"client_name";s:8:"url2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:2209.71999999999979991116560995578765869140625;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 1, 3, 0, 0, 0, 1),
(158, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 'dfsdfsdf', 34, 'url2.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url2.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:64:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/url2.jpg";s:8:"raw_name";s:4:"url2";s:9:"orig_name";s:8:"url2.jpg";s:11:"client_name";s:8:"url2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:2209.71999999999979991116560995578765869140625;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 1, 3, 0, 0, 0, 1),
(129, '2015-04-15 14:37:45', '2015-04-15 14:37:45', '', 1, 'Restaurant_72_800x600.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:25:"Restaurant_72_800x600.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:81:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Restaurant_72_800x600.jpg";s:8:"raw_name";s:21:"Restaurant_72_800x600";s:9:"orig_name";s:25:"Restaurant_72_800x600.jpg";s:11:"client_name";s:25:"Restaurant_72_800x600.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:137.270000000000010231815394945442676544189453125;s:8:"is_image";b:1;s:11:"image_width";i:800;s:12:"image_height";i:600;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="800" height="600"";}}', 0, 1, 1, 0, 0, 1),
(130, '2015-04-15 14:38:12', '2015-04-15 14:38:12', '', 2, 'rock_climbing_sport_adventure_wallpaper_hd-2.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:48:"rock_climbing_sport_adventure_wallpaper_hd-2.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:104:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/rock_climbing_sport_adventure_wallpaper_hd-2.jpg";s:8:"raw_name";s:44:"rock_climbing_sport_adventure_wallpaper_hd-2";s:9:"orig_name";s:48:"rock_climbing_sport_adventure_wallpaper_hd-2.jpg";s:11:"client_name";s:48:"rock_climbing_sport_adventure_wallpaper_hd-2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:218.1399999999999863575794734060764312744140625;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:680;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="680"";}}', 0, 2, 0, 1, 0, 1),
(128, '2015-04-15 14:37:38', '2015-04-15 14:37:38', '', 1, '407188031.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:13:"407188031.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:69:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/407188031.jpg";s:8:"raw_name";s:9:"407188031";s:9:"orig_name";s:12:"40718803.jpg";s:11:"client_name";s:12:"40718803.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:152.18000000000000682121026329696178436279296875;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 0, 2, 0, 1, 0, 1),
(151, '2015-04-27 12:22:59', '2015-04-27 12:22:59', '', 31, 'display.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"display.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:67:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/display.jpg";s:8:"raw_name";s:7:"display";s:9:"orig_name";s:11:"display.jpg";s:11:"client_name";s:11:"display.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:171;s:8:"is_image";b:1;s:11:"image_width";i:2048;s:12:"image_height";i:828;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="2048" height="828"";}}', 0, 2, 0, 1, 0, 1),
(154, '2015-04-30 06:29:42', '2015-04-30 06:29:42', '', 33, 'display.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"display.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:67:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/display.jpg";s:8:"raw_name";s:7:"display";s:9:"orig_name";s:11:"display.jpg";s:11:"client_name";s:11:"display.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:171;s:8:"is_image";b:1;s:11:"image_width";i:2048;s:12:"image_height";i:828;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="2048" height="828"";}}', 0, 2, 0, 1, 0, 1),
(155, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 'dfsdfsdf', 33, 'url2.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url2.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:64:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/url2.jpg";s:8:"raw_name";s:4:"url2";s:9:"orig_name";s:8:"url2.jpg";s:11:"client_name";s:8:"url2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:2209.71999999999979991116560995578765869140625;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 1, 3, 0, 0, 0, 1),
(156, '2015-04-30 06:29:42', '2015-04-30 06:29:42', '', 33, '15319607.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"15319607.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:68:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/15319607.jpg";s:8:"raw_name";s:8:"15319607";s:9:"orig_name";s:12:"15319607.jpg";s:11:"client_name";s:12:"15319607.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:93.7999999999999971578290569595992565155029296875;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 0, 1, 1, 0, 0, 1),
(131, '2015-04-15 14:38:20', '2015-04-15 14:38:20', '', 2, 'Caymans-0681.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:16:"Caymans-0681.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:72:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Caymans-0681.jpg";s:8:"raw_name";s:12:"Caymans-0681";s:9:"orig_name";s:15:"Caymans-068.jpg";s:11:"client_name";s:15:"Caymans-068.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:3622.239999999999781721271574497222900390625;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 0, 1, 1, 0, 0, 1),
(135, '2015-04-22 08:02:58', '2015-04-22 08:02:58', '', 19, 'eser-premium-hotel-spa4.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:27:"eser-premium-hotel-spa4.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:83:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/eser-premium-hotel-spa4.jpg";s:8:"raw_name";s:23:"eser-premium-hotel-spa4";s:9:"orig_name";s:26:"eser-premium-hotel-spa.jpg";s:11:"client_name";s:26:"eser-premium-hotel-spa.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:44.8299999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:550;s:12:"image_height";i:365;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="550" height="365"";}}', 0, 1, 1, 0, 0, 1),
(134, '2015-04-22 08:00:41', '2015-04-22 08:00:41', '', 19, 'eser-premium-hotel-spa3.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:27:"eser-premium-hotel-spa3.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:83:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/eser-premium-hotel-spa3.jpg";s:8:"raw_name";s:23:"eser-premium-hotel-spa3";s:9:"orig_name";s:26:"eser-premium-hotel-spa.jpg";s:11:"client_name";s:26:"eser-premium-hotel-spa.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:44.8299999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:550;s:12:"image_height";i:365;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="550" height="365"";}}', 0, 2, 0, 1, 0, 1),
(136, '2015-04-22 10:27:06', '2015-04-22 10:27:06', '', 21, 'eser-premium-hotel-spa5.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:27:"eser-premium-hotel-spa5.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:83:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/eser-premium-hotel-spa5.jpg";s:8:"raw_name";s:23:"eser-premium-hotel-spa5";s:9:"orig_name";s:26:"eser-premium-hotel-spa.jpg";s:11:"client_name";s:26:"eser-premium-hotel-spa.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:44.8299999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:550;s:12:"image_height";i:365;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="550" height="365"";}}', 0, 1, 1, 0, 0, 1),
(157, '2015-04-30 06:29:50', '2015-04-30 06:29:50', '', 34, 'display.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"display.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:67:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/display.jpg";s:8:"raw_name";s:7:"display";s:9:"orig_name";s:11:"display.jpg";s:11:"client_name";s:11:"display.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:171;s:8:"is_image";b:1;s:11:"image_width";i:2048;s:12:"image_height";i:828;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="2048" height="828"";}}', 0, 2, 0, 1, 0, 1),
(125, '2015-04-15 14:13:35', '2015-04-15 14:13:35', '', 3, 'Beautiful_Nature_Desktop_wallpapers_Hd2.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:43:"Beautiful_Nature_Desktop_wallpapers_Hd2.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:99:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Beautiful_Nature_Desktop_wallpapers_Hd2.jpg";s:8:"raw_name";s:39:"Beautiful_Nature_Desktop_wallpapers_Hd2";s:9:"orig_name";s:42:"Beautiful_Nature_Desktop_wallpapers_Hd.jpg";s:11:"client_name";s:42:"Beautiful_Nature_Desktop_wallpapers_Hd.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:417.42000000000001591615728102624416351318359375;s:8:"is_image";b:1;s:11:"image_width";i:1280;s:12:"image_height";i:800;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1280" height="800"";}}', 0, 1, 1, 0, 0, 1),
(168, '2015-04-30 06:39:17', '2015-04-30 06:39:17', '', 38, 'Novetel_very_practical_clothes_closet.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:41:"Novetel_very_practical_clothes_closet.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:97:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Novetel_very_practical_clothes_closet.jpg";s:8:"raw_name";s:37:"Novetel_very_practical_clothes_closet";s:9:"orig_name";s:41:"Novetel_very_practical_clothes_closet.jpg";s:11:"client_name";s:41:"Novetel very practical clothes closet.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:1078.19000000000005456968210637569427490234375;s:8:"is_image";b:1;s:11:"image_width";i:1920;s:12:"image_height";i:2560;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1920" height="2560"";}}', 0, 1, 1, 0, 0, 1),
(170, '2015-04-30 06:47:34', '2015-04-30 06:47:34', '', 39, 'Beautiful_Nature_Desktop_wallpapers_Hd1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:43:"Beautiful_Nature_Desktop_wallpapers_Hd1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:99:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Beautiful_Nature_Desktop_wallpapers_Hd1.jpg";s:8:"raw_name";s:39:"Beautiful_Nature_Desktop_wallpapers_Hd1";s:9:"orig_name";s:42:"Beautiful_Nature_Desktop_wallpapers_Hd.jpg";s:11:"client_name";s:42:"Beautiful_Nature_Desktop_wallpapers_Hd.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:417.42000000000001591615728102624416351318359375;s:8:"is_image";b:1;s:11:"image_width";i:1280;s:12:"image_height";i:800;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1280" height="800"";}}', 0, 1, 1, 0, 0, 1),
(124, '2015-04-15 14:12:54', '2015-04-15 14:12:54', '', 4, 'Beautiful_Nature_Desktop_wallpapers_Hd1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:43:"Beautiful_Nature_Desktop_wallpapers_Hd1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:99:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Beautiful_Nature_Desktop_wallpapers_Hd1.jpg";s:8:"raw_name";s:39:"Beautiful_Nature_Desktop_wallpapers_Hd1";s:9:"orig_name";s:42:"Beautiful_Nature_Desktop_wallpapers_Hd.jpg";s:11:"client_name";s:42:"Beautiful_Nature_Desktop_wallpapers_Hd.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:417.42000000000001591615728102624416351318359375;s:8:"is_image";b:1;s:11:"image_width";i:1280;s:12:"image_height";i:800;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1280" height="800"";}}', 0, 1, 1, 0, 0, 1),
(122, '2015-04-15 14:12:13', '2015-04-15 14:12:13', 'sfsdf', 4, 'eser-premium-hotel-spa.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:26:"eser-premium-hotel-spa.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:82:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/eser-premium-hotel-spa.jpg";s:8:"raw_name";s:22:"eser-premium-hotel-spa";s:9:"orig_name";s:26:"eser-premium-hotel-spa.jpg";s:11:"client_name";s:26:"eser-premium-hotel-spa.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:44.8299999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:550;s:12:"image_height";i:365;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="550" height="365"";}}', 1, 3, 0, 0, 0, 1),
(27, '2015-02-24 07:09:04', '2015-02-24 07:09:04', '', 5, 'url3.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url3.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:56:"/home/development/php/hobitel/app_data/auctions/url3.jpg";s:8:"raw_name";s:4:"url3";s:9:"orig_name";s:8:"url3.jpg";s:11:"client_name";s:8:"url3.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:250.580000000000012505552149377763271331787109375;s:8:"is_image";b:1;s:11:"image_width";i:2100;s:12:"image_height";i:1468;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="2100" height="1468"";}}', 0, 0, 0, 1, 0, 0),
(28, '2015-02-24 07:09:18', '2015-02-24 07:09:18', '', 5, 'url5.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url5.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:56:"/home/development/php/hobitel/app_data/auctions/url5.jpg";s:8:"raw_name";s:4:"url5";s:9:"orig_name";s:8:"url5.jpg";s:11:"client_name";s:8:"url5.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:2030.180000000000063664629124104976654052734375;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 0, 0, 1, 0, 0, 0),
(30, '2015-02-24 07:10:10', '2015-02-24 07:10:10', 'offer banner1', 5, 'Spa_Suit.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"Spa_Suit.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:60:"/home/development/php/hobitel/app_data/auctions/Spa_Suit.jpg";s:8:"raw_name";s:8:"Spa_Suit";s:9:"orig_name";s:12:"Spa_Suit.jpg";s:11:"client_name";s:12:"Spa_Suit.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:797.2100000000000363797880709171295166015625;s:8:"is_image";b:1;s:11:"image_width";i:2362;s:12:"image_height";i:1868;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="2362" height="1868"";}}', 1, 0, 0, 0, 0, 0),
(31, '2015-02-24 07:10:24', '2015-02-24 07:10:24', 'offer banner 2', 5, 'url.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:7:"url.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:55:"/home/development/php/hobitel/app_data/auctions/url.jpg";s:8:"raw_name";s:3:"url";s:9:"orig_name";s:7:"url.jpg";s:11:"client_name";s:7:"url.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:3254.3800000000001091393642127513885498046875;s:8:"is_image";b:1;s:11:"image_width";i:3264;s:12:"image_height";i:2448;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="3264" height="2448"";}}', 2, 0, 0, 0, 0, 0),
(32, '2015-02-24 07:10:43', '2015-02-24 07:10:43', 'offer banner3', 5, 'url2.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url2.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:56:"/home/development/php/hobitel/app_data/auctions/url2.jpg";s:8:"raw_name";s:4:"url2";s:9:"orig_name";s:8:"url2.jpg";s:11:"client_name";s:8:"url2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:796.279999999999972715158946812152862548828125;s:8:"is_image";b:1;s:11:"image_width";i:2100;s:12:"image_height";i:1617;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="2100" height="1617"";}}', 3, 0, 0, 0, 0, 0),
(33, '2015-02-24 07:10:54', '2015-02-24 07:10:54', 'offer banner4', 5, 'url4.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url4.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:56:"/home/development/php/hobitel/app_data/auctions/url4.jpg";s:8:"raw_name";s:4:"url4";s:9:"orig_name";s:8:"url4.jpg";s:11:"client_name";s:8:"url4.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:462.240000000000009094947017729282379150390625;s:8:"is_image";b:1;s:11:"image_width";i:1632;s:12:"image_height";i:1224;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1632" height="1224"";}}', 4, 0, 0, 0, 0, 0),
(34, '2015-02-24 07:11:03', '2015-02-24 07:11:03', 'offer banner5', 5, 'url51.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:9:"url51.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:57:"/home/development/php/hobitel/app_data/auctions/url51.jpg";s:8:"raw_name";s:5:"url51";s:9:"orig_name";s:8:"url5.jpg";s:11:"client_name";s:8:"url5.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:2030.180000000000063664629124104976654052734375;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 5, 0, 0, 0, 0, 0),
(35, '2015-02-24 07:11:16', '2015-02-24 07:11:16', 'offer banner6', 5, 'url6.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url6.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:56:"/home/development/php/hobitel/app_data/auctions/url6.jpg";s:8:"raw_name";s:4:"url6";s:9:"orig_name";s:8:"url6.jpg";s:11:"client_name";s:8:"url6.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:172.520000000000010231815394945442676544189453125;s:8:"is_image";b:1;s:11:"image_width";i:1600;s:12:"image_height";i:640;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1600" height="640"";}}', 5, 0, 0, 0, 0, 0),
(43, '2015-02-24 07:29:47', '2015-02-24 07:29:47', '', 6, 'image22.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"image22.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/image22.jpg";s:8:"raw_name";s:7:"image22";s:9:"orig_name";s:10:"image2.jpg";s:11:"client_name";s:10:"image2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:25.129999999999999005240169935859739780426025390625;s:8:"is_image";b:1;s:11:"image_width";i:302;s:12:"image_height";i:352;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="302" height="352"";}}', 0, 0, 1, 0, 0, 0),
(37, '2015-02-24 07:26:48', '2015-02-24 07:26:48', '1', 6, 'hotel11.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"hotel11.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/hotel11.jpg";s:8:"raw_name";s:7:"hotel11";s:9:"orig_name";s:10:"hotel1.jpg";s:11:"client_name";s:10:"hotel1.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:34.85000000000000142108547152020037174224853515625;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 1, 0, 0, 0, 0, 0),
(38, '2015-02-24 07:26:54', '2015-02-24 07:26:54', '2', 6, 'hotel23.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"hotel23.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/hotel23.jpg";s:8:"raw_name";s:7:"hotel23";s:9:"orig_name";s:10:"hotel2.jpg";s:11:"client_name";s:10:"hotel2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:27.1400000000000005684341886080801486968994140625;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 2, 0, 0, 0, 0, 0),
(39, '2015-02-24 07:27:01', '2015-02-24 07:27:01', '3', 6, 'hotel32.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"hotel32.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/hotel32.jpg";s:8:"raw_name";s:7:"hotel32";s:9:"orig_name";s:10:"hotel3.jpg";s:11:"client_name";s:10:"hotel3.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:41.85000000000000142108547152020037174224853515625;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 3, 0, 0, 0, 0, 0),
(40, '2015-02-24 07:27:09', '2015-02-24 07:27:09', '4', 6, 'hotel41.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"hotel41.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/hotel41.jpg";s:8:"raw_name";s:7:"hotel41";s:9:"orig_name";s:10:"hotel4.jpg";s:11:"client_name";s:10:"hotel4.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:28.89999999999999857891452847979962825775146484375;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 4, 0, 0, 0, 0, 0),
(41, '2015-02-24 07:27:15', '2015-02-24 07:27:15', '5', 6, 'hotel51.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"hotel51.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/hotel51.jpg";s:8:"raw_name";s:7:"hotel51";s:9:"orig_name";s:10:"hotel5.jpg";s:11:"client_name";s:10:"hotel5.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:33.25999999999999801048033987171947956085205078125;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 5, 0, 0, 0, 0, 0),
(42, '2015-02-24 07:28:01', '2015-02-24 07:28:01', '6', 6, 'hotel61.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"hotel61.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/hotel61.jpg";s:8:"raw_name";s:7:"hotel61";s:9:"orig_name";s:10:"hotel6.jpg";s:11:"client_name";s:10:"hotel6.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:32.219999999999998863131622783839702606201171875;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 6, 0, 0, 0, 0, 0),
(90, '2015-02-24 10:48:05', '2015-02-24 10:48:05', '', 7, 'aleenta_resort_and_spa_hua_hin_huhhqah_herosquare1.jpeg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:55:"aleenta_resort_and_spa_hua_hin_huhhqah_herosquare1.jpeg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:103:"/home/development/php/hobitel/app_data/auctions/aleenta_resort_and_spa_hua_hin_huhhqah_herosquare1.jpeg";s:8:"raw_name";s:50:"aleenta_resort_and_spa_hua_hin_huhhqah_herosquare1";s:9:"orig_name";s:54:"aleenta_resort_and_spa_hua_hin_huhhqah_herosquare.jpeg";s:11:"client_name";s:54:"aleenta_resort_and_spa_hua_hin_huhhqah_herosquare.jpeg";s:8:"file_ext";s:5:".jpeg";s:9:"file_size";d:131.1299999999999954525264911353588104248046875;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:300;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="300"";}}', 0, 0, 1, 0, 0, 0),
(45, '2015-02-24 08:45:06', '2015-02-24 08:45:06', '1', 7, 'image141.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"image141.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:60:"/home/development/php/hobitel/app_data/auctions/image141.jpg";s:8:"raw_name";s:8:"image141";s:9:"orig_name";s:11:"image14.jpg";s:11:"client_name";s:11:"image14.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:21.85000000000000142108547152020037174224853515625;s:8:"is_image";b:1;s:11:"image_width";i:302;s:12:"image_height";i:351;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="302" height="351"";}}', 1, 0, 0, 0, 0, 0),
(46, '2015-02-24 08:45:12', '2015-02-24 08:45:12', '2', 7, 'image142.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"image142.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:60:"/home/development/php/hobitel/app_data/auctions/image142.jpg";s:8:"raw_name";s:8:"image142";s:9:"orig_name";s:11:"image14.jpg";s:11:"client_name";s:11:"image14.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:21.85000000000000142108547152020037174224853515625;s:8:"is_image";b:1;s:11:"image_width";i:302;s:12:"image_height";i:351;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="302" height="351"";}}', 2, 0, 0, 0, 0, 0),
(47, '2015-02-24 08:45:20', '2015-02-24 08:45:20', '3', 7, 'image153.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"image153.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:60:"/home/development/php/hobitel/app_data/auctions/image153.jpg";s:8:"raw_name";s:8:"image153";s:9:"orig_name";s:11:"image15.jpg";s:11:"client_name";s:11:"image15.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:28.57000000000000028421709430404007434844970703125;s:8:"is_image";b:1;s:11:"image_width";i:302;s:12:"image_height";i:351;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="302" height="351"";}}', 3, 0, 0, 0, 0, 0),
(48, '2015-02-24 08:45:27', '2015-02-24 08:45:27', '4', 7, 'image5_1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"image5_1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:60:"/home/development/php/hobitel/app_data/auctions/image5_1.jpg";s:8:"raw_name";s:8:"image5_1";s:9:"orig_name";s:12:"image5_1.jpg";s:11:"client_name";s:12:"image5_1.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:21.620000000000000994759830064140260219573974609375;s:8:"is_image";b:1;s:11:"image_width";i:302;s:12:"image_height";i:351;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="302" height="351"";}}', 4, 0, 0, 0, 0, 0),
(49, '2015-02-24 08:45:38', '2015-02-24 08:45:38', '5', 7, 'image51.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"image51.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/image51.jpg";s:8:"raw_name";s:7:"image51";s:9:"orig_name";s:10:"image5.jpg";s:11:"client_name";s:10:"image5.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:30.0799999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 5, 0, 0, 0, 0, 0),
(50, '2015-02-24 08:45:48', '2015-02-24 08:45:48', '6', 7, 'image4.png', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:10:"image4.png";s:9:"file_type";s:9:"image/png";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:58:"/home/development/php/hobitel/app_data/auctions/image4.png";s:8:"raw_name";s:6:"image4";s:9:"orig_name";s:10:"image4.png";s:11:"client_name";s:10:"image4.png";s:8:"file_ext";s:4:".png";s:9:"file_size";d:220.6399999999999863575794734060764312744140625;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:3:"png";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 6, 0, 0, 0, 0, 0),
(51, '2015-02-24 08:51:34', '2015-02-24 08:51:34', '', 8, 'image8_1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"image8_1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:60:"/home/development/php/hobitel/app_data/auctions/image8_1.jpg";s:8:"raw_name";s:8:"image8_1";s:9:"orig_name";s:12:"image8_1.jpg";s:11:"client_name";s:12:"image8_1.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:23.1400000000000005684341886080801486968994140625;s:8:"is_image";b:1;s:11:"image_width";i:302;s:12:"image_height";i:351;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="302" height="351"";}}', 0, 0, 1, 0, 0, 0),
(52, '2015-02-24 08:51:42', '2015-02-24 08:51:42', '1', 8, 'hotel12.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"hotel12.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/hotel12.jpg";s:8:"raw_name";s:7:"hotel12";s:9:"orig_name";s:10:"hotel1.jpg";s:11:"client_name";s:10:"hotel1.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:34.85000000000000142108547152020037174224853515625;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 1, 0, 0, 0, 0, 0),
(53, '2015-02-24 08:51:47', '2015-02-24 08:51:47', '2', 8, 'hotel24.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"hotel24.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/hotel24.jpg";s:8:"raw_name";s:7:"hotel24";s:9:"orig_name";s:10:"hotel2.jpg";s:11:"client_name";s:10:"hotel2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:27.1400000000000005684341886080801486968994140625;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 2, 0, 0, 0, 0, 0),
(54, '2015-02-24 08:51:53', '2015-02-24 08:51:53', '3', 8, 'hotel33.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"hotel33.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/hotel33.jpg";s:8:"raw_name";s:7:"hotel33";s:9:"orig_name";s:10:"hotel3.jpg";s:11:"client_name";s:10:"hotel3.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:41.85000000000000142108547152020037174224853515625;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 3, 0, 0, 0, 0, 0),
(55, '2015-02-24 08:51:59', '2015-02-24 08:51:59', '4', 8, 'hotel42.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"hotel42.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/hotel42.jpg";s:8:"raw_name";s:7:"hotel42";s:9:"orig_name";s:10:"hotel4.jpg";s:11:"client_name";s:10:"hotel4.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:28.89999999999999857891452847979962825775146484375;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 4, 0, 0, 0, 0, 0),
(56, '2015-02-24 08:52:06', '2015-02-24 08:52:06', '5', 8, 'hotel52.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"hotel52.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/hotel52.jpg";s:8:"raw_name";s:7:"hotel52";s:9:"orig_name";s:10:"hotel5.jpg";s:11:"client_name";s:10:"hotel5.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:33.25999999999999801048033987171947956085205078125;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 5, 0, 0, 0, 0, 0),
(57, '2015-02-24 08:52:14', '2015-02-24 08:52:14', '6', 8, 'image17.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"image17.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/image17.jpg";s:8:"raw_name";s:7:"image17";s:9:"orig_name";s:11:"image17.jpg";s:11:"client_name";s:11:"image17.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:28.60000000000000142108547152020037174224853515625;s:8:"is_image";b:1;s:11:"image_width";i:302;s:12:"image_height";i:351;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="302" height="351"";}}', 6, 0, 0, 0, 0, 0),
(162, '2015-04-30 06:29:56', '2015-04-30 06:29:56', '', 35, '15319607.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"15319607.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:68:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/15319607.jpg";s:8:"raw_name";s:8:"15319607";s:9:"orig_name";s:12:"15319607.jpg";s:11:"client_name";s:12:"15319607.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:93.7999999999999971578290569595992565155029296875;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 0, 1, 1, 0, 0, 1),
(161, '2015-04-30 06:29:56', '2015-04-30 06:29:56', '', 35, 'display.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"display.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:67:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/display.jpg";s:8:"raw_name";s:7:"display";s:9:"orig_name";s:11:"display.jpg";s:11:"client_name";s:11:"display.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:171;s:8:"is_image";b:1;s:11:"image_width";i:2048;s:12:"image_height";i:828;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="2048" height="828"";}}', 0, 2, 0, 1, 0, 1),
(114, '2015-03-12 12:35:37', '2015-03-12 12:35:37', '', 17, 'maxresdefault5.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:18:"maxresdefault5.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:74:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/maxresdefault5.jpg";s:8:"raw_name";s:14:"maxresdefault5";s:9:"orig_name";s:17:"maxresdefault.jpg";s:11:"client_name";s:17:"maxresdefault.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:50.6700000000000017053025658242404460906982421875;s:8:"is_image";b:1;s:11:"image_width";i:1280;s:12:"image_height";i:720;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1280" height="720"";}}', 0, 0, 1, 0, 0, 0),
(138, '2015-04-22 15:32:52', '2015-04-22 15:32:52', '', 20, 'eser-premium-hotel-spa7.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:27:"eser-premium-hotel-spa7.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:83:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/eser-premium-hotel-spa7.jpg";s:8:"raw_name";s:23:"eser-premium-hotel-spa7";s:9:"orig_name";s:26:"eser-premium-hotel-spa.jpg";s:11:"client_name";s:26:"eser-premium-hotel-spa.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:44.8299999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:550;s:12:"image_height";i:365;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="550" height="365"";}}', 0, 1, 1, 0, 0, 1),
(62, '2015-02-24 08:59:13', '2015-02-24 08:59:13', '4', 9, 'hotel53.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"hotel53.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/hotel53.jpg";s:8:"raw_name";s:7:"hotel53";s:9:"orig_name";s:10:"hotel5.jpg";s:11:"client_name";s:10:"hotel5.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:33.25999999999999801048033987171947956085205078125;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 4, 0, 0, 0, 0, 0),
(63, '2015-02-24 08:59:23', '2015-02-24 08:59:23', '5', 9, 'image5_11.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:13:"image5_11.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:61:"/home/development/php/hobitel/app_data/auctions/image5_11.jpg";s:8:"raw_name";s:9:"image5_11";s:9:"orig_name";s:12:"image5_1.jpg";s:11:"client_name";s:12:"image5_1.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:21.620000000000000994759830064140260219573974609375;s:8:"is_image";b:1;s:11:"image_width";i:302;s:12:"image_height";i:351;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="302" height="351"";}}', 5, 0, 0, 0, 0, 0),
(64, '2015-02-24 08:59:37', '2015-02-24 08:59:37', '6', 9, 'hotel35.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"hotel35.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/hotel35.jpg";s:8:"raw_name";s:7:"hotel35";s:9:"orig_name";s:10:"hotel3.jpg";s:11:"client_name";s:10:"hotel3.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:41.85000000000000142108547152020037174224853515625;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:427;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="427"";}}', 6, 0, 0, 0, 0, 0),
(65, '2015-02-24 09:18:20', '2015-02-24 09:18:20', '', 10, '8465188822_7b4946655a.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:25:"8465188822_7b4946655a.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:73:"/home/development/php/hobitel/app_data/auctions/8465188822_7b4946655a.jpg";s:8:"raw_name";s:21:"8465188822_7b4946655a";s:9:"orig_name";s:25:"8465188822_7b4946655a.jpg";s:11:"client_name";s:25:"8465188822_7b4946655a.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:140.229999999999989768184605054557323455810546875;s:8:"is_image";b:1;s:11:"image_width";i:500;s:12:"image_height";i:387;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="500" height="387"";}}', 0, 0, 0, 1, 0, 0),
(66, '2015-02-24 09:19:48', '2015-02-24 09:19:48', '', 10, 'itc-grand-central-luxury-collection-hotel-mumbai_1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:54:"itc-grand-central-luxury-collection-hotel-mumbai_1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:102:"/home/development/php/hobitel/app_data/auctions/itc-grand-central-luxury-collection-hotel-mumbai_1.jpg";s:8:"raw_name";s:50:"itc-grand-central-luxury-collection-hotel-mumbai_1";s:9:"orig_name";s:54:"itc-grand-central-luxury-collection-hotel-mumbai_1.jpg";s:11:"client_name";s:54:"itc-grand-central-luxury-collection-hotel-mumbai_1.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:234.460000000000007958078640513122081756591796875;s:8:"is_image";b:1;s:11:"image_width";i:1400;s:12:"image_height";i:780;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1400" height="780"";}}', 0, 0, 1, 0, 0, 0),
(67, '2015-02-24 09:21:00', '2015-02-24 09:21:00', 'Swimming fool', 10, '8464093373_cebf9a7fed.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:25:"8464093373_cebf9a7fed.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:73:"/home/development/php/hobitel/app_data/auctions/8464093373_cebf9a7fed.jpg";s:8:"raw_name";s:21:"8464093373_cebf9a7fed";s:9:"orig_name";s:25:"8464093373_cebf9a7fed.jpg";s:11:"client_name";s:25:"8464093373_cebf9a7fed.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:117.5;s:8:"is_image";b:1;s:11:"image_width";i:500;s:12:"image_height";i:375;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="500" height="375"";}}', 2, 0, 0, 0, 0, 0),
(68, '2015-02-24 09:21:10', '2015-02-24 09:21:10', 'Dining', 10, '8465186650_e486c8666a.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:25:"8465186650_e486c8666a.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:73:"/home/development/php/hobitel/app_data/auctions/8465186650_e486c8666a.jpg";s:8:"raw_name";s:21:"8465186650_e486c8666a";s:9:"orig_name";s:25:"8465186650_e486c8666a.jpg";s:11:"client_name";s:25:"8465186650_e486c8666a.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:125.1200000000000045474735088646411895751953125;s:8:"is_image";b:1;s:11:"image_width";i:500;s:12:"image_height";i:375;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="500" height="375"";}}', 3, 0, 0, 0, 0, 0),
(69, '2015-02-24 09:21:21', '2015-02-24 09:21:21', 'Bed', 10, 'itc-grand-central-luxury-collection-hotel-mumbai_8.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:54:"itc-grand-central-luxury-collection-hotel-mumbai_8.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:102:"/home/development/php/hobitel/app_data/auctions/itc-grand-central-luxury-collection-hotel-mumbai_8.jpg";s:8:"raw_name";s:50:"itc-grand-central-luxury-collection-hotel-mumbai_8";s:9:"orig_name";s:54:"itc-grand-central-luxury-collection-hotel-mumbai_8.jpg";s:11:"client_name";s:54:"itc-grand-central-luxury-collection-hotel-mumbai_8.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:181.31000000000000227373675443232059478759765625;s:8:"is_image";b:1;s:11:"image_width";i:1400;s:12:"image_height";i:780;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1400" height="780"";}}', 1, 0, 0, 0, 0, 0),
(70, '2015-02-24 09:21:47', '2015-02-24 09:21:47', 'Park', 10, 'maxresdefault.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:17:"maxresdefault.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:65:"/home/development/php/hobitel/app_data/auctions/maxresdefault.jpg";s:8:"raw_name";s:13:"maxresdefault";s:9:"orig_name";s:17:"maxresdefault.jpg";s:11:"client_name";s:17:"maxresdefault.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:86.8299999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:1280;s:12:"image_height";i:720;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1280" height="720"";}}', 4, 0, 0, 0, 0, 0);
INSERT INTO `offer_banners` (`id`, `created`, `modified`, `name`, `offer_id`, `image_name`, `image_dir`, `image_info`, `priority`, `banner_type`, `is_display`, `is_top_banner`, `is_deleted`, `is_active`) VALUES
(71, '2015-02-24 09:34:08', '2015-02-24 09:34:08', '', 11, 'akyramanor_hucnxam_herosquare.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:33:"akyramanor_hucnxam_herosquare.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:81:"/home/development/php/hobitel/app_data/auctions/akyramanor_hucnxam_herosquare.jpg";s:8:"raw_name";s:29:"akyramanor_hucnxam_herosquare";s:9:"orig_name";s:33:"akyramanor_hucnxam_herosquare.jpg";s:11:"client_name";s:33:"akyramanor_hucnxam_herosquare.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:26.949999999999999289457264239899814128875732421875;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:300;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="300"";}}', 0, 0, 1, 0, 0, 0),
(72, '2015-02-24 09:34:51', '2015-02-24 09:34:51', '1', 11, 'scheme-a_exterior_final.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:27:"scheme-a_exterior_final.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:75:"/home/development/php/hobitel/app_data/auctions/scheme-a_exterior_final.jpg";s:8:"raw_name";s:23:"scheme-a_exterior_final";s:9:"orig_name";s:27:"scheme-a_exterior_final.jpg";s:11:"client_name";s:27:"scheme-a_exterior_final.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:412.1299999999999954525264911353588104248046875;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:488;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="488"";}}', 1, 0, 0, 0, 0, 0),
(73, '2015-02-24 09:34:57', '2015-02-24 09:34:57', '2', 11, 'scheme-b_exterior_final.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:27:"scheme-b_exterior_final.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:75:"/home/development/php/hobitel/app_data/auctions/scheme-b_exterior_final.jpg";s:8:"raw_name";s:23:"scheme-b_exterior_final";s:9:"orig_name";s:27:"scheme-b_exterior_final.jpg";s:11:"client_name";s:27:"scheme-b_exterior_final.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:142.539999999999992041921359486877918243408203125;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:571;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="571"";}}', 2, 0, 0, 0, 0, 0),
(74, '2015-02-24 09:35:07', '2015-02-24 09:35:07', '3', 11, '11568_1_intercontinentalresortberchtesgaden_fsa-g.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:53:"11568_1_intercontinentalresortberchtesgaden_fsa-g.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:101:"/home/development/php/hobitel/app_data/auctions/11568_1_intercontinentalresortberchtesgaden_fsa-g.jpg";s:8:"raw_name";s:49:"11568_1_intercontinentalresortberchtesgaden_fsa-g";s:9:"orig_name";s:53:"11568_1_intercontinentalresortberchtesgaden_fsa-g.jpg";s:11:"client_name";s:53:"11568_1_intercontinentalresortberchtesgaden_fsa-g.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:38.47999999999999687361196265555918216705322265625;s:8:"is_image";b:1;s:11:"image_width";i:450;s:12:"image_height";i:299;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="450" height="299"";}}', 3, 0, 0, 0, 0, 0),
(75, '2015-02-24 09:35:14', '2015-02-24 09:35:14', '4', 11, '2974623_27_z.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:16:"2974623_27_z.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:64:"/home/development/php/hobitel/app_data/auctions/2974623_27_z.jpg";s:8:"raw_name";s:12:"2974623_27_z";s:9:"orig_name";s:16:"2974623_27_z.jpg";s:11:"client_name";s:16:"2974623_27_z.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:79.4500000000000028421709430404007434844970703125;s:8:"is_image";b:1;s:11:"image_width";i:1000;s:12:"image_height";i:750;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1000" height="750"";}}', 4, 0, 0, 0, 0, 0),
(76, '2015-02-24 09:36:07', '2015-02-24 09:36:07', '4', 11, 'images_(17).jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:15:"images_(17).jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:63:"/home/development/php/hobitel/app_data/auctions/images_(17).jpg";s:8:"raw_name";s:11:"images_(17)";s:9:"orig_name";s:15:"images_(17).jpg";s:11:"client_name";s:15:"images (17).jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:6.70999999999999996447286321199499070644378662109375;s:8:"is_image";b:1;s:11:"image_width";i:262;s:12:"image_height";i:193;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="262" height="193"";}}', 4, 0, 0, 0, 0, 0),
(77, '2015-02-24 09:36:26', '2015-02-24 09:36:26', '5', 11, 'patong-beach-hotel.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:22:"patong-beach-hotel.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:70:"/home/development/php/hobitel/app_data/auctions/patong-beach-hotel.jpg";s:8:"raw_name";s:18:"patong-beach-hotel";s:9:"orig_name";s:22:"patong-beach-hotel.jpg";s:11:"client_name";s:22:"patong-beach-hotel.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:56.49000000000000198951966012828052043914794921875;s:8:"is_image";b:1;s:11:"image_width";i:550;s:12:"image_height";i:412;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="550" height="412"";}}', 5, 0, 0, 0, 0, 0),
(78, '2015-02-24 10:19:54', '2015-02-24 10:19:54', '', 12, 'aleenta_resort_and_spa_hua_hin_huhhqah_herosquare.jpeg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:54:"aleenta_resort_and_spa_hua_hin_huhhqah_herosquare.jpeg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:102:"/home/development/php/hobitel/app_data/auctions/aleenta_resort_and_spa_hua_hin_huhhqah_herosquare.jpeg";s:8:"raw_name";s:49:"aleenta_resort_and_spa_hua_hin_huhhqah_herosquare";s:9:"orig_name";s:54:"aleenta_resort_and_spa_hua_hin_huhhqah_herosquare.jpeg";s:11:"client_name";s:54:"aleenta_resort_and_spa_hua_hin_huhhqah_herosquare.jpeg";s:8:"file_ext";s:5:".jpeg";s:9:"file_size";d:131.1299999999999954525264911353588104248046875;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:300;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="300"";}}', 0, 0, 1, 0, 0, 0),
(79, '2015-02-24 10:20:07', '2015-02-24 10:20:07', '1', 12, 'food.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"food.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:56:"/home/development/php/hobitel/app_data/auctions/food.jpg";s:8:"raw_name";s:4:"food";s:9:"orig_name";s:8:"food.jpg";s:11:"client_name";s:8:"food.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:22.620000000000000994759830064140260219573974609375;s:8:"is_image";b:1;s:11:"image_width";i:390;s:12:"image_height";i:219;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="390" height="219"";}}', 1, 0, 0, 0, 0, 0),
(80, '2015-02-24 10:20:13', '2015-02-24 10:20:13', '2', 12, 'food1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:9:"food1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:57:"/home/development/php/hobitel/app_data/auctions/food1.jpg";s:8:"raw_name";s:5:"food1";s:9:"orig_name";s:9:"food1.jpg";s:11:"client_name";s:9:"food1.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:57.5;s:8:"is_image";b:1;s:11:"image_width";i:390;s:12:"image_height";i:390;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="390" height="390"";}}', 2, 0, 0, 0, 0, 0),
(81, '2015-02-24 10:20:21', '2015-02-24 10:20:21', '3', 12, 'food3.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:9:"food3.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:57:"/home/development/php/hobitel/app_data/auctions/food3.jpg";s:8:"raw_name";s:5:"food3";s:9:"orig_name";s:9:"food3.jpg";s:11:"client_name";s:9:"food3.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:24.5799999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:390;s:12:"image_height";i:219;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="390" height="219"";}}', 3, 0, 0, 0, 0, 0),
(82, '2015-02-24 10:20:30', '2015-02-24 10:20:30', '4', 12, 'france-hotel.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:16:"france-hotel.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:64:"/home/development/php/hobitel/app_data/auctions/france-hotel.jpg";s:8:"raw_name";s:12:"france-hotel";s:9:"orig_name";s:16:"france-hotel.jpg";s:11:"client_name";s:16:"france-hotel.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:153.1100000000000136424205265939235687255859375;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:560;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="560"";}}', 4, 0, 0, 0, 0, 0),
(83, '2015-02-24 10:20:41', '2015-02-24 10:20:41', '5', 12, 'ambassador_herosquarenew.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:28:"ambassador_herosquarenew.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:76:"/home/development/php/hobitel/app_data/auctions/ambassador_herosquarenew.jpg";s:8:"raw_name";s:24:"ambassador_herosquarenew";s:9:"orig_name";s:28:"ambassador_herosquarenew.jpg";s:11:"client_name";s:28:"ambassador_herosquarenew.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:39.0799999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:300;s:12:"image_height";i:300;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="300" height="300"";}}', 5, 0, 0, 0, 0, 0),
(84, '2015-02-24 10:20:48', '2015-02-24 10:20:48', '6', 12, 'scheme-b_exterior_final1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:28:"scheme-b_exterior_final1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:76:"/home/development/php/hobitel/app_data/auctions/scheme-b_exterior_final1.jpg";s:8:"raw_name";s:24:"scheme-b_exterior_final1";s:9:"orig_name";s:27:"scheme-b_exterior_final.jpg";s:11:"client_name";s:27:"scheme-b_exterior_final.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:142.539999999999992041921359486877918243408203125;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:571;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="571"";}}', 6, 0, 0, 0, 0, 0),
(85, '2015-02-24 10:38:24', '2015-02-24 10:38:24', '', 14, 'display.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"display.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:59:"/home/development/php/hobitel/app_data/auctions/display.jpg";s:8:"raw_name";s:7:"display";s:9:"orig_name";s:11:"display.jpg";s:11:"client_name";s:11:"display.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:171;s:8:"is_image";b:1;s:11:"image_width";i:2048;s:12:"image_height";i:828;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="2048" height="828"";}}', 0, 0, 0, 1, 0, 0),
(86, '2015-02-24 10:40:51', '2015-02-24 10:40:51', 'Bed', 14, 'maxresdefault1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:18:"maxresdefault1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:66:"/home/development/php/hobitel/app_data/auctions/maxresdefault1.jpg";s:8:"raw_name";s:14:"maxresdefault1";s:9:"orig_name";s:17:"maxresdefault.jpg";s:11:"client_name";s:17:"maxresdefault.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:50.6700000000000017053025658242404460906982421875;s:8:"is_image";b:1;s:11:"image_width";i:1280;s:12:"image_height";i:720;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1280" height="720"";}}', 1, 0, 0, 0, 0, 0),
(87, '2015-02-24 10:41:05', '2015-02-24 10:41:05', 'Rest room', 14, 'url21.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:9:"url21.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:57:"/home/development/php/hobitel/app_data/auctions/url21.jpg";s:8:"raw_name";s:5:"url21";s:9:"orig_name";s:8:"url2.jpg";s:11:"client_name";s:8:"url2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:157.18999999999999772626324556767940521240234375;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 2, 0, 0, 0, 0, 0),
(88, '2015-02-24 10:41:18', '2015-02-24 10:41:18', 'Dining', 14, 'url1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:56:"/home/development/php/hobitel/app_data/auctions/url1.jpg";s:8:"raw_name";s:4:"url1";s:9:"orig_name";s:7:"url.jpg";s:11:"client_name";s:7:"url.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:289.1399999999999863575794734060764312744140625;s:8:"is_image";b:1;s:11:"image_width";i:2048;s:12:"image_height";i:1365;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="2048" height="1365"";}}', 3, 0, 0, 0, 0, 0),
(89, '2015-02-24 10:42:05', '2015-02-24 10:42:05', '', 14, 'dis.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:7:"dis.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:48:"/home/development/php/hobitel/app_data/auctions/";s:9:"full_path";s:55:"/home/development/php/hobitel/app_data/auctions/dis.jpg";s:8:"raw_name";s:3:"dis";s:9:"orig_name";s:7:"dis.jpg";s:11:"client_name";s:7:"dis.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:94.2399999999999948840923025272786617279052734375;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 0, 0, 1, 0, 0, 0),
(107, '2015-03-11 12:55:32', '2015-03-11 12:55:32', '', 16, 'url24.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:9:"url24.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:65:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/url24.jpg";s:8:"raw_name";s:5:"url24";s:9:"orig_name";s:8:"url2.jpg";s:11:"client_name";s:8:"url2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:2209.71999999999979991116560995578765869140625;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 0, 0, 0, 1, 0, 0),
(108, '2015-03-12 07:44:13', '2015-03-12 07:44:13', '', 9, 'Westin-Grand-Cayman-Sundeck1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:32:"Westin-Grand-Cayman-Sundeck1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:88:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Westin-Grand-Cayman-Sundeck1.jpg";s:8:"raw_name";s:28:"Westin-Grand-Cayman-Sundeck1";s:9:"orig_name";s:31:"Westin-Grand-Cayman-Sundeck.jpg";s:11:"client_name";s:31:"Westin-Grand-Cayman-Sundeck.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:777.779999999999972715158946812152862548828125;s:8:"is_image";b:1;s:11:"image_width";i:1500;s:12:"image_height";i:1125;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1500" height="1125"";}}', 0, 0, 1, 0, 0, 0),
(106, '2015-03-11 12:55:26', '2015-03-11 12:55:26', 'sdfs edit', 16, 'logo1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:9:"logo1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:65:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/logo1.jpg";s:8:"raw_name";s:5:"logo1";s:9:"orig_name";s:8:"logo.jpg";s:11:"client_name";s:8:"logo.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:152.490000000000009094947017729282379150390625;s:8:"is_image";b:1;s:11:"image_width";i:346;s:12:"image_height";i:260;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="346" height="260"";}}', 2, 0, 0, 0, 0, 0),
(103, '2015-03-11 12:53:46', '2015-03-11 12:53:46', '', 13, 'dis2.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"dis2.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:64:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/dis2.jpg";s:8:"raw_name";s:4:"dis2";s:9:"orig_name";s:7:"dis.jpg";s:11:"client_name";s:7:"dis.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:182.590000000000003410605131648480892181396484375;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 0, 0, 1, 0, 0, 0),
(104, '2015-03-11 12:53:51', '2015-03-11 12:53:51', '', 13, 'logo21.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:10:"logo21.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:66:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/logo21.jpg";s:8:"raw_name";s:6:"logo21";s:9:"orig_name";s:9:"logo2.jpg";s:11:"client_name";s:9:"logo2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:1559.8699999999998908606357872486114501953125;s:8:"is_image";b:1;s:11:"image_width";i:2835;s:12:"image_height";i:1643;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="2835" height="1643"";}}', 0, 0, 0, 1, 0, 0),
(101, '2015-03-11 12:35:32', '2015-03-11 12:35:32', '', 13, 'Novetel_very_practical_clothes_closet.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:41:"Novetel_very_practical_clothes_closet.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:97:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Novetel_very_practical_clothes_closet.jpg";s:8:"raw_name";s:37:"Novetel_very_practical_clothes_closet";s:9:"orig_name";s:41:"Novetel_very_practical_clothes_closet.jpg";s:11:"client_name";s:41:"Novetel very practical clothes closet.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:1078.19000000000005456968210637569427490234375;s:8:"is_image";b:1;s:11:"image_width";i:1920;s:12:"image_height";i:2560;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1920" height="2560"";}}', 0, 0, 1, 0, 0, 0),
(105, '2015-03-11 12:55:20', '2015-03-11 12:55:20', '', 16, 'display2.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"display2.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:68:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/display2.jpg";s:8:"raw_name";s:8:"display2";s:9:"orig_name";s:11:"display.jpg";s:11:"client_name";s:11:"display.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:171;s:8:"is_image";b:1;s:11:"image_width";i:2048;s:12:"image_height";i:828;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="2048" height="828"";}}', 0, 0, 1, 0, 0, 0),
(109, '2015-03-12 07:44:17', '2015-03-12 07:44:17', '', 9, '153196073.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:13:"153196073.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:69:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/153196073.jpg";s:8:"raw_name";s:9:"153196073";s:9:"orig_name";s:12:"15319607.jpg";s:11:"client_name";s:12:"15319607.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:93.7999999999999971578290569595992565155029296875;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 0, 0, 0, 1, 0, 0),
(110, '2015-03-12 07:44:28', '2015-03-12 07:44:28', 'sdfsdf', 9, 'Novetel_very_practical_clothes_closet1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:42:"Novetel_very_practical_clothes_closet1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:98:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Novetel_very_practical_clothes_closet1.jpg";s:8:"raw_name";s:38:"Novetel_very_practical_clothes_closet1";s:9:"orig_name";s:41:"Novetel_very_practical_clothes_closet.jpg";s:11:"client_name";s:41:"Novetel very practical clothes closet.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:1078.19000000000005456968210637569427490234375;s:8:"is_image";b:1;s:11:"image_width";i:1920;s:12:"image_height";i:2560;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1920" height="2560"";}}', 3, 0, 0, 0, 0, 0),
(111, '2015-03-12 07:44:35', '2015-03-12 07:44:35', '', 9, 'maxresdefault3.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:18:"maxresdefault3.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:74:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/maxresdefault3.jpg";s:8:"raw_name";s:14:"maxresdefault3";s:9:"orig_name";s:17:"maxresdefault.jpg";s:11:"client_name";s:17:"maxresdefault.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:50.6700000000000017053025658242404460906982421875;s:8:"is_image";b:1;s:11:"image_width";i:1280;s:12:"image_height";i:720;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1280" height="720"";}}', 0, 0, 1, 0, 0, 0),
(112, '2015-03-12 07:44:41', '2015-03-12 07:44:41', '', 9, 'maxresdefault4.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:18:"maxresdefault4.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:74:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/maxresdefault4.jpg";s:8:"raw_name";s:14:"maxresdefault4";s:9:"orig_name";s:17:"maxresdefault.jpg";s:11:"client_name";s:17:"maxresdefault.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:50.6700000000000017053025658242404460906982421875;s:8:"is_image";b:1;s:11:"image_width";i:1280;s:12:"image_height";i:720;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1280" height="720"";}}', 0, 0, 1, 0, 0, 0),
(159, '2015-04-30 06:29:50', '2015-04-30 06:29:50', '', 34, '15319607.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"15319607.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:68:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/15319607.jpg";s:8:"raw_name";s:8:"15319607";s:9:"orig_name";s:12:"15319607.jpg";s:11:"client_name";s:12:"15319607.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:93.7999999999999971578290569595992565155029296875;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 0, 1, 1, 0, 0, 1),
(117, '2015-03-13 06:58:07', '2015-03-13 06:58:07', 'dfgdfg', 19, 'url25.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:9:"url25.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:65:"D:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/url25.jpg";s:8:"raw_name";s:5:"url25";s:9:"orig_name";s:8:"url2.jpg";s:11:"client_name";s:8:"url2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:796.279999999999972715158946812152862548828125;s:8:"is_image";b:1;s:11:"image_width";i:2100;s:12:"image_height";i:1617;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="2100" height="1617"";}}', 2, 0, 0, 0, 0, 0),
(152, '2015-04-27 12:25:08', '2015-04-27 12:25:08', 'dfsdfsdf', 31, 'url2.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url2.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:64:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/url2.jpg";s:8:"raw_name";s:4:"url2";s:9:"orig_name";s:8:"url2.jpg";s:11:"client_name";s:8:"url2.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:2209.71999999999979991116560995578765869140625;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 1, 3, 0, 0, 0, 1),
(153, '2015-04-28 05:59:16', '2015-04-28 05:59:16', '', 32, 'eser-premium-hotel-spa5.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:27:"eser-premium-hotel-spa5.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:83:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/eser-premium-hotel-spa5.jpg";s:8:"raw_name";s:23:"eser-premium-hotel-spa5";s:9:"orig_name";s:26:"eser-premium-hotel-spa.jpg";s:11:"client_name";s:26:"eser-premium-hotel-spa.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:44.8299999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:550;s:12:"image_height";i:365;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="550" height="365"";}}', 0, 1, 1, 0, 0, 1),
(150, '2015-04-27 12:22:54', '2015-04-27 12:22:54', '', 31, '15319607.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"15319607.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:68:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/15319607.jpg";s:8:"raw_name";s:8:"15319607";s:9:"orig_name";s:12:"15319607.jpg";s:11:"client_name";s:12:"15319607.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:93.7999999999999971578290569595992565155029296875;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 0, 1, 1, 0, 0, 1),
(121, '2015-03-28 07:59:06', '2015-03-28 07:59:06', 'sdfsd', 20, 'Caymans-068.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:15:"Caymans-068.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:71:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Caymans-068.jpg";s:8:"raw_name";s:11:"Caymans-068";s:9:"orig_name";s:15:"Caymans-068.jpg";s:11:"client_name";s:15:"Caymans-068.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:3622.239999999999781721271574497222900390625;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 5, 0, 0, 0, 0, 0),
(169, '2015-04-30 06:39:29', '2015-04-30 06:39:29', '', 38, 'dis.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:7:"dis.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:63:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/dis.jpg";s:8:"raw_name";s:3:"dis";s:9:"orig_name";s:7:"dis.jpg";s:11:"client_name";s:7:"dis.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:94.2399999999999948840923025272786617279052734375;s:8:"is_image";b:1;s:11:"image_width";i:1024;s:12:"image_height";i:768;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:25:"width="1024" height="768"";}}', 0, 2, 0, 1, 0, 1),
(171, '2015-04-30 06:47:34', '2015-04-30 06:47:34', 'sfsdf', 39, 'eser-premium-hotel-spa.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:26:"eser-premium-hotel-spa.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:82:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/eser-premium-hotel-spa.jpg";s:8:"raw_name";s:22:"eser-premium-hotel-spa";s:9:"orig_name";s:26:"eser-premium-hotel-spa.jpg";s:11:"client_name";s:26:"eser-premium-hotel-spa.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:44.8299999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:550;s:12:"image_height";i:365;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="550" height="365"";}}', 1, 3, 0, 0, 0, 1),
(172, '2015-05-07 07:41:16', '2015-05-07 07:41:16', 'new t', 36, 'url.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:7:"url.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:63:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/url.jpg";s:8:"raw_name";s:3:"url";s:9:"orig_name";s:7:"url.jpg";s:11:"client_name";s:7:"url.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:1700.59999999999990905052982270717620849609375;s:8:"is_image";b:1;s:11:"image_width";i:1200;s:12:"image_height";i:1600;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1200" height="1600"";}}', 1, 3, 0, 0, 0, 1),
(174, '2015-05-07 08:38:37', '2015-05-07 08:38:37', 'sfdsfds edit t', 36, 'Spa_Suit.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"Spa_Suit.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:68:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Spa_Suit.jpg";s:8:"raw_name";s:8:"Spa_Suit";s:9:"orig_name";s:12:"Spa_Suit.jpg";s:11:"client_name";s:12:"Spa_Suit.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:797.2100000000000363797880709171295166015625;s:8:"is_image";b:1;s:11:"image_width";i:2362;s:12:"image_height";i:1868;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="2362" height="1868"";}}', 2, 3, 0, 0, 0, 1),
(175, '2015-05-11 11:43:27', '2015-05-11 11:43:27', '', 40, 'eagles5.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"eagles5.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:67:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/eagles5.jpg";s:8:"raw_name";s:7:"eagles5";s:9:"orig_name";s:11:"eagles5.jpg";s:11:"client_name";s:11:"eagles5.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:451.56000000000000227373675443232059478759765625;s:8:"is_image";b:1;s:11:"image_width";i:1920;s:12:"image_height";i:1080;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1920" height="1080"";}}', 0, 1, 1, 0, 0, 1),
(176, '2015-05-11 11:43:36', '2015-05-11 11:43:36', 'sdfsdf', 40, 'logo-bald-eagle-clip-art--1-.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:32:"logo-bald-eagle-clip-art--1-.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:88:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/logo-bald-eagle-clip-art--1-.jpg";s:8:"raw_name";s:28:"logo-bald-eagle-clip-art--1-";s:9:"orig_name";s:32:"logo-bald-eagle-clip-art--1-.jpg";s:11:"client_name";s:32:"logo-bald-eagle-clip-art--1-.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:46.93999999999999772626324556767940521240234375;s:8:"is_image";b:1;s:11:"image_width";i:500;s:12:"image_height";i:581;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="500" height="581"";}}', 6, 3, 0, 0, 0, 1),
(177, '2015-05-11 11:43:43', '2015-05-11 11:43:43', '', 40, 'url1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:64:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/url1.jpg";s:8:"raw_name";s:4:"url1";s:9:"orig_name";s:7:"url.jpg";s:11:"client_name";s:7:"url.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:138.94999999999998863131622783839702606201171875;s:8:"is_image";b:1;s:11:"image_width";i:1556;s:12:"image_height";i:1037;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1556" height="1037"";}}', 0, 2, 0, 1, 0, 1),
(186, '2015-05-11 03:47:16', '2015-05-11 03:47:16', '', 44, 'url1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:64:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/url1.jpg";s:8:"raw_name";s:4:"url1";s:9:"orig_name";s:7:"url.jpg";s:11:"client_name";s:7:"url.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:138.94999999999998863131622783839702606201171875;s:8:"is_image";b:1;s:11:"image_width";i:1556;s:12:"image_height";i:1037;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1556" height="1037"";}}', 0, 2, 0, 1, 0, 1),
(185, '2015-05-11 03:47:16', '2015-05-11 03:47:16', 'sdfsdf', 44, 'logo-bald-eagle-clip-art--1-.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:32:"logo-bald-eagle-clip-art--1-.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:88:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/logo-bald-eagle-clip-art--1-.jpg";s:8:"raw_name";s:28:"logo-bald-eagle-clip-art--1-";s:9:"orig_name";s:32:"logo-bald-eagle-clip-art--1-.jpg";s:11:"client_name";s:32:"logo-bald-eagle-clip-art--1-.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:46.93999999999999772626324556767940521240234375;s:8:"is_image";b:1;s:11:"image_width";i:500;s:12:"image_height";i:581;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="500" height="581"";}}', 6, 3, 0, 0, 0, 1),
(184, '2015-05-11 03:47:16', '2015-05-11 03:47:16', '', 44, 'eagles5.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"eagles5.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:67:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/eagles5.jpg";s:8:"raw_name";s:7:"eagles5";s:9:"orig_name";s:11:"eagles5.jpg";s:11:"client_name";s:11:"eagles5.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:451.56000000000000227373675443232059478759765625;s:8:"is_image";b:1;s:11:"image_width";i:1920;s:12:"image_height";i:1080;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1920" height="1080"";}}', 0, 1, 1, 0, 0, 1),
(181, '2015-05-11 03:45:52', '2015-05-11 03:45:52', '', 43, 'eagles5.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"eagles5.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:67:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/eagles5.jpg";s:8:"raw_name";s:7:"eagles5";s:9:"orig_name";s:11:"eagles5.jpg";s:11:"client_name";s:11:"eagles5.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:451.56000000000000227373675443232059478759765625;s:8:"is_image";b:1;s:11:"image_width";i:1920;s:12:"image_height";i:1080;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1920" height="1080"";}}', 0, 1, 1, 0, 0, 1),
(182, '2015-05-11 03:45:52', '2015-05-11 03:45:52', 'sdfsdf', 43, 'logo-bald-eagle-clip-art--1-.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:32:"logo-bald-eagle-clip-art--1-.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:88:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/logo-bald-eagle-clip-art--1-.jpg";s:8:"raw_name";s:28:"logo-bald-eagle-clip-art--1-";s:9:"orig_name";s:32:"logo-bald-eagle-clip-art--1-.jpg";s:11:"client_name";s:32:"logo-bald-eagle-clip-art--1-.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:46.93999999999999772626324556767940521240234375;s:8:"is_image";b:1;s:11:"image_width";i:500;s:12:"image_height";i:581;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="500" height="581"";}}', 6, 3, 0, 0, 0, 1),
(183, '2015-05-11 03:45:52', '2015-05-11 03:45:52', '', 43, 'url1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:64:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/url1.jpg";s:8:"raw_name";s:4:"url1";s:9:"orig_name";s:7:"url.jpg";s:11:"client_name";s:7:"url.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:138.94999999999998863131622783839702606201171875;s:8:"is_image";b:1;s:11:"image_width";i:1556;s:12:"image_height";i:1037;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1556" height="1037"";}}', 0, 2, 0, 1, 0, 1),
(187, '2015-05-19 15:37:43', '2015-05-19 15:37:43', 'dsfs', 40, 'bg-ing-new.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:14:"bg-ing-new.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:70:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/bg-ing-new.jpg";s:8:"raw_name";s:10:"bg-ing-new";s:9:"orig_name";s:14:"bg-ing-new.jpg";s:11:"client_name";s:14:"bg-ing-new.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:2326.9600000000000363797880709171295166015625;s:8:"is_image";b:1;s:11:"image_width";i:1920;s:12:"image_height";i:1189;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1920" height="1189"";}}', 3, 3, 0, 0, 0, 1),
(188, '2015-05-20 08:41:59', '2015-05-20 08:41:59', '', 46, 'eagles5.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:11:"eagles5.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:67:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/eagles5.jpg";s:8:"raw_name";s:7:"eagles5";s:9:"orig_name";s:11:"eagles5.jpg";s:11:"client_name";s:11:"eagles5.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:451.56000000000000227373675443232059478759765625;s:8:"is_image";b:1;s:11:"image_width";i:1920;s:12:"image_height";i:1080;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1920" height="1080"";}}', 0, 1, 1, 0, 0, 1),
(189, '2015-05-20 08:41:59', '2015-05-20 08:41:59', 'sdfsdf', 46, 'logo-bald-eagle-clip-art--1-.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:32:"logo-bald-eagle-clip-art--1-.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:88:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/logo-bald-eagle-clip-art--1-.jpg";s:8:"raw_name";s:28:"logo-bald-eagle-clip-art--1-";s:9:"orig_name";s:32:"logo-bald-eagle-clip-art--1-.jpg";s:11:"client_name";s:32:"logo-bald-eagle-clip-art--1-.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:46.93999999999999772626324556767940521240234375;s:8:"is_image";b:1;s:11:"image_width";i:500;s:12:"image_height";i:581;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="500" height="581"";}}', 6, 3, 0, 0, 0, 1),
(190, '2015-05-20 08:41:59', '2015-05-20 08:41:59', '', 46, 'url1.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"url1.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:64:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/url1.jpg";s:8:"raw_name";s:4:"url1";s:9:"orig_name";s:7:"url.jpg";s:11:"client_name";s:7:"url.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:138.94999999999998863131622783839702606201171875;s:8:"is_image";b:1;s:11:"image_width";i:1556;s:12:"image_height";i:1037;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1556" height="1037"";}}', 0, 2, 0, 1, 0, 1),
(191, '2015-05-20 08:41:59', '2015-05-20 08:41:59', 'dsfs', 46, 'bg-ing-new.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:14:"bg-ing-new.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:70:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/bg-ing-new.jpg";s:8:"raw_name";s:10:"bg-ing-new";s:9:"orig_name";s:14:"bg-ing-new.jpg";s:11:"client_name";s:14:"bg-ing-new.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:2326.9600000000000363797880709171295166015625;s:8:"is_image";b:1;s:11:"image_width";i:1920;s:12:"image_height";i:1189;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="1920" height="1189"";}}', 3, 3, 0, 0, 0, 1),
(192, '2015-05-20 10:42:22', '2015-05-20 10:42:22', '', 47, 'eser-premium-hotel-spa7.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:27:"eser-premium-hotel-spa7.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:83:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/eser-premium-hotel-spa7.jpg";s:8:"raw_name";s:23:"eser-premium-hotel-spa7";s:9:"orig_name";s:26:"eser-premium-hotel-spa.jpg";s:11:"client_name";s:26:"eser-premium-hotel-spa.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:44.8299999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:550;s:12:"image_height";i:365;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="550" height="365"";}}', 0, 1, 1, 0, 0, 1),
(193, '2015-05-20 10:42:22', '2015-05-20 10:42:22', 'sdfsd', 47, 'Caymans-068.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:15:"Caymans-068.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:71:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Caymans-068.jpg";s:8:"raw_name";s:11:"Caymans-068";s:9:"orig_name";s:15:"Caymans-068.jpg";s:11:"client_name";s:15:"Caymans-068.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:3622.239999999999781721271574497222900390625;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 5, 0, 0, 0, 0, 0),
(194, '2015-05-20 10:42:52', '2015-05-20 10:42:52', '', 48, 'eser-premium-hotel-spa7.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:27:"eser-premium-hotel-spa7.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:83:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/eser-premium-hotel-spa7.jpg";s:8:"raw_name";s:23:"eser-premium-hotel-spa7";s:9:"orig_name";s:26:"eser-premium-hotel-spa.jpg";s:11:"client_name";s:26:"eser-premium-hotel-spa.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:44.8299999999999982946974341757595539093017578125;s:8:"is_image";b:1;s:11:"image_width";i:550;s:12:"image_height";i:365;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:24:"width="550" height="365"";}}', 0, 1, 1, 0, 0, 1),
(195, '2015-05-20 10:42:52', '2015-05-20 10:42:52', 'sdfsd', 48, 'Caymans-068.jpg', 'app_data/auctions/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:15:"Caymans-068.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:56:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/";s:9:"full_path";s:71:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/auctions/Caymans-068.jpg";s:8:"raw_name";s:11:"Caymans-068";s:9:"orig_name";s:15:"Caymans-068.jpg";s:11:"client_name";s:15:"Caymans-068.jpg";s:8:"file_ext";s:4:".jpg";s:9:"file_size";d:3622.239999999999781721271574497222900390625;s:8:"is_image";b:1;s:11:"image_width";i:4000;s:12:"image_height";i:3000;s:10:"image_type";s:4:"jpeg";s:14:"image_size_str";s:26:"width="4000" height="3000"";}}', 5, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `offer_comments`
--

CREATE TABLE IF NOT EXISTS `offer_comments` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `offer_id` bigint(20) NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `browser_info` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `offer_suitables`
--

CREATE TABLE IF NOT EXISTS `offer_suitables` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `offer_id` bigint(20) NOT NULL,
  `suitable_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=197 ;

--
-- Dumping data for table `offer_suitables`
--

INSERT INTO `offer_suitables` (`id`, `created`, `modified`, `offer_id`, `suitable_id`, `is_active`) VALUES
(1, '2015-02-24 06:10:34', '2015-02-24 06:10:34', 1, 10, 1),
(2, '2015-02-24 06:10:34', '2015-02-24 06:10:34', 1, 5, 1),
(3, '2015-02-24 06:10:34', '2015-02-24 06:10:34', 1, 1, 1),
(4, '2015-02-24 06:16:59', '2015-02-24 06:16:59', 2, 10, 1),
(5, '2015-02-24 06:16:59', '2015-02-24 06:16:59', 2, 5, 1),
(6, '2015-02-24 06:16:59', '2015-02-24 06:16:59', 2, 1, 1),
(7, '2015-02-24 06:24:59', '2015-02-24 06:24:59', 3, 10, 1),
(8, '2015-02-24 06:24:59', '2015-02-24 06:24:59', 3, 5, 1),
(9, '2015-02-24 06:24:59', '2015-02-24 06:24:59', 3, 1, 1),
(10, '2015-02-24 06:31:10', '2015-02-24 06:31:10', 4, 10, 1),
(11, '2015-02-24 06:31:10', '2015-02-24 06:31:10', 4, 5, 1),
(12, '2015-02-24 06:31:10', '2015-02-24 06:31:10', 4, 1, 1),
(13, '2015-02-24 07:05:14', '2015-02-24 07:05:14', 5, 11, 1),
(14, '2015-02-24 07:05:14', '2015-02-24 07:05:14', 5, 16, 1),
(32, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 1, 1),
(31, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 7, 1),
(30, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 15, 1),
(29, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 11, 1),
(28, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 8, 1),
(27, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 14, 1),
(26, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 13, 1),
(25, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 10, 1),
(24, '2015-02-24 07:27:35', '2015-02-24 07:27:35', 6, 16, 1),
(33, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 12, 1),
(34, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 10, 1),
(35, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 11, 1),
(36, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 8, 1),
(37, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 14, 1),
(38, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 15, 1),
(39, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 7, 1),
(40, '2015-02-24 08:44:33', '2015-02-24 08:44:33', 7, 1, 1),
(114, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 1, 1),
(113, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 7, 1),
(112, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 8, 1),
(111, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 11, 1),
(110, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 14, 1),
(109, '2015-03-23 02:00:36', '2015-03-23 02:00:36', 8, 15, 1),
(47, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 13, 1),
(48, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 12, 1),
(49, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 10, 1),
(50, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 11, 1),
(51, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 8, 1),
(52, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 14, 1),
(53, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 15, 1),
(54, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 7, 1),
(55, '2015-02-24 08:58:04', '2015-02-24 08:58:04', 9, 1, 1),
(56, '2015-02-24 09:16:52', '2015-02-24 09:16:52', 10, 1, 1),
(57, '2015-02-24 09:16:52', '2015-02-24 09:16:52', 10, 8, 1),
(58, '2015-02-24 09:33:47', '2015-02-24 09:33:47', 11, 10, 1),
(59, '2015-02-24 09:33:47', '2015-02-24 09:33:47', 11, 1, 1),
(60, '2015-02-24 09:33:47', '2015-02-24 09:33:47', 11, 9, 1),
(61, '2015-02-24 09:33:47', '2015-02-24 09:33:47', 11, 6, 1),
(62, '2015-02-24 09:33:47', '2015-02-24 09:33:47', 11, 13, 1),
(63, '2015-02-24 09:33:47', '2015-02-24 09:33:47', 11, 5, 1),
(64, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 6, 1),
(65, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 16, 1),
(66, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 10, 1),
(67, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 12, 1),
(68, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 1, 1),
(69, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 14, 1),
(70, '2015-02-24 10:19:36', '2015-02-24 10:19:36', 12, 11, 1),
(71, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 6, 1),
(72, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 15, 1),
(73, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 5, 1),
(74, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 11, 1),
(75, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 14, 1),
(76, '2015-02-24 10:35:22', '2015-02-24 10:35:22', 13, 1, 1),
(77, '2015-02-24 10:37:36', '2015-02-24 10:37:36', 14, 8, 1),
(78, '2015-03-12 12:35:30', '2015-03-12 12:35:30', 17, 15, 1),
(79, '2015-03-12 12:35:30', '2015-03-12 12:35:30', 17, 12, 1),
(80, '2015-03-12 12:35:30', '2015-03-12 12:35:30', 17, 10, 1),
(81, '2015-03-12 12:35:30', '2015-03-12 12:35:30', 17, 1, 1),
(133, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 10, 1),
(132, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 12, 1),
(131, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 13, 1),
(129, '2015-04-22 10:20:00', '2015-04-22 10:20:00', 19, 8, 1),
(125, '2015-03-28 07:58:37', '2015-03-28 07:58:37', 20, 15, 1),
(126, '2015-03-28 07:58:37', '2015-03-28 07:58:37', 20, 14, 1),
(127, '2015-03-28 07:58:37', '2015-03-28 07:58:37', 20, 12, 1),
(128, '2015-03-28 07:58:37', '2015-03-28 07:58:37', 20, 1, 1),
(140, '2015-04-24 11:29:25', '2015-04-24 11:29:25', 21, 12, 1),
(134, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 11, 1),
(135, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 8, 1),
(136, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 14, 1),
(137, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 15, 1),
(138, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 7, 1),
(139, '2015-04-22 03:35:00', '2015-04-22 03:35:00', 31, 1, 1),
(141, '2015-04-28 05:59:16', '2015-04-28 05:59:16', 32, 12, 1),
(142, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 10, 1),
(143, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 12, 1),
(144, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 13, 1),
(145, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 11, 1),
(146, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 8, 1),
(147, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 14, 1),
(148, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 15, 1),
(149, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 7, 1),
(150, '2015-04-30 06:29:42', '2015-04-30 06:29:42', 33, 1, 1),
(151, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 10, 1),
(152, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 12, 1),
(153, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 13, 1),
(154, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 11, 1),
(155, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 8, 1),
(156, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 14, 1),
(157, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 15, 1),
(158, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 7, 1),
(159, '2015-04-30 06:29:50', '2015-04-30 06:29:50', 34, 1, 1),
(160, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 10, 1),
(161, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 12, 1),
(162, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 13, 1),
(163, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 11, 1),
(164, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 8, 1),
(165, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 14, 1),
(166, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 15, 1),
(167, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 7, 1),
(168, '2015-04-30 06:29:56', '2015-04-30 06:29:56', 35, 1, 1),
(169, '2015-04-30 06:31:11', '2015-04-30 06:31:11', 36, 12, 1),
(170, '2015-04-30 06:37:20', '2015-04-30 06:37:20', 37, 10, 1),
(171, '2015-04-30 06:37:20', '2015-04-30 06:37:20', 37, 5, 1),
(172, '2015-04-30 06:37:20', '2015-04-30 06:37:20', 37, 1, 1),
(173, '2015-04-30 06:38:30', '2015-04-30 06:38:30', 38, 10, 1),
(174, '2015-04-30 06:38:30', '2015-04-30 06:38:30', 38, 5, 1),
(175, '2015-04-30 06:38:30', '2015-04-30 06:38:30', 38, 1, 1),
(176, '2015-04-30 06:47:34', '2015-04-30 06:47:34', 39, 10, 1),
(177, '2015-04-30 06:47:34', '2015-04-30 06:47:34', 39, 5, 1),
(178, '2015-04-30 06:47:34', '2015-04-30 06:47:34', 39, 1, 1),
(179, '2015-05-11 11:43:10', '2015-05-11 11:43:10', 40, 10, 1),
(180, '2015-05-11 11:43:10', '2015-05-11 11:43:10', 40, 15, 1),
(186, '2015-05-11 03:47:16', '2015-05-11 03:47:16', 44, 15, 1),
(185, '2015-05-11 03:47:16', '2015-05-11 03:47:16', 44, 10, 1),
(183, '2015-05-11 03:45:52', '2015-05-11 03:45:52', 43, 10, 1),
(184, '2015-05-11 03:45:52', '2015-05-11 03:45:52', 43, 15, 1),
(187, '2015-05-20 08:41:59', '2015-05-20 08:41:59', 46, 10, 1),
(188, '2015-05-20 08:41:59', '2015-05-20 08:41:59', 46, 15, 1),
(189, '2015-05-20 10:42:22', '2015-05-20 10:42:22', 47, 15, 1),
(190, '2015-05-20 10:42:22', '2015-05-20 10:42:22', 47, 14, 1),
(191, '2015-05-20 10:42:22', '2015-05-20 10:42:22', 47, 12, 1),
(192, '2015-05-20 10:42:22', '2015-05-20 10:42:22', 47, 1, 1),
(193, '2015-05-20 10:42:52', '2015-05-20 10:42:52', 48, 15, 1),
(194, '2015-05-20 10:42:52', '2015-05-20 10:42:52', 48, 14, 1),
(195, '2015-05-20 10:42:52', '2015-05-20 10:42:52', 48, 12, 1),
(196, '2015-05-20 10:42:52', '2015-05-20 10:42:52', 48, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `offer_id` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `unique_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Paypal,Pay U',
  `order_status` int(11) NOT NULL COMMENT '1-success,2-cancel,3-failure,4-aborted',
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created`, `modified`, `user_id`, `offer_id`, `amount`, `unique_id`, `transaction_id`, `order_type`, `order_status`, `is_active`) VALUES
(1, '2015-03-21 01:02:35', '2015-03-21 01:02:35', 12, 19, 590, 'OtxssXWu', 'KpyLkHHCjlwV', 'CASH', 2, 1),
(2, '2015-03-21 01:31:26', '2015-03-21 01:31:26', 6, 19, 650, 'PtyUCjPB', 'pVcetCcO0MIy', 'CASH', 2, 1),
(3, '2015-05-04 06:49:45', '2015-05-04 06:49:45', 6, 4, 50, 'GjjsEJBN', 'YfBmGgo3g397', 'CASH', 1, 1),
(4, '2015-05-20 11:33:42', '2015-05-20 11:33:42', 6, 46, 3150, 'iMIZHveb', 'bDLWvQYsneeg', 'CASH', 2, 1),
(5, '2015-05-20 11:49:09', '2015-05-20 11:49:09', 6, 46, 3150, 'FAztJRnw', 'YDg5uFY0dehw', 'CASH', 2, 1),
(6, '2015-05-20 11:55:37', '2015-05-20 11:55:37', 6, 46, 3150, 'OpREVsIU', '17NJNT5g3Qfi', 'CASH', 2, 1),
(7, '2015-05-20 12:07:17', '2015-05-20 12:07:17', 6, 48, 452, 'qmVwlIFp', 'fsrQ2xUhpOza', 'CASH', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
`id` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Page Details' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `created`, `modified`, `title`, `content`, `alias`, `meta_keywords`, `meta_description`, `is_active`) VALUES
(1, '2014-09-18 00:00:00', '2014-10-08 11:36:14', 'About us', '', 'about-us', 'Test keywords', 'Test description', 1);

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE IF NOT EXISTS `plans` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `commision` int(11) NOT NULL COMMENT 'Percentage from each hotel Booking',
  `auction_limit` int(11) NOT NULL COMMENT 'Number of Auctions Per  6 month',
  `featured_home_page` tinyint(1) NOT NULL COMMENT 'Featured Home Page Hotel Listing',
  `plan_valid_days` int(11) NOT NULL COMMENT 'Total no of days valid buy one plan. Ex: 180 (6 Months)',
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `created`, `modified`, `name`, `price`, `commision`, `auction_limit`, `featured_home_page`, `plan_valid_days`, `is_active`) VALUES
(1, '2014-09-17 00:00:00', '2015-03-24 06:33:41', 'Free', 0, 25, 10, 0, 150, 1),
(2, '2014-09-17 00:00:00', '2014-12-15 09:55:49', 'Premium', 14.28987, 50, 50, 1, 180, 1),
(3, '2014-09-17 00:00:00', '2014-09-25 07:35:17', 'Gold', 100, 25, 100, 1, 180, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE IF NOT EXISTS `ratings` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `rating_type` tinyint(1) NOT NULL COMMENT '1- Trp Advisor 2- Holiday Check 3- webuser',
  `ratings` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `recent_search`
--

CREATE TABLE IF NOT EXISTS `recent_search` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `offer_id` bigint(20) NOT NULL,
  `ip` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=397 ;

--
-- Dumping data for table `recent_search`
--

INSERT INTO `recent_search` (`id`, `created`, `user_id`, `offer_id`, `ip`) VALUES
(1, '2015-02-24 12:06:19', 0, 4, '180.151.61.235'),
(2, '2015-02-24 12:14:46', 0, 4, '180.151.61.235'),
(3, '2015-02-24 12:15:05', 0, 4, '180.151.61.235'),
(4, '2015-02-24 12:15:36', 6, 4, '180.151.61.235'),
(5, '2015-02-24 12:33:50', 0, 4, '180.151.61.235'),
(6, '2015-02-24 12:38:56', 0, 1, '180.151.61.235'),
(7, '2015-02-24 03:07:22', 0, 4, '180.151.61.235'),
(8, '2015-02-24 03:07:39', 0, 4, '180.151.61.235'),
(9, '2015-02-24 03:14:19', 0, 4, '180.151.61.235'),
(10, '2015-02-24 04:39:50', 0, 7, '180.151.61.235'),
(11, '2015-02-24 04:48:20', 13, 7, '180.151.61.235'),
(12, '2015-02-24 04:49:07', 13, 7, '180.151.61.235'),
(13, '2015-02-24 04:49:21', 6, 7, '180.151.61.235'),
(14, '2015-02-24 12:22:39', 14, 3, '95.91.232.1'),
(15, '2015-02-24 04:54:26', 0, 4, '180.151.61.235'),
(16, '2015-02-24 05:02:00', 0, 11, '180.151.61.235'),
(17, '2015-03-10 03:26:26', 0, 9, '192.168.1.112'),
(20, '2015-03-13 11:29:26', 6, 19, '192.168.1.112'),
(21, '2015-03-13 11:29:59', 6, 19, '192.168.1.112'),
(22, '2015-03-13 11:30:13', 6, 19, '192.168.1.112'),
(23, '2015-03-13 11:31:08', 6, 19, '192.168.1.112'),
(24, '2015-03-13 11:31:09', 6, 19, '192.168.1.112'),
(34, '2015-03-20 02:42:35', 6, 19, '192.168.1.112'),
(35, '2015-03-20 02:42:35', 6, 19, '192.168.1.112'),
(36, '2015-03-20 02:44:02', 6, 19, '192.168.1.112'),
(37, '2015-03-20 02:45:50', 6, 19, '192.168.1.112'),
(38, '2015-03-20 02:53:47', 14, 19, '192.168.1.112'),
(39, '2015-03-20 02:53:47', 14, 19, '192.168.1.112'),
(40, '2015-03-20 02:58:05', 12, 19, '192.168.1.112'),
(41, '2015-03-20 03:07:40', 6, 19, '192.168.1.112'),
(42, '2015-03-20 05:20:13', 0, 19, '192.168.1.112'),
(43, '2015-03-20 06:40:36', 12, 19, '192.168.1.112'),
(44, '2015-03-20 06:50:11', 6, 19, '192.168.1.112'),
(71, '2015-03-21 03:23:31', 12, 19, '192.168.1.112'),
(72, '2015-03-21 03:31:35', 6, 19, '192.168.1.112'),
(73, '2015-03-21 05:37:08', 14, 19, '192.168.1.112'),
(74, '2015-03-30 02:29:46', 6, 1, '192.168.1.112'),
(75, '2015-03-30 02:30:37', 6, 1, '192.168.1.112'),
(76, '2015-03-30 02:41:07', 6, 1, '192.168.1.112'),
(77, '2015-03-30 02:41:35', 6, 1, '192.168.1.112'),
(78, '2015-03-30 02:41:54', 6, 1, '192.168.1.112'),
(79, '2015-03-30 03:18:28', 6, 1, '192.168.1.112'),
(80, '2015-03-30 03:19:49', 6, 1, '192.168.1.112'),
(81, '2015-04-06 06:26:46', 0, 1, '192.168.1.112'),
(82, '2015-04-06 06:28:16', 0, 1, '192.168.1.112'),
(83, '2015-04-06 06:36:42', 0, 1, '192.168.1.112'),
(84, '2015-04-06 06:36:55', 6, 1, '192.168.1.112'),
(85, '2015-04-06 06:41:10', 6, 1, '192.168.1.112'),
(86, '2015-04-07 11:01:30', 0, 1, '192.168.1.112'),
(87, '2015-04-07 02:53:31', 6, 1, '192.168.1.112'),
(88, '2015-04-07 03:00:06', 0, 1, '192.168.1.112'),
(89, '2015-04-07 03:00:07', 0, 1, '192.168.1.112'),
(90, '2015-04-07 03:00:07', 0, 1, '192.168.1.112'),
(91, '2015-04-07 03:00:07', 0, 1, '192.168.1.112'),
(92, '2015-04-07 03:00:07', 0, 1, '192.168.1.112'),
(93, '2015-04-07 03:00:07', 0, 1, '192.168.1.112'),
(94, '2015-04-07 03:00:07', 0, 1, '192.168.1.112'),
(95, '2015-04-07 03:00:07', 0, 1, '192.168.1.112'),
(96, '2015-04-07 03:00:07', 0, 1, '192.168.1.112'),
(97, '2015-04-07 03:00:07', 0, 1, '192.168.1.112'),
(98, '2015-04-07 03:00:07', 0, 1, '192.168.1.112'),
(99, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(100, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(101, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(102, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(103, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(104, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(105, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(106, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(107, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(108, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(109, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(110, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(111, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(112, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(113, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(114, '2015-04-07 03:00:08', 0, 1, '192.168.1.112'),
(115, '2015-04-07 03:00:09', 0, 1, '192.168.1.112'),
(116, '2015-04-07 03:00:09', 0, 1, '192.168.1.112'),
(117, '2015-04-09 11:13:16', 0, 1, '192.168.1.112'),
(118, '2015-04-09 11:44:28', 0, 1, '192.168.1.112'),
(119, '2015-04-09 11:44:35', 0, 1, '192.168.1.112'),
(120, '2015-04-09 04:31:47', 6, 1, '192.168.1.112'),
(121, '2015-04-10 02:01:13', 6, 1, '192.168.1.112'),
(122, '2015-04-15 06:10:05', 6, 1, '192.168.1.63'),
(123, '2015-04-15 06:10:10', 6, 3, '192.168.1.63'),
(124, '2015-04-15 06:15:41', 6, 1, '192.168.1.63'),
(125, '2015-04-15 06:16:02', 6, 2, '192.168.1.63'),
(126, '2015-04-16 12:29:10', 0, 3, '192.168.1.176'),
(127, '2015-04-16 12:30:22', 0, 3, '192.168.1.176'),
(128, '2015-04-16 12:38:04', 0, 3, '192.168.1.176'),
(129, '2015-04-16 12:38:25', 0, 3, '192.168.1.176'),
(130, '2015-04-24 11:35:56', 6, 2, '192.168.1.63'),
(131, '2015-04-24 11:36:24', 6, 2, '192.168.1.63'),
(132, '2015-04-24 11:36:41', 6, 2, '192.168.1.63'),
(133, '2015-04-24 11:36:53', 6, 31, '192.168.1.63'),
(134, '2015-04-24 03:10:46', 6, 2, '192.168.1.63'),
(135, '2015-04-24 03:11:16', 6, 21, '192.168.1.63'),
(136, '2015-04-24 03:18:33', 6, 31, '192.168.1.63'),
(137, '2015-04-24 03:19:28', 6, 31, '192.168.1.63'),
(138, '2015-04-24 03:20:14', 6, 31, '192.168.1.63'),
(139, '2015-04-24 06:30:15', 6, 31, '192.168.1.63'),
(140, '2015-04-24 06:30:28', 6, 31, '192.168.1.63'),
(141, '2015-04-27 04:43:19', 0, 2, '192.168.1.63'),
(142, '2015-04-27 04:43:22', 0, 2, '192.168.1.63'),
(143, '2015-04-28 11:38:42', 0, 31, '192.168.1.63'),
(144, '2015-04-28 11:39:11', 0, 21, '192.168.1.63'),
(145, '2015-04-28 11:39:23', 0, 31, '192.168.1.63'),
(146, '2015-04-28 11:43:58', 0, 2, '192.168.1.63'),
(147, '2015-04-28 11:44:13', 0, 31, '192.168.1.63'),
(148, '2015-04-28 11:54:19', 0, 31, '192.168.1.63'),
(149, '2015-04-28 12:13:13', 0, 31, '192.168.1.63'),
(150, '2015-04-28 12:44:35', 0, 31, '192.168.1.63'),
(151, '2015-04-28 12:45:34', 0, 31, '192.168.1.63'),
(152, '2015-04-28 01:48:56', 0, 31, '192.168.1.63'),
(153, '2015-04-28 01:50:02', 0, 31, '192.168.1.63'),
(154, '2015-04-28 02:00:50', 0, 31, '192.168.1.63'),
(155, '2015-04-28 02:01:04', 0, 31, '192.168.1.63'),
(156, '2015-04-28 02:01:44', 0, 31, '192.168.1.63'),
(157, '2015-04-28 02:53:29', 0, 31, '192.168.1.63'),
(158, '2015-04-28 03:02:59', 0, 31, '192.168.1.63'),
(159, '2015-04-28 05:56:42', 0, 31, '192.168.1.63'),
(160, '2015-04-28 05:59:47', 0, 31, '192.168.1.63'),
(161, '2015-04-28 08:08:57', 0, 2, '192.168.1.63'),
(162, '2015-04-28 08:10:12', 0, 2, '192.168.1.63'),
(163, '2015-04-28 08:10:20', 0, 2, '192.168.1.63'),
(164, '2015-04-29 12:07:22', 0, 31, '192.168.1.63'),
(165, '2015-04-29 07:11:08', 0, 21, '192.168.1.63'),
(166, '2015-04-29 07:11:35', 0, 31, '192.168.1.63'),
(167, '2015-04-30 10:02:22', 0, 34, '192.168.1.63'),
(168, '2015-04-30 10:02:49', 0, 8, '192.168.1.63'),
(169, '2015-04-30 04:34:36', 6, 3, '192.168.1.63'),
(170, '2015-04-30 04:34:46', 6, 3, '192.168.1.63'),
(171, '2015-04-30 04:34:46', 6, 3, '192.168.1.63'),
(172, '2015-04-30 04:34:46', 6, 3, '192.168.1.63'),
(173, '2015-04-30 04:34:46', 6, 3, '192.168.1.63'),
(174, '2015-04-30 04:34:46', 6, 3, '192.168.1.63'),
(175, '2015-04-30 04:34:47', 6, 3, '192.168.1.63'),
(176, '2015-04-30 04:34:47', 6, 3, '192.168.1.63'),
(177, '2015-04-30 04:34:47', 6, 3, '192.168.1.63'),
(178, '2015-04-30 04:34:47', 6, 3, '192.168.1.63'),
(179, '2015-04-30 04:34:47', 6, 3, '192.168.1.63'),
(180, '2015-04-30 04:34:47', 6, 3, '192.168.1.63'),
(181, '2015-04-30 04:34:47', 6, 3, '192.168.1.63'),
(182, '2015-04-30 04:34:47', 6, 3, '192.168.1.63'),
(183, '2015-04-30 04:34:47', 6, 3, '192.168.1.63'),
(184, '2015-04-30 04:34:47', 6, 3, '192.168.1.63'),
(185, '2015-04-30 04:34:47', 6, 3, '192.168.1.63'),
(186, '2015-04-30 04:34:47', 6, 3, '192.168.1.63'),
(187, '2015-04-30 04:34:47', 6, 3, '192.168.1.63'),
(188, '2015-04-30 04:34:48', 6, 3, '192.168.1.63'),
(189, '2015-04-30 04:34:48', 6, 3, '192.168.1.63'),
(190, '2015-04-30 04:34:48', 6, 3, '192.168.1.63'),
(191, '2015-04-30 04:34:48', 6, 3, '192.168.1.63'),
(192, '2015-04-30 04:34:48', 6, 3, '192.168.1.63'),
(193, '2015-04-30 04:34:48', 6, 3, '192.168.1.63'),
(194, '2015-04-30 04:34:48', 6, 3, '192.168.1.63'),
(195, '2015-04-30 04:34:48', 6, 3, '192.168.1.63'),
(196, '2015-04-30 04:35:29', 0, 3, '192.168.1.63'),
(197, '2015-04-30 04:36:05', 6, 3, '192.168.1.63'),
(198, '2015-04-30 04:37:33', 6, 3, '192.168.1.63'),
(199, '2015-04-30 04:37:34', 6, 3, '192.168.1.63'),
(200, '2015-04-30 04:37:34', 6, 3, '192.168.1.63'),
(201, '2015-04-30 04:37:34', 6, 3, '192.168.1.63'),
(202, '2015-04-30 04:37:34', 6, 3, '192.168.1.63'),
(203, '2015-04-30 04:37:34', 6, 3, '192.168.1.63'),
(204, '2015-04-30 04:37:34', 6, 3, '192.168.1.63'),
(205, '2015-04-30 04:37:34', 6, 3, '192.168.1.63'),
(206, '2015-04-30 04:37:34', 6, 3, '192.168.1.63'),
(207, '2015-04-30 04:37:34', 6, 3, '192.168.1.63'),
(208, '2015-04-30 04:37:34', 6, 3, '192.168.1.63'),
(209, '2015-04-30 04:37:34', 6, 3, '192.168.1.63'),
(210, '2015-04-30 04:37:35', 6, 3, '192.168.1.63'),
(211, '2015-04-30 04:37:35', 6, 3, '192.168.1.63'),
(212, '2015-04-30 04:38:01', 6, 3, '192.168.1.63'),
(213, '2015-04-30 04:38:46', 6, 3, '192.168.1.63'),
(214, '2015-04-30 04:39:02', 6, 3, '192.168.1.63'),
(215, '2015-04-30 04:39:27', 6, 3, '192.168.1.63'),
(216, '2015-04-30 04:39:39', 6, 3, '192.168.1.63'),
(217, '2015-04-30 04:42:53', 6, 3, '192.168.1.63'),
(218, '2015-04-30 04:43:47', 6, 3, '192.168.1.63'),
(219, '2015-04-30 04:44:22', 6, 4, '192.168.1.63'),
(220, '2015-04-30 04:44:24', 6, 8, '192.168.1.63'),
(221, '2015-04-30 06:13:17', 6, 3, '192.168.1.63'),
(222, '2015-04-30 06:54:36', 6, 33, '192.168.1.63'),
(223, '2015-04-30 07:14:40', 6, 3, '192.168.1.63'),
(224, '2015-05-04 10:06:25', 0, 31, '192.168.1.63'),
(225, '2015-05-04 10:12:59', 0, 21, '192.168.1.63'),
(226, '2015-05-04 10:19:39', 6, 4, '192.168.1.63'),
(227, '2015-05-04 03:00:40', 0, 31, '192.168.1.63'),
(228, '2015-05-05 02:04:17', 0, 3, '192.168.1.63'),
(229, '2015-05-05 02:04:39', 6, 3, '192.168.1.63'),
(230, '2015-05-06 11:21:11', 0, 8, '192.168.1.63'),
(231, '2015-05-06 11:21:14', 0, 21, '192.168.1.63'),
(232, '2015-05-06 11:23:42', 0, 8, '192.168.1.63'),
(233, '2015-05-06 11:27:47', 0, 21, '192.168.1.63'),
(234, '2015-05-06 11:28:25', 0, 31, '192.168.1.63'),
(235, '2015-05-06 11:29:08', 0, 21, '192.168.1.63'),
(236, '2015-05-06 11:32:43', 0, 8, '192.168.1.63'),
(237, '2015-05-06 11:33:42', 0, 8, '192.168.1.63'),
(238, '2015-05-06 11:33:55', 0, 8, '192.168.1.63'),
(239, '2015-05-06 11:35:39', 0, 21, '192.168.1.63'),
(240, '2015-05-06 11:35:51', 0, 31, '192.168.1.63'),
(241, '2015-05-06 11:36:05', 0, 31, '192.168.1.63'),
(242, '2015-05-06 11:54:43', 0, 8, '192.168.1.63'),
(243, '2015-05-06 11:55:21', 0, 21, '192.168.1.63'),
(244, '2015-05-06 11:56:03', 0, 8, '192.168.1.63'),
(245, '2015-05-06 11:56:04', 0, 21, '192.168.1.63'),
(246, '2015-05-06 11:56:51', 0, 8, '192.168.1.63'),
(247, '2015-05-06 03:20:59', 0, 3, '192.168.1.63'),
(248, '2015-05-06 03:51:49', 0, 3, '192.168.1.63'),
(249, '2015-05-06 03:59:11', 0, 34, '192.168.1.63'),
(250, '2015-05-06 03:59:32', 0, 3, '192.168.1.63'),
(251, '2015-05-06 04:15:17', 0, 35, '192.168.1.63'),
(252, '2015-05-07 06:52:58', 6, 3, '192.168.1.63'),
(253, '2015-05-07 06:55:25', 6, 3, '192.168.1.63'),
(254, '2015-05-11 04:34:51', 6, 3, '192.168.1.63'),
(255, '2015-05-11 04:35:52', 6, 3, '192.168.1.63'),
(256, '2015-05-12 10:01:33', 0, 3, '192.168.1.63'),
(257, '2015-05-12 10:04:08', 0, 40, '192.168.1.63'),
(258, '2015-05-12 10:12:09', 6, 3, '192.168.1.63'),
(259, '2015-05-12 10:35:20', 6, 3, '192.168.1.63'),
(260, '2015-05-12 04:44:24', 6, 3, '192.168.1.63'),
(261, '2015-05-12 07:44:43', 6, 3, '192.168.1.63'),
(262, '2015-05-12 07:46:23', 6, 3, '192.168.1.63'),
(263, '2015-05-12 07:46:57', 6, 3, '192.168.1.63'),
(264, '2015-05-12 07:47:15', 6, 3, '192.168.1.63'),
(265, '2015-05-12 07:48:28', 6, 3, '192.168.1.63'),
(266, '2015-05-12 07:49:33', 6, 3, '192.168.1.63'),
(267, '2015-05-12 07:49:59', 6, 3, '192.168.1.63'),
(268, '2015-05-12 07:52:23', 6, 3, '192.168.1.63'),
(269, '2015-05-12 07:53:22', 6, 3, '192.168.1.63'),
(270, '2015-05-12 07:57:05', 6, 3, '192.168.1.63'),
(271, '2015-05-12 08:03:48', 6, 3, '192.168.1.63'),
(272, '2015-05-12 08:03:49', 6, 3, '192.168.1.63'),
(273, '2015-05-12 08:03:49', 6, 3, '192.168.1.63'),
(274, '2015-05-12 08:03:49', 6, 3, '192.168.1.63'),
(275, '2015-05-12 08:05:09', 6, 3, '192.168.1.63'),
(276, '2015-05-12 08:05:09', 6, 3, '192.168.1.63'),
(277, '2015-05-12 08:05:09', 6, 3, '192.168.1.63'),
(278, '2015-05-12 08:05:09', 6, 3, '192.168.1.63'),
(279, '2015-05-12 08:05:09', 6, 3, '192.168.1.63'),
(280, '2015-05-13 06:04:35', 6, 40, '192.168.1.63'),
(281, '2015-05-14 10:44:46', 6, 40, '192.168.1.63'),
(282, '2015-05-14 10:46:49', 6, 36, '192.168.1.63'),
(283, '2015-05-14 11:01:39', 6, 36, '192.168.1.63'),
(284, '2015-05-14 11:28:21', 6, 36, '192.168.1.63'),
(285, '2015-05-14 11:30:15', 6, 36, '192.168.1.63'),
(286, '2015-05-14 11:34:57', 6, 36, '192.168.1.63'),
(287, '2015-05-14 11:34:58', 6, 36, '192.168.1.63'),
(288, '2015-05-14 11:34:58', 6, 36, '192.168.1.63'),
(289, '2015-05-14 11:34:58', 6, 36, '192.168.1.63'),
(290, '2015-05-14 11:34:58', 6, 36, '192.168.1.63'),
(291, '2015-05-14 11:34:58', 6, 36, '192.168.1.63'),
(292, '2015-05-14 11:34:58', 6, 36, '192.168.1.63'),
(293, '2015-05-14 11:34:58', 6, 36, '192.168.1.63'),
(294, '2015-05-14 11:34:58', 6, 36, '192.168.1.63'),
(295, '2015-05-14 11:34:58', 6, 36, '192.168.1.63'),
(296, '2015-05-14 11:34:58', 6, 36, '192.168.1.63'),
(297, '2015-05-14 11:34:59', 6, 36, '192.168.1.63'),
(298, '2015-05-14 11:45:21', 6, 36, '192.168.1.63'),
(299, '2015-05-14 11:55:36', 6, 32, '192.168.1.63'),
(300, '2015-05-14 12:06:48', 6, 32, '192.168.1.63'),
(301, '2015-05-14 12:26:55', 6, 3, '192.168.1.63'),
(302, '2015-05-14 12:51:45', 6, 3, '192.168.1.63'),
(303, '2015-05-14 01:56:54', 6, 7, '192.168.1.63'),
(304, '2015-05-14 01:56:55', 6, 19, '192.168.1.63'),
(305, '2015-05-14 01:57:54', 6, 3, '192.168.1.63'),
(306, '2015-05-14 01:59:29', 6, 7, '192.168.1.63'),
(307, '2015-05-14 02:18:14', 6, 7, '192.168.1.63'),
(308, '2015-05-14 02:24:02', 6, 7, '192.168.1.63'),
(309, '2015-05-14 02:24:56', 6, 40, '192.168.1.63'),
(310, '2015-05-14 02:28:36', 6, 40, '192.168.1.63'),
(311, '2015-05-14 02:31:29', 6, 40, '192.168.1.63'),
(312, '2015-05-14 02:33:58', 6, 40, '192.168.1.63'),
(313, '2015-05-18 04:06:52', 0, 3, '192.168.1.63'),
(314, '2015-05-18 04:37:21', 0, 3, '192.168.1.63'),
(315, '2015-05-18 04:37:23', 0, 19, '192.168.1.63'),
(316, '2015-05-18 04:37:33', 0, 7, '192.168.1.63'),
(317, '2015-05-18 04:37:35', 0, 21, '192.168.1.63'),
(318, '2015-05-18 04:37:38', 0, 32, '192.168.1.63'),
(319, '2015-05-18 04:37:51', 0, 3, '192.168.1.63'),
(320, '2015-05-18 04:38:01', 0, 19, '192.168.1.63'),
(321, '2015-05-18 04:38:08', 0, 7, '192.168.1.63'),
(322, '2015-05-18 04:38:16', 0, 21, '192.168.1.63'),
(323, '2015-05-18 05:17:43', 0, 21, '192.168.1.63'),
(324, '2015-05-18 05:17:52', 0, 32, '192.168.1.63'),
(325, '2015-05-18 05:18:02', 0, 36, '192.168.1.63'),
(326, '2015-05-18 05:18:11', 0, 3, '192.168.1.63'),
(327, '2015-05-18 05:18:22', 0, 19, '192.168.1.63'),
(328, '2015-05-18 05:18:31', 0, 7, '192.168.1.63'),
(329, '2015-05-18 05:37:59', 0, 7, '192.168.1.63'),
(330, '2015-05-18 05:38:14', 0, 19, '192.168.1.63'),
(331, '2015-05-18 05:41:09', 0, 40, '192.168.1.63'),
(332, '2015-05-18 05:46:26', 0, 38, '192.168.1.63'),
(333, '2015-05-18 05:46:32', 0, 39, '192.168.1.63'),
(334, '2015-05-18 05:46:39', 0, 7, '192.168.1.63'),
(335, '2015-05-18 06:43:18', 0, 21, '192.168.1.63'),
(336, '2015-05-18 06:43:44', 0, 21, '192.168.1.63'),
(337, '2015-05-18 07:11:49', 0, 39, '192.168.1.63'),
(338, '2015-05-19 02:04:41', 0, 3, '192.168.1.63'),
(339, '2015-05-19 02:06:48', 0, 3, '192.168.1.63'),
(340, '2015-05-19 02:08:46', 0, 40, '192.168.1.63'),
(341, '2015-05-19 02:40:20', 0, 3, '192.168.1.63'),
(342, '2015-05-19 02:55:54', 0, 7, '192.168.1.63'),
(343, '2015-05-19 02:56:19', 0, 3, '192.168.1.63'),
(344, '2015-05-19 05:48:49', 0, 38, '192.168.1.55'),
(345, '2015-05-20 11:58:42', 6, 40, '192.168.1.63'),
(346, '2015-05-20 12:01:10', 6, 40, '192.168.1.63'),
(347, '2015-05-20 12:10:49', 0, 40, '192.168.1.63'),
(348, '2015-05-20 02:13:26', 6, 40, '192.168.1.63'),
(349, '2015-05-20 02:13:51', 6, 40, '192.168.1.63'),
(350, '2015-05-20 02:14:12', 6, 47, '192.168.1.63'),
(351, '2015-05-20 02:14:22', 6, 46, '192.168.1.63'),
(352, '2015-05-20 02:15:17', 6, 46, '192.168.1.63'),
(353, '2015-05-20 02:15:32', 6, 46, '192.168.1.63'),
(354, '2015-05-20 02:16:00', 6, 46, '192.168.1.63'),
(355, '2015-05-20 02:16:01', 6, 46, '192.168.1.63'),
(356, '2015-05-20 02:16:04', 6, 46, '192.168.1.63'),
(357, '2015-05-20 02:16:04', 6, 46, '192.168.1.63'),
(358, '2015-05-20 02:16:22', 6, 46, '192.168.1.63'),
(359, '2015-05-20 02:16:23', 6, 46, '192.168.1.63'),
(360, '2015-05-20 02:16:44', 6, 46, '192.168.1.63'),
(361, '2015-05-20 02:16:55', 6, 46, '192.168.1.63'),
(362, '2015-05-20 02:17:07', 6, 46, '192.168.1.63'),
(363, '2015-05-20 02:18:03', 6, 46, '192.168.1.63'),
(364, '2015-05-20 02:19:40', 6, 46, '192.168.1.63'),
(365, '2015-05-20 02:22:40', 6, 46, '192.168.1.63'),
(366, '2015-05-20 02:23:32', 6, 46, '192.168.1.63'),
(367, '2015-05-20 02:29:44', 6, 46, '192.168.1.63'),
(368, '2015-05-20 02:30:11', 6, 46, '192.168.1.63'),
(369, '2015-05-20 02:34:01', 6, 46, '192.168.1.63'),
(370, '2015-05-20 02:34:35', 6, 46, '192.168.1.63'),
(371, '2015-05-20 02:35:03', 6, 46, '192.168.1.63'),
(372, '2015-05-20 02:36:49', 6, 46, '192.168.1.63'),
(373, '2015-05-20 02:38:04', 6, 46, '192.168.1.63'),
(374, '2015-05-20 02:39:10', 6, 46, '192.168.1.63'),
(375, '2015-05-20 02:40:17', 6, 46, '192.168.1.63'),
(376, '2015-05-20 02:44:15', 6, 46, '192.168.1.63'),
(377, '2015-05-20 02:44:48', 6, 46, '192.168.1.63'),
(378, '2015-05-20 02:45:18', 6, 46, '192.168.1.63'),
(379, '2015-05-20 02:50:06', 6, 46, '192.168.1.63'),
(380, '2015-05-20 02:50:06', 6, 46, '192.168.1.63'),
(381, '2015-05-20 02:50:06', 6, 46, '192.168.1.63'),
(382, '2015-05-20 02:50:06', 6, 46, '192.168.1.63'),
(383, '2015-05-20 02:50:06', 6, 46, '192.168.1.63'),
(384, '2015-05-20 02:50:07', 6, 46, '192.168.1.63'),
(385, '2015-05-20 02:53:27', 6, 46, '192.168.1.63'),
(386, '2015-05-20 02:55:00', 6, 46, '192.168.1.63'),
(387, '2015-05-20 02:55:01', 6, 46, '192.168.1.63'),
(388, '2015-05-20 02:55:36', 6, 46, '192.168.1.63'),
(389, '2015-05-20 02:55:37', 6, 46, '192.168.1.63'),
(390, '2015-05-20 02:57:33', 6, 46, '192.168.1.63'),
(391, '2015-05-20 03:00:18', 6, 46, '192.168.1.63'),
(392, '2015-05-20 03:01:17', 6, 46, '192.168.1.63'),
(393, '2015-05-20 03:03:32', 6, 46, '192.168.1.63'),
(394, '2015-05-20 03:19:00', 6, 46, '192.168.1.63'),
(395, '2015-05-20 03:23:40', 6, 46, '192.168.1.63'),
(396, '2015-05-20 03:36:34', 6, 48, '192.168.1.63');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `today_date` date NOT NULL,
  `hotel_id` bigint(20) NOT NULL DEFAULT '0',
  `web_user_id` bigint(20) NOT NULL DEFAULT '0',
  `total_amount` double NOT NULL DEFAULT '0',
  `price_type` tinyint(1) NOT NULL COMMENT '1-Euro,2-Dollar,3-INR',
  `bookings_count` bigint(20) NOT NULL DEFAULT '0',
  `slump_rate_count` bigint(20) NOT NULL DEFAULT '0',
  `discounts_count` bigint(20) NOT NULL DEFAULT '0',
  `bids_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `created`, `modified`, `today_date`, `hotel_id`, `web_user_id`, `total_amount`, `price_type`, `bookings_count`, `slump_rate_count`, `discounts_count`, `bids_count`) VALUES
(1, '2015-02-24 06:10:08', '0000-00-00 00:00:00', '2015-02-24', 5, 0, 0, 0, 0, 1, 2, 1),
(2, '2015-02-24 07:04:53', '0000-00-00 00:00:00', '2015-02-24', 4, 0, 0, 0, 0, 1, 0, 0),
(3, '2015-02-24 07:24:29', '0000-00-00 00:00:00', '2015-02-24', 2, 0, 0, 0, 0, 1, 1, 1),
(4, '2015-02-24 09:16:39', '0000-00-00 00:00:00', '2015-02-24', 7, 0, 0, 0, 0, 0, 0, 1),
(5, '2015-02-24 09:33:24', '0000-00-00 00:00:00', '2015-02-24', 3, 0, 0, 0, 0, 0, 1, 0),
(6, '2015-02-24 10:19:11', '0000-00-00 00:00:00', '2015-02-24', 8, 0, 0, 0, 0, 1, 1, 0),
(7, '2015-02-24 10:37:25', '0000-00-00 00:00:00', '2015-02-24', 9, 0, 0, 0, 0, 0, 1, 0),
(8, '2015-03-11 12:55:10', '0000-00-00 00:00:00', '2015-03-11', 8, 0, 0, 0, 0, 0, 2, 0),
(9, '2015-03-12 12:34:35', '0000-00-00 00:00:00', '2015-03-12', 2, 0, 0, 0, 0, 0, 1, 0),
(10, '2015-03-13 05:52:36', '0000-00-00 00:00:00', '2015-03-13', 2, 0, 0, 0, 0, 0, 0, 1),
(11, '2015-03-21 01:02:36', '0000-00-00 00:00:00', '2015-03-21', 2, 0, 0, 0, 0, 0, 0, 0),
(12, '2015-03-28 07:58:02', '0000-00-00 00:00:00', '2015-03-28', 2, 0, 0, 0, 0, 0, 1, 0),
(13, '2015-04-22 10:26:22', '0000-00-00 00:00:00', '2015-04-22', 2, 0, 0, 0, 0, 0, 1, 0),
(14, '2015-04-28 05:59:17', '0000-00-00 00:00:00', '2015-04-28', 2, 0, 0, 0, 0, 0, 0, 1),
(15, '2015-04-30 06:29:42', '0000-00-00 00:00:00', '2015-04-30', 2, 0, 0, 0, 0, 0, 3, 1),
(16, '2015-04-30 06:37:20', '0000-00-00 00:00:00', '2015-04-30', 5, 0, 0, 0, 0, 2, 1, 0),
(17, '2015-05-04 06:49:45', '0000-00-00 00:00:00', '2015-05-04', 5, 0, 50, 0, 1, 0, 0, 0),
(18, '2015-05-11 11:42:51', '0000-00-00 00:00:00', '2015-05-11', 2, 0, 0, 0, 0, 2, 0, 0),
(19, '2015-05-18 02:00:19', '0000-00-00 00:00:00', '2015-05-18', 2, 0, 0, 0, 0, 1, 0, 0),
(20, '2015-05-20 08:41:59', '0000-00-00 00:00:00', '2015-05-20', 2, 0, 452, 0, 1, 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `report_abuse`
--

CREATE TABLE IF NOT EXISTS `report_abuse` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `offer_id` bigint(20) NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `hotel_comments_id` bigint(20) NOT NULL,
  `abuse_type` tinyint(1) NOT NULL,
  `request_type` tinyint(1) NOT NULL COMMENT '1-offer,2-hotel,3-review',
  `message` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `report_abuse`
--

INSERT INTO `report_abuse` (`id`, `created`, `modified`, `user_id`, `offer_id`, `hotel_id`, `hotel_comments_id`, `abuse_type`, `request_type`, `message`) VALUES
(1, '2015-05-04 00:00:00', NULL, 6, 0, 3, 1, 2, 3, 'dfgdfg');

-- --------------------------------------------------------

--
-- Table structure for table `room_types`
--

CREATE TABLE IF NOT EXISTS `room_types` (
`id` bigint(20) NOT NULL,
  `created` date NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `room_types`
--

INSERT INTO `room_types` (`id`, `created`, `modified`, `name`, `alias`, `is_active`) VALUES
(1, '2015-03-23', '2015-03-23 09:53:37', 'Test room type', 'test-room-type', 1),
(2, '2015-03-23', '2015-03-23 09:53:46', 'Test room type2', 'test-room-type2', 1),
(3, '2015-03-23', '2015-03-23 09:54:00', 'Test room type 3', 'test-room-type-3', 1),
(4, '2015-03-23', '2015-03-23 09:54:30', 'Test room type4', 'test-room-type4', 1),
(5, '2015-03-23', '2015-03-23 09:54:38', 'room type 5', 'room-type-5', 1),
(6, '2015-03-23', '2015-03-23 09:54:45', 'room type 6', 'room-type-6', 1),
(7, '2015-04-29', '2015-04-29 08:20:16', 'Search room types', 'search-room-types', 1);

-- --------------------------------------------------------

--
-- Table structure for table `room_view_types`
--

CREATE TABLE IF NOT EXISTS `room_view_types` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `room_view_types`
--

INSERT INTO `room_view_types` (`id`, `created`, `modified`, `name`, `alias`, `is_active`) VALUES
(1, '2015-03-23 09:58:37', '2015-03-23 09:58:37', 'view 1', 'view-1', 1),
(2, '2015-03-23 09:58:44', '2015-03-23 09:58:44', 'view 2', 'view-2', 1),
(3, '2015-03-23 09:58:52', '2015-03-23 09:58:52', 'view 3', 'view-3', 0),
(4, '2015-03-23 09:59:01', '2015-03-23 09:59:01', 'view 4', 'view-4', 0),
(5, '2015-03-23 09:59:09', '2015-03-23 09:59:09', 'view 5', 'view-5', 1),
(6, '2015-03-23 09:59:18', '2015-03-23 09:59:18', 'room view type 6', 'room-view-type-6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `save_filter`
--

CREATE TABLE IF NOT EXISTS `save_filter` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `keyword` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(255) NOT NULL,
  `browser_info` text NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `save_filter`
--

INSERT INTO `save_filter` (`id`, `created`, `modified`, `user_id`, `keyword`, `ip`, `browser_info`, `is_deleted`) VALUES
(1, '2015-05-13 08:51:02', '2015-05-13 08:51:02', 6, 'a:1:{s:13:"hotel_ratings";s:1:"2";}', '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(4, '2015-05-13 02:58:27', '2015-05-13 02:58:27', 6, 'a:10:{s:13:"acution_types";a:2:{i:0;s:1:"2";i:1;s:1:"3";}s:9:"locations";a:4:{s:10:"country_id";s:1:"4";s:8:"state_id";s:3:"128";s:7:"city_id";s:3:"201";s:7:"area_id";s:1:"5";}s:13:"near_location";a:2:{s:8:"distance";s:2:"12";s:5:"areas";s:1:"5";}s:13:"hotel_ratings";s:1:"4";s:13:"hotel_classes";s:1:"3";s:5:"price";a:2:{s:4:"from";s:1:"1";s:2:"to";s:4:"2420";}s:12:"session_amen";a:5:{i:0;s:2:"40";i:1;s:2:"26";i:2;s:2:"18";i:3;s:2:"12";i:4;s:1:"1";}s:12:"session_suit";a:6:{i:0;s:2:"15";i:1;s:2:"12";i:2;s:1:"9";i:3;s:1:"6";i:4;s:1:"5";i:5;s:1:"1";}s:12:"session_acts";a:6:{i:0;s:2:"14";i:1;s:1:"9";i:2;s:1:"7";i:3;s:1:"8";i:4;s:1:"6";i:5;s:1:"1";}s:14:"session_rtypes";a:3:{i:0;s:1:"7";i:1;s:1:"4";i:2;s:1:"2";}}', '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(5, '2015-05-13 02:59:20', '2015-05-13 02:59:20', 6, 'a:4:{s:9:"locations";a:6:{s:2:"id";s:1:"2";s:10:"country_id";s:1:"4";s:8:"state_id";s:3:"128";s:7:"city_id";s:3:"201";s:7:"key_ids";s:1:"2";s:10:"search_bys";s:1:"2";}s:4:"keys";a:3:{s:6:"key_id";s:1:"2";s:8:"keywords";s:16:"Hotel Zoo Berlin";s:9:"search_by";s:1:"2";}s:11:"noofpersons";s:1:"3";s:10:"validdates";a:2:{s:8:"datefrom";s:10:"13.05.2015";s:6:"dateto";s:10:"21.05.2015";}}', '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
`id` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `sitename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `setting_fields` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Serialize all admin setting fields',
  `is_active` tinyint(1) NOT NULL COMMENT '1-Active,0-Inactive'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `created`, `modified`, `sitename`, `setting_fields`, `is_active`) VALUES
(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hobitel', 'a:7:{s:13:"email_address";s:18:"admin2@hobitel.com";s:7:"contact";s:12:"984056589899";s:15:"back_pagination";s:2:"10";s:16:"front_pagination";s:1:"6";s:12:"paypal_email";s:16:"admin@paypal.com";s:8:"Keywords";s:4:"fdsd";s:11:"description";s:5:"fsfds";}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `site_views`
--

CREATE TABLE IF NOT EXISTS `site_views` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL COMMENT '0-guest, else Site user id or hotel user id',
  `ip` varchar(255) NOT NULL,
  `browser_info` text NOT NULL,
  `is_deleted` tinyint(1) NOT NULL COMMENT '1-Deleted'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE IF NOT EXISTS `states` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` float NOT NULL,
  `longtitude` float NOT NULL,
  `state_type` tinyint(4) NOT NULL COMMENT '1-state 2- county',
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2379 ;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `created`, `modified`, `name`, `alias`, `country_id`, `code`, `latitude`, `longtitude`, `state_type`, `is_active`) VALUES
(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'California', '', 5, '', 37.42, -122.06, 0, 1),
(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Beijing', '', 2, '', 39.93, 116.39, 0, 1),
(9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Iowa', '', 5, '', 43.03, -96.09, 0, 1),
(10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'New York', '', 5, '', 40.76, -73.97, 0, 1),
(11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hebei', '', 2, '', 39.89, 115.28, 0, 1),
(12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jiangsu', '', 2, '', 32.06, 118.78, 0, 1),
(14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'New Jersey', '', 5, '', 39.82, -75.13, 0, 1),
(15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Massachusetts', '', 5, '', 42.56, -72.18, 0, 1),
(16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Connecticut', '', 5, '', 41.14, -73.26, 0, 1),
(17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Guangdong', '', 2, '', 23.12, 113.25, 0, 1),
(19, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Florida', '', 5, '', 28.05, -82.36, 0, 1),
(24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Texas', '', 5, '', 30.27, -97.74, 0, 1),
(28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Armed Forces US', '', 5, '', 60, -100, 0, 1),
(32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tennessee', '', 5, '', 35.04, -89.93, 0, 1),
(33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kentucky', '', 5, '', 39.02, -84.56, 0, 1),
(34, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ile-de-3nce', '', 3, '', 48.8, 2.5, 0, 1),
(35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Georgia', '', 5, '', 33.84, -84.38, 0, 1),
(37, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rio de Janeiro', '', 1, '', -22.9, -43.23, 0, 1),
(44, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Illinois', '', 5, '', 42.05, -88.05, 0, 1),
(46, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ceara', '', 1, '', -3.32, -41.42, 0, 1),
(47, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Colorado', '', 5, '', 39.74, -104.98, 0, 1),
(48, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Zhejiang', '', 2, '', 28.02, 120.65, 0, 1),
(49, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Utah', '', 5, '', 40.76, -111.89, 0, 1),
(52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Liaoning', '', 2, '', 41.79, 123.43, 0, 1),
(56, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Haryana', '', 4, '', 28.47, 77.03, 0, 1),
(57, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Maryland', '', 5, '', 39.1, -76.88, 0, 1),
(62, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shanghai', '', 2, '', 31, 121.41, 0, 1),
(64, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tianjin', '', 2, '', 39.14, 117.18, 0, 1),
(72, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'South Carolina', '', 5, '', 33.92, -80.34, 0, 1),
(73, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Montana', '', 5, '', 45.77, -110.93, 0, 1),
(76, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Louisiana', '', 5, '', 29.91, -90.05, 0, 1),
(77, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Fujian', '', 2, '', 24.47, 118.09, 0, 1),
(78, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Santa Catarina', '', 1, '', -26.48, -49.07, 0, 1),
(80, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Espirito Santo', '', 1, '', -20.12, -40.3, 0, 1),
(84, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Washington', '', 5, '', 47.09, -122.65, 0, 1),
(85, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Andhra Pradesh', '', 4, '', 17.38, 78.47, 0, 1),
(87, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pennsylvania', '', 5, '', 40.45, -79.99, 0, 1),
(90, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Guangxi', '', 2, '', 22.82, 108.32, 0, 1),
(93, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'North Carolina', '', 5, '', 35.75, -78.72, 0, 1),
(94, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shandong', '', 2, '', 37.26, 117.08, 0, 1),
(97, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chongqing', '', 2, '', 29.56, 106.55, 0, 1),
(98, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Michigan', '', 5, '', 43.93, -86.26, 0, 1),
(99, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hubei', '', 2, '', 30.58, 114.27, 0, 1),
(100, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Delhi', '', 4, '', 28.67, 77.22, 0, 1),
(101, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Arkansas', '', 5, '', 36.19, -94.24, 0, 1),
(107, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wisconsin', '', 5, '', 44.63, -90.2, 0, 1),
(112, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Midi-Pyrenees', '', 3, '', 43.73, 1.42, 0, 1),
(116, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Picardie', '', 3, '', 49.02, 1.9, 0, 1),
(121, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bahia', '', 1, '', -12.98, -38.52, 0, 1),
(123, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Heilongjiang', '', 2, '', 45.75, 126.65, 0, 1),
(128, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tamil Nadu', '', 4, '', 13.08, 80.28, 0, 1),
(129, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ohio', '', 5, '', 39.11, -84.5, 0, 1),
(132, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'New Mexico', '', 5, '', 35.78, -105.87, 0, 1),
(133, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kansas', '', 5, '', 37.69, -97.34, 0, 1),
(136, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Oregon', '', 5, '', 45.44, -122.97, 0, 1),
(138, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Uttar Pradesh', '', 4, '', 27.18, 78.02, 0, 1),
(140, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ne1ska', '', 5, '', 41.11, -95.93, 0, 1),
(143, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'West Virginia', '', 5, '', 39.46, -77.95, 0, 1),
(144, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Virginia', '', 5, '', 37.13, -76.45, 0, 1),
(145, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Missouri', '', 5, '', 38.25, -94.31, 0, 1),
(148, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mississippi', '', 5, '', 32.37, -90.11, 0, 1),
(151, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rhode Island', '', 5, '', 41.82, -71.41, 0, 1),
(155, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sao Paulo', '', 1, '', -23.95, -46.33, 0, 1),
(156, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shanxi', '', 2, '', 37.9, 112.19, 0, 1),
(160, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Karnataka', '', 4, '', 12.98, 77.58, 0, 1),
(161, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hunan', '', 2, '', 26.97, 109.77, 0, 1),
(163, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '4iana', '', 5, '', 39.79, -86.17, 0, 1),
(164, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Oklahoma', '', 5, '', 34.66, -98.48, 0, 1),
(175, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Minnesota', '', 5, '', 44.98, -93.27, 0, 1),
(176, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alabama', '', 5, '', 33.8, -87.28, 0, 1),
(178, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hainan', '', 2, '', 19.14, 110.48, 0, 1),
(181, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Arizona', '', 5, '', 33.46, -111.99, 0, 1),
(182, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sichuan', '', 2, '', 30.67, 104.07, 0, 1),
(186, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'South Dakota', '', 5, '', 43.72, -98.03, 0, 1),
(187, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Maharashtra', '', 4, '', 18.98, 72.83, 0, 1),
(192, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nevada', '', 5, '', 36.17, -115.28, 0, 1),
(196, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Henan', '', 2, '', 34.22, 113.77, 0, 1),
(206, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Kerala', '', 4, '', 8.51, 76.96, 0, 1),
(215, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'New Hampshire', '', 5, '', 42.87, -71.39, 0, 1),
(218, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Maine', '', 5, '', 44.08, -70.17, 0, 1),
(220, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Hawaii', '', 5, '', 21.3, -157.79, 0, 1),
(225, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chhattisgarh', '', 4, '', 21.18, 81.28, 0, 1),
(236, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Anhui', '', 2, '', 31.86, 117.28, 0, 1),
(249, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'District of Columbia', '', 5, '', 38.9, -77.04, 0, 1),
(254, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Delaware', '', 5, '', 39.62, -75.7, 0, 1),
(258, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'West Bengal', '', 4, '', 22.57, 88.37, 0, 1),
(268, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Shaanxi', '', 2, '', 34.26, 108.94, 0, 1),
(274, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Madhya Pradesh', '', 4, '', 22.72, 75.83, 0, 1),
(284, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gujarat', '', 4, '', 23.03, 72.62, 0, 1),
(296, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3nche-Comte', '', 3, '', 47.63, 6.87, 0, 1),
(305, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Idaho', '', 5, '', 48.39, -116.89, 0, 1),
(306, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rajasthan', '', 4, '', 26.92, 75.82, 0, 1),
(307, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nei Mongol', '', 2, '', 49.2, 119.7, 0, 1),
(315, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alsace', '', 3, '', 48.58, 7.75, 0, 1),
(317, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Orissa', '', 4, '', 20.5, 85.83, 0, 1),
(334, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jilin', '', 2, '', 43.88, 125.32, 0, 1),
(355, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jharkhand', '', 4, '', 23.35, 85.33, 0, 1),
(363, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Chandigarh', '', 4, '', 30.74, 76.79, 0, 1),
(377, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Punjab', '', 4, '', 30.9, 75.85, 0, 1),
(409, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Languedoc-Roussillon', '', 3, '', 43.4, 3.68, 0, 1),
(416, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Assam', '', 4, '', 24.82, 92.8, 0, 1),
(431, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Centre', '', 3, '', 47.08, 2.4, 0, 1),
(469, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Champagne-Ardenne', '', 3, '', 49.42, 4.5, 0, 1),
(471, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bretagne', '', 3, '', 48.77, 2.3, 0, 1),
(544, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rhone-Alpes', '', 3, '', 45.75, 4.85, 0, 1),
(555, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Nord-Pas-de-Calais', '', 3, '', 50.75, 2.15, 0, 1),
(556, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Lorraine', '', 3, '', 48.68, 6.2, 0, 1),
(561, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rio Grande do Sul', '', 1, '', -30.03, -51.2, 0, 1),
(563, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Provence-Alpes-Cote d''Azur', '', 3, '', 44.4, 4.93, 0, 1),
(586, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Minas Gerais', '', 1, '', -19.92, -43.93, 0, 1),
(598, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Limousin', '', 3, '', 45.85, 1.25, 0, 1),
(600, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Guizhou', '', 2, '', 26.58, 106.72, 0, 1),
(635, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Haute-Normandie', '', 3, '', 49.15, 1.33, 0, 1),
(649, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Poitou-Charentes', '', 3, '', 45.65, 0.15, 0, 1),
(667, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Wyoming', '', 5, '', 44.78, -107.55, 0, 1),
(676, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Daman and Diu', '', 4, '', 20.37, 72.9, 0, 1),
(701, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Para', '', 1, '', -1.27, -48.18, 0, 1),
(708, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Basse-Normandie', '', 3, '', 49.15, 0.23, 0, 1),
(728, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bihar', '', 4, '', 25.6, 85.12, 0, 1),
(729, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Aquitaine', '', 3, '', 45.12, 0.4, 0, 1),
(773, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Parana', '', 1, '', -25.42, -49.25, 0, 1),
(798, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Auvergne', '', 3, '', 46.28, 3.6, 0, 1),
(808, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pernambuco', '', 1, '', -8.05, -34.9, 0, 1),
(822, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Pays de la Loire', '', 3, '', 47.47, 0.2, 0, 1),
(838, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Amazonas', '', 1, '', -3.11, -60.03, 0, 1),
(842, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Distrito Federal', '', 1, '', -15.78, -47.92, 0, 1),
(924, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'North Dakota', '', 5, '', 46.96, -97.68, 0, 1),
(937, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Bourgogne', '', 3, '', 47.8, 3.57, 0, 1),
(959, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Vermont', '', 5, '', 44.49, -73.23, 0, 1),
(970, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Goias', '', 1, '', -15.93, -50.13, 0, 1),
(1008, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Himachal Pradesh', '', 4, '', 31.1, 77.17, 0, 1),
(1011, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sergipe', '', 1, '', -11.27, -37.43, 0, 1),
(1061, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alaska', '', 5, '', 61.52, -149.57, 0, 1),
(1102, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mato Grosso do Sul', '', 1, '', -22.22, -54.8, 0, 1),
(1178, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Yunnan', '', 2, '', 25.04, 102.72, 0, 1),
(1200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Uttarakhand', '', 4, '', 30.32, 78.03, 0, 1),
(1203, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Meghalaya', '', 4, '', 25.58, 91.87, 0, 1),
(1231, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jiangxi', '', 2, '', 28.55, 115.93, 0, 1),
(1269, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rio Grande do Norte', '', 1, '', -5.78, -35.22, 0, 1),
(1293, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Paraiba', '', 1, '', -7.22, -35.88, 0, 1),
(1297, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Piaui', '', 1, '', -5.08, -42.82, 0, 1),
(1310, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Gansu', '', 2, '', 36.06, 103.79, 0, 1),
(1312, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Jammu and Kashmir', '', 4, '', 33.8, 74.26, 0, 1),
(1334, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Goa', '', 4, '', 15.27, 73.92, 0, 1),
(1335, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Maranhao', '', 1, '', -2.52, -44.27, 0, 1),
(1457, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mato Grosso', '', 1, '', -15.58, -56.08, 0, 1),
(1483, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Corse', '', 3, '', 41.92, 8.73, 0, 1),
(1568, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Alagoas', '', 1, '', -9.67, -35.72, 0, 1),
(1596, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Puducherry', '', 4, '', 11.93, 79.83, 0, 1),
(1654, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Manipur', '', 4, '', 24.82, 93.95, 0, 1),
(1673, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tocantins', '', 1, '', -10.22, -48.28, 0, 1),
(1714, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Roraima', '', 1, '', 3.83, -60.22, 0, 1),
(1723, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Rondonia', '', 1, '', -10.67, -62.3, 0, 1),
(1736, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Xizang', '', 2, '', 29.65, 91.1, 0, 1),
(1741, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Ningxia', '', 2, '', 38.47, 106.27, 0, 1),
(1751, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Xinjiang', '', 2, '', 43.8, 87.58, 0, 1),
(1753, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Qinghai', '', 2, '', 36.5, 101.6, 0, 1),
(1791, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Mizoram', '', 4, '', 23.72, 92.72, 0, 1),
(1846, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Dadra and Nagar Haveli', '', 4, '', 20.27, 73.02, 0, 1),
(1874, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Arunachal Pradesh', '', 4, '', 27.57, 93.85, 0, 1),
(1918, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Tripura', '', 4, '', 23.84, 91.28, 0, 1),
(2113, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Amapa', '', 1, '', 0.03, -51.05, 0, 1),
(2116, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Acre', '', 1, '', -9.97, -67.8, 0, 1),
(2320, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Sikkim', '', 4, '', 27.33, 88.62, 0, 1),
(2375, '2015-02-24 05:18:15', '2015-02-24 05:18:15', 'Saarland', '', 6, '', 51.1657, 10.4515, 0, 1),
(2371, '2015-02-24 05:16:34', '2015-02-24 05:16:34', 'Berlin', '', 6, '', 51.1657, 10.4515, 0, 1),
(2372, '2015-02-24 05:16:45', '2015-02-24 05:16:45', 'Saxony', '', 6, '', 51.1657, 10.4515, 0, 1),
(2373, '2015-02-24 05:17:22', '2015-02-24 05:17:22', 'Hamburg', '', 6, '', 51.1657, 10.4515, 0, 1),
(2374, '2015-02-24 05:17:52', '2015-02-24 05:17:52', 'Bavaria', '', 6, '', 51.1657, 10.4515, 0, 1),
(2376, '2015-02-24 05:18:37', '2015-02-24 05:18:37', 'Brandenburg', '', 6, '', 51.1657, 10.4515, 0, 1),
(2377, '2015-02-24 05:19:08', '2015-02-24 05:19:08', 'North Rhine-Westphalia', '', 6, '', 51.1657, 10.4515, 0, 1),
(2378, '2015-02-24 05:22:50', '2015-02-24 05:22:50', 'Potsdam', '', 6, '', 51.1657, 10.4515, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `suitable_for`
--

CREATE TABLE IF NOT EXISTS `suitable_for` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hotel_mapped_count` bigint(20) NOT NULL,
  `offer_mapped_count` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `suitable_for`
--

INSERT INTO `suitable_for` (`id`, `created`, `modified`, `name`, `alias`, `hotel_mapped_count`, `offer_mapped_count`, `is_active`) VALUES
(1, '2015-01-09 03:24:46', '2015-01-09 03:26:39', 'mini bar', 'mini-bar', 6, 0, 1),
(2, '2015-01-09 03:27:03', '2015-01-09 03:27:03', 'highlife-apartments', 'highlife-apartments', 1, 0, 1),
(3, '2015-01-09 03:27:37', '2015-01-09 03:27:37', 'parking', 'parking', 0, 0, 1),
(4, '2015-01-09 03:28:24', '2015-01-09 03:28:24', 'internet', 'internet', 1, 0, 1),
(5, '2015-01-09 03:28:34', '2015-01-09 03:28:34', 'sports court', 'sports-court', 3, 0, 1),
(6, '2015-01-09 03:29:30', '2015-01-09 03:29:30', 'kitchen', 'kitchen', 2, 0, 1),
(7, '2015-01-09 03:29:51', '2015-01-09 03:29:51', 'breakfast', 'breakfast', 0, 0, 1),
(8, '2015-01-09 03:30:21', '2015-01-09 03:30:21', 'doorman', 'doorman', 2, 0, 1),
(9, '2015-01-09 03:30:41', '2015-01-09 03:30:41', 'Hot Tub', 'hot-tub', 0, 0, 1),
(10, '2015-01-09 03:31:21', '2015-01-09 03:31:21', 'first aid kit', 'first-aid-kit', 4, 0, 1),
(11, '2015-01-09 03:31:38', '2015-01-09 03:31:38', 'safety card', 'safety-card', 4, 0, 1),
(12, '2015-01-09 03:31:55', '2015-01-09 03:31:55', 'fire extinguisher', 'fire-extinguisher', 2, 0, 1),
(13, '2015-01-09 03:33:11', '2015-01-09 03:33:11', 'room service', 'room-service', 2, 0, 1),
(14, '2015-01-09 03:33:59', '2015-01-09 03:33:59', 'meeting room', 'meeting-room', 2, 0, 1),
(15, '2015-01-09 03:34:07', '2015-01-09 03:34:07', 'conference hall', 'conference-hall', 2, 0, 1),
(16, '2015-01-09 03:34:32', '2015-01-09 03:34:32', 'play station', 'play-station', 3, 0, 1),
(17, '2015-01-09 03:35:44', '2015-01-09 03:35:44', 'party hall', 'party-hall', 2, 0, 1),
(18, '2015-02-23 11:37:12', '2015-02-23 11:37:12', 'test club', 'test-club', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `suitable_request`
--

CREATE TABLE IF NOT EXISTS `suitable_request` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `hotel_id` bigint(20) NOT NULL,
  `suitable_id` bigint(20) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `request_type` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_dir` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_info` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT '1-Active,0-Inactive'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
`id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_info` text NOT NULL,
  `payment_status` int(11) NOT NULL,
  `transaction_status` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `ip` text NOT NULL,
  `browser_info` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` tinyint(1) NOT NULL COMMENT '1-Admin,2-Hotel User,3-Site User',
  `profile_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_dir` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_info` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_user_id` bigint(20) NOT NULL,
  `facebook_access_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `google_auth_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preferred_country_id` bigint(20) NOT NULL,
  `preferred_state_id` bigint(20) NOT NULL,
  `preferred_city_id` bigint(20) NOT NULL,
  `preferred_area_id` bigint(20) NOT NULL,
  `last_login_time` datetime NOT NULL,
  `current_login_time` datetime NOT NULL,
  `register_type` tinyint(1) NOT NULL COMMENT '1-Site,2-Facebook.3-Google+,4-By Admin',
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'unique id for reset password(forgot password)',
  `uid_request_date` datetime NOT NULL COMMENT 'used validate when user send a forgot password request',
  `is_active` tinyint(1) NOT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `email_verified_date` datetime NOT NULL,
  `is_approved` tinyint(4) NOT NULL COMMENT 'Only for hotel user,1-Approved,0-Not Approved'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created`, `modified`, `email`, `display_name`, `password`, `user_type`, `profile_image`, `image_dir`, `image_info`, `facebook_user_id`, `facebook_access_token`, `google_auth_id`, `preferred_country_id`, `preferred_state_id`, `preferred_city_id`, `preferred_area_id`, `last_login_time`, `current_login_time`, `register_type`, `uid`, `uid_request_date`, `is_active`, `is_email_confirmed`, `email_verified_date`, `is_approved`) VALUES
(1, '2014-09-10 00:00:00', '2015-02-24 05:22:29', 'admin@hobitel.com', 'admin', '14a39bf9e815c4a01a9022d527420fcb', 1, '', '', '', 0, '', '', 0, 0, 0, 0, '2015-05-20 10:38:38', '2015-05-20 01:04:29', 0, '31348', '2015-01-09 06:41:17', 1, 1, '2014-12-15 04:37:33', 0),
(2, '2015-02-24 05:43:29', '2015-02-24 05:43:29', 'hotelzooberlin@gmail.com', 'sdsdfsdf', '14a39bf9e815c4a01a9022d527420fcb', 2, 'Aussen11.jpg', 'app_data/profile/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:12:"Aussen11.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:55:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/profile/";s:9:"full_path";s:67:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/profile', 0, '', '', 4, 128, 201, 5, '2015-05-19 02:03:52', '2015-05-20 08:41:09', 4, '4845', '2015-04-06 12:07:26', 1, 1, '2015-04-06 11:55:41', 1),
(3, '2015-02-24 05:45:47', '2015-02-24 05:45:47', 'berger@gmail.com', 'Steigenberge', '14a39bf9e815c4a01a9022d527420fcb', 2, 'hotl_logo1.png', 'app_data/profile/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:14:"hotl_logo1.png";s:9:"file_type";s:9:"image/png";s:9:"file_path";s:47:"/home/development/php/hobitel/app_data/profile/";s:9:"full_path";s:61:"/home/development/php/hobitel/app_data/profile/hotl_logo1.png"', 0, '', '', 6, 2371, 79680, 0, '2015-02-24 09:07:02', '2015-02-24 09:07:02', 4, '9QgmWYW7qs', '0000-00-00 00:00:00', 1, 1, '0000-00-00 00:00:00', 1),
(4, '2015-02-24 05:49:16', '2015-02-24 05:49:16', 'westingrand@gmail.com', 'Westin Grand', '14a39bf9e815c4a01a9022d527420fcb', 2, '10.17_.12-Westin-Grand-Central-1_.jpg', 'app_data/profile/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:37:"10.17_.12-Westin-Grand-Central-1_.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:47:"/home/development/php/hobitel/app_data/profile/";s:9:"full_path";s:84:"/home/development/php/hobitel/app_dat', 0, '', '', 6, 2373, 79679, 0, '2015-02-24 06:37:20', '2015-03-12 07:39:50', 4, 'ma7UQwYmf7', '0000-00-00 00:00:00', 1, 1, '0000-00-00 00:00:00', 1),
(5, '2015-02-24 05:51:17', '2015-02-24 05:51:17', 'grandhoteldream@gmail.com', 'Grand Dream', '14a39bf9e815c4a01a9022d527420fcb', 2, 'maxresdefault.jpg', 'app_data/profile/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:17:"maxresdefault.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:55:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/profile/";s:9:"full_path";s:72:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/pr', 0, '', '', 6, 2373, 79679, 0, '2015-04-30 06:37:07', '2015-05-12 01:45:16', 4, '2wevexC0r8', '0000-00-00 00:00:00', 1, 1, '0000-00-00 00:00:00', 1),
(6, '2015-02-24 06:42:46', '2015-02-24 06:42:46', 'john@gmail.com', 'john90', '14a39bf9e815c4a01a9022d527420fcb', 3, 'bg-ing-new.jpg', 'app_data/profile/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:14:"bg-ing-new.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:55:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/profile/";s:9:"full_path";s:69:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/profi', 0, '', '', 4, 128, 201, 5, '2015-05-19 03:53:58', '2015-05-20 07:52:52', 4, '11354', '2015-04-06 01:00:45', 1, 1, '2015-04-06 11:54:47', 1),
(7, '2015-02-24 09:02:42', '2015-02-24 09:02:42', 'itcgrand@gmail.com', 'itcgrand', '14a39bf9e815c4a01a9022d527420fcb', 2, '170661-itc-grand-central.JPG', 'app_data/profile/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:28:"170661-itc-grand-central.JPG";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:47:"/home/development/php/hobitel/app_data/profile/";s:9:"full_path";s:75:"/home/development/php/hobitel/app_data/profile', 0, '', '', 4, 187, 349, 0, '2015-02-24 09:03:30', '2015-04-30 06:35:38', 4, 'w5pYFs0eXW', '0000-00-00 00:00:00', 1, 1, '0000-00-00 00:00:00', 1),
(8, '2015-02-24 09:48:15', '2015-02-24 09:48:15', 'aleenta@gmail.com', 'Continental', '14a39bf9e815c4a01a9022d527420fcb', 2, 'ambassador_herosquarenew.jpg', 'app_data/profile/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:28:"ambassador_herosquarenew.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:47:"/home/development/php/hobitel/app_data/profile/";s:9:"full_path";s:75:"/home/development/php/hobitel/app_data/profile', 0, '', '', 6, 2371, 79680, 0, '2015-02-24 10:10:02', '2015-03-11 05:40:57', 1, 'L9EmVRWVqS', '0000-00-00 00:00:00', 1, 1, '0000-00-00 00:00:00', 1),
(9, '2015-02-24 10:18:21', '2015-02-24 10:18:21', 'novetelberlin@yahoo.com', 'novetelberlin', '14a39bf9e815c4a01a9022d527420fcb', 2, 'logo.jpg', 'app_data/profile/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:8:"logo.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:47:"/home/development/php/hobitel/app_data/profile/";s:9:"full_path";s:55:"/home/development/php/hobitel/app_data/profile/logo.jpg";s:8:"raw_n', 0, '', '', 6, 2371, 79680, 0, '2015-03-12 07:07:32', '2015-03-13 05:44:38', 4, 'WaUwULeFkM', '0000-00-00 00:00:00', 1, 1, '0000-00-00 00:00:00', 1),
(10, '2015-02-24 10:28:21', '2015-02-24 10:28:21', 'jackfedrick9@gmail.com', 'jack', '', 3, '1532663850341060.jpeg', 'app_data/profile/', '', 1532663850341060, '', '', 0, 0, 0, 0, '2015-02-24 10:52:30', '2015-02-24 10:59:57', 2, '', '0000-00-00 00:00:00', 1, 1, '0000-00-00 00:00:00', 1),
(11, '2015-02-24 10:31:04', '2015-02-24 10:31:04', 'sophie.emma84@gmail.com', 'sophieemma', '', 3, '8.jpg', 'app_data/profile/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:5:"8.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:47:"/home/development/php/hobitel/app_data/profile/";s:9:"full_path";s:52:"/home/development/php/hobitel/app_data/profile/8.jpg";s:8:"raw_name";s', 1571147203171713, '', '', 4, 128, 201, 1, '2015-02-24 10:44:48', '2015-02-24 11:25:18', 2, '', '0000-00-00 00:00:00', 1, 1, '0000-00-00 00:00:00', 1),
(12, '2015-02-24 10:34:56', '2015-02-24 10:34:56', 'willpitts53@gmail.com', 'William', '14a39bf9e815c4a01a9022d527420fcb', 3, '', '', '', 0, '', '', 0, 0, 0, 0, '2015-03-21 10:47:10', '2015-03-23 09:29:12', 1, '', '0000-00-00 00:00:00', 1, 1, '2015-02-24 10:36:05', 1),
(13, '2015-02-24 11:12:25', '2015-02-24 11:12:25', 'vijiraj56@gmail.com', 'viji', '', 3, '100886504358708110694.jpeg', 'app_data/profile/', '', 0, '', '100886504358708110694', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 3, '', '0000-00-00 00:00:00', 1, 1, '0000-00-00 00:00:00', 1),
(14, '2015-02-24 11:19:52', '2015-02-24 11:19:52', 'sameventus@gmail.com', 'Sam Eventus', '14a39bf9e815c4a01a9022d527420fcb', 3, 'icon-google-play.png', 'app_data/profile/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:20:"icon-google-play.png";s:9:"file_type";s:9:"image/png";s:9:"file_path";s:47:"/home/development/php/hobitel/app_data/profile/";s:9:"full_path";s:67:"/home/development/php/hobitel/app_data/profile/icon-goog', 0, '', '', 6, 2371, 79680, 0, '2015-03-21 10:51:04', '2015-03-23 09:30:05', 1, '', '0000-00-00 00:00:00', 1, 1, '2015-02-24 11:20:18', 1),
(15, '2015-03-10 10:07:54', '2015-03-10 10:07:54', 'k7@gmail.com', 'kesavan', '14a39bf9e815c4a01a9022d527420fcb', 4, '', '', '', 0, '', '', 0, 0, 0, 0, '2015-03-10 10:08:18', '2015-03-10 11:01:52', 4, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1),
(17, '2015-04-03 03:09:11', '2015-04-03 03:09:11', 'sdfjsdjfh@gmail.com', '0', '14a39bf9e815c4a01a9022d527420fcb', 3, '', '', '', 0, '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'KckHsQztJD', '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', 1),
(18, '2015-04-06 12:20:41', '2015-04-06 12:20:41', 'dsfdsdf@gmail.com', '0', '14a39bf9e815c4a01a9022d527420fcb', 3, '', '', '', 0, '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'LZ4A5qKnnP', '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', 1),
(30, '2015-05-07 06:51:11', '2015-05-07 06:51:11', 'sdfsdf@gmail.com', 'sdfsdfdg', '14a39bf9e815c4a01a9022d527420fcb', 3, '', '', '', 0, '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'up5odiNEkW', '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', 1),
(29, '2015-04-21 01:09:38', '2015-04-21 01:09:38', 'newhotel@gmail.com', 'newhotel', '14a39bf9e815c4a01a9022d527420fcb', 2, 'eser-premium-hotel-spa3.jpg', 'app_data/profile/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:27:"eser-premium-hotel-spa3.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:55:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/profile/";s:9:"full_path";s:82:"E:/xampp/htdocs/hobitel/trunk/hobitel/a', 0, '', '', 4, 128, 201, 5, '2015-04-21 01:11:34', '2015-04-21 01:11:34', 1, 'wwJwOjDHB6', '0000-00-00 00:00:00', 1, 1, '0000-00-00 00:00:00', 1),
(21, '2015-04-06 01:06:14', '2015-04-06 01:06:14', 'test@gmail.com', '0', '14a39bf9e815c4a01a9022d527420fcb', 3, '', '', '', 0, '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'FDBXVKNOEx', '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', 1),
(28, '2015-04-21 06:04:38', '2015-04-21 06:04:38', 'dwayne.bravo@gmail.com', 'dwaynebr', '14a39bf9e815c4a01a9022d527420fcb', 3, 'Funny-Babies-Boy-Pictures-67.jpg', 'app_data/profile/', 'a:1:{s:11:"upload_data";a:14:{s:9:"file_name";s:32:"Funny-Babies-Boy-Pictures-67.jpg";s:9:"file_type";s:10:"image/jpeg";s:9:"file_path";s:55:"E:/xampp/htdocs/hobitel/trunk/hobitel/app_data/profile/";s:9:"full_path";s:87:"E:/xampp/htdocs/hobitel/trunk/hobi', 0, '', '', 4, 128, 201, 0, '2015-04-21 06:06:10', '2015-04-21 06:06:10', 1, '', '0000-00-00 00:00:00', 1, 1, '0000-00-00 00:00:00', 1),
(25, '2015-04-07 07:19:37', '2015-04-07 07:19:37', 'sophieemma@gmail.com', 'sophieem', '14a39bf9e815c4a01a9022d527420fcb', 3, '', '', '', 0, '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'RWaGDBuLHv', '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', 1),
(26, '2015-04-07 07:20:53', '2015-04-07 07:20:53', 'sophieemmas@gmail.com', 'sophieem258', '14a39bf9e815c4a01a9022d527420fcb', 3, '', '', '', 0, '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'syU63Hh0yR', '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', 1),
(27, '2015-04-07 07:42:25', '2015-04-07 07:42:25', 'sophieem@gamil.com', 'sophieem536', '14a39bf9e815c4a01a9022d527420fcb', 2, '', '', '', 0, '', '', 4, 1846, 25359, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'wXJNO9InHB', '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', 0),
(31, '2015-05-07 06:54:50', '2015-05-07 06:54:50', 'sadasda@gmail.com', 'dadsasda', '14a39bf9e815c4a01a9022d527420fcb', 3, '', '', '', 0, '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, '6nhTmLJGmN', '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_info`
--

CREATE TABLE IF NOT EXISTS `user_contact_info` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  `area_id` bigint(20) NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pincode` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE IF NOT EXISTS `user_logins` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `browser_info` text COLLATE utf8_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL COMMENT '1-Deleted by admin,0-Active'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=318 ;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `created`, `user_id`, `ip`, `browser_info`, `is_deleted`) VALUES
(1, '2015-02-24 05:20:03', 1, '180.151.61.235', 'Mozilla/5.0 (Windows NT 6.1; rv:35.0) Gecko/20100101 Firefox/35.0', 0),
(2, '2015-02-24 05:53:57', 5, '180.151.61.235', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(3, '2015-02-24 06:37:20', 4, '180.151.61.235', 'Mozilla/5.0 (Windows NT 6.1; rv:35.0) Gecko/20100101 Firefox/35.0', 0),
(4, '2015-02-24 06:43:51', 5, '180.151.61.235', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(5, '2015-02-24 06:45:36', 6, '180.151.61.235', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(6, '2015-02-24 06:51:26', 5, '180.151.61.235', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(7, '2015-02-24 06:58:54', 1, '180.151.61.235', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(8, '2015-02-24 06:59:37', 2, '180.151.61.235', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(9, '2015-02-24 08:40:33', 1, '180.151.61.235', 'Mozilla/5.0 (Windows NT 6.1; rv:28.0) Gecko/20100101 Firefox/28.0', 0),
(10, '2015-02-24 08:43:52', 1, '95.91.232.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/600.3.18 (KHTML, like Gecko) Version/8.0.3 Safari/600.3.18', 0),
(11, '2015-02-24 09:03:30', 7, '180.151.61.235', 'Mozilla/5.0 (Windows NT 6.1; rv:35.0) Gecko/20100101 Firefox/35.0', 0),
(12, '2015-02-24 09:04:47', 1, '180.151.61.235', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(13, '2015-02-24 09:06:01', 1, '180.151.61.235', 'Mozilla/5.0 (Windows NT 6.1; rv:35.0) Gecko/20100101 Firefox/35.0', 0),
(14, '2015-02-24 09:07:02', 3, '180.151.61.235', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(15, '2015-02-24 09:48:35', 1, '180.151.61.235', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(16, '2015-02-24 10:10:02', 8, '180.151.61.235', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(17, '2015-02-24 10:10:06', 1, '180.151.61.235', 'Mozilla/5.0 (Windows NT 6.1; rv:35.0) Gecko/20100101 Firefox/35.0', 0),
(18, '2015-02-24 10:19:15', 9, '180.151.61.235', 'Mozilla/5.0 (Windows NT 6.1; rv:35.0) Gecko/20100101 Firefox/35.0', 0),
(19, '2015-02-24 10:21:47', 1, '220.227.113.169', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(20, '2015-02-24 10:28:21', 10, '220.227.113.169', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(21, '2015-02-24 10:30:00', 10, '220.227.113.169', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(22, '2015-02-24 10:31:04', 11, '220.227.113.169', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(23, '2015-02-24 10:36:33', 12, '220.227.113.169', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(24, '2015-02-24 10:38:35', 11, '220.227.113.169', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(25, '2015-02-24 10:44:48', 11, '220.227.113.169', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(26, '2015-02-24 10:47:18', 2, '180.151.61.235', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(27, '2015-02-24 10:49:29', 10, '220.227.113.169', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/7.0)', 0),
(28, '2015-02-24 10:51:09', 10, '220.227.113.169', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/7.0)', 0),
(29, '2015-02-24 10:52:30', 10, '220.227.113.169', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/7.0)', 0),
(30, '2015-02-24 10:59:57', 10, '220.227.113.169', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/7.0)', 0),
(31, '2015-02-24 11:03:19', 1, '180.151.61.235', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(32, '2015-02-24 11:07:34', 6, '180.151.61.235', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 0),
(33, '2015-02-24 11:18:27', 1, '95.91.232.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/600.3.18 (KHTML, like Gecko) Version/8.0.3 Safari/600.3.18', 0),
(34, '2015-02-24 11:20:30', 14, '95.91.232.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/600.3.18 (KHTML, like Gecko) Version/8.0.3 Safari/600.3.18', 0),
(35, '2015-02-24 11:25:18', 11, '220.227.113.169', 'Mozilla/5.0 (Windows NT 5.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(36, '2015-03-03 07:21:35', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(37, '2015-03-04 06:37:39', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(38, '2015-03-10 09:48:48', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(39, '2015-03-10 10:04:33', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(40, '2015-03-10 10:07:02', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(41, '2015-03-10 10:08:18', 15, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(42, '2015-03-10 10:12:07', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(43, '2015-03-10 11:00:39', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(44, '2015-03-10 11:01:52', 15, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(45, '2015-03-10 01:10:51', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(46, '2015-03-11 05:40:57', 8, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(47, '2015-03-11 07:58:48', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(48, '2015-03-11 10:35:09', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(49, '2015-03-11 02:04:18', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(50, '2015-03-12 05:29:28', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(51, '2015-03-12 07:07:32', 9, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(52, '2015-03-12 07:39:50', 4, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(53, '2015-03-12 07:40:22', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(54, '2015-03-12 09:47:32', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(55, '2015-03-12 10:11:39', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(56, '2015-03-13 05:44:38', 9, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(57, '2015-03-13 05:47:37', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(58, '2015-03-13 06:40:46', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(59, '2015-03-13 06:45:05', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(60, '2015-03-13 06:55:05', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(61, '2015-03-13 06:59:20', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(62, '2015-03-13 07:02:56', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(63, '2015-03-13 08:07:31', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(64, '2015-03-13 10:51:16', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(65, '2015-03-14 10:38:25', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(66, '2015-03-14 12:28:00', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(67, '2015-03-16 05:53:44', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(68, '2015-03-16 06:04:12', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(69, '2015-03-16 06:09:08', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(70, '2015-03-16 06:26:16', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(71, '2015-03-16 07:06:51', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(72, '2015-03-16 08:07:06', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(73, '2015-03-20 04:40:28', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(74, '2015-03-20 06:00:46', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(75, '2015-03-20 06:07:06', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(76, '2015-03-20 09:55:23', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 0),
(77, '2015-03-20 10:23:33', 14, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(78, '2015-03-20 10:27:52', 12, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 0),
(79, '2015-03-20 10:33:13', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 0),
(80, '2015-03-20 10:34:25', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(81, '2015-03-20 12:53:45', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 0),
(82, '2015-03-20 01:02:39', 14, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(83, '2015-03-20 02:49:18', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 0),
(84, '2015-03-21 06:01:36', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(85, '2015-03-21 06:07:11', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 0),
(86, '2015-03-21 06:15:13', 12, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 0),
(87, '2015-03-21 06:34:28', 14, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 0),
(88, '2015-03-21 10:44:44', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 0),
(89, '2015-03-21 10:44:58', 12, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 0),
(90, '2015-03-21 10:45:29', 12, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 0),
(91, '2015-03-21 10:47:10', 12, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(92, '2015-03-21 10:51:04', 14, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 0),
(93, '2015-03-21 10:52:38', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(94, '2015-03-23 06:04:30', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(95, '2015-03-23 09:29:12', 12, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(96, '2015-03-23 09:29:34', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', 0),
(97, '2015-03-23 09:30:05', 14, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', 0),
(98, '2015-03-23 09:49:50', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(99, '2015-03-24 06:26:01', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(100, '2015-03-24 09:51:28', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(101, '2015-03-27 10:38:05', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(102, '2015-03-27 10:38:54', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(103, '2015-03-27 10:58:16', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(104, '2015-03-27 12:41:56', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(105, '2015-03-28 06:33:23', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(106, '2015-03-28 06:37:31', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(107, '2015-03-28 06:37:54', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(108, '2015-03-28 08:05:22', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(109, '2015-03-28 10:20:37', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(110, '2015-03-30 06:48:58', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(111, '2015-03-30 10:40:54', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(112, '2015-03-30 01:46:13', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(113, '2015-03-30 01:48:41', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(114, '2015-03-30 01:49:58', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(115, '2015-03-30 01:50:45', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(116, '2015-03-30 02:07:45', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(117, '2015-03-31 06:32:46', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(118, '2015-03-31 08:46:38', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(119, '2015-03-31 08:52:09', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(120, '2015-03-31 08:54:40', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(121, '2015-03-31 11:14:39', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(122, '2015-03-31 11:21:03', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(123, '2015-03-31 11:53:45', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(124, '2015-03-31 11:57:10', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(125, '2015-03-31 12:09:58', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(126, '2015-03-31 01:57:23', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(127, '2015-03-31 01:59:40', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(128, '2015-03-31 02:00:07', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(129, '2015-03-31 02:05:03', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(130, '2015-03-31 02:18:45', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(131, '2015-04-01 06:53:51', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(132, '2015-04-01 07:47:14', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(133, '2015-04-01 11:18:06', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(134, '2015-04-01 02:30:47', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(135, '2015-04-01 02:52:50', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(136, '2015-04-01 03:12:19', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(137, '2015-04-01 03:13:24', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(138, '2015-04-01 03:22:39', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(139, '2015-04-01 03:27:14', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(140, '2015-04-01 03:38:10', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(141, '2015-04-01 03:41:34', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(142, '2015-04-01 03:48:18', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(143, '2015-04-01 03:48:39', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(144, '2015-04-01 03:49:49', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(145, '2015-04-01 03:53:32', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(146, '2015-04-01 03:53:52', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(147, '2015-04-01 03:56:23', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(148, '2015-04-01 03:56:44', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(149, '2015-04-01 03:57:39', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(150, '2015-04-02 06:34:24', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(151, '2015-04-02 11:15:20', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(152, '2015-04-02 02:00:10', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(153, '2015-04-02 03:13:18', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', 0),
(154, '2015-04-03 06:44:42', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(155, '2015-04-03 06:54:18', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(156, '2015-04-03 09:07:49', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(157, '2015-04-03 10:41:06', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(158, '2015-04-03 02:02:42', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(159, '2015-04-06 07:47:38', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(160, '2015-04-06 10:33:43', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(161, '2015-04-06 11:10:26', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(162, '2015-04-06 02:19:15', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(163, '2015-04-06 02:19:32', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(164, '2015-04-06 02:41:07', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(165, '2015-04-06 02:57:52', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(166, '2015-04-06 03:06:55', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(167, '2015-04-07 06:53:01', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(168, '2015-04-07 07:33:50', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(169, '2015-04-07 08:16:08', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(170, '2015-04-07 10:39:14', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(171, '2015-04-07 12:14:07', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(172, '2015-04-07 12:17:49', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(173, '2015-04-07 01:27:04', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(174, '2015-04-08 06:32:47', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(175, '2015-04-08 09:06:50', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:36.0) Gecko/20100101 Firefox/36.0', 0),
(176, '2015-04-09 08:15:07', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(177, '2015-04-09 11:47:15', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(178, '2015-04-09 12:13:19', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(179, '2015-04-09 12:48:58', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(180, '2015-04-09 12:55:10', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(181, '2015-04-09 01:50:44', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(182, '2015-04-10 06:25:35', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(183, '2015-04-10 07:51:52', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(184, '2015-04-10 07:55:53', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(185, '2015-04-10 07:57:29', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(186, '2015-04-10 07:58:02', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(187, '2015-04-10 08:03:18', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(188, '2015-04-10 08:39:19', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(189, '2015-04-10 10:30:58', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(190, '2015-04-10 11:26:50', 1, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(191, '2015-04-15 07:03:44', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(192, '2015-04-15 07:14:42', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(193, '2015-04-15 08:46:30', 6, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(194, '2015-04-15 08:48:35', 2, '192.168.1.112', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(195, '2015-04-15 11:17:30', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(196, '2015-04-15 12:15:17', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(197, '2015-04-15 12:22:29', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(198, '2015-04-15 12:34:40', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(199, '2015-04-15 01:00:50', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(200, '2015-04-15 01:44:34', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(201, '2015-04-15 02:08:29', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36', 0),
(202, '2015-04-15 02:10:46', 5, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(203, '2015-04-15 03:42:58', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(204, '2015-04-15 04:17:05', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(205, '2015-04-16 06:29:33', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(206, '2015-04-16 07:04:03', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(207, '2015-04-16 07:07:11', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(208, '2015-04-16 07:08:00', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(209, '2015-04-16 07:09:02', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(210, '2015-04-16 07:53:04', 1, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(211, '2015-04-16 08:26:06', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(212, '2015-04-16 08:32:55', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(213, '2015-04-16 08:33:49', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(214, '2015-04-16 12:26:34', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(215, '2015-04-16 12:34:12', 1, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(216, '2015-04-16 02:25:10', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(217, '2015-04-17 06:44:31', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(218, '2015-04-17 07:40:16', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(219, '2015-04-17 07:45:37', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(220, '2015-04-17 08:14:59', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(221, '2015-04-17 11:48:57', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(222, '2015-04-17 11:49:17', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(223, '2015-04-18 06:53:07', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(224, '2015-04-18 06:53:55', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(225, '2015-04-18 07:21:10', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(226, '2015-04-18 08:30:45', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(227, '2015-04-18 08:35:23', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', 0),
(228, '2015-04-18 08:38:46', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 0),
(229, '2015-04-18 08:39:41', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', 0),
(230, '2015-04-18 08:42:09', 1, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(231, '2015-04-18 12:23:08', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(232, '2015-04-18 03:05:50', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(233, '2015-04-21 06:00:20', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(234, '2015-04-21 06:06:10', 28, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(235, '2015-04-21 07:09:03', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(236, '2015-04-21 09:06:45', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(237, '2015-04-21 01:11:34', 29, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(238, '2015-04-22 06:34:51', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(239, '2015-04-22 10:59:58', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(240, '2015-04-22 11:00:13', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(241, '2015-04-22 11:07:19', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(242, '2015-04-23 06:39:05', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(243, '2015-04-23 03:32:14', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(244, '2015-04-24 06:46:16', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(245, '2015-04-24 07:03:56', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(246, '2015-04-24 07:49:55', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(247, '2015-04-24 10:56:30', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(248, '2015-04-24 11:28:00', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(249, '2015-04-27 12:20:50', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(250, '2015-04-27 01:55:27', 1, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(251, '2015-04-27 02:55:59', 1, '192.168.1.63', 'Mozilla/5.0 (Android; Mobile; rv:29.0) Gecko/29.0 Firefox/29.0', 0),
(252, '2015-04-28 05:58:17', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(253, '2015-04-28 02:02:15', 1, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(254, '2015-04-29 06:30:27', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(255, '2015-04-29 06:46:11', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(256, '2015-04-29 06:53:38', 1, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(257, '2015-04-29 11:34:47', 1, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(258, '2015-04-30 06:28:39', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(259, '2015-04-30 06:35:38', 7, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(260, '2015-04-30 06:37:07', 5, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(261, '2015-04-30 06:46:24', 1, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(262, '2015-04-30 12:28:16', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(263, '2015-04-30 01:06:04', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(264, '2015-04-30 01:30:02', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(265, '2015-05-04 06:49:14', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(266, '2015-05-04 10:28:14', 1, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(267, '2015-05-04 11:33:52', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(268, '2015-05-05 06:33:44', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(269, '2015-05-05 10:34:39', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(270, '2015-05-06 12:49:01', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(271, '2015-05-06 02:28:48', 1, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(272, '2015-05-06 04:15:29', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(273, '2015-05-07 07:32:22', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(274, '2015-05-07 12:18:23', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(275, '2015-05-07 12:31:42', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(276, '2015-05-07 12:40:15', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(277, '2015-05-07 12:43:57', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(278, '2015-05-07 12:48:48', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(279, '2015-05-07 04:16:42', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 0),
(280, '2015-05-07 04:26:50', 6, '192.168.1.55', 'Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0', 0),
(281, '2015-05-08 06:15:37', 1, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(282, '2015-05-08 06:36:57', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(283, '2015-05-08 06:55:50', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(284, '2015-05-08 07:01:44', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 0),
(285, '2015-05-08 07:58:42', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(286, '2015-05-08 10:41:56', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(287, '2015-05-08 10:42:51', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 0),
(288, '2015-05-08 12:10:29', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(289, '2015-05-08 01:32:56', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(290, '2015-05-11 07:48:24', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(291, '2015-05-11 01:04:39', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(292, '2015-05-11 01:27:13', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(293, '2015-05-12 06:41:28', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(294, '2015-05-12 10:48:34', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(295, '2015-05-12 11:59:17', 1, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(296, '2015-05-12 01:45:16', 5, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(297, '2015-05-12 02:31:33', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(298, '2015-05-12 03:42:47', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(299, '2015-05-13 07:37:35', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(300, '2015-05-13 08:55:04', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(301, '2015-05-13 11:51:27', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(302, '2015-05-13 01:37:18', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(303, '2015-05-13 03:34:34', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(304, '2015-05-14 07:12:00', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(305, '2015-05-14 02:20:07', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:37.0) Gecko/20100101 Firefox/37.0', 0),
(306, '2015-05-18 06:45:38', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0', 0),
(307, '2015-05-18 07:22:18', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0', 0),
(308, '2015-05-18 07:25:57', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0', 0),
(309, '2015-05-18 01:51:07', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0', 0),
(310, '2015-05-19 08:14:50', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0', 0),
(311, '2015-05-19 02:03:52', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0', 0),
(312, '2015-05-19 03:20:38', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0', 0),
(313, '2015-05-19 03:53:58', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0', 0),
(314, '2015-05-20 07:52:52', 6, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0', 0),
(315, '2015-05-20 08:41:09', 2, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0', 0),
(316, '2015-05-20 10:38:38', 1, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0', 0),
(317, '2015-05-20 01:04:29', 1, '192.168.1.63', 'Mozilla/5.0 (Windows NT 6.1; rv:38.0) Gecko/20100101 Firefox/38.0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_prefered_locations`
--

CREATE TABLE IF NOT EXISTS `user_prefered_locations` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `prepared_country_id` bigint(20) NOT NULL,
  `prepared_state_id` bigint(20) NOT NULL,
  `prepared_city_id` bigint(20) NOT NULL,
  `prepared_area_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE IF NOT EXISTS `user_profiles` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `first_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `dob` date NOT NULL,
  `mobile_number` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `telephone_number` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` text NOT NULL,
  `hotel_viewd_count` bigint(20) NOT NULL,
  `offer_viewd_count` bigint(20) NOT NULL,
  `hotel_follow_count` bigint(20) NOT NULL,
  `offer_wishlist_count` bigint(20) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `created`, `modified`, `user_id`, `first_name`, `last_name`, `display_name`, `gender_id`, `dob`, `mobile_number`, `telephone_number`, `address`, `hotel_viewd_count`, `offer_viewd_count`, `hotel_follow_count`, `offer_wishlist_count`) VALUES
(1, '2015-01-12 12:31:43', '2015-02-24 05:22:29', 1, 'Admin', 'Hobitel', '0', 0, '0000-00-00', '', '', '', 0, 0, 0, 0),
(2, '2015-02-24 06:42:46', '2015-05-13 03:47:14', 6, 'john', 'william', 'admin2', 1, '0000-00-00', '9791447542', '04412374569', 'gdfg', 0, 0, 0, 0),
(3, '2015-02-24 10:28:21', '2015-02-24 10:28:21', 10, 'jack fedrick', '', '', 1, '0000-00-00', '', '', '', 0, 0, 0, 0),
(4, '2015-02-24 10:31:04', '2015-02-24 10:59:44', 11, 'sophie emma', '', '', 2, '0000-00-00', '8976452315', '89756432145', 'no.1, john kenndy street', 0, 0, 0, 0),
(5, '2015-02-24 10:34:56', '2015-02-24 10:34:56', 12, 'will', '', '', 0, '0000-00-00', '', '', '', 0, 0, 0, 0),
(6, '2015-02-24 11:12:25', '2015-02-24 11:12:25', 13, 'viji raj', '', '', 2, '0000-00-00', '', '', '', 0, 0, 0, 0),
(7, '2015-02-24 11:19:52', '2015-02-24 11:22:20', 14, 'Sam Eventus', '', '', 1, '0000-00-00', '+490301234', '+4910000000', 'Brandenburger Tor 2', 0, 0, 0, 0),
(8, '2015-03-10 10:07:54', '2015-03-10 10:07:54', 15, 'Kesavan', '', '', 1, '0000-00-00', '645455878', '9898788585', '', 0, 0, 0, 0),
(19, '2015-05-07 06:54:50', '2015-05-07 06:54:50', 31, 'dadsasd', '', '', 0, '0000-00-00', '', '', '', 0, 0, 0, 0),
(18, '2015-05-07 06:51:11', '2015-05-07 06:51:11', 30, 'sdfsdfd@gmail.com', '', '', 0, '0000-00-00', '', '', '', 0, 0, 0, 0),
(17, '2015-04-21 06:04:38', '2015-04-21 06:25:37', 28, 'dwayne', '', '', 1, '0000-00-00', '98989898', '', 'Test address', 0, 0, 0, 0),
(15, '2015-04-07 07:19:37', '2015-04-07 07:19:37', 25, 'sophie', '', '', 0, '0000-00-00', '', '', '', 0, 0, 0, 0),
(16, '2015-04-07 07:20:53', '2015-04-07 07:20:53', 26, 'sophie', '', '', 0, '0000-00-00', '', '', '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE IF NOT EXISTS `wishlists` (
`id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `offer_id` bigint(20) NOT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `browser_info` text COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `created`, `modified`, `user_id`, `offer_id`, `ip`, `browser_info`, `is_active`) VALUES
(10, '2015-03-30 02:00:00', '2015-03-30 04:00:00', 6, 1, '', '', 1),
(27, '2015-05-05 10:34:39', '0000-00-00 00:00:00', 6, 3, '', '', 1),
(21, '2015-04-30 01:26:30', '0000-00-00 00:00:00', 6, 8, '', '', 1),
(19, '2015-04-30 01:22:28', '0000-00-00 00:00:00', 6, 21, '', '', 1),
(24, '2015-04-30 01:36:20', '0000-00-00 00:00:00', 6, 4, '', '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_cities`
--
ALTER TABLE `activity_cities`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenity_request`
--
ALTER TABLE `amenity_request`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendar_events`
--
ALTER TABLE `calendar_events`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city_images`
--
ALTER TABLE `city_images`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_cookies`
--
ALTER TABLE `ci_cookies`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
 ADD PRIMARY KEY (`session_id`), ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `class_types`
--
ALTER TABLE `class_types`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_datas`
--
ALTER TABLE `cron_datas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cron_mail_notification`
--
ALTER TABLE `cron_mail_notification`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
 ADD PRIMARY KEY (`id`), ADD KEY `name` (`name`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_amenities`
--
ALTER TABLE `hotel_amenities`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_banners`
--
ALTER TABLE `hotel_banners`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_comments`
--
ALTER TABLE `hotel_comments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_follows`
--
ALTER TABLE `hotel_follows`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_likes_dislikes`
--
ALTER TABLE `hotel_likes_dislikes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_plans`
--
ALTER TABLE `hotel_plans`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_social_accounts`
--
ALTER TABLE `hotel_social_accounts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_suitables`
--
ALTER TABLE `hotel_suitables`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_amenities`
--
ALTER TABLE `offer_amenities`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_banners`
--
ALTER TABLE `offer_banners`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_comments`
--
ALTER TABLE `offer_comments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_suitables`
--
ALTER TABLE `offer_suitables`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
 ADD PRIMARY KEY (`id`), ADD KEY `title` (`title`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recent_search`
--
ALTER TABLE `recent_search`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_abuse`
--
ALTER TABLE `report_abuse`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_types`
--
ALTER TABLE `room_types`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_view_types`
--
ALTER TABLE `room_view_types`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `save_filter`
--
ALTER TABLE `save_filter`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_views`
--
ALTER TABLE `site_views`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suitable_for`
--
ALTER TABLE `suitable_for`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suitable_request`
--
ALTER TABLE `suitable_request`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_contact_info`
--
ALTER TABLE `user_contact_info`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_prefered_locations`
--
ALTER TABLE `user_prefered_locations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `activity_cities`
--
ALTER TABLE `activity_cities`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `amenity_request`
--
ALTER TABLE `amenity_request`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `calendar_events`
--
ALTER TABLE `calendar_events`
MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=79681;
--
-- AUTO_INCREMENT for table `city_images`
--
ALTER TABLE `city_images`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `ci_cookies`
--
ALTER TABLE `ci_cookies`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_types`
--
ALTER TABLE `class_types`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cron_datas`
--
ALTER TABLE `cron_datas`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `cron_mail_notification`
--
ALTER TABLE `cron_mail_notification`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `hotel_amenities`
--
ALTER TABLE `hotel_amenities`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=155;
--
-- AUTO_INCREMENT for table `hotel_banners`
--
ALTER TABLE `hotel_banners`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT for table `hotel_comments`
--
ALTER TABLE `hotel_comments`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `hotel_follows`
--
ALTER TABLE `hotel_follows`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hotel_likes_dislikes`
--
ALTER TABLE `hotel_likes_dislikes`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hotel_plans`
--
ALTER TABLE `hotel_plans`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `hotel_social_accounts`
--
ALTER TABLE `hotel_social_accounts`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `hotel_suitables`
--
ALTER TABLE `hotel_suitables`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=252;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=72;
--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `offer_amenities`
--
ALTER TABLE `offer_amenities`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=255;
--
-- AUTO_INCREMENT for table `offer_banners`
--
ALTER TABLE `offer_banners`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=196;
--
-- AUTO_INCREMENT for table `offer_comments`
--
ALTER TABLE `offer_comments`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `offer_suitables`
--
ALTER TABLE `offer_suitables`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=197;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `recent_search`
--
ALTER TABLE `recent_search`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=397;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `report_abuse`
--
ALTER TABLE `report_abuse`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `room_types`
--
ALTER TABLE `room_types`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `room_view_types`
--
ALTER TABLE `room_view_types`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `save_filter`
--
ALTER TABLE `save_filter`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `site_views`
--
ALTER TABLE `site_views`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2379;
--
-- AUTO_INCREMENT for table `suitable_for`
--
ALTER TABLE `suitable_for`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `suitable_request`
--
ALTER TABLE `suitable_request`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `user_contact_info`
--
ALTER TABLE `user_contact_info`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=318;
--
-- AUTO_INCREMENT for table `user_prefered_locations`
--
ALTER TABLE `user_prefered_locations`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
