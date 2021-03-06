-- DB update 2021_04_11_18 -> 2021_04_11_19
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_04_11_18';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_04_11_18 2021_04_11_19 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1617913282545327642'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1617913282545327642');

-- Silverpine Forest
DELETE FROM  `gameobject` WHERE `guid`=35525;

-- Darkshore
DELETE FROM  `gameobject` WHERE `guid` in (4729, 5079, 5055, 5078, 5079, 5392, 5351);

-- Durotar
DELETE FROM  `gameobject` WHERE `guid`=12383;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
