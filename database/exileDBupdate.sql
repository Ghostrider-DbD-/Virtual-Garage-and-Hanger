-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.12 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table exile.vehicle
CREATE TABLE IF NOT EXISTS `vehicle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(64) NOT NULL,
  `spawned_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `account_uid` varchar(32) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `fuel` double unsigned NOT NULL DEFAULT '0',
  `damage` double unsigned NOT NULL DEFAULT '0',
  `hitpoints` text NOT NULL,
  `position_x` double NOT NULL DEFAULT '0',
  `position_y` double NOT NULL DEFAULT '0',
  `position_z` double NOT NULL DEFAULT '0',
  `direction_x` double NOT NULL DEFAULT '0',
  `direction_y` double NOT NULL DEFAULT '0',
  `direction_z` double NOT NULL DEFAULT '0',
  `up_x` double NOT NULL DEFAULT '0',
  `up_y` double NOT NULL DEFAULT '0',
  `up_z` double NOT NULL DEFAULT '1',
  `cargo_items` text NOT NULL,
  `cargo_magazines` text NOT NULL,
  `cargo_weapons` text NOT NULL,
  `cargo_container` text NOT NULL,
  `last_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  `deleted_at` datetime DEFAULT NULL,
  `money` int(11) unsigned NOT NULL DEFAULT '0',
  `vehicle_texture` text NOT NULL,
  `territory_id` int(11) unsigned DEFAULT NULL,
  `nickname` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_uid` (`account_uid`),
  KEY `vehicle_ibfk_2_idx` (`territory_id`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`account_uid`) REFERENCES `account` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`territory_id`) REFERENCES `territory` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7596 DEFAULT CHARSET=utf8;


