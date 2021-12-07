USE Oliinyk_7_63;

DELIMITER //
DROP PROCEDURE IF EXISTS random_insert_family_value //
CREATE PROCEDURE random_insert_family_value()
BEGIN
	DECLARE str varchar(45);
	DECLARE counter INT;
    DECLARE exist_seed INT;
    DECLARE seed INT;
	SET str = '', counter = 1, seed = RAND();
    label1:WHILE counter < 11 DO
		SET seed = ((seed+RAND()) + 1) + counter;
		IF NOT EXISTS (SELECT family_tree_id FROM family_value WHERE seed = family_tree_id)
		THEN
			SET counter = counter + 1;
            SET str = CONCAT('Noname',seed);
			INSERT INTO family_value(name, family_tree_id) VALUES (str,seed);
		END IF;
	END WHILE;
END //
DELIMITER ;