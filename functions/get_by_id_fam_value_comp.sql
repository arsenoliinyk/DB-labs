USE Oliinyk_7_63;

DELIMITER //
DROP FUNCTION IF EXISTS get_by_id_fam_value_comp;
CREATE FUNCTION get_by_id_fam_value_comp(
	name_surname_id INT
)
RETURNS VARCHAR(45)
BEGIN
	return(
		SELECT CONCAT(family_tree.name, family_tree.surname) FROM family_tree
			WHERE id = (SELECT name_surname_id  FROM family_companion WHERE id = name_surname_id)
    );
END //
DELIMITER ;
    
SELECT name, surname, birth_date, death_date, birth_place, death_place, marriage_date, gender,
	get_by_id_fam_value_comp(id) from family_companion;
    