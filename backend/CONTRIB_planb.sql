-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: db.cip.gatech.edu
-- Generation Time: Oct 21, 2013 at 12:30 AM
-- Server version: 5.5.15-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `CONTRIB_planb`
--

-- --------------------------------------------------------

--
-- Table structure for table `locations_zoomin`
--

CREATE TABLE IF NOT EXISTS `locations_zoomin` (
  `LID_2` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Zoomed in location ID',
  `LID_1` int(10) unsigned NOT NULL COMMENT 'Zoomed out location ID',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `photocount` int(11) NOT NULL COMMENT 'Photo count',
  PRIMARY KEY (`LID_2`),
  KEY `LID_1` (`LID_1`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Info about locations when zoomed in' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `locations_zoomin`
--

INSERT INTO `locations_zoomin` (`LID_2`, `LID_1`, `latitude`, `longitude`, `photocount`) VALUES
(1, 1, 33.776454, -84.397647, 20),
(2, 1, 33.776752, -84.397679, 12);

-- --------------------------------------------------------

--
-- Table structure for table `locations_zoomout`
--

CREATE TABLE IF NOT EXISTS `locations_zoomout` (
  `LID_1` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index of zoomed out locations',
  `latitude` double NOT NULL COMMENT 'Latitude of location',
  `longitude` double NOT NULL COMMENT 'Longitude of location',
  `photocount` int(11) NOT NULL COMMENT 'Number of photos at this location',
  PRIMARY KEY (`LID_1`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='The high level location information' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `locations_zoomout`
--

INSERT INTO `locations_zoomout` (`LID_1`, `latitude`, `longitude`, `photocount`) VALUES
(1, 33.776454, -84.397647, 42),
(2, 33.7768445, -84.39708, 300),
(3, 33.7768565, -84.397027, 345),
(4, 33.7768222, -84.397671, 10);

-- --------------------------------------------------------

--
-- Table structure for table `location_photo_link`
--

CREATE TABLE IF NOT EXISTS `location_photo_link` (
  `LID_1` int(10) unsigned NOT NULL,
  `LID_2` int(10) unsigned NOT NULL,
  `PH_ID` int(10) unsigned NOT NULL,
  KEY `LID_1` (`LID_1`),
  KEY `LID_2` (`LID_2`),
  KEY `PH_ID` (`PH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Links photos to a zoomed location';

--
-- Dumping data for table `location_photo_link`
--

INSERT INTO `location_photo_link` (`LID_1`, `LID_2`, `PH_ID`) VALUES
(1, 1, 1),
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE IF NOT EXISTS `photos` (
  `PH_ID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Photo ID',
  `url` varchar(4096) COLLATE ascii_bin NOT NULL COMMENT 'URL of the image',
  `latitude` double NOT NULL COMMENT 'latitude',
  `longitude` double NOT NULL COMMENT 'longitude',
  `altitude` double DEFAULT NULL COMMENT 'altitude in feet',
  `direction` double unsigned DEFAULT NULL COMMENT 'Direction of the photo in degrees',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp taken',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0',
  `UID` int(11) unsigned DEFAULT NULL COMMENT 'User associated with the photo',
  PRIMARY KEY (`PH_ID`),
  KEY `UID` (`UID`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Photo info' AUTO_INCREMENT=27 ;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`PH_ID`, `url`, `latitude`, `longitude`, `altitude`, `direction`, `timestamp`, `popularity`, `UID`) VALUES
(1, 'http://www.prism.gatech.edu/~dlee399/gt-klaus.jpg', 33.776454, -84.397647, 0, 0, '2013-10-10 22:42:32', 1, 1),
(2, 'http://www.prism.gatech.edu/~dlee399/campanile.jpg', 33.776452, -84.397649, 90, 0, '2013-10-10 22:43:13', 2, 2),
(25, 'http://i.imgur.com/iVfXgJ.jpg', 0, 0, NULL, NULL, '2013-10-18 04:00:00', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `photo_tag_link`
--

CREATE TABLE IF NOT EXISTS `photo_tag_link` (
  `PH_ID` int(11) unsigned NOT NULL,
  `TAG_ID` int(11) unsigned NOT NULL,
  KEY `PH_ID` (`PH_ID`),
  KEY `TAG_ID` (`TAG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Links photos to tags';

--
-- Dumping data for table `photo_tag_link`
--

INSERT INTO `photo_tag_link` (`PH_ID`, `TAG_ID`) VALUES
(1, 1),
(1, 2),
(25, 33);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `TAG_ID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID of tag',
  `text` varchar(255) COLLATE ascii_bin NOT NULL COMMENT 'Tag Text',
  PRIMARY KEY (`TAG_ID`),
  UNIQUE KEY `text` (`text`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Tags for photos' AUTO_INCREMENT=37 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`TAG_ID`, `text`) VALUES
(2, 'Building'),
(1, 'Klaus'),
(7, 'Trees'),
(33, 'great');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `UID` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index of user. Used in other tables',
  `username` varchar(255) COLLATE ascii_bin NOT NULL COMMENT 'Username, as per GT login',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Storage of username to UID mappings' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UID`, `username`) VALUES
(1, 'dlee399'),
(2, 'gpburdell'),
(3, 'ronaldmcdonald'),
(4, 'oldmacdonald'),
(5, 'hadafarm');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE IF NOT EXISTS `wishlist` (
  `WID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `UID` int(11) unsigned NOT NULL COMMENT 'User that created this entry',
  `PH_ID` int(11) unsigned NOT NULL COMMENT 'Photo associated with that wishlist entry',
  PRIMARY KEY (`WID`),
  KEY `UID` (`UID`),
  KEY `PH_ID` (`PH_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=ascii COLLATE=ascii_bin COMMENT='Links users to wishlisted photos' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`WID`, `UID`, `PH_ID`) VALUES
(1, 1, 1),
(2, 1, 2),
(4, 3, 1),
(5, 3, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `locations_zoomin`
--
ALTER TABLE `locations_zoomin`
  ADD CONSTRAINT `locations_zoomin_ibfk_1` FOREIGN KEY (`LID_1`) REFERENCES `locations_zoomout` (`LID_1`);

--
-- Constraints for table `location_photo_link`
--
ALTER TABLE `location_photo_link`
  ADD CONSTRAINT `location_photo_link_ibfk_3` FOREIGN KEY (`PH_ID`) REFERENCES `photos` (`PH_ID`),
  ADD CONSTRAINT `location_photo_link_ibfk_1` FOREIGN KEY (`LID_1`) REFERENCES `locations_zoomout` (`LID_1`),
  ADD CONSTRAINT `location_photo_link_ibfk_2` FOREIGN KEY (`LID_2`) REFERENCES `locations_zoomin` (`LID_2`);

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`);

--
-- Constraints for table `photo_tag_link`
--
ALTER TABLE `photo_tag_link`
  ADD CONSTRAINT `photo_tag_link_ibfk_4` FOREIGN KEY (`TAG_ID`) REFERENCES `tags` (`TAG_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `photo_tag_link_ibfk_3` FOREIGN KEY (`PH_ID`) REFERENCES `photos` (`PH_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_4` FOREIGN KEY (`PH_ID`) REFERENCES `photos` (`PH_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_3` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
