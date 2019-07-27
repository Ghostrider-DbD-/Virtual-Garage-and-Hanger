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

-- Dumping structure for table exile.virtual_garage
CREATE TABLE IF NOT EXISTS `virtual_garage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(64) NOT NULL,
  `account_uid` varchar(32) DEFAULT NULL,
  `fuel` double unsigned NOT NULL DEFAULT '0',
  `damage` double unsigned NOT NULL DEFAULT '0',
  `hitpoints` text NOT NULL,
  `pin_code` varchar(6) NOT NULL DEFAULT '000000',
  `vehicle_texture` text NOT NULL,
  `money` int(11) unsigned DEFAULT '0',
  `cargo_items` text NOT NULL,
  `cargo_weapons` text NOT NULL,
  `cargo_magazines` text,
  `cargo_containers` text,
  `position` text,
  `vector` text,
  `stored_at` datetime DEFAULT NULL,
  `nickname` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4986 DEFAULT CHARSET=utf8;


