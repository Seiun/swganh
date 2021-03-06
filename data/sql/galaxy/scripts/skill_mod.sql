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

# Dumping structure for table galaxy.skill_mod
CREATE TABLE IF NOT EXISTS `skill_mod` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table galaxy.skill_mod: ~0 rows (approximately)
DELETE FROM `skill_mod`;


/*!40000 ALTER TABLE `skill_mod` DISABLE KEYS */;

INSERT INTO `skill_mod` (`id`, `name`) VALUES
(1, 'language_basic_speak'),
(2, 'healing_dance_wound'),
(3, 'healing_music_wound'),
(4, 'healing_music_ability'),
(5, 'healing_dance_ability'),
(6, 'hair'),
(7, 'markings'),
(8, 'face'),
(9, 'foraging'),
(10, 'trapping'),
(11, 'camp'),
(12, 'creature_knowledge'),
(13, 'creature_harvesting'),
(14, 'slope_move'),
(15, 'burst_run'),
(16, 'mask_scent'),
(17, 'creature_hit_bonus'),
(18, 'healing_injury_treatment'),
(19, 'healing_ability'),
(20, 'medical_foraging'),
(21, 'healing_injury_speed'),
(22, 'medicine_assembly'),
(23, 'medicine_experimentation'),
(24, 'surveying'),
(25, 'general_assembly'),
(26, 'general_experimentation'),
(27, 'clothing_customization'),
(28, 'armor_customization'),
(29, 'manage_vendor'),
(30, 'hiring'),
(31, 'vendor_item_limit'),
(32, 'unarmed_accuracy'),
(33, 'unarmed_damage'),
(34, 'unarmed_speed'),
(35, 'polearm_accuracy'),
(36, 'polearm_speed'),
(37, 'onehandmelee_accuracy'),
(38, 'onehandmelee_speed'),
(39, 'twohandmelee_accuracy'),
(40, 'twohandmelee_speed'),
(41, 'private_onehandmelee_combat_difficulty'),
(42, 'private_twohandmelee_combat_difficulty'),
(43, 'private_unarmed_combat_difficulty'),
(44, 'private_polearm_combat_difficulty'),
(45, 'taunt'),
(46, 'private_center_of_being_efficacy'),
(47, 'polearm_center_of_being_efficacy'),
(48, 'onehandmelee_center_of_being_efficacy'),
(49, 'twohandmelee_center_of_being_efficacy'),
(50, 'center_of_being_duration_unarmed'),
(51, 'center_of_being_duration_onehandmelee'),
(52, 'center_of_being_duration_twohandmelee'),
(53, 'center_of_being_duration_polearm'),
(54, 'warcry'),
(55, 'intimidate'),
(56, 'berserk'),
(57, 'pistol_accuracy'),
(58, 'pistol_speed'),
(59, 'rifle_accuracy'),
(60, 'rifle_speed'),
(61, 'carbine_accuracy'),
(62, 'carbine_speed'),
(63, 'private_rifle_combat_difficulty'),
(64, 'private_carbine_combat_difficulty'),
(65, 'private_pistol_combat_difficulty'),
(66, 'rifle_concealment_chance'),
(67, 'ranged_defense'),
(68, 'melee_defense'),
(69, 'alert'),
(70, 'block'),
(71, 'posture_change_up_defense'),
(72, 'stun_defense'),
(73, 'blind_defense'),
(74, 'dizzy_defense'),
(75, 'dodge'),
(76, 'pistol_hit_while_moving'),
(77, 'pistol_aim'),
(78, 'posture_change_down_defense'),
(79, 'knockdown_defense'),
(80, 'counterattack'),
(81, 'unarmed_toughness'),
(82, 'combat_equillibrium'),
(83, 'private_med_dot'),
(84, 'unarmed_passive_defense'),
(85, 'private_med_wound'),
(86, 'empty1'),
(87, 'healing_dance_mind'),
(88, 'healing_music_shock'),
(89, 'healing_music_mind'),
(90, 'instrument_assembly'),
(91, 'private_place_cantina'),
(92, 'private_place_theater'),
(93, 'empty2'),
(94, 'empty3'),
(95, 'private_place_hospital'),
(96, 'healing_wound_speed'),
(97, 'healing_wound_treatment'),
(98, 'private_areatrack'),
(99, 'camouflage'),
(100, 'rescue'),
(101, 'stored_pets'),
(102, 'keep_creature'),
(103, 'tame_non_aggro'),
(104, 'tame_level'),
(105, 'private_creature_empathy'),
(106, 'private_creature_handling'),
(107, 'private_creature_training'),
(108, 'bio_engineer_assembly'),
(109, 'bio_engineer_experimentation'),
(110, 'dna_harvesting'),
(111, 'armor_assembly'),
(112, 'armor_experimentation'),
(113, 'weapon_assembly'),
(114, 'weapon_experimentation'),
(115, 'food_assembly'),
(116, 'food_experimentation'),
(117, 'clothing_assembly'),
(118, 'clothing_experimentation'),
(119, 'structure_assembly'),
(120, 'structure_experimentation'),
(121, 'droid_assembly'),
(122, 'droid_customization'),
(123, 'shop_sign'),
(124, 'language_all_comprehend'),
(125, 'feign_death'),
(126, 'spice_assembly'),
(127, 'spice_experimentation'),
(128, 'bounty_mission_level'),
(129, 'heavy_rifle_lightning_accuracy'),
(130, 'heavy_rifle_lightning_speed'),
(131, 'private_heavyweapon_combat_difficulty'),
(132, 'droid_tracks'),
(133, 'droid_track_chance'),
(134, 'droid_find_chance'),
(135, 'droid_find_speed'),
(136, 'droid_track_speed'),
(137, 'heavy_flame_thrower_accuracy'),
(138, 'heavy_rifle_acid_accuracy'),
(139, 'thrown_accuracy'),
(140, 'heavy_rocket_launcher_accuracy'),
(141, 'healing_range_speed'),
(142, 'combat_medicine_experimentation'),
(143, 'combat_healing_ability'),
(144, 'combat_medic_effectiveness'),
(145, 'healing_range'),
(146, 'combat_medicine_assembly'),
(147, 'empty8'),
(148, 'group_melee_defense'),
(149, 'ground_ranged_defense'),
(150, 'group_burst_run'),
(151, 'group_slope_move'),
(152, 'steadyaim'),
(153, 'volley'),
(154, 'private_place_cityhall'),
(155, 'private_place_bank'),
(156, 'private_place_shuttleport'),
(157, 'private_place_cloning'),
(158, 'private_place_garage'),
(159, 'private_place_small_garden'),
(160, 'private_place_medium_garden'),
(161, 'private_place_large_garden'),
(162, 'private_place_exotic_garden'),
(163, 'empty4'),
(164, 'empty5'),
(165, 'language_rodian_speak'),
(166, 'language_rodian_comprehend'),
(167, 'language_trandoshan_speak'),
(168, 'language_trandoshan_comprehend'),
(169, 'language_moncalamari_speak'),
(170, 'language_moncalamari_comprehend'),
(171, 'language_wookiee_speak'),
(172, 'language_wookiee_comprehend'),
(173, 'language_bothan_speak'),
(174, 'language_bothan_comprehend'),
(175, 'language_twilek_speak'),
(176, 'language_twilek_comprehend'),
(177, 'language_zabrak_speak'),
(178, 'language_zabrak_comprehend'),
(179, 'language_lekku_speak'),
(180, 'language_lekku_comprehend'),
(181, 'language_ithorian_speak'),
(182, 'language_ithorian_comprehend'),
(183, 'language_sullustan_speak'),
(184, 'language_sullustan_comprehend'),
(185, 'take_cover'),
(186, 'leadership'),
(187, 'empty6'),
(188, 'empty7'),
(189, 'private_innate_regeneration'),
(190, 'engine_assembly'),
(191, 'booster_assembly'),
(192, 'weapon_systems'),
(193, 'chassis_assembly'),
(194, 'power_systems'),
(195, 'shields_assembly'),
(196, 'advanced_assembly'),
(197, 'chassis_experimentation'),
(198, 'weapons_systems_experimentation'),
(199, 'engine_experimentation'),
(200, 'booster_experimentation'),
(201, 'power_systems_experimentation'),
(202, 'shields_experimentation'),
(203, 'advanced_ship_experimentation'),
(204, 'defense_reverse'),
(205, 'propulsion_reverse'),
(206, 'engineering_reverse'),
(207, 'systems_reverse'),
(208, 'pilot_special_tactics'),
(209, 'missile_launching'),
(210, 'unarmed_center_of_being_efficacy'),
(211, 'polearm_toughness'),
(212, 'onehandmelee_toughness'),
(213, 'twohandmelee_toughness'),
(214, 'aim'),
(215, 'rifle_hit_while_moving'),
(216, 'rifle_aim'),
(217, 'pistol_accuracy_while_standing'),
(218, 'carbine_hit_while_moving'),
(219, 'carbine_aim'),
(220, 'intimidate_defense'),
(221, 'meditate'),
(222, 'healing_dance_shock'),
(223, 'private_creature_management'),
(224, 'tame_aggro'),
(225, 'droid_experimentation'),
(226, 'private_place_merchant_tent'),
(227, 'thrown_speed'),
(228, 'heavy_rocket_launcher_speed'),
(229, 'heavy_particle_beam_accuracy'),
(230, 'heavy_particle_beam_speed'),
(231, 'heavy_acid_beam_speed'),
(232, 'heavy_acid_beam_accuracy'),
(233, 'heavy_lightning_beam_speed'),
(234, 'heavy_lightning_beam_accuracy'),
(235, 'heavy_flame_thrower_speed'),
(236, 'heavy_rifle_acid_speed'),
(237, 'body'),
(238, 'group_ranged_defense'),
(239, 'anti_shock'),
(240, 'private_innate_equilibrium'),
(241, 'private_innate_vitalize'),
(242, 'tame_bonus'),
(243, 'jedi_force_power_max'),
(244, 'jedi_force_power_regen'),
(245, 'jedi_saber_assembly'),
(246, 'onehandlightsaber_accuracy'),
(247, 'onehandlightsaber_speed'),
(248, 'saber_block'),
(249, 'onehandlightsaber_toughness'),
(250, 'private_jedi_difficulty'),
(251, 'forcethrow_accuracy'),
(252, 'forceknockdown_accuracy'),
(253, 'mindblast_accuracy'),
(254, 'twohandlightsaber_accuracy'),
(255, 'twohandlightsaber_speed'),
(256, 'twohandlightsaber_toughness'),
(257, 'private_force_lightning_single_power'),
(258, 'forcelightning_accuracy'),
(259, 'polearmlightsaber_speed'),
(260, 'polearmlightsaber_accuracy'),
(261, 'forceweaken_accuracy'),
(262, 'polearmlightsaber_toughness'),
(263, 'private_force_lightning_cone_power'),
(264, 'language_basic_comprehend'),
(265, 'ranged_accuracy'),
(266, 'ranged_speed'),
(267, 'melee_accuracy'),
(268, 'melee_speed'),
(269, 'force_vehicle_control'),
(270, 'force_vehicle_speed'),
(271, 'force_experimentation'),
(272, 'force_assembly'),
(273, 'force_repair_bonus'),
(274, 'force_failure_reduction'),
(275, 'force_persuade'),
(276, 'force_luck'),
(277, 'forceintimidate_accuracy'),
(278, 'jedi_state_defense'),
(279, 'jedi_toughness'),
(280, 'force_defense'),
(281, 'force_control_light'),
(282, 'force_power_light'),
(283, 'force_manipulation_light'),
(284, 'force_power_dark'),
(285, 'force_control_dark'),
(286, 'force_manipulation_dark'),
(287, 'weapon_systems_experimentation'),
(288, 'force_choke'),
(289, 'lightsaber_toughness'),
(290, 'jedi_saber_experimentation'),
(291, 'private_onehandlightsaber_combat_difficulty'),
(292, 'private_twohandlightsaber_combat_difficulty'),
(293, 'private_polearmlightsaber_combat_difficulty'),
(294, 'private_carbine_difficulty'),
(295, 'private_pistol_difficulty'),
(296, 'private_innate_roar');

/*!40000 ALTER TABLE `skill_mod` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
