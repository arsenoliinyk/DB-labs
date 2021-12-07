USE Oliinyk_7_63;

SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS get_avg_max_cost;

DELIMITER //
CREATE FUNCTION get_avg_max_cost()
RETURNS DECIMAL
BEGIN
	return(SELECT AVG(max_cost) FROM family_value);
END;
DELIMITER ;

SELECT * FROM family_value WHERE max_cost < get_avg_max_cost();