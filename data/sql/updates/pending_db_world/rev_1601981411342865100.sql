INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1601981411342865100');

/*
 * Update by Silker | <www.azerothcore.org> | Copyright (C)
*/

-- fix stalkers position
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=33779;

-- set phase 2 for ground stalker
DELETE FROM `creature` WHERE (`guid` IN (137507, 137508));
UPDATE `creature` SET `phaseMask`=2 WHERE  `guid`=137509;

-- create SAI for Kirin Tor Battle-Mage
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 33662;
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 33662);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(33662, 0, 0, 0, 1, 0, 100, 1, 1000, 1000, 1000, 1000, 0, 11, 48310, 2, 0, 0, 0, 0, 11, 33779, 60, 0, 0, 0, 0, 0, 0, 'Kirin Tor Battle-Mage - Out of combat - Cast /48310/');