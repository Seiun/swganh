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

# Dumping structure for procedure galaxy.sp_GetPlayerAbilities
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetPlayerAbilities`(IN `player_id` BIGINT)
BEGIN

    DECLARE parent_id BIGINT(20);

    SELECT object.parent_id from object where object.id = player_id INTO parent_id;

    SELECT skill_command.name as ability
    FROM skill_command
    LEFT JOIN skills_skill_commands ON (skills_skill_commands.skill_command_id = skill_command.id)
    LEFT JOIN creatures_skills ON (creatures_skills.skill_id = skills_skill_commands.skill_id)
    WHERE creatures_skills.creature_id = parent_id;
    
END//
DELIMITER ;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
