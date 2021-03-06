# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.3.1-MariaDB
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2011-10-16 19:39:53
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

use galaxy;

# Dumping structure for table galaxy.xp_list
CREATE TABLE IF NOT EXISTS `xp_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `player_id` bigint(20) DEFAULT NULL,
  `xp_type_id` int(11) DEFAULT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_960633ED99E6F5DF` (`player_id`),
  KEY `IDX_960633ED2291DC48` (`xp_type_id`),
  CONSTRAINT `FK_960633ED2291DC48` FOREIGN KEY (`xp_type_id`) REFERENCES `xp_type` (`id`),
  CONSTRAINT `FK_960633ED99E6F5DF` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table galaxy.xp_list: ~0 rows (approximately)
DELETE FROM `xp_list`;
/*!40000 ALTER TABLE `xp_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `xp_list` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
