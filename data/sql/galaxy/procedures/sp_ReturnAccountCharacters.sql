# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.3.1-MariaDB
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2011-10-17 22:07:04
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

use galaxy;

# Dumping structure for procedure galaxy.sp_ReturnAccountCharacters
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ReturnAccountCharacters`(IN `account_id` INT)
BEGIN
	 SELECT A.id, B.custom_name, E.iff_template
    FROM creature A
    INNER JOIN object B ON (A.id = B.id)
    INNER JOIN player_accounts_creatures C ON (A.id = C.creature_id)
    INNER JOIN player_account D ON (C.player_id = D.id)
    LEFT JOIN iff_templates E ON (E.id = B.iff_template_id)
    WHERE D.reference_id = account_id AND B.deleted_at IS NULL;
END//
DELIMITER ;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
