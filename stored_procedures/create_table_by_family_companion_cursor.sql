USE Oliinyk_7_63;

DELIMITER //
DROP PROCEDURE IF EXISTS create_table_by_family_companion_cursor;
CREATE PROCEDURE create_table_by_family_companion_cursor()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE Name, Surname VARCHAR(45);
    DECLARE FamilyCompanionCursor CURSOR FOR
    SELECT name, surname FROM family_companion;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET done = TRUE;
    SET @request= 'CREATE TABLE IF NOT EXISTS family_companion_name (id INT AUTO_INCREMENT, surname VARCHAR(45),name VARCHAR(45),PRIMARY KEY (id));';
    PREPARE myQuery FROM @request;
    EXECUTE myQuery;
    OPEN FamilyCompanionCursor;
    FamilyCompanionCursorLoop: LOOP
        FETCH FamilyCompanionCursor INTO Surname,Name;
        IF done = TRUE THEN LEAVE FamilyCompanionCursorLoop;
        END IF;
        SET @request = CONCAT('INSERT INTO family_companion_name (surname,name) VALUES ("',Surname,'","',Name,'");');
		PREPARE myQuery FROM @request;
		EXECUTE myQuery;
    END LOOP;
    DEALLOCATE PREPARE myQuery;
CLOSE FamilyCompanionCursor;
END//
DELIMITER ;