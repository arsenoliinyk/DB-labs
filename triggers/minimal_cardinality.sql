USE Oliinyk_7_63;

DROP TRIGGER IF EXISTS minimal_cardinality;

DELIMITER //
CREATE TRIGGER minimal_cardinality
AFTER DELETE
ON family_companion FOR EACH ROW
BEGIN
IF(SELECT COUNT(*) FROM family_companion)<3
THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Delete error MIN cardinality';
END IF;
END //
DELIMITER ;