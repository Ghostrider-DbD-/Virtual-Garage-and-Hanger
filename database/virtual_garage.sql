-
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
  `nickname` varchar(64) DEFAULT '',
  `wep_loadout` text,
  `stored_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5059 DEFAULT CHARSET=utf8;


